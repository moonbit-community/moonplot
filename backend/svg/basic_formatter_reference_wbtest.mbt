// Complete original Axis full formatting precedes minor providers and visibility.

///|
fn basic_formatter_reference_figure(x : @axis.Axis) -> @render.Figure {
  let y = @axis.axis()
  try! y.set_limits(0.0, 1.0)
  try! y.set_locator(@ticker.NullLocator::new().as_locator())
  try! y.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  @render.figure(
    240,
    120,
    0,
    [@render.panel(None, [], None, [], None, x, y, false, [], [])],
    [],
    None,
  )
}

///|
test "basic Formatter original renderer batch and callback order 0: full major/minor positions" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = render_with_positions_checked(
      basic_formatter_reference_figure(axis),
    ).0
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_eq(svg.split(">minor:1<").count() - 1, 1)
  assert_true(!svg.contains(">major:0<"))
  assert_true(!svg.contains(">major:3<"))
  assert_true(!svg.contains(">minor:0<"))
  assert_true(!svg.contains(">minor:2<"))
  assert_eq(callbacks, [
    ("major", -1.0, Some(0)),
    ("major", 0.0, Some(1)),
    ("major", 1.0, Some(2)),
    ("major", 2.0, Some(3)),
    ("minor", -2.0, Some(0)),
    ("minor", 0.5, Some(1)),
    ("minor", 3.0, Some(2)),
  ])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original renderer batch and callback order 1: fixed positions include hidden neighbors" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FixedFormatter::new([
    "major:0", "major:1", "major:2", "major:3", "major:4",
  ]).as_base_formatter()
  let minor = @ticker.FixedFormatter::new([
    "minor:0", "minor:1", "minor:2", "minor:3", "minor:4",
  ]).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = render_with_positions_checked(
      basic_formatter_reference_figure(axis),
    ).0
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_eq(svg.split(">minor:1<").count() - 1, 1)
  assert_true(!svg.contains(">major:0<"))
  assert_true(!svg.contains(">major:3<"))
  assert_true(!svg.contains(">minor:0<"))
  assert_true(!svg.contains(">minor:2<"))
  assert_eq(callbacks, [])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original renderer batch and callback order 2: null formatter still batches" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.NullFormatter::new().as_base_formatter()
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = render_with_positions_checked(
      basic_formatter_reference_figure(axis),
    ).0
  assert_eq(svg.split(">minor:1<").count() - 1, 1)
  assert_true(!svg.contains(">major:0<"))
  assert_true(!svg.contains(">major:3<"))
  assert_true(!svg.contains(">minor:0<"))
  assert_true(!svg.contains(">minor:2<"))
  assert_eq(callbacks, [
    ("minor", -2.0, Some(0)),
    ("minor", 0.5, Some(1)),
    ("minor", 3.0, Some(2)),
  ])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original renderer batch and callback order 3: null minor formatter still batches" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.NullFormatter::new().as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = render_with_positions_checked(
      basic_formatter_reference_figure(axis),
    ).0
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_true(!svg.contains(">major:0<"))
  assert_true(!svg.contains(">major:3<"))
  assert_true(!svg.contains(">minor:0<"))
  assert_true(!svg.contains(">minor:2<"))
  assert_eq(callbacks, [
    ("major", -1.0, Some(0)),
    ("major", 0.0, Some(1)),
    ("major", 1.0, Some(2)),
    ("major", 2.0, Some(3)),
  ])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original renderer batch and callback order 4: null locator skips major" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = render_with_positions_checked(
      basic_formatter_reference_figure(axis),
    ).0
  assert_eq(svg.split(">minor:1<").count() - 1, 1)
  assert_eq(svg.split(">minor:2<").count() - 1, 1)
  assert_true(!svg.contains(">major:0<"))
  assert_true(!svg.contains(">major:3<"))
  assert_true(!svg.contains(">minor:0<"))
  assert_eq(callbacks, [
    ("minor", -2.0, Some(0)),
    ("minor", 0.5, Some(1)),
    ("minor", 1.0, Some(2)),
    ("minor", 3.0, Some(3)),
  ])
  assert_eq(major.locations().length(), 0)
  assert_eq(minor.locations().length(), 4)
}

///|
test "basic Formatter original renderer batch and callback order 5: null locator skips minor" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = render_with_positions_checked(
      basic_formatter_reference_figure(axis),
    ).0
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_true(!svg.contains(">major:0<"))
  assert_true(!svg.contains(">major:3<"))
  assert_true(!svg.contains(">minor:0<"))
  assert_true(!svg.contains(">minor:2<"))
  assert_eq(callbacks, [
    ("major", -1.0, Some(0)),
    ("major", 0.0, Some(1)),
    ("major", 1.0, Some(2)),
    ("major", 2.0, Some(3)),
  ])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
}

///|
test "basic Formatter original renderer batch and callback order 6: shared formatter final locations" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("shared", value, pos))
    "shared:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = major
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = render_with_positions_checked(
      basic_formatter_reference_figure(axis),
    ).0
  assert_eq(svg.split(">shared:1<").count() - 1, 2)
  assert_eq(svg.split(">shared:2<").count() - 1, 1)
  assert_true(!svg.contains(">minor:0<"))
  assert_true(!svg.contains(">minor:2<"))
  assert_true(!svg.contains(">shared:0<"))
  assert_true(!svg.contains(">shared:3<"))
  assert_eq(callbacks, [
    ("shared", -1.0, Some(0)),
    ("shared", 0.0, Some(1)),
    ("shared", 1.0, Some(2)),
    ("shared", 2.0, Some(3)),
    ("shared", -2.0, Some(0)),
    ("shared", 0.5, Some(1)),
    ("shared", 3.0, Some(2)),
  ])
  assert_eq(major.locations().length(), 3)
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original renderer batch and callback order 7: abstract major errors after assigning locations" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.BaseFormatter::new()
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(
        render_with_positions_checked(basic_formatter_reference_figure(axis)),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  assert_eq(callbacks, [])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
}

///|
test "basic Formatter original renderer batch and callback order 8: abstract minor errors after assigning locations" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.BaseFormatter::new()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(
        render_with_positions_checked(basic_formatter_reference_figure(axis)),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  assert_eq(callbacks, [
    ("major", -1.0, Some(0)),
    ("major", 0.0, Some(1)),
    ("major", 1.0, Some(2)),
    ("major", 2.0, Some(3)),
  ])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original renderer batch and callback order 9: offscreen major callback errors before minor" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    if value == -1.0 {
      raise @core.DataError::InvalidTicks(message="major callback")
    }
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(
        render_with_positions_checked(basic_formatter_reference_figure(axis)),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "major callback"
      _ => false
    },
  )
  assert_eq(callbacks, [("major", -1.0, Some(0))])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
}

///|
test "basic Formatter original renderer batch and callback order 10: offscreen minor callback errors after major" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.5, 1.0, 3.0]).as_minor_locator(),
  )
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    if value == -2.0 {
      raise @core.DataError::InvalidTicks(message="minor callback")
    }
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(
        render_with_positions_checked(basic_formatter_reference_figure(axis)),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "minor callback"
      _ => false
    },
  )
  assert_eq(callbacks, [
    ("major", -1.0, Some(0)),
    ("major", 0.0, Some(1)),
    ("major", 1.0, Some(2)),
    ("major", 2.0, Some(3)),
    ("minor", -2.0, Some(0)),
  ])
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original rendered fixed owner alias 0" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let values = [0.0, 1.0, 2.0]
  let locator = @ticker.FixedLocator::new(values)
  axis.set_locator(locator.as_locator())
  axis.set_minor_overlap_removal(true)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 0.5
    }
    "alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(formatter)
  ignore(render_with_positions_checked(basic_formatter_reference_figure(axis)))
  assert_eq(callbacks, [(0.0, Some(0)), (0.5, Some(1)), (2.0, Some(2))])
  assert_eq(values, [0.0, 0.5, 2.0])
  assert_eq(formatter.locations().length(), 3)
  for index in 0..<formatter.locations().length() {
    assert_eq(formatter.locations().get(index), [0.0, 0.5, 2.0][index])
  }
  values[0] = 0.25
  assert_eq(formatter.locations().get(0), 0.25)
}

///|
test "basic Formatter original rendered fixed owner alias 1" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let values = [0.0, 1.0, 2.0]
  let locator = @ticker.FixedLocator::new(values)
  axis.set_minor_locator(locator.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 0.5
    }
    "alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  ignore(render_with_positions_checked(basic_formatter_reference_figure(axis)))
  assert_eq(callbacks, [(0.0, Some(0)), (0.5, Some(1)), (2.0, Some(2))])
  assert_eq(values, [0.0, 0.5, 2.0])
  assert_eq(formatter.locations().length(), 3)
  for index in 0..<formatter.locations().length() {
    assert_eq(formatter.locations().get(index), [0.0, 0.5, 2.0][index])
  }
  values[0] = 0.25
  assert_eq(formatter.locations().get(0), 0.25)
}

///|
test "basic Formatter original rendered fixed owner alias 2" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let values = [0.0, 1.0, 2.0]
  let locator = @ticker.FixedLocator::new(values)
  axis.set_minor_locator(locator.as_minor_locator())
  axis.set_minor_overlap_removal(true)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 0.5
    }
    "alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  ignore(render_with_positions_checked(basic_formatter_reference_figure(axis)))
  assert_eq(callbacks, [(0.0, Some(0)), (1.0, Some(1)), (2.0, Some(2))])
  assert_eq(values, [0.0, 0.5, 2.0])
  assert_eq(formatter.locations().length(), 3)
  for index in 0..<formatter.locations().length() {
    assert_eq(formatter.locations().get(index), [0.0, 1.0, 2.0][index])
  }
  values[0] = 0.25
  assert_eq(formatter.locations().get(0), 0.0)
}

///|
test "basic Formatter original rendered linear owner alias 3" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let values = [0.0, 1.0, 2.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(0.0, 1.0, values)
  let locator = @ticker.LinearLocator::new(presets~)
  axis.set_locator(locator.as_locator())
  axis.set_minor_overlap_removal(true)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 0.5
    }
    "alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(formatter)
  ignore(render_with_positions_checked(basic_formatter_reference_figure(axis)))
  assert_eq(callbacks, [(0.0, Some(0)), (0.5, Some(1)), (2.0, Some(2))])
  assert_eq(values, [0.0, 0.5, 2.0])
  assert_eq(formatter.locations().length(), 3)
  for index in 0..<formatter.locations().length() {
    assert_eq(formatter.locations().get(index), [0.0, 0.5, 2.0][index])
  }
  values[0] = 0.25
  assert_eq(formatter.locations().get(0), 0.25)
}

///|
test "basic Formatter original rendered linear owner alias 4" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let values = [0.0, 1.0, 2.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(0.0, 1.0, values)
  let locator = @ticker.LinearLocator::new(presets~)
  axis.set_minor_locator(locator.as_minor_locator())
  axis.set_minor_overlap_removal(false)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 0.5
    }
    "alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  ignore(render_with_positions_checked(basic_formatter_reference_figure(axis)))
  assert_eq(callbacks, [(0.0, Some(0)), (0.5, Some(1)), (2.0, Some(2))])
  assert_eq(values, [0.0, 0.5, 2.0])
  assert_eq(formatter.locations().length(), 3)
  for index in 0..<formatter.locations().length() {
    assert_eq(formatter.locations().get(index), [0.0, 0.5, 2.0][index])
  }
  values[0] = 0.25
  assert_eq(formatter.locations().get(0), 0.25)
}

///|
test "basic Formatter original secondary full own position and minor batch 0" {
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    "secondary-major:" + pos.unwrap_or(-1).to_string()
  })
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    "secondary-minor:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("secondary offset")
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value * 2.0 + 5.0,
    value => (value - 5.0) / 2.0,
    None,
    6,
    Some([3.0, 5.0, 6.0, 7.0, 9.0]),
    None,
    None,
    named_formatter=Some(major.as_base_formatter()),
    minor_named_formatter=Some(minor.as_base_formatter()),
    minor_ticks_provider=Some(() => [4.0, 5.5, 8.0]),
  )
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_x_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
  writer.end_element("svg")
  let svg = writer.to_string()
  assert_eq(svg.split(">secondary-major:1<").count() - 1, 1)
  assert_eq(svg.split(">secondary-major:2<").count() - 1, 1)
  assert_eq(svg.split(">secondary-major:3<").count() - 1, 1)
  assert_eq(svg.split(">secondary-minor:1<").count() - 1, 1)
  assert_eq(svg.split(">secondary offset<").count() - 1, 1)
  assert_eq(callbacks, [
    ("major", 3.0, Some(0)),
    ("major", 5.0, Some(1)),
    ("major", 6.0, Some(2)),
    ("major", 7.0, Some(3)),
    ("major", 9.0, Some(4)),
    ("minor", 4.0, Some(0)),
    ("minor", 5.5, Some(1)),
    ("minor", 8.0, Some(2)),
  ])
  assert_eq(major.as_base_formatter().locations().length(), 5)
  assert_eq(minor.as_base_formatter().locations().length(), 3)
}

///|
test "basic Formatter original secondary full own position and minor batch 1" {
  let callbacks : Array[(String, Double, Int32?)] = []
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    "secondary-major:" + pos.unwrap_or(-1).to_string()
  })
  let minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("minor", value, pos))
    "secondary-minor:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("secondary offset")
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Right,
    value => value * 2.0 + 5.0,
    value => (value - 5.0) / 2.0,
    None,
    6,
    Some([3.0, 5.0, 6.0, 7.0, 9.0]),
    None,
    None,
    named_formatter=Some(major.as_base_formatter()),
    minor_named_formatter=Some(minor.as_base_formatter()),
    minor_ticks_provider=Some(() => [4.0, 5.5, 8.0]),
  )
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_y_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
  writer.end_element("svg")
  let svg = writer.to_string()
  assert_eq(svg.split(">secondary-major:1<").count() - 1, 1)
  assert_eq(svg.split(">secondary-major:2<").count() - 1, 1)
  assert_eq(svg.split(">secondary-major:3<").count() - 1, 1)
  assert_eq(svg.split(">secondary-minor:1<").count() - 1, 1)
  assert_eq(svg.split(">secondary offset<").count() - 1, 1)
  assert_eq(callbacks, [
    ("major", 3.0, Some(0)),
    ("major", 5.0, Some(1)),
    ("major", 6.0, Some(2)),
    ("major", 7.0, Some(3)),
    ("major", 9.0, Some(4)),
    ("minor", 4.0, Some(0)),
    ("minor", 5.5, Some(1)),
    ("minor", 8.0, Some(2)),
  ])
  assert_eq(major.as_base_formatter().locations().length(), 5)
  assert_eq(minor.as_base_formatter().locations().length(), 3)
}

///|
test "basic Formatter original secondary fixed live owner alias 0" {
  let values = [5.0, 6.0, 7.0]
  let locator = @ticker.FixedLocator::new(values)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 5.5
    }
    "secondary-alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value * 2.0 + 5.0,
    value => (value - 5.0) / 2.0,
    None,
    6,
    None,
    Some(locator.as_locator()),
    None,
    named_formatter=Some(formatter),
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
  )
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_x_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
  writer.end_element("svg")
  assert_eq(callbacks, [(5.0, Some(0)), (5.5, Some(1)), (7.0, Some(2))])
  assert_eq(values, [5.0, 5.5, 7.0])
  values[0] = 5.25
  assert_eq(formatter.locations().get(0), 5.25)
}

///|
test "basic Formatter original secondary linear live owner alias 1" {
  let values = [5.0, 6.0, 7.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(5.0, 7.0, values)
  let locator = @ticker.LinearLocator::new(presets~)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 5.5
    }
    "secondary-alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value * 2.0 + 5.0,
    value => (value - 5.0) / 2.0,
    None,
    6,
    None,
    Some(locator.as_locator()),
    None,
    named_formatter=Some(formatter),
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
  )
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_x_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
  writer.end_element("svg")
  assert_eq(callbacks, [(5.0, Some(0)), (5.5, Some(1)), (7.0, Some(2))])
  assert_eq(values, [5.0, 5.5, 7.0])
  values[0] = 5.25
  assert_eq(formatter.locations().get(0), 5.25)
}

///|
test "basic Formatter original secondary fixed live owner alias 2" {
  let values = [5.0, 6.0, 7.0]
  let locator = @ticker.FixedLocator::new(values)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 5.5
    }
    "secondary-alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Right,
    value => value * 2.0 + 5.0,
    value => (value - 5.0) / 2.0,
    None,
    6,
    None,
    Some(locator.as_locator()),
    None,
    named_formatter=Some(formatter),
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
  )
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_y_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
  writer.end_element("svg")
  assert_eq(callbacks, [(5.0, Some(0)), (5.5, Some(1)), (7.0, Some(2))])
  assert_eq(values, [5.0, 5.5, 7.0])
  values[0] = 5.25
  assert_eq(formatter.locations().get(0), 5.25)
}

///|
test "basic Formatter original secondary linear live owner alias 3" {
  let values = [5.0, 6.0, 7.0]
  let presets = @ticker.LinearLocatorPresets::new()
  presets.set(5.0, 7.0, values)
  let locator = @ticker.LinearLocator::new(presets~)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    if pos == Some(0) {
      values[1] = 5.5
    }
    "secondary-alias:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Right,
    value => value * 2.0 + 5.0,
    value => (value - 5.0) / 2.0,
    None,
    6,
    None,
    Some(locator.as_locator()),
    None,
    named_formatter=Some(formatter),
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
  )
  let scale : Scale = {
    xmin: 0.0,
    xmax: 1.0,
    ymin: 0.0,
    ymax: 1.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  append_secondary_y_axis(writer, scale, 40.0, 60.0, 400.0, 300.0, [], axis)
  writer.end_element("svg")
  assert_eq(callbacks, [(5.0, Some(0)), (5.5, Some(1)), (7.0, Some(2))])
  assert_eq(values, [5.0, 5.5, 7.0])
  values[0] = 5.25
  assert_eq(formatter.locations().get(0), 5.25)
}

///|
test "basic Formatter original major positions freeze before minor mutates their borrowed owner" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  let values = [0.0, 1.0, 2.0]
  axis.set_locator(@ticker.FixedLocator::new(values).as_locator())
  axis.set_minor_locator(@ticker.FixedLocator::new([0.5]).as_minor_locator())
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "frozen-major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((_, pos) => {
    values[1] = 0.25
    "frozen-minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 1.0))
  assert_eq(bundle.major, [0.0, 1.0, 2.0])
  assert_eq(values, [0.0, 0.25, 2.0])
  assert_eq(major.locations().get(1), 0.25)
}

///|
test "basic Formatter original Multiple minor raw neighbors before visibility 0" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(
    @ticker.MultipleLocator::new(base=0.5).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    "multiple:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 1.0))
  assert_eq(bundle.minor, [-0.5, 0.0, 0.5, 1.0, 1.5])
  assert_eq(callbacks, [
    (-0.5, Some(0)),
    (0.0, Some(1)),
    (0.5, Some(2)),
    (1.0, Some(3)),
    (1.5, Some(4)),
  ])
  assert_eq(bundle.minor_labels, [
    "multiple:0", "multiple:1", "multiple:2", "multiple:3", "multiple:4",
  ])
}

///|
test "basic Formatter original Multiple minor raw neighbors before visibility 1" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  axis.set_minor_locator(
    @ticker.MultipleLocator::new(base=0.5).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  let callbacks : Array[(Double, Int32?)] = []
  let formatter = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push((value, pos))
    "multiple:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  let bundle = numeric_axis_bundle(axis, @core.limits(0.0, 1.0))
  assert_eq(bundle.minor, [-0.5, 0.0, 0.5, 1.0, 1.5])
  assert_eq(callbacks, [
    (-0.5, Some(0)),
    (0.0, Some(1)),
    (0.5, Some(2)),
    (1.0, Some(3)),
    (1.5, Some(4)),
  ])
  assert_eq(bundle.minor_labels, [
    "multiple:0", "multiple:1", "multiple:2", "multiple:3", "multiple:4",
  ])
}

///|
test "basic Formatter original complete 125001 secondary Fixed transport has no formatter cap" {
  let values = Array::makei(125001, index => Double::from_int(index))
  let calls = [0]
  let formatter = @ticker.FuncFormatter::new((_, pos) => {
    calls[0] += 1
    pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let axis = @render.secondary_axis(
    @render.SecondaryLocation::Top,
    value => value * 2.0 + 5.0,
    value => (value - 5.0) / 2.0,
    None,
    6,
    None,
    Some(@ticker.FixedLocator::new(values).as_locator()),
    None,
    named_formatter=Some(formatter),
    minor_locator=Some(@ticker.NullLocator::new().as_minor_locator()),
  )
  let bundle = secondary_axis_bundle(axis, [], 0.0, 1.0)
  assert_eq(bundle.major.length(), 125001)
  assert_eq(calls[0], 125001)
  assert_eq(bundle.major_labels.length(), 125001)
  assert_eq(bundle.major_labels[0], "0")
  assert_eq(bundle.major_labels[99999], "99999")
  assert_eq(bundle.major_labels[100000], "100000")
  assert_eq(bundle.major_labels[125000], "125000")
  values[100000] = -123.0
  assert_eq(formatter.locations().get(100000), -123.0)
}
