// Original Axis raw neighbors, actual-transform overlap, source setters and owner binding.

///|
fn verify_logit_axis_source(
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
test "Logit original Axis raw minor and transformed overlap 0" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  axis.bind_minpos(() => 0.01)
  let view = @core.limits(0.01, 0.99)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.1, 0.5, 0.9]).as_locator())
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original Axis raw minor and transformed overlap 1" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="clip"))
  axis.bind_minpos(() => 0.01)
  let view = @core.limits(0.01, 0.99)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.1, 0.5, 0.9]).as_locator())
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original Axis raw minor and transformed overlap 2" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  axis.bind_minpos(() => 0.01)
  let view = @core.limits(0.03, 0.97)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.1, 0.5, 0.9]).as_locator())
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original Axis raw minor and transformed overlap 3" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  axis.bind_minpos(() => 0.01)
  let view = @core.limits(0.01, 0.99)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.02, 0.5, 0.98]).as_locator())
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original Axis raw minor and transformed overlap 4" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  axis.bind_minpos(() => 0.01)
  let view = @core.limits(0.01, 0.99)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.02, 0.5, 0.98]).as_locator())
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [
    0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8, 0.91,
    0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97,
  ])
}

///|
test "Logit original Axis raw minor and transformed overlap 5" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  axis.bind_minpos(() => 0.01)
  let view = @core.limits(0.99, 0.01)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.1, 0.5, 0.9]).as_locator())
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original Axis raw minor and transformed overlap 6" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  axis.bind_minpos(() => 0.01)
  let view = @core.limits(0.45, 0.55)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.5]).as_locator())
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axis.set_minor_locator(minor.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  verify_logit_axis_source(minor.call(), [])
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [])
}

///|
test "Logit original fixed raw minor mask clip overlap 0" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  let view = @core.limits(0.01, 0.99)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.5]).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([0.5, 0.500001, 0.50001, 0.6]).as_minor_locator(),
  )
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [0.6])
}

///|
test "Logit original fixed raw minor mask clip overlap 1" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  let view = @core.limits(0.49, 0.51)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.5]).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([0.5, 0.500001, 0.50001, 0.6]).as_minor_locator(),
  )
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [
    0.500001, 0.50001, 0.6,
  ])
}

///|
test "Logit original fixed raw minor mask clip overlap 2" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="mask"))
  let view = @core.limits(0.01, 0.99)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 0.1, 0.9, 1.0, 2.0]).as_minor_locator(),
  )
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [
    -1.0, 0.1, 0.9, 2.0,
  ])
}

///|
test "Logit original fixed raw minor mask clip overlap 3" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale(nonpositive="clip"))
  let view = @core.limits(0.01, 0.99)
  axis.set_limits(view.lower(), view.upper())
  axis.set_locator(@ticker.FixedLocator::new([0.0, 1.0]).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 0.1, 0.9, 1.0, 2.0]).as_minor_locator(),
  )
  verify_logit_axis_source(axis.minor_tick_values_checked(view), [0.1, 0.9])
}

///|
test "Logit original explicit source limit clamp 0" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale())
  axis.bind_minpos(() => 0.9)
  axis.set_locator(
    @ticker.LogitLocator::new(
      minor=false,
      nbins=Some(@ticker.MaxNBins::Count(4)),
    ).as_locator(),
  )
  axis.set_limits(-1.0, 2.0)
  let actual = axis.limits().unwrap()
  verify_logit_axis_source([actual.lower(), actual.upper()], [
    0.09999999999999998, 0.9,
  ])
  axis.clear_limits()
  axis.set_view_limits(-1.0, 2.0)
  let provisional = axis.current_view_limits().unwrap()
  verify_logit_axis_source([provisional.lower(), provisional.upper()], [
    0.09999999999999998, 0.9,
  ])
}

///|
test "Logit original explicit source limit clamp 1" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale())
  axis.bind_minpos(() => 0.9)
  axis.set_locator(
    @ticker.LogitLocator::new(
      minor=false,
      nbins=Some(@ticker.MaxNBins::Count(4)),
    ).as_locator(),
  )
  axis.set_limits(2.0, -1.0)
  let actual = axis.limits().unwrap()
  verify_logit_axis_source([actual.lower(), actual.upper()], [
    0.9, 0.09999999999999998,
  ])
  axis.clear_limits()
  axis.set_view_limits(2.0, -1.0)
  let provisional = axis.current_view_limits().unwrap()
  verify_logit_axis_source([provisional.lower(), provisional.upper()], [
    0.9, 0.09999999999999998,
  ])
}

///|
test "Logit original explicit source limit clamp 2" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale())
  axis.bind_minpos(() => 0.9)
  axis.set_locator(
    @ticker.LogitLocator::new(
      minor=false,
      nbins=Some(@ticker.MaxNBins::Count(4)),
    ).as_locator(),
  )
  axis.set_limits(1.0, 2.0)
  let actual = axis.limits().unwrap()
  verify_logit_axis_source([actual.lower(), actual.upper()], [
    1.0e-07, 0.9999999,
  ])
  axis.clear_limits()
  axis.set_view_limits(1.0, 2.0)
  let provisional = axis.current_view_limits().unwrap()
  verify_logit_axis_source([provisional.lower(), provisional.upper()], [
    1.0e-07, 0.9999999,
  ])
}

///|
test "Logit original explicit source limit clamp 3" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale())
  axis.bind_minpos(() => 0.9)
  axis.set_locator(
    @ticker.LogitLocator::new(
      minor=false,
      nbins=Some(@ticker.MaxNBins::Count(4)),
    ).as_locator(),
  )
  axis.set_limits(-2.0, -1.0)
  let actual = axis.limits().unwrap()
  verify_logit_axis_source([actual.lower(), actual.upper()], [
    1.0e-07, 0.9999999,
  ])
  axis.clear_limits()
  axis.set_view_limits(-2.0, -1.0)
  let provisional = axis.current_view_limits().unwrap()
  verify_logit_axis_source([provisional.lower(), provisional.upper()], [
    1.0e-07, 0.9999999,
  ])
}

///|
test "Logit original explicit source limit clamp 4" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale())
  axis.bind_minpos(() => 0.9)
  axis.set_locator(
    @ticker.LogitLocator::new(
      minor=false,
      nbins=Some(@ticker.MaxNBins::Count(4)),
    ).as_locator(),
  )
  axis.set_limits(0.5, 0.5)
  let actual = axis.limits().unwrap()
  verify_logit_axis_source([actual.lower(), actual.upper()], [0.05, 0.95])
  axis.clear_limits()
  axis.set_view_limits(0.5, 0.5)
  let provisional = axis.current_view_limits().unwrap()
  verify_logit_axis_source([provisional.lower(), provisional.upper()], [
    0.05, 0.95,
  ])
}

///|
test "Logit original explicit source limit clamp 5" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale())
  axis.bind_minpos(() => 0.9)
  axis.set_locator(
    @ticker.LogitLocator::new(
      minor=false,
      nbins=Some(@ticker.MaxNBins::Count(4)),
    ).as_locator(),
  )
  assert_true(
    try {
      axis.set_limits(0.0 / 0.0, 0.9)
      false
    } catch {
      @core.DataError::NonFiniteLimit(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      axis.set_view_limits(0.0 / 0.0, 0.9)
      false
    } catch {
      @core.DataError::NonFiniteLimit(..) => true
      _ => false
    },
  )
}

///|
test "Logit original explicit source limit clamp 6" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale())
  axis.bind_minpos(() => 0.9)
  axis.set_locator(
    @ticker.LogitLocator::new(
      minor=false,
      nbins=Some(@ticker.MaxNBins::Count(4)),
    ).as_locator(),
  )
  assert_true(
    try {
      axis.set_limits(-1.0 / 0.0, 1.0 / 0.0)
      false
    } catch {
      @core.DataError::NonFiniteLimit(..) => true
      _ => false
    },
  )
  assert_true(
    try {
      axis.set_view_limits(-1.0 / 0.0, 1.0 / 0.0)
      false
    } catch {
      @core.DataError::NonFiniteLimit(..) => true
      _ => false
    },
  )
}

///|
test "Logit original explicit source limit clamp 7" {
  let axis = @axis.axis()
  axis.set_scale(@scale.logit_scale())
  axis.bind_minpos(() => 2.0)
  axis.set_locator(
    @ticker.LogitLocator::new(
      minor=false,
      nbins=Some(@ticker.MaxNBins::Count(4)),
    ).as_locator(),
  )
  axis.set_limits(-1.0, 2.0)
  let actual = axis.limits().unwrap()
  verify_logit_axis_source([actual.lower(), actual.upper()], [-1.0, 2.0])
  axis.clear_limits()
  axis.set_view_limits(-1.0, 2.0)
  let provisional = axis.current_view_limits().unwrap()
  verify_logit_axis_source([provisional.lower(), provisional.upper()], [
    -1.0, 2.0,
  ])
}

///|
test "Logit original last owner and independent copy x" {
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_limits(0.01, 0.99)
  second.set_limits(0.2, 0.8)
  first.bind_minpos(() => 0.01)
  second.bind_minpos(() => 0.01)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  first.set_locator(locator.as_locator())
  verify_logit_axis_source(locator.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  let external = locator.copy()
  second.set_locator(locator.as_locator())
  verify_logit_axis_source(locator.call(), [0.2, 0.4, 0.6000000000000001, 0.8])
  second.set_limits(0.45, 0.55)
  verify_logit_axis_source(locator.call(), [0.45, 0.5, 0.55])
  verify_logit_axis_source(external.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
}

///|
test "Logit original last owner and independent copy y" {
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_limits(0.01, 0.99)
  second.set_limits(0.2, 0.8)
  first.bind_minpos(() => 0.01)
  second.bind_minpos(() => 0.01)
  let locator = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  first.set_locator(locator.as_locator())
  verify_logit_axis_source(locator.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  let external = locator.copy()
  second.set_locator(locator.as_locator())
  verify_logit_axis_source(locator.call(), [0.2, 0.4, 0.6000000000000001, 0.8])
  second.set_limits(0.45, 0.55)
  verify_logit_axis_source(locator.call(), [0.45, 0.5, 0.55])
  verify_logit_axis_source(external.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
}

///|
test "Logit original shared removal copies retain detached owner x" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_x=true)
  axes[0].set_x_limits(0.01, 0.99)
  let major = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axes[1].set_x_locator(major.as_locator())
  axes[1].set_x_minor_locator(minor.as_minor_locator())
  verify_logit_axis_source(major.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  let external_major = major.copy()
  let external_minor = minor.copy()
  axes[1].remove()
  verify_logit_axis_source(major.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  axes[1].set_x_limits(0.2, 0.8)
  verify_logit_axis_source(external_major.call(), [
    0.2, 0.4, 0.6000000000000001, 0.8,
  ])
  verify_logit_axis_source(external_minor.call(), [])
}

///|
test "Logit original shared removal copies retain detached owner y" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_y=true)
  axes[0].set_y_limits(0.01, 0.99)
  let major = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  axes[1].set_y_locator(major.as_locator())
  axes[1].set_y_minor_locator(minor.as_minor_locator())
  verify_logit_axis_source(major.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  let external_major = major.copy()
  let external_minor = minor.copy()
  axes[1].remove()
  verify_logit_axis_source(major.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  axes[1].set_y_limits(0.2, 0.8)
  verify_logit_axis_source(external_major.call(), [
    0.2, 0.4, 0.6000000000000001, 0.8,
  ])
  verify_logit_axis_source(external_minor.call(), [])
}

///|
test "Logit original secondary own function view and empty minpos 0" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_scale(@scale.logit_scale())
  axes.set_x_limits(0.01, 0.99)
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  // Match source host _set_lims before custom locator installation.
  secondary.apply_aspect()
  let major = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_logit_axis_source(major.call(), [0.0001, 0.5, 0.9999, 0.99999999])
  verify_logit_axis_source(minor.call(), [
    1.0e-07, 1.0e-06, 1.0e-05, 0.001, 0.01, 0.1, 0.9, 0.99, 0.999, 0.99999, 0.999999,
    0.9999999,
  ])
  verify_logit_axis_source(secondary.minor_tick_values_checked(), [
    1.0e-07, 1.0e-06, 1.0e-05, 0.001, 0.01, 0.1, 0.9, 0.99, 0.999,
  ])
}

///|
test "Logit original secondary own function view and empty minpos 1" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_scale(@scale.logit_scale())
  axes.set_x_limits(0.01, 0.49)
  let secondary = axes.secondary_xaxis(value => value * 2.0, value => {
    value / 2.0
  })
  // Match source host _set_lims before custom locator installation.
  secondary.apply_aspect()
  let major = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_logit_axis_source(major.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  verify_logit_axis_source(secondary.minor_tick_values_checked(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original secondary own function view and empty minpos 2" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_scale(@scale.logit_scale())
  axes.set_y_limits(0.01, 0.99)
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  // Match source host _set_lims before custom locator installation.
  secondary.apply_aspect()
  let major = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_logit_axis_source(major.call(), [0.0001, 0.5, 0.9999, 0.99999999])
  verify_logit_axis_source(minor.call(), [
    1.0e-07, 1.0e-06, 1.0e-05, 0.001, 0.01, 0.1, 0.9, 0.99, 0.999, 0.99999, 0.999999,
    0.9999999,
  ])
  verify_logit_axis_source(secondary.minor_tick_values_checked(), [
    1.0e-07, 1.0e-06, 1.0e-05, 0.001, 0.01, 0.1, 0.9, 0.99, 0.999,
  ])
}

///|
test "Logit original secondary own function view and empty minpos 3" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_scale(@scale.logit_scale())
  axes.set_y_limits(0.01, 0.49)
  let secondary = axes.secondary_yaxis(value => value * 2.0, value => {
    value / 2.0
  })
  // Match source host _set_lims before custom locator installation.
  secondary.apply_aspect()
  let major = @ticker.LogitLocator::new(
    minor=false,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  let minor = @ticker.LogitLocator::new(
    minor=true,
    nbins=Some(@ticker.MaxNBins::Count(4)),
  )
  secondary.set_locator(major.as_locator())
  secondary.set_minor_locator(minor.as_minor_locator())
  verify_logit_axis_source(major.call(), [0.01, 0.1, 0.5, 0.9, 0.99])
  verify_logit_axis_source(minor.call(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
  verify_logit_axis_source(secondary.minor_tick_values_checked(), [
    0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8,
    0.91, 0.92, 0.9299999999999999, 0.94, 0.95, 0.96, 0.97, 0.98,
  ])
}

///|
test "Logit original physical budget is not MaxN clipped 0" {
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, true)
  axis.set_limits(1.0e-9, 0.999999999)
  axis.bind_minpos(() => 0.01)
  let locator = @ticker.LogitLocator::new(minor=false)
  axis.set_locator(locator.as_locator())
  assert_eq(locator.as_maxn_locator().tick_space_provider().unwrap()(), 0.0)
  verify_logit_axis_source(locator.call(), [1.0e-09, 0.5, 0.999999999])
}

///|
test "Logit original physical budget is not MaxN clipped 1" {
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, true)
  axis.set_limits(1.0e-9, 0.999999999)
  axis.bind_minpos(() => 0.01)
  let locator = @ticker.LogitLocator::new(minor=false)
  axis.set_locator(locator.as_locator())
  assert_eq(locator.as_maxn_locator().tick_space_provider().unwrap()(), 4.0)
  verify_logit_axis_source(locator.call(), [1.0e-05, 0.5, 0.99999, 0.9999999999])
}

///|
test "Logit original physical budget is not MaxN clipped 2" {
  let axis = @axis.axis()
  axis.set_tick_layout(1200.0, true)
  axis.set_limits(1.0e-9, 0.999999999)
  axis.bind_minpos(() => 0.01)
  let locator = @ticker.LogitLocator::new(minor=false)
  axis.set_locator(locator.as_locator())
  assert_eq(locator.as_maxn_locator().tick_space_provider().unwrap()(), 40.0)
  verify_logit_axis_source(locator.call(), [
    1.0e-09, 1.0e-08, 1.0e-07, 1.0e-06, 1.0e-05, 0.0001, 0.001, 0.01, 0.1, 0.5, 0.9,
    0.99, 0.999, 0.9999, 0.99999, 0.999999, 0.9999999, 0.99999999, 0.999999999, 0.9999999999,
  ])
}

///|
test "Logit original physical budget is not MaxN clipped 3" {
  let axis = @axis.axis()
  axis.set_tick_layout(0.0, false)
  axis.set_limits(1.0e-9, 0.999999999)
  axis.bind_minpos(() => 0.01)
  let locator = @ticker.LogitLocator::new(minor=false)
  axis.set_locator(locator.as_locator())
  assert_eq(locator.as_maxn_locator().tick_space_provider().unwrap()(), 0.0)
  verify_logit_axis_source(locator.call(), [1.0e-09, 0.5, 0.999999999])
}

///|
test "Logit original physical budget is not MaxN clipped 4" {
  let axis = @axis.axis()
  axis.set_tick_layout(120.0, false)
  axis.set_limits(1.0e-9, 0.999999999)
  axis.bind_minpos(() => 0.01)
  let locator = @ticker.LogitLocator::new(minor=false)
  axis.set_locator(locator.as_locator())
  assert_eq(locator.as_maxn_locator().tick_space_provider().unwrap()(), 6.0)
  verify_logit_axis_source(locator.call(), [
    1.0e-09, 1.0e-06, 0.001, 0.5, 0.999, 0.999999, 0.999999999,
  ])
}

///|
test "Logit original physical budget is not MaxN clipped 5" {
  let axis = @axis.axis()
  axis.set_tick_layout(1200.0, false)
  axis.set_limits(1.0e-9, 0.999999999)
  axis.bind_minpos(() => 0.01)
  let locator = @ticker.LogitLocator::new(minor=false)
  axis.set_locator(locator.as_locator())
  assert_eq(locator.as_maxn_locator().tick_space_provider().unwrap()(), 60.0)
  verify_logit_axis_source(locator.call(), [
    1.0e-09, 1.0e-08, 1.0e-07, 1.0e-06, 1.0e-05, 0.0001, 0.001, 0.01, 0.1, 0.5, 0.9,
    0.99, 0.999, 0.9999, 0.99999, 0.999999, 0.9999999, 0.99999999, 0.999999999, 0.9999999999,
  ])
}
