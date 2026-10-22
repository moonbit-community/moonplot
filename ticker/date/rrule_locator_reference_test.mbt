// Generated original pinned RRuleLocator and rrulewrapper.

///|
test "RRuleLocator original 0 all frequencies 0 aware False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-1450.0, 1470.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:07:11.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2036-01-28T03:07:11.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19754.129988425924, 20485.129988425924, 21215.129988425924, 21946.129988425924,
      22676.129988425924, 23407.129988425924,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2012, 2, 1, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2048, 1, 25, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-1450.0, 1470.0))
  assert_eq(adapter.tick_values(19753.129989854813, 24133.129989854813), [
    19754.129988425924, 20485.129988425924, 21215.129988425924, 21946.129988425924,
    22676.129988425924, 23407.129988425924,
  ])
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2012, 2, 1, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2048, 1, 25, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-1450.0, 1470.0))
}

///|
test "RRuleLocator original 1 all frequencies 0 aware True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-1450.0, 1470.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:07:11.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("2036-01-28T03:07:11.123456+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19754.129988425924, 20485.129988425924, 21215.129988425924, 21946.129988425924,
      22676.129988425924, 23407.129988425924,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2012, 2, 1, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2048, 1, 25, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-1450.0, 1470.0))
  assert_eq(adapter.tick_values(19753.129989854813, 24133.129989854813), [
    19754.129988425924, 20485.129988425924, 21215.129988425924, 21946.129988425924,
    22676.129988425924, 23407.129988425924,
  ])
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2012, 2, 1, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2048, 1, 25, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-1450.0, 1470.0))
}

///|
test "RRuleLocator original 2 all frequencies 1 aware False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:07:11.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-11-26T03:07:11.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19757.129988425924, 19817.129988425924, 19878.129988425924, 19939.129988425924,
      20000.129988425924,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 4, 4, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 9, 21, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
  assert_eq(adapter.tick_values(19753.129989854813, 20053.129989854813), [
    19757.129988425924, 19817.129988425924, 19878.129988425924, 19939.129988425924,
    20000.129988425924,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 4, 4, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 9, 21, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
}

///|
test "RRuleLocator original 3 all frequencies 1 aware True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:07:11.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-11-26T03:07:11.123456+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19757.129988425924, 19817.129988425924, 19878.129988425924, 19939.129988425924,
      20000.129988425924,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 4, 4, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 9, 21, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
  assert_eq(adapter.tick_values(19753.129989854813, 20053.129989854813), [
    19757.129988425924, 19817.129988425924, 19878.129988425924, 19939.129988425924,
    20000.129988425924,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 4, 4, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2025, 9, 21, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
}

///|
test "RRuleLocator original 4 all frequencies 2 aware False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-18.0, 38.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:07:11.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-03-31T03:07:11.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19761.129988425924, 19775.129988425924, 19789.129988425924, 19803.129988425924,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 11, 30, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 31, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-18.0, 38.0))
  assert_eq(adapter.tick_values(19753.129989854813, 19813.129989854813), [
    19761.129988425924, 19775.129988425924, 19789.129988425924, 19803.129988425924,
  ])
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 11, 30, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 31, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-18.0, 38.0))
}

///|
test "RRuleLocator original 5 all frequencies 2 aware True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-18.0, 38.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:07:11.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-03-31T03:07:11.123456+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19761.129988425924, 19775.129988425924, 19789.129988425924, 19803.129988425924,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 11, 30, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 31, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-18.0, 38.0))
  assert_eq(adapter.tick_values(19753.129989854813, 19813.129989854813), [
    19761.129988425924, 19775.129988425924, 19789.129988425924, 19803.129988425924,
  ])
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 11, 30, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 31, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-18.0, 38.0))
}

///|
test "RRuleLocator original 6 all frequencies 3 aware False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:07:11.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-02-14T03:07:11.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19755.129988425924, 19757.129988425924, 19759.129988425924, 19761.129988425924,
      19763.129988425924, 19765.129988425924, 19767.129988425924,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 17, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 28, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(adapter.tick_values(19753.129989854813, 19767.129989854813), [
    19755.129988425924, 19757.129988425924, 19759.129988425924, 19761.129988425924,
    19763.129988425924, 19765.129988425924, 19767.129988425924,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 17, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 28, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
}

///|
test "RRuleLocator original 7 all frequencies 3 aware True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:07:11.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-02-14T03:07:11.123456+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19755.129988425924, 19757.129988425924, 19759.129988425924, 19761.129988425924,
      19763.129988425924, 19765.129988425924, 19767.129988425924,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 17, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 28, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(adapter.tick_values(19753.129989854813, 19767.129989854813), [
    19755.129988425924, 19757.129988425924, 19759.129988425924, 19761.129988425924,
    19763.129988425924, 19765.129988425924, 19767.129988425924,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 17, 3, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 28, 3, 7, 11, 123456, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
}

///|
test "RRuleLocator original 8 all frequencies 4 aware False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:07:11.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T14:07:11.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19753.171655092592, 19753.254988425924, 19753.33832175926, 19753.421655092592,
      19753.504988425924, 19753.58832175926,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 30, 16, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 1, 1, 7, 11, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(adapter.tick_values(19753.129989854813, 19753.58832318815), [
    19753.171655092592, 19753.254988425924, 19753.33832175926, 19753.421655092592,
    19753.504988425924, 19753.58832175926,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 30, 16, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 1, 1, 7, 11, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
}

///|
test "RRuleLocator original 9 all frequencies 4 aware True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:07:11.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T14:07:11.123456+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19753.171655092592, 19753.254988425924, 19753.33832175926, 19753.421655092592,
      19753.504988425924, 19753.58832175926,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 30, 16, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 1, 1, 7, 11, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(adapter.tick_values(19753.129989854813, 19753.58832318815), [
    19753.171655092592, 19753.254988425924, 19753.33832175926, 19753.421655092592,
    19753.504988425924, 19753.58832175926,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 30, 16, 7, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 2, 1, 1, 7, 11, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
}

///|
test "RRuleLocator original 10 all frequencies 5 aware False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Minutely,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Minutely)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.0006944444444444445)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.997222222222222, 10.002777777777778),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:07:11.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:18:11.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19753.13068287037, 19753.13207175926, 19753.133460648147, 19753.134849537037,
      19753.136238425926, 19753.137627314816,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Minutely)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.0006944444444444445)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 31, 2, 56, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 31, 3, 29, 11, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.997222222222222, 10.002777777777778),
  )
  assert_eq(adapter.tick_values(19753.129989854813, 19753.137628743705), [
    19753.13068287037, 19753.13207175926, 19753.133460648147, 19753.134849537037,
    19753.136238425926, 19753.137627314816,
  ])
  assert_true(wrapper.frequency() is @date.Minutely)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.0006944444444444445)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 31, 2, 56, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 31, 3, 29, 11, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.997222222222222, 10.002777777777778),
  )
}

///|
test "RRuleLocator original 11 all frequencies 5 aware True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Minutely,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Minutely)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.0006944444444444445)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.997222222222222, 10.002777777777778),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:07:11.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:18:11.123456+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19753.13068287037, 19753.13207175926, 19753.133460648147, 19753.134849537037,
      19753.136238425926, 19753.137627314816,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Minutely)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.0006944444444444445)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 31, 2, 56, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 31, 3, 29, 11, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.997222222222222, 10.002777777777778),
  )
  assert_eq(adapter.tick_values(19753.129989854813, 19753.137628743705), [
    19753.13068287037, 19753.13207175926, 19753.133460648147, 19753.134849537037,
    19753.136238425926, 19753.137627314816,
  ])
  assert_true(wrapper.frequency() is @date.Minutely)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.0006944444444444445)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 31, 2, 56, 11, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 31, 3, 29, 11, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.997222222222222, 10.002777777777778),
  )
}

///|
test "RRuleLocator original 12 all frequencies 6 aware False" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Secondly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999953703703703, 10.000046296296297),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:07:11.123456"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-31T03:07:22.123456"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19753.13, 19753.130023148147, 19753.130046296297, 19753.130069444444, 19753.130092592593,
      19753.13011574074,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 31, 3, 7, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 31, 3, 7, 33, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999953703703703, 10.000046296296297),
  )
  assert_eq(adapter.tick_values(19753.129989854813, 19753.13011716963), [
    19753.13, 19753.130023148147, 19753.130046296297, 19753.130069444444, 19753.130092592593,
    19753.13011574074,
  ])
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 31, 3, 7, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 31, 3, 7, 33, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999953703703703, 10.000046296296297),
  )
}

///|
test "RRuleLocator original 13 all frequencies 6 aware True" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Secondly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999953703703703, 10.000046296296297),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:07:11.123456+00:00"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("2024-01-31T03:07:22.123456+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19753.13, 19753.130023148147, 19753.130046296297, 19753.130069444444, 19753.130092592593,
      19753.13011574074,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 31, 3, 7, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 31, 3, 7, 33, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999953703703703, 10.000046296296297),
  )
  assert_eq(adapter.tick_values(19753.129989854813, 19753.13011716963), [
    19753.13, 19753.130023148147, 19753.130046296297, 19753.130069444444, 19753.130092592593,
    19753.13011574074,
  ])
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 31, 3, 7, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 31, 3, 7, 33, 123456, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999953703703703, 10.000046296296297),
  )
}

///|
test "RRuleLocator original 14 calendar expansion 2024-01-31/2024-02-29" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-31")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-02-29")),
      ),
    ) catch {
      _ => None
    },
    Some([19753.0, 19782.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(19753.0, 19782.0), [19753.0, 19782.0])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 15 calendar expansion 2024-02-29/2024-01-31" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-02-29")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-31")),
      ),
    ) catch {
      _ => None
    },
    Some([19782.0, 19753.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 29, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 2, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(19782.0, 19753.0), [19782.0, 19753.0])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 31, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 16 calendar expansion 2023-01-31/2023-03-01" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-31")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-03-01")),
      ),
    ) catch {
      _ => None
    },
    Some([19388.0, 19417.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2023, 4, 2, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(19388.0, 19417.0), [19388.0, 19417.0])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2023, 4, 2, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 17 calendar expansion 2023-03-01/2023-01-31" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2023-03-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2023-01-31")),
      ),
    ) catch {
      _ => None
    },
    Some([19417.0, 19388.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 4, 2, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2022, 12, 30, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(19417.0, 19388.0), [19417.0, 19388.0])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2023, 4, 2, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 18 calendar expansion 2024-02-28T23:30/2024-03-31T00:15" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-02-28T23:30")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-31T00:15")),
      ),
    ) catch {
      _ => None
    },
    Some([19781.979166666668, 19813.010416666668]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 26, 22, 45, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 2, 1, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(19781.979166666668, 19813.010416666668), [
    19781.979166666668, 19813.010416666668,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 26, 22, 45, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 2, 1, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 19 calendar expansion 2024-03-31T00:15/2024-02-28T23:30" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-03-31T00:15")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-02-28T23:30")),
      ),
    ) catch {
      _ => None
    },
    Some([19813.010416666668, 19781.979166666668]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 4, 30, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 28, 22, 45, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(19813.010416666668, 19781.979166666668), [
    19813.010416666668, 19781.979166666668,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 26, 22, 45, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 5, 2, 1, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 20 calendar expansion 1900-02-28/1900-03-31" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1900-02-28")),
        @date.RRuleDateTime::naive(@date.parse_iso("1900-03-31")),
      ),
    ) catch {
      _ => None
    },
    Some([-25509.0, -25478.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 25, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 5, 3, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(-25509.0, -25478.0), [-25509.0, -25478.0])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 25, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 5, 3, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 21 calendar expansion 1900-03-31/1900-02-28" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("1900-03-31")),
        @date.RRuleDateTime::naive(@date.parse_iso("1900-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([-25478.0, -25509.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 4, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 28, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(-25478.0, -25509.0), [-25478.0, -25509.0])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1900, 1, 25, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 5, 3, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 22 calendar expansion 2000-02-29/2005-02-28" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2000-02-29")),
        @date.RRuleDateTime::naive(@date.parse_iso("2005-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([
      11105.0, 11197.0, 11289.0, 11381.0, 11470.0, 11562.0, 11654.0, 11746.0, 11835.0,
      11927.0, 12019.0, 12111.0, 12200.0, 12292.0, 12384.0, 12476.0, 12566.0, 12658.0,
      12750.0, 12842.0,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1995, 2, 28, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2010, 2, 28, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(11016.0, 12842.0), [
    11105.0, 11197.0, 11289.0, 11381.0, 11470.0, 11562.0, 11654.0, 11746.0, 11835.0,
    11927.0, 12019.0, 12111.0, 12200.0, 12292.0, 12384.0, 12476.0, 12566.0, 12658.0,
    12750.0, 12842.0,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1995, 2, 28, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2010, 2, 28, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 23 calendar expansion 2005-02-28/2000-02-29" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2005-02-28")),
        @date.RRuleDateTime::naive(@date.parse_iso("2000-02-29")),
      ),
    ) catch {
      _ => None
    },
    Some([12842.0, 11016.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2010, 2, 25, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1995, 3, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
  assert_eq(adapter.tick_values(12842.0, 11016.0), [
    12842.0, 12750.0, 12658.0, 12566.0, 12476.0, 12384.0, 12292.0, 12200.0, 12111.0,
    12019.0, 11927.0, 11835.0, 11746.0, 11654.0, 11562.0, 11470.0, 11381.0, 11289.0,
    11197.0, 11105.0,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1995, 2, 28, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2010, 2, 28, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-170.0, 190.0))
}

///|
test "RRuleLocator original 24 filters {'count': 0}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    count=0,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 19843.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [19723.0, 19843.5])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 25 filters {'count': -1}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    count=-1,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 19843.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [19723.0, 19843.5])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 26 filters {'count': 1}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    count=1,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 19843.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [19723.0, 19843.5])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 27 filters {'count': 3}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    count=3,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 19843.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [19723.0, 19843.5])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 28 filters {'byhour': [12]}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byhour=[12],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      19723.5, 19724.5, 19725.5, 19726.5, 19727.5, 19728.5, 19729.5, 19730.5, 19731.5,
      19732.5, 19733.5, 19734.5, 19735.5, 19736.5, 19737.5, 19738.5, 19739.5, 19740.5,
      19741.5, 19742.5, 19743.5, 19744.5, 19745.5, 19746.5, 19747.5, 19748.5, 19749.5,
      19750.5, 19751.5, 19752.5, 19753.5, 19754.5, 19755.5, 19756.5, 19757.5, 19758.5,
      19759.5, 19760.5, 19761.5, 19762.5, 19763.5, 19764.5, 19765.5, 19766.5, 19767.5,
      19768.5, 19769.5, 19770.5, 19771.5, 19772.5, 19773.5, 19774.5, 19775.5, 19776.5,
      19777.5, 19778.5, 19779.5, 19780.5, 19781.5, 19782.5, 19783.5, 19784.5, 19785.5,
      19786.5, 19787.5, 19788.5, 19789.5, 19790.5, 19791.5, 19792.5, 19793.5, 19794.5,
      19795.5, 19796.5, 19797.5, 19798.5, 19799.5, 19800.5, 19801.5, 19802.5, 19803.5,
      19804.5, 19805.5, 19806.5, 19807.5, 19808.5, 19809.5, 19810.5, 19811.5, 19812.5,
      19813.5, 19814.5, 19815.5, 19816.5, 19817.5, 19818.5, 19819.5, 19820.5, 19821.5,
      19822.5, 19823.5, 19824.5, 19825.5, 19826.5, 19827.5, 19828.5, 19829.5, 19830.5,
      19831.5, 19832.5, 19833.5, 19834.5, 19835.5, 19836.5, 19837.5, 19838.5, 19839.5,
      19840.5, 19841.5, 19842.5, 19843.5,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [
    19723.5, 19724.5, 19725.5, 19726.5, 19727.5, 19728.5, 19729.5, 19730.5, 19731.5,
    19732.5, 19733.5, 19734.5, 19735.5, 19736.5, 19737.5, 19738.5, 19739.5, 19740.5,
    19741.5, 19742.5, 19743.5, 19744.5, 19745.5, 19746.5, 19747.5, 19748.5, 19749.5,
    19750.5, 19751.5, 19752.5, 19753.5, 19754.5, 19755.5, 19756.5, 19757.5, 19758.5,
    19759.5, 19760.5, 19761.5, 19762.5, 19763.5, 19764.5, 19765.5, 19766.5, 19767.5,
    19768.5, 19769.5, 19770.5, 19771.5, 19772.5, 19773.5, 19774.5, 19775.5, 19776.5,
    19777.5, 19778.5, 19779.5, 19780.5, 19781.5, 19782.5, 19783.5, 19784.5, 19785.5,
    19786.5, 19787.5, 19788.5, 19789.5, 19790.5, 19791.5, 19792.5, 19793.5, 19794.5,
    19795.5, 19796.5, 19797.5, 19798.5, 19799.5, 19800.5, 19801.5, 19802.5, 19803.5,
    19804.5, 19805.5, 19806.5, 19807.5, 19808.5, 19809.5, 19810.5, 19811.5, 19812.5,
    19813.5, 19814.5, 19815.5, 19816.5, 19817.5, 19818.5, 19819.5, 19820.5, 19821.5,
    19822.5, 19823.5, 19824.5, 19825.5, 19826.5, 19827.5, 19828.5, 19829.5, 19830.5,
    19831.5, 19832.5, 19833.5, 19834.5, 19835.5, 19836.5, 19837.5, 19838.5, 19839.5,
    19840.5, 19841.5, 19842.5, 19843.5,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 29 filters {'bymonth': [2], 'bymonthday': [30]}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    bymonth=[2],
    bymonthday=[30],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 19843.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [19723.0, 19843.5])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 30 filters {'byweekday': [0, 4], 'bysetpos': [-1]}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekday=[0, 4],
    bysetpos=[-1],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([
      19723.5, 19727.5, 19730.5, 19734.5, 19737.5, 19741.5, 19744.5, 19748.5, 19751.5,
      19755.5, 19758.5, 19762.5, 19765.5, 19769.5, 19772.5, 19776.5, 19779.5, 19783.5,
      19786.5, 19790.5, 19793.5, 19797.5, 19800.5, 19804.5, 19807.5, 19811.5, 19814.5,
      19818.5, 19821.5, 19825.5, 19828.5, 19832.5, 19835.5, 19839.5, 19842.5,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [
    19723.5, 19727.5, 19730.5, 19734.5, 19737.5, 19741.5, 19744.5, 19748.5, 19751.5,
    19755.5, 19758.5, 19762.5, 19765.5, 19769.5, 19772.5, 19776.5, 19779.5, 19783.5,
    19786.5, 19790.5, 19793.5, 19797.5, 19800.5, 19804.5, 19807.5, 19811.5, 19814.5,
    19818.5, 19821.5, 19825.5, 19828.5, 19832.5, 19835.5, 19839.5, 19842.5,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 31 filters {'byyearday': [60, -1]}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byyearday=[60, -1],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19782.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [19782.5])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 32 filters {'byweekno': [1, -1]}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekno=[1, -1],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.5, 19724.5, 19725.5, 19726.5, 19727.5, 19728.5, 19729.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [
    19723.5, 19724.5, 19725.5, 19726.5, 19727.5, 19728.5, 19729.5,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 33 filters {'byeaster': [0]}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byeaster=[0],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19813.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [19813.5])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 34 filters {'bymonthday': [-1]}" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    bymonthday=[-1],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-04-30T12:00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19753.5, 19782.5, 19813.5, 19843.5]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19843.5), [
    19753.5, 19782.5, 19813.5, 19843.5,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 9, 1, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 8, 29, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 35 ordinal 0 [[0, 2]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[@date.RelativeWeekday::new(0, nth=2)],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([19730.0, 19765.0, 19793.0, 20101.0, 20129.0]),
  )
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19730.0, 19765.0, 19793.0, 20101.0, 20129.0,
  ])
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
}

///|
test "RRuleLocator original 36 ordinal 0 [[4, -1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[@date.RelativeWeekday::new(4, nth=-1)],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([19748.0, 19776.0, 19811.0, 20119.0, 20147.0]),
  )
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19748.0, 19776.0, 19811.0, 20119.0, 20147.0,
  ])
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
}

///|
test "RRuleLocator original 37 ordinal 0 [[0, None], [1, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Yearly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[
      @date.RelativeWeekday::new(0),
      @date.RelativeWeekday::new(1, nth=1),
    ],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 20147.0]),
  )
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [19723.0, 20147.0])
  assert_true(wrapper.frequency() is @date.Yearly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 365.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-720.0, 740.0))
}

///|
test "RRuleLocator original 38 ordinal 1 [[0, 2]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[@date.RelativeWeekday::new(0, nth=2)],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([19730.0, 19765.0, 19793.0, 20101.0, 20129.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19730.0, 19765.0, 19793.0, 20101.0, 20129.0,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
}

///|
test "RRuleLocator original 39 ordinal 1 [[4, -1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[@date.RelativeWeekday::new(4, nth=-1)],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([19748.0, 19776.0, 19811.0, 20119.0, 20147.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19748.0, 19776.0, 19811.0, 20119.0, 20147.0,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
}

///|
test "RRuleLocator original 40 ordinal 1 [[0, None], [1, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Monthly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[
      @date.RelativeWeekday::new(0),
      @date.RelativeWeekday::new(1, nth=1),
    ],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0, 20147.0]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [19723.0, 20147.0])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-50.0, 70.0))
}

///|
test "RRuleLocator original 41 ordinal 2 [[0, 2]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[@date.RelativeWeekday::new(0, nth=2)],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([
      19723.0, 19730.0, 19737.0, 19744.0, 19751.0, 19758.0, 19765.0, 19772.0, 19779.0,
      19786.0, 19793.0, 19800.0, 19807.0, 20094.0, 20101.0, 20108.0, 20115.0, 20122.0,
      20129.0, 20136.0, 20143.0,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19723.0, 19730.0, 19737.0, 19744.0, 19751.0, 19758.0, 19765.0, 19772.0, 19779.0,
    19786.0, 19793.0, 19800.0, 19807.0, 20094.0, 20101.0, 20108.0, 20115.0, 20122.0,
    20129.0, 20136.0, 20143.0,
  ])
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
}

///|
test "RRuleLocator original 42 ordinal 2 [[4, -1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[@date.RelativeWeekday::new(4, nth=-1)],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([
      19727.0, 19734.0, 19741.0, 19748.0, 19755.0, 19762.0, 19769.0, 19776.0, 19783.0,
      19790.0, 19797.0, 19804.0, 19811.0, 20091.0, 20098.0, 20105.0, 20112.0, 20119.0,
      20126.0, 20133.0, 20140.0, 20147.0,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19727.0, 19734.0, 19741.0, 19748.0, 19755.0, 19762.0, 19769.0, 19776.0, 19783.0,
    19790.0, 19797.0, 19804.0, 19811.0, 20091.0, 20098.0, 20105.0, 20112.0, 20119.0,
    20126.0, 20133.0, 20140.0, 20147.0,
  ])
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
}

///|
test "RRuleLocator original 43 ordinal 2 [[0, None], [1, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Weekly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[
      @date.RelativeWeekday::new(0),
      @date.RelativeWeekday::new(1, nth=1),
    ],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([
      19723.0, 19724.0, 19730.0, 19731.0, 19737.0, 19738.0, 19744.0, 19745.0, 19751.0,
      19752.0, 19758.0, 19759.0, 19765.0, 19766.0, 19772.0, 19773.0, 19779.0, 19780.0,
      19786.0, 19787.0, 19793.0, 19794.0, 19800.0, 19801.0, 19807.0, 19808.0, 20094.0,
      20095.0, 20101.0, 20102.0, 20108.0, 20109.0, 20115.0, 20116.0, 20122.0, 20123.0,
      20129.0, 20130.0, 20136.0, 20137.0, 20143.0, 20144.0,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19723.0, 19724.0, 19730.0, 19731.0, 19737.0, 19738.0, 19744.0, 19745.0, 19751.0,
    19752.0, 19758.0, 19759.0, 19765.0, 19766.0, 19772.0, 19773.0, 19779.0, 19780.0,
    19786.0, 19787.0, 19793.0, 19794.0, 19800.0, 19801.0, 19807.0, 19808.0, 20094.0,
    20095.0, 20101.0, 20102.0, 20108.0, 20109.0, 20115.0, 20116.0, 20122.0, 20123.0,
    20129.0, 20130.0, 20136.0, 20137.0, 20143.0, 20144.0,
  ])
  assert_true(wrapper.frequency() is @date.Weekly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 7.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-4.0, 24.0))
}

///|
test "RRuleLocator original 44 ordinal 3 [[0, 2]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[@date.RelativeWeekday::new(0, nth=2)],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([
      19723.0, 19730.0, 19737.0, 19744.0, 19751.0, 19758.0, 19765.0, 19772.0, 19779.0,
      19786.0, 19793.0, 19800.0, 19807.0, 20094.0, 20101.0, 20108.0, 20115.0, 20122.0,
      20129.0, 20136.0, 20143.0,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19723.0, 19730.0, 19737.0, 19744.0, 19751.0, 19758.0, 19765.0, 19772.0, 19779.0,
    19786.0, 19793.0, 19800.0, 19807.0, 20094.0, 20101.0, 20108.0, 20115.0, 20122.0,
    20129.0, 20136.0, 20143.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 45 ordinal 3 [[4, -1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[@date.RelativeWeekday::new(4, nth=-1)],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([
      19727.0, 19734.0, 19741.0, 19748.0, 19755.0, 19762.0, 19769.0, 19776.0, 19783.0,
      19790.0, 19797.0, 19804.0, 19811.0, 20091.0, 20098.0, 20105.0, 20112.0, 20119.0,
      20126.0, 20133.0, 20140.0, 20147.0,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19727.0, 19734.0, 19741.0, 19748.0, 19755.0, 19762.0, 19769.0, 19776.0, 19783.0,
    19790.0, 19797.0, 19804.0, 19811.0, 20091.0, 20098.0, 20105.0, 20112.0, 20119.0,
    20126.0, 20133.0, 20140.0, 20147.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 46 ordinal 3 [[0, None], [1, 1]]" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    byweekdays=[
      @date.RelativeWeekday::new(0),
      @date.RelativeWeekday::new(1, nth=1),
    ],
    bymonth=[1, 2, 3],
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2025-02-28")),
      ),
    ) catch {
      _ => None
    },
    Some([
      19723.0, 19724.0, 19730.0, 19731.0, 19737.0, 19738.0, 19744.0, 19745.0, 19751.0,
      19752.0, 19758.0, 19759.0, 19765.0, 19766.0, 19772.0, 19773.0, 19779.0, 19780.0,
      19786.0, 19787.0, 19793.0, 19794.0, 19800.0, 19801.0, 19807.0, 19808.0, 20094.0,
      20095.0, 20101.0, 20102.0, 20108.0, 20109.0, 20115.0, 20116.0, 20122.0, 20123.0,
      20129.0, 20130.0, 20136.0, 20137.0, 20143.0, 20144.0,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 20147.0), [
    19723.0, 19724.0, 19730.0, 19731.0, 19737.0, 19738.0, 19744.0, 19745.0, 19751.0,
    19752.0, 19758.0, 19759.0, 19765.0, 19766.0, 19772.0, 19773.0, 19779.0, 19780.0,
    19786.0, 19787.0, 19793.0, 19794.0, 19800.0, 19801.0, 19807.0, 19808.0, 20094.0,
    20095.0, 20101.0, 20102.0, 20108.0, 20109.0, 20115.0, 20116.0, 20122.0, 20123.0,
    20129.0, 20130.0, 20136.0, 20137.0, 20143.0, 20144.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2022, 11, 4, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2026, 4, 24, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 47 zones NY base None display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T05:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19792.208333333332, 19792.25, 19792.25, 19792.291666666668, 19792.333333333332,
      19792.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 19, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 10, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19792.208333333332, 19792.375), [
    19792.208333333332, 19792.25, 19792.291666666668, 19792.333333333332, 19792.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 10, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 13, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 48 zones NY base None display NY" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_ny)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T05:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19792.208333333332, 19792.25, 19792.25, 19792.291666666668, 19792.333333333332,
      19792.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 19, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 10, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19792.208333333332, 19792.375), [
    19792.208333333332, 19792.25, 19792.25, 19792.291666666668, 19792.333333333332,
    19792.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 19, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 10, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 49 zones NY base NY display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_ny,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T05:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19792.208333333332, 19792.25, 19792.25, 19792.291666666668, 19792.333333333332,
      19792.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 19, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 10, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19792.208333333332, 19792.375), [
    19792.208333333332, 19792.25, 19792.25, 19792.291666666668, 19792.333333333332,
    19792.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 9, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 50 zones NY base NY display NY" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_ny,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_ny)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T05:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19792.208333333332, 19792.25, 19792.25, 19792.291666666668, 19792.333333333332,
      19792.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 19, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 10, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19792.208333333332, 19792.375), [
    19792.208333333332, 19792.25, 19792.25, 19792.291666666668, 19792.333333333332,
    19792.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 9, 19, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 10, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 51 zones NY base UTC display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T05:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19792.208333333332, 19792.25, 19792.291666666668, 19792.333333333332, 19792.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 10, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 14, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19792.208333333332, 19792.375), [
    19792.208333333332, 19792.25, 19792.291666666668, 19792.333333333332, 19792.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 10, 1, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 13, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 52 zones NY base UTC display NY" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_ny)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-10T05:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19792.208333333332, 19792.25, 19792.291666666668, 19792.333333333332, 19792.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 10, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 14, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19792.208333333332, 19792.375), [
    19792.208333333332, 19792.25, 19792.291666666668, 19792.333333333332, 19792.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 10, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 10, 14, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 53 zones NY base None display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T04:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
      20030.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20030.166666666668, 20030.375), [
    20030.166666666668, 20030.208333333332, 20030.25, 20030.291666666668, 20030.333333333332,
    20030.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 14, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 54 zones NY base None display NY" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_ny)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T04:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
      20030.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20030.166666666668, 20030.375), [
    20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
    20030.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 55 zones NY base NY display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_ny,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T04:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
      20030.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20030.166666666668, 20030.375), [
    20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
    20030.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 19, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 9, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 56 zones NY base NY display NY" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_ny,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_ny)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T04:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
      20030.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20030.166666666668, 20030.375), [
    20030.166666666668, 20030.208333333332, 20030.291666666668, 20030.333333333332,
    20030.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 57 zones NY base UTC display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T04:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20030.166666666668, 20030.208333333332, 20030.25, 20030.291666666668, 20030.333333333332,
      20030.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 13, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20030.166666666668, 20030.375), [
    20030.166666666668, 20030.208333333332, 20030.25, 20030.291666666668, 20030.333333333332,
    20030.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 2, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 14, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 58 zones NY base UTC display NY" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_ny)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T00:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-11-03T04:00:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      20030.166666666668, 20030.208333333332, 20030.25, 20030.291666666668, 20030.333333333332,
      20030.375,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 13, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20030.166666666668, 20030.375), [
    20030.166666666668, 20030.208333333332, 20030.25, 20030.291666666668, 20030.333333333332,
    20030.375,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 11, 3, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 11, 3, 13, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 59 zones LH base None display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T01:00:00"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T04:00:00"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20001.604166666668, 20001.625, 20001.666666666668, 20001.708333333332]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 22, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20001.604166666668, 20001.708333333332), [
    20001.625, 20001.666666666668, 20001.708333333332,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 5, 19, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 60 zones LH base None display LH" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_lh)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T01:00:00"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T04:00:00"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20001.604166666668, 20001.625, 20001.666666666668, 20001.708333333332]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 22, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20001.604166666668, 20001.708333333332), [
    20001.604166666668, 20001.625, 20001.666666666668, 20001.708333333332,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 22, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 61 zones LH base LH display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_lh,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T01:00:00"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T04:00:00"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20001.604166666668, 20001.625, 20001.666666666668, 20001.708333333332]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 22, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20001.604166666668, 20001.708333333332), [
    20001.625, 20001.645833333332, 20001.6875,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 22, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 6, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 62 zones LH base LH display LH" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_lh,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_lh)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T01:00:00"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T04:00:00"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20001.604166666668, 20001.625, 20001.666666666668, 20001.708333333332]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 22, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20001.604166666668, 20001.708333333332), [
    20001.604166666668, 20001.625, 20001.666666666668, 20001.708333333332,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 22, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 6, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 63 zones LH base UTC display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T01:00:00"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T04:00:00"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20001.604166666668, 20001.645833333332, 20001.6875]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 11, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 5, 20, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20001.604166666668, 20001.708333333332), [
    20001.625, 20001.666666666668, 20001.708333333332,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 12, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 5, 19, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 64 zones LH base UTC display LH" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_lh = @date.get_timezone(name="D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_lh)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T01:00:00"),
          zone_lh,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-10-06T04:00:00"),
          zone_lh,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([20001.604166666668, 20001.645833333332, 20001.6875]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 11, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 5, 20, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(20001.604166666668, 20001.708333333332), [
    20001.604166666668, 20001.645833333332, 20001.6875,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 10, 5, 11, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 10, 5, 20, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 65 zones NEG base None display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T00:00:00"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T04:00:00"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19813.0, 19813.041666666668, 19813.041666666668, 19813.083333333332, 19813.125,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19813.0, 19813.125), [
    19813.0, 19813.041666666668, 19813.083333333332, 19813.125,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 21, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 6, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 66 zones NEG base None display NEG" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_neg)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T00:00:00"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T04:00:00"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19813.0, 19813.041666666668, 19813.041666666668, 19813.083333333332, 19813.125,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19813.0, 19813.125), [
    19813.0, 19813.041666666668, 19813.041666666668, 19813.083333333332, 19813.125,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 67 zones NEG base NEG display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_neg,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T00:00:00"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T04:00:00"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19813.0, 19813.041666666668, 19813.041666666668, 19813.083333333332, 19813.125,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19813.0, 19813.125), [
    19813.0, 19813.041666666668, 19813.041666666668, 19813.083333333332, 19813.125,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 21, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 68 zones NEG base NEG display NEG" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_neg,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_neg)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T00:00:00"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T04:00:00"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19813.0, 19813.041666666668, 19813.041666666668, 19813.083333333332, 19813.125,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19813.0, 19813.125), [
    19813.0, 19813.041666666668, 19813.041666666668, 19813.083333333332, 19813.125,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 8, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 69 zones NEG base UTC display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T00:00:00"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T04:00:00"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19813.0, 19813.041666666668, 19813.083333333332, 19813.125]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19813.0, 19813.125), [
    19813.0, 19813.041666666668, 19813.083333333332, 19813.125,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 21, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 6, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 70 zones NEG base UTC display NEG" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_neg = @date.get_timezone(name="IST-1GMT0,M10.5.0/2,M3.5.0/1")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_neg)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T00:00:00"),
          zone_neg,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-31T04:00:00"),
          zone_neg,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19813.0, 19813.041666666668, 19813.083333333332, 19813.125]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(19813.0, 19813.125), [
    19813.0, 19813.041666666668, 19813.083333333332, 19813.125,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 30, 20, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 31, 7, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 71 zones FIX base None display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-03"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
      -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
      -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
      -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
      -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
      -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
      -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
      -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
      -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
      -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
      -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
      -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
      -25565.006493055556,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -25565.006493055556), [
    -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
    -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
    -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
    -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
    -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
    -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
    -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
    -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
    -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
    -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
    -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
    -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
    -25565.006493055556,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 29, 23, 50, 39, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 4, 23, 50, 39, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 72 zones FIX base None display FIX" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_fix)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-03"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
      -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
      -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
      -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
      -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
      -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
      -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
      -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
      -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
      -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
      -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
      -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
      -25565.006493055556,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -25565.006493055556), [
    -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
    -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
    -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
    -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
    -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
    -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
    -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
    -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
    -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
    -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
    -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
    -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
    -25565.006493055556,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 73 zones FIX base FIX display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_fix,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-03"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
      -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
      -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
      -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
      -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
      -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
      -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
      -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
      -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
      -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
      -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
      -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
      -25565.006493055556,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -25565.006493055556), [
    -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
    -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
    -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
    -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
    -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
    -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
    -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
    -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
    -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
    -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
    -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
    -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
    -25565.006493055556,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 74 zones FIX base FIX display FIX" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_fix,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_fix)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-03"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
      -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
      -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
      -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
      -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
      -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
      -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
      -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
      -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
      -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
      -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
      -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
      -25565.006493055556,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -25565.006493055556), [
    -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
    -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
    -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
    -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
    -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
    -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
    -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
    -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
    -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
    -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
    -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
    -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
    -25565.006493055556,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 75 zones FIX base UTC display UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-03"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
      -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
      -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
      -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
      -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
      -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
      -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
      -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
      -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
      -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
      -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
      -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
      -25565.006493055556,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 29, 23, 50, 39, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 4, 23, 50, 39, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -25565.006493055556), [
    -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
    -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
    -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
    -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
    -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
    -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
    -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
    -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
    -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
    -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
    -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
    -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
    -25565.006493055556,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 29, 23, 50, 39, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 4, 23, 50, 39, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 76 zones FIX base UTC display FIX" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_fix = @date.fixed_timezone_seconds(561)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Hourly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_fix)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-01"),
          zone_fix,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("1900-01-03"),
          zone_fix,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
      -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
      -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
      -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
      -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
      -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
      -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
      -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
      -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
      -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
      -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
      -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
      -25565.006493055556,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 29, 23, 50, 39, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 4, 23, 50, 39, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
  assert_eq(adapter.tick_values(-25567.006493055556, -25565.006493055556), [
    -25567.006493055556, -25566.96482638889, -25566.92315972222, -25566.881493055556,
    -25566.83982638889, -25566.79815972222, -25566.756493055556, -25566.71482638889,
    -25566.67315972222, -25566.631493055556, -25566.58982638889, -25566.54815972222,
    -25566.506493055556, -25566.46482638889, -25566.42315972222, -25566.381493055556,
    -25566.33982638889, -25566.29815972222, -25566.256493055556, -25566.21482638889,
    -25566.17315972222, -25566.131493055556, -25566.08982638889, -25566.04815972222,
    -25566.006493055556, -25565.96482638889, -25565.92315972222, -25565.881493055556,
    -25565.83982638889, -25565.79815972222, -25565.756493055556, -25565.71482638889,
    -25565.67315972222, -25565.631493055556, -25565.58982638889, -25565.54815972222,
    -25565.506493055556, -25565.46482638889, -25565.42315972222, -25565.381493055556,
    -25565.33982638889, -25565.29815972222, -25565.256493055556, -25565.21482638889,
    -25565.17315972222, -25565.131493055556, -25565.08982638889, -25565.04815972222,
    -25565.006493055556,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 29, 23, 50, 39, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 4, 23, 50, 39, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.916666666666666, 10.083333333333334),
  )
}

///|
test "RRuleLocator original 77 mixed zones 2024-01-01T00:00:00+23:00/2023-12-31T00:00:00-23:00" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("2024-01-01T00:00:00+23:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("2023-12-31T00:00:00-23:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19722.041666666668, 19722.958333333332]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 31, 2, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 2, 20, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(adapter.tick_values(19722.041666666668, 19722.958333333332), [
    19722.041666666668, 19722.958333333332,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 30, 3, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 21, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
}

///|
test "RRuleLocator original 78 mixed zones 1900-01-01T00:00:00+00:09:21/1900-01-02T00:00:00-04:56:02" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(
          @date.parse_iso("1900-01-01T00:00:00+00:09:21"),
        ),
        @date.RRuleDateTime::aware(
          @date.parse_iso("1900-01-02T00:00:00-04:56:02"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-25566.218564814815]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 18, 54, 37, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 3, 10, 10, 46, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(adapter.tick_values(-25567.006493055556, -25565.794421296298), [
    -25566.218564814815,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1899, 12, 30, 18, 45, 16, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1900, 1, 3, 10, 1, 25, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
}

///|
test "RRuleLocator original 79 mixed zones 2024-03-09T03:00:00/2024-03-12T01:00:00+00:00" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    interval=2,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-09T03:00:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::aware(@date.parse_iso("2024-03-12T01:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([19792.583333333332]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 6, 10, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 14, 14, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
  assert_eq(adapter.tick_values(19791.333333333332, 19794.041666666668), [
    19792.625,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 6, 15, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 14, 18, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (6.0, 14.0))
}

///|
test "RRuleLocator original 80 caps naive 0001-01-01/0001-01-03 base None" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-03")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719161.0, -719160.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(-719162.0, -719160.0), [
    -719162.0, -719161.0, -719160.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 81 caps naive 0001-01-01/0001-01-03 base UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-03")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719161.0, -719160.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(-719162.0, -719160.0), [
    -719162.0, -719161.0, -719160.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 82 caps naive 0001-01-01/0001-01-03 base E23" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_e23,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("0001-01-03")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719161.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(-719162.0, -719160.0), [
    -719162.0, -719161.0, -719160.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 23, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 83 caps naive 9999-12-29/9999-12-31T23:59:59.999999 base None" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-29")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(2932894.0, 2932897.0), [])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 84 caps naive 9999-12-29/9999-12-31T23:59:59.999999 base UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-29")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932894.0, 2932895.0, 2932896.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 12, 26, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(2932894.0, 2932897.0), [])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 12, 26, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 85 caps naive 9999-12-29/9999-12-31T23:59:59.999999 base E23" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_e23,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("9999-12-29")),
        @date.RRuleDateTime::naive(
          @date.parse_iso("9999-12-31T23:59:59.999999"),
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(2932894.0, 2932897.0), [])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 86 caps aware 0001-01-01T00:00:00+00:00/0001-01-03T00:00:00+00:00 base None" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-03T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719161.0, -719160.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(-719162.0, -719160.0), [
    -719162.0, -719161.0, -719160.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 87 caps aware 0001-01-01T00:00:00+00:00/0001-01-03T00:00:00+00:00 base UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-03T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719161.0, -719160.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(-719162.0, -719160.0), [
    -719162.0, -719161.0, -719160.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 88 caps aware 0001-01-01T00:00:00+00:00/0001-01-03T00:00:00+00:00 base E23" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_e23,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-01T00:00:00+00:00")),
        @date.RRuleDateTime::aware(@date.parse_iso("0001-01-03T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719161.0, -719160.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 23, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(-719162.0, -719160.0), [
    -719162.0, -719161.0, -719160.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 23, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 89 caps aware 9999-12-29T00:00:00+00:00/9999-12-31T23:59:59.999999+00:00 base None" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("9999-12-29T00:00:00+00:00")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("9999-12-31T23:59:59.999999+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932894.0, 2932895.0, 2932896.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 12, 26, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(2932894.0, 2932897.0), [])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 12, 26, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 90 caps aware 9999-12-29T00:00:00+00:00/9999-12-31T23:59:59.999999+00:00 base UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("9999-12-29T00:00:00+00:00")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("9999-12-31T23:59:59.999999+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932894.0, 2932895.0, 2932896.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 12, 26, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(2932894.0, 2932897.0), [])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 12, 26, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 91 caps aware 9999-12-29T00:00:00+00:00/9999-12-31T23:59:59.999999+00:00 base E23" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_e23,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::aware(@date.parse_iso("9999-12-29T00:00:00+00:00")),
        @date.RRuleDateTime::aware(
          @date.parse_iso("9999-12-31T23:59:59.999999+00:00"),
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(2932894.0, 2932897.0), [])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 92 caps aware 0001-01-01/0001-01-03 base None" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_e23,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-03"),
          zone_e23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 4, 1, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 93 caps aware 0001-01-01/0001-01-03 base UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_e23,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-03"),
          zone_e23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 4, 1, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 94 caps aware 0001-01-01/0001-01-03 base E23" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_e23,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-01"),
          zone_e23,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("0001-01-03"),
          zone_e23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([-719162.0, -719161.0]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 1, 1, 1, 23, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 1, 1, 5, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 95 caps aware 9999-12-29/9999-12-31T23:59:59 base None" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let zone_w23 = @date.fixed_timezone_seconds(-82800)
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-29"),
          zone_w23,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31T23:59:59"),
          zone_w23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([2932894.9583449075, 2932895.9583449075, 2932896.9583449075]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 12, 26, 0, 0, 1, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 0, 59, 59, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 96 caps aware 9999-12-29/9999-12-31T23:59:59 base UTC" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let zone_w23 = @date.fixed_timezone_seconds(-82800)
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_utc,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-29"),
          zone_w23,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31T23:59:59"),
          zone_w23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 9999, 12, 26, 23, 0, 1, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 9999, 12, 31, 23, 59, 59, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 97 caps aware 9999-12-29/9999-12-31T23:59:59 base E23" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_e23 = @date.fixed_timezone_seconds(82800)
  let zone_utc = @date.get_timezone(name="UTC")
  let zone_w23 = @date.fixed_timezone_seconds(-82800)
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
    timezone=zone_e23,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-29"),
          zone_w23,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("9999-12-31T23:59:59"),
          zone_w23,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 98 mixed awareness" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::aware(@date.parse_iso("2024-01-05T00:00:00+00:00")),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19723.0, 19727.0), [
    19723.0, 19724.0, 19725.0, 19726.0, 19727.0,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 28, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 9, 0, 0, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
}

///|
test "RRuleLocator original 99 live metadata None" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-01T02:30:00"),
      zone_ny,
      fold=false,
    ),
    cache=true,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 1, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19790.3125, 19791.3125, 19792.270833333332, 19793.270833333332, 19794.270833333332,
      19795.270833333332,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 2, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [
    19790.354166666668, 19791.354166666668, 19792.354166666668, 19793.354166666668,
    19794.354166666668,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    try {
      wrapper.set(frequency=@date.Hourly, interval=3)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19790.3125, 19790.4375, 19790.5625, 19790.6875, 19790.8125, 19790.9375, 19791.0625,
      19791.1875, 19791.3125, 19791.4375, 19791.5625, 19791.6875, 19791.8125, 19791.9375,
      19792.0625, 19792.1875, 19792.270833333332, 19792.395833333332, 19792.520833333332,
      19792.645833333332, 19792.770833333332, 19792.895833333332, 19793.020833333332,
      19793.145833333332, 19793.270833333332, 19793.395833333332, 19793.520833333332,
      19793.645833333332, 19793.770833333332, 19793.895833333332, 19794.020833333332,
      19794.145833333332, 19794.270833333332, 19794.395833333332, 19794.520833333332,
      19794.645833333332, 19794.770833333332, 19794.895833333332, 19795.020833333332,
      19795.145833333332, 19795.270833333332,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 2, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [
    19790.354166666668, 19790.479166666668, 19790.604166666668, 19790.729166666668,
    19790.854166666668, 19790.979166666668, 19791.104166666668, 19791.229166666668,
    19791.354166666668, 19791.479166666668, 19791.604166666668, 19791.729166666668,
    19791.854166666668, 19791.979166666668, 19792.104166666668, 19792.229166666668,
    19792.354166666668, 19792.479166666668, 19792.604166666668, 19792.729166666668,
    19792.854166666668, 19792.979166666668, 19793.104166666668, 19793.229166666668,
    19793.354166666668, 19793.479166666668, 19793.604166666668, 19793.729166666668,
    19793.854166666668, 19793.979166666668, 19794.104166666668, 19794.229166666668,
    19794.354166666668, 19794.479166666668, 19794.604166666668, 19794.729166666668,
    19794.854166666668, 19794.979166666668, 19795.104166666668, 19795.229166666668,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(
    try {
      wrapper.set(bysetpos=[0], interval=7)
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(
    try {
      wrapper.set(null=["bysetpos"], interval=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19790.3125, 19790.395833333332, 19790.479166666668, 19790.5625, 19790.645833333332,
      19790.729166666668, 19790.8125, 19790.895833333332, 19790.979166666668, 19791.0625,
      19791.145833333332, 19791.229166666668, 19791.3125, 19791.395833333332, 19791.479166666668,
      19791.5625, 19791.645833333332, 19791.729166666668, 19791.8125, 19791.895833333332,
      19791.979166666668, 19792.0625, 19792.145833333332, 19792.229166666668, 19792.270833333332,
      19792.354166666668, 19792.4375, 19792.520833333332, 19792.604166666668, 19792.6875,
      19792.770833333332, 19792.854166666668, 19792.9375, 19793.020833333332, 19793.104166666668,
      19793.1875, 19793.270833333332, 19793.354166666668, 19793.4375, 19793.520833333332,
      19793.604166666668, 19793.6875, 19793.770833333332, 19793.854166666668, 19793.9375,
      19794.020833333332, 19794.104166666668, 19794.1875, 19794.270833333332, 19794.354166666668,
      19794.4375, 19794.520833333332, 19794.604166666668, 19794.6875, 19794.770833333332,
      19794.854166666668, 19794.9375, 19795.020833333332, 19795.104166666668, 19795.1875,
      19795.270833333332,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 2, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [
    19790.354166666668, 19790.4375, 19790.520833333332, 19790.604166666668, 19790.6875,
    19790.770833333332, 19790.854166666668, 19790.9375, 19791.020833333332, 19791.104166666668,
    19791.1875, 19791.270833333332, 19791.354166666668, 19791.4375, 19791.520833333332,
    19791.604166666668, 19791.6875, 19791.770833333332, 19791.854166666668, 19791.9375,
    19792.020833333332, 19792.104166666668, 19792.1875, 19792.270833333332, 19792.354166666668,
    19792.4375, 19792.520833333332, 19792.604166666668, 19792.6875, 19792.770833333332,
    19792.854166666668, 19792.9375, 19793.020833333332, 19793.104166666668, 19793.1875,
    19793.270833333332, 19793.354166666668, 19793.4375, 19793.520833333332, 19793.604166666668,
    19793.6875, 19793.770833333332, 19793.854166666668, 19793.9375, 19794.020833333332,
    19794.104166666668, 19794.1875, 19794.270833333332, 19794.354166666668, 19794.4375,
    19794.520833333332, 19794.604166666668, 19794.6875, 19794.770833333332, 19794.854166666668,
    19794.9375, 19795.020833333332, 19795.104166666668, 19795.1875, 19795.270833333332,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly, byweekdays=[
        @date.RelativeWeekday::new(4, nth=-1),
      ])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19790.3125, 19795.270833333332]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 2, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [
    19790.3125, 19795.270833333332,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 8, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 5, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
}

///|
test "RRuleLocator original 100 live metadata NY" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_ny = @date.get_timezone(name="D14/reference-NY")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Daily,
    dtstart=@date.RRuleDateTime::from_local(
      @date.parse_iso("2024-03-01T02:30:00"),
      zone_ny,
      fold=false,
    ),
    timezone=zone_ny,
    cache=true,
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 1, 2, 30, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19790.3125, 19791.3125, 19792.270833333332, 19793.270833333332, 19794.270833333332,
      19795.270833333332,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 2, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [
    19790.354166666668, 19791.354166666668, 19792.3125, 19793.3125, 19794.3125,
  ])
  assert_true(wrapper.frequency() is @date.Daily)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (8.0, 12.0))
  assert_eq(
    try {
      wrapper.set(frequency=@date.Hourly, interval=3)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19790.3125, 19790.4375, 19790.5625, 19790.6875, 19790.8125, 19790.9375, 19791.0625,
      19791.1875, 19791.3125, 19791.4375, 19791.5625, 19791.6875, 19791.8125, 19791.9375,
      19792.0625, 19792.1875, 19792.270833333332, 19792.395833333332, 19792.520833333332,
      19792.645833333332, 19792.770833333332, 19792.895833333332, 19793.020833333332,
      19793.145833333332, 19793.270833333332, 19793.395833333332, 19793.520833333332,
      19793.645833333332, 19793.770833333332, 19793.895833333332, 19794.020833333332,
      19794.145833333332, 19794.270833333332, 19794.395833333332, 19794.520833333332,
      19794.645833333332, 19794.770833333332, 19794.895833333332, 19795.020833333332,
      19795.145833333332, 19795.270833333332,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 2, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [
    19790.354166666668, 19790.479166666668, 19790.604166666668, 19790.729166666668,
    19790.854166666668, 19790.979166666668, 19791.104166666668, 19791.229166666668,
    19791.354166666668, 19791.479166666668, 19791.604166666668, 19791.729166666668,
    19791.854166666668, 19791.979166666668, 19792.104166666668, 19792.229166666668,
    19792.3125, 19792.4375, 19792.5625, 19792.6875, 19792.8125, 19792.9375, 19793.0625,
    19793.1875, 19793.3125, 19793.4375, 19793.5625, 19793.6875, 19793.8125, 19793.9375,
    19794.0625, 19794.1875, 19794.3125, 19794.4375, 19794.5625, 19794.6875, 19794.8125,
    19794.9375, 19795.0625, 19795.1875,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(
    try {
      wrapper.set(bysetpos=[0], interval=7)
      false
    } catch {
      _ => true
    },
    true,
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    None,
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 3)
  assert_eq(copy.interval(), 3)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (9.75, 10.25))
  assert_eq(
    try {
      wrapper.set(null=["bysetpos"], interval=2)
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([
      19790.3125, 19790.395833333332, 19790.479166666668, 19790.5625, 19790.645833333332,
      19790.729166666668, 19790.8125, 19790.895833333332, 19790.979166666668, 19791.0625,
      19791.145833333332, 19791.229166666668, 19791.3125, 19791.395833333332, 19791.479166666668,
      19791.5625, 19791.645833333332, 19791.729166666668, 19791.8125, 19791.895833333332,
      19791.979166666668, 19792.0625, 19792.145833333332, 19792.229166666668, 19792.270833333332,
      19792.354166666668, 19792.4375, 19792.520833333332, 19792.604166666668, 19792.6875,
      19792.770833333332, 19792.854166666668, 19792.9375, 19793.020833333332, 19793.104166666668,
      19793.1875, 19793.270833333332, 19793.354166666668, 19793.4375, 19793.520833333332,
      19793.604166666668, 19793.6875, 19793.770833333332, 19793.854166666668, 19793.9375,
      19794.020833333332, 19794.104166666668, 19794.1875, 19794.270833333332, 19794.354166666668,
      19794.4375, 19794.520833333332, 19794.604166666668, 19794.6875, 19794.770833333332,
      19794.854166666668, 19794.9375, 19795.020833333332, 19795.104166666668, 19795.1875,
      19795.270833333332,
    ]),
  )
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 2, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [
    19790.354166666668, 19790.4375, 19790.520833333332, 19790.604166666668, 19790.6875,
    19790.770833333332, 19790.854166666668, 19790.9375, 19791.020833333332, 19791.104166666668,
    19791.1875, 19791.270833333332, 19791.354166666668, 19791.4375, 19791.520833333332,
    19791.604166666668, 19791.6875, 19791.770833333332, 19791.854166666668, 19791.9375,
    19792.020833333332, 19792.104166666668, 19792.1875, 19792.270833333332, 19792.3125,
    19792.395833333332, 19792.479166666668, 19792.5625, 19792.645833333332, 19792.729166666668,
    19792.8125, 19792.895833333332, 19792.979166666668, 19793.0625, 19793.145833333332,
    19793.229166666668, 19793.3125, 19793.395833333332, 19793.479166666668, 19793.5625,
    19793.645833333332, 19793.729166666668, 19793.8125, 19793.895833333332, 19793.979166666668,
    19794.0625, 19794.145833333332, 19794.229166666668, 19794.3125, 19794.395833333332,
    19794.479166666668, 19794.5625, 19794.645833333332, 19794.729166666668, 19794.8125,
    19794.895833333332, 19794.979166666668, 19795.0625, 19795.145833333332, 19795.229166666668,
  ])
  assert_true(wrapper.frequency() is @date.Hourly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 0.041666666666666664)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.833333333333334, 10.166666666666666),
  )
  assert_eq(
    try {
      wrapper.set(frequency=@date.Monthly, byweekdays=[
        @date.RelativeWeekday::new(4, nth=-1),
      ])
      false
    } catch {
      _ => true
    },
    false,
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-08T02:30:00"),
          zone_ny,
          fold=false,
        ),
        @date.RRuleDateTime::from_local(
          @date.parse_iso("2024-03-13T02:30:00"),
          zone_ny,
          fold=false,
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19790.3125, 19795.270833333332]),
  )
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 2, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 2, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
  assert_eq(adapter.tick_values(19790.3125, 19795.270833333332), [
    19790.3125, 19795.270833333332,
  ])
  assert_true(wrapper.frequency() is @date.Monthly)
  assert_eq(locator.interval(), 2)
  assert_eq(copy.interval(), 2)
  assert_eq(copy.unit_scale(), 30.0)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 3, 3, 3, 30, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 3, 18, 1, 30, 0, 0, 0]),
  )
  assert_eq(copy.nonsingular(10.0, 10.0), (-110.0, 130.0))
}

///|
test "RRuleLocator original 101 point/micro 2024-01-01" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Secondly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999976851851851, 10.000023148148149),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
        @date.RRuleDateTime::naive(@date.parse_iso("2024-01-01")),
      ),
    ) catch {
      _ => None
    },
    Some([19723.0]),
  )
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999976851851851, 10.000023148148149),
  )
  assert_eq(adapter.tick_values(19723.0, 19723.0), [19723.0])
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 0, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999976851851851, 10.000023148148149),
  )
}

///|
test "RRuleLocator original 102 point/micro 2024-01-01T00:00:00.000001" {
  @date.register_timezone("D14/reference-NY", tzif_new_york)
  defer @date.unregister_timezone("D14/reference-NY")
  @date.register_timezone("D14/reference-LH", tzif_lord_howe)
  defer @date.unregister_timezone("D14/reference-LH")
  let zone_utc = @date.get_timezone(name="UTC")
  let wrapper = @date.RRuleWrapper::new(
    @date.Secondly,
    dtstart=@date.RRuleDateTime::naive(@date.parse_iso("2024-01-01T00:00:00")),
  )
  let locator = @date.RRuleLocator::new(wrapper, timezone=zone_utc)
  let adapter = locator.as_locator()
  let copy = adapter.copy()
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2024, 1, 1, 0, 0, 0, 0, 0,
  ])
  assert_eq(wrapper.until().map(wrapper_reference_fields), None)
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999976851851851, 10.000023148148149),
  )
  assert_eq(
    Some(
      locator.tick_values(
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000001"),
        ),
        @date.RRuleDateTime::naive(
          @date.parse_iso("2024-01-01T00:00:00.000009"),
        ),
      ),
    ) catch {
      _ => None
    },
    Some([19723.00000000001, 19723.000000000106]),
  )
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), false)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 31, 23, 59, 59, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 17, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999976851851851, 10.000023148148149),
  )
  assert_eq(adapter.tick_values(19723.00000000001, 19723.000000000106), [
    19723.00000000001, 19723.000000000106,
  ])
  assert_true(wrapper.frequency() is @date.Secondly)
  assert_eq(locator.interval(), 1)
  assert_eq(copy.interval(), 1)
  assert_eq(copy.unit_scale(), 1.1574074074074073e-05)
  assert_eq(wrapper.timezone() is Some(_), true)
  assert_eq(wrapper_reference_fields(wrapper.dtstart()), [
    0, 2023, 12, 31, 23, 59, 59, 0, 0,
  ])
  assert_eq(
    wrapper.until().map(wrapper_reference_fields),
    Some([0, 2024, 1, 1, 0, 0, 0, 17, 0]),
  )
  assert_eq(
    copy.nonsingular(10.0, 10.0),
    (9.999976851851851, 10.000023148148149),
  )
}
