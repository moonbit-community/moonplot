// Original numeric axis/font heuristics with supplied physical Bbox dimensions.
// Geometry is a dpi72 fixture; this does not execute Matplotlib transforms/rendering.

///|
fn verify_numeric_axis_values(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else {
      assert_eq(
        actual[index].reinterpret_as_uint64(),
        value.reinterpret_as_uint64(),
      )
    }
  }
}

///|
fn numeric_axis_label_size(svg : String, label : String, size : String) -> Bool {
  svg
  .split("<text")
  .any(fragment => {
    fragment.contains(">" + label + "<") &&
    fragment.contains("font-size=\"" + size + "\"")
  })
}

///|
test "numeric axis original physical font profile 0" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_tick_label_size(-1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 1" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_tick_label_size(-1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 2" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_tick_label_size(0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 3" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_tick_label_size(0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 4" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_tick_label_size(0.5)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 5" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_tick_label_size(0.5)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 6" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_tick_label_size(1.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 7" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_tick_label_size(1.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 8" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 9" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 10" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_tick_label_size(24.0)
  verify_numeric_axis_values([axis.tick_label_size()], [24.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 11" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_tick_label_size(24.0)
  verify_numeric_axis_values([axis.tick_label_size()], [24.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 12" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_tick_label_size(0.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [0.0 / 0.0])
  assert_eq(axis.get_tick_space(), 2147483647.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 13" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_tick_label_size(0.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [0.0 / 0.0])
  assert_eq(axis.get_tick_space(), 2147483647.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 14" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_tick_label_size(1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0 / 0.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 15" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_tick_label_size(1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0 / 0.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 16" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, true)
  axis.set_tick_label_size(-1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 10.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 17" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, false)
  axis.set_tick_label_size(-1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 15.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 18" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, true)
  axis.set_tick_label_size(0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 10.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 19" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, false)
  axis.set_tick_label_size(0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 15.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 20" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, true)
  axis.set_tick_label_size(0.5)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 10.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 21" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, false)
  axis.set_tick_label_size(0.5)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 15.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 22" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, true)
  axis.set_tick_label_size(1.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 10.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 23" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, false)
  axis.set_tick_label_size(1.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 15.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 24" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 1.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 25" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, false)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 1.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 26" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, true)
  axis.set_tick_label_size(24.0)
  verify_numeric_axis_values([axis.tick_label_size()], [24.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 27" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, false)
  axis.set_tick_label_size(24.0)
  verify_numeric_axis_values([axis.tick_label_size()], [24.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 28" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, true)
  axis.set_tick_label_size(0.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [0.0 / 0.0])
  assert_eq(axis.get_tick_space(), 2147483647.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 29" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, false)
  axis.set_tick_label_size(0.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [0.0 / 0.0])
  assert_eq(axis.get_tick_space(), 2147483647.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 30" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, true)
  axis.set_tick_label_size(1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0 / 0.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 31" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.0, false)
  axis.set_tick_label_size(1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0 / 0.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 32" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_tick_label_size(-1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 40.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 33" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_tick_label_size(-1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 60.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 34" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_tick_label_size(0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 40.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 35" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_tick_label_size(0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 60.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 36" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_tick_label_size(0.5)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 40.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 37" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_tick_label_size(0.5)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 60.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 38" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_tick_label_size(1.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 40.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 39" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_tick_label_size(1.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 60.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 40" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 4.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
}

///|
test "numeric axis original physical font profile 41" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 6.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 4.0, 8.0, 12.0, 16.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
}

///|
test "numeric axis original physical font profile 42" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_tick_label_size(24.0)
  verify_numeric_axis_values([axis.tick_label_size()], [24.0])
  assert_eq(axis.get_tick_space(), 1.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 43" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_tick_label_size(24.0)
  verify_numeric_axis_values([axis.tick_label_size()], [24.0])
  assert_eq(axis.get_tick_space(), 2.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 10.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 10.0, 20.0])
}

///|
test "numeric axis original physical font profile 44" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_tick_label_size(0.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [0.0 / 0.0])
  assert_eq(axis.get_tick_space(), 2147483647.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 45" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_tick_label_size(0.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [0.0 / 0.0])
  assert_eq(axis.get_tick_space(), 2147483647.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 46" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_tick_label_size(1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0 / 0.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 47" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_tick_label_size(1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0 / 0.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 48" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, true)
  axis.set_tick_label_size(-1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 120.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 49" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, false)
  axis.set_tick_label_size(-1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 180.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 50" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, true)
  axis.set_tick_label_size(0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 120.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 51" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, false)
  axis.set_tick_label_size(0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 180.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 52" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, true)
  axis.set_tick_label_size(0.5)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 120.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 53" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, false)
  axis.set_tick_label_size(0.5)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 180.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 54" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, true)
  axis.set_tick_label_size(1.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 120.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 55" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, false)
  axis.set_tick_label_size(1.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0])
  assert_eq(axis.get_tick_space(), 180.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 56" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 12.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 57" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, false)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 18.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 58" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, true)
  axis.set_tick_label_size(24.0)
  verify_numeric_axis_values([axis.tick_label_size()], [24.0])
  assert_eq(axis.get_tick_space(), 5.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 4.0, 8.0, 12.0, 16.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
}

///|
test "numeric axis original physical font profile 59" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, false)
  axis.set_tick_label_size(24.0)
  verify_numeric_axis_values([axis.tick_label_size()], [24.0])
  assert_eq(axis.get_tick_space(), 7.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 3.0, 6.0, 9.0, 12.0, 15.0, 18.0, 21.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
}

///|
test "numeric axis original physical font profile 60" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, true)
  axis.set_tick_label_size(0.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [0.0 / 0.0])
  assert_eq(axis.get_tick_space(), 2147483647.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 61" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, false)
  axis.set_tick_label_size(0.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [0.0 / 0.0])
  assert_eq(axis.get_tick_space(), 2147483647.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 62" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, true)
  axis.set_tick_label_size(1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0 / 0.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 63" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(360.0, false)
  axis.set_tick_label_size(1.0 / 0.0)
  verify_numeric_axis_values([axis.tick_label_size()], [1.0 / 0.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 64" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(240.0, true)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 8.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 65" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(240.0, false)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 12.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 66" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(240.0, true)
  axis.set_tick_label_size(12.0)
  verify_numeric_axis_values([axis.tick_label_size()], [12.0])
  assert_eq(axis.get_tick_space(), 6.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 4.0, 8.0, 12.0, 16.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
}

///|
test "numeric axis original physical font profile 67" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(240.0, false)
  axis.set_tick_label_size(8.33)
  verify_numeric_axis_values([axis.tick_label_size()], [8.33])
  assert_eq(axis.get_tick_space(), 14.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric axis original physical font profile 68" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(29.999999999999996, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 69" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(30.000000000000004, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 1.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 70" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(59.99999999999999, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 1.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 71" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(60.00000000000001, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 2.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 10.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 10.0, 20.0])
}

///|
test "numeric axis original physical font profile 72" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(89.99999999999999, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 2.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 10.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 10.0, 20.0])
}

///|
test "numeric axis original physical font profile 73" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(90.00000000000001, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 3.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 8.0, 16.0, 24.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 10.0, 20.0])
}

///|
test "numeric axis original physical font profile 74" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(119.99999999999999, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 3.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 8.0, 16.0, 24.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 10.0, 20.0])
}

///|
test "numeric axis original physical font profile 75" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(120.00000000000001, true)
  axis.set_tick_label_size(10.0)
  verify_numeric_axis_values([axis.tick_label_size()], [10.0])
  assert_eq(axis.get_tick_space(), 4.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
}

///|
test "numeric axis original physical font profile 76" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(38.09999999999999, true)
  axis.set_tick_label_size(12.7)
  verify_numeric_axis_values([axis.tick_label_size()], [12.7])
  assert_eq(axis.get_tick_space(), 0.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 77" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(38.099999999999994, true)
  axis.set_tick_label_size(12.7)
  verify_numeric_axis_values([axis.tick_label_size()], [12.7])
  assert_eq(axis.get_tick_space(), 1.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric axis original physical font profile 78" {
  let previous_classic = @config.classic_mode()
  defer @config.set_classic_mode(previous_classic)
  @config.set_classic_mode(false)
  let axis = @axis.axis()
  axis.set_tick_layout(38.1, true)
  axis.set_tick_label_size(12.7)
  verify_numeric_axis_values([axis.tick_label_size()], [12.7])
  assert_eq(axis.get_tick_space(), 1.0)
  axis.set_limits(0.0, 20.0)
  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
  axis.set_locator(maxn.as_locator())
  verify_numeric_axis_values(maxn.call(), [0.0, 20.0])
  let auto = @ticker.AutoLocator::new()
  axis.set_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [0.0, 20.0])
}

///|
test "numeric scene geometry and rendered font size use the same points" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.add_axes(0.0, 0.0, 0.5, 0.5)
  axes.set_x_limits(0.0, 20.0)
  axes.set_y_limits(0.0, 20.0)
  let auto = @ticker.AutoLocator::new()
  axes.set_x_locator(auto.as_locator())
  axes.set_x_formatter(@ticker.format_str_formatter("ctx-x=%.1f"))
  axes.x_axis().set_tick_label_size(10.0)
  assert_eq(axes.x_axis().get_tick_space(), 8.0)
  assert_eq(axes.y_axis().get_tick_space(), 6.0)
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let first = figure.to_svg_checked()
  assert_true(numeric_axis_label_size(first, "ctx-x=0.0", "10"))
  axes.x_axis().set_tick_label_size(20.0)
  let updated = figure.to_svg_checked()
  assert_eq(axes.x_axis().get_tick_space(), 4.0)
  verify_numeric_axis_values(auto.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
  assert_eq(updated.split(">ctx-x=").count() - 1, 5)
  assert_true(numeric_axis_label_size(updated, "ctx-x=0.0", "20"))
}

///|
test "numeric physical dimensions manual positions and aspect update locator context" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  for
    (width, height, expected) in [(120, 60, (4.0, 3.0)), (240, 120, (8.0, 6.0))] {
    let figure = @scene.figure(width~, height~)
    let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
    assert_eq(axes.x_axis().get_tick_space(), expected.0)
    assert_eq(axes.y_axis().get_tick_space(), expected.1)
  }
  let figure = @scene.figure(width=400, height=200)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 20.0)
  axes.set_y_limits(0.0, 20.0)
  let auto = @ticker.AutoLocator::new()
  axes.set_x_locator(auto.as_locator())
  assert_eq(axes.x_axis().get_tick_space(), 13.0)
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  axes.set_aspect_equal()
  ignore(figure.to_svg_checked())
  assert_eq(axes.x_axis().get_tick_space(), 6.0)
  verify_numeric_axis_values(auto.call(), [0.0, 5.0, 10.0, 15.0, 20.0])
  axes.set_aspect_auto()
  axes.set_position(0.0, 0.0, 0.25, 1.0)
  ignore(figure.to_svg_checked())
  assert_eq(axes.x_axis().get_tick_space(), 3.0)
  verify_numeric_axis_values(auto.call(), [0.0, 10.0, 20.0])
}

///|
test "numeric shared owner active dimensions are installed before every panel queries ticks" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=600, height=300)
  let axes = figure.subplots(1, 2, share_x=true)
  axes[0].set_position(0.0, 0.0, 0.6, 1.0)
  axes[1].set_position(0.7, 0.0, 0.2, 1.0)
  axes[1].set_box_aspect(aspect=5.0)
  axes[0].set_x_limits(0.0, 20.0)
  for axis in axes {
    axis.set_y_limits(0.0, 20.0)
  }
  let auto = @ticker.AutoLocator::new()
  axes[1].set_x_locator(auto.as_locator())
  axes[1].set_x_formatter(@ticker.format_str_formatter("ctx-shared=%.1f"))
  let external = auto.copy()
  let first = figure.to_svg_checked()
  assert_eq(axes[1].x_axis().get_tick_space(), 2.0)
  verify_numeric_axis_values(auto.call(), [0.0, 10.0, 20.0])
  assert_eq(first.split(">ctx-shared=").count() - 1, 6)
  axes[1].remove()
  let updated = figure.to_svg_checked()
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  verify_numeric_axis_values(external.call(), [0.0, 10.0, 20.0])
  assert_eq(updated.split(">ctx-shared=").count() - 1, 9)
}

///|
test "numeric secondary axes use parent direction length and their own rendered font" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.add_axes(0.0, 0.0, 0.5, 0.5)
  axes.set_x_limits(0.0, 20.0)
  axes.set_y_limits(0.0, 20.0)
  let secondary_x = axes.secondary_xaxis(x => x * 2.0, x => x / 2.0)
  let secondary_y = axes.secondary_yaxis(y => y * 2.0, y => y / 2.0)
  secondary_x.set_tick_label_size(20.0)
  secondary_y.set_tick_label_size(20.0)
  let x_auto = @ticker.AutoLocator::new()
  let y_auto = @ticker.AutoLocator::new()
  secondary_x.set_locator(x_auto.as_locator())
  secondary_y.set_locator(y_auto.as_locator())
  secondary_x.set_formatter(
    @ticker.format_str_formatter("ctx-secondary-x=%.1f"),
  )
  secondary_y.set_formatter(
    @ticker.format_str_formatter("ctx-secondary-y=%.1f"),
  )
  assert_eq(secondary_x.get_tick_space(), 4.0)
  assert_eq(secondary_y.get_tick_space(), 3.0)
  axes.x_axis().set_tick_label_size(40.0)
  axes.y_axis().set_tick_label_size(5.0)
  assert_eq(secondary_x.get_tick_space(), 4.0)
  assert_eq(secondary_y.get_tick_space(), 3.0)
  let svg = figure.to_svg_checked()
  verify_numeric_axis_values(x_auto.call(), [0.0, 10.0, 20.0, 30.0, 40.0])
  verify_numeric_axis_values(y_auto.call(), [0.0, 20.0, 40.0])
  assert_true(numeric_axis_label_size(svg, "ctx-secondary-x=0.0", "20"))
  assert_true(numeric_axis_label_size(svg, "ctx-secondary-y=0.0", "20"))
}

///|
test "numeric calls resolve automatic views and copied callbacks propagate checked range errors" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer {
    @config.set_classic_mode(previous_classic)
    try! @config.set_axes_autolimit_mode(previous_mode)
  }
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let figure = @scene.figure(width=240, height=120)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_margins(0.0, 0.0)
  axes.plot([0.0, 20.0], [0.0, 1.0])
  let auto = @ticker.AutoLocator::new()
  axes.set_x_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let copied = auto.copy()
  let failing = @ticker.LinearLocator::new(numticks=2)
  axes.set_x_locator(failing.as_locator())
  @config.set_axes_autolimit_mode("round_numbers")
  assert_true(
    try {
      ignore(copied.call())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  @config.set_axes_autolimit_mode("data")
  verify_numeric_axis_values(copied.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
}

///|
test "numeric MaxN and Auto shared handles follow last unshared owner view and physical width" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  for use_auto in [false, true] {
    let figure = @scene.figure(width=600, height=300)
    let a = figure.add_axes(0.0, 0.0, 0.6, 1.0)
    let b = figure.add_axes(0.6, 0.0, 0.2, 1.0)
    a.set_x_limits(0.0, 20.0)
    b.set_x_limits(100.0, 120.0)
    a.set_y_limits(0.0, 1.0)
    b.set_y_limits(0.0, 1.0)
    let auto = @ticker.AutoLocator::new()
    let state = if use_auto {
      auto.as_maxn_locator()
    } else {
      @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)
    }
    let adapter = if use_auto { auto.as_locator() } else { state.as_locator() }
    a.set_x_locator(adapter)
    b.set_x_locator(adapter)
    a.set_x_formatter(@ticker.format_str_formatter("ctx-owner-A=%.1f"))
    b.set_x_formatter(@ticker.format_str_formatter("ctx-owner-B=%.1f"))
    let copied = state.copy()
    verify_numeric_axis_values(state.call(), [100.0, 105.0, 110.0, 115.0, 120.0])
    assert_eq(a.x_axis().tick_values_checked(@core.limits(0.0, 20.0)), [
      100.0, 105.0, 110.0, 115.0, 120.0,
    ])
    let first = figure.to_svg_checked()
    assert_true(!first.contains(">ctx-owner-A="))
    assert_eq(first.split(">ctx-owner-B=").count() - 1, 5)
    b.set_position(0.6, 0.0, 0.1, 1.0)
    b.set_x_limits(200.0, 220.0)
    verify_numeric_axis_values(state.call(), [200.0, 210.0, 220.0])
    a.set_x_locator(adapter)
    verify_numeric_axis_values(state.call(), [
      0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
    ])
    verify_numeric_axis_values(copied.call(), [200.0, 210.0, 220.0])
    let rebound = figure.to_svg_checked()
    assert_eq(rebound.split(">ctx-owner-A=").count() - 1, 9)
    assert_true(!rebound.contains(">ctx-owner-B="))
  }
}

///|
test "numeric handle rebound to secondary reads secondary range and label size" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.add_axes(0.0, 0.0, 0.5, 0.5)
  axes.set_x_limits(0.0, 20.0)
  axes.set_y_limits(0.0, 1.0)
  let auto = @ticker.AutoLocator::new()
  axes.set_x_locator(auto.as_locator())
  axes.set_x_formatter(@ticker.format_str_formatter("ctx-primary=%.1f"))
  let secondary = axes.secondary_xaxis(x => x + 100.0, x => x - 100.0)
  secondary.set_tick_label_size(20.0)
  secondary.set_locator(auto.as_locator())
  secondary.set_formatter(
    @ticker.format_str_formatter("ctx-rebound-secondary=%.1f"),
  )
  verify_numeric_axis_values(auto.call(), [100.0, 105.0, 110.0, 115.0, 120.0])
  let svg = figure.to_svg_checked()
  assert_true(!svg.contains(">ctx-primary="))
  assert_eq(svg.split(">ctx-rebound-secondary=").count() - 1, 5)
  axes.set_x_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), [
    0.0, 2.5, 5.0, 7.5, 10.0, 12.5, 15.0, 17.5, 20.0,
  ])
  let rebound = figure.to_svg_checked()
  assert_eq(rebound.split(">ctx-primary=").count() - 1, 9)
  assert_true(!rebound.contains(">ctx-rebound-secondary="))
}
