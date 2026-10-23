// Complete pinned string formatter object methods; scalar engines use separate references.

///|
fn verify_string_formatter_param_locations(
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
test "string formatter original constructor FormatStrFormatter 0" {
  let formatter = @ticker.FormatStrFormatter::new("")
  assert_eq(formatter.fmt(), "")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().format_str_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor FormatStrFormatter 1" {
  let formatter = @ticker.FormatStrFormatter::new("plain")
  assert_eq(formatter.fmt(), "plain")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().format_str_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor FormatStrFormatter 2" {
  let formatter = @ticker.FormatStrFormatter::new("-")
  assert_eq(formatter.fmt(), "-")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().format_str_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor FormatStrFormatter 3" {
  let formatter = @ticker.FormatStrFormatter::new("𝄞 café")
  assert_eq(formatter.fmt(), "𝄞 café")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().format_str_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor FormatStrFormatter 4" {
  let formatter = @ticker.FormatStrFormatter::new("%")
  assert_eq(formatter.fmt(), "%")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().format_str_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor FormatStrFormatter 5" {
  let formatter = @ticker.FormatStrFormatter::new("{")
  assert_eq(formatter.fmt(), "{")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().format_str_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor FormatStrFormatter 6" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  assert_eq(formatter.fmt(), "%s")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().format_str_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor FormatStrFormatter 7" {
  let formatter = @ticker.FormatStrFormatter::new("{x}/{pos}")
  assert_eq(formatter.fmt(), "{x}/{pos}")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().format_str_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().str_method_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor StrMethodFormatter 0" {
  let formatter = @ticker.StrMethodFormatter::new("")
  assert_eq(formatter.fmt(), "")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().str_method_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor StrMethodFormatter 1" {
  let formatter = @ticker.StrMethodFormatter::new("plain")
  assert_eq(formatter.fmt(), "plain")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().str_method_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor StrMethodFormatter 2" {
  let formatter = @ticker.StrMethodFormatter::new("-")
  assert_eq(formatter.fmt(), "-")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().str_method_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor StrMethodFormatter 3" {
  let formatter = @ticker.StrMethodFormatter::new("𝄞 café")
  assert_eq(formatter.fmt(), "𝄞 café")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().str_method_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor StrMethodFormatter 4" {
  let formatter = @ticker.StrMethodFormatter::new("%")
  assert_eq(formatter.fmt(), "%")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().str_method_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor StrMethodFormatter 5" {
  let formatter = @ticker.StrMethodFormatter::new("{")
  assert_eq(formatter.fmt(), "{")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().str_method_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor StrMethodFormatter 6" {
  let formatter = @ticker.StrMethodFormatter::new("%s")
  assert_eq(formatter.fmt(), "%s")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().str_method_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original constructor StrMethodFormatter 7" {
  let formatter = @ticker.StrMethodFormatter::new("{x}/{pos}")
  assert_eq(formatter.fmt(), "{x}/{pos}")
  assert_eq(formatter.get_offset(), "")
  assert_true(formatter.axis() is None)
  assert_eq(formatter.locations().length(), 0)
  assert_true(formatter.as_base_formatter().str_method_formatter() is Some(_))
  assert_true(formatter.as_base_formatter().format_str_formatter() is None)
  assert_true(formatter.as_base_formatter().fixed_formatter() is None)
  assert_true(formatter.as_base_formatter().func_formatter() is None)
}

///|
test "string formatter original raw slot copy FormatStrFormatter 0" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("")
  assert_eq(formatter.fmt(), "")
  assert_eq(shallow.fmt(), "%s")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy FormatStrFormatter 1" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("plain")
  assert_eq(formatter.fmt(), "plain")
  assert_eq(shallow.fmt(), "%s")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy FormatStrFormatter 2" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("%")
  assert_eq(formatter.fmt(), "%")
  assert_eq(shallow.fmt(), "%s")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy FormatStrFormatter 3" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("{")
  assert_eq(formatter.fmt(), "{")
  assert_eq(shallow.fmt(), "%s")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy FormatStrFormatter 4" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("𝄞 %s")
  assert_eq(formatter.fmt(), "𝄞 %s")
  assert_eq(shallow.fmt(), "%s")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy FormatStrFormatter 5" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("𝄞 {x}")
  assert_eq(formatter.fmt(), "𝄞 {x}")
  assert_eq(shallow.fmt(), "%s")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy StrMethodFormatter 0" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("")
  assert_eq(formatter.fmt(), "")
  assert_eq(shallow.fmt(), "{x}")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy StrMethodFormatter 1" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("plain")
  assert_eq(formatter.fmt(), "plain")
  assert_eq(shallow.fmt(), "{x}")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy StrMethodFormatter 2" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("%")
  assert_eq(formatter.fmt(), "%")
  assert_eq(shallow.fmt(), "{x}")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy StrMethodFormatter 3" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("{")
  assert_eq(formatter.fmt(), "{")
  assert_eq(shallow.fmt(), "{x}")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy StrMethodFormatter 4" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("𝄞 %s")
  assert_eq(formatter.fmt(), "𝄞 %s")
  assert_eq(shallow.fmt(), "{x}")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original raw slot copy StrMethodFormatter 5" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  let locations = [1.0]
  let axis = @ticker.FormatterAxisBinding::new()
  formatter.set_locs(locations)
  formatter.set_axis(Some(axis))
  let shallow = formatter.copy()
  formatter.set_fmt("𝄞 {x}")
  assert_eq(formatter.fmt(), "𝄞 {x}")
  assert_eq(shallow.fmt(), "{x}")
  assert_eq(shallow.axis(), Some(axis))
  locations.push(2.0)
  verify_string_formatter_param_locations(formatter.locations(), [1.0, 2.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  formatter.set_locs([9.0])
  formatter.set_axis(None)
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  verify_string_formatter_param_locations(shallow.locations(), [1.0, 2.0])
  assert_true(formatter.axis() is None)
  assert_eq(shallow.axis(), Some(axis))
  assert_eq(formatter.get_offset(), "")
  assert_eq(shallow.get_offset(), "")
}

///|
test "string formatter original common class default" {
  let old = @ticker.NullFormatter::new()
  let percent = @ticker.FormatStrFormatter::new("%s")
  let method_formatter = @ticker.StrMethodFormatter::new("{x}")
  let shared = match old.locations() {
    Sequence(values) => values
    _ => abort("expected default list")
  }
  defer shared.clear()
  shared.push(7.0)
  verify_string_formatter_param_locations(old.locations(), [7.0])
  verify_string_formatter_param_locations(percent.locations(), [7.0])
  verify_string_formatter_param_locations(method_formatter.locations(), [7.0])
  percent.set_locs([9.0])
  verify_string_formatter_param_locations(old.locations(), [7.0])
  verify_string_formatter_param_locations(percent.locations(), [9.0])
  verify_string_formatter_param_locations(method_formatter.locations(), [7.0])
}

///|
test "string formatter original view copy FormatStrFormatter float64 full" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 4)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(-0.0)", "np.float64(1.25)", "np.float64(3.5)", "np.float64(-7.0)",
  ])
  owner[0] = 41.5
  assert_eq(shallow.format_ticks_view(view), [
    "np.float64(41.5)", "np.float64(1.25)", "np.float64(3.5)", "np.float64(-7.0)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 1.25, 3.5, -7.0,
  ])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 1.25, 3.5, -7.0,
  ])
}

///|
test "string formatter original view copy FormatStrFormatter float64 reverse" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(3, -1, 4)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(-7.0)", "np.float64(3.5)", "np.float64(1.25)", "np.float64(-0.0)",
  ])
  owner[3] = 41.5
  assert_eq(shallow.format_ticks_view(view), [
    "np.float64(41.5)", "np.float64(3.5)", "np.float64(1.25)", "np.float64(-0.0)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 3.5, 1.25, -0.0,
  ])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 3.5, 1.25, -0.0,
  ])
}

///|
test "string formatter original view copy FormatStrFormatter float64 nested" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(1, 2, 2).view(1, -1, 2)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(-7.0)", "np.float64(1.25)",
  ])
  owner[3] = 41.5
  assert_eq(shallow.format_ticks_view(view), [
    "np.float64(41.5)", "np.float64(1.25)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [41.5, 1.25])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [41.5, 1.25])
}

///|
test "string formatter original view copy FormatStrFormatter float64 zero" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(2, 0, 3)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(3.5)", "np.float64(3.5)", "np.float64(3.5)",
  ])
  owner[2] = 41.5
  assert_eq(shallow.format_ticks_view(view), [
    "np.float64(41.5)", "np.float64(41.5)", "np.float64(41.5)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 41.5, 41.5,
  ])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 41.5, 41.5,
  ])
}

///|
test "string formatter original view copy FormatStrFormatter float64 empty" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 0)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [])
  assert_eq(shallow.format_ticks_view(view), [])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [])
}

///|
test "string formatter original view copy FormatStrFormatter int64 full" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 4)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(9007199254740993)", "np.int64(-9223372036854775808)", "np.int64(7)",
    "np.int64(-1)",
  ])
  owner[0] = 41L
  assert_eq(shallow.format_ticks_view(view), [
    "np.int64(41)", "np.int64(-9223372036854775808)", "np.int64(7)", "np.int64(-1)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, -9.223372036854776e+18, 7.0, -1.0,
  ])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, -9.223372036854776e+18, 7.0, -1.0,
  ])
}

///|
test "string formatter original view copy FormatStrFormatter int64 reverse" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(3, -1, 4)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(-1)", "np.int64(7)", "np.int64(-9223372036854775808)", "np.int64(9007199254740993)",
  ])
  owner[3] = 41L
  assert_eq(shallow.format_ticks_view(view), [
    "np.int64(41)", "np.int64(7)", "np.int64(-9223372036854775808)", "np.int64(9007199254740993)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, 7.0, -9.223372036854776e+18, 9007199254740992.0,
  ])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, 7.0, -9.223372036854776e+18, 9007199254740992.0,
  ])
}

///|
test "string formatter original view copy FormatStrFormatter int64 nested" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner)
    .view(1, 2, 2)
    .view(1, -1, 2)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(-1)", "np.int64(-9223372036854775808)",
  ])
  owner[3] = 41L
  assert_eq(shallow.format_ticks_view(view), [
    "np.int64(41)", "np.int64(-9223372036854775808)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, -9.223372036854776e+18,
  ])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, -9.223372036854776e+18,
  ])
}

///|
test "string formatter original view copy FormatStrFormatter int64 zero" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(2, 0, 3)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(7)", "np.int64(7)", "np.int64(7)",
  ])
  owner[2] = 41L
  assert_eq(shallow.format_ticks_view(view), [
    "np.int64(41)", "np.int64(41)", "np.int64(41)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, 41.0, 41.0,
  ])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, 41.0, 41.0,
  ])
}

///|
test "string formatter original view copy FormatStrFormatter int64 empty" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 0)
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [])
  assert_eq(shallow.format_ticks_view(view), [])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [])
  formatter.set_fmt("rebound:%s")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "%r")
  verify_string_formatter_param_locations(shallow.locations(), [])
}

///|
test "string formatter original view copy StrMethodFormatter float64 full" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 4)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(−0.0)", "np.float64(1.25)", "np.float64(3.5)", "np.float64(−7.0)",
  ])
  owner[0] = 41.5
  assert_eq(shallow.format_ticks_view(view), [
    "np.float64(41.5)", "np.float64(1.25)", "np.float64(3.5)", "np.float64(−7.0)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 1.25, 3.5, -7.0,
  ])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 1.25, 3.5, -7.0,
  ])
}

///|
test "string formatter original view copy StrMethodFormatter float64 reverse" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(3, -1, 4)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(−7.0)", "np.float64(3.5)", "np.float64(1.25)", "np.float64(−0.0)",
  ])
  owner[3] = 41.5
  assert_eq(shallow.format_ticks_view(view), [
    "np.float64(41.5)", "np.float64(3.5)", "np.float64(1.25)", "np.float64(−0.0)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 3.5, 1.25, -0.0,
  ])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 3.5, 1.25, -0.0,
  ])
}

///|
test "string formatter original view copy StrMethodFormatter float64 nested" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(1, 2, 2).view(1, -1, 2)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(−7.0)", "np.float64(1.25)",
  ])
  owner[3] = 41.5
  assert_eq(shallow.format_ticks_view(view), [
    "np.float64(41.5)", "np.float64(1.25)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [41.5, 1.25])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [41.5, 1.25])
}

///|
test "string formatter original view copy StrMethodFormatter float64 zero" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(2, 0, 3)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(3.5)", "np.float64(3.5)", "np.float64(3.5)",
  ])
  owner[2] = 41.5
  assert_eq(shallow.format_ticks_view(view), [
    "np.float64(41.5)", "np.float64(41.5)", "np.float64(41.5)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 41.5, 41.5,
  ])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.5, 41.5, 41.5,
  ])
}

///|
test "string formatter original view copy StrMethodFormatter float64 empty" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [-0.0, 1.25, 3.5, -7.0]
  let view = @ticker.TickValues::from_array(owner).view(0, 1, 0)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [])
  assert_eq(shallow.format_ticks_view(view), [])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [])
}

///|
test "string formatter original view copy StrMethodFormatter int64 full" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 4)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(9007199254740993)", "np.int64(−9223372036854775808)", "np.int64(7)",
    "np.int64(−1)",
  ])
  owner[0] = 41L
  assert_eq(shallow.format_ticks_view(view), [
    "np.int64(41)", "np.int64(−9223372036854775808)", "np.int64(7)", "np.int64(−1)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, -9.223372036854776e+18, 7.0, -1.0,
  ])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, -9.223372036854776e+18, 7.0, -1.0,
  ])
}

///|
test "string formatter original view copy StrMethodFormatter int64 reverse" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(3, -1, 4)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(−1)", "np.int64(7)", "np.int64(−9223372036854775808)", "np.int64(9007199254740993)",
  ])
  owner[3] = 41L
  assert_eq(shallow.format_ticks_view(view), [
    "np.int64(41)", "np.int64(7)", "np.int64(−9223372036854775808)", "np.int64(9007199254740993)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, 7.0, -9.223372036854776e+18, 9007199254740992.0,
  ])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, 7.0, -9.223372036854776e+18, 9007199254740992.0,
  ])
}

///|
test "string formatter original view copy StrMethodFormatter int64 nested" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner)
    .view(1, 2, 2)
    .view(1, -1, 2)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(−1)", "np.int64(−9223372036854775808)",
  ])
  owner[3] = 41L
  assert_eq(shallow.format_ticks_view(view), [
    "np.int64(41)", "np.int64(−9223372036854775808)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, -9.223372036854776e+18,
  ])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, -9.223372036854776e+18,
  ])
}

///|
test "string formatter original view copy StrMethodFormatter int64 zero" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(2, 0, 3)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(7)", "np.int64(7)", "np.int64(7)",
  ])
  owner[2] = 41L
  assert_eq(shallow.format_ticks_view(view), [
    "np.int64(41)", "np.int64(41)", "np.int64(41)",
  ])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, 41.0, 41.0,
  ])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [
    41.0, 41.0, 41.0,
  ])
}

///|
test "string formatter original view copy StrMethodFormatter int64 empty" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  @config.set_unicode_minus(true)
  let owner = [9007199254740993L, -9223372036854775808L, 7L, -1L]
  let view = @ticker.TickValues::from_int64_array(owner).view(0, 1, 0)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}")
  formatter.set_locs_view(view)
  let shallow = formatter.copy()
  assert_eq(formatter.format_ticks_view(view), [])
  assert_eq(shallow.format_ticks_view(view), [])
  match shallow.locations() {
    NdArray(retained) => assert_true(physical_equal(retained, view))
    _ => fail("expected borrowed view")
  }
  verify_string_formatter_param_locations(shallow.locations(), [])
  formatter.set_fmt("rebound:{x}")
  formatter.set_locs([9.0])
  assert_eq(shallow.fmt(), "{x!r}")
  verify_string_formatter_param_locations(shallow.locations(), [])
}

///|
test "string formatter original deferred fmt error FormatStrFormatter 0" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([9.0])
  formatter.set_fmt("%")
  assert_eq(formatter.fmt(), "%")
  let error = try {
    ignore(formatter.call(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: incomplete format")
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  let values = [3.0, 4.0]
  let error = try {
    ignore(formatter.format_ticks(values))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: incomplete format")
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_string_formatter_param_locations(formatter.locations(), [3.0, 4.0])
  formatter.set_fmt("%s")
  assert_eq(formatter.format_data(2.0), "2.0")
}

///|
test "string formatter original deferred fmt error FormatStrFormatter 1" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([9.0])
  formatter.set_fmt("%q")
  assert_eq(formatter.fmt(), "%q")
  let error = try {
    ignore(formatter.call(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: unsupported format character 'q' (0x71) at index 1",
  )
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  let values = [3.0, 4.0]
  let error = try {
    ignore(formatter.format_ticks(values))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: unsupported format character 'q' (0x71) at index 1",
  )
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_string_formatter_param_locations(formatter.locations(), [3.0, 4.0])
  formatter.set_fmt("%s")
  assert_eq(formatter.format_data(2.0), "2.0")
}

///|
test "string formatter original deferred fmt error FormatStrFormatter 2" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([9.0])
  formatter.set_fmt("literal")
  assert_eq(formatter.fmt(), "literal")
  let error = try {
    ignore(formatter.call(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: not all arguments converted during string formatting",
  )
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  let values = [3.0, 4.0]
  let error = try {
    ignore(formatter.format_ticks(values))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: not all arguments converted during string formatting",
  )
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_string_formatter_param_locations(formatter.locations(), [3.0, 4.0])
  formatter.set_fmt("%s")
  assert_eq(formatter.format_data(2.0), "2.0")
}

///|
test "string formatter original deferred fmt error FormatStrFormatter 3" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([9.0])
  formatter.set_fmt("%g %g")
  assert_eq(formatter.fmt(), "%g %g")
  let error = try {
    ignore(formatter.call(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: not enough arguments for format string")
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  let values = [3.0, 4.0]
  let error = try {
    ignore(formatter.format_ticks(values))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "TypeError: not enough arguments for format string")
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_string_formatter_param_locations(formatter.locations(), [3.0, 4.0])
  formatter.set_fmt("%s")
  assert_eq(formatter.format_data(2.0), "2.0")
}

///|
test "string formatter original deferred fmt error StrMethodFormatter 0" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  formatter.set_locs([9.0])
  formatter.set_fmt("{")
  assert_eq(formatter.fmt(), "{")
  let error = try {
    ignore(formatter.call(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: Single '{' encountered in format string")
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  let values = [3.0, 4.0]
  let error = try {
    ignore(formatter.format_ticks(values))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "ValueError: Single '{' encountered in format string")
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_string_formatter_param_locations(formatter.locations(), [3.0, 4.0])
  formatter.set_fmt("{x}")
  assert_eq(formatter.format_data(2.0), "2.0")
}

///|
test "string formatter original deferred fmt error StrMethodFormatter 1" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  formatter.set_locs([9.0])
  formatter.set_fmt("{missing}")
  assert_eq(formatter.fmt(), "{missing}")
  let error = try {
    ignore(formatter.call(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "KeyError: 'missing'")
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  let values = [3.0, 4.0]
  let error = try {
    ignore(formatter.format_ticks(values))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(error, "KeyError: 'missing'")
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_string_formatter_param_locations(formatter.locations(), [3.0, 4.0])
  formatter.set_fmt("{x}")
  assert_eq(formatter.format_data(2.0), "2.0")
}

///|
test "string formatter original deferred fmt error StrMethodFormatter 2" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  formatter.set_locs([9.0])
  formatter.set_fmt("{x:!}")
  assert_eq(formatter.fmt(), "{x:!}")
  let error = try {
    ignore(formatter.call(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: Unknown format code '!' for object of type 'float'",
  )
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  let values = [3.0, 4.0]
  let error = try {
    ignore(formatter.format_ticks(values))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "ValueError: Unknown format code '!' for object of type 'float'",
  )
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_string_formatter_param_locations(formatter.locations(), [3.0, 4.0])
  formatter.set_fmt("{x}")
  assert_eq(formatter.format_data(2.0), "2.0")
}

///|
test "string formatter original deferred fmt error StrMethodFormatter 3" {
  let formatter = @ticker.StrMethodFormatter::new("{x}")
  formatter.set_locs([9.0])
  formatter.set_fmt("{pos:d}")
  assert_eq(formatter.fmt(), "{pos:d}")
  let error = try {
    ignore(formatter.call(2.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    error, "TypeError: unsupported format string passed to NoneType.__format__",
  )
  verify_string_formatter_param_locations(formatter.locations(), [9.0])
  let values = [3.0, 4.0]
  assert_eq(formatter.format_ticks(values), ["0", "1"])
  match formatter.locations() {
    Sequence(retained) => assert_true(physical_equal(retained, values))
    _ => fail("expected installed list")
  }
  verify_string_formatter_param_locations(formatter.locations(), [3.0, 4.0])
  formatter.set_fmt("{x}")
  assert_eq(formatter.format_data(2.0), "2.0")
}

///|
test "string formatter original rc and data FormatStrFormatter False" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  let formatter = @ticker.FormatStrFormatter::new("literal- %s")
  @config.set_unicode_minus(false)
  assert_eq(formatter.call(-1.25, pos=-2), "literal- -1.25")
  assert_eq(formatter.format_data_short(-1.25), "literal- -1.25")
  assert_eq(formatter.get_offset(), "")
}

///|
test "string formatter original rc and data FormatStrFormatter True" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  let formatter = @ticker.FormatStrFormatter::new("literal- %s")
  @config.set_unicode_minus(true)
  assert_eq(formatter.call(-1.25, pos=-2), "literal- -1.25")
  assert_eq(formatter.format_data_short(-1.25), "literal- -1.25")
  assert_eq(formatter.get_offset(), "")
}

///|
test "string formatter original rc and data StrMethodFormatter False" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  let formatter = @ticker.StrMethodFormatter::new("literal- {x}/{pos}")
  @config.set_unicode_minus(false)
  assert_eq(formatter.call(-1.25, pos=-2), "literal- -1.25/-2")
  assert_eq(formatter.format_data_short(-1.25), "literal- -1.25/None")
  assert_eq(formatter.get_offset(), "")
}

///|
test "string formatter original rc and data StrMethodFormatter True" {
  let previous = @config.unicode_minus()
  defer @config.set_unicode_minus(previous)
  let formatter = @ticker.StrMethodFormatter::new("literal- {x}/{pos}")
  @config.set_unicode_minus(true)
  assert_eq(formatter.call(-1.25, pos=-2), "literal- −1.25/−2")
  assert_eq(formatter.format_data_short(-1.25), "literal- −1.25/None")
  assert_eq(formatter.get_offset(), "")
}
