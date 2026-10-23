// Complete original LogFormatter family and actual Axis lifecycle.

///|
// Original source case 0: ignored locations and only real context dependencies
fn log_formatter_axis_case_0() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 1: ignored locations and only real context dependencies
fn log_formatter_axis_case_1() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 2: ignored locations and only real context dependencies
fn log_formatter_axis_case_2() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 3: ignored locations and only real context dependencies
fn log_formatter_axis_case_3() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 4: ignored locations and only real context dependencies
fn log_formatter_axis_case_4() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 5: ignored locations and only real context dependencies
fn log_formatter_axis_case_5() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 6: infinite first threshold returns before all axis access
fn log_formatter_axis_case_6() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    minor_thresholds=Some(
      @ticker.LogMinorThresholds::Tuple(
        @ticker.LogThresholdTuple::new([
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(1.0 / 0.0)),
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(0.0 / 0.0)),
        ]),
      ),
    ),
  )
  f.set_locs()
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 7: infinite first threshold returns before all axis access
fn log_formatter_axis_case_7() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    minor_thresholds=Some(
      @ticker.LogMinorThresholds::Tuple(
        @ticker.LogThresholdTuple::new([
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(-1.0 / 0.0)),
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(0.0 / 0.0)),
        ]),
      ),
    ),
  )
  f.set_locs()
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 8: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_8() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(
      message="AttributeError: transform probe",
    )
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 9: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_9() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(
      message="AttributeError: linthresh probe",
    )
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 10: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_10() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: transform probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe"])
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 11: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_11() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 12: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_12() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="AttributeError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "AttributeError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 13: unbound direct data short offset methods
fn log_formatter_axis_case_13() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let failed = try {
    ignore(f.call(2.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 14: unbound direct data short offset methods
fn log_formatter_axis_case_14() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let failed = try {
    ignore(f.format_data(2.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 15: unbound direct data short offset methods
fn log_formatter_axis_case_15() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.format_data_short(2.0), "2")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 16: unbound direct data short offset methods
fn log_formatter_axis_case_16() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.get_offset(), "")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 17: zero and label-only early call gates bypass axis
fn log_formatter_axis_case_17() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  assert_eq([f.call(0.0), f.call(2.0)], ["0", ""])
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 18: format_data temporarily disables label-only and restores after result or error
fn log_formatter_axis_case_18() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.format_data(2.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 19: format_data preserves cached sublabel gate while disabling label-only
fn log_formatter_axis_case_19() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  binding.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  assert_eq(f.format_data(2.0), "")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 20: narrow context preparation
fn log_formatter_axis_case_20() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "2")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 21: direct call retains cached filter after view change
fn log_formatter_axis_case_21() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]),
  )
  assert_eq(f.call(2.0), "2")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 22: next empty preparation updates cached filter from new view
fn log_formatter_axis_case_22() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]),
  )
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 23: explicit linthresh bypasses transform provider
fn log_formatter_axis_case_23() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(f.call(2.0), "2")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 24: ignored locations and only real context dependencies
fn log_formatter_axis_case_24() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 25: ignored locations and only real context dependencies
fn log_formatter_axis_case_25() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 26: ignored locations and only real context dependencies
fn log_formatter_axis_case_26() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 27: ignored locations and only real context dependencies
fn log_formatter_axis_case_27() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 28: ignored locations and only real context dependencies
fn log_formatter_axis_case_28() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 29: ignored locations and only real context dependencies
fn log_formatter_axis_case_29() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 30: infinite first threshold returns before all axis access
fn log_formatter_axis_case_30() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    minor_thresholds=Some(
      @ticker.LogMinorThresholds::Tuple(
        @ticker.LogThresholdTuple::new([
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(1.0 / 0.0)),
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(0.0 / 0.0)),
        ]),
      ),
    ),
  )
  f.set_locs()
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 31: infinite first threshold returns before all axis access
fn log_formatter_axis_case_31() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    minor_thresholds=Some(
      @ticker.LogMinorThresholds::Tuple(
        @ticker.LogThresholdTuple::new([
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(-1.0 / 0.0)),
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(0.0 / 0.0)),
        ]),
      ),
    ),
  )
  f.set_locs()
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 32: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_32() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(
      message="AttributeError: transform probe",
    )
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 33: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_33() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(
      message="AttributeError: linthresh probe",
    )
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 34: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_34() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: transform probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 35: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_35() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 36: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_36() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="AttributeError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "AttributeError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 37: unbound direct data short offset methods
fn log_formatter_axis_case_37() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let failed = try {
    ignore(f.call(2.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 38: unbound direct data short offset methods
fn log_formatter_axis_case_38() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let failed = try {
    ignore(f.format_data(2.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 39: unbound direct data short offset methods
fn log_formatter_axis_case_39() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.format_data_short(2.0), "2")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 40: unbound direct data short offset methods
fn log_formatter_axis_case_40() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.get_offset(), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 41: zero and label-only early call gates bypass axis
fn log_formatter_axis_case_41() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  assert_eq([f.call(0.0), f.call(2.0)], ["0", ""])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 42: format_data temporarily disables label-only and restores after result or error
fn log_formatter_axis_case_42() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.format_data(2.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 43: format_data preserves cached sublabel gate while disabling label-only
fn log_formatter_axis_case_43() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  binding.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  assert_eq(f.format_data(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 44: narrow context preparation
fn log_formatter_axis_case_44() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "0.3")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 45: direct call retains cached filter after view change
fn log_formatter_axis_case_45() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]),
  )
  assert_eq(f.call(2.0), "0.3")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 46: next empty preparation updates cached filter from new view
fn log_formatter_axis_case_46() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]),
  )
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 47: explicit linthresh bypasses transform provider
fn log_formatter_axis_case_47() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(f.call(2.0), "0.3")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 48: ignored locations and only real context dependencies
fn log_formatter_axis_case_48() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 49: ignored locations and only real context dependencies
fn log_formatter_axis_case_49() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 50: ignored locations and only real context dependencies
fn log_formatter_axis_case_50() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 51: ignored locations and only real context dependencies
fn log_formatter_axis_case_51() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 52: ignored locations and only real context dependencies
fn log_formatter_axis_case_52() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 53: ignored locations and only real context dependencies
fn log_formatter_axis_case_53() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 54: infinite first threshold returns before all axis access
fn log_formatter_axis_case_54() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    minor_thresholds=Some(
      @ticker.LogMinorThresholds::Tuple(
        @ticker.LogThresholdTuple::new([
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(1.0 / 0.0)),
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(0.0 / 0.0)),
        ]),
      ),
    ),
  )
  f.set_locs()
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 55: infinite first threshold returns before all axis access
fn log_formatter_axis_case_55() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    minor_thresholds=Some(
      @ticker.LogMinorThresholds::Tuple(
        @ticker.LogThresholdTuple::new([
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(-1.0 / 0.0)),
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(0.0 / 0.0)),
        ]),
      ),
    ),
  )
  f.set_locs()
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 56: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_56() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(
      message="AttributeError: transform probe",
    )
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 57: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_57() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(
      message="AttributeError: linthresh probe",
    )
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 58: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_58() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: transform probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 59: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_59() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 60: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_60() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="AttributeError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "AttributeError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 61: unbound direct data short offset methods
fn log_formatter_axis_case_61() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.call(2.0), "$\\mathdefault{10^{0.30}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 62: unbound direct data short offset methods
fn log_formatter_axis_case_62() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.format_data(2.0), "10^0.30")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 63: unbound direct data short offset methods
fn log_formatter_axis_case_63() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.format_data_short(2.0), "2")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 64: unbound direct data short offset methods
fn log_formatter_axis_case_64() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.get_offset(), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 65: zero and label-only early call gates bypass axis
fn log_formatter_axis_case_65() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  assert_eq([f.call(0.0), f.call(2.0)], ["$\\mathdefault{0}$", ""])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 66: format_data temporarily disables label-only and restores after result or error
fn log_formatter_axis_case_66() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  f.set_axis(Some(binding))
  assert_eq(f.format_data(2.0), "10^0.30")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 67: format_data preserves cached sublabel gate while disabling label-only
fn log_formatter_axis_case_67() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  binding.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  assert_eq(f.format_data(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 68: narrow context preparation
fn log_formatter_axis_case_68() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "$\\mathdefault{10^{0.30}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 69: direct call retains cached filter after view change
fn log_formatter_axis_case_69() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]),
  )
  assert_eq(f.call(2.0), "$\\mathdefault{10^{0.30}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 70: next empty preparation updates cached filter from new view
fn log_formatter_axis_case_70() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]),
  )
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 71: explicit linthresh bypasses transform provider
fn log_formatter_axis_case_71() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(f.call(2.0), "$\\mathdefault{10^{0.30}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 72: ignored locations and only real context dependencies
fn log_formatter_axis_case_72() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 73: ignored locations and only real context dependencies
fn log_formatter_axis_case_73() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 74: ignored locations and only real context dependencies
fn log_formatter_axis_case_74() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(events, ["probe", "view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 75: ignored locations and only real context dependencies
fn log_formatter_axis_case_75() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 76: ignored locations and only real context dependencies
fn log_formatter_axis_case_76() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 77: ignored locations and only real context dependencies
fn log_formatter_axis_case_77() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let retained = match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) => values
    _ => fail("fresh source list expected")
  }
  let saved = retained.copy()
  defer {
    retained.clear()
    for value in saved {
      retained.push(value)
    }
  }
  retained.clear()
  retained.push(777.0)
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs_view(@ticker.TickValues::from_array([1.0, 2.0]))
  assert_eq(events, ["view"])
  match f.as_base_formatter().locations() {
    @ticker.FormatterLocations::Sequence(values) =>
      assert_true(physical_equal(retained, values))
    _ => fail("ignored input replaced source list")
  }
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 1)
  assert_eq(f.as_base_formatter().locations().get(0), 777.0)
}

///|
// Original source case 78: infinite first threshold returns before all axis access
fn log_formatter_axis_case_78() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    minor_thresholds=Some(
      @ticker.LogMinorThresholds::Tuple(
        @ticker.LogThresholdTuple::new([
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(1.0 / 0.0)),
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(0.0 / 0.0)),
        ]),
      ),
    ),
  )
  f.set_locs()
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 79: infinite first threshold returns before all axis access
fn log_formatter_axis_case_79() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    minor_thresholds=Some(
      @ticker.LogMinorThresholds::Tuple(
        @ticker.LogThresholdTuple::new([
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(-1.0 / 0.0)),
          @ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(0.0 / 0.0)),
        ]),
      ),
    ),
  )
  f.set_locs()
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 80: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_80() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(
      message="AttributeError: transform probe",
    )
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 81: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_81() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(
      message="AttributeError: linthresh probe",
    )
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 82: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_82() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: transform probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 83: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_83() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 84: AttributeError-only transform fallback and view order
fn log_formatter_axis_case_84() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="AttributeError: view probe")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.set_locs(locations=[]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "AttributeError: view probe")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(events, ["probe", "view"])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 85: unbound direct data short offset methods
fn log_formatter_axis_case_85() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.call(2.0), "$\\mathdefault{2\\times10^{0}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 86: unbound direct data short offset methods
fn log_formatter_axis_case_86() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.format_data(2.0), "2x10^0")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 87: unbound direct data short offset methods
fn log_formatter_axis_case_87() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.format_data_short(2.0), "2")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 88: unbound direct data short offset methods
fn log_formatter_axis_case_88() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  assert_eq(f.get_offset(), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 89: zero and label-only early call gates bypass axis
fn log_formatter_axis_case_89() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  assert_eq([f.call(0.0), f.call(2.0)], ["$\\mathdefault{0}$", ""])
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 90: format_data temporarily disables label-only and restores after result or error
fn log_formatter_axis_case_90() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  f.set_axis(Some(binding))
  assert_eq(f.format_data(2.0), "2x10^0")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 91: format_data preserves cached sublabel gate while disabling label-only
fn log_formatter_axis_case_91() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(true),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  binding.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  assert_eq(f.format_data(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(true)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 92: narrow context preparation
fn log_formatter_axis_case_92() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "$\\mathdefault{2\\times10^{0}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 93: direct call retains cached filter after view change
fn log_formatter_axis_case_93() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]),
  )
  assert_eq(f.call(2.0), "$\\mathdefault{2\\times10^{0}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 94: next empty preparation updates cached filter from new view
fn log_formatter_axis_case_94() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    None
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([1.0, 1000000.0]),
  )
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 95: explicit linthresh bypasses transform provider
fn log_formatter_axis_case_95() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
    linthresh=@ticker.LogValue::Numeric(@ticker.ScalarNumber::Number(2.0)),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs()
  assert_eq(f.call(2.0), "$\\mathdefault{2\\times10^{0}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 96: live threshold initial symlog preparation
fn log_formatter_axis_case_96() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "2")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 97: transform threshold change alone retains old cache
fn log_formatter_axis_case_97() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.clear_transform_linthresh()
  assert_eq(f.call(2.0), "2")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 98: next preparation resolves current transform threshold again
fn log_formatter_axis_case_98() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.clear_transform_linthresh()
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 99: live threshold initial symlog preparation
fn log_formatter_axis_case_99() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "0.3")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 100: transform threshold change alone retains old cache
fn log_formatter_axis_case_100() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.clear_transform_linthresh()
  assert_eq(f.call(2.0), "0.3")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 101: next preparation resolves current transform threshold again
fn log_formatter_axis_case_101() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.clear_transform_linthresh()
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 102: live threshold initial symlog preparation
fn log_formatter_axis_case_102() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "$\\mathdefault{10^{0.30}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 103: transform threshold change alone retains old cache
fn log_formatter_axis_case_103() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.clear_transform_linthresh()
  assert_eq(f.call(2.0), "$\\mathdefault{10^{0.30}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 104: next preparation resolves current transform threshold again
fn log_formatter_axis_case_104() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.clear_transform_linthresh()
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 105: live threshold initial symlog preparation
fn log_formatter_axis_case_105() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "$\\mathdefault{2\\times10^{0}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 106: transform threshold change alone retains old cache
fn log_formatter_axis_case_106() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.clear_transform_linthresh()
  assert_eq(f.call(2.0), "$\\mathdefault{2\\times10^{0}}$")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 107: next preparation resolves current transform threshold again
fn log_formatter_axis_case_107() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    Some(@ticker.ScalarNumber::Number(2.0))
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([-2.0, 2.0])
  })
  f.set_axis(Some(binding))
  f.set_locs(locations=[])
  binding.clear_transform_linthresh()
  f.set_locs(locations=[])
  assert_eq(f.call(2.0), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 108: actual primary scale transform threshold context
fn log_formatter_axis_case_108() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.linear_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "1", "0", "1", "", "", "10"],
  )
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 109: actual primary scale transform threshold context
fn log_formatter_axis_case_109() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "1", "0", "1", "", "", "10"],
  )
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 110: actual primary scale transform threshold context
fn log_formatter_axis_case_110() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["2", "1", "0", "1", "2", "5", "10"],
  )
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 111: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_111() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "1", "0", "1", "", "", "10"],
  )
  ignore(axis)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 112: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_112() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "1", "0", "1", "", "", "10"],
  )
  ignore(axis)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 113: actual primary scale transform threshold context
fn log_formatter_axis_case_113() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.linear_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "1", "0", "1", "", "", "10"],
  )
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 114: actual primary scale transform threshold context
fn log_formatter_axis_case_114() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "1", "0", "1", "", "", "10"],
  )
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 115: actual primary scale transform threshold context
fn log_formatter_axis_case_115() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["2", "1", "0", "1", "2", "5", "10"],
  )
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 116: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_116() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "1", "0", "1", "", "", "10"],
  )
  ignore(axis)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 117: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_117() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "1", "0", "1", "", "", "10"],
  )
  ignore(axis)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 118: actual primary scale transform threshold context
fn log_formatter_axis_case_118() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.linear_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "0", "0", "0", "", "", "1"],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 119: actual primary scale transform threshold context
fn log_formatter_axis_case_119() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "0", "0", "0", "", "", "1"],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 120: actual primary scale transform threshold context
fn log_formatter_axis_case_120() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["0.3", "0", "0", "0", "0.3", "0.7", "1"],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 121: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_121() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "0", "0", "0", "", "", "1"],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 122: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_122() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "0", "0", "0", "", "", "1"],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 123: actual primary scale transform threshold context
fn log_formatter_axis_case_123() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.linear_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "0", "0", "0", "", "", "1"],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 124: actual primary scale transform threshold context
fn log_formatter_axis_case_124() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "0", "0", "0", "", "", "1"],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 125: actual primary scale transform threshold context
fn log_formatter_axis_case_125() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["0.3", "0", "0", "0", "0.3", "0.7", "1"],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 126: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_126() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "0", "0", "0", "", "", "1"],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 127: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_127() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    ["", "0", "0", "0", "", "", "1"],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 128: actual primary scale transform threshold context
fn log_formatter_axis_case_128() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.linear_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 129: actual primary scale transform threshold context
fn log_formatter_axis_case_129() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 130: actual primary scale transform threshold context
fn log_formatter_axis_case_130() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "$\\mathdefault{-10^{0.30}}$", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$",
      "$\\mathdefault{10^{0}}$", "$\\mathdefault{10^{0.30}}$", "$\\mathdefault{10^{0.70}}$",
      "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 131: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_131() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 132: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_132() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 133: actual primary scale transform threshold context
fn log_formatter_axis_case_133() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.linear_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 134: actual primary scale transform threshold context
fn log_formatter_axis_case_134() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 135: actual primary scale transform threshold context
fn log_formatter_axis_case_135() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "$\\mathdefault{-10^{0.30}}$", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$",
      "$\\mathdefault{10^{0}}$", "$\\mathdefault{10^{0.30}}$", "$\\mathdefault{10^{0.70}}$",
      "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 136: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_136() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 137: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_137() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 138: actual primary scale transform threshold context
fn log_formatter_axis_case_138() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.linear_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 139: actual primary scale transform threshold context
fn log_formatter_axis_case_139() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 140: actual primary scale transform threshold context
fn log_formatter_axis_case_140() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "$\\mathdefault{-2\\times10^{0}}$", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$",
      "$\\mathdefault{10^{0}}$", "$\\mathdefault{2\\times10^{0}}$", "$\\mathdefault{5\\times10^{0}}$",
      "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 141: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_141() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 142: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_142() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 143: actual primary scale transform threshold context
fn log_formatter_axis_case_143() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.linear_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 144: actual primary scale transform threshold context
fn log_formatter_axis_case_144() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 145: actual primary scale transform threshold context
fn log_formatter_axis_case_145() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "$\\mathdefault{-2\\times10^{0}}$", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$",
      "$\\mathdefault{10^{0}}$", "$\\mathdefault{2\\times10^{0}}$", "$\\mathdefault{5\\times10^{0}}$",
      "$\\mathdefault{10^{1}}$",
    ],
  )
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 146: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_146() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 147: actual secondary own transform never inherits parent linthresh attribute
fn log_formatter_axis_case_147() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  assert_eq(
    f.format_ticks_view(
      @ticker.TickValues::from_array([-2.0, -1.0, 0.0, 1.0, 2.0, 5.0, 10.0]),
    ),
    [
      "", "$\\mathdefault{-10^{0}}$", "$\\mathdefault{0}$", "$\\mathdefault{10^{0}}$",
      "", "", "$\\mathdefault{10^{1}}$",
    ],
  )
  ignore(axis)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 148: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_148() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">10<").count() - 1, 1)
  assert_eq(svg.split(">100<").count() - 1, 1)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 149: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_149() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs(locations=[])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  ignore(svg)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 150: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_150() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      axis.set_named_formatter(replacement.as_base_formatter())
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">late replacement offset<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">10<").count() - 1, 1)
  assert_eq(svg.split(">100<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 3)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 151: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_151() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([1.0, 0.0 / 0.0, 10.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let minor_reads = @ref.Ref(0)
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      minor_reads.val += 1
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(minor_reads.val, 0)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 152: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_152() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">10<").count() - 1, 1)
  assert_eq(svg.split(">100<").count() - 1, 1)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 153: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_153() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs(locations=[])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  ignore(svg)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 154: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_154() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      axis.set_named_formatter(replacement.as_base_formatter())
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">late replacement offset<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">10<").count() - 1, 1)
  assert_eq(svg.split(">100<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 3)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 155: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_155() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([1.0, 0.0 / 0.0, 10.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let minor_reads = @ref.Ref(0)
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      minor_reads.val += 1
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(minor_reads.val, 0)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 156: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_156() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 157: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_157() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs(locations=[])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  ignore(svg)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 158: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_158() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      axis.set_named_formatter(replacement.as_base_formatter())
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">late replacement offset<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 3)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 159: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_159() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([1.0, 0.0 / 0.0, 10.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let minor_reads = @ref.Ref(0)
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      minor_reads.val += 1
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(minor_reads.val, 0)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 160: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_160() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 161: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_161() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs(locations=[])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  ignore(svg)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 162: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_162() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      axis.set_named_formatter(replacement.as_base_formatter())
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">late replacement offset<").count() - 1, 1)
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_eq(svg.split(">1<").count() - 1, 1)
  assert_eq(svg.split(">2<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 3)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 163: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_163() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([1.0, 0.0 / 0.0, 10.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let minor_reads = @ref.Ref(0)
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      minor_reads.val += 1
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(minor_reads.val, 0)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 164: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_164() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">$\\mathdefault{10^{0}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{1}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{2}}$<").count() - 1, 1)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 165: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_165() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs(locations=[])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  ignore(svg)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 166: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_166() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      axis.set_named_formatter(replacement.as_base_formatter())
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">late replacement offset<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{0}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{1}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{2}}$<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 3)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 167: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_167() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([1.0, 0.0 / 0.0, 10.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let minor_reads = @ref.Ref(0)
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      minor_reads.val += 1
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(minor_reads.val, 0)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 168: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_168() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">$\\mathdefault{10^{0}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{1}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{2}}$<").count() - 1, 1)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 169: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_169() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs(locations=[])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  ignore(svg)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 170: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_170() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      axis.set_named_formatter(replacement.as_base_formatter())
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">late replacement offset<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{0}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{1}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{2}}$<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 3)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 171: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_171() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([1.0, 0.0 / 0.0, 10.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let minor_reads = @ref.Ref(0)
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      minor_reads.val += 1
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(minor_reads.val, 0)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 172: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_172() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">$\\mathdefault{10^{0}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{1}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{2}}$<").count() - 1, 1)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 173: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_173() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs(locations=[])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  ignore(svg)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 174: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_174() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      axis.set_named_formatter(replacement.as_base_formatter())
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">late replacement offset<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{0}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{1}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{2}}$<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 3)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 175: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_175() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.x_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([1.0, 0.0 / 0.0, 10.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let minor_reads = @ref.Ref(0)
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      minor_reads.val += 1
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(minor_reads.val, 0)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 176: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_176() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  assert_eq(svg.split(">$\\mathdefault{10^{0}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{1}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{2}}$<").count() - 1, 1)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 177: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_177() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  f.set_locs(locations=[])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let svg = figure.to_svg_checked()
  assert_eq(f.get_offset(), "")
  ignore(svg)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 178: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_178() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([0.5, 1.0, 2.0, 10.0, 100.0, 200.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let replacement = @ticker.FuncFormatter::new((_, _) => "replacement")
  replacement.set_offset_string("late replacement offset")
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      axis.set_named_formatter(replacement.as_base_formatter())
      "minor"
    }).as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">late replacement offset<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{0}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{1}}$<").count() - 1, 1)
  assert_eq(svg.split(">$\\mathdefault{10^{2}}$<").count() - 1, 1)
  assert_eq(svg.split(">minor<").count() - 1, 3)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 179: complete actual Axis.draw full batch Null and late current offset
fn log_formatter_axis_case_179() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure(width=400, height=300)
  let axes = figure.axes()
  axes.set_x_limits(1.0, 100.0)
  axes.set_y_limits(1.0, 100.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  axes.set_x_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  axes.set_y_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let axis = axes.y_axis()
  axis.set_scale(@scale.log_scale())
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  axis.set_named_formatter(f.as_base_formatter())
  axis.set_locator(
    @ticker.FixedLocator::new([1.0, 0.0 / 0.0, 10.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([3.0, 4.0, 5.0]).as_minor_locator(),
  )
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let minor_reads = @ref.Ref(0)
  axis.set_minor_named_formatter(
    @ticker.FuncFormatter::new((_, _) => {
      minor_reads.val += 1
      "minor"
    }).as_base_formatter(),
  )
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(minor_reads.val, 0)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 180: shared owner binding does not invalidate cache before preparation
fn log_formatter_axis_case_180() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  assert_eq(f.call(2.0), "2")
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "1", "",
  ])
  assert_eq(old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "1", "2",
  ])
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 181: actual shared removal rebind and detached-copy cache/view
fn log_formatter_axis_case_181() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  let external = f.copy()
  second.remove()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "1", "2",
  ])
  assert_eq(
    external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])),
    ["1", ""],
  )
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 182: shared owner binding does not invalidate cache before preparation
fn log_formatter_axis_case_182() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  assert_eq(f.call(2.0), "2")
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "1", "",
  ])
  assert_eq(old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "1", "2",
  ])
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 183: actual shared removal rebind and detached-copy cache/view
fn log_formatter_axis_case_183() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  let external = f.copy()
  second.remove()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "1", "2",
  ])
  assert_eq(
    external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])),
    ["1", ""],
  )
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 184: shared owner binding does not invalidate cache before preparation
fn log_formatter_axis_case_184() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  assert_eq(f.call(2.0), "0.3")
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "0", "",
  ])
  assert_eq(old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "0", "0.3",
  ])
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 185: actual shared removal rebind and detached-copy cache/view
fn log_formatter_axis_case_185() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  let external = f.copy()
  second.remove()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "0", "0.3",
  ])
  assert_eq(
    external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])),
    ["0", ""],
  )
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 186: shared owner binding does not invalidate cache before preparation
fn log_formatter_axis_case_186() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  assert_eq(f.call(2.0), "0.3")
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "0", "",
  ])
  assert_eq(old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "0", "0.3",
  ])
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 187: actual shared removal rebind and detached-copy cache/view
fn log_formatter_axis_case_187() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  let external = f.copy()
  second.remove()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "0", "0.3",
  ])
  assert_eq(
    external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])),
    ["0", ""],
  )
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 188: shared owner binding does not invalidate cache before preparation
fn log_formatter_axis_case_188() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  assert_eq(f.call(2.0), "$\\mathdefault{10^{0.30}}$")
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "",
  ])
  assert_eq(old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "$\\mathdefault{10^{0.30}}$",
  ])
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 189: actual shared removal rebind and detached-copy cache/view
fn log_formatter_axis_case_189() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  let external = f.copy()
  second.remove()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "$\\mathdefault{10^{0.30}}$",
  ])
  assert_eq(
    external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])),
    ["$\\mathdefault{10^{0}}$", ""],
  )
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 190: shared owner binding does not invalidate cache before preparation
fn log_formatter_axis_case_190() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  assert_eq(f.call(2.0), "$\\mathdefault{10^{0.30}}$")
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "",
  ])
  assert_eq(old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "$\\mathdefault{10^{0.30}}$",
  ])
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 191: actual shared removal rebind and detached-copy cache/view
fn log_formatter_axis_case_191() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  let external = f.copy()
  second.remove()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "$\\mathdefault{10^{0.30}}$",
  ])
  assert_eq(
    external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])),
    ["$\\mathdefault{10^{0}}$", ""],
  )
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 192: shared owner binding does not invalidate cache before preparation
fn log_formatter_axis_case_192() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  assert_eq(f.call(2.0), "$\\mathdefault{2\\times10^{0}}$")
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "",
  ])
  assert_eq(old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "$\\mathdefault{2\\times10^{0}}$",
  ])
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 193: actual shared removal rebind and detached-copy cache/view
fn log_formatter_axis_case_193() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_x_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_x_named_formatter(f.as_base_formatter())
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  let external = f.copy()
  second.remove()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "$\\mathdefault{2\\times10^{0}}$",
  ])
  assert_eq(
    external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])),
    ["$\\mathdefault{10^{0}}$", ""],
  )
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 194: shared owner binding does not invalidate cache before preparation
fn log_formatter_axis_case_194() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  assert_eq(f.call(2.0), "$\\mathdefault{2\\times10^{0}}$")
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "",
  ])
  assert_eq(old.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "$\\mathdefault{2\\times10^{0}}$",
  ])
  assert_eq(f.axis(), Some(b.formatter_axis_binding()))
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 1)
  assert_true(sublabels.contains(1.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 195: actual shared removal rebind and detached-copy cache/view
fn log_formatter_axis_case_195() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(1.0, 2.0)
  b.set_limits(1.0, 1000000.0)
  a.bind_view_interval(() => (1.0, 2.0))
  b.bind_view_interval(() => (1.0, 1000000.0))
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  first.set_y_named_formatter(f.as_base_formatter())
  f.set_locs(locations=[])
  let old = f.copy()
  second.set_y_named_formatter(f.as_base_formatter())
  ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])))
  let external = f.copy()
  second.remove()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])), [
    "$\\mathdefault{10^{0}}$", "$\\mathdefault{2\\times10^{0}}$",
  ])
  assert_eq(
    external.format_ticks_view(@ticker.TickValues::from_array([1.0, 2.0])),
    ["$\\mathdefault{10^{0}}$", ""],
  )
  assert_eq(f.axis(), Some(a.formatter_axis_binding()))
  assert_eq(external.axis(), Some(b.formatter_axis_binding()))
  ignore(old)
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  let sublabels = f.as_log_formatter().sublabels().unwrap()
  assert_eq(sublabels.length(), 10)
  assert_true(sublabels.contains(1.0))
  assert_true(sublabels.contains(2.0))
  assert_true(sublabels.contains(4.0))
  assert_true(sublabels.contains(8.0))
  assert_true(sublabels.contains(9.0))
  assert_true(sublabels.contains(5.0))
  assert_true(sublabels.contains(10.0))
  assert_true(sublabels.contains(3.0))
  assert_true(sublabels.contains(6.0))
  assert_true(sublabels.contains(7.0))
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 196: short and offset never read view transform or pixel context
fn log_formatter_axis_case_196() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatter::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  binding.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  binding.bind_short_format_delta(_ => {
    raise @core.DataError::InvalidTicks(
      message="ValueError: pixel must not be used",
    )
  })
  assert_eq(f.format_data_short(-0.001), "-0.001")
  assert_eq(f.get_offset(), "")
  assert_true(
    f.label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 197: short and offset never read view transform or pixel context
fn log_formatter_axis_case_197() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterExponent::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  binding.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  binding.bind_short_format_delta(_ => {
    raise @core.DataError::InvalidTicks(
      message="ValueError: pixel must not be used",
    )
  })
  assert_eq(f.format_data_short(-0.001), "-0.001")
  assert_eq(f.get_offset(), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 198: short and offset never read view transform or pixel context
fn log_formatter_axis_case_198() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterMathtext::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  binding.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  binding.bind_short_format_delta(_ => {
    raise @core.DataError::InvalidTicks(
      message="ValueError: pixel must not be used",
    )
  })
  assert_eq(f.format_data_short(-0.001), "-0.001")
  assert_eq(f.get_offset(), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
// Original source case 199: short and offset never read view transform or pixel context
fn log_formatter_axis_case_199() -> Unit raise {
  let saved_classic = @config.classic_mode()
  defer @config.set_classic_mode(saved_classic)
  @config.set_classic_mode(false)
  let saved_min = @config.formatter_min_exponent()
  defer @config.set_formatter_min_exponent(saved_min)
  @config.set_formatter_min_exponent(@bigint.BigInt::from_int(0))
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_text_usetex(false)
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  @config.set_unicode_minus(true)
  let f = @ticker.LogFormatterSciNotation::new(
    label_only_base=@ticker.LogValue::Numeric(
      @ticker.ScalarNumber::Boolean(false),
    ),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  let events : Array[String] = []
  binding.bind_transform_linthresh(() => {
    events.push("probe")
    raise @core.DataError::InvalidTicks(message="ValueError: transform probe")
  })
  binding.bind_view_interval(() => {
    events.push("view")
    @ticker.FormatterViewInterval::Sequence([1.0, 2.0])
  })
  f.set_axis(Some(binding))
  binding.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(message="ValueError: view probe")
  })
  binding.bind_short_format_delta(_ => {
    raise @core.DataError::InvalidTicks(
      message="ValueError: pixel must not be used",
    )
  })
  assert_eq(f.format_data_short(-0.001), "-0.001")
  assert_eq(f.get_offset(), "")
  assert_true(
    f.as_log_formatter().label_only_base()
    is @ticker.LogValue::Numeric(@ticker.ScalarNumber::Boolean(false)),
  )
  assert_true(f.as_log_formatter().sublabels() is None)
  assert_eq(f.as_base_formatter().locations().length(), 0)
}

///|
test "LogFormatter original axis cases 0..31" {
  log_formatter_axis_case_0() catch {
    error =>
      fail("LogFormatter original axis case 0 failed: " + error.to_string())
  }
  log_formatter_axis_case_1() catch {
    error =>
      fail("LogFormatter original axis case 1 failed: " + error.to_string())
  }
  log_formatter_axis_case_2() catch {
    error =>
      fail("LogFormatter original axis case 2 failed: " + error.to_string())
  }
  log_formatter_axis_case_3() catch {
    error =>
      fail("LogFormatter original axis case 3 failed: " + error.to_string())
  }
  log_formatter_axis_case_4() catch {
    error =>
      fail("LogFormatter original axis case 4 failed: " + error.to_string())
  }
  log_formatter_axis_case_5() catch {
    error =>
      fail("LogFormatter original axis case 5 failed: " + error.to_string())
  }
  log_formatter_axis_case_6() catch {
    error =>
      fail("LogFormatter original axis case 6 failed: " + error.to_string())
  }
  log_formatter_axis_case_7() catch {
    error =>
      fail("LogFormatter original axis case 7 failed: " + error.to_string())
  }
  log_formatter_axis_case_8() catch {
    error =>
      fail("LogFormatter original axis case 8 failed: " + error.to_string())
  }
  log_formatter_axis_case_9() catch {
    error =>
      fail("LogFormatter original axis case 9 failed: " + error.to_string())
  }
  log_formatter_axis_case_10() catch {
    error =>
      fail("LogFormatter original axis case 10 failed: " + error.to_string())
  }
  log_formatter_axis_case_11() catch {
    error =>
      fail("LogFormatter original axis case 11 failed: " + error.to_string())
  }
  log_formatter_axis_case_12() catch {
    error =>
      fail("LogFormatter original axis case 12 failed: " + error.to_string())
  }
  log_formatter_axis_case_13() catch {
    error =>
      fail("LogFormatter original axis case 13 failed: " + error.to_string())
  }
  log_formatter_axis_case_14() catch {
    error =>
      fail("LogFormatter original axis case 14 failed: " + error.to_string())
  }
  log_formatter_axis_case_15() catch {
    error =>
      fail("LogFormatter original axis case 15 failed: " + error.to_string())
  }
  log_formatter_axis_case_16() catch {
    error =>
      fail("LogFormatter original axis case 16 failed: " + error.to_string())
  }
  log_formatter_axis_case_17() catch {
    error =>
      fail("LogFormatter original axis case 17 failed: " + error.to_string())
  }
  log_formatter_axis_case_18() catch {
    error =>
      fail("LogFormatter original axis case 18 failed: " + error.to_string())
  }
  log_formatter_axis_case_19() catch {
    error =>
      fail("LogFormatter original axis case 19 failed: " + error.to_string())
  }
  log_formatter_axis_case_20() catch {
    error =>
      fail("LogFormatter original axis case 20 failed: " + error.to_string())
  }
  log_formatter_axis_case_21() catch {
    error =>
      fail("LogFormatter original axis case 21 failed: " + error.to_string())
  }
  log_formatter_axis_case_22() catch {
    error =>
      fail("LogFormatter original axis case 22 failed: " + error.to_string())
  }
  log_formatter_axis_case_23() catch {
    error =>
      fail("LogFormatter original axis case 23 failed: " + error.to_string())
  }
  log_formatter_axis_case_24() catch {
    error =>
      fail("LogFormatter original axis case 24 failed: " + error.to_string())
  }
  log_formatter_axis_case_25() catch {
    error =>
      fail("LogFormatter original axis case 25 failed: " + error.to_string())
  }
  log_formatter_axis_case_26() catch {
    error =>
      fail("LogFormatter original axis case 26 failed: " + error.to_string())
  }
  log_formatter_axis_case_27() catch {
    error =>
      fail("LogFormatter original axis case 27 failed: " + error.to_string())
  }
  log_formatter_axis_case_28() catch {
    error =>
      fail("LogFormatter original axis case 28 failed: " + error.to_string())
  }
  log_formatter_axis_case_29() catch {
    error =>
      fail("LogFormatter original axis case 29 failed: " + error.to_string())
  }
  log_formatter_axis_case_30() catch {
    error =>
      fail("LogFormatter original axis case 30 failed: " + error.to_string())
  }
  log_formatter_axis_case_31() catch {
    error =>
      fail("LogFormatter original axis case 31 failed: " + error.to_string())
  }
}

///|
test "LogFormatter original axis cases 32..63" {
  log_formatter_axis_case_32() catch {
    error =>
      fail("LogFormatter original axis case 32 failed: " + error.to_string())
  }
  log_formatter_axis_case_33() catch {
    error =>
      fail("LogFormatter original axis case 33 failed: " + error.to_string())
  }
  log_formatter_axis_case_34() catch {
    error =>
      fail("LogFormatter original axis case 34 failed: " + error.to_string())
  }
  log_formatter_axis_case_35() catch {
    error =>
      fail("LogFormatter original axis case 35 failed: " + error.to_string())
  }
  log_formatter_axis_case_36() catch {
    error =>
      fail("LogFormatter original axis case 36 failed: " + error.to_string())
  }
  log_formatter_axis_case_37() catch {
    error =>
      fail("LogFormatter original axis case 37 failed: " + error.to_string())
  }
  log_formatter_axis_case_38() catch {
    error =>
      fail("LogFormatter original axis case 38 failed: " + error.to_string())
  }
  log_formatter_axis_case_39() catch {
    error =>
      fail("LogFormatter original axis case 39 failed: " + error.to_string())
  }
  log_formatter_axis_case_40() catch {
    error =>
      fail("LogFormatter original axis case 40 failed: " + error.to_string())
  }
  log_formatter_axis_case_41() catch {
    error =>
      fail("LogFormatter original axis case 41 failed: " + error.to_string())
  }
  log_formatter_axis_case_42() catch {
    error =>
      fail("LogFormatter original axis case 42 failed: " + error.to_string())
  }
  log_formatter_axis_case_43() catch {
    error =>
      fail("LogFormatter original axis case 43 failed: " + error.to_string())
  }
  log_formatter_axis_case_44() catch {
    error =>
      fail("LogFormatter original axis case 44 failed: " + error.to_string())
  }
  log_formatter_axis_case_45() catch {
    error =>
      fail("LogFormatter original axis case 45 failed: " + error.to_string())
  }
  log_formatter_axis_case_46() catch {
    error =>
      fail("LogFormatter original axis case 46 failed: " + error.to_string())
  }
  log_formatter_axis_case_47() catch {
    error =>
      fail("LogFormatter original axis case 47 failed: " + error.to_string())
  }
  log_formatter_axis_case_48() catch {
    error =>
      fail("LogFormatter original axis case 48 failed: " + error.to_string())
  }
  log_formatter_axis_case_49() catch {
    error =>
      fail("LogFormatter original axis case 49 failed: " + error.to_string())
  }
  log_formatter_axis_case_50() catch {
    error =>
      fail("LogFormatter original axis case 50 failed: " + error.to_string())
  }
  log_formatter_axis_case_51() catch {
    error =>
      fail("LogFormatter original axis case 51 failed: " + error.to_string())
  }
  log_formatter_axis_case_52() catch {
    error =>
      fail("LogFormatter original axis case 52 failed: " + error.to_string())
  }
  log_formatter_axis_case_53() catch {
    error =>
      fail("LogFormatter original axis case 53 failed: " + error.to_string())
  }
  log_formatter_axis_case_54() catch {
    error =>
      fail("LogFormatter original axis case 54 failed: " + error.to_string())
  }
  log_formatter_axis_case_55() catch {
    error =>
      fail("LogFormatter original axis case 55 failed: " + error.to_string())
  }
  log_formatter_axis_case_56() catch {
    error =>
      fail("LogFormatter original axis case 56 failed: " + error.to_string())
  }
  log_formatter_axis_case_57() catch {
    error =>
      fail("LogFormatter original axis case 57 failed: " + error.to_string())
  }
  log_formatter_axis_case_58() catch {
    error =>
      fail("LogFormatter original axis case 58 failed: " + error.to_string())
  }
  log_formatter_axis_case_59() catch {
    error =>
      fail("LogFormatter original axis case 59 failed: " + error.to_string())
  }
  log_formatter_axis_case_60() catch {
    error =>
      fail("LogFormatter original axis case 60 failed: " + error.to_string())
  }
  log_formatter_axis_case_61() catch {
    error =>
      fail("LogFormatter original axis case 61 failed: " + error.to_string())
  }
  log_formatter_axis_case_62() catch {
    error =>
      fail("LogFormatter original axis case 62 failed: " + error.to_string())
  }
  log_formatter_axis_case_63() catch {
    error =>
      fail("LogFormatter original axis case 63 failed: " + error.to_string())
  }
}

///|
test "LogFormatter original axis cases 64..95" {
  log_formatter_axis_case_64() catch {
    error =>
      fail("LogFormatter original axis case 64 failed: " + error.to_string())
  }
  log_formatter_axis_case_65() catch {
    error =>
      fail("LogFormatter original axis case 65 failed: " + error.to_string())
  }
  log_formatter_axis_case_66() catch {
    error =>
      fail("LogFormatter original axis case 66 failed: " + error.to_string())
  }
  log_formatter_axis_case_67() catch {
    error =>
      fail("LogFormatter original axis case 67 failed: " + error.to_string())
  }
  log_formatter_axis_case_68() catch {
    error =>
      fail("LogFormatter original axis case 68 failed: " + error.to_string())
  }
  log_formatter_axis_case_69() catch {
    error =>
      fail("LogFormatter original axis case 69 failed: " + error.to_string())
  }
  log_formatter_axis_case_70() catch {
    error =>
      fail("LogFormatter original axis case 70 failed: " + error.to_string())
  }
  log_formatter_axis_case_71() catch {
    error =>
      fail("LogFormatter original axis case 71 failed: " + error.to_string())
  }
  log_formatter_axis_case_72() catch {
    error =>
      fail("LogFormatter original axis case 72 failed: " + error.to_string())
  }
  log_formatter_axis_case_73() catch {
    error =>
      fail("LogFormatter original axis case 73 failed: " + error.to_string())
  }
  log_formatter_axis_case_74() catch {
    error =>
      fail("LogFormatter original axis case 74 failed: " + error.to_string())
  }
  log_formatter_axis_case_75() catch {
    error =>
      fail("LogFormatter original axis case 75 failed: " + error.to_string())
  }
  log_formatter_axis_case_76() catch {
    error =>
      fail("LogFormatter original axis case 76 failed: " + error.to_string())
  }
  log_formatter_axis_case_77() catch {
    error =>
      fail("LogFormatter original axis case 77 failed: " + error.to_string())
  }
  log_formatter_axis_case_78() catch {
    error =>
      fail("LogFormatter original axis case 78 failed: " + error.to_string())
  }
  log_formatter_axis_case_79() catch {
    error =>
      fail("LogFormatter original axis case 79 failed: " + error.to_string())
  }
  log_formatter_axis_case_80() catch {
    error =>
      fail("LogFormatter original axis case 80 failed: " + error.to_string())
  }
  log_formatter_axis_case_81() catch {
    error =>
      fail("LogFormatter original axis case 81 failed: " + error.to_string())
  }
  log_formatter_axis_case_82() catch {
    error =>
      fail("LogFormatter original axis case 82 failed: " + error.to_string())
  }
  log_formatter_axis_case_83() catch {
    error =>
      fail("LogFormatter original axis case 83 failed: " + error.to_string())
  }
  log_formatter_axis_case_84() catch {
    error =>
      fail("LogFormatter original axis case 84 failed: " + error.to_string())
  }
  log_formatter_axis_case_85() catch {
    error =>
      fail("LogFormatter original axis case 85 failed: " + error.to_string())
  }
  log_formatter_axis_case_86() catch {
    error =>
      fail("LogFormatter original axis case 86 failed: " + error.to_string())
  }
  log_formatter_axis_case_87() catch {
    error =>
      fail("LogFormatter original axis case 87 failed: " + error.to_string())
  }
  log_formatter_axis_case_88() catch {
    error =>
      fail("LogFormatter original axis case 88 failed: " + error.to_string())
  }
  log_formatter_axis_case_89() catch {
    error =>
      fail("LogFormatter original axis case 89 failed: " + error.to_string())
  }
  log_formatter_axis_case_90() catch {
    error =>
      fail("LogFormatter original axis case 90 failed: " + error.to_string())
  }
  log_formatter_axis_case_91() catch {
    error =>
      fail("LogFormatter original axis case 91 failed: " + error.to_string())
  }
  log_formatter_axis_case_92() catch {
    error =>
      fail("LogFormatter original axis case 92 failed: " + error.to_string())
  }
  log_formatter_axis_case_93() catch {
    error =>
      fail("LogFormatter original axis case 93 failed: " + error.to_string())
  }
  log_formatter_axis_case_94() catch {
    error =>
      fail("LogFormatter original axis case 94 failed: " + error.to_string())
  }
  log_formatter_axis_case_95() catch {
    error =>
      fail("LogFormatter original axis case 95 failed: " + error.to_string())
  }
}

///|
test "LogFormatter original axis cases 96..127" {
  log_formatter_axis_case_96() catch {
    error =>
      fail("LogFormatter original axis case 96 failed: " + error.to_string())
  }
  log_formatter_axis_case_97() catch {
    error =>
      fail("LogFormatter original axis case 97 failed: " + error.to_string())
  }
  log_formatter_axis_case_98() catch {
    error =>
      fail("LogFormatter original axis case 98 failed: " + error.to_string())
  }
  log_formatter_axis_case_99() catch {
    error =>
      fail("LogFormatter original axis case 99 failed: " + error.to_string())
  }
  log_formatter_axis_case_100() catch {
    error =>
      fail("LogFormatter original axis case 100 failed: " + error.to_string())
  }
  log_formatter_axis_case_101() catch {
    error =>
      fail("LogFormatter original axis case 101 failed: " + error.to_string())
  }
  log_formatter_axis_case_102() catch {
    error =>
      fail("LogFormatter original axis case 102 failed: " + error.to_string())
  }
  log_formatter_axis_case_103() catch {
    error =>
      fail("LogFormatter original axis case 103 failed: " + error.to_string())
  }
  log_formatter_axis_case_104() catch {
    error =>
      fail("LogFormatter original axis case 104 failed: " + error.to_string())
  }
  log_formatter_axis_case_105() catch {
    error =>
      fail("LogFormatter original axis case 105 failed: " + error.to_string())
  }
  log_formatter_axis_case_106() catch {
    error =>
      fail("LogFormatter original axis case 106 failed: " + error.to_string())
  }
  log_formatter_axis_case_107() catch {
    error =>
      fail("LogFormatter original axis case 107 failed: " + error.to_string())
  }
  log_formatter_axis_case_108() catch {
    error =>
      fail("LogFormatter original axis case 108 failed: " + error.to_string())
  }
  log_formatter_axis_case_109() catch {
    error =>
      fail("LogFormatter original axis case 109 failed: " + error.to_string())
  }
  log_formatter_axis_case_110() catch {
    error =>
      fail("LogFormatter original axis case 110 failed: " + error.to_string())
  }
  log_formatter_axis_case_111() catch {
    error =>
      fail("LogFormatter original axis case 111 failed: " + error.to_string())
  }
  log_formatter_axis_case_112() catch {
    error =>
      fail("LogFormatter original axis case 112 failed: " + error.to_string())
  }
  log_formatter_axis_case_113() catch {
    error =>
      fail("LogFormatter original axis case 113 failed: " + error.to_string())
  }
  log_formatter_axis_case_114() catch {
    error =>
      fail("LogFormatter original axis case 114 failed: " + error.to_string())
  }
  log_formatter_axis_case_115() catch {
    error =>
      fail("LogFormatter original axis case 115 failed: " + error.to_string())
  }
  log_formatter_axis_case_116() catch {
    error =>
      fail("LogFormatter original axis case 116 failed: " + error.to_string())
  }
  log_formatter_axis_case_117() catch {
    error =>
      fail("LogFormatter original axis case 117 failed: " + error.to_string())
  }
  log_formatter_axis_case_118() catch {
    error =>
      fail("LogFormatter original axis case 118 failed: " + error.to_string())
  }
  log_formatter_axis_case_119() catch {
    error =>
      fail("LogFormatter original axis case 119 failed: " + error.to_string())
  }
  log_formatter_axis_case_120() catch {
    error =>
      fail("LogFormatter original axis case 120 failed: " + error.to_string())
  }
  log_formatter_axis_case_121() catch {
    error =>
      fail("LogFormatter original axis case 121 failed: " + error.to_string())
  }
  log_formatter_axis_case_122() catch {
    error =>
      fail("LogFormatter original axis case 122 failed: " + error.to_string())
  }
  log_formatter_axis_case_123() catch {
    error =>
      fail("LogFormatter original axis case 123 failed: " + error.to_string())
  }
  log_formatter_axis_case_124() catch {
    error =>
      fail("LogFormatter original axis case 124 failed: " + error.to_string())
  }
  log_formatter_axis_case_125() catch {
    error =>
      fail("LogFormatter original axis case 125 failed: " + error.to_string())
  }
  log_formatter_axis_case_126() catch {
    error =>
      fail("LogFormatter original axis case 126 failed: " + error.to_string())
  }
  log_formatter_axis_case_127() catch {
    error =>
      fail("LogFormatter original axis case 127 failed: " + error.to_string())
  }
}

///|
test "LogFormatter original axis cases 128..159" {
  log_formatter_axis_case_128() catch {
    error =>
      fail("LogFormatter original axis case 128 failed: " + error.to_string())
  }
  log_formatter_axis_case_129() catch {
    error =>
      fail("LogFormatter original axis case 129 failed: " + error.to_string())
  }
  log_formatter_axis_case_130() catch {
    error =>
      fail("LogFormatter original axis case 130 failed: " + error.to_string())
  }
  log_formatter_axis_case_131() catch {
    error =>
      fail("LogFormatter original axis case 131 failed: " + error.to_string())
  }
  log_formatter_axis_case_132() catch {
    error =>
      fail("LogFormatter original axis case 132 failed: " + error.to_string())
  }
  log_formatter_axis_case_133() catch {
    error =>
      fail("LogFormatter original axis case 133 failed: " + error.to_string())
  }
  log_formatter_axis_case_134() catch {
    error =>
      fail("LogFormatter original axis case 134 failed: " + error.to_string())
  }
  log_formatter_axis_case_135() catch {
    error =>
      fail("LogFormatter original axis case 135 failed: " + error.to_string())
  }
  log_formatter_axis_case_136() catch {
    error =>
      fail("LogFormatter original axis case 136 failed: " + error.to_string())
  }
  log_formatter_axis_case_137() catch {
    error =>
      fail("LogFormatter original axis case 137 failed: " + error.to_string())
  }
  log_formatter_axis_case_138() catch {
    error =>
      fail("LogFormatter original axis case 138 failed: " + error.to_string())
  }
  log_formatter_axis_case_139() catch {
    error =>
      fail("LogFormatter original axis case 139 failed: " + error.to_string())
  }
  log_formatter_axis_case_140() catch {
    error =>
      fail("LogFormatter original axis case 140 failed: " + error.to_string())
  }
  log_formatter_axis_case_141() catch {
    error =>
      fail("LogFormatter original axis case 141 failed: " + error.to_string())
  }
  log_formatter_axis_case_142() catch {
    error =>
      fail("LogFormatter original axis case 142 failed: " + error.to_string())
  }
  log_formatter_axis_case_143() catch {
    error =>
      fail("LogFormatter original axis case 143 failed: " + error.to_string())
  }
  log_formatter_axis_case_144() catch {
    error =>
      fail("LogFormatter original axis case 144 failed: " + error.to_string())
  }
  log_formatter_axis_case_145() catch {
    error =>
      fail("LogFormatter original axis case 145 failed: " + error.to_string())
  }
  log_formatter_axis_case_146() catch {
    error =>
      fail("LogFormatter original axis case 146 failed: " + error.to_string())
  }
  log_formatter_axis_case_147() catch {
    error =>
      fail("LogFormatter original axis case 147 failed: " + error.to_string())
  }
  log_formatter_axis_case_148() catch {
    error =>
      fail("LogFormatter original axis case 148 failed: " + error.to_string())
  }
  log_formatter_axis_case_149() catch {
    error =>
      fail("LogFormatter original axis case 149 failed: " + error.to_string())
  }
  log_formatter_axis_case_150() catch {
    error =>
      fail("LogFormatter original axis case 150 failed: " + error.to_string())
  }
  log_formatter_axis_case_151() catch {
    error =>
      fail("LogFormatter original axis case 151 failed: " + error.to_string())
  }
  log_formatter_axis_case_152() catch {
    error =>
      fail("LogFormatter original axis case 152 failed: " + error.to_string())
  }
  log_formatter_axis_case_153() catch {
    error =>
      fail("LogFormatter original axis case 153 failed: " + error.to_string())
  }
  log_formatter_axis_case_154() catch {
    error =>
      fail("LogFormatter original axis case 154 failed: " + error.to_string())
  }
  log_formatter_axis_case_155() catch {
    error =>
      fail("LogFormatter original axis case 155 failed: " + error.to_string())
  }
  log_formatter_axis_case_156() catch {
    error =>
      fail("LogFormatter original axis case 156 failed: " + error.to_string())
  }
  log_formatter_axis_case_157() catch {
    error =>
      fail("LogFormatter original axis case 157 failed: " + error.to_string())
  }
  log_formatter_axis_case_158() catch {
    error =>
      fail("LogFormatter original axis case 158 failed: " + error.to_string())
  }
  log_formatter_axis_case_159() catch {
    error =>
      fail("LogFormatter original axis case 159 failed: " + error.to_string())
  }
}

///|
test "LogFormatter original axis cases 160..191" {
  log_formatter_axis_case_160() catch {
    error =>
      fail("LogFormatter original axis case 160 failed: " + error.to_string())
  }
  log_formatter_axis_case_161() catch {
    error =>
      fail("LogFormatter original axis case 161 failed: " + error.to_string())
  }
  log_formatter_axis_case_162() catch {
    error =>
      fail("LogFormatter original axis case 162 failed: " + error.to_string())
  }
  log_formatter_axis_case_163() catch {
    error =>
      fail("LogFormatter original axis case 163 failed: " + error.to_string())
  }
  log_formatter_axis_case_164() catch {
    error =>
      fail("LogFormatter original axis case 164 failed: " + error.to_string())
  }
  log_formatter_axis_case_165() catch {
    error =>
      fail("LogFormatter original axis case 165 failed: " + error.to_string())
  }
  log_formatter_axis_case_166() catch {
    error =>
      fail("LogFormatter original axis case 166 failed: " + error.to_string())
  }
  log_formatter_axis_case_167() catch {
    error =>
      fail("LogFormatter original axis case 167 failed: " + error.to_string())
  }
  log_formatter_axis_case_168() catch {
    error =>
      fail("LogFormatter original axis case 168 failed: " + error.to_string())
  }
  log_formatter_axis_case_169() catch {
    error =>
      fail("LogFormatter original axis case 169 failed: " + error.to_string())
  }
  log_formatter_axis_case_170() catch {
    error =>
      fail("LogFormatter original axis case 170 failed: " + error.to_string())
  }
  log_formatter_axis_case_171() catch {
    error =>
      fail("LogFormatter original axis case 171 failed: " + error.to_string())
  }
  log_formatter_axis_case_172() catch {
    error =>
      fail("LogFormatter original axis case 172 failed: " + error.to_string())
  }
  log_formatter_axis_case_173() catch {
    error =>
      fail("LogFormatter original axis case 173 failed: " + error.to_string())
  }
  log_formatter_axis_case_174() catch {
    error =>
      fail("LogFormatter original axis case 174 failed: " + error.to_string())
  }
  log_formatter_axis_case_175() catch {
    error =>
      fail("LogFormatter original axis case 175 failed: " + error.to_string())
  }
  log_formatter_axis_case_176() catch {
    error =>
      fail("LogFormatter original axis case 176 failed: " + error.to_string())
  }
  log_formatter_axis_case_177() catch {
    error =>
      fail("LogFormatter original axis case 177 failed: " + error.to_string())
  }
  log_formatter_axis_case_178() catch {
    error =>
      fail("LogFormatter original axis case 178 failed: " + error.to_string())
  }
  log_formatter_axis_case_179() catch {
    error =>
      fail("LogFormatter original axis case 179 failed: " + error.to_string())
  }
  log_formatter_axis_case_180() catch {
    error =>
      fail("LogFormatter original axis case 180 failed: " + error.to_string())
  }
  log_formatter_axis_case_181() catch {
    error =>
      fail("LogFormatter original axis case 181 failed: " + error.to_string())
  }
  log_formatter_axis_case_182() catch {
    error =>
      fail("LogFormatter original axis case 182 failed: " + error.to_string())
  }
  log_formatter_axis_case_183() catch {
    error =>
      fail("LogFormatter original axis case 183 failed: " + error.to_string())
  }
  log_formatter_axis_case_184() catch {
    error =>
      fail("LogFormatter original axis case 184 failed: " + error.to_string())
  }
  log_formatter_axis_case_185() catch {
    error =>
      fail("LogFormatter original axis case 185 failed: " + error.to_string())
  }
  log_formatter_axis_case_186() catch {
    error =>
      fail("LogFormatter original axis case 186 failed: " + error.to_string())
  }
  log_formatter_axis_case_187() catch {
    error =>
      fail("LogFormatter original axis case 187 failed: " + error.to_string())
  }
  log_formatter_axis_case_188() catch {
    error =>
      fail("LogFormatter original axis case 188 failed: " + error.to_string())
  }
  log_formatter_axis_case_189() catch {
    error =>
      fail("LogFormatter original axis case 189 failed: " + error.to_string())
  }
  log_formatter_axis_case_190() catch {
    error =>
      fail("LogFormatter original axis case 190 failed: " + error.to_string())
  }
  log_formatter_axis_case_191() catch {
    error =>
      fail("LogFormatter original axis case 191 failed: " + error.to_string())
  }
}

///|
test "LogFormatter original axis cases 192..199" {
  log_formatter_axis_case_192() catch {
    error =>
      fail("LogFormatter original axis case 192 failed: " + error.to_string())
  }
  log_formatter_axis_case_193() catch {
    error =>
      fail("LogFormatter original axis case 193 failed: " + error.to_string())
  }
  log_formatter_axis_case_194() catch {
    error =>
      fail("LogFormatter original axis case 194 failed: " + error.to_string())
  }
  log_formatter_axis_case_195() catch {
    error =>
      fail("LogFormatter original axis case 195 failed: " + error.to_string())
  }
  log_formatter_axis_case_196() catch {
    error =>
      fail("LogFormatter original axis case 196 failed: " + error.to_string())
  }
  log_formatter_axis_case_197() catch {
    error =>
      fail("LogFormatter original axis case 197 failed: " + error.to_string())
  }
  log_formatter_axis_case_198() catch {
    error =>
      fail("LogFormatter original axis case 198 failed: " + error.to_string())
  }
  log_formatter_axis_case_199() catch {
    error =>
      fail("LogFormatter original axis case 199 failed: " + error.to_string())
  }
}
