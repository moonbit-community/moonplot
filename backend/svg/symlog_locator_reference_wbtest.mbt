// Complete original secondary transform-tree fixed-bbox observations.

///|
fn verify_symlog_display_source(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() {
      assert_true(actual[index].is_nan())
    } else if value.is_inf() || value == 0.0 {
      assert_eq(
        actual[index].reinterpret_as_uint64(),
        value.reinterpret_as_uint64(),
      )
    } else {
      assert_true(
        Double::abs(actual[index] - value) <= Double::abs(value) * 1.0e-12,
      )
    }
  }
}

///|
test "SymLog original secondary normalized position and visibility 0" {
  let primary_scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let scale : Scale = {
    xmin: -100.0,
    xmax: 100.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: primary_scale,
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let secondary = secondary_display_scale(scale, true)
  let raw_values = [-215.0, -195.0, -95.0, 5.0, 105.0, 205.0, 225.0]
  let actual : Array[Double] = []
  let visible : Array[Double] = []
  for value in raw_values {
    let primary = (value - 5.0) / 2.0
    if tick_in_view(primary, secondary.x_axis_scale, -100.0, 100.0) {
      visible.push(value)
      actual.push(map_x(secondary, 40.0, 400.0, primary))
    }
  }
  assert_eq(visible, [-195.0, -95.0, 5.0, 105.0, 205.0])
  verify_symlog_display_source(actual, [40.0, 140.0, 240.0, 340.0, 440.0])
}

///|
test "SymLog original secondary normalized position and visibility 1" {
  let primary_scale = @ticker_scale.log_scale()
  let scale : Scale = {
    xmin: 1.0,
    xmax: 100.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: primary_scale,
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let secondary = secondary_display_scale(scale, true)
  let raw_values = [5.0, 7.0, 25.0, 105.0, 205.0, 225.0]
  let actual : Array[Double] = []
  let visible : Array[Double] = []
  for value in raw_values {
    let primary = (value - 5.0) / 2.0
    if tick_in_view(primary, secondary.x_axis_scale, 1.0, 100.0) {
      visible.push(value)
      actual.push(map_x(secondary, 40.0, 400.0, primary))
    }
  }
  assert_eq(visible, [7.0, 25.0, 105.0, 205.0])
  verify_symlog_display_source(actual, [40.0, 240.0, 379.79400086720375, 440.0])
}

///|
test "SymLog original secondary normalized position and visibility 2" {
  let primary_scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0,
    ymin: -100.0,
    ymax: 100.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: primary_scale,
  }
  let secondary = secondary_display_scale(scale, false)
  let raw_values = [-215.0, -195.0, -95.0, 5.0, 105.0, 205.0, 225.0]
  let actual : Array[Double] = []
  let visible : Array[Double] = []
  for value in raw_values {
    let primary = (value - 5.0) / 2.0
    if tick_in_view(primary, secondary.y_axis_scale, -100.0, 100.0) {
      visible.push(value)
      actual.push(map_y(secondary, 60.0, 300.0, primary))
    }
  }
  assert_eq(visible, [-195.0, -95.0, 5.0, 105.0, 205.0])
  verify_symlog_display_source(actual, [360.0, 285.0, 210.0, 135.0, 60.0])
}

///|
test "SymLog original secondary normalized position and visibility 3" {
  let primary_scale = @ticker_scale.log_scale()
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 1.0,
    ymax: 100.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: primary_scale,
  }
  let secondary = secondary_display_scale(scale, false)
  let raw_values = [5.0, 7.0, 25.0, 105.0, 205.0, 225.0]
  let actual : Array[Double] = []
  let visible : Array[Double] = []
  for value in raw_values {
    let primary = (value - 5.0) / 2.0
    if tick_in_view(primary, secondary.y_axis_scale, 1.0, 100.0) {
      visible.push(value)
      actual.push(map_y(secondary, 60.0, 300.0, primary))
    }
  }
  assert_eq(visible, [7.0, 25.0, 105.0, 205.0])
  verify_symlog_display_source(actual, [360.0, 210.0, 105.15449934959719, 60.0])
}

///|
test "SymLog original primary transformed visibility 0" {
  let scale = @ticker_scale.linear_scale()
  let major = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0])
  let minor = [-200.0, -20.0, -2.0, 2.0, 20.0, 200.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(minor, [-20.0, -2.0, 2.0, 20.0])
}

///|
test "SymLog original primary transformed visibility 1" {
  let scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let major = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0])
  let minor = [-200.0, -20.0, -2.0, 2.0, 20.0, 200.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(minor, [-20.0, -2.0, 2.0, 20.0])
}

///|
test "SymLog original primary transformed visibility 2" {
  let scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let major = [100.0, 10.0, 1.0, 0.0, -1.0, -10.0, -100.0].filter(value => {
    tick_in_view(value, scale, 100.0, -100.0)
  })
  assert_eq(major, [100.0, 10.0, 1.0, 0.0, -1.0, -10.0, -100.0])
  let minor = [-200.0, -20.0, -2.0, 2.0, 20.0, 200.0].filter(value => {
    tick_in_view(value, scale, 100.0, -100.0)
  })
  assert_eq(minor, [-20.0, -2.0, 2.0, 20.0])
}

///|
test "SymLog original primary transformed visibility 3" {
  let scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let major = [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [-100.0, -10.0, -1.0, 0.0, 1.0, 10.0, 100.0])
  let minor = [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0, 200.0,
  ].filter(value => tick_in_view(value, scale, -100.0, 100.0))
  assert_eq(minor, [
    -100.0, -10.0, -20.0, -1.0, -2.0, 0.0, 1.0, 2.0, 10.0, 20.0, 100.0,
  ])
}

///|
test "SymLog original primary transformed visibility 4" {
  let scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let major = [0.0].filter(value => tick_in_view(value, scale, -0.8, 0.8))
  assert_eq(major, [0.0])
  let minor = [-0.8, 0.8].filter(value => tick_in_view(value, scale, -0.8, 0.8))
  assert_eq(minor, [-0.8, 0.8])
}

///|
test "SymLog original primary transformed visibility 5" {
  let scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let major = [-10.0, 0.0, 10.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [-10.0, 0.0, 10.0])
  let minor = [
    -100.0, 100.0, -200.0, -20.0, -1.0, 1.0, -2.0, 1.0, -1.0, 2.0, 20.0, 100.0, -100.0,
    200.0,
  ].filter(value => tick_in_view(value, scale, -100.0, 100.0))
  assert_eq(minor, [
    -100.0, 100.0, -20.0, -1.0, 1.0, -2.0, 1.0, -1.0, 2.0, 20.0, 100.0, -100.0,
  ])
}

///|
test "SymLog original primary transformed visibility 6" {
  let scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let major = [10.0, -10.0, 0.0, 10.0].filter(value => {
    tick_in_view(value, scale, -20.0, 20.0)
  })
  assert_eq(major, [10.0, -10.0, 0.0, 10.0])
  let minor = [-20.0, -1.0, -2.0, 1.0, 2.0, 20.0].filter(value => {
    tick_in_view(value, scale, -20.0, 20.0)
  })
  assert_eq(minor, [-20.0, -1.0, -2.0, 1.0, 2.0, 20.0])
}

///|
test "SymLog original primary transformed visibility 7" {
  let scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let major = [10.0, 100.0].filter(value => {
    tick_in_view(value, scale, 2.1, 40.0)
  })
  assert_eq(major, [10.0])
  let minor = [1.0, 2.0, 5.0, 20.0, 50.0].filter(value => {
    tick_in_view(value, scale, 2.1, 40.0)
  })
  assert_eq(minor, [5.0, 20.0])
}

///|
test "SymLog original primary transformed visibility 8" {
  let scale = @ticker_scale.symlog_scale(linthresh=2.0)
  let major = [0.0, 1.000001, 10.0].filter(value => {
    tick_in_view(value, scale, -100.0, 100.0)
  })
  assert_eq(major, [0.0, 1.000001, 10.0])
  let minor = [
    -100.0, -200.0, -10.0, -20.0, -1.0, -2.0, 2.0, 20.0, 100.0, 200.0,
  ].filter(value => tick_in_view(value, scale, -100.0, 100.0))
  assert_eq(minor, [-100.0, -10.0, -20.0, -1.0, -2.0, 2.0, 20.0, 100.0])
}

///|
test "SymLog original primary transformed visibility 9" {
  let scale = @ticker_scale.log_scale()
  let major = [0.0, 1.0, 10.0, 100.0].filter(value => {
    tick_in_view(value, scale, 1.0, 100.0)
  })
  assert_eq(major, [1.0, 10.0, 100.0])
  let minor = [2.0, 20.0, 200.0].filter(value => {
    tick_in_view(value, scale, 1.0, 100.0)
  })
  assert_eq(minor, [2.0, 20.0])
}
