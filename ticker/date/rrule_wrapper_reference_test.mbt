// Generated original Matplotlib rrulewrapper; no installed Matplotlib import.

///|
fn wrapper_reference_fields(value : @date.RRuleDateTime) -> Array[Int32] {
  let date = value.date()
  [
    if value.is_naive() {
      0
    } else {
      1
    },
    date.year(),
    date.month(),
    date.day(),
    date.hour(),
    date.minute(),
    date.second(),
    date.microsecond(),
    date.offset_seconds(),
  ]
}

///|
test "rrulewrapper original 0 base None start 2024-01-01T00:00:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 4, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 1 base None start 2024-03-09T02:30:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 2 base None start 2024-11-03T01:30:00" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-11-03T01:30:00"),
      zone_ny,
      fold=true,
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 1, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 1, 30, 0, 0, -14400],
      [1, 2024, 11, 4, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 5, 1, 30, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 1, 30, 0, 0, -14400],
      [1, 2024, 11, 4, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 5, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 6, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 7, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 8, 1, 30, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 11, 3, 1, 30, 0, 0, 0],
      [0, 2024, 11, 4, 1, 30, 0, 0, 0],
      [0, 2024, 11, 5, 1, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 3 base UTC start 2024-01-01T00:00:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    timezone=zone_utc,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, 0],
      [1, 2024, 1, 2, 0, 0, 0, 0, 0],
      [1, 2024, 1, 3, 0, 0, 0, 0, 0],
      [1, 2024, 1, 4, 0, 0, 0, 0, 0],
      [1, 2024, 1, 5, 0, 0, 0, 0, 0],
      [1, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 4 base UTC start 2024-03-09T02:30:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    timezone=zone_utc,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 7, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 7, 30, 0, 0, 0],
      [1, 2024, 3, 11, 7, 30, 0, 0, 0],
      [1, 2024, 3, 12, 7, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 7, 30, 0, 0, 0],
      [1, 2024, 3, 10, 7, 30, 0, 0, 0],
      [1, 2024, 3, 11, 7, 30, 0, 0, 0],
      [1, 2024, 3, 12, 7, 30, 0, 0, 0],
      [1, 2024, 3, 13, 7, 30, 0, 0, 0],
      [1, 2024, 3, 14, 7, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 7, 30, 0, 0, 0],
      [0, 2024, 3, 10, 7, 30, 0, 0, 0],
      [0, 2024, 3, 11, 7, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 5 base UTC start 2024-11-03T01:30:00" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-11-03T01:30:00"),
      zone_ny,
      fold=true,
    ),
    count=6,
    timezone=zone_utc,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 6, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 6, 30, 0, 0, 0],
      [1, 2024, 11, 4, 6, 30, 0, 0, 0],
      [1, 2024, 11, 5, 6, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 6, 30, 0, 0, 0],
      [1, 2024, 11, 4, 6, 30, 0, 0, 0],
      [1, 2024, 11, 5, 6, 30, 0, 0, 0],
      [1, 2024, 11, 6, 6, 30, 0, 0, 0],
      [1, 2024, 11, 7, 6, 30, 0, 0, 0],
      [1, 2024, 11, 8, 6, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 11, 3, 6, 30, 0, 0, 0],
      [0, 2024, 11, 4, 6, 30, 0, 0, 0],
      [0, 2024, 11, 5, 6, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 6 base NY start 2024-01-01T00:00:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 2, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 3, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 4, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 5, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 6, 0, 0, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 7 base NY start 2024-03-09T02:30:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 8 base NY start 2024-11-03T01:30:00" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-11-03T01:30:00"),
      zone_ny,
      fold=true,
    ),
    count=6,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 1, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 1, 30, 0, 0, -14400],
      [1, 2024, 11, 4, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 5, 1, 30, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 1, 30, 0, 0, -14400],
      [1, 2024, 11, 4, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 5, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 6, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 7, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 8, 1, 30, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 11, 3, 1, 30, 0, 0, 0],
      [0, 2024, 11, 4, 1, 30, 0, 0, 0],
      [0, 2024, 11, 5, 1, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 9 base LH start 2024-01-01T00:00:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    timezone=zone_lh,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, 39600],
      [1, 2024, 1, 2, 0, 0, 0, 0, 39600],
      [1, 2024, 1, 3, 0, 0, 0, 0, 39600],
      [1, 2024, 1, 4, 0, 0, 0, 0, 39600],
      [1, 2024, 1, 5, 0, 0, 0, 0, 39600],
      [1, 2024, 1, 6, 0, 0, 0, 0, 39600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 10 base LH start 2024-03-09T02:30:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    timezone=zone_lh,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 18, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 18, 30, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 18, 30, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 18, 30, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 18, 30, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 18, 30, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 18, 30, 0, 0, 39600],
      [1, 2024, 3, 11, 18, 30, 0, 0, 39600],
      [1, 2024, 3, 12, 18, 30, 0, 0, 39600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 18, 30, 0, 0, 39600],
      [1, 2024, 3, 10, 18, 30, 0, 0, 39600],
      [1, 2024, 3, 11, 18, 30, 0, 0, 39600],
      [1, 2024, 3, 12, 18, 30, 0, 0, 39600],
      [1, 2024, 3, 13, 18, 30, 0, 0, 39600],
      [1, 2024, 3, 14, 18, 30, 0, 0, 39600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 18, 30, 0, 0, 0],
      [0, 2024, 3, 10, 18, 30, 0, 0, 0],
      [0, 2024, 3, 11, 18, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 11 base LH start 2024-11-03T01:30:00" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-11-03T01:30:00"),
      zone_ny,
      fold=true,
    ),
    count=6,
    timezone=zone_lh,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 17, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 17, 30, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 17, 30, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 17, 30, 0, 0, 39600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 17, 30, 0, 0, 39600],
      [1, 2024, 11, 4, 17, 30, 0, 0, 39600],
      [1, 2024, 11, 5, 17, 30, 0, 0, 39600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 17, 30, 0, 0, 39600],
      [1, 2024, 11, 4, 17, 30, 0, 0, 39600],
      [1, 2024, 11, 5, 17, 30, 0, 0, 39600],
      [1, 2024, 11, 6, 17, 30, 0, 0, 39600],
      [1, 2024, 11, 7, 17, 30, 0, 0, 39600],
      [1, 2024, 11, 8, 17, 30, 0, 0, 39600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 11, 3, 17, 30, 0, 0, 0],
      [0, 2024, 11, 4, 17, 30, 0, 0, 0],
      [0, 2024, 11, 5, 17, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 12 base NEG start 2024-01-01T00:00:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    timezone=zone_neg,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, 0],
      [1, 2024, 1, 2, 0, 0, 0, 0, 0],
      [1, 2024, 1, 3, 0, 0, 0, 0, 0],
      [1, 2024, 1, 4, 0, 0, 0, 0, 0],
      [1, 2024, 1, 5, 0, 0, 0, 0, 0],
      [1, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 13 base NEG start 2024-03-09T02:30:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    timezone=zone_neg,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 7, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 7, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 7, 30, 0, 0, 0],
      [1, 2024, 3, 11, 7, 30, 0, 0, 0],
      [1, 2024, 3, 12, 7, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 7, 30, 0, 0, 0],
      [1, 2024, 3, 10, 7, 30, 0, 0, 0],
      [1, 2024, 3, 11, 7, 30, 0, 0, 0],
      [1, 2024, 3, 12, 7, 30, 0, 0, 0],
      [1, 2024, 3, 13, 7, 30, 0, 0, 0],
      [1, 2024, 3, 14, 7, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 7, 30, 0, 0, 0],
      [0, 2024, 3, 10, 7, 30, 0, 0, 0],
      [0, 2024, 3, 11, 7, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 14 base NEG start 2024-11-03T01:30:00" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-11-03T01:30:00"),
      zone_ny,
      fold=true,
    ),
    count=6,
    timezone=zone_neg,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 6, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 6, 30, 0, 0, 0],
      [1, 2024, 11, 4, 6, 30, 0, 0, 0],
      [1, 2024, 11, 5, 6, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 6, 30, 0, 0, 0],
      [1, 2024, 11, 4, 6, 30, 0, 0, 0],
      [1, 2024, 11, 5, 6, 30, 0, 0, 0],
      [1, 2024, 11, 6, 6, 30, 0, 0, 0],
      [1, 2024, 11, 7, 6, 30, 0, 0, 0],
      [1, 2024, 11, 8, 6, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 11, 3, 6, 30, 0, 0, 0],
      [0, 2024, 11, 4, 6, 30, 0, 0, 0],
      [0, 2024, 11, 5, 6, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 15 base FIX start 2024-01-01T00:00:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    timezone=zone_fix,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, 561],
      [1, 2024, 1, 2, 0, 0, 0, 0, 561],
      [1, 2024, 1, 3, 0, 0, 0, 0, 561],
      [1, 2024, 1, 4, 0, 0, 0, 0, 561],
      [1, 2024, 1, 5, 0, 0, 0, 0, 561],
      [1, 2024, 1, 6, 0, 0, 0, 0, 561],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 16 base FIX start 2024-03-09T02:30:00.123456" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    timezone=zone_fix,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 7, 39, 21, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 39, 21, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 39, 21, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 7, 39, 21, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 7, 39, 21, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 7, 39, 21, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 7, 39, 21, 0, 561],
      [1, 2024, 3, 11, 7, 39, 21, 0, 561],
      [1, 2024, 3, 12, 7, 39, 21, 0, 561],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 7, 39, 21, 0, 561],
      [1, 2024, 3, 10, 7, 39, 21, 0, 561],
      [1, 2024, 3, 11, 7, 39, 21, 0, 561],
      [1, 2024, 3, 12, 7, 39, 21, 0, 561],
      [1, 2024, 3, 13, 7, 39, 21, 0, 561],
      [1, 2024, 3, 14, 7, 39, 21, 0, 561],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 7, 39, 21, 0, 0],
      [0, 2024, 3, 10, 7, 39, 21, 0, 0],
      [0, 2024, 3, 11, 7, 39, 21, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 17 base FIX start 2024-11-03T01:30:00" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-11-03T01:30:00"),
      zone_ny,
      fold=true,
    ),
    count=6,
    timezone=zone_fix,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 6, 39, 21, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 39, 21, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 39, 21, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 3, 6, 39, 21, 0, 561])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 6, 39, 21, 0, 561],
      [1, 2024, 11, 4, 6, 39, 21, 0, 561],
      [1, 2024, 11, 5, 6, 39, 21, 0, 561],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 3, 6, 39, 21, 0, 561],
      [1, 2024, 11, 4, 6, 39, 21, 0, 561],
      [1, 2024, 11, 5, 6, 39, 21, 0, 561],
      [1, 2024, 11, 6, 6, 39, 21, 0, 561],
      [1, 2024, 11, 7, 6, 39, 21, 0, 561],
      [1, 2024, 11, 8, 6, 39, 21, 0, 561],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 11, 3, 6, 39, 21, 0, 0],
      [0, 2024, 11, 4, 6, 39, 21, 0, 0],
      [0, 2024, 11, 5, 6, 39, 21, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 18 empty/limited None/0" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=0,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(0))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 19 empty/limited None/-1" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=-1,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(-1))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 20 empty/limited None/1" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=1,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(1))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([[0, 2024, 1, 1, 0, 0, 0, 0, 0]]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [[0, 2024, 1, 1, 0, 0, 0, 0, 0]],
  )
  assert_eq(wrapper.occurrence_count(), 1L)
}

///|
test "rrulewrapper original 21 empty/limited NY/0" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=0,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(0))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 22 empty/limited NY/-1" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=-1,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(-1))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 23 empty/limited NY/1" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=1,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(1))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 1, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 1, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([[1, 2024, 1, 1, 0, 0, 0, 0, -18000]]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [[0, 2024, 1, 1, 0, 0, 0, 0, 0]],
  )
  assert_eq(wrapper.occurrence_count(), 1L)
}

///|
test "rrulewrapper original 24 frequency 0" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2025, 1, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2025, 1, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2025, 1, 1, 0, 0, 0, 0, 0],
      [0, 2026, 1, 1, 0, 0, 0, 0, 0],
      [0, 2027, 1, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2025, 1, 1, 0, 0, 0, 0, 0],
      [0, 2026, 1, 1, 0, 0, 0, 0, 0],
      [0, 2027, 1, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2025, 1, 1, 0, 0, 0, 0, 0],
      [0, 2026, 1, 1, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 25 frequency 1" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 1, 0, 0, 0, 0, 0],
      [0, 2024, 6, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 1, 0, 0, 0, 0, 0],
      [0, 2024, 6, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 26 frequency 2" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 2, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 27 frequency 3" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 4, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 28 frequency 4" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 1, 5, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 1, 1, 0, 0, 0, 0],
      [0, 2024, 1, 1, 2, 0, 0, 0, 0],
      [0, 2024, 1, 1, 3, 0, 0, 0, 0],
      [0, 2024, 1, 1, 4, 0, 0, 0, 0],
      [0, 2024, 1, 1, 5, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 1, 1, 0, 0, 0, 0],
      [0, 2024, 1, 1, 2, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 29 frequency 5" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Minutely,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Minutely)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 1, 0, 5, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 1, 0, 1, 0, 0, 0],
      [0, 2024, 1, 1, 0, 2, 0, 0, 0],
      [0, 2024, 1, 1, 0, 3, 0, 0, 0],
      [0, 2024, 1, 1, 0, 4, 0, 0, 0],
      [0, 2024, 1, 1, 0, 5, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 1, 0, 1, 0, 0, 0],
      [0, 2024, 1, 1, 0, 2, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 30 frequency 6" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Secondly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 1, 0, 0, 5, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 1, 0, 0, 1, 0, 0],
      [0, 2024, 1, 1, 0, 0, 2, 0, 0],
      [0, 2024, 1, 1, 0, 0, 3, 0, 0],
      [0, 2024, 1, 1, 0, 0, 4, 0, 0],
      [0, 2024, 1, 1, 0, 0, 5, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 1, 0, 0, 1, 0, 0],
      [0, 2024, 1, 1, 0, 0, 2, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 31 inferred timezone drop False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    cache=false,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 9, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 13, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 13, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
      [0, 2024, 3, 17, 2, 30, 0, 0, 0],
      [0, 2024, 3, 19, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 13, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        dtstart=@date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-02T01:30:00"),
          zone_ny,
          fold=false,
        ),
      )
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 1, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 2, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 2, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 2, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 2, 1, 30, 0, 0, -14400],
      [1, 2024, 11, 4, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 6, 1, 30, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 2, 1, 30, 0, 0, -14400],
      [1, 2024, 11, 4, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 6, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 8, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 10, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 12, 1, 30, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 11, 2, 1, 30, 0, 0, 0],
      [0, 2024, 11, 4, 1, 30, 0, 0, 0],
      [0, 2024, 11, 6, 1, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(count=0)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(0))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 1, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 32 failed selector stage False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    cache=false,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=3, bysetpos=[0])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
      [0, 2024, 3, 13, 2, 30, 0, 0, 0],
      [0, 2024, 3, 14, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(null=["bysetpos"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 3)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 12, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 12, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 9, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
      [0, 2024, 3, 18, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
      [0, 2024, 3, 18, 2, 30, 0, 0, 0],
      [0, 2024, 3, 21, 2, 30, 0, 0, 0],
      [0, 2024, 3, 24, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 33 failed normalize stage False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    cache=false,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 4, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        until=@date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-05T00:00:00+00:00"),
        ),
      )
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 4, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=2)
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 4, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        dtstart=@date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-01T00:00:00+00:00"),
        ),
      )
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, 0],
      [1, 2024, 1, 3, 0, 0, 0, 0, 0],
      [1, 2024, 1, 5, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 3L)
}

///|
test "rrulewrapper original 34 null start retains state False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    cache=false,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(null=["dtstart"])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=2)
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        dtstart=@date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.123456"),
        ),
      )
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 11, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 35 null until retains state False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    cache=false,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 2, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 3, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 4, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 5, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 6, 0, 0, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(null=["until"])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 2, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 3, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 4, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 5, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 6, 0, 0, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        until=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-08T00:00:00")),
      )
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 8, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 2, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 3, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 4, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 5, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 6, 0, 0, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 36 inferred timezone drop True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    cache=true,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 9, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 13, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 13, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
      [0, 2024, 3, 17, 2, 30, 0, 0, 0],
      [0, 2024, 3, 19, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 13, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        dtstart=@date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-02T01:30:00"),
          zone_ny,
          fold=false,
        ),
      )
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 1, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 2, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 2, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 11, 2, 1, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 2, 1, 30, 0, 0, -14400],
      [1, 2024, 11, 4, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 6, 1, 30, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 11, 2, 1, 30, 0, 0, -14400],
      [1, 2024, 11, 4, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 6, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 8, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 10, 1, 30, 0, 0, -18000],
      [1, 2024, 11, 12, 1, 30, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 11, 2, 1, 30, 0, 0, 0],
      [0, 2024, 11, 4, 1, 30, 0, 0, 0],
      [0, 2024, 11, 6, 1, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(count=0)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(0))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 1, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 37 failed selector stage True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    cache=true,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=3, bysetpos=[0])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
      [0, 2024, 3, 13, 2, 30, 0, 0, 0],
      [0, 2024, 3, 14, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(null=["bysetpos"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 3)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 12, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 12, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 9, 2, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
      [0, 2024, 3, 18, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
      [0, 2024, 3, 18, 2, 30, 0, 0, 0],
      [0, 2024, 3, 21, 2, 30, 0, 0, 0],
      [0, 2024, 3, 24, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 12, 2, 30, 0, 0, 0],
      [0, 2024, 3, 15, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 38 failed normalize stage True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    cache=true,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 4, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        until=@date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-05T00:00:00+00:00"),
        ),
      )
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 4, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=2)
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 4, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 6, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        dtstart=@date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-01T00:00:00+00:00"),
        ),
      )
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, 0],
      [1, 2024, 1, 3, 0, 0, 0, 0, 0],
      [1, 2024, 1, 5, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 3L)
}

///|
test "rrulewrapper original 39 null start retains state True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    count=6,
    cache=true,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(null=["dtstart"])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=2)
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        dtstart=@date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.123456"),
        ),
      )
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 11, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 40 null until retains state True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    cache=true,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 2, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 3, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 4, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 5, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 6, 0, 0, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(null=["until"])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 2, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 3, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 4, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 5, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 6, 0, 0, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(
        until=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-08T00:00:00")),
      )
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 8, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 1, 6, 0, 0, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 1, 1, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 2, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 3, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 4, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 5, 0, 0, 0, 0, -18000],
      [1, 2024, 1, 6, 0, 0, 0, 0, -18000],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 41 omitted dtstart local now None" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(@date.Daily, count=6, context~)
  assert_eq(calls.val, 1)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2026, 6, 15, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2026, 6, 15, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2026, 6, 15, 12, 0, 0, 0, 0],
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 17, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2026, 6, 15, 12, 0, 0, 0, 0],
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 17, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 19, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2026, 6, 15, 12, 0, 0, 0, 0],
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 17, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 2)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 16, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2026, 6, 16, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2026, 6, 16, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
      [0, 2026, 6, 22, 12, 0, 0, 0, 0],
      [0, 2026, 6, 24, 12, 0, 0, 0, 0],
      [0, 2026, 6, 26, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(bysetpos=[0])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 3)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 16, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2026, 6, 16, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2026, 6, 16, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
      [0, 2026, 6, 22, 12, 0, 0, 0, 0],
      [0, 2026, 6, 24, 12, 0, 0, 0, 0],
      [0, 2026, 6, 26, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(bysetpos=[1])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 4)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 17, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2026, 6, 17, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2026, 6, 17, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2026, 6, 17, 12, 0, 0, 0, 0],
      [0, 2026, 6, 19, 12, 0, 0, 0, 0],
      [0, 2026, 6, 21, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2026, 6, 17, 12, 0, 0, 0, 0],
      [0, 2026, 6, 19, 12, 0, 0, 0, 0],
      [0, 2026, 6, 21, 12, 0, 0, 0, 0],
      [0, 2026, 6, 23, 12, 0, 0, 0, 0],
      [0, 2026, 6, 25, 12, 0, 0, 0, 0],
      [0, 2026, 6, 27, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2026, 6, 17, 12, 0, 0, 0, 0],
      [0, 2026, 6, 19, 12, 0, 0, 0, 0],
      [0, 2026, 6, 21, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 42 omitted dtstart local now NY" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    count=6,
    timezone=zone_ny,
    context~,
  )
  assert_eq(calls.val, 1)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 15, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 15, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 15, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 15, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2026, 6, 15, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 16, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 17, 12, 0, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2026, 6, 15, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 16, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 17, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 18, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 19, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 20, 12, 0, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2026, 6, 15, 12, 0, 0, 0, 0],
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 17, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(interval=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 2)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 16, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 16, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 16, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 16, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2026, 6, 16, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 18, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 20, 12, 0, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2026, 6, 16, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 18, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 20, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 22, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 24, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 26, 12, 0, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(bysetpos=[0])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 3)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 16, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 16, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 16, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 16, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2026, 6, 16, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 18, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 20, 12, 0, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2026, 6, 16, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 18, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 20, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 22, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 24, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 26, 12, 0, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2026, 6, 16, 12, 0, 0, 0, 0],
      [0, 2026, 6, 18, 12, 0, 0, 0, 0],
      [0, 2026, 6, 20, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(bysetpos=[1])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 4)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 2)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2026, 6, 17, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 17, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 17, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2026, 6, 17, 12, 0, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2026, 6, 17, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 19, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 21, 12, 0, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2026, 6, 17, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 19, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 21, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 23, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 25, 12, 0, 0, 0, -14400],
      [1, 2026, 6, 27, 12, 0, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2026, 6, 17, 12, 0, 0, 0, 0],
      [0, 2026, 6, 19, 12, 0, 0, 0, 0],
      [0, 2026, 6, 21, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 43 constructor explicit None dtstart" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  ignore(zone_ny)
  assert_true(
    try {
      ignore(
        @date.RRuleWrapper::new(
          @date.Daily,
          null=["dtstart"],
          count=6,
          context~,
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
test "rrulewrapper original 44 constructor explicit None until" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  ignore(zone_ny)
  assert_true(
    try {
      ignore(
        @date.RRuleWrapper::new(@date.Daily, null=["until"], count=6, context~),
      )
      false
    } catch {
      _ => true
    },
  )
  assert_eq(calls.val, 0)
}

///|
test "rrulewrapper original 45 constructor aware until without zone" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  ignore(zone_ny)
  assert_true(
    try {
      ignore(
        @date.RRuleWrapper::new(
          @date.Daily,
          dtstart=@date.RRuleDateTime::naive(
            @date.parse_iso("2024-01-01T00:00:00.123456"),
          ),
          until=@date.RRuleDateTime::aware(
            @date.parse_iso("2024-01-05T00:00:00+00:00"),
          ),
          context~,
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
test "rrulewrapper original 46 aware until converted to inferred zone" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-09T02:30:00.123456"),
      zone_ny,
      fold=false,
    ),
    until=@date.RRuleDateTime::aware(
      @date.parse_iso("2024-03-14T12:00:00+00:00"),
    ),
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 14, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 11, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 10, 2, 30, 0, 0, -14400])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 9, 2, 30, 0, 0, -18000])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 9, 2, 30, 0, 0, -18000],
      [1, 2024, 3, 10, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 11, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 12, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 13, 2, 30, 0, 0, -14400],
      [1, 2024, 3, 14, 2, 30, 0, 0, -14400],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 9, 2, 30, 0, 0, 0],
      [0, 2024, 3, 10, 2, 30, 0, 0, 0],
      [0, 2024, 3, 11, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 47 ordinal 0 [[0, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[@date.RelativeWeekday::new(0, nth=1)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2025, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2025, 1, 6, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([[0, 2025, 1, 6, 0, 0, 0, 0, 0]]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([[0, 2024, 1, 1, 0, 0, 0, 0, 0], [0, 2025, 1, 6, 0, 0, 0, 0, 0]]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [[0, 2024, 1, 1, 0, 0, 0, 0, 0], [0, 2025, 1, 6, 0, 0, 0, 0, 0]],
  )
  assert_eq(wrapper.occurrence_count(), 2L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 105L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 24L)
}

///|
test "rrulewrapper original 48 ordinal 0 [[0, -1], [4, 2]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[
      @date.RelativeWeekday::new(0, nth=-1),
      @date.RelativeWeekday::new(4, nth=2),
    ],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 12, 30, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 12, 30, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 12, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 4L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 19, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 26, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 2, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 16, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 23, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 22, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 5, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 19, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 3, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 17, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 24, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 31, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 7, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 21, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 28, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 5, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 19, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 26, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 2, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 16, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 23, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 30, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 6, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 20, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 4, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 18, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 25, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 1, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 15, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 22, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 29, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 6, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 20, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 27, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 3, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 17, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 24, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 31, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 7, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 21, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 7, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 21, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 4, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 18, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 25, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 2, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 16, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 23, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 30, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 6, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 20, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 4, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 18, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 25, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 1, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 15, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 22, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 5, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 19, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 3, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 17, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 24, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 31, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 7, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 21, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 28, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 5, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 19, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 26, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 209L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 48L)
}

///|
test "rrulewrapper original 49 ordinal 0 [[0, None], [1, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[
      @date.RelativeWeekday::new(0),
      @date.RelativeWeekday::new(1, nth=1),
    ],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 16, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 23, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 1, 30, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 6, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 13, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 20, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 2, 27, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 19, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 2, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 9, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 16, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 23, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 7, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 14, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 21, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 28, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 4, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 11, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 18, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 25, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 2, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 9, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 16, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 23, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 7, 30, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 6, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 13, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 20, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 3, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 10, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 17, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 24, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 1, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 8, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 15, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 22, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 10, 29, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 5, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 12, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 19, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 26, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 3, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 10, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 17, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2024, 12, 31, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 7, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 14, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 21, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 28, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 4, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 11, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 18, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 4, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 11, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 18, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 8, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 15, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 22, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 4, 29, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 6, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 13, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 20, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 3, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 10, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 17, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 24, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 1, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 8, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 15, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 22, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 7, 29, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 5, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 12, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 19, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 2, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 9, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 16, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 23, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 30, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 7, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 14, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 21, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 28, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 4, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 11, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 18, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 25, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 9, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 16, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 23, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 12, 30, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 210L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 50 ordinal 0 [[6, 0]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[@date.RelativeWeekday::new(6, nth=0)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
}

///|
test "rrulewrapper original 51 ordinal 1 [[0, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[@date.RelativeWeekday::new(0, nth=1)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 24L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 105L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 24L)
}

///|
test "rrulewrapper original 52 ordinal 1 [[0, -1], [4, 2]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[
      @date.RelativeWeekday::new(0, nth=-1),
      @date.RelativeWeekday::new(4, nth=2),
    ],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 48L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 19, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 26, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 2, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 16, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 23, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 22, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 5, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 19, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 3, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 17, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 24, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 31, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 7, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 21, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 28, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 5, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 19, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 26, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 2, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 16, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 23, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 30, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 6, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 20, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 4, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 18, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 25, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 1, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 15, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 22, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 29, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 6, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 20, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 27, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 3, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 17, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 24, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 31, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 7, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 21, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 7, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 21, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 4, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 18, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 25, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 2, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 16, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 23, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 30, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 6, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 20, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 4, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 18, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 25, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 1, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 15, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 22, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 5, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 19, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 3, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 17, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 24, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 31, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 7, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 21, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 28, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 5, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 19, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 26, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 209L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 48L)
}

///|
test "rrulewrapper original 53 ordinal 1 [[0, None], [1, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[
      @date.RelativeWeekday::new(0),
      @date.RelativeWeekday::new(1, nth=1),
    ],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 16, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 23, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 1, 30, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 6, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 13, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 20, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 2, 27, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 19, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 2, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 9, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 16, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 23, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 7, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 14, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 21, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 28, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 4, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 11, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 18, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 25, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 2, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 9, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 16, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 23, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 7, 30, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 6, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 13, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 20, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 3, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 10, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 17, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 24, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 1, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 8, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 15, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 22, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 10, 29, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 5, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 12, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 19, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 26, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 3, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 10, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 17, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2024, 12, 31, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 7, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 14, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 21, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 28, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 4, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 11, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 18, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 4, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 11, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 18, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 8, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 15, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 22, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 4, 29, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 6, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 13, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 20, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 3, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 10, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 17, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 24, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 1, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 8, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 15, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 22, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 7, 29, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 5, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 12, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 19, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 2, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 9, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 16, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 23, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 30, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 7, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 14, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 21, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 28, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 4, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 11, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 18, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 25, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 9, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 16, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 23, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 12, 30, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 210L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 54 ordinal 1 [[6, 0]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[@date.RelativeWeekday::new(6, nth=0)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
}

///|
test "rrulewrapper original 55 ordinal 2 [[0, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[@date.RelativeWeekday::new(0, nth=1)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 105L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 105L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 24L)
}

///|
test "rrulewrapper original 56 ordinal 2 [[0, -1], [4, 2]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[
      @date.RelativeWeekday::new(0, nth=-1),
      @date.RelativeWeekday::new(4, nth=2),
    ],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 19, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 26, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 2, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 16, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 23, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 22, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 5, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 19, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 3, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 17, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 24, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 31, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 7, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 21, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 28, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 5, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 19, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 26, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 2, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 16, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 23, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 30, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 6, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 20, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 4, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 18, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 25, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 1, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 15, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 22, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 29, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 6, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 20, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 27, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 3, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 17, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 24, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 31, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 7, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 21, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 7, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 21, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 4, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 18, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 25, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 2, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 16, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 23, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 30, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 6, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 20, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 4, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 18, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 25, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 1, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 15, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 22, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 5, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 19, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 3, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 17, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 24, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 31, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 7, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 21, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 28, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 5, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 19, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 26, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 209L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 19, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 26, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 2, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 16, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 23, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 22, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 5, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 19, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 3, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 17, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 24, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 31, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 7, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 21, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 28, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 5, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 19, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 26, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 2, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 16, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 23, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 30, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 6, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 20, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 4, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 18, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 25, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 1, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 15, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 22, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 29, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 6, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 20, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 27, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 3, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 17, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 24, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 31, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 7, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 21, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 7, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 21, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 4, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 18, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 25, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 2, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 16, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 23, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 30, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 6, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 20, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 4, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 18, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 25, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 1, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 15, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 22, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 5, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 19, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 3, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 17, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 24, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 31, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 7, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 21, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 28, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 5, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 19, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 26, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 209L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 48L)
}

///|
test "rrulewrapper original 57 ordinal 2 [[0, None], [1, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[
      @date.RelativeWeekday::new(0),
      @date.RelativeWeekday::new(1, nth=1),
    ],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 16, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 23, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 1, 30, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 6, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 13, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 20, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 2, 27, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 19, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 2, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 9, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 16, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 23, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 7, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 14, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 21, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 28, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 4, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 11, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 18, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 25, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 2, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 9, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 16, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 23, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 7, 30, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 6, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 13, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 20, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 3, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 10, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 17, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 24, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 1, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 8, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 15, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 22, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 10, 29, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 5, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 12, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 19, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 26, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 3, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 10, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 17, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2024, 12, 31, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 7, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 14, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 21, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 28, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 4, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 11, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 18, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 4, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 11, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 18, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 8, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 15, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 22, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 4, 29, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 6, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 13, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 20, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 3, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 10, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 17, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 24, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 1, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 8, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 15, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 22, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 7, 29, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 5, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 12, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 19, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 2, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 9, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 16, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 23, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 30, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 7, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 14, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 21, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 28, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 4, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 11, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 18, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 25, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 9, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 16, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 23, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 12, 30, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 210L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 16, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 23, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 1, 30, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 6, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 13, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 20, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 2, 27, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 19, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 2, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 9, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 16, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 23, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 7, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 14, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 21, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 28, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 4, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 11, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 18, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 25, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 2, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 9, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 16, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 23, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 7, 30, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 6, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 13, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 20, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 3, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 10, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 17, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 24, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 1, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 8, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 15, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 22, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 10, 29, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 5, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 12, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 19, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 26, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 3, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 10, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 17, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2024, 12, 31, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 7, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 14, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 21, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 28, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 4, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 11, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 18, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 4, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 11, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 18, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 8, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 15, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 22, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 4, 29, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 6, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 13, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 20, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 3, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 10, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 17, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 24, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 1, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 8, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 15, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 22, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 7, 29, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 5, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 12, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 19, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 2, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 9, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 16, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 23, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 30, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 7, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 14, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 21, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 28, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 4, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 11, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 18, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 25, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 9, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 16, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 23, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 12, 30, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 210L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 58 ordinal 2 [[6, 0]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[@date.RelativeWeekday::new(6, nth=0)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
}

///|
test "rrulewrapper original 59 ordinal 3 [[0, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[@date.RelativeWeekday::new(0, nth=1)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 105L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 105L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 24L)
}

///|
test "rrulewrapper original 60 ordinal 3 [[0, -1], [4, 2]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[
      @date.RelativeWeekday::new(0, nth=-1),
      @date.RelativeWeekday::new(4, nth=2),
    ],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 19, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 26, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 2, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 16, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 23, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 22, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 5, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 19, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 3, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 17, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 24, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 31, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 7, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 21, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 28, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 5, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 19, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 26, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 2, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 16, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 23, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 30, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 6, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 20, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 4, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 18, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 25, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 1, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 15, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 22, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 29, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 6, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 20, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 27, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 3, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 17, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 24, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 31, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 7, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 21, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 7, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 21, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 4, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 18, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 25, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 2, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 16, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 23, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 30, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 6, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 20, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 4, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 18, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 25, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 1, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 15, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 22, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 5, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 19, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 3, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 17, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 24, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 31, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 7, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 21, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 28, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 5, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 19, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 26, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 209L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 19, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 26, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 2, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 16, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 23, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 22, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 5, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 19, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 3, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 17, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 24, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 31, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 7, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 21, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 28, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 5, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 19, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 26, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 2, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 16, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 23, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 30, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 6, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 20, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 4, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 18, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 25, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 1, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 15, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 22, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 29, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 6, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 20, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 27, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 3, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 17, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 24, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 31, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 7, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 21, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 7, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 21, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 28, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 4, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 18, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 25, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 2, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 16, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 23, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 30, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 6, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 20, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 4, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 18, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 25, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 1, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 15, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 22, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 5, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 19, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 3, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 17, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 24, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 31, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 7, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 21, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 28, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 5, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 19, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 26, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 5, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 209L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 25, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 8, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 8, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 12, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 10, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 14, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 7, 12, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 8, 9, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 9, 13, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 11, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 11, 8, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 12, 13, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2025, 1, 10, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 2, 14, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 14, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 11, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 5, 9, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 6, 13, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 11, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 8, 8, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 9, 12, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 10, 10, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 11, 14, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 12, 12, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 12, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 9, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 48L)
}

///|
test "rrulewrapper original 61 ordinal 3 [[0, None], [1, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[
      @date.RelativeWeekday::new(0),
      @date.RelativeWeekday::new(1, nth=1),
    ],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 16, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 23, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 1, 30, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 6, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 13, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 20, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 2, 27, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 19, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 2, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 9, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 16, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 23, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 7, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 14, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 21, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 28, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 4, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 11, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 18, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 25, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 2, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 9, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 16, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 23, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 7, 30, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 6, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 13, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 20, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 3, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 10, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 17, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 24, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 1, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 8, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 15, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 22, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 10, 29, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 5, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 12, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 19, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 26, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 3, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 10, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 17, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2024, 12, 31, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 7, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 14, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 21, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 28, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 4, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 11, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 18, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 4, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 11, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 18, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 8, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 15, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 22, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 4, 29, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 6, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 13, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 20, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 3, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 10, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 17, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 24, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 1, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 8, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 15, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 22, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 7, 29, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 5, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 12, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 19, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 2, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 9, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 16, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 23, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 30, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 7, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 14, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 21, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 28, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 4, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 11, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 18, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 25, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 9, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 16, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 23, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 12, 30, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 210L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 16, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 23, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 1, 30, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 6, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 13, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 20, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 2, 27, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 19, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 2, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 9, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 16, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 23, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 7, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 14, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 21, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 5, 28, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 4, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 11, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 18, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
      [0, 2024, 6, 25, 0, 0, 0, 0, 0],
      [0, 2024, 7, 1, 0, 0, 0, 0, 0],
      [0, 2024, 7, 2, 0, 0, 0, 0, 0],
      [0, 2024, 7, 8, 0, 0, 0, 0, 0],
      [0, 2024, 7, 9, 0, 0, 0, 0, 0],
      [0, 2024, 7, 15, 0, 0, 0, 0, 0],
      [0, 2024, 7, 16, 0, 0, 0, 0, 0],
      [0, 2024, 7, 22, 0, 0, 0, 0, 0],
      [0, 2024, 7, 23, 0, 0, 0, 0, 0],
      [0, 2024, 7, 29, 0, 0, 0, 0, 0],
      [0, 2024, 7, 30, 0, 0, 0, 0, 0],
      [0, 2024, 8, 5, 0, 0, 0, 0, 0],
      [0, 2024, 8, 6, 0, 0, 0, 0, 0],
      [0, 2024, 8, 12, 0, 0, 0, 0, 0],
      [0, 2024, 8, 13, 0, 0, 0, 0, 0],
      [0, 2024, 8, 19, 0, 0, 0, 0, 0],
      [0, 2024, 8, 20, 0, 0, 0, 0, 0],
      [0, 2024, 8, 26, 0, 0, 0, 0, 0],
      [0, 2024, 8, 27, 0, 0, 0, 0, 0],
      [0, 2024, 9, 2, 0, 0, 0, 0, 0],
      [0, 2024, 9, 3, 0, 0, 0, 0, 0],
      [0, 2024, 9, 9, 0, 0, 0, 0, 0],
      [0, 2024, 9, 10, 0, 0, 0, 0, 0],
      [0, 2024, 9, 16, 0, 0, 0, 0, 0],
      [0, 2024, 9, 17, 0, 0, 0, 0, 0],
      [0, 2024, 9, 23, 0, 0, 0, 0, 0],
      [0, 2024, 9, 24, 0, 0, 0, 0, 0],
      [0, 2024, 9, 30, 0, 0, 0, 0, 0],
      [0, 2024, 10, 1, 0, 0, 0, 0, 0],
      [0, 2024, 10, 7, 0, 0, 0, 0, 0],
      [0, 2024, 10, 8, 0, 0, 0, 0, 0],
      [0, 2024, 10, 14, 0, 0, 0, 0, 0],
      [0, 2024, 10, 15, 0, 0, 0, 0, 0],
      [0, 2024, 10, 21, 0, 0, 0, 0, 0],
      [0, 2024, 10, 22, 0, 0, 0, 0, 0],
      [0, 2024, 10, 28, 0, 0, 0, 0, 0],
      [0, 2024, 10, 29, 0, 0, 0, 0, 0],
      [0, 2024, 11, 4, 0, 0, 0, 0, 0],
      [0, 2024, 11, 5, 0, 0, 0, 0, 0],
      [0, 2024, 11, 11, 0, 0, 0, 0, 0],
      [0, 2024, 11, 12, 0, 0, 0, 0, 0],
      [0, 2024, 11, 18, 0, 0, 0, 0, 0],
      [0, 2024, 11, 19, 0, 0, 0, 0, 0],
      [0, 2024, 11, 25, 0, 0, 0, 0, 0],
      [0, 2024, 11, 26, 0, 0, 0, 0, 0],
      [0, 2024, 12, 2, 0, 0, 0, 0, 0],
      [0, 2024, 12, 3, 0, 0, 0, 0, 0],
      [0, 2024, 12, 9, 0, 0, 0, 0, 0],
      [0, 2024, 12, 10, 0, 0, 0, 0, 0],
      [0, 2024, 12, 16, 0, 0, 0, 0, 0],
      [0, 2024, 12, 17, 0, 0, 0, 0, 0],
      [0, 2024, 12, 23, 0, 0, 0, 0, 0],
      [0, 2024, 12, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 30, 0, 0, 0, 0, 0],
      [0, 2024, 12, 31, 0, 0, 0, 0, 0],
      [0, 2025, 1, 6, 0, 0, 0, 0, 0],
      [0, 2025, 1, 7, 0, 0, 0, 0, 0],
      [0, 2025, 1, 13, 0, 0, 0, 0, 0],
      [0, 2025, 1, 14, 0, 0, 0, 0, 0],
      [0, 2025, 1, 20, 0, 0, 0, 0, 0],
      [0, 2025, 1, 21, 0, 0, 0, 0, 0],
      [0, 2025, 1, 27, 0, 0, 0, 0, 0],
      [0, 2025, 1, 28, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 2, 4, 0, 0, 0, 0, 0],
      [0, 2025, 2, 10, 0, 0, 0, 0, 0],
      [0, 2025, 2, 11, 0, 0, 0, 0, 0],
      [0, 2025, 2, 17, 0, 0, 0, 0, 0],
      [0, 2025, 2, 18, 0, 0, 0, 0, 0],
      [0, 2025, 2, 24, 0, 0, 0, 0, 0],
      [0, 2025, 2, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 3, 0, 0, 0, 0, 0],
      [0, 2025, 3, 4, 0, 0, 0, 0, 0],
      [0, 2025, 3, 10, 0, 0, 0, 0, 0],
      [0, 2025, 3, 11, 0, 0, 0, 0, 0],
      [0, 2025, 3, 17, 0, 0, 0, 0, 0],
      [0, 2025, 3, 18, 0, 0, 0, 0, 0],
      [0, 2025, 3, 24, 0, 0, 0, 0, 0],
      [0, 2025, 3, 25, 0, 0, 0, 0, 0],
      [0, 2025, 3, 31, 0, 0, 0, 0, 0],
      [0, 2025, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
      [0, 2025, 4, 8, 0, 0, 0, 0, 0],
      [0, 2025, 4, 14, 0, 0, 0, 0, 0],
      [0, 2025, 4, 15, 0, 0, 0, 0, 0],
      [0, 2025, 4, 21, 0, 0, 0, 0, 0],
      [0, 2025, 4, 22, 0, 0, 0, 0, 0],
      [0, 2025, 4, 28, 0, 0, 0, 0, 0],
      [0, 2025, 4, 29, 0, 0, 0, 0, 0],
      [0, 2025, 5, 5, 0, 0, 0, 0, 0],
      [0, 2025, 5, 6, 0, 0, 0, 0, 0],
      [0, 2025, 5, 12, 0, 0, 0, 0, 0],
      [0, 2025, 5, 13, 0, 0, 0, 0, 0],
      [0, 2025, 5, 19, 0, 0, 0, 0, 0],
      [0, 2025, 5, 20, 0, 0, 0, 0, 0],
      [0, 2025, 5, 26, 0, 0, 0, 0, 0],
      [0, 2025, 5, 27, 0, 0, 0, 0, 0],
      [0, 2025, 6, 2, 0, 0, 0, 0, 0],
      [0, 2025, 6, 3, 0, 0, 0, 0, 0],
      [0, 2025, 6, 9, 0, 0, 0, 0, 0],
      [0, 2025, 6, 10, 0, 0, 0, 0, 0],
      [0, 2025, 6, 16, 0, 0, 0, 0, 0],
      [0, 2025, 6, 17, 0, 0, 0, 0, 0],
      [0, 2025, 6, 23, 0, 0, 0, 0, 0],
      [0, 2025, 6, 24, 0, 0, 0, 0, 0],
      [0, 2025, 6, 30, 0, 0, 0, 0, 0],
      [0, 2025, 7, 1, 0, 0, 0, 0, 0],
      [0, 2025, 7, 7, 0, 0, 0, 0, 0],
      [0, 2025, 7, 8, 0, 0, 0, 0, 0],
      [0, 2025, 7, 14, 0, 0, 0, 0, 0],
      [0, 2025, 7, 15, 0, 0, 0, 0, 0],
      [0, 2025, 7, 21, 0, 0, 0, 0, 0],
      [0, 2025, 7, 22, 0, 0, 0, 0, 0],
      [0, 2025, 7, 28, 0, 0, 0, 0, 0],
      [0, 2025, 7, 29, 0, 0, 0, 0, 0],
      [0, 2025, 8, 4, 0, 0, 0, 0, 0],
      [0, 2025, 8, 5, 0, 0, 0, 0, 0],
      [0, 2025, 8, 11, 0, 0, 0, 0, 0],
      [0, 2025, 8, 12, 0, 0, 0, 0, 0],
      [0, 2025, 8, 18, 0, 0, 0, 0, 0],
      [0, 2025, 8, 19, 0, 0, 0, 0, 0],
      [0, 2025, 8, 25, 0, 0, 0, 0, 0],
      [0, 2025, 8, 26, 0, 0, 0, 0, 0],
      [0, 2025, 9, 1, 0, 0, 0, 0, 0],
      [0, 2025, 9, 2, 0, 0, 0, 0, 0],
      [0, 2025, 9, 8, 0, 0, 0, 0, 0],
      [0, 2025, 9, 9, 0, 0, 0, 0, 0],
      [0, 2025, 9, 15, 0, 0, 0, 0, 0],
      [0, 2025, 9, 16, 0, 0, 0, 0, 0],
      [0, 2025, 9, 22, 0, 0, 0, 0, 0],
      [0, 2025, 9, 23, 0, 0, 0, 0, 0],
      [0, 2025, 9, 29, 0, 0, 0, 0, 0],
      [0, 2025, 9, 30, 0, 0, 0, 0, 0],
      [0, 2025, 10, 6, 0, 0, 0, 0, 0],
      [0, 2025, 10, 7, 0, 0, 0, 0, 0],
      [0, 2025, 10, 13, 0, 0, 0, 0, 0],
      [0, 2025, 10, 14, 0, 0, 0, 0, 0],
      [0, 2025, 10, 20, 0, 0, 0, 0, 0],
      [0, 2025, 10, 21, 0, 0, 0, 0, 0],
      [0, 2025, 10, 27, 0, 0, 0, 0, 0],
      [0, 2025, 10, 28, 0, 0, 0, 0, 0],
      [0, 2025, 11, 3, 0, 0, 0, 0, 0],
      [0, 2025, 11, 4, 0, 0, 0, 0, 0],
      [0, 2025, 11, 10, 0, 0, 0, 0, 0],
      [0, 2025, 11, 11, 0, 0, 0, 0, 0],
      [0, 2025, 11, 17, 0, 0, 0, 0, 0],
      [0, 2025, 11, 18, 0, 0, 0, 0, 0],
      [0, 2025, 11, 24, 0, 0, 0, 0, 0],
      [0, 2025, 11, 25, 0, 0, 0, 0, 0],
      [0, 2025, 12, 1, 0, 0, 0, 0, 0],
      [0, 2025, 12, 2, 0, 0, 0, 0, 0],
      [0, 2025, 12, 8, 0, 0, 0, 0, 0],
      [0, 2025, 12, 9, 0, 0, 0, 0, 0],
      [0, 2025, 12, 15, 0, 0, 0, 0, 0],
      [0, 2025, 12, 16, 0, 0, 0, 0, 0],
      [0, 2025, 12, 22, 0, 0, 0, 0, 0],
      [0, 2025, 12, 23, 0, 0, 0, 0, 0],
      [0, 2025, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 12, 30, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 210L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
}

///|
test "rrulewrapper original 62 ordinal 3 [[6, 0]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    byweekdays=[@date.RelativeWeekday::new(6, nth=0)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Daily)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 17, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 10, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
      [0, 2024, 1, 28, 0, 0, 0, 0, 0],
      [0, 2024, 2, 4, 0, 0, 0, 0, 0],
      [0, 2024, 2, 11, 0, 0, 0, 0, 0],
      [0, 2024, 2, 18, 0, 0, 0, 0, 0],
      [0, 2024, 2, 25, 0, 0, 0, 0, 0],
      [0, 2024, 3, 3, 0, 0, 0, 0, 0],
      [0, 2024, 3, 10, 0, 0, 0, 0, 0],
      [0, 2024, 3, 17, 0, 0, 0, 0, 0],
      [0, 2024, 3, 24, 0, 0, 0, 0, 0],
      [0, 2024, 3, 31, 0, 0, 0, 0, 0],
      [0, 2024, 4, 7, 0, 0, 0, 0, 0],
      [0, 2024, 4, 14, 0, 0, 0, 0, 0],
      [0, 2024, 4, 21, 0, 0, 0, 0, 0],
      [0, 2024, 4, 28, 0, 0, 0, 0, 0],
      [0, 2024, 5, 5, 0, 0, 0, 0, 0],
      [0, 2024, 5, 12, 0, 0, 0, 0, 0],
      [0, 2024, 5, 19, 0, 0, 0, 0, 0],
      [0, 2024, 5, 26, 0, 0, 0, 0, 0],
      [0, 2024, 6, 2, 0, 0, 0, 0, 0],
      [0, 2024, 6, 9, 0, 0, 0, 0, 0],
      [0, 2024, 6, 16, 0, 0, 0, 0, 0],
      [0, 2024, 6, 23, 0, 0, 0, 0, 0],
      [0, 2024, 6, 30, 0, 0, 0, 0, 0],
      [0, 2024, 7, 7, 0, 0, 0, 0, 0],
      [0, 2024, 7, 14, 0, 0, 0, 0, 0],
      [0, 2024, 7, 21, 0, 0, 0, 0, 0],
      [0, 2024, 7, 28, 0, 0, 0, 0, 0],
      [0, 2024, 8, 4, 0, 0, 0, 0, 0],
      [0, 2024, 8, 11, 0, 0, 0, 0, 0],
      [0, 2024, 8, 18, 0, 0, 0, 0, 0],
      [0, 2024, 8, 25, 0, 0, 0, 0, 0],
      [0, 2024, 9, 1, 0, 0, 0, 0, 0],
      [0, 2024, 9, 8, 0, 0, 0, 0, 0],
      [0, 2024, 9, 15, 0, 0, 0, 0, 0],
      [0, 2024, 9, 22, 0, 0, 0, 0, 0],
      [0, 2024, 9, 29, 0, 0, 0, 0, 0],
      [0, 2024, 10, 6, 0, 0, 0, 0, 0],
      [0, 2024, 10, 13, 0, 0, 0, 0, 0],
      [0, 2024, 10, 20, 0, 0, 0, 0, 0],
      [0, 2024, 10, 27, 0, 0, 0, 0, 0],
      [0, 2024, 11, 3, 0, 0, 0, 0, 0],
      [0, 2024, 11, 10, 0, 0, 0, 0, 0],
      [0, 2024, 11, 17, 0, 0, 0, 0, 0],
      [0, 2024, 11, 24, 0, 0, 0, 0, 0],
      [0, 2024, 12, 1, 0, 0, 0, 0, 0],
      [0, 2024, 12, 8, 0, 0, 0, 0, 0],
      [0, 2024, 12, 15, 0, 0, 0, 0, 0],
      [0, 2024, 12, 22, 0, 0, 0, 0, 0],
      [0, 2024, 12, 29, 0, 0, 0, 0, 0],
      [0, 2025, 1, 5, 0, 0, 0, 0, 0],
      [0, 2025, 1, 12, 0, 0, 0, 0, 0],
      [0, 2025, 1, 19, 0, 0, 0, 0, 0],
      [0, 2025, 1, 26, 0, 0, 0, 0, 0],
      [0, 2025, 2, 2, 0, 0, 0, 0, 0],
      [0, 2025, 2, 9, 0, 0, 0, 0, 0],
      [0, 2025, 2, 16, 0, 0, 0, 0, 0],
      [0, 2025, 2, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 2, 0, 0, 0, 0, 0],
      [0, 2025, 3, 9, 0, 0, 0, 0, 0],
      [0, 2025, 3, 16, 0, 0, 0, 0, 0],
      [0, 2025, 3, 23, 0, 0, 0, 0, 0],
      [0, 2025, 3, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 6, 0, 0, 0, 0, 0],
      [0, 2025, 4, 13, 0, 0, 0, 0, 0],
      [0, 2025, 4, 20, 0, 0, 0, 0, 0],
      [0, 2025, 4, 27, 0, 0, 0, 0, 0],
      [0, 2025, 5, 4, 0, 0, 0, 0, 0],
      [0, 2025, 5, 11, 0, 0, 0, 0, 0],
      [0, 2025, 5, 18, 0, 0, 0, 0, 0],
      [0, 2025, 5, 25, 0, 0, 0, 0, 0],
      [0, 2025, 6, 1, 0, 0, 0, 0, 0],
      [0, 2025, 6, 8, 0, 0, 0, 0, 0],
      [0, 2025, 6, 15, 0, 0, 0, 0, 0],
      [0, 2025, 6, 22, 0, 0, 0, 0, 0],
      [0, 2025, 6, 29, 0, 0, 0, 0, 0],
      [0, 2025, 7, 6, 0, 0, 0, 0, 0],
      [0, 2025, 7, 13, 0, 0, 0, 0, 0],
      [0, 2025, 7, 20, 0, 0, 0, 0, 0],
      [0, 2025, 7, 27, 0, 0, 0, 0, 0],
      [0, 2025, 8, 3, 0, 0, 0, 0, 0],
      [0, 2025, 8, 10, 0, 0, 0, 0, 0],
      [0, 2025, 8, 17, 0, 0, 0, 0, 0],
      [0, 2025, 8, 24, 0, 0, 0, 0, 0],
      [0, 2025, 8, 31, 0, 0, 0, 0, 0],
      [0, 2025, 9, 7, 0, 0, 0, 0, 0],
      [0, 2025, 9, 14, 0, 0, 0, 0, 0],
      [0, 2025, 9, 21, 0, 0, 0, 0, 0],
      [0, 2025, 9, 28, 0, 0, 0, 0, 0],
      [0, 2025, 10, 5, 0, 0, 0, 0, 0],
      [0, 2025, 10, 12, 0, 0, 0, 0, 0],
      [0, 2025, 10, 19, 0, 0, 0, 0, 0],
      [0, 2025, 10, 26, 0, 0, 0, 0, 0],
      [0, 2025, 11, 2, 0, 0, 0, 0, 0],
      [0, 2025, 11, 9, 0, 0, 0, 0, 0],
      [0, 2025, 11, 16, 0, 0, 0, 0, 0],
      [0, 2025, 11, 23, 0, 0, 0, 0, 0],
      [0, 2025, 11, 30, 0, 0, 0, 0, 0],
      [0, 2025, 12, 7, 0, 0, 0, 0, 0],
      [0, 2025, 12, 14, 0, 0, 0, 0, 0],
      [0, 2025, 12, 21, 0, 0, 0, 0, 0],
      [0, 2025, 12, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 7, 0, 0, 0, 0, 0],
      [0, 2024, 1, 14, 0, 0, 0, 0, 0],
      [0, 2024, 1, 21, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 104L)
}

///|
test "rrulewrapper original 63 ordinal month mask" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2025-12-31T23:59:59")),
    bymonth=[2, 4],
    byweekdays=[@date.RelativeWeekday::new(0, nth=1)],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 2, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
      [0, 2025, 4, 7, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2025, 2, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 4L)
}

///|
test "rrulewrapper original 64 weekday form replacement" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    until=@date.RRuleDateTime::naive(@date.parse_iso("2024-06-30T23:59:59")),
    byweekday=[0],
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 6, 30, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 11, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 4, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
      [0, 2024, 1, 29, 0, 0, 0, 0, 0],
      [0, 2024, 2, 5, 0, 0, 0, 0, 0],
      [0, 2024, 2, 12, 0, 0, 0, 0, 0],
      [0, 2024, 2, 19, 0, 0, 0, 0, 0],
      [0, 2024, 2, 26, 0, 0, 0, 0, 0],
      [0, 2024, 3, 4, 0, 0, 0, 0, 0],
      [0, 2024, 3, 11, 0, 0, 0, 0, 0],
      [0, 2024, 3, 18, 0, 0, 0, 0, 0],
      [0, 2024, 3, 25, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 8, 0, 0, 0, 0, 0],
      [0, 2024, 4, 15, 0, 0, 0, 0, 0],
      [0, 2024, 4, 22, 0, 0, 0, 0, 0],
      [0, 2024, 4, 29, 0, 0, 0, 0, 0],
      [0, 2024, 5, 6, 0, 0, 0, 0, 0],
      [0, 2024, 5, 13, 0, 0, 0, 0, 0],
      [0, 2024, 5, 20, 0, 0, 0, 0, 0],
      [0, 2024, 5, 27, 0, 0, 0, 0, 0],
      [0, 2024, 6, 3, 0, 0, 0, 0, 0],
      [0, 2024, 6, 10, 0, 0, 0, 0, 0],
      [0, 2024, 6, 17, 0, 0, 0, 0, 0],
      [0, 2024, 6, 24, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 26L)
  assert_eq(
    try {
      wrapper.set(byweekdays=[@date.RelativeWeekday::new(4, nth=-1)])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 6, 30, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 29, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 29, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 2, 23, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 26, 0, 0, 0, 0, 0],
      [0, 2024, 5, 31, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 26, 0, 0, 0, 0, 0],
      [0, 2024, 2, 23, 0, 0, 0, 0, 0],
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
      [0, 2024, 4, 26, 0, 0, 0, 0, 0],
      [0, 2024, 5, 31, 0, 0, 0, 0, 0],
      [0, 2024, 6, 28, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 26, 0, 0, 0, 0, 0],
      [0, 2024, 2, 23, 0, 0, 0, 0, 0],
      [0, 2024, 3, 29, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(byweekday=[1])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 6, 30, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 12, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 12, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 5, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 19, 0, 0, 0, 0, 0],
      [0, 2024, 3, 26, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 16, 0, 0, 0, 0, 0],
      [0, 2024, 1, 23, 0, 0, 0, 0, 0],
      [0, 2024, 1, 30, 0, 0, 0, 0, 0],
      [0, 2024, 2, 6, 0, 0, 0, 0, 0],
      [0, 2024, 2, 13, 0, 0, 0, 0, 0],
      [0, 2024, 2, 20, 0, 0, 0, 0, 0],
      [0, 2024, 2, 27, 0, 0, 0, 0, 0],
      [0, 2024, 3, 5, 0, 0, 0, 0, 0],
      [0, 2024, 3, 12, 0, 0, 0, 0, 0],
      [0, 2024, 3, 19, 0, 0, 0, 0, 0],
      [0, 2024, 3, 26, 0, 0, 0, 0, 0],
      [0, 2024, 4, 2, 0, 0, 0, 0, 0],
      [0, 2024, 4, 9, 0, 0, 0, 0, 0],
      [0, 2024, 4, 16, 0, 0, 0, 0, 0],
      [0, 2024, 4, 23, 0, 0, 0, 0, 0],
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2024, 5, 7, 0, 0, 0, 0, 0],
      [0, 2024, 5, 14, 0, 0, 0, 0, 0],
      [0, 2024, 5, 21, 0, 0, 0, 0, 0],
      [0, 2024, 5, 28, 0, 0, 0, 0, 0],
      [0, 2024, 6, 4, 0, 0, 0, 0, 0],
      [0, 2024, 6, 11, 0, 0, 0, 0, 0],
      [0, 2024, 6, 18, 0, 0, 0, 0, 0],
      [0, 2024, 6, 25, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 9, 0, 0, 0, 0, 0],
      [0, 2024, 1, 16, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 26L)
  assert_eq(
    try {
      wrapper.set(null=["byweekday"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 6, 30, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 1, 0, 0, 0, 0, 0],
      [0, 2024, 6, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 1, 0, 0, 0, 0, 0],
      [0, 2024, 6, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 65 configuration array mutation" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let byhour_input = [0]
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=3,
    byhour=byhour_input,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(3))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 3, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 3L)
  byhour_input.clear()
  byhour_input.push(12)
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(3))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 3, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 3, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 3L)
  assert_eq(
    try {
      wrapper.set(count=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(2))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 2, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([[0, 2024, 1, 1, 12, 0, 0, 0, 0], [0, 2024, 1, 2, 12, 0, 0, 0, 0]]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [[0, 2024, 1, 1, 12, 0, 0, 0, 0], [0, 2024, 1, 2, 12, 0, 0, 0, 0]],
  )
  assert_eq(wrapper.occurrence_count(), 2L)
}

///|
test "rrulewrapper original 66 first bound comparison order" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=0,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(0))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [],
  )
  assert_eq(wrapper.occurrence_count(), 0L)
  assert_eq(
    try {
      wrapper.set(count=1)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(1))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([[0, 2024, 1, 1, 0, 0, 0, 0, 0]]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [[0, 2024, 1, 1, 0, 0, 0, 0, 0]],
  )
  assert_eq(wrapper.occurrence_count(), 1L)
}

///|
test "rrulewrapper original 67 year-one inferred fixed offset" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::aware(
      @date.parse_iso("0001-01-01T00:00:00+23:00"),
    ),
    count=2,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(2))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 1, 1, 2, 0, 0, 0, 0, 82800])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 1, 1, 2, 0, 0, 0, 0, 82800])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 1, 1, 2, 0, 0, 0, 0, 82800])),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [[0, 1, 1, 1, 0, 0, 0, 0, 0], [0, 1, 1, 2, 0, 0, 0, 0, 0]],
  )
  assert_eq(wrapper.occurrence_count(), 2L)
}

///|
test "rrulewrapper original 68 year-one explicit same local zone" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("0001-01-01T00:00:00"),
      zone_e23,
      fold=false,
    ),
    count=2,
    timezone=zone_e23,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(2))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 1, 1, 2, 0, 0, 0, 0, 82800])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 1, 1, 2, 0, 0, 0, 0, 82800])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 1, 1, 2, 0, 0, 0, 0, 82800])),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [[0, 1, 1, 1, 0, 0, 0, 0, 0], [0, 1, 1, 2, 0, 0, 0, 0, 0]],
  )
  assert_eq(wrapper.occurrence_count(), 2L)
}

///|
test "rrulewrapper original 69 year-one different-zone overflow" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  ignore(zone_ny)
  ignore(zone_utc)
  assert_true(
    try {
      ignore(
        @date.RRuleWrapper::new(
          @date.Daily,
          dtstart=@date.RRuleDateTime::aware(
            @date.parse_iso("0001-01-01T00:00:00+23:00"),
          ),
          count=2,
          timezone=zone_utc,
          context~,
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
test "rrulewrapper original 70 null optional keywords" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=4,
    until=@date.RRuleDateTime::naive(@date.parse_iso("2024-12-31T23:59:59")),
    bymonth=[1, 2],
    byweekdays=[@date.RelativeWeekday::new(0)],
    cache=true,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(4))
  assert_eq(wrapper.cache_enabled(), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 22, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
      [0, 2024, 1, 22, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 1, 8, 0, 0, 0, 0, 0],
      [0, 2024, 1, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 4L)
  assert_eq(
    try {
      wrapper.set(null=["count", "byweekday", "wkst", "cache"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), None)
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 2, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([[0, 2024, 1, 1, 0, 0, 0, 0, 0], [0, 2024, 2, 1, 0, 0, 0, 0, 0]]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [[0, 2024, 1, 1, 0, 0, 0, 0, 0], [0, 2024, 2, 1, 0, 0, 0, 0, 0]],
  )
  assert_eq(wrapper.occurrence_count(), 2L)
}

///|
test "rrulewrapper original 71 scalar calendar keyword forms" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(
      @date.parse_iso("2024-01-01T00:00:00.123456"),
    ),
    count=6,
    bymonth_value=2,
    bymonthday_value=29,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2028, 2, 29, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2028, 2, 29, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 2, 29, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2028, 2, 29, 0, 0, 0, 0, 0],
      [0, 2032, 2, 29, 0, 0, 0, 0, 0],
      [0, 2036, 2, 29, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([[0, 2024, 2, 29, 0, 0, 0, 0, 0]]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 2, 29, 0, 0, 0, 0, 0],
      [0, 2028, 2, 29, 0, 0, 0, 0, 0],
      [0, 2032, 2, 29, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(bymonth=[4], bymonthday=[-1])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 30, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 30, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 30, 0, 0, 0, 0, 0],
      [0, 2026, 4, 30, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 30, 0, 0, 0, 0, 0],
      [0, 2026, 4, 30, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 4, 30, 0, 0, 0, 0, 0],
      [0, 2025, 4, 30, 0, 0, 0, 0, 0],
      [0, 2026, 4, 30, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(bymonth_value=3, bymonthday_value=15)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 15, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 15, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2025, 3, 15, 0, 0, 0, 0, 0],
      [0, 2026, 3, 15, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2025, 3, 15, 0, 0, 0, 0, 0],
      [0, 2026, 3, 15, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 15, 0, 0, 0, 0, 0],
      [0, 2025, 3, 15, 0, 0, 0, 0, 0],
      [0, 2026, 3, 15, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
  assert_eq(
    try {
      wrapper.set(null=["bymonth", "bymonthday"])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 4, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 3, 1, 0, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 1, 0, 0, 0, 0, 0],
      [0, 2024, 6, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
      [0, 2024, 4, 1, 0, 0, 0, 0, 0],
      [0, 2024, 5, 1, 0, 0, 0, 0, 0],
      [0, 2024, 6, 1, 0, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 0, 0, 0, 0, 0],
      [0, 2024, 2, 1, 0, 0, 0, 0, 0],
      [0, 2024, 3, 1, 0, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 72 unreachable clock constructor byhour" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  ignore(zone_ny)
  assert_true(
    try {
      ignore(
        @date.RRuleWrapper::new(
          @date.Hourly,
          dtstart=@date.RRuleDateTime::naive(
            @date.parse_iso("2024-01-01T12:00:00"),
          ),
          interval=24,
          count=3,
          byhour=[1],
          context~,
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
test "rrulewrapper original 73 unreachable clock constructor byminute" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  ignore(zone_ny)
  assert_true(
    try {
      ignore(
        @date.RRuleWrapper::new(
          @date.Minutely,
          dtstart=@date.RRuleDateTime::naive(
            @date.parse_iso("2024-01-01T00:07:00"),
          ),
          interval=3,
          count=3,
          byminute=[0],
          context~,
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
test "rrulewrapper original 74 unreachable clock constructor bysecond" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  ignore(zone_ny)
  assert_true(
    try {
      ignore(
        @date.RRuleWrapper::new(
          @date.Secondly,
          dtstart=@date.RRuleDateTime::naive(
            @date.parse_iso("2024-01-01T00:00:11"),
          ),
          interval=3,
          count=3,
          bysecond=[0],
          context~,
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
test "rrulewrapper original 75 pruned clock core versus raw construction" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T12:00:00")),
    interval=6,
    byhour=[0, 3, 12],
    count=3,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 6)
  assert_eq(wrapper.count_limit(), Some(3))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 2, 12, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 12, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper
    .raw_rule()
    .replace(interval=1)
    .iter()
    .to_array()
    .map(value => wrapper_reference_fields(@date.RRuleDateTime::naive(value))),
    [
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 12, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 3L)
  assert_eq(
    try {
      wrapper.set(interval=3)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 3)
  assert_eq(wrapper.count_limit(), Some(3))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 2, 3, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper
    .raw_rule()
    .replace(interval=1)
    .iter()
    .to_array()
    .map(value => wrapper_reference_fields(@date.RRuleDateTime::naive(value))),
    [
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
    ],
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 3L)
  assert_eq(
    try {
      wrapper.set(byhour=[1])
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 3)
  assert_eq(wrapper.count_limit(), Some(3))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 2, 3, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper
    .raw_rule()
    .replace(interval=1)
    .iter()
    .to_array()
    .map(value => wrapper_reference_fields(@date.RRuleDateTime::naive(value))),
    [
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
    ],
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 1, 12, 0, 0, 0, 0],
      [0, 2024, 1, 2, 0, 0, 0, 0, 0],
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 3L)
  assert_eq(
    try {
      wrapper.set(byhour=[3])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper.base_timezone() is Some(_), false)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 3)
  assert_eq(wrapper.count_limit(), Some(3))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([0, 2024, 1, 4, 3, 0, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(None),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
      [0, 2024, 1, 3, 3, 0, 0, 0, 0],
      [0, 2024, 1, 4, 3, 0, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper
    .raw_rule()
    .replace(interval=1)
    .iter()
    .to_array()
    .map(value => wrapper_reference_fields(@date.RRuleDateTime::naive(value))),
    [
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
      [0, 2024, 1, 3, 3, 0, 0, 0, 0],
      [0, 2024, 1, 4, 3, 0, 0, 0, 0],
    ],
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 1, 2, 3, 0, 0, 0, 0],
      [0, 2024, 1, 3, 3, 0, 0, 0, 0],
      [0, 2024, 1, 4, 3, 0, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 3L)
}

///|
test "rrulewrapper original 76 negative DST attach 2024-03-31T00:30:00 fold 0" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-31T00:30:00"),
      zone_neg,
      fold=false,
    ),
    count=6,
    timezone=zone_neg,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 31, 0, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 31, 0, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 31, 0, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 31, 0, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 31, 0, 30, 0, 0, 0],
      [1, 2024, 3, 31, 1, 30, 0, 0, 0],
      [1, 2024, 3, 31, 2, 30, 0, 0, 3600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 31, 0, 30, 0, 0, 0],
      [1, 2024, 3, 31, 1, 30, 0, 0, 0],
      [1, 2024, 3, 31, 2, 30, 0, 0, 3600],
      [1, 2024, 3, 31, 3, 30, 0, 0, 3600],
      [1, 2024, 3, 31, 4, 30, 0, 0, 3600],
      [1, 2024, 3, 31, 5, 30, 0, 0, 3600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 31, 0, 30, 0, 0, 0],
      [0, 2024, 3, 31, 1, 30, 0, 0, 0],
      [0, 2024, 3, 31, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 77 negative DST attach 2024-03-31T00:30:00 fold 1" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-31T00:30:00"),
      zone_neg,
      fold=true,
    ),
    count=6,
    timezone=zone_neg,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 31, 0, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 31, 0, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 31, 0, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 3, 31, 0, 30, 0, 0, 0])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 31, 0, 30, 0, 0, 0],
      [1, 2024, 3, 31, 1, 30, 0, 0, 0],
      [1, 2024, 3, 31, 2, 30, 0, 0, 3600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 3, 31, 0, 30, 0, 0, 0],
      [1, 2024, 3, 31, 1, 30, 0, 0, 0],
      [1, 2024, 3, 31, 2, 30, 0, 0, 3600],
      [1, 2024, 3, 31, 3, 30, 0, 0, 3600],
      [1, 2024, 3, 31, 4, 30, 0, 0, 3600],
      [1, 2024, 3, 31, 5, 30, 0, 0, 3600],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 3, 31, 0, 30, 0, 0, 0],
      [0, 2024, 3, 31, 1, 30, 0, 0, 0],
      [0, 2024, 3, 31, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 78 negative DST attach 2024-10-27T00:30:00 fold 0" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-10-27T00:30:00"),
      zone_neg,
      fold=false,
    ),
    count=6,
    timezone=zone_neg,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 27, 0, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 10, 27, 0, 30, 0, 0, 3600])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 10, 27, 0, 30, 0, 0, 3600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 10, 27, 0, 30, 0, 0, 3600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 10, 27, 0, 30, 0, 0, 3600],
      [1, 2024, 10, 27, 1, 30, 0, 0, 3600],
      [1, 2024, 10, 27, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 10, 27, 0, 30, 0, 0, 3600],
      [1, 2024, 10, 27, 1, 30, 0, 0, 3600],
      [1, 2024, 10, 27, 2, 30, 0, 0, 0],
      [1, 2024, 10, 27, 3, 30, 0, 0, 0],
      [1, 2024, 10, 27, 4, 30, 0, 0, 0],
      [1, 2024, 10, 27, 5, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 10, 27, 0, 30, 0, 0, 0],
      [0, 2024, 10, 27, 1, 30, 0, 0, 0],
      [0, 2024, 10, 27, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}

///|
test "rrulewrapper original 79 negative DST attach 2024-10-27T00:30:00 fold 1" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let calls = Ref(0)
  let times = [1781524800123L, 1781611200123L, 1781697600123L]
  let context = @date.DateParserContext::utc(clock=fn() {
    let index = Int32::min(calls.val, 2)
    calls.val += 1
    times[index]
  })
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-10-27T00:30:00"),
      zone_neg,
      fold=true,
    ),
    count=6,
    timezone=zone_neg,
    context~,
  )
  assert_eq(calls.val, 0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper.base_timezone() is Some(_), true)
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(wrapper.interval(), 1)
  assert_eq(wrapper.count_limit(), Some(6))
  assert_eq(wrapper.cache_enabled(), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 27, 0, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 10, 27, 0, 30, 0, 0, 3600])),
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 10, 27, 0, 30, 0, 0, 3600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .after(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some(Some([1, 2024, 10, 27, 0, 30, 0, 0, 3600])),
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .before(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    None,
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-10T02:30:00")),
        count=3,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 10, 27, 0, 30, 0, 0, 3600],
      [1, 2024, 10, 27, 1, 30, 0, 0, 3600],
      [1, 2024, 10, 27, 2, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .xafter(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        count=0,
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
        @date.RRuleDateTime::naive(@date.parse_iso("2027-01-01T00:00:00")),
        inc=true,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([
      [1, 2024, 10, 27, 0, 30, 0, 0, 3600],
      [1, 2024, 10, 27, 1, 30, 0, 0, 3600],
      [1, 2024, 10, 27, 2, 30, 0, 0, 0],
      [1, 2024, 10, 27, 3, 30, 0, 0, 0],
      [1, 2024, 10, 27, 4, 30, 0, 0, 0],
      [1, 2024, 10, 27, 5, 30, 0, 0, 0],
    ]),
  )
  assert_eq(
    Some(
      wrapper
      .between(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-01T00:00:00")),
        inc=false,
      )
      .map(wrapper_reference_fields),
    ) catch {
      _ => None
    },
    Some([]),
  )
  assert_eq(
    wrapper.raw_iter().take(3).to_array().map(wrapper_reference_fields),
    [
      [0, 2024, 10, 27, 0, 30, 0, 0, 0],
      [0, 2024, 10, 27, 1, 30, 0, 0, 0],
      [0, 2024, 10, 27, 2, 30, 0, 0, 0],
    ],
  )
  assert_eq(wrapper.occurrence_count(), 6L)
}
