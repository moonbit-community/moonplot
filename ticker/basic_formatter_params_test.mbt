///|
test "named formatter base adapters retain identity and virtual state" {
  let labels = ["first"]
  let formatter = @ticker.FixedFormatter::new(labels)
  let base = formatter.as_base_formatter()
  let through_base = base.fixed_formatter().unwrap()
  assert_true(physical_equal(base, through_base.as_base_formatter()))
  through_base.set_offset_string("offset")
  assert_eq(formatter.get_offset(), "offset")
  let shallow = base.copy()
  assert_true(!physical_equal(base, shallow))
  let copied = shallow.fixed_formatter().unwrap()
  labels.push("second")
  assert_eq(copied.seq(), ["first", "second"])
  copied.set_seq(["copy"])
  copied.set_offset_string("copy offset")
  assert_eq(formatter.seq(), ["first", "second"])
  assert_eq(formatter.get_offset(), "offset")
  assert_eq(shallow.get_offset(), "copy offset")
  let null = @ticker.NullFormatter::new()
  assert_true(
    physical_equal(
      null.as_base_formatter(),
      null.as_base_formatter().null_formatter().unwrap().as_base_formatter(),
    ),
  )
  let function = @ticker.FuncFormatter::new(fn(_value, _position) { "value" })
  assert_true(
    physical_equal(
      function.as_base_formatter(),
      function.as_base_formatter().func_formatter().unwrap().as_base_formatter(),
    ),
  )
}

///|
test "named formatter locations retain exact integer buffer behind Double access" {
  let owner = [9007199254740993L, 9007199254740992L, 7L]
  let view = @ticker.TickValues::from_int64_array(owner).view(2, -1, 3)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  let retained = match shallow.locations() {
    NdArray(values) => values
    _ => abort("expected retained numeric view")
  }
  assert_true(physical_equal(retained, view))
  assert_eq(owner[0], 9007199254740993L)
  retained.set(0, -3.75)
  assert_eq(owner, [9007199254740993L, 9007199254740992L, -3L])
  formatter.set_locs([11.0])
  assert_eq(shallow.locations().get(0), -3.0)
  assert_eq(formatter.locations().get(0), 11.0)
}

///|
test "named formatter axis equality compares binding identity" {
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.25)
  assert_eq(formatter.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=-0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  assert_eq(
    dummy.dummy_minpos().unwrap().reinterpret_as_uint64(),
    9223372036854775808UL,
  )
  assert_eq(shallow.axis(), Some(first))
  let other = @ticker.BaseFormatter::new()
  other.create_dummy_axis(minpos=-0.0)
  assert_true(other.axis().unwrap() != dummy)
}

///|
test "named formatter mutable labels coexist with legacy copied labels" {
  let labels = ["original"]
  let legacy = @ticker.fixed_formatter(labels)
  let named = @ticker.FixedFormatter::new(labels)
  labels[0] = "changed"
  labels.push("new")
  assert_eq(legacy.format_values([0.0, 1.0]), ["original", ""])
  assert_eq(named.format_ticks([0.0, 1.0]), ["changed", "new"])
  assert_eq(legacy.format_value(0.0), "original")
  assert_eq(named.format_data(0.0), "")
}
