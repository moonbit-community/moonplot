///|
test "formatter transform metadata remains live and its public probe propagates errors" {
  let binding = @ticker.FormatterAxisBinding::new()
  assert_true(binding.transform_linthresh() is None)
  let threshold = @ref.Ref(2.0)
  binding.bind_transform_linthresh(() => {
    Some(@ticker.ScalarNumber::Number(threshold.val))
  })
  assert_eq(
    binding.transform_linthresh(),
    Some(@ticker.ScalarNumber::Number(2.0)),
  )
  threshold.val = 0.5
  assert_eq(
    binding.transform_linthresh(),
    Some(@ticker.ScalarNumber::Number(0.5)),
  )
  binding.bind_transform_linthresh(() => {
    raise @core.DataError::InvalidTicks(
      message="AttributeError: direct transform probe",
    )
  })
  let message = try {
    ignore(binding.transform_linthresh())
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(message, "AttributeError: direct transform probe")
  binding.clear_transform_linthresh()
  assert_true(binding.transform_linthresh() is None)
}

///|
test "primary metadata follows current scale while secondary and dummy have no linthresh attribute" {
  let axis = @axis.axis()
  let binding = axis.formatter_axis_binding()
  assert_true(binding.transform_linthresh() is None)
  axis.set_scale(@scale.symlog_scale(linthresh=2.0))
  assert_eq(
    binding.transform_linthresh(),
    Some(@ticker.ScalarNumber::Number(2.0)),
  )
  axis.set_scale(@scale.symlog_scale(linthresh=0.5))
  assert_eq(
    binding.transform_linthresh(),
    Some(@ticker.ScalarNumber::Number(0.5)),
  )
  axis.set_scale(@scale.linear_scale())
  assert_true(binding.transform_linthresh() is None)

  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_limits(-2.0, 2.0)
  axes.set_y_limits(-2.0, 2.0)
  axes.x_axis().set_scale(@scale.symlog_scale(linthresh=2.0))
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  assert_true(secondary.formatter_axis_binding().transform_linthresh() is None)
  let formatter = @ticker.LogFormatterMathtext::new()
  formatter.create_dummy_axis()
  assert_true(formatter.axis().unwrap().transform_linthresh() is None)
}
