///|
fn secondary_transform_scene_fixture() -> (Figure, Axes) raise {
  let fig = figure(width=320, height=240)
  let axes = fig.add_axes(0.2, 0.25, 0.5, 0.5)
  axes.set_x_limits(1.0, 4.0)
  axes.set_y_limits(10.0, 20.0)
  for axis in [axes.x_axis(), axes.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, axes)
}

///|
fn secondary_transform_scene_attribute(
  svg : String,
  label : String,
  attribute : String,
) -> String raise {
  let found : Array[String] = []
  for element in svg.split("<text ") {
    if element.contains(">" + label + "</text>") {
      let (_, attributes) = element.split_once(attribute + "=\"").unwrap()
      let (value, _) = attributes.split_once("\"").unwrap()
      found.push(value.to_owned())
    }
  }
  assert_eq(found.length(), 1)
  found[0]
}

///|
fn secondary_transform_scene_old() -> @transforms.Affine2D {
  @transforms.scaling(2.0, 3.0).translated(15.0, 25.0)
}

///|
// Actual original affine/locator profiles use the same fig320x240 and parent
// [.2,.25,.5,.5]. The supplied transforms operate in display coordinates.
test "retained IR sees earlier callback replace both later children location affines" {
  let (fig, axes) = secondary_transform_scene_fixture()
  let first = axes.secondary_yaxis(value => value, value => value)
  let x = axes.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(secondary_transform_scene_old()),
  )
  let y = axes.secondary_yaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(secondary_transform_scene_old()),
  )
  first.set_ticks([15.0])
  x.set_ticks([2.5])
  y.set_ticks([15.0])
  x.set_named_formatter(
    @ticker.FixedFormatter::new(["later-affine-x"]).as_base_formatter(),
  )
  y.set_named_formatter(
    @ticker.FixedFormatter::new(["later-affine-y"]).as_base_formatter(),
  )
  first.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) {
        let replacement = Some(@transforms.translation(100.0, 200.0))
        x.set_location(
          SecondaryAxisLocation::Position(0.75),
          transform=replacement,
        )
        y.set_location(
          SecondaryAxisLocation::Position(0.75),
          transform=replacement,
        )
      }
      "first-affine"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let (svg, _) = @svg.render_with_positions_checked(retained)
  assert_eq(x.position(), 0.75)
  assert_eq(y.position(), 0.75)
  assert_true(x.alignment() is SecondaryAxisAlignment::Bottom)
  assert_true(y.alignment() is SecondaryAxisAlignment::Left)
  assert_eq(x.drawing_bounds().3, 39.24999999999997)
  assert_eq(y.drawing_bounds().0, 100.75)
  assert_eq(
    secondary_transform_scene_attribute(svg, "later-affine-x", "y"),
    (39.24999999999997 + 18.0).to_string(),
  )
  assert_eq(
    secondary_transform_scene_attribute(svg, "later-affine-y", "x"),
    92.75.to_string(),
  )
}

///|
test "own formatter affine replacement keeps the current rectangle until the next render" {
  for horizontal in [true, false] {
    let (fig, axes) = secondary_transform_scene_fixture()
    let child = if horizontal {
      axes.secondary_xaxis(
        value => value,
        value => value,
        location=SecondaryAxisLocation::Position(0.25),
        transform=Some(secondary_transform_scene_old()),
      )
    } else {
      axes.secondary_yaxis(
        value => value,
        value => value,
        location=SecondaryAxisLocation::Position(0.25),
        transform=Some(secondary_transform_scene_old()),
      )
    }
    child.set_ticks([if horizontal { 2.5 } else { 15.0 }])
    let changed = [false]
    let before : Array[(Double, Double, Double, Double)] = []
    let after : Array[(Double, Double, Double, Double)] = []
    child.set_named_formatter(
      @ticker.FuncFormatter::new((_, position) => {
        if position == Some(0) && !changed[0] {
          before.push(child.drawing_bounds())
          child.set_location(
            SecondaryAxisLocation::Position(0.75),
            transform=Some(@transforms.translation(100.0, 200.0)),
          )
          after.push(child.drawing_bounds())
          changed[0] = true
        }
        "own-affine"
      }).as_base_formatter(),
    )
    let retained = fig.to_render_figure()
    let (first, _) = @svg.render_with_positions_checked(retained)
    assert_eq(before.length(), 1)
    assert_eq(after, before)
    assert_eq(child.position(), 0.75)
    if horizontal {
      assert_eq(before[0].3, 214.25)
      assert_eq(
        secondary_transform_scene_attribute(first, "own-affine", "y"),
        232.25.to_string(),
      )
    } else {
      assert_eq(before[0].0, 15.5)
      assert_eq(
        secondary_transform_scene_attribute(first, "own-affine", "x"),
        7.5.to_string(),
      )
    }
    let (second, _) = @svg.render_with_positions_checked(retained)
    if horizontal {
      assert_eq(child.drawing_bounds().3, 39.24999999999997)
      assert_eq(
        secondary_transform_scene_attribute(second, "own-affine", "y"),
        (39.24999999999997 + 18.0).to_string(),
      )
    } else {
      assert_eq(child.drawing_bounds().0, 100.75)
      assert_eq(
        secondary_transform_scene_attribute(second, "own-affine", "x"),
        92.75.to_string(),
      )
    }
  }
}

///|
test "later affine mutation does not change the earlier finished child drawing context" {
  let (fig, axes) = secondary_transform_scene_fixture()
  let first = axes.secondary_xaxis(
    value => value,
    value => value,
    location=SecondaryAxisLocation::Position(0.25),
    transform=Some(secondary_transform_scene_old()),
  )
  let later = axes.secondary_yaxis(value => value, value => value)
  first.set_ticks([2.5])
  later.set_ticks([15.0])
  first.set_named_formatter(
    @ticker.FixedFormatter::new(["finished-affine"]).as_base_formatter(),
  )
  let changed = [false]
  later.set_named_formatter(
    @ticker.FuncFormatter::new((_, position) => {
      if position == Some(0) && !changed[0] {
        first.set_location(
          SecondaryAxisLocation::Position(0.75),
          transform=Some(@transforms.translation(100.0, 200.0)),
        )
        first.apply_aspect()
        changed[0] = true
      }
      "later-mutation"
    }).as_base_formatter(),
  )
  let retained = fig.to_render_figure()
  let (svg, _) = @svg.render_with_positions_checked(retained)
  assert_true(changed[0])
  assert_eq(first.position(), 0.75)
  assert_eq(first.drawing_bounds().3, 0.0)
  assert_eq(
    secondary_transform_scene_attribute(svg, "finished-affine", "y"),
    232.25.to_string(),
  )
  let (next, _) = @svg.render_with_positions_checked(retained)
  assert_eq(
    secondary_transform_scene_attribute(next, "finished-affine", "y"),
    (39.24999999999997 + 18.0).to_string(),
  )
}

///|
test "failed affine blend preserves the installed rectangle and omitted None clears it later" {
  for horizontal in [true, false] {
    let (fig, axes) = secondary_transform_scene_fixture()
    let child = if horizontal {
      axes.secondary_xaxis(
        value => value,
        value => value,
        location=SecondaryAxisLocation::Position(0.25),
        transform=Some(secondary_transform_scene_old()),
      )
    } else {
      axes.secondary_yaxis(
        value => value,
        value => value,
        location=SecondaryAxisLocation::Position(0.25),
        transform=Some(secondary_transform_scene_old()),
      )
    }
    child.set_ticks([if horizontal { 2.5 } else { 15.0 }])
    child.set_named_formatter(
      @ticker.FixedFormatter::new(["preserved-affine"]).as_base_formatter(),
    )
    // The unused output row is nonseparable too: the source checks the whole
    // affine, not only the y row for x children or the x row for y children.
    let invalid = if horizontal {
      @transforms.affine_from_values(1.0, 0.0, 1.0, 1.0, 0.0, 0.0)
    } else {
      @transforms.affine_from_values(1.0, 1.0, 0.0, 1.0, 0.0, 0.0)
    }
    try
      child.set_location(
        SecondaryAxisLocation::Position(0.75),
        transform=Some(invalid),
      )
    catch {
      @core.DataError::InvalidTicks(message~) =>
        assert_eq(
          message, "ValueError: Both *x_transform* and *y_transform* must be 2D affine transforms",
        )
      _ => fail("expected source affine blend error")
    } noraise {
      _ => fail("expected source affine blend error")
    }
    assert_eq(child.position(), 0.75)
    let svg = fig.to_svg_checked()
    if horizontal {
      assert_eq(child.drawing_bounds().3, 214.25)
      assert_eq(
        secondary_transform_scene_attribute(svg, "preserved-affine", "y"),
        232.25.to_string(),
      )
      child.set_location(SecondaryAxisLocation::Position(0.75))
    } else {
      assert_eq(child.drawing_bounds().0, 15.5)
      assert_eq(
        secondary_transform_scene_attribute(svg, "preserved-affine", "x"),
        7.5.to_string(),
      )
      child.set_location(SecondaryAxisLocation::Position(0.75), transform=None)
    }
    let cleared = fig.to_svg_checked()
    if horizontal {
      assert_eq(child.drawing_bounds().3, 90.0)
      assert_eq(
        secondary_transform_scene_attribute(cleared, "preserved-affine", "y"),
        108.0.to_string(),
      )
    } else {
      assert_eq(child.drawing_bounds().0, 184.0)
      assert_eq(
        secondary_transform_scene_attribute(cleared, "preserved-affine", "x"),
        176.0.to_string(),
      )
    }
  }
}

///|
test "Figure forwards valid negative and zero affine scales for both orientations" {
  let (fig, _) = secondary_transform_scene_fixture()
  let negative = @transforms.scaling(-2.0, -3.0).translated(15.0, 25.0)
  let zero = @transforms.scaling(0.0, 0.0).translated(15.0, 25.0)
  let children : Array[SecondaryAxis] = []
  for transform in [negative, zero] {
    let x = fig.secondary_xaxis(
      value => value,
      value => value,
      location=SecondaryAxisLocation::Position(0.25),
      transform=Some(transform),
    )
    let y = fig.secondary_yaxis(
      value => value,
      value => value,
      location=SecondaryAxisLocation::Position(0.25),
      transform=Some(transform),
    )
    x.set_ticks([2.5])
    y.set_ticks([15.0])
    children.push(x)
    children.push(y)
  }
  for index, child in children {
    child.set_named_formatter(
      @ticker.FixedFormatter::new(["signed-affine-\{index}"]).as_base_formatter(),
    )
  }
  let svg = fig.to_svg_checked()
  assert_eq(children[0].drawing_bounds().3, 215.7500000003)
  assert_eq(children[1].drawing_bounds().0, 14.4999999998)
  assert_eq(children[2].drawing_bounds().3, 215.0)
  assert_eq(children[3].drawing_bounds().0, 15.0)
  for index in 0..<children.length() {
    assert_eq(svg.split(">signed-affine-\{index}</text>").count() - 1, 1)
  }
}
