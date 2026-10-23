// Generated from complete pinned Formatter classes and real API descriptors.

///|
fn verify_basic_formatter_param_values(
  actual : @ticker.FormatterLocations,
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    let got = actual.get(index)
    if value.is_nan() {
      assert_true(got.is_nan())
    } else {
      assert_eq(got.reinterpret_as_uint64(), value.reinterpret_as_uint64())
    }
  }
}

///|
fn verify_basic_formatter_param_double(
  actual : Double,
  expected : Double,
) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
test "basic formatter original defaults Formatter" {
  let formatter = @ticker.BaseFormatter::new()
  assert_eq(formatter.get_offset(), "")
  verify_basic_formatter_param_values(formatter.locations(), [])
  assert_true(formatter.axis() is None)
  assert_true(formatter.null_formatter() is None)
  assert_true(formatter.fixed_formatter() is None)
  assert_true(formatter.func_formatter() is None)
}

///|
test "basic formatter original defaults NullFormatter" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  assert_eq(formatter.get_offset(), "")
  verify_basic_formatter_param_values(formatter.locations(), [])
  assert_true(formatter.axis() is None)
  assert_true(formatter.null_formatter() is Some(_))
  assert_true(formatter.fixed_formatter() is None)
  assert_true(formatter.func_formatter() is None)
}

///|
test "basic formatter original defaults FixedFormatter" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  assert_eq(formatter.get_offset(), "")
  verify_basic_formatter_param_values(formatter.locations(), [])
  assert_true(formatter.axis() is None)
  assert_true(formatter.null_formatter() is None)
  assert_true(formatter.fixed_formatter() is Some(_))
  assert_true(formatter.func_formatter() is None)
}

///|
test "basic formatter original defaults FuncFormatter" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  assert_eq(formatter.get_offset(), "")
  verify_basic_formatter_param_values(formatter.locations(), [])
  assert_true(formatter.axis() is None)
  assert_true(formatter.null_formatter() is None)
  assert_true(formatter.fixed_formatter() is None)
  assert_true(formatter.func_formatter() is Some(_))
}

///|
test "basic formatter original shared class default locations" {
  let formatter0 = @ticker.BaseFormatter::new()
  let formatter1 = @ticker.NullFormatter::new().as_base_formatter()
  let formatter2 = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let formatter3 = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let shared = match formatter0.locations() {
    Sequence(values) => values
    _ => abort("expected default sequence")
  }
  defer shared.clear()
  match formatter1.locations() {
    Sequence(values) => assert_true(physical_equal(shared, values))
    _ => fail("expected shared sequence")
  }
  match formatter2.locations() {
    Sequence(values) => assert_true(physical_equal(shared, values))
    _ => fail("expected shared sequence")
  }
  match formatter3.locations() {
    Sequence(values) => assert_true(physical_equal(shared, values))
    _ => fail("expected shared sequence")
  }
  shared.push(7.0)
  verify_basic_formatter_param_values(formatter0.locations(), [7.0])
  verify_basic_formatter_param_values(formatter1.locations(), [7.0])
  verify_basic_formatter_param_values(formatter2.locations(), [7.0])
  verify_basic_formatter_param_values(formatter3.locations(), [7.0])
  formatter0.set_locs([9.0])
  verify_basic_formatter_param_values(formatter0.locations(), [9.0])
  verify_basic_formatter_param_values(formatter1.locations(), [7.0])
  verify_basic_formatter_param_values(formatter2.locations(), [7.0])
  verify_basic_formatter_param_values(formatter3.locations(), [7.0])
}

///|
test "basic formatter original callback getter copy and raw replacement" {
  let captured = Ref("original")
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) {
    captured.val
  })
  let retained = formatter.func()
  let shallow = formatter.copy()
  assert_eq(retained(2.0, None), "original")
  assert_eq(shallow.call(2.0), "original")
  captured.val = "captured-mutated"
  assert_eq(formatter.call(2.0, pos=0), "captured-mutated")
  assert_eq(shallow.call(2.0, pos=0), "captured-mutated")
  assert_eq(retained(2.0, None), "captured-mutated")
  formatter.set_func(fn(_value, _position) { "replacement" })
  assert_eq(formatter.call(2.0), "replacement")
  assert_eq(shallow.call(2.0), "captured-mutated")
  assert_eq(retained(2.0, None), "captured-mutated")
}

///|
test "basic formatter original label alias 0" {
  let labels : Array[String] = []
  let formatter = @ticker.FixedFormatter::new(labels)
  let shallow = formatter.copy()
  assert_true(physical_equal(formatter.seq(), labels))
  assert_true(physical_equal(shallow.seq(), labels))
  labels.push("appended")
  labels[0] = "mutated"
  assert_eq(formatter.seq(), ["mutated"])
  assert_eq(shallow.seq(), ["mutated"])
  formatter.set_seq(["replacement"])
  assert_eq(formatter.seq(), ["replacement"])
  assert_eq(shallow.seq(), ["mutated"])
  shallow.seq().push("through-copy")
  assert_eq(labels, ["mutated", "through-copy"])
  let live = formatter.as_base_formatter().fixed_formatter().unwrap()
  live.set_seq(["through-base"])
  assert_eq(formatter.seq(), ["through-base"])
}

///|
test "basic formatter original label alias 1" {
  let labels : Array[String] = [""]
  let formatter = @ticker.FixedFormatter::new(labels)
  let shallow = formatter.copy()
  assert_true(physical_equal(formatter.seq(), labels))
  assert_true(physical_equal(shallow.seq(), labels))
  labels.push("appended")
  labels[0] = "mutated"
  assert_eq(formatter.seq(), ["mutated", "appended"])
  assert_eq(shallow.seq(), ["mutated", "appended"])
  formatter.set_seq(["replacement"])
  assert_eq(formatter.seq(), ["replacement"])
  assert_eq(shallow.seq(), ["mutated", "appended"])
  shallow.seq().push("through-copy")
  assert_eq(labels, ["mutated", "appended", "through-copy"])
  let live = formatter.as_base_formatter().fixed_formatter().unwrap()
  live.set_seq(["through-base"])
  assert_eq(formatter.seq(), ["through-base"])
}

///|
test "basic formatter original label alias 2" {
  let labels : Array[String] = ["a", "b"]
  let formatter = @ticker.FixedFormatter::new(labels)
  let shallow = formatter.copy()
  assert_true(physical_equal(formatter.seq(), labels))
  assert_true(physical_equal(shallow.seq(), labels))
  labels.push("appended")
  labels[0] = "mutated"
  assert_eq(formatter.seq(), ["mutated", "b", "appended"])
  assert_eq(shallow.seq(), ["mutated", "b", "appended"])
  formatter.set_seq(["replacement"])
  assert_eq(formatter.seq(), ["replacement"])
  assert_eq(shallow.seq(), ["mutated", "b", "appended"])
  shallow.seq().push("through-copy")
  assert_eq(labels, ["mutated", "b", "appended", "through-copy"])
  let live = formatter.as_base_formatter().fixed_formatter().unwrap()
  live.set_seq(["through-base"])
  assert_eq(formatter.seq(), ["through-base"])
}

///|
test "basic formatter original label alias 3" {
  let labels : Array[String] = ["-1", "−2", "𝄞"]
  let formatter = @ticker.FixedFormatter::new(labels)
  let shallow = formatter.copy()
  assert_true(physical_equal(formatter.seq(), labels))
  assert_true(physical_equal(shallow.seq(), labels))
  labels.push("appended")
  labels[0] = "mutated"
  assert_eq(formatter.seq(), ["mutated", "−2", "𝄞", "appended"])
  assert_eq(shallow.seq(), ["mutated", "−2", "𝄞", "appended"])
  formatter.set_seq(["replacement"])
  assert_eq(formatter.seq(), ["replacement"])
  assert_eq(shallow.seq(), ["mutated", "−2", "𝄞", "appended"])
  shallow.seq().push("through-copy")
  assert_eq(labels, ["mutated", "−2", "𝄞", "appended", "through-copy"])
  let live = formatter.as_base_formatter().fixed_formatter().unwrap()
  live.set_seq(["through-base"])
  assert_eq(formatter.seq(), ["through-base"])
}

///|
test "basic formatter original label alias 4" {
  let labels : Array[String] = ["same", "same"]
  let formatter = @ticker.FixedFormatter::new(labels)
  let shallow = formatter.copy()
  assert_true(physical_equal(formatter.seq(), labels))
  assert_true(physical_equal(shallow.seq(), labels))
  labels.push("appended")
  labels[0] = "mutated"
  assert_eq(formatter.seq(), ["mutated", "same", "appended"])
  assert_eq(shallow.seq(), ["mutated", "same", "appended"])
  formatter.set_seq(["replacement"])
  assert_eq(formatter.seq(), ["replacement"])
  assert_eq(shallow.seq(), ["mutated", "same", "appended"])
  shallow.seq().push("through-copy")
  assert_eq(labels, ["mutated", "same", "appended", "through-copy"])
  let live = formatter.as_base_formatter().fixed_formatter().unwrap()
  live.set_seq(["through-base"])
  assert_eq(formatter.seq(), ["through-base"])
}

///|
test "basic formatter original offset FixedFormatter 0" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"])
  formatter.set_offset_string("")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "")
  assert_eq(shallow.get_offset(), "")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "")
}

///|
test "basic formatter original offset FixedFormatter 1" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"])
  formatter.set_offset_string("-")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "-")
  assert_eq(shallow.get_offset(), "-")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "-")
}

///|
test "basic formatter original offset FixedFormatter 2" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"])
  formatter.set_offset_string("−1 + 2")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "−1 + 2")
  assert_eq(shallow.get_offset(), "−1 + 2")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "−1 + 2")
}

///|
test "basic formatter original offset FixedFormatter 3" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"])
  formatter.set_offset_string("first\nsecond")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "first\nsecond")
  assert_eq(shallow.get_offset(), "first\nsecond")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "first\nsecond")
}

///|
test "basic formatter original offset FixedFormatter 4" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"])
  formatter.set_offset_string("𝄞 café")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "𝄞 café")
  assert_eq(shallow.get_offset(), "𝄞 café")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "𝄞 café")
}

///|
test "basic formatter original offset FuncFormatter 0" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" })
  formatter.set_offset_string("")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "")
  assert_eq(shallow.get_offset(), "")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "")
}

///|
test "basic formatter original offset FuncFormatter 1" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" })
  formatter.set_offset_string("-")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "-")
  assert_eq(shallow.get_offset(), "-")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "-")
}

///|
test "basic formatter original offset FuncFormatter 2" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" })
  formatter.set_offset_string("−1 + 2")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "−1 + 2")
  assert_eq(shallow.get_offset(), "−1 + 2")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "−1 + 2")
}

///|
test "basic formatter original offset FuncFormatter 3" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" })
  formatter.set_offset_string("first\nsecond")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "first\nsecond")
  assert_eq(shallow.get_offset(), "first\nsecond")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "first\nsecond")
}

///|
test "basic formatter original offset FuncFormatter 4" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" })
  formatter.set_offset_string("𝄞 café")
  let shallow = formatter.copy()
  assert_eq(formatter.as_base_formatter().get_offset(), "𝄞 café")
  assert_eq(shallow.get_offset(), "𝄞 café")
  formatter.set_offset_string("rebound")
  assert_eq(formatter.get_offset(), "rebound")
  assert_eq(shallow.as_base_formatter().get_offset(), "𝄞 café")
}

///|
test "basic formatter original locs list Formatter 0" {
  let formatter = @ticker.BaseFormatter::new()
  let values : Array[Double] = []
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [-2.25])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25])
}

///|
test "basic formatter original locs list Formatter 1" {
  let formatter = @ticker.BaseFormatter::new()
  let values : Array[Double] = [-0.0]
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [-2.25, 7.5])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25, 7.5])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25, 7.5])
}

///|
test "basic formatter original locs list Formatter 2" {
  let formatter = @ticker.BaseFormatter::new()
  let values : Array[Double] = [-3.0, 2.0, 1.0 / 0.0]
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
  verify_basic_formatter_param_values(shallow.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
}

///|
test "basic formatter original locs list NullFormatter 0" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  let values : Array[Double] = []
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [-2.25])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25])
}

///|
test "basic formatter original locs list NullFormatter 1" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  let values : Array[Double] = [-0.0]
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [-2.25, 7.5])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25, 7.5])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25, 7.5])
}

///|
test "basic formatter original locs list NullFormatter 2" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  let values : Array[Double] = [-3.0, 2.0, 1.0 / 0.0]
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
  verify_basic_formatter_param_values(shallow.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
}

///|
test "basic formatter original locs list FixedFormatter 0" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let values : Array[Double] = []
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [-2.25])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25])
}

///|
test "basic formatter original locs list FixedFormatter 1" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let values : Array[Double] = [-0.0]
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [-2.25, 7.5])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25, 7.5])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25, 7.5])
}

///|
test "basic formatter original locs list FixedFormatter 2" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let values : Array[Double] = [-3.0, 2.0, 1.0 / 0.0]
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
  verify_basic_formatter_param_values(shallow.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
}

///|
test "basic formatter original locs list FuncFormatter 0" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let values : Array[Double] = []
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [-2.25])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25])
}

///|
test "basic formatter original locs list FuncFormatter 1" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let values : Array[Double] = [-0.0]
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [-2.25, 7.5])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25, 7.5])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [-2.25, 7.5])
}

///|
test "basic formatter original locs list FuncFormatter 2" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let values : Array[Double] = [-3.0, 2.0, 1.0 / 0.0]
  formatter.set_locs(values)
  let shallow = formatter.copy()
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected list locations")
  }
  values.push(7.5)
  values[0] = -2.25
  verify_basic_formatter_param_values(formatter.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
  verify_basic_formatter_param_values(shallow.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
  formatter.set_locs([9.0])
  verify_basic_formatter_param_values(formatter.locations(), [9.0])
  verify_basic_formatter_param_values(shallow.locations(), [
    -2.25,
    2.0,
    1.0 / 0.0,
    7.5,
  ])
}

///|
test "basic formatter original locs view float64 full" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 8)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
  ])
  owner[0] = 41.5
  verify_basic_formatter_param_values(shallow.locations(), [
    41.5, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
  ])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [
    -3.75, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
  ])
  assert_eq(owner, [-3.75, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [
    -3.75, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
  ])
}

///|
test "basic formatter original locs view float64 reverse" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
  let view = @ticker.TickValues::from_array(owner).view(7, -2, 4)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [
    7.0, 5.0, 3.0, 1.0,
  ])
  owner[7] = 41.5
  verify_basic_formatter_param_values(shallow.locations(), [41.5, 5.0, 3.0, 1.0])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [
    -3.75, 5.0, 3.0, 1.0,
  ])
  assert_eq(owner, [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, -3.75])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [
    -3.75, 5.0, 3.0, 1.0,
  ])
}

///|
test "basic formatter original locs view float64 stride" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
  let view = @ticker.TickValues::from_array(owner).view(1, 2, 4)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [
    1.0, 3.0, 5.0, 7.0,
  ])
  owner[1] = 41.5
  verify_basic_formatter_param_values(shallow.locations(), [41.5, 3.0, 5.0, 7.0])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [
    -3.75, 3.0, 5.0, 7.0,
  ])
  assert_eq(owner, [0.0, -3.75, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [
    -3.75, 3.0, 5.0, 7.0,
  ])
}

///|
test "basic formatter original locs view float64 nested" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
  let view = @ticker.TickValues::from_array(owner)
    .view(1, 2, 4)
    .view(3, -1, 4)
    .view(1, 2, 2)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [5.0, 1.0])
  owner[5] = 41.5
  verify_basic_formatter_param_values(shallow.locations(), [41.5, 1.0])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [-3.75, 1.0])
  assert_eq(owner, [0.0, 1.0, 2.0, 3.0, 4.0, -3.75, 6.0, 7.0])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [-3.75, 1.0])
}

///|
test "basic formatter original locs view float64 zero" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
  let view = @ticker.TickValues::from_array(owner).view(2, 0, 3)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [2.0, 2.0, 2.0])
  owner[2] = 41.5
  verify_basic_formatter_param_values(shallow.locations(), [41.5, 41.5, 41.5])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [
    -3.75, -3.75, -3.75,
  ])
  assert_eq(owner, [0.0, 1.0, -3.75, 3.0, 4.0, 5.0, 6.0, 7.0])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [-3.75, -3.75, -3.75])
}

///|
test "basic formatter original locs view float64 empty" {
  let owner = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 0)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [])
  verify_basic_formatter_param_values(shallow.locations(), [])
  verify_basic_formatter_param_values(formatter.locations(), [])
  assert_eq(owner, [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [])
}

///|
test "basic formatter original locs view int64 full" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 8)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
  ])
  owner[0] = 41L
  verify_basic_formatter_param_values(shallow.locations(), [
    41.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
  ])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [
    -3.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
  ])
  assert_eq(owner, [-3L, 1L, 2L, 3L, 4L, 5L, 6L, 7L])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [
    -3.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
  ])
}

///|
test "basic formatter original locs view int64 reverse" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L]
  let view = @ticker.TickValues::from_int64_array(owner).view(7, -2, 4)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [
    7.0, 5.0, 3.0, 1.0,
  ])
  owner[7] = 41L
  verify_basic_formatter_param_values(shallow.locations(), [41.0, 5.0, 3.0, 1.0])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [
    -3.0, 5.0, 3.0, 1.0,
  ])
  assert_eq(owner, [0L, 1L, 2L, 3L, 4L, 5L, 6L, -3L])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [-3.0, 5.0, 3.0, 1.0])
}

///|
test "basic formatter original locs view int64 stride" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L]
  let view = @ticker.TickValues::from_int64_array(owner).view(1, 2, 4)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [
    1.0, 3.0, 5.0, 7.0,
  ])
  owner[1] = 41L
  verify_basic_formatter_param_values(shallow.locations(), [41.0, 3.0, 5.0, 7.0])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [
    -3.0, 3.0, 5.0, 7.0,
  ])
  assert_eq(owner, [0L, -3L, 2L, 3L, 4L, 5L, 6L, 7L])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [-3.0, 3.0, 5.0, 7.0])
}

///|
test "basic formatter original locs view int64 nested" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L]
  let view = @ticker.TickValues::from_int64_array(owner)
    .view(1, 2, 4)
    .view(3, -1, 4)
    .view(1, 2, 2)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [5.0, 1.0])
  owner[5] = 41L
  verify_basic_formatter_param_values(shallow.locations(), [41.0, 1.0])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [-3.0, 1.0])
  assert_eq(owner, [0L, 1L, 2L, 3L, 4L, -3L, 6L, 7L])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [-3.0, 1.0])
}

///|
test "basic formatter original locs view int64 zero" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L]
  let view = @ticker.TickValues::from_int64_array(owner).view(2, 0, 3)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [2.0, 2.0, 2.0])
  owner[2] = 41L
  verify_basic_formatter_param_values(shallow.locations(), [41.0, 41.0, 41.0])
  view.set(0, -3.75)
  verify_basic_formatter_param_values(formatter.locations(), [-3.0, -3.0, -3.0])
  assert_eq(owner, [0L, 1L, -3L, 3L, 4L, 5L, 6L, 7L])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [-3.0, -3.0, -3.0])
}

///|
test "basic formatter original locs view int64 empty" {
  let owner = [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 0)
  let formatter = @ticker.NullFormatter::new()
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected ndarray locations")
  }
  verify_basic_formatter_param_values(formatter.locations(), [])
  verify_basic_formatter_param_values(shallow.locations(), [])
  verify_basic_formatter_param_values(formatter.locations(), [])
  assert_eq(owner, [0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L])
  formatter.set_locs([])
  verify_basic_formatter_param_values(shallow.locations(), [])
}

///|
test "basic formatter original locs index False -2147483648" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs([1.0, -0.0, 1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.locations().get(-2147483648))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "basic formatter original locs index False -4" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs([1.0, -0.0, 1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.locations().get(-4))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "basic formatter original locs index False -3" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs([1.0, -0.0, 1.0 / 0.0])
  verify_basic_formatter_param_double(formatter.locations().get(-3), 1.0)
}

///|
test "basic formatter original locs index False -1" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs([1.0, -0.0, 1.0 / 0.0])
  verify_basic_formatter_param_double(formatter.locations().get(-1), 1.0 / 0.0)
}

///|
test "basic formatter original locs index False 0" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs([1.0, -0.0, 1.0 / 0.0])
  verify_basic_formatter_param_double(formatter.locations().get(0), 1.0)
}

///|
test "basic formatter original locs index False 2" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs([1.0, -0.0, 1.0 / 0.0])
  verify_basic_formatter_param_double(formatter.locations().get(2), 1.0 / 0.0)
}

///|
test "basic formatter original locs index False 3" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs([1.0, -0.0, 1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.locations().get(3))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "basic formatter original locs index False 2147483647" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs([1.0, -0.0, 1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.locations().get(2147483647))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "basic formatter original locs index True -2147483648" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs_view(
    @ticker.TickValues::from_array([1.0, -0.0, 1.0 / 0.0]),
  )
  assert_true(
    try {
      ignore(formatter.locations().get(-2147483648))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "basic formatter original locs index True -4" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs_view(
    @ticker.TickValues::from_array([1.0, -0.0, 1.0 / 0.0]),
  )
  assert_true(
    try {
      ignore(formatter.locations().get(-4))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "basic formatter original locs index True -3" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs_view(
    @ticker.TickValues::from_array([1.0, -0.0, 1.0 / 0.0]),
  )
  verify_basic_formatter_param_double(formatter.locations().get(-3), 1.0)
}

///|
test "basic formatter original locs index True -1" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs_view(
    @ticker.TickValues::from_array([1.0, -0.0, 1.0 / 0.0]),
  )
  verify_basic_formatter_param_double(formatter.locations().get(-1), 1.0 / 0.0)
}

///|
test "basic formatter original locs index True 0" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs_view(
    @ticker.TickValues::from_array([1.0, -0.0, 1.0 / 0.0]),
  )
  verify_basic_formatter_param_double(formatter.locations().get(0), 1.0)
}

///|
test "basic formatter original locs index True 2" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs_view(
    @ticker.TickValues::from_array([1.0, -0.0, 1.0 / 0.0]),
  )
  verify_basic_formatter_param_double(formatter.locations().get(2), 1.0 / 0.0)
}

///|
test "basic formatter original locs index True 3" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs_view(
    @ticker.TickValues::from_array([1.0, -0.0, 1.0 / 0.0]),
  )
  assert_true(
    try {
      ignore(formatter.locations().get(3))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "basic formatter original locs index True 2147483647" {
  let formatter = @ticker.BaseFormatter::new()
  formatter.set_locs_view(
    @ticker.TickValues::from_array([1.0, -0.0, 1.0 / 0.0]),
  )
  assert_true(
    try {
      ignore(formatter.locations().get(2147483647))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "basic formatter original axis copy Formatter 0" {
  let formatter = @ticker.BaseFormatter::new()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy Formatter 1" {
  let formatter = @ticker.BaseFormatter::new()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=-0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=-0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), -0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy Formatter 2" {
  let formatter = @ticker.BaseFormatter::new()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.25)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.25)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.25)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy Formatter 3" {
  let formatter = @ticker.BaseFormatter::new()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=1.0 / 0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=1.0 / 0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 1.0 / 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy Formatter 4" {
  let formatter = @ticker.BaseFormatter::new()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.0 / 0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.0 / 0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.0 / 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy NullFormatter 0" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy NullFormatter 1" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=-0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=-0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), -0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy NullFormatter 2" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.25)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.25)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.25)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy NullFormatter 3" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=1.0 / 0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=1.0 / 0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 1.0 / 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy NullFormatter 4" {
  let formatter = @ticker.NullFormatter::new().as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.0 / 0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.0 / 0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.0 / 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FixedFormatter 0" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FixedFormatter 1" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=-0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=-0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), -0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FixedFormatter 2" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.25)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.25)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.25)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FixedFormatter 3" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=1.0 / 0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=1.0 / 0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 1.0 / 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FixedFormatter 4" {
  let formatter = @ticker.FixedFormatter::new(["first", "second"]).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.0 / 0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.0 / 0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.0 / 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FuncFormatter 0" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FuncFormatter 1" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=-0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=-0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), -0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FuncFormatter 2" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.25)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.25)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.25)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FuncFormatter 3" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=1.0 / 0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=1.0 / 0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 1.0 / 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}

///|
test "basic formatter original axis copy FuncFormatter 4" {
  let formatter = @ticker.FuncFormatter::new(fn(_value, _position) { "source" }).as_base_formatter()
  let first = @ticker.FormatterAxisBinding::new()
  let second = @ticker.FormatterAxisBinding::new()
  assert_true(first != second)
  assert_true(!first.is_dummy())
  assert_true(first.dummy_minpos() is None)
  formatter.set_axis(Some(first))
  let shallow = formatter.copy()
  formatter.create_dummy_axis(minpos=0.0 / 0.0)
  assert_eq(formatter.axis(), Some(first))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(Some(second))
  assert_eq(formatter.axis(), Some(second))
  assert_eq(shallow.axis(), Some(first))
  formatter.set_axis(None)
  formatter.create_dummy_axis(minpos=0.0 / 0.0)
  let dummy = formatter.axis().unwrap()
  assert_true(dummy.is_dummy())
  verify_basic_formatter_param_double(dummy.dummy_minpos().unwrap(), 0.0 / 0.0)
  formatter.create_dummy_axis(minpos=999.0)
  assert_eq(formatter.axis(), Some(dummy))
  formatter.set_axis(None)
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(first))
}
