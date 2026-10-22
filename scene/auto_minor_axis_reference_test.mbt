// Generated from original AutoMinorLocator + Axis.get_minorticklocs.
// Raw source getters retain neighbors; final SVG clipping is separate.

///|
fn verify_auto_minor_axis_numbers(
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
test "AutoMinor original Axis raw overlap 0: unique irregular neighbors" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.75, 1.75)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([3.0, 1.0, 0.0, 1.0, 3.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 1: raw retains outer neighbor" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.75, 1.75)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 2: overlap disabled" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.75, 1.75)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(minor.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    1.0, 1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 3: span tolerance removes nearby irregular major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.0, 2.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0, 1.50001])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 4: span tolerance keeps farther irregular major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.0, 2.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0, 1.50003])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.5, 1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 5: reversed view source remains ascending" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(1.75, 0.75)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 6: auto 4" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.0, 3.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 3.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("auto")),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.75, 1.5, 2.25, 3.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.75, 1.5, 2.25,
  ])
}

///|
test "AutoMinor original Axis raw overlap 7: auto 5" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.0, 2.5)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 2.5])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("auto")),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0, 1.5, 2.0, 2.5])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.5, 1.0, 1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 8: only one major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.0, 1.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([2.0, 2.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(ndivs=None)
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [])
}

///|
test "AutoMinor original Axis raw overlap 9: zero returns NaN" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.0, 1.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(0.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0 / 0.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.0 / 0.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 10: negative short interval" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.1, 0.4)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(-1.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [])
}

///|
test "AutoMinor original Axis raw overlap 11: fractional divisions" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.0, 1.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.5)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.4, 0.8])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.4, 0.8,
  ])
}

///|
test "AutoMinor original Axis raw overlap 12: NaN later major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, true)
  let view = @core.limits(0.0, 1.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0, 0.0 / 0.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [0.5])
}

///|
test "AutoMinor original Axis raw overlap 13: unique irregular neighbors" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.75, 1.75)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([3.0, 1.0, 0.0, 1.0, 3.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 14: raw retains outer neighbor" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.75, 1.75)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 15: overlap disabled" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.75, 1.75)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(minor.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    1.0, 1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 16: span tolerance removes nearby irregular major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.0, 2.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0, 1.50001])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 17: span tolerance keeps farther irregular major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.0, 2.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0, 1.50003])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.5, 1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 18: reversed view source remains ascending" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(1.75, 0.75)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 19: auto 4" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.0, 3.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 3.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("auto")),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.75, 1.5, 2.25, 3.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.75, 1.5, 2.25,
  ])
}

///|
test "AutoMinor original Axis raw overlap 20: auto 5" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.0, 2.5)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 2.5])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Text("auto")),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0, 1.5, 2.0, 2.5])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.5, 1.0, 1.5, 2.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 21: only one major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.0, 1.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([2.0, 2.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(ndivs=None)
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [])
}

///|
test "AutoMinor original Axis raw overlap 22: zero returns NaN" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.0, 1.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(0.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0 / 0.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.0 / 0.0,
  ])
}

///|
test "AutoMinor original Axis raw overlap 23: negative short interval" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.1, 0.4)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(-1.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [])
}

///|
test "AutoMinor original Axis raw overlap 24: fractional divisions" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.0, 1.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.5)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.4, 0.8])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [
    0.4, 0.8,
  ])
}

///|
test "AutoMinor original Axis raw overlap 25: NaN later major" {
  let axis = @axis.axis()
  axis.set_tick_layout(100.0, false)
  let view = @core.limits(0.0, 1.0)
  axis.set_limits(view.lower(), view.upper())
  let major = @ticker.FixedLocator::new([0.0, 1.0, 0.0 / 0.0])
  axis.set_locator(major.as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
  verify_auto_minor_axis_numbers(axis.minor_tick_values_checked(view), [0.5])
}

///|
test "AutoMinor original axis owner trace x" {
  let previous_x = @config.minor_tick_divisions(horizontal=true)
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer {
    @config.set_minor_tick_divisions(previous_x, horizontal=true) catch {
      _ => ()
    }
    @config.set_minor_tick_divisions(previous_y, horizontal=false) catch {
      _ => ()
    }
  }
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(2.0),
    horizontal=true,
  )
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(3.0),
    horizontal=false,
  )
  let first = @axis.axis()
  let second = @axis.axis()
  for axis in [first, second] {
    axis.set_tick_layout(100.0, true)
  }
  first.set_limits(0.0, 1.0)
  second.set_limits(10.0, 12.0)
  first.set_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  second.set_locator(@ticker.FixedLocator::new([10.0, 12.0]).as_locator())
  let minor = @ticker.AutoMinorLocator::new()
  first.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
  let external = minor.copy()
  second.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [10.0, 11.0, 12.0])
  second.set_locator(@ticker.FixedLocator::new([20.0, 24.0]).as_locator())
  second.set_limits(20.0, 24.0)
  verify_auto_minor_axis_numbers(minor.call(), [20.0, 22.0, 24.0])
  second.set_scale(@scale.log_scale())
  second.set_minor_locator(minor.as_minor_locator())
  assert_eq(minor.call(), [])
  assert_eq(minor.warnings(), [
    "AutoMinorLocator does not work on logarithmic scales",
  ])
  second.set_scale(@scale.linear_scale())
  minor.set_ndivs(None)
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(4.0),
    horizontal=true,
  )
  verify_auto_minor_axis_numbers(minor.call(), [20.0, 21.0, 22.0, 23.0, 24.0])
  verify_auto_minor_axis_numbers(external.call(), [0.0, 0.5, 1.0])
}

///|
test "AutoMinor original axis owner trace y" {
  let previous_x = @config.minor_tick_divisions(horizontal=true)
  let previous_y = @config.minor_tick_divisions(horizontal=false)
  defer {
    @config.set_minor_tick_divisions(previous_x, horizontal=true) catch {
      _ => ()
    }
    @config.set_minor_tick_divisions(previous_y, horizontal=false) catch {
      _ => ()
    }
  }
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(2.0),
    horizontal=true,
  )
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(3.0),
    horizontal=false,
  )
  let first = @axis.axis()
  let second = @axis.axis()
  for axis in [first, second] {
    axis.set_tick_layout(100.0, false)
  }
  first.set_limits(0.0, 1.0)
  second.set_limits(10.0, 12.0)
  first.set_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  second.set_locator(@ticker.FixedLocator::new([10.0, 12.0]).as_locator())
  let minor = @ticker.AutoMinorLocator::new()
  first.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [
    0.0, 0.3333333333333333, 0.6666666666666666, 1.0,
  ])
  let external = minor.copy()
  second.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [
    10.0, 10.666666666666666, 11.333333333333334, 12.0,
  ])
  second.set_locator(@ticker.FixedLocator::new([20.0, 24.0]).as_locator())
  second.set_limits(20.0, 24.0)
  verify_auto_minor_axis_numbers(minor.call(), [
    20.0, 21.333333333333332, 22.666666666666668, 24.0,
  ])
  second.set_scale(@scale.log_scale())
  second.set_minor_locator(minor.as_minor_locator())
  assert_eq(minor.call(), [])
  assert_eq(minor.warnings(), [
    "AutoMinorLocator does not work on logarithmic scales",
  ])
  second.set_scale(@scale.linear_scale())
  minor.set_ndivs(None)
  @config.set_minor_tick_divisions(
    @config.MinorTickDivisions::Number(4.0),
    horizontal=false,
  )
  verify_auto_minor_axis_numbers(minor.call(), [20.0, 21.0, 22.0, 23.0, 24.0])
  verify_auto_minor_axis_numbers(external.call(), [
    0.0, 0.3333333333333333, 0.6666666666666666, 1.0,
  ])
}

///|
test "AutoMinor original shared removal rebind and outside copy x" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_x=true)
  axes[0].set_x_limits(0.0, 1.0)
  axes[1].set_x_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axes[1].set_x_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
  let external = minor.copy()
  axes[1].remove()
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
  axes[1].set_x_limits(1.0, 2.0)
  verify_auto_minor_axis_numbers(external.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
}

///|
test "AutoMinor original shared removal rebind and outside copy y" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_y=true)
  axes[0].set_y_limits(0.0, 1.0)
  axes[1].set_y_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  axes[1].set_y_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
  let external = minor.copy()
  axes[1].remove()
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
  axes[1].set_y_limits(1.0, 2.0)
  verify_auto_minor_axis_numbers(external.call(), [1.0, 1.5, 2.0])
  verify_auto_minor_axis_numbers(minor.call(), [0.0, 0.5, 1.0])
}

///|
test "AutoMinor original secondary own major view scale 0" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_limits(1.0, 3.0)
  axes.set_x_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 10.0, value => {
    (value - 10.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([12.0, 14.0, 15.00005]).as_locator(),
  )
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [12.0, 13.0, 14.0, 15.0, 16.0])
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    13.0, 15.0, 16.0,
  ])
  assert_eq(minor.warnings(), [])
  secondary.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    12.0, 13.0, 14.0, 15.0, 16.0,
  ])
}

///|
test "AutoMinor original secondary own major view scale 1" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_limits(3.0, 1.0)
  axes.set_x_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 10.0, value => {
    (value - 10.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([12.0, 14.0, 15.00005]).as_locator(),
  )
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [12.0, 13.0, 14.0, 15.0, 16.0])
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    13.0, 15.0, 16.0,
  ])
  assert_eq(minor.warnings(), [])
  secondary.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    12.0, 13.0, 14.0, 15.0, 16.0,
  ])
}

///|
test "AutoMinor original secondary own major view scale 2" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_limits(1.0, 3.0)
  axes.x_axis().set_scale(@scale.log_scale())
  axes.set_x_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 10.0, value => {
    (value - 10.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([12.0, 14.0, 15.00005]).as_locator(),
  )
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [12.0, 13.0, 14.0, 15.0, 16.0])
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    13.0, 16.0,
  ])
  assert_eq(minor.warnings(), [])
  secondary.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    12.0, 13.0, 14.0, 15.0, 16.0,
  ])
}

///|
test "AutoMinor original secondary own major view scale 3" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_limits(3.0, 1.0)
  axes.x_axis().set_scale(@scale.log_scale())
  axes.set_x_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 10.0, value => {
    (value - 10.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([12.0, 14.0, 15.00005]).as_locator(),
  )
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [12.0, 13.0, 14.0, 15.0, 16.0])
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    13.0, 16.0,
  ])
  assert_eq(minor.warnings(), [])
  secondary.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    12.0, 13.0, 14.0, 15.0, 16.0,
  ])
}

///|
test "AutoMinor original secondary own major view scale 4" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_limits(1.0, 3.0)
  axes.set_y_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 10.0, value => {
    (value - 10.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([12.0, 14.0, 15.00005]).as_locator(),
  )
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [12.0, 13.0, 14.0, 15.0, 16.0])
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    13.0, 15.0, 16.0,
  ])
  assert_eq(minor.warnings(), [])
  secondary.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    12.0, 13.0, 14.0, 15.0, 16.0,
  ])
}

///|
test "AutoMinor original secondary own major view scale 5" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_limits(3.0, 1.0)
  axes.set_y_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 10.0, value => {
    (value - 10.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([12.0, 14.0, 15.00005]).as_locator(),
  )
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [12.0, 13.0, 14.0, 15.0, 16.0])
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    13.0, 15.0, 16.0,
  ])
  assert_eq(minor.warnings(), [])
  secondary.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    12.0, 13.0, 14.0, 15.0, 16.0,
  ])
}

///|
test "AutoMinor original secondary own major view scale 6" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_limits(1.0, 3.0)
  axes.y_axis().set_scale(@scale.log_scale())
  axes.set_y_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 10.0, value => {
    (value - 10.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([12.0, 14.0, 15.00005]).as_locator(),
  )
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [12.0, 13.0, 14.0, 15.0, 16.0])
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    13.0, 16.0,
  ])
  assert_eq(minor.warnings(), [])
  secondary.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    12.0, 13.0, 14.0, 15.0, 16.0,
  ])
}

///|
test "AutoMinor original secondary own major view scale 7" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_limits(3.0, 1.0)
  axes.y_axis().set_scale(@scale.log_scale())
  axes.set_y_locator(@ticker.FixedLocator::new([1.0, 2.0, 3.0]).as_locator())
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 10.0, value => {
    (value - 10.0) / 2.0
  })
  secondary.set_locator(
    @ticker.FixedLocator::new([12.0, 14.0, 15.00005]).as_locator(),
  )
  let minor = @ticker.AutoMinorLocator::new(
    ndivs=Some(@config.MinorTickDivisions::Number(2.0)),
  )
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_auto_minor_axis_numbers(minor.call(), [12.0, 13.0, 14.0, 15.0, 16.0])
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    13.0, 16.0,
  ])
  assert_eq(minor.warnings(), [])
  secondary.set_minor_overlap_removal(false)
  verify_auto_minor_axis_numbers(secondary.minor_tick_values_checked(), [
    12.0, 13.0, 14.0, 15.0, 16.0,
  ])
}
