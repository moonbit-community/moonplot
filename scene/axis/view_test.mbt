///|
test "provisional limits fit images without disabling automatic scaling" {
  let axis = @axis.axis()
  let automatic = @core.limits(-11.0, 11.0)
  axis.set_auto_limits(1.5, -0.5)
  assert_true(axis.limits() is None)
  assert_true(axis.inverted())
  let fitted = axis.view_limits(automatic)
  assert_eq((fitted.lower(), fitted.upper()), (1.5, -0.5))
  axis.request_autoscale()
  let expanded = axis.view_limits(automatic)
  assert_eq((expanded.lower(), expanded.upper()), (11.0, -11.0))
  axis.clear()
  let cleared = axis.view_limits(automatic)
  // Axis.clear replaces tickers; the outer Axes clear owns view resets.
  assert_true(axis.inverted())
  assert_eq((cleared.lower(), cleared.upper()), (11.0, -11.0))
}

///|
test "explicit limits win over images and preserve direction through autoscale" {
  let axis = @axis.axis()
  let automatic = @core.limits(0.0, 10.0)
  axis.set_limits(5.0, -5.0)
  axis.set_auto_limits(20.0, 30.0)
  axis.request_autoscale()
  let fixed = axis.view_limits(automatic)
  assert_eq((fixed.lower(), fixed.upper()), (5.0, -5.0))
  axis.clear_limits()
  let expanded = axis.view_limits(automatic)
  assert_eq((expanded.lower(), expanded.upper()), (10.0, 0.0))
}

///|
test "resolved views preserve explicit versus automatic selection and direction" {
  let axis = @axis.axis()
  axis.set_view_limits(2.0, -2.0)
  assert_true(axis.limits() is None)
  assert_true(axis.inverted())
  assert_eq(axis.current_view_limits().unwrap().lower(), 2.0)
  axis.request_autoscale()
  assert_true(axis.current_view_limits() is None)
  axis.set_limits(0.0, 1.0)
  axis.set_view_limits(-1.0, 2.0)
  axis.request_autoscale()
  assert_eq(axis.limits().unwrap().lower(), -1.0)
  assert_eq(axis.current_view_limits().unwrap().upper(), 2.0)
}

///|
test "invalid resolved views preserve their previous limits" {
  let axis = @axis.axis()
  axis.set_scale(@scale.log_scale())
  axis.set_view_limits(1.0, 10.0)
  for value in [0.0, -1.0, 1.0 / 0.0, 0.0 / 0.0] {
    try axis.set_view_limits(value, 100.0) catch {
      @core.DataError::NonFiniteLimit(_) => ()
      _ => fail("expected invalid view")
    } noraise {
      _ => fail("expected invalid view")
    }
    assert_eq(axis.current_view_limits().unwrap().lower(), 1.0)
    assert_eq(axis.current_view_limits().unwrap().upper(), 10.0)
  }
}
