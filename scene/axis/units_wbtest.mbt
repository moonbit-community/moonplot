///|
test "live category mapping preserves order snapshots and ties-even formatting" {
  let units = CategoryUnits::new(["b", "a", "b"])
  assert_eq(units.labels(), ["b", "a"])
  let snapshot = units.labels()
  assert_eq(units.encode(["a", "c"]), [1.0, 2.0])
  assert_eq(snapshot, ["b", "a"])
  assert_eq(units.positions(), [0.0, 1.0, 2.0])
  assert_eq(units.format_values([-0.5, 0.5, 1.5, 2.5, 20.0]), [
    "b", "b", "c", "c", "",
  ])
  try units.format_values([0.0 / 0.0]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "cannot convert float NaN to integer")
    _ => fail("expected original round error")
  } noraise {
    _ => fail("expected original round error")
  }
}

///|
test "ordinary empty unit inputs neither discover converters nor affect tickers" {
  let value = axis()
  let formatter = value.named_formatter().unwrap()
  assert_true(!value.update_category_units([]))
  assert_true(!value.update_date_units([]))
  assert_eq(value.convert_category_units([]), [])
  assert_eq(value.convert_date_units([]), [])
  assert_true(!value.have_units())
  assert_true(physical_equal(value.named_formatter().unwrap(), formatter))
}

///|
test "first category conversion preserves all explicit independent slots" {
  let value = axis()
  let formatter = @ticker.FuncFormatter::new((_, _) => "custom")
  let minor = @ticker.MultipleLocator::new(base=0.25)
  value.set_named_formatter(formatter.as_base_formatter())
  value.set_minor_locator(minor.as_minor_locator())
  assert_true(value.update_category_units(["a", "b"]))
  assert_true(
    physical_equal(
      value.named_formatter().unwrap(),
      formatter.as_base_formatter(),
    ),
  )
  assert_true(value.minor_locator().unwrap().multiple_locator() is Some(_))
  assert_true(!value.is_default_formatter())
  assert_true(!value.is_default_locator(minor=true))
  assert_true(value.is_default_locator())
  assert_eq(value.convert_category_units(["b", "c"]), [1.0, 2.0])
  assert_eq(value.get_category_units().unwrap().labels(), ["a", "b", "c"])
}

///|
test "repeated category updates retain installed locator and formatter mapping" {
  let value = axis()
  ignore(value.update_category_units(["a"]))
  let units = value.get_category_units().unwrap()
  let installed = value.tickers.category_locator_units.unwrap()
  ignore(value.update_category_units(["b", "a"]))
  assert_true(physical_equal(units, value.get_category_units().unwrap()))
  assert_true(
    physical_equal(installed, value.tickers.category_locator_units.unwrap()),
  )
  assert_eq(installed.positions(), [0.0, 1.0])
  value.set_locator(@ticker.FixedLocator::new([0.0]).as_locator())
  ignore(value.update_category_units(["c"]))
  assert_true(value.tickers.major_locator_kind is Numeric)
  assert_true(!value.is_default_locator())
}

///|
test "same converter after numeric scale reset does not resurrect unit tickers" {
  let value = axis()
  ignore(value.update_category_units(["a"]))
  value.set_scale(@scale.linear_scale())
  let formatter = value.named_formatter().unwrap()
  ignore(value.update_category_units(["b"]))
  assert_true(value.tickers.major_locator_kind is Numeric)
  assert_true(value.tickers.major_formatter_kind is Numeric)
  assert_true(physical_equal(value.named_formatter().unwrap(), formatter))
  assert_eq(value.get_category_units().unwrap().labels(), ["a", "b"])
}

///|
test "naive date data and aware instants infer different unit presence" {
  let naive = axis()
  let aware = axis()
  ignore(
    naive.update_date_units([
      @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    ]),
  )
  ignore(
    aware.update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1)),
    ]),
  )
  assert_true(naive.unit_tag() is None)
  assert_true(aware.unit_tag() is Some(AxisUnitTag::Date(_)))
  assert_eq(naive.unit_converter_kind(), Some("default_date"))
  assert_true(naive.tickers.major_locator_kind is Date)
  assert_true(naive.tickers.minor_locator_kind is Numeric)
  assert_true(naive.is_default_locator() && naive.is_default_formatter())
}

///|
test "equal fixed offset unit tags do not emit another units callback" {
  let value = axis()
  let count = [0]
  value.bind_units_changed(() => count[0] += 1)
  ignore(
    value.update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1)),
    ]),
  )
  assert_eq(count[0], 1)
  value.set_unit_tag(Some(AxisUnitTag::Date(@date.fixed_timezone_seconds(0))))
  assert_eq(count[0], 1)
  value.set_unit_tag(
    Some(AxisUnitTag::Date(@date.fixed_timezone_seconds(3600))),
  )
  assert_eq(count[0], 2)
}

///|
test "unit propagation failure retains preceding assignments and shared tickers" {
  let first = axis()
  let second = axis()
  let third = axis()
  second.share_numeric_tickers(first)
  third.share_numeric_tickers(first)
  first.bind_unit_group(() => [first, second, third])
  let events : Array[String] = []
  first.bind_units_changed(() => events.push("first"))
  second.bind_units_changed(() => {
    events.push("second")
    raise @core.DataError::InvalidTicks(message="second units event failed")
  })
  try first.update_category_units(["a"]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "second units event failed")
    _ => fail("expected original callback error")
  } noraise {
    _ => fail("expected original callback error")
  }
  assert_eq(events, ["first", "second"])
  assert_true(first.unit_tag() is Some(AxisUnitTag::Category(_)))
  assert_true(second.unit_tag() is Some(AxisUnitTag::Category(_)))
  assert_true(third.unit_tag() is None)
  assert_true(third.tickers.major_locator_kind is Category)
}

///|
test "converter-only discovery on a shared peer leaves installed slots untouched" {
  let first = axis()
  let second = axis()
  second.share_numeric_tickers(first)
  first.bind_unit_group(() => [first, second])
  ignore(first.update_category_units(["a"]))
  assert_true(second.have_units())
  assert_eq(second.unit_converter_kind(), None)
  second.set_scale(@scale.linear_scale())
  let formatter = first.named_formatter().unwrap()
  assert_eq(second.convert_category_units(["b"]), [1.0])
  assert_eq(second.unit_converter_kind(), Some("category"))
  assert_true(first.tickers.major_locator_kind is Numeric)
  assert_true(physical_equal(first.named_formatter().unwrap(), formatter))
  assert_eq(first.get_category_units().unwrap().labels(), ["a", "b"])
}

///|
test "explicit converter assignment does not install defaults and rejects replacement" {
  let value = axis()
  let original = value.named_formatter().unwrap()
  let converter = @date.DateConverter::new()
  value.set_explicit_date_converter(converter)
  assert_true(value.unit_converter_explicit())
  assert_true(physical_equal(value.named_formatter().unwrap(), original))
  value.set_explicit_date_converter(converter)
  try value.set_explicit_date_converter(@date.DateConverter::new()) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "Axis already has an explicit converter set")
    _ => fail("expected original converter error")
  } noraise {
    _ => fail("expected original converter error")
  }
}

///|
test "explicit date locator retains its own timezone and the live registry converter" {
  let value = axis()
  ignore(
    value.update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1)),
    ]),
  )
  value.set_date_locator(@date.day_locator(timezone=@date.fixed_timezone(180)))
  value.set_minor_date_locator(
    @date.day_locator(timezone=@date.fixed_timezone(60)),
  )
  assert_eq(value.unit_converter_kind(), Some("default_date"))
  assert_eq(value.date_locator().unwrap().offset_minutes(), 180)
  value.set_unit_tag(Some(AxisUnitTag::Date(@date.fixed_timezone(300))))
  assert_eq(value.unit_converter_kind(), Some("default_date"))
  assert_eq(value.date_locator().unwrap().offset_minutes(), 180)
  assert_eq(value.minor_date_locator().unwrap().offset_minutes(), 60)
  assert_true(!value.is_default_locator())
}
