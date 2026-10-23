// Original ndarray dtype survives full formatter batching and overlap selection.

///|
test "string Formatter original full retained bundle 0" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:np.float64(-1.0)", "M:np.float64(0.0)", "M:np.float64(2.0)", "M:np.float64(4.0)",
  ])
  assert_eq(bundle.minor_labels, [
    "m:0:−2.00", "m:1:0.00", "m:2:1.00", "m:3:2.00", "m:4:3.00", "m:5:5.00",
  ])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 0.0, 1.0, 2.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -3.0)
}

///|
test "string Formatter original full retained bundle 1" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:np.float64(-1.0)", "M:np.float64(0.0)", "M:np.float64(2.0)", "M:np.float64(4.0)",
  ])
  assert_eq(bundle.minor_labels, [
    "m:0:−2.00", "m:1:1.00", "m:2:3.00", "m:3:5.00",
  ])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 1.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -2.0)
}

///|
test "string Formatter original full retained bundle 2" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:0:np.float64(−1.0)", "M:1:np.float64(0.0)", "M:2:np.float64(2.0)", "M:3:np.float64(4.0)",
  ])
  assert_eq(bundle.minor_labels, [
    "m:-2.0", "m:0.0", "m:1.0", "m:2.0", "m:3.0", "m:5.0",
  ])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 0.0, 1.0, 2.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -3.0)
}

///|
test "string Formatter original full retained bundle 3" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:0:np.float64(−1.0)", "M:1:np.float64(0.0)", "M:2:np.float64(2.0)", "M:3:np.float64(4.0)",
  ])
  assert_eq(bundle.minor_labels, ["m:-2.0", "m:1.0", "m:3.0", "m:5.0"])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 1.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -2.0)
}

///|
test "string Formatter original full retained bundle 4" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:np.int64(-1)", "M:np.int64(0)", "M:np.int64(2)", "M:np.int64(4)",
  ])
  assert_eq(bundle.minor_labels, [
    "m:0:−2", "m:1:0", "m:2:1", "m:3:2", "m:4:3", "m:5:5",
  ])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 0.0, 1.0, 2.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -3.0)
}

///|
test "string Formatter original full retained bundle 5" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:np.int64(-1)", "M:np.int64(0)", "M:np.int64(2)", "M:np.int64(4)",
  ])
  assert_eq(bundle.minor_labels, ["m:0:−2", "m:1:1", "m:2:3", "m:3:5"])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 1.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -2.0)
}

///|
test "string Formatter original full retained bundle 6" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:0:np.int64(−1)", "M:1:np.int64(0)", "M:2:np.int64(2)", "M:3:np.int64(4)",
  ])
  assert_eq(bundle.minor_labels, ["m:-2", "m:0", "m:1", "m:2", "m:3", "m:5"])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 0.0, 1.0, 2.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -3.0)
}

///|
test "string Formatter original full retained bundle 7" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:0:np.int64(−1)", "M:1:np.int64(0)", "M:2:np.int64(2)", "M:3:np.int64(4)",
  ])
  assert_eq(bundle.minor_labels, ["m:-2", "m:1", "m:3", "m:5"])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 1.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -2.0)
}

///|
test "string Formatter original full retained bundle 8" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:np.float64(-1.0)", "M:np.float64(0.0)", "M:np.float64(2.0)", "M:np.float64(4.0)",
  ])
  assert_eq(bundle.minor_labels, [
    "m:0:−2.00", "m:1:0.00", "m:2:1.00", "m:3:2.00", "m:4:3.00", "m:5:5.00",
  ])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 0.0, 1.0, 2.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -3.0)
}

///|
test "string Formatter original full retained bundle 9" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:np.float64(-1.0)", "M:np.float64(0.0)", "M:np.float64(2.0)", "M:np.float64(4.0)",
  ])
  assert_eq(bundle.minor_labels, [
    "m:0:−2.00", "m:1:1.00", "m:2:3.00", "m:3:5.00",
  ])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 1.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -2.0)
}

///|
test "string Formatter original full retained bundle 10" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:0:np.float64(−1.0)", "M:1:np.float64(0.0)", "M:2:np.float64(2.0)", "M:3:np.float64(4.0)",
  ])
  assert_eq(bundle.minor_labels, [
    "m:-2.0", "m:0.0", "m:1.0", "m:2.0", "m:3.0", "m:5.0",
  ])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 0.0, 1.0, 2.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -3.0)
}

///|
test "string Formatter original full retained bundle 11" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:0:np.float64(−1.0)", "M:1:np.float64(0.0)", "M:2:np.float64(2.0)", "M:3:np.float64(4.0)",
  ])
  assert_eq(bundle.minor_labels, ["m:-2.0", "m:1.0", "m:3.0", "m:5.0"])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 1.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -2.0)
}

///|
test "string Formatter original full retained bundle 12" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:np.int64(-1)", "M:np.int64(0)", "M:np.int64(2)", "M:np.int64(4)",
  ])
  assert_eq(bundle.minor_labels, [
    "m:0:−2", "m:1:0", "m:2:1", "m:3:2", "m:4:3", "m:5:5",
  ])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 0.0, 1.0, 2.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -3.0)
}

///|
test "string Formatter original full retained bundle 13" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:np.int64(-1)", "M:np.int64(0)", "M:np.int64(2)", "M:np.int64(4)",
  ])
  assert_eq(bundle.minor_labels, ["m:0:−2", "m:1:1", "m:2:3", "m:3:5"])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 1.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -2.0)
}

///|
test "string Formatter original full retained bundle 14" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:0:np.int64(−1)", "M:1:np.int64(0)", "M:2:np.int64(2)", "M:3:np.int64(4)",
  ])
  assert_eq(bundle.minor_labels, ["m:-2", "m:0", "m:1", "m:2", "m:3", "m:5"])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 0.0, 1.0, 2.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -3.0)
}

///|
test "string Formatter original full retained bundle 15" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let axis = @axis.axis()
  axis.set_limits(0.0, 3.0)
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 3.0))
  assert_eq(bundle.major_labels, [
    "M:0:np.int64(−1)", "M:1:np.int64(0)", "M:2:np.int64(2)", "M:3:np.int64(4)",
  ])
  assert_eq(bundle.minor_labels, ["m:-2", "m:1", "m:3", "m:5"])
  assert_eq(bundle.major, [-1.0, 0.0, 2.0, 4.0])
  assert_eq(bundle.minor, [-2.0, 1.0, 3.0, 5.0])
  minor_view.set(0, -3.0)
  assert_eq(minor.locations().get(0), -2.0)
}
