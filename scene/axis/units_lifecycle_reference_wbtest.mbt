// Generated from pinned original units and typed-locator source; do not edit.

///|
fn units_ref_double(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn units_ref_pair(
  actual : (Double, Double),
  expected : Array[Double],
) -> Unit raise {
  units_ref_double(actual.0, expected[0])
  units_ref_double(actual.1, expected[1])
}

///|
fn units_ref_roles(value : Axis) -> Array[String] {
  [
    value.tickers.major_locator_kind,
    value.tickers.minor_locator_kind,
    value.tickers.major_formatter_kind,
    value.tickers.minor_formatter_kind,
  ].map(kind => {
    match kind {
      Numeric => "Numeric"
      Date => "Date"
      Category => "Category"
    }
  })
}

///|
fn units_ref_labels(value : Axis) -> Array[String] raise @core.DataError {
  match value.tickers.major_formatter_kind {
    Date => value.tickers.date_formatter.unwrap().format_values([0.0, 1.0, 2.0])
    Category =>
      value.tickers.category_formatter_units
      .unwrap()
      .format_values([0.0, 1.0, 2.0])
    Numeric =>
      value.tickers.named_formatter.unwrap().format_ticks([0.0, 1.0, 2.0])
  }
}

///|
fn units_ref_offset(value : Axis) -> String {
  match value.tickers.major_formatter_kind {
    Date => value.tickers.date_formatter.unwrap().offset_label([0.0, 1.0, 2.0])
    _ => ""
  }
}

///|
fn units_source_case_0() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, ["0"])
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, [])
}

///|
fn units_source_case_1() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let custom_locator = @ticker.FixedLocator::new([99.0])
  axes[0].set_locator(custom_locator.as_locator())
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, ["0"])
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, [])
}

///|
fn units_source_case_2() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let custom_formatter = @ticker.FuncFormatter::new(fn(_, _) { "custom" }).as_base_formatter()
  axes[0].set_named_formatter(custom_formatter)
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, ["0"])
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
}

///|
fn units_source_case_3() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let custom_minor_locator = @ticker.FixedLocator::new([0.25, 0.75])
  axes[0].set_minor_locator(custom_minor_locator.as_minor_locator())
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, false, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, ["0"])
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, false, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, [])
}

///|
fn units_source_case_4() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let custom_minor_formatter = @ticker.FuncFormatter::new(fn(_, _) { "minor" }).as_base_formatter()
  axes[0].set_minor_named_formatter(custom_minor_formatter)
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, false],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, ["0"])
  assert_true(
    physical_equal(
      axes[0].minor_named_formatter().unwrap(),
      custom_minor_formatter,
    ),
  )
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, false],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(
      axes[0].minor_named_formatter().unwrap(),
      custom_minor_formatter,
    ),
  )
}

///|
fn units_source_case_5() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let custom_locator = @ticker.FixedLocator::new([99.0])
  axes[0].set_locator(custom_locator.as_locator())
  let custom_formatter = @ticker.FuncFormatter::new(fn(_, _) { "custom" }).as_base_formatter()
  axes[0].set_named_formatter(custom_formatter)
  let custom_minor_locator = @ticker.FixedLocator::new([0.25, 0.75])
  axes[0].set_minor_locator(custom_minor_locator.as_minor_locator())
  let custom_minor_formatter = @ticker.FuncFormatter::new(fn(_, _) { "minor" }).as_base_formatter()
  axes[0].set_minor_named_formatter(custom_minor_formatter)
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [false, false, false, false],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, ["0"])
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
  assert_true(
    physical_equal(
      axes[0].minor_named_formatter().unwrap(),
      custom_minor_formatter,
    ),
  )
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [false, false, false, false],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
  assert_true(
    physical_equal(
      axes[0].minor_named_formatter().unwrap(),
      custom_minor_formatter,
    ),
  )
}

///|
fn units_source_case_6() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  axes[1].bind_units_changed(() => callbacks.push("1"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, ["1", "0"])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  callbacks.clear()
  assert_eq(axes[1].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), Some("category"))
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
}

///|
fn units_source_case_7() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let custom_locator = @ticker.FixedLocator::new([99.0])
  axes[0].set_locator(custom_locator.as_locator())
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  axes[1].bind_units_changed(() => callbacks.push("1"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Numeric", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(units_ref_labels(axes[1]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, ["1", "0"])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  callbacks.clear()
  assert_eq(axes[1].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), Some("category"))
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Numeric", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [false, true, true, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(units_ref_labels(axes[1]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
}

///|
fn units_source_case_8() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let custom_formatter = @ticker.FuncFormatter::new(fn(_, _) { "custom" }).as_base_formatter()
  axes[0].set_named_formatter(custom_formatter)
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  axes[1].bind_units_changed(() => callbacks.push("1"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, ["1", "0"])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
  callbacks.clear()
  assert_eq(axes[1].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), Some("category"))
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
}

///|
fn units_source_case_9() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let custom_minor_locator = @ticker.FixedLocator::new([0.25, 0.75])
  axes[0].set_minor_locator(custom_minor_locator.as_minor_locator())
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  axes[1].bind_units_changed(() => callbacks.push("1"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, false, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, false, true, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, ["1", "0"])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  callbacks.clear()
  assert_eq(axes[1].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, false, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), Some("category"))
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, false, true, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
}

///|
fn units_source_case_10() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let custom_minor_formatter = @ticker.FuncFormatter::new(fn(_, _) { "minor" }).as_base_formatter()
  axes[0].set_minor_named_formatter(custom_minor_formatter)
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  axes[1].bind_units_changed(() => callbacks.push("1"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, false],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, true, false],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["b", "a", ""])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, ["1", "0"])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  assert_true(
    physical_equal(
      axes[0].minor_named_formatter().unwrap(),
      custom_minor_formatter,
    ),
  )
  callbacks.clear()
  assert_eq(axes[1].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, false],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), Some("category"))
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, true, false],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["b", "a", "c"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  assert_true(
    physical_equal(
      axes[0].minor_named_formatter().unwrap(),
      custom_minor_formatter,
    ),
  )
}

///|
fn units_source_case_11() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let custom_locator = @ticker.FixedLocator::new([99.0])
  axes[0].set_locator(custom_locator.as_locator())
  let custom_formatter = @ticker.FuncFormatter::new(fn(_, _) { "custom" }).as_base_formatter()
  axes[0].set_named_formatter(custom_formatter)
  let custom_minor_locator = @ticker.FixedLocator::new([0.25, 0.75])
  axes[0].set_minor_locator(custom_minor_locator.as_minor_locator())
  let custom_minor_formatter = @ticker.FuncFormatter::new(fn(_, _) { "minor" }).as_base_formatter()
  axes[0].set_minor_named_formatter(custom_minor_formatter)
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  axes[1].bind_units_changed(() => callbacks.push("1"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b", "a", "b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [false, false, false, false],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [false, false, false, false],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a"])
  assert_eq(units_ref_labels(axes[1]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, ["1", "0"])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
  assert_true(
    physical_equal(
      axes[0].minor_named_formatter().unwrap(),
      custom_minor_formatter,
    ),
  )
  callbacks.clear()
  assert_eq(axes[1].update_category_units(["c", "a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [false, false, false, false],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), Some("category"))
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [false, false, false, false],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["b", "a", "c"])
  assert_eq(units_ref_labels(axes[1]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, [])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
  assert_true(
    physical_equal(
      axes[0].minor_named_formatter().unwrap(),
      custom_minor_formatter,
    ),
  )
}

///|
fn units_source_case_12() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, [])
  callbacks.clear()
  @config.set_date_converter("concise")
  @config.set_date_interval_multiples(false)
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, [])
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, [])
  callbacks.clear()
  axes[0].set_unit_tag(
    Some(AxisUnitTag::Date(@date.fixed_timezone_seconds(3600))),
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 3600)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["Jan", "02", "03"])
  assert_eq(units_ref_offset(axes[0]), "1970-Jan")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, ["0"])
}

///|
fn units_source_case_13() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds=0)),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, ["0"])
  callbacks.clear()
  @config.set_date_converter("concise")
  @config.set_date_interval_multiples(false)
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, [])
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds=0)),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, [])
  callbacks.clear()
  axes[0].set_unit_tag(
    Some(AxisUnitTag::Date(@date.fixed_timezone_seconds(3600))),
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 3600)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["Jan", "02", "03"])
  assert_eq(units_ref_offset(axes[0]), "1970-Jan")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, ["0"])
}

///|
fn units_source_case_14() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::aware(
        @date.datetime(2024, 1, 1, offset_seconds=10800),
      ),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 10800)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, ["0"])
  callbacks.clear()
  @config.set_date_converter("concise")
  @config.set_date_interval_multiples(false)
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 10800)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, [])
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::aware(
        @date.datetime(2024, 1, 1, offset_seconds=10800),
      ),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 10800)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, [])
  callbacks.clear()
  axes[0].set_unit_tag(
    Some(AxisUnitTag::Date(@date.fixed_timezone_seconds(3600))),
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 3600)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["Jan", "02", "03"])
  assert_eq(units_ref_offset(axes[0]), "1970-Jan")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, ["0"])
}

///|
fn units_source_case_15() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let custom_formatter = @ticker.FuncFormatter::new(fn(_, _) { "custom" }).as_base_formatter()
  axes[0].set_named_formatter(custom_formatter)
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  axes[1].bind_units_changed(() => callbacks.push("1"))
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds=0)),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Numeric", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), ["Date", "Numeric", "Numeric", "Numeric"])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[1].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[1]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(axes[1].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, ["1", "0"])
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
  callbacks.clear()
  assert_eq(
    axes[1].update_date_units([
      @date.RRuleDateTime::aware(
        @date.datetime(2024, 1, 1, offset_seconds=10800),
      ),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Numeric", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(axes[1].unit_converter_kind(), Some("default_date"))
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), ["Date", "Numeric", "Numeric", "Numeric"])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, false, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[1].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[1]), ["custom", "custom", "custom"])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(axes[1].auto_date_locator().unwrap().interval_multiples(), true)
  assert_eq(callbacks, [])
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
  assert_true(
    physical_equal(axes[0].named_formatter().unwrap(), custom_formatter),
  )
}

///|
fn units_source_case_16() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  axes[0].set_explicit_date_converter(
    @date.DateConverter::new(interval_multiples=false),
  )
  assert_eq(axes[0].unit_converter_kind(), Some("explicit_date"))
  assert_eq(axes[0].unit_converter_explicit(), true)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(callbacks, [])
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::naive(@date.datetime(2024, 1, 1)),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("explicit_date"))
  assert_eq(axes[0].unit_converter_explicit(), true)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(callbacks, [])
}

///|
fn units_source_case_17() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  axes[0].set_explicit_date_converter(
    @date.DateConverter::new(interval_multiples=false),
  )
  assert_eq(axes[0].unit_converter_kind(), Some("explicit_date"))
  assert_eq(axes[0].unit_converter_explicit(), true)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(callbacks, [])
  callbacks.clear()
  assert_eq(
    axes[0].update_date_units([
      @date.RRuleDateTime::aware(@date.datetime(2024, 1, 1, offset_seconds=0)),
    ]),
    true,
  )
  assert_eq(axes[0].unit_converter_kind(), Some("explicit_date"))
  assert_eq(axes[0].unit_converter_explicit(), true)
  assert_eq(units_ref_roles(axes[0]), ["Date", "Numeric", "Date", "Numeric"])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  match axes[0].unit_tag() {
    Some(Date(zone)) => assert_eq(zone.offset_seconds_at(0.0), 0)
    _ => fail("expected date unit")
  }
  assert_eq(units_ref_labels(axes[0]), ["1970", "1970", "1970"])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[0].auto_date_locator().unwrap().interval_multiples(), false)
  assert_eq(callbacks, ["0"])
}

///|
fn units_source_case_18() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units([]), false)
  assert_eq(axes[0].unit_converter_kind(), None)
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(callbacks, [])
}

///|
fn units_source_case_19() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_date_units([]), false)
  assert_eq(axes[0].unit_converter_kind(), None)
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(callbacks, [])
}

///|
fn units_source_case_20() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis()]
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["a"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["a", "", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(callbacks, ["0"])
  callbacks.clear()
  axes[0].set_scale(@scale.linear_scale())
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["a"])
  assert_eq(callbacks, [])
  callbacks.clear()
  assert_eq(axes[0].update_category_units(["b"]), true)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["a", "b"])
  assert_eq(callbacks, [])
}

///|
fn units_source_case_21() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(fn() -> Unit raise @core.DataError {
    callbacks.push("0")
    raise @core.DataError::InvalidTicks(message="units callback failure")
  })
  axes[1].bind_units_changed(() => callbacks.push("1"))
  callbacks.clear()
  let failed = try {
    ignore(axes[0].update_category_units(["a"]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) =>
      message == "units callback failure"
    _ => false
  }
  assert_true(failed)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is Some(Category(_)))
  assert_eq(axes[0].get_category_units().unwrap().labels(), ["a"])
  assert_eq(axes[0].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[0]), ["a", "", ""])
  assert_eq(units_ref_offset(axes[0]), "")
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Category", "Numeric", "Category", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["a"])
  assert_eq(axes[1].tick_values_checked(@core.limits(0.0, 2.0)), [
    0UL.reinterpret_as_double(),
  ])
  assert_eq(units_ref_labels(axes[1]), ["a", "", ""])
  assert_eq(units_ref_offset(axes[1]), "")
  assert_eq(callbacks, ["1", "0"])
  assert_true(
    physical_equal(
      axes[0].get_category_units().unwrap(),
      axes[1].get_category_units().unwrap(),
    ),
  )
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
}

///|
fn units_source_case_22() -> Unit raise {
  let old_mode = @config.date_converter()
  let old_multiple = @config.date_interval_multiples()
  defer {
    @config.set_date_converter(old_mode)
    @config.set_date_interval_multiples(old_multiple)
  }
  @config.set_date_converter("auto")
  @config.set_date_interval_multiples(true)
  let axes = [axis(), axis()]
  axes[1].share_numeric_tickers(axes[0])
  for value in axes {
    value.bind_unit_group(() => [axes[1], axes[0]])
  }
  let callbacks : Array[String] = []
  axes[0].bind_units_changed(() => callbacks.push("0"))
  axes[1].bind_units_changed(fn() -> Unit raise @core.DataError {
    callbacks.push("1")
    raise @core.DataError::InvalidTicks(message="units callback failure")
  })
  callbacks.clear()
  let failed = try {
    ignore(axes[0].update_category_units(["a"]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) =>
      message == "units callback failure"
    _ => false
  }
  assert_true(failed)
  assert_eq(axes[0].unit_converter_kind(), Some("category"))
  assert_eq(axes[0].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[0]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[0].is_default_locator(),
      axes[0].is_default_locator(minor=true),
      axes[0].is_default_formatter(),
      axes[0].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[0].stored_view_limits().lower(), axes[0].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[0].unit_tag() is None)
  assert_eq(axes[1].unit_converter_kind(), None)
  assert_eq(axes[1].unit_converter_explicit(), false)
  assert_eq(units_ref_roles(axes[1]), [
    "Numeric", "Numeric", "Numeric", "Numeric",
  ])
  assert_eq(
    [
      axes[1].is_default_locator(),
      axes[1].is_default_locator(minor=true),
      axes[1].is_default_formatter(),
      axes[1].is_default_formatter(minor=true),
    ],
    [true, true, true, true],
  )
  units_ref_pair(
    (axes[1].stored_view_limits().lower(), axes[1].stored_view_limits().upper()),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
  assert_true(axes[1].unit_tag() is Some(Category(_)))
  assert_eq(axes[1].get_category_units().unwrap().labels(), ["a"])
  assert_eq(callbacks, ["1"])
  assert_true(physical_equal(axes[0].tickers, axes[1].tickers))
}

///|
fn units_source_case_23() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
}

///|
fn units_source_case_24() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4666723172467343360UL.reinterpret_as_double(),
      4666723172467343360UL.reinterpret_as_double(),
    ),
    [
      4666722072955715584UL.reinterpret_as_double(),
      4666724271978971136UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_25() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4666723172467343360UL.reinterpret_as_double(),
      4666723172467398336UL.reinterpret_as_double(),
    ),
    [
      4666722072955715584UL.reinterpret_as_double(),
      4666724271979026112UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_26() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4611686018427387904UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ),
    [0UL.reinterpret_as_double(), 4611686018427387904UL.reinterpret_as_double()],
  )
}

///|
fn units_source_case_27() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467343360UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    4666717674909204480UL.reinterpret_as_double(),
    4666728670025482240UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_28() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467398336UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467398336UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_29() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
}

///|
fn units_source_case_30() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4666723172467343360UL.reinterpret_as_double(),
      4666723172467343360UL.reinterpret_as_double(),
    ),
    [
      4666321850723205120UL.reinterpret_as_double(),
      4667124494211481600UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_31() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4666723172467343360UL.reinterpret_as_double(),
      4666723172467398336UL.reinterpret_as_double(),
    ),
    [
      4666723172467343360UL.reinterpret_as_double(),
      4666723172467398336UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_32() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4611686018427387904UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ),
    [0UL.reinterpret_as_double(), 4611686018427387904UL.reinterpret_as_double()],
  )
}

///|
fn units_source_case_33() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467343360UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    4666717674909204480UL.reinterpret_as_double(),
    4666728670025482240UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_34() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467398336UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467398336UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_35() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ),
    [0UL.reinterpret_as_double(), 4607182418800017408UL.reinterpret_as_double()],
  )
}

///|
fn units_source_case_36() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4666723172467343360UL.reinterpret_as_double(),
      4666723172467343360UL.reinterpret_as_double(),
    ),
    [
      4666723172467343354UL.reinterpret_as_double(),
      4666723172467343366UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_37() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4666723172467343360UL.reinterpret_as_double(),
      4666723172467398336UL.reinterpret_as_double(),
    ),
    [
      4666723172467343354UL.reinterpret_as_double(),
      4666723172467398342UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_38() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4611686018427387904UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ),
    [0UL.reinterpret_as_double(), 4611686018427387904UL.reinterpret_as_double()],
  )
}

///|
fn units_source_case_39() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467343360UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    4666717674909204480UL.reinterpret_as_double(),
    4666728670025482240UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_40() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467398336UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    4666723172467343360UL.reinterpret_as_double(),
    4666723172467398336UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_59() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ),
    [
      13810738617294363034UL.reinterpret_as_double(),
      4587366580439587226UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_60() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    9218868437227405312UL.reinterpret_as_double(),
    18442240474082181120UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    13785626545772145148UL.reinterpret_as_double(),
    4562254508917369340UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_61() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      0UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ),
    [
      13810738617294363034UL.reinterpret_as_double(),
      4587366580439587226UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_62() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    0UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    13785626545772145148UL.reinterpret_as_double(),
    4562254508917369340UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_63() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4616189618054758400UL.reinterpret_as_double(),
      4616189618054758400UL.reinterpret_as_double(),
    ),
    [
      4615739258092021350UL.reinterpret_as_double(),
      4616414798036126925UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_64() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    4616189618054758400UL.reinterpret_as_double(),
    4616189618054758400UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    4616180610855503659UL.reinterpret_as_double(),
    4616194121654385770UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_65() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  units_ref_pair(
    value.locator_nonsingular(
      4611686018427387904UL.reinterpret_as_double(),
      0UL.reinterpret_as_double(),
    ),
    [0UL.reinterpret_as_double(), 4611686018427387904UL.reinterpret_as_double()],
  )
}

///|
fn units_source_case_66() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  let limits = value.locator_view_limits_checked(
    4611686018427387904UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
  )
  units_ref_pair((limits.lower(), limits.upper()), [
    0UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_67() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  assert_eq(value.tick_values_checked(@core.limits(0.0 / 0.0, 1.0 / 0.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_68() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  assert_eq(
    units.format_values([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
      13826050856027422720UL.reinterpret_as_double(),
      4602678819172646912UL.reinterpret_as_double(),
      4609434218613702656UL.reinterpret_as_double(),
    ]),
    ["first", "second", "", "first", "first", ""],
  )
}

///|
fn units_source_case_69() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  ignore(units.encode(["third"]))
  assert_eq(value.tick_values_checked(@core.limits(-1.0, 3.0)), [
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
    4611686018427387904UL.reinterpret_as_double(),
  ])
}

///|
fn units_source_case_70() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  ignore(units.encode(["third"]))
  assert_eq(
    units.format_values([
      0UL.reinterpret_as_double(),
      4607182418800017408UL.reinterpret_as_double(),
      4611686018427387904UL.reinterpret_as_double(),
    ]),
    ["first", "second", "third"],
  )
}

///|
fn units_source_case_71() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      13811459193234742314UL.reinterpret_as_double(),
      4588087156379966506UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_72() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      13811459193234742314UL.reinterpret_as_double(),
      4588087156379966506UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_73() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467343360UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666420806769704960UL.reinterpret_as_double(),
      4667025538164981760UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_74() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  let units = CategoryUnits::new(["first", "second"])
  value.tickers.major_locator_kind = Category
  value.tickers.major_formatter_kind = Category
  value.tickers.category_locator_units = Some(units)
  value.tickers.category_formatter_units = Some(units)
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467398336UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666723172467340611UL.reinterpret_as_double(),
      4666723172467401085UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_75() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      13810738617294363034UL.reinterpret_as_double(),
      4607407598781385933UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_76() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      13873646515370590208UL.reinterpret_as_double(),
      4650274478515814400UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_77() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467343360UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666281718548791296UL.reinterpret_as_double(),
      4667164626385895424UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_78() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467398336UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666723172467340611UL.reinterpret_as_double(),
      4666723172467401085UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_79() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      13810738617294363034UL.reinterpret_as_double(),
      4607407598781385933UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_80() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      13835508415244900762UL.reinterpret_as_double(),
      4612136378390124954UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_81() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467343360UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666721963004552806UL.reinterpret_as_double(),
      4666724381930133914UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_82() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(@date.date_locator(tz="UTC"))
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467398336UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666721963004550058UL.reinterpret_as_double(),
      4666724381930191638UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_83() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      13810738617294363034UL.reinterpret_as_double(),
      4607407598781385933UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_84() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [0UL.reinterpret_as_double(), 0UL.reinterpret_as_double()],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      13671443474541909223UL.reinterpret_as_double(),
      4448071437687133415UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_85() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467343360UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666723172467343347UL.reinterpret_as_double(),
      4666723172467343373UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_86() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4602678819172646912UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467398336UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666723172467340599UL.reinterpret_as_double(),
      4666723172467401097UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_87() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4591870180066957722UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467343360UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666717674909204479UL.reinterpret_as_double(),
      4666728670025482241UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_88() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.MicrosecondLocator::new(
      interval=4576918229304087675UL.reinterpret_as_double(),
      tz="UTC",
    ).as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    0UL.reinterpret_as_double(),
    4607182418800017408UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        4666723172467343360UL.reinterpret_as_double(),
        4666723172467343360UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4666717674909204480UL.reinterpret_as_double(),
      4666728670025482240UL.reinterpret_as_double(),
    ],
  )
}

///|
fn units_source_case_89() -> Unit raise {
  let old_epoch = @config.date_epoch()
  defer @config.set_date_epoch(old_epoch)
  @config.set_date_epoch("1970-01-01T00:00:00")
  let value = axis()
  value.tickers.major_locator_kind = Date
  value.tickers.date_locator = Some(
    @date.AutoDateLocator::new(tz="UTC").as_locator(),
  )
  value.tickers.automatic_date_locator = None
  value.tickers.locator = None
  value.stored_view = @core.limits(
    4636737291354636288UL.reinterpret_as_double(),
    4641240890982006784UL.reinterpret_as_double(),
  )
  value.set_autoscale_on(true)
  value.bind_minpos(() => 0.001)
  if value.autoscale_bounds_checked(
      [
        9218868437227405312UL.reinterpret_as_double(),
        18442240474082181120UL.reinterpret_as_double(),
      ],
      margin=0.05,
      stickies=[],
      tight=false,
      data_minpos=Some(() => [1.0 / 0.0]),
    )
    is Some(candidate) {
    ignore(value.set_bound_limits_checked(candidate.lower(), candidate.upper()))
  }
  units_ref_pair(
    (value.stored_view_limits().lower(), value.stored_view_limits().upper()),
    [
      4636737291354636288UL.reinterpret_as_double(),
      4641240890982006784UL.reinterpret_as_double(),
    ],
  )
}

///|
test "original units lifecycle group 0" {
  units_source_case_0() catch {
    error =>
      fail(
        "units source case 0 [category first/repeat mask 0 shared False]: " +
        error.to_string(),
      )
  }
  units_source_case_1() catch {
    error =>
      fail(
        "units source case 1 [category first/repeat mask 1 shared False]: " +
        error.to_string(),
      )
  }
  units_source_case_2() catch {
    error =>
      fail(
        "units source case 2 [category first/repeat mask 2 shared False]: " +
        error.to_string(),
      )
  }
  units_source_case_3() catch {
    error =>
      fail(
        "units source case 3 [category first/repeat mask 4 shared False]: " +
        error.to_string(),
      )
  }
  units_source_case_4() catch {
    error =>
      fail(
        "units source case 4 [category first/repeat mask 8 shared False]: " +
        error.to_string(),
      )
  }
  units_source_case_5() catch {
    error =>
      fail(
        "units source case 5 [category first/repeat mask 15 shared False]: " +
        error.to_string(),
      )
  }
  units_source_case_6() catch {
    error =>
      fail(
        "units source case 6 [category first/repeat mask 0 shared True]: " +
        error.to_string(),
      )
  }
  units_source_case_7() catch {
    error =>
      fail(
        "units source case 7 [category first/repeat mask 1 shared True]: " +
        error.to_string(),
      )
  }
  units_source_case_8() catch {
    error =>
      fail(
        "units source case 8 [category first/repeat mask 2 shared True]: " +
        error.to_string(),
      )
  }
  units_source_case_9() catch {
    error =>
      fail(
        "units source case 9 [category first/repeat mask 4 shared True]: " +
        error.to_string(),
      )
  }
  units_source_case_10() catch {
    error =>
      fail(
        "units source case 10 [category first/repeat mask 8 shared True]: " +
        error.to_string(),
      )
  }
  units_source_case_11() catch {
    error =>
      fail(
        "units source case 11 [category first/repeat mask 15 shared True]: " +
        error.to_string(),
      )
  }
  units_source_case_12() catch {
    error =>
      fail(
        "units source case 12 [date first/rc-repeat/new timezone None]: " +
        error.to_string(),
      )
  }
  units_source_case_13() catch {
    error =>
      fail(
        "units source case 13 [date first/rc-repeat/new timezone 0]: " +
        error.to_string(),
      )
  }
  units_source_case_14() catch {
    error =>
      fail(
        "units source case 14 [date first/rc-repeat/new timezone 10800]: " +
        error.to_string(),
      )
  }
  units_source_case_15() catch {
    error =>
      fail(
        "units source case 15 [date shared preserves explicit formatter]: " +
        error.to_string(),
      )
  }
  units_source_case_16() catch {
    error =>
      fail(
        "units source case 16 [explicit DateConverter initial False]: " +
        error.to_string(),
      )
  }
  units_source_case_17() catch {
    error =>
      fail(
        "units source case 17 [explicit DateConverter initial True]: " +
        error.to_string(),
      )
  }
  units_source_case_18() catch {
    error =>
      fail(
        "units source case 18 [empty homogeneous sequence category]: " +
        error.to_string(),
      )
  }
  units_source_case_19() catch {
    error =>
      fail(
        "units source case 19 [empty homogeneous sequence date]: " +
        error.to_string(),
      )
  }
  units_source_case_20() catch {
    error =>
      fail(
        "units source case 20 [same converter after numeric scale keeps numeric defaults]: " +
        error.to_string(),
      )
  }
  units_source_case_21() catch {
    error =>
      fail(
        "units source case 21 [shared callback partial 0]: " + error.to_string(),
      )
  }
  units_source_case_22() catch {
    error =>
      fail(
        "units source case 22 [shared callback partial 1]: " + error.to_string(),
      )
  }
  units_source_case_23() catch {
    error => fail("units source case 23 [base/ns/0]: " + error.to_string())
  }
  units_source_case_24() catch {
    error => fail("units source case 24 [base/ns/1]: " + error.to_string())
  }
  units_source_case_25() catch {
    error => fail("units source case 25 [base/ns/2]: " + error.to_string())
  }
  units_source_case_26() catch {
    error => fail("units source case 26 [base/ns/3]: " + error.to_string())
  }
  units_source_case_27() catch {
    error => fail("units source case 27 [base/view/4]: " + error.to_string())
  }
  units_source_case_28() catch {
    error => fail("units source case 28 [base/view/5]: " + error.to_string())
  }
  units_source_case_29() catch {
    error => fail("units source case 29 [auto/ns/6]: " + error.to_string())
  }
  units_source_case_30() catch {
    error => fail("units source case 30 [auto/ns/7]: " + error.to_string())
  }
  units_source_case_31() catch {
    error => fail("units source case 31 [auto/ns/8]: " + error.to_string())
  }
}

///|
test "original units lifecycle group 1" {
  units_source_case_32() catch {
    error => fail("units source case 32 [auto/ns/9]: " + error.to_string())
  }
  units_source_case_33() catch {
    error => fail("units source case 33 [auto/view/10]: " + error.to_string())
  }
  units_source_case_34() catch {
    error => fail("units source case 34 [auto/view/11]: " + error.to_string())
  }
  units_source_case_35() catch {
    error => fail("units source case 35 [micro0.5/ns/12]: " + error.to_string())
  }
  units_source_case_36() catch {
    error => fail("units source case 36 [micro0.5/ns/13]: " + error.to_string())
  }
  units_source_case_37() catch {
    error => fail("units source case 37 [micro0.5/ns/14]: " + error.to_string())
  }
  units_source_case_38() catch {
    error => fail("units source case 38 [micro0.5/ns/15]: " + error.to_string())
  }
  units_source_case_39() catch {
    error =>
      fail("units source case 39 [micro0.5/view/16]: " + error.to_string())
  }
  units_source_case_40() catch {
    error =>
      fail("units source case 40 [micro0.5/view/17]: " + error.to_string())
  }
  units_source_case_59() catch {
    error => fail("units source case 59 [category/ns/36]: " + error.to_string())
  }
  units_source_case_60() catch {
    error =>
      fail("units source case 60 [category/view/37]: " + error.to_string())
  }
  units_source_case_61() catch {
    error => fail("units source case 61 [category/ns/38]: " + error.to_string())
  }
  units_source_case_62() catch {
    error =>
      fail("units source case 62 [category/view/39]: " + error.to_string())
  }
  units_source_case_63() catch {
    error => fail("units source case 63 [category/ns/40]: " + error.to_string())
  }
}

///|
test "original units lifecycle group 2" {
  units_source_case_64() catch {
    error =>
      fail("units source case 64 [category/view/41]: " + error.to_string())
  }
  units_source_case_65() catch {
    error => fail("units source case 65 [category/ns/42]: " + error.to_string())
  }
  units_source_case_66() catch {
    error =>
      fail("units source case 66 [category/view/43]: " + error.to_string())
  }
  units_source_case_67() catch {
    error =>
      fail(
        "units source case 67 [category/category_ticks/44]: " +
        error.to_string(),
      )
  }
  units_source_case_68() catch {
    error =>
      fail(
        "units source case 68 [category/category_labels/45]: " +
        error.to_string(),
      )
  }
  units_source_case_69() catch {
    error =>
      fail(
        "units source case 69 [category/category_live_ticks/46]: " +
        error.to_string(),
      )
  }
  units_source_case_70() catch {
    error =>
      fail(
        "units source case 70 [category/category_live_labels/47]: " +
        error.to_string(),
      )
  }
  units_source_case_71() catch {
    error =>
      fail(
        "units source case 71 [category/autoscale/empty]: " + error.to_string(),
      )
  }
  units_source_case_72() catch {
    error =>
      fail(
        "units source case 72 [category/autoscale/point0]: " + error.to_string(),
      )
  }
  units_source_case_73() catch {
    error =>
      fail(
        "units source case 73 [category/autoscale/point10000]: " +
        error.to_string(),
      )
  }
  units_source_case_74() catch {
    error =>
      fail(
        "units source case 74 [category/autoscale/narrow]: " + error.to_string(),
      )
  }
  units_source_case_75() catch {
    error =>
      fail("units source case 75 [auto/autoscale/empty]: " + error.to_string())
  }
  units_source_case_76() catch {
    error =>
      fail("units source case 76 [auto/autoscale/point0]: " + error.to_string())
  }
  units_source_case_77() catch {
    error =>
      fail(
        "units source case 77 [auto/autoscale/point10000]: " + error.to_string(),
      )
  }
  units_source_case_78() catch {
    error =>
      fail("units source case 78 [auto/autoscale/narrow]: " + error.to_string())
  }
  units_source_case_79() catch {
    error =>
      fail("units source case 79 [base/autoscale/empty]: " + error.to_string())
  }
  units_source_case_80() catch {
    error =>
      fail("units source case 80 [base/autoscale/point0]: " + error.to_string())
  }
  units_source_case_81() catch {
    error =>
      fail(
        "units source case 81 [base/autoscale/point10000]: " + error.to_string(),
      )
  }
  units_source_case_82() catch {
    error =>
      fail("units source case 82 [base/autoscale/narrow]: " + error.to_string())
  }
  units_source_case_83() catch {
    error =>
      fail(
        "units source case 83 [micro0.5/autoscale/empty]: " + error.to_string(),
      )
  }
  units_source_case_84() catch {
    error =>
      fail(
        "units source case 84 [micro0.5/autoscale/point0]: " + error.to_string(),
      )
  }
  units_source_case_85() catch {
    error =>
      fail(
        "units source case 85 [micro0.5/autoscale/point10000]: " +
        error.to_string(),
      )
  }
  units_source_case_86() catch {
    error =>
      fail(
        "units source case 86 [micro0.5/autoscale/narrow]: " + error.to_string(),
      )
  }
  units_source_case_87() catch {
    error =>
      fail(
        "units source case 87 [micro0.1/autoscale/point10000]: " +
        error.to_string(),
      )
  }
  units_source_case_88() catch {
    error =>
      fail(
        "units source case 88 [micro0.01/autoscale/point10000]: " +
        error.to_string(),
      )
  }
  units_source_case_89() catch {
    error =>
      fail(
        "units source case 89 [auto/autoscale/empty mutated]: " +
        error.to_string(),
      )
  }
}
