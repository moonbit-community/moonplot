// Original Formatter installation warning, live Axis identity and complete raw batch state.

///|
test "basic Formatter original installation warning 0" {
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  let formatter = @ticker.FixedFormatter::new([]).as_base_formatter()
  axis.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 1" {
  let axis = @axis.axis()
  axis.set_locator(@ticker.fixed_locator([-1.0, 0.0, 1.0, 2.0]))
  let formatter = @ticker.FixedFormatter::new([]).as_base_formatter()
  axis.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 2" {
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(4)).as_locator(),
  )
  let formatter = @ticker.FixedFormatter::new([]).as_base_formatter()
  axis.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 3" {
  let axis = @axis.axis()
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  let formatter = @ticker.FixedFormatter::new([]).as_base_formatter()
  axis.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 4" {
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_locator(),
  )
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  axis.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 5" {
  let axis = @axis.axis()
  axis.set_locator(@ticker.fixed_locator([-1.0, 0.0, 1.0, 2.0]))
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  axis.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 6" {
  let axis = @axis.axis()
  axis.set_locator(
    @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(4)).as_locator(),
  )
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  axis.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 7" {
  let axis = @axis.axis()
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  axis.set_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_named_formatter(@ticker.NullFormatter::new().as_base_formatter())
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 8" {
  let axis = @axis.axis()
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_minor_locator(),
  )
  let formatter = @ticker.FixedFormatter::new([]).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.minor_named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 9" {
  let axis = @axis.axis()
  axis.set_minor_locator(@ticker.fixed_minor_locator([-1.0, 0.0, 1.0, 2.0]))
  let formatter = @ticker.FixedFormatter::new([]).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.minor_named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 10" {
  let axis = @axis.axis()
  axis.set_minor_locator(
    @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(4)).as_minor_locator(),
  )
  let formatter = @ticker.FixedFormatter::new([]).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.minor_named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 11" {
  let axis = @axis.axis()
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let formatter = @ticker.FixedFormatter::new([]).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.minor_named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 12" {
  let axis = @axis.axis()
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 1.0, 2.0]).as_minor_locator(),
  )
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.minor_named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 13" {
  let axis = @axis.axis()
  axis.set_minor_locator(@ticker.fixed_minor_locator([-1.0, 0.0, 1.0, 2.0]))
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.formatter_warnings(), [])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.minor_named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 14" {
  let axis = @axis.axis()
  axis.set_minor_locator(
    @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Count(4)).as_minor_locator(),
  )
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.minor_named_formatter() is Some(_))
}

///|
test "basic Formatter original installation warning 15" {
  let axis = @axis.axis()
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  let formatter = @ticker.FixedFormatter::new(["A", "B"]).as_base_formatter()
  axis.set_minor_named_formatter(formatter)
  assert_eq(formatter.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.formatter_warnings(), [
    "FixedFormatter should only be used together with FixedLocator",
  ])
  axis.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  assert_eq(axis.formatter_warnings(), [])
  assert_true(axis.minor_named_formatter() is Some(_))
}

///|
test "basic Formatter original supplied Axis batch and retained locations 0" {
  let axis = @axis.axis()
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((_, pos) => {
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_eq(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]), [
    "major:0", "major:1", "major:2", "major:3",
  ])
  assert_eq(axis.minor_tick_labels_checked([-2.0, 0.5, 3.0]), [
    "minor:0", "minor:1", "minor:2",
  ])
  assert_eq(major.locations().length(), 4)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [-1.0, 0.0, 1.0, 2.0][index])
  }
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original supplied Axis batch and retained locations 1" {
  let axis = @axis.axis()
  let major = @ticker.FixedFormatter::new([
    "major:0", "major:1", "major:2", "major:3", "major:4",
  ]).as_base_formatter()
  let minor = @ticker.FixedFormatter::new([
    "minor:0", "minor:1", "minor:2", "minor:3", "minor:4",
  ]).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_eq(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]), [
    "major:0", "major:1", "major:2", "major:3",
  ])
  assert_eq(axis.minor_tick_labels_checked([-2.0, 0.5, 3.0]), [
    "minor:0", "minor:1", "minor:2",
  ])
  assert_eq(major.locations().length(), 4)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [-1.0, 0.0, 1.0, 2.0][index])
  }
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original supplied Axis batch and retained locations 2" {
  let axis = @axis.axis()
  let major = @ticker.NullFormatter::new().as_base_formatter()
  let minor = @ticker.FuncFormatter::new((_, pos) => {
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_eq(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]), ["", "", "", ""])
  assert_eq(axis.minor_tick_labels_checked([-2.0, 0.5, 3.0]), [
    "minor:0", "minor:1", "minor:2",
  ])
  assert_eq(major.locations().length(), 4)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [-1.0, 0.0, 1.0, 2.0][index])
  }
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original supplied Axis batch and retained locations 3" {
  let axis = @axis.axis()
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.NullFormatter::new().as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_eq(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]), [
    "major:0", "major:1", "major:2", "major:3",
  ])
  assert_eq(axis.minor_tick_labels_checked([-2.0, 0.5, 3.0]), ["", "", ""])
  assert_eq(major.locations().length(), 4)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [-1.0, 0.0, 1.0, 2.0][index])
  }
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original supplied Axis batch and retained locations 4" {
  let axis = @axis.axis()
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((_, pos) => {
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  axis.set_locator(@ticker.NullLocator::new().as_locator())
  assert_eq(axis.minor_tick_labels_checked([-2.0, 0.5, 1.0, 3.0]), [
    "minor:0", "minor:1", "minor:2", "minor:3",
  ])
  assert_eq(major.locations().length(), 0)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [][index])
  }
  assert_eq(minor.locations().length(), 4)
}

///|
test "basic Formatter original supplied Axis batch and retained locations 5" {
  let axis = @axis.axis()
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.FuncFormatter::new((_, pos) => {
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  assert_eq(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]), [
    "major:0", "major:1", "major:2", "major:3",
  ])
  assert_eq(major.locations().length(), 4)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [-1.0, 0.0, 1.0, 2.0][index])
  }
  assert_eq(minor.locations().length(), 0)
}

///|
test "basic Formatter original supplied Axis batch and retained locations 6" {
  let axis = @axis.axis()
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "shared:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = major
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_eq(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]), [
    "shared:0", "shared:1", "shared:2", "shared:3",
  ])
  assert_eq(axis.minor_tick_labels_checked([-2.0, 0.5, 3.0]), [
    "shared:0", "shared:1", "shared:2",
  ])
  assert_eq(major.locations().length(), 3)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [-2.0, 0.5, 3.0][index])
  }
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original supplied Axis batch and retained locations 7" {
  let axis = @axis.axis()
  let major = @ticker.BaseFormatter::new()
  let minor = @ticker.FuncFormatter::new((_, pos) => {
    "minor:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [-1.0, 0.0, 1.0, 2.0][index])
  }
  assert_eq(minor.locations().length(), 0)
}

///|
test "basic Formatter original supplied Axis batch and retained locations 8" {
  let axis = @axis.axis()
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "major:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  let minor = @ticker.BaseFormatter::new()
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_eq(axis.tick_labels_checked([-1.0, 0.0, 1.0, 2.0]), [
    "major:0", "major:1", "major:2", "major:3",
  ])
  assert_true(
    try {
      ignore(axis.minor_tick_labels_checked([-2.0, 0.5, 3.0]))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "Derived must override"
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  for index in 0..<major.locations().length() {
    assert_eq(major.locations().get(index), [-1.0, 0.0, 1.0, 2.0][index])
  }
  assert_eq(minor.locations().length(), 3)
}

///|
test "basic Formatter original shared last owner removal and independent copy x" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_x=true)
  let major = @ticker.NullFormatter::new().as_base_formatter()
  let minor = @ticker.NullFormatter::new().as_base_formatter()
  axes[0].set_x_named_formatter(major)
  axes[0].set_x_minor_named_formatter(minor)
  let initial = major.copy()
  axes[1].set_x_named_formatter(major)
  axes[1].set_x_minor_named_formatter(minor)
  assert_eq(major.axis(), Some(axes[1].x_axis().formatter_axis_binding()))
  assert_eq(minor.axis(), Some(axes[1].x_axis().formatter_axis_binding()))
  assert_eq(initial.axis(), Some(axes[0].x_axis().formatter_axis_binding()))
  let external_major = major.copy()
  let external_minor = minor.copy()
  let removed_binding = axes[1].x_axis().formatter_axis_binding()
  axes[1].remove()
  assert_eq(major.axis(), Some(axes[0].x_axis().formatter_axis_binding()))
  assert_eq(minor.axis(), Some(axes[0].x_axis().formatter_axis_binding()))
  assert_eq(external_major.axis(), Some(removed_binding))
  assert_eq(external_minor.axis(), Some(removed_binding))
}

///|
test "basic Formatter original shared last owner removal and independent copy y" {
  let figure = @scene.figure()
  let axes = figure.subplots(1, 2, share_y=true)
  let major = @ticker.NullFormatter::new().as_base_formatter()
  let minor = @ticker.NullFormatter::new().as_base_formatter()
  axes[0].set_y_named_formatter(major)
  axes[0].set_y_minor_named_formatter(minor)
  let initial = major.copy()
  axes[1].set_y_named_formatter(major)
  axes[1].set_y_minor_named_formatter(minor)
  assert_eq(major.axis(), Some(axes[1].y_axis().formatter_axis_binding()))
  assert_eq(minor.axis(), Some(axes[1].y_axis().formatter_axis_binding()))
  assert_eq(initial.axis(), Some(axes[0].y_axis().formatter_axis_binding()))
  let external_major = major.copy()
  let external_minor = minor.copy()
  let removed_binding = axes[1].y_axis().formatter_axis_binding()
  axes[1].remove()
  assert_eq(major.axis(), Some(axes[0].y_axis().formatter_axis_binding()))
  assert_eq(minor.axis(), Some(axes[0].y_axis().formatter_axis_binding()))
  assert_eq(external_major.axis(), Some(removed_binding))
  assert_eq(external_minor.axis(), Some(removed_binding))
}

///|
test "basic Formatter original secondary own coordinates batch identity 0" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "secondary-major:" + pos.unwrap_or(-1).to_string()
  })
  let minor = @ticker.FuncFormatter::new((_, pos) => {
    "secondary-minor:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("secondary offset")
  secondary.set_named_formatter(major.as_base_formatter())
  secondary.set_minor_named_formatter(minor.as_base_formatter())
  assert_eq(
    major.as_base_formatter().axis(),
    Some(secondary.formatter_axis_binding()),
  )
  assert_eq(
    minor.as_base_formatter().axis(),
    Some(secondary.formatter_axis_binding()),
  )
  assert_eq(secondary.tick_labels_checked([3.0, 5.0, 6.0, 7.0, 9.0]), [
    "secondary-major:0", "secondary-major:1", "secondary-major:2", "secondary-major:3",
    "secondary-major:4",
  ])
  assert_eq(secondary.minor_tick_labels_checked([4.0, 5.5, 8.0]), [
    "secondary-minor:0", "secondary-minor:1", "secondary-minor:2",
  ])
}

///|
test "basic Formatter original secondary own coordinates batch identity 1" {
  let figure = @scene.figure()
  let axes = figure.axes()
  axes.set_y_limits(0.0, 1.0)
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FuncFormatter::new((_, pos) => {
    "secondary-major:" + pos.unwrap_or(-1).to_string()
  })
  let minor = @ticker.FuncFormatter::new((_, pos) => {
    "secondary-minor:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("secondary offset")
  secondary.set_named_formatter(major.as_base_formatter())
  secondary.set_minor_named_formatter(minor.as_base_formatter())
  assert_eq(
    major.as_base_formatter().axis(),
    Some(secondary.formatter_axis_binding()),
  )
  assert_eq(
    minor.as_base_formatter().axis(),
    Some(secondary.formatter_axis_binding()),
  )
  assert_eq(secondary.tick_labels_checked([3.0, 5.0, 6.0, 7.0, 9.0]), [
    "secondary-major:0", "secondary-major:1", "secondary-major:2", "secondary-major:3",
    "secondary-major:4",
  ])
  assert_eq(secondary.minor_tick_labels_checked([4.0, 5.5, 8.0]), [
    "secondary-minor:0", "secondary-minor:1", "secondary-minor:2",
  ])
}

///|
test "basic Formatter original secondary live slot mutation 0: enable_minor" {
  let figure = @scene.figure(width=320, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.FixedLocator::new([5.0, 6.0, 7.0]).as_locator())
  let callbacks : Array[(String, Double, Int32?)] = []
  let replacement = @ticker.FixedFormatter::new([
    "replacement0", "replacement1", "replacement2",
  ])
  replacement.set_offset_string("replacement offset")
  let new_minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("new-minor", value, pos))
    "new-minor:" + pos.unwrap_or(-1).to_string()
  })
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    if pos == Some(0) {
      secondary.set_minor_locator(
        @ticker.FixedLocator::new([5.5, 6.5]).as_minor_locator(),
      )
      secondary.set_minor_named_formatter(new_minor.as_base_formatter())
    }
    "major:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("initial offset")
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(callbacks, [
    ("major", 5.0, Some(0)),
    ("major", 6.0, Some(1)),
    ("major", 7.0, Some(2)),
    ("new-minor", 5.5, Some(0)),
    ("new-minor", 6.5, Some(1)),
  ])
  assert_eq(svg.split(">major:0<").count() - 1, 1)
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_eq(svg.split(">new-minor:0<").count() - 1, 1)
  assert_eq(svg.split(">new-minor:1<").count() - 1, 1)
  assert_eq(svg.split(">initial offset<").count() - 1, 1)
  assert_true(!svg.contains(">replacement0<"))
  assert_eq(replacement.as_base_formatter().locations().length(), 0)
}

///|
test "basic Formatter original secondary live slot mutation 1: disable_minor" {
  let figure = @scene.figure(width=320, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.FixedLocator::new([5.0, 6.0, 7.0]).as_locator())
  let callbacks : Array[(String, Double, Int32?)] = []
  let replacement = @ticker.FixedFormatter::new([
    "replacement0", "replacement1", "replacement2",
  ])
  replacement.set_offset_string("replacement offset")
  let old_minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("old-minor", value, pos))
    "old-minor:" + pos.unwrap_or(-1).to_string()
  })
  secondary.set_minor_locator(
    @ticker.FixedLocator::new([5.5, 6.5]).as_minor_locator(),
  )
  secondary.set_minor_named_formatter(old_minor.as_base_formatter())
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    if pos == Some(0) {
      secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
      secondary.set_minor_named_formatter(
        @ticker.NullFormatter::new().as_base_formatter(),
      )
    }
    "major:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("initial offset")
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(callbacks, [
    ("major", 5.0, Some(0)),
    ("major", 6.0, Some(1)),
    ("major", 7.0, Some(2)),
  ])
  assert_eq(svg.split(">major:0<").count() - 1, 1)
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_eq(svg.split(">initial offset<").count() - 1, 1)
  assert_true(!svg.contains(">replacement0<"))
  assert_eq(replacement.as_base_formatter().locations().length(), 0)
}

///|
test "basic Formatter original secondary live slot mutation 2: replace_major" {
  let figure = @scene.figure(width=320, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let secondary = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.FixedLocator::new([5.0, 6.0, 7.0]).as_locator())
  let callbacks : Array[(String, Double, Int32?)] = []
  let replacement = @ticker.FixedFormatter::new([
    "replacement0", "replacement1", "replacement2",
  ])
  replacement.set_offset_string("replacement offset")
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    if pos == Some(0) {
      secondary.set_named_formatter(replacement.as_base_formatter())
    }
    "major:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("initial offset")
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(callbacks, [
    ("major", 5.0, Some(0)),
    ("major", 6.0, Some(1)),
    ("major", 7.0, Some(2)),
  ])
  assert_eq(svg.split(">major:0<").count() - 1, 1)
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_eq(svg.split(">replacement offset<").count() - 1, 1)
  assert_true(!svg.contains(">replacement0<"))
  assert_eq(replacement.as_base_formatter().locations().length(), 0)
}

///|
test "basic Formatter original secondary live slot mutation 3: enable_minor" {
  let figure = @scene.figure(width=320, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.FixedLocator::new([5.0, 6.0, 7.0]).as_locator())
  let callbacks : Array[(String, Double, Int32?)] = []
  let replacement = @ticker.FixedFormatter::new([
    "replacement0", "replacement1", "replacement2",
  ])
  replacement.set_offset_string("replacement offset")
  let new_minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("new-minor", value, pos))
    "new-minor:" + pos.unwrap_or(-1).to_string()
  })
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    if pos == Some(0) {
      secondary.set_minor_locator(
        @ticker.FixedLocator::new([5.5, 6.5]).as_minor_locator(),
      )
      secondary.set_minor_named_formatter(new_minor.as_base_formatter())
    }
    "major:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("initial offset")
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(callbacks, [
    ("major", 5.0, Some(0)),
    ("major", 6.0, Some(1)),
    ("major", 7.0, Some(2)),
    ("new-minor", 5.5, Some(0)),
    ("new-minor", 6.5, Some(1)),
  ])
  assert_eq(svg.split(">major:0<").count() - 1, 1)
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_eq(svg.split(">new-minor:0<").count() - 1, 1)
  assert_eq(svg.split(">new-minor:1<").count() - 1, 1)
  assert_eq(svg.split(">initial offset<").count() - 1, 1)
  assert_true(!svg.contains(">replacement0<"))
  assert_eq(replacement.as_base_formatter().locations().length(), 0)
}

///|
test "basic Formatter original secondary live slot mutation 4: disable_minor" {
  let figure = @scene.figure(width=320, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.FixedLocator::new([5.0, 6.0, 7.0]).as_locator())
  let callbacks : Array[(String, Double, Int32?)] = []
  let replacement = @ticker.FixedFormatter::new([
    "replacement0", "replacement1", "replacement2",
  ])
  replacement.set_offset_string("replacement offset")
  let old_minor = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("old-minor", value, pos))
    "old-minor:" + pos.unwrap_or(-1).to_string()
  })
  secondary.set_minor_locator(
    @ticker.FixedLocator::new([5.5, 6.5]).as_minor_locator(),
  )
  secondary.set_minor_named_formatter(old_minor.as_base_formatter())
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    if pos == Some(0) {
      secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
      secondary.set_minor_named_formatter(
        @ticker.NullFormatter::new().as_base_formatter(),
      )
    }
    "major:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("initial offset")
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(callbacks, [
    ("major", 5.0, Some(0)),
    ("major", 6.0, Some(1)),
    ("major", 7.0, Some(2)),
  ])
  assert_eq(svg.split(">major:0<").count() - 1, 1)
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_eq(svg.split(">initial offset<").count() - 1, 1)
  assert_true(!svg.contains(">replacement0<"))
  assert_eq(replacement.as_base_formatter().locations().length(), 0)
}

///|
test "basic Formatter original secondary live slot mutation 5: replace_major" {
  let figure = @scene.figure(width=320, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let secondary = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  secondary.set_locator(@ticker.FixedLocator::new([5.0, 6.0, 7.0]).as_locator())
  let callbacks : Array[(String, Double, Int32?)] = []
  let replacement = @ticker.FixedFormatter::new([
    "replacement0", "replacement1", "replacement2",
  ])
  replacement.set_offset_string("replacement offset")
  secondary.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  secondary.set_minor_named_formatter(
    @ticker.NullFormatter::new().as_base_formatter(),
  )
  let major = @ticker.FuncFormatter::new((value, pos) => {
    callbacks.push(("major", value, pos))
    if pos == Some(0) {
      secondary.set_named_formatter(replacement.as_base_formatter())
    }
    "major:" + pos.unwrap_or(-1).to_string()
  })
  major.set_offset_string("initial offset")
  secondary.set_named_formatter(major.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(callbacks, [
    ("major", 5.0, Some(0)),
    ("major", 6.0, Some(1)),
    ("major", 7.0, Some(2)),
  ])
  assert_eq(svg.split(">major:0<").count() - 1, 1)
  assert_eq(svg.split(">major:1<").count() - 1, 1)
  assert_eq(svg.split(">major:2<").count() - 1, 1)
  assert_eq(svg.split(">replacement offset<").count() - 1, 1)
  assert_true(!svg.contains(">replacement0<"))
  assert_eq(replacement.as_base_formatter().locations().length(), 0)
}

///|
test "basic Formatter original complete 125001 primary Fixed transport has no formatter cap" {
  let axis = @axis.axis()
  axis.set_limits(0.0, 1.0)
  let values = Array::makei(125001, index => Double::from_int(index))
  axis.set_locator(@ticker.FixedLocator::new(values).as_locator())
  let calls = [0]
  let formatter = @ticker.FuncFormatter::new((_, pos) => {
    calls[0] += 1
    pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  axis.set_named_formatter(formatter)
  let locations = axis.formatter_tick_locations_checked(@core.limits(0.0, 1.0))
  assert_eq(locations.length(), 125001)
  let labels = match locations {
    @ticker.FormatterLocations::NdArray(view) =>
      formatter.format_ticks_view(view)
    _ => fail("expected retained ndarray transport")
  }
  assert_eq(calls[0], 125001)
  assert_eq(labels.length(), 125001)
  assert_eq(labels[0], "0")
  assert_eq(labels[99999], "99999")
  assert_eq(labels[100000], "100000")
  assert_eq(labels[125000], "125000")
  values[100000] = -123.0
  assert_eq(formatter.locations().get(100000), -123.0)
}
