///|
test "Index axis uses live artist data independently of explicit view and margins" {
  let figure = @scene.figure(width=420, height=280)
  let axes = figure.axes()
  axes.plot([0.0, 4.0], [10.0, 14.0])
  let locator = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  axes.set_x_locator(locator.as_locator())
  axes.set_x_limits(100.0, 200.0)
  axes.set_x_margin(0.25)
  axes.set_x_formatter(@ticker.format_str_formatter("local-data=%.0f"))
  assert_eq(locator.call(), [0.0, 1.0, 2.0, 3.0, 4.0])
  let axis = axes.x_axis()
  let data = axis.data_interval()
  assert_eq((data.lower(), data.upper()), (0.0, 4.0))
  assert_eq(axis.tick_values_checked(@core.limits(100.0, 200.0)), [
    0.0, 1.0, 2.0, 3.0, 4.0,
  ])
  let svg = figure.to_svg_checked()
  assert_true(!svg.contains(">local-data="))
  axes.plot([8.0], [18.0])
  assert_eq(locator.call(), Array::makei(9, value => Double::from_int(value)))
  axes.set_x_limits(8.0, 0.0)
  assert_eq(locator.call(), Array::makei(9, value => Double::from_int(value)))
  assert_true(figure.to_svg_checked().contains(">local-data=8<"))
}

///|
test "shared Index major ownership is the last setting axis for x and y" {
  let figure = @scene.figure(width=480, height=320)
  let axes = figure.subplots(1, 2, share_x=true, share_y=true)
  axes[0].plot([0.0, 2.0], [10.0, 12.0])
  axes[1].plot([100.0, 104.0], [200.0, 204.0])
  let x = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  let y = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  axes[0].set_x_locator(x.as_locator())
  axes[0].set_y_locator(y.as_locator())
  assert_eq(x.call(), [0.0, 1.0, 2.0])
  assert_eq(y.call(), [10.0, 11.0, 12.0])
  axes[1].set_x_locator(x.as_locator())
  axes[1].set_y_locator(y.as_locator())
  assert_eq(x.call(), [100.0, 101.0, 102.0, 103.0, 104.0])
  assert_eq(y.call(), [200.0, 201.0, 202.0, 203.0, 204.0])
  let first_data = axes[0].x_axis().data_interval()
  let second_data = axes[1].x_axis().data_interval()
  assert_eq((first_data.lower(), first_data.upper()), (0.0, 2.0))
  assert_eq((second_data.lower(), second_data.upper()), (100.0, 104.0))
  // Merely retrieving the other axis/data must not change locator ownership.
  assert_eq(x.call(), [100.0, 101.0, 102.0, 103.0, 104.0])
  axes[0].set_x_limits(1000.0, 2000.0)
  axes[0].set_y_limits(3000.0, 4000.0)
  assert_eq(x.call(), [100.0, 101.0, 102.0, 103.0, 104.0])
  assert_eq(y.call(), [200.0, 201.0, 202.0, 203.0, 204.0])
  axes[1].plot([106.0], [206.0])
  assert_eq(x.call(), Array::makei(7, index => 100.0 + Double::from_int(index)))
  assert_eq(y.call(), Array::makei(7, index => 200.0 + Double::from_int(index)))
}

///|
test "shared Index minor uses local owner data and then clips against the view" {
  let figure = @scene.figure(width=480, height=320)
  let axes = figure.subplots(1, 2, share_x=true, share_y=true)
  axes[0].plot([0.0, 2.0], [10.0, 12.0])
  axes[1].plot([100.0, 104.0], [200.0, 204.0])
  axes[0].set_x_locator(@ticker.FixedLocator::new([0.0, 2.0]).as_locator())
  axes[0].set_y_locator(@ticker.FixedLocator::new([10.0, 12.0]).as_locator())
  let x = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  let y = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  axes[1].set_x_minor_locator(x.as_minor_locator())
  axes[1].set_y_minor_locator(y.as_minor_locator())
  assert_eq(x.call(), [100.0, 101.0, 102.0, 103.0, 104.0])
  assert_eq(y.call(), [200.0, 201.0, 202.0, 203.0, 204.0])
  axes[0].set_x_minor_locator(x.as_minor_locator())
  axes[0].set_y_minor_locator(y.as_minor_locator())
  assert_eq(x.call(), [0.0, 1.0, 2.0])
  assert_eq(y.call(), [10.0, 11.0, 12.0])
  axes[0].set_x_limits(0.0, 2.0)
  axes[0].set_y_limits(10.0, 12.0)
  assert_eq(
    axes[1].x_axis().minor_tick_values_checked(@core.limits(0.0, 2.0)),
    [1.0],
  )
  assert_eq(
    axes[1].y_axis().minor_tick_values_checked(@core.limits(10.0, 12.0)),
    [11.0],
  )
  axes[0].set_x_limits(100.0, 200.0)
  assert_eq(
    axes[1].x_axis().minor_tick_values_checked(@core.limits(100.0, 200.0)),
    [],
  )
  assert_eq(x.call(), [0.0, 1.0, 2.0])
}

///|
test "removing shared Index owner rebinds major and minor while independent copy keeps old data" {
  let figure = @scene.figure(width=480, height=320)
  let axes = figure.subplots(1, 2, share_x=true, share_y=true)
  axes[0].plot([0.0, 2.0], [10.0, 12.0])
  axes[1].plot([100.0, 104.0], [200.0, 204.0])
  let x = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  let y = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  let minor_x = @ticker.IndexLocator::new(base=2.0, offset=0.0)
  let minor_y = @ticker.IndexLocator::new(base=2.0, offset=0.0)
  axes[1].set_x_locator(x.as_locator())
  axes[1].set_y_locator(y.as_locator())
  axes[1].set_x_minor_locator(minor_x.as_minor_locator())
  axes[1].set_y_minor_locator(minor_y.as_minor_locator())
  let independent = x.copy()
  independent.set_params(base=2.0)
  assert_eq(independent.call(), [100.0, 102.0, 104.0])
  figure.delaxes(axes[1])
  assert_eq(x.call(), [0.0, 1.0, 2.0])
  assert_eq(y.call(), [10.0, 11.0, 12.0])
  assert_eq(minor_x.call(), [0.0, 2.0])
  assert_eq(minor_y.call(), [10.0, 12.0])
  assert_eq(independent.call(), [100.0, 102.0, 104.0])
  axes[1].plot([106.0], [206.0])
  assert_eq(x.call(), [0.0, 1.0, 2.0])
  assert_eq(independent.call(), [100.0, 102.0, 104.0, 106.0])
  assert_true(!axes[1].is_attached())
  assert_true(!figure.to_svg_checked().contains("NaN"))
}

///|
test "secondary Index owns empty data and checked SVG recovers with FixedLocator" {
  let figure = @scene.figure(width=420, height=280)
  figure.plot([0.0, 4.0], [0.0, 4.0])
  figure.set_bounds(@core.bounds(0.0, 4.0, 0.0, 4.0))
  let secondary_x = figure.secondary_xaxis(value => value * 2.0, value => {
    value / 2.0
  })
  let secondary_y = figure.secondary_yaxis(value => value * 2.0, value => {
    value / 2.0
  })
  let x = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  let y = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  secondary_x.set_locator(x.as_locator())
  secondary_y.set_locator(y.as_locator())
  for locator in [x, y] {
    assert_true(
      try {
        ignore(locator.call())
        false
      } catch {
        @core.DataError::InvalidTicks(..) => true
        _ => false
      },
    )
  }
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  secondary_x.set_locator(
    @ticker.FixedLocator::new([0.0, 4.0, 8.0]).as_locator(),
  )
  secondary_y.set_locator(
    @ticker.FixedLocator::new([0.0, 4.0, 8.0]).as_locator(),
  )
  secondary_x.set_formatter(@ticker.format_str_formatter("empty-x=%.0f"))
  secondary_y.set_formatter(@ticker.format_str_formatter("empty-y=%.0f"))
  let svg = figure.to_svg_checked()
  assert_true(svg.contains(">empty-x=4<"))
  assert_true(svg.contains(">empty-y=4<"))
  assert_true(!svg.contains("NaN"))
}

///|
test "axis data interval is empty before artists and updates through existing getters" {
  let figure = @scene.figure()
  let axes = figure.axes()
  let x = axes.x_axis()
  let empty = x.data_interval()
  assert_true(empty.lower().is_inf() && empty.lower() > 0.0)
  assert_true(empty.upper().is_inf() && empty.upper() < 0.0)
  axes.plot([3.0, 7.0], [20.0, 25.0])
  let observed = x.data_interval()
  assert_eq((observed.lower(), observed.upper()), (3.0, 7.0))
  axes.set_x_limits(100.0, 200.0)
  let same = x.data_interval()
  assert_eq((same.lower(), same.upper()), (3.0, 7.0))
}
