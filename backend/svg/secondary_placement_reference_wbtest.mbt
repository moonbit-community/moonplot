// Generated from actual original child.transData positions; do not edit.

///|
fn secondary_placement_source_double(
  actual : Double,
  expected : Double,
) -> Unit raise {
  assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
}

///|
fn secondary_placement_source_case_20() -> Unit raise {
  let own = @axis.axis()
  own.configure_function_scale(value => -value, value => -value)
  own.set_limits(
    13849694754071117824UL.reinterpret_as_double(),
    13845191154443747328UL.reinterpret_as_double(),
  )
  let transform = own.coordinate_transform()
  let values = [
    13849694754071117824UL.reinterpret_as_double(),
    13848005904210853888UL.reinterpret_as_double(),
    13845191154443747328UL.reinterpret_as_double(),
  ]
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => -value,
    value => -value,
    None,
    6,
    None,
    Some(@ticker.FixedLocator::new(values).as_locator()),
    None,
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
    major_formatter_locations_provider=Some(() => {
      @ticker.FormatterLocations::NdArray(
        @ticker.TickValues::from_array(values),
      )
    }),
    placement_provider=Some(() => {
      @render.SecondaryPlacement::new(
        13849694754071117824UL.reinterpret_as_double(),
        13845191154443747328UL.reinterpret_as_double(),
        transform,
      )
    }),
  )
  let bundle = secondary_axis_bundle(axis, [], 10.0, 20.0)
  let placement = bundle.placement.unwrap()
  secondary_placement_source_double(
    placement.0,
    4621819117588971520UL.reinterpret_as_double(),
  )
  secondary_placement_source_double(
    placement.1,
    4626322717216342016UL.reinterpret_as_double(),
  )
  assert_eq(bundle.major.length(), 3)
  let fraction = secondary_tick_fraction(
    bundle,
    bundle.major[0].0,
    bundle.major[0].1,
    @ticker_scale.Scale::Linear,
    10.0,
    20.0,
  ).unwrap()
  secondary_placement_source_double(
    0UL.reinterpret_as_double() +
    fraction * 4638707616191610880UL.reinterpret_as_double(),
    4638707616191610880UL.reinterpret_as_double(),
  )
  let fraction = secondary_tick_fraction(
    bundle,
    bundle.major[1].0,
    bundle.major[1].1,
    @ticker_scale.Scale::Linear,
    10.0,
    20.0,
  ).unwrap()
  secondary_placement_source_double(
    0UL.reinterpret_as_double() +
    fraction * 4638707616191610880UL.reinterpret_as_double(),
    4634204016564240384UL.reinterpret_as_double(),
  )
  let fraction = secondary_tick_fraction(
    bundle,
    bundle.major[2].0,
    bundle.major[2].1,
    @ticker_scale.Scale::Linear,
    10.0,
    20.0,
  ).unwrap()
  secondary_placement_source_double(
    0UL.reinterpret_as_double() +
    fraction * 4638707616191610880UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
  )
}

///|
fn secondary_placement_source_case_21() -> Unit raise {
  let own = @axis.axis()
  own.configure_function_scale(value => -value, value => -value)
  own.set_limits(
    13845191154443747328UL.reinterpret_as_double(),
    13849694754071117824UL.reinterpret_as_double(),
  )
  let transform = own.coordinate_transform()
  let values = [
    13849694754071117824UL.reinterpret_as_double(),
    13848005904210853888UL.reinterpret_as_double(),
    13845191154443747328UL.reinterpret_as_double(),
  ]
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => -value,
    value => -value,
    None,
    6,
    None,
    Some(@ticker.FixedLocator::new(values).as_locator()),
    None,
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
    major_formatter_locations_provider=Some(() => {
      @ticker.FormatterLocations::NdArray(
        @ticker.TickValues::from_array(values),
      )
    }),
    placement_provider=Some(() => {
      @render.SecondaryPlacement::new(
        13845191154443747328UL.reinterpret_as_double(),
        13849694754071117824UL.reinterpret_as_double(),
        transform,
      )
    }),
  )
  let bundle = secondary_axis_bundle(axis, [], 10.0, 20.0)
  let placement = bundle.placement.unwrap()
  secondary_placement_source_double(
    placement.0,
    4626322717216342016UL.reinterpret_as_double(),
  )
  secondary_placement_source_double(
    placement.1,
    4621819117588971520UL.reinterpret_as_double(),
  )
  assert_eq(bundle.major.length(), 3)
  let fraction = secondary_tick_fraction(
    bundle,
    bundle.major[0].0,
    bundle.major[0].1,
    @ticker_scale.Scale::Linear,
    10.0,
    20.0,
  ).unwrap()
  secondary_placement_source_double(
    0UL.reinterpret_as_double() +
    fraction * 4638707616191610880UL.reinterpret_as_double(),
    0UL.reinterpret_as_double(),
  )
  let fraction = secondary_tick_fraction(
    bundle,
    bundle.major[1].0,
    bundle.major[1].1,
    @ticker_scale.Scale::Linear,
    10.0,
    20.0,
  ).unwrap()
  secondary_placement_source_double(
    0UL.reinterpret_as_double() +
    fraction * 4638707616191610880UL.reinterpret_as_double(),
    4634204016564240384UL.reinterpret_as_double(),
  )
  let fraction = secondary_tick_fraction(
    bundle,
    bundle.major[2].0,
    bundle.major[2].1,
    @ticker_scale.Scale::Linear,
    10.0,
    20.0,
  ).unwrap()
  secondary_placement_source_double(
    0UL.reinterpret_as_double() +
    fraction * 4638707616191610880UL.reinterpret_as_double(),
    4638707616191610880UL.reinterpret_as_double(),
  )
}

///|
test "original secondary decreasing placement group 0" {
  secondary_placement_source_case_20() catch {
    error => fail("secondary placement source 20: " + error.to_string())
  }
  secondary_placement_source_case_21() catch {
    error => fail("secondary placement source 21: " + error.to_string())
  }
}
