///|
fn interactive_box_axes(
  horizontal~ : Bool = false,
  inverted~ : Bool = false,
) -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  let lo = if inverted { 25.0 } else { 0.0 }
  let hi = if inverted { 0.0 } else { 25.0 }
  if horizontal {
    ax.set_x_limits(lo, hi)
    ax.set_y_limits(0.0, 3.0)
  } else {
    ax.set_x_limits(0.0, 3.0)
    ax.set_y_limits(lo, hi)
  }
  (fig, ax)
}

///|
fn find_box_target(
  frame : @drawing.Drawing,
  part : @drawing.BoxPart,
  group~ : Int32 = 0,
  artist~ : Int32 = 0,
) -> @drawing.HitTarget raise {
  for target in frame.targets() {
    if target.info.box is Some(box) &&
      box.part == part &&
      box.group_index == group &&
      target.info.point.artist_index == artist {
      return target
    }
  }
  fail("missing boxplot part")
}

///|
test "boxplot bodies whiskers caps and outliers expose original statistics in both orientations and directions" {
  for horizontal in [false, true] {
    for inverted in [false, true] {
      let (fig, ax) = interactive_box_axes(horizontal~, inverted~)
      let stats = ax.boxplot(
        [[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]],
        horizontal~,
        label="Distribution",
      )
      ax.legend([])
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      for
        part in [
          @drawing.BoxPart::Box,
          LowerWhisker,
          UpperWhisker,
          LowerCap,
          UpperCap,
          Outlier(20.0),
        ] {
        let target = find_box_target(frame, part)
        let box = target.info.box.unwrap()
        assert_eq(
          (box.q1, box.median, box.q3, box.lower_whisker, box.upper_whisker),
          (
            stats[0].q1(),
            stats[0].median(),
            stats[0].q3(),
            stats[0].lower_whisker(),
            stats[0].upper_whisker(),
          ),
        )
        assert_eq((box.group_index, target.info.point.point_index), (0, 0))
        assert_eq(target.info.series, "Distribution")
        assert_eq(target.info.kind, @drawing.HitKind::BoxPlot)
        let hit = frame
          .hit_test(
            target.info.point.screen_x,
            target.info.point.screen_y,
            radius=0.0,
          )
          .unwrap()
        let actual = frame.hit_info(hit).unwrap()
        assert_eq(actual.box.unwrap().part, part)
        assert_eq(actual.box.unwrap().group_index, 0)
        if part is @drawing.BoxPart::Outlier(value) {
          assert_eq((actual.value, value), (20.0, 20.0))
        }
      }
    }
  }
}

///|
test "constant boxes retain a real median segment without degenerate rectangle or whisker hits" {
  for horizontal in [false, true] {
    let (fig, ax) = interactive_box_axes(horizontal~)
    ignore(ax.boxplot([[2.0, 2.0, 2.0, 2.0]], horizontal~))
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 3)
    for target in frame.targets() {
      assert_true(target.shape is @drawing.HitShape::Segment(_, _, _, _))
      let box = target.info.box.unwrap()
      assert_eq(
        (box.q1, box.median, box.q3, box.lower_whisker, box.upper_whisker),
        (2.0, 2.0, 2.0, 2.0, 2.0),
      )
      assert_eq(frame.hit_info(target.info.point).unwrap().box, Some(box))
    }
    let median = find_box_target(frame, @drawing.BoxPart::Box)
    assert_eq(
      frame.hit_test(
        median.info.point.screen_x,
        median.info.point.screen_y,
        radius=0.0,
      ),
      Some(median.info.point),
    )
    assert_eq(frame.hit_test(300.0, 100.0, radius=0.0), None)
  }
}

///|
test "scale-filtered box groups retain their original group index and checked drawn components" {
  let (fig, ax) = interactive_box_axes()
  ignore(
    ax.boxplot(
      [[-5.0, -4.0, -3.0], [1.0, 2.0, 3.0, 4.0, 5.0, 20.0]],
      label="Log groups",
    ),
  )
  ax.set_y_scale(@scale.log_scale())
  ax.set_y_limits(0.1, 100.0)
  ax.legend([])
  let frame = fig.to_drawing()
  assert_true(!frame.targets().is_empty())
  for target in frame.targets() {
    assert_eq(target.info.point.point_index, 1)
    assert_eq(target.info.box.unwrap().group_index, 1)
    assert_eq(target.info.series, "Log groups")
  }
  assert_eq(frame.svg(), fig.to_svg_checked())
  let invalid_category = figure(width=400, height=200)
  let category_axes = invalid_category.add_axes(0.0, 0.0, 1.0, 1.0)
  ignore(category_axes.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]]))
  category_axes.set_x_scale(@scale.logit_scale())
  category_axes.set_x_limits(0.1, 0.9)
  category_axes.set_y_limits(0.0, 25.0)
  assert_eq(invalid_category.to_drawing().targets(), [])
}

///|
test "boxplot captures only visible box areas segments and outlier centers after real clipping" {
  let (fig, ax) = interactive_box_axes()
  ignore(ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]]))
  ax.set_y_limits(2.5, 4.25)
  let clipped = fig.to_drawing()
  assert_eq(clipped.targets().length(), 2)
  for target in clipped.targets() {
    assert_eq(target.info.box.unwrap().part, @drawing.BoxPart::Box)
  }
  assert_eq(
    clipped.hit_info(clipped.hit_test(133.0, 0.0, radius=0.0).unwrap()).unwrap().box.unwrap().median,
    3.5,
  )
  assert_eq(
    clipped
    .hit_info(clipped.hit_test(133.0, 200.0, radius=0.0).unwrap())
    .unwrap().box.unwrap().q1,
    2.25,
  )
  ax.set_y_limits(0.0, 2.0)
  let whisker = fig.to_drawing()
  assert_eq(whisker.targets().length(), 2)
  assert_eq(whisker.targets().map(t => t.info.box.unwrap().part), [
    @drawing.BoxPart::LowerWhisker,
    LowerCap,
  ])
  let target = find_box_target(whisker, @drawing.BoxPart::LowerWhisker)
  assert_eq(
    whisker.hit_test(target.info.point.screen_x, 1.0, radius=0.0),
    Some(target.info.point),
  )
  assert_eq(
    whisker.hit_test(target.info.point.screen_x, -0.1, radius=100.0),
    None,
  )
  ax.set_x_limits(2.0, 3.0)
  let outside = fig.to_drawing()
  assert_eq(outside.targets(), [])
  assert_eq(outside.hit_test(200.0, 100.0, radius=1000.0), None)
}

///|
test "boxplot segment and outlier proximity stay in CSS pixels with letterbox exclusion" {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 40.0)
  ignore(ax.boxplot([[0.0, 10.0, 20.0, 30.0, 40.0]]))
  let frame = fig.to_drawing()
  let whisker = find_box_target(frame, @drawing.BoxPart::LowerWhisker).info.point
  assert_eq((whisker.screen_x, whisker.screen_y), (200.0, 175.0))
  assert_eq(
    frame.hit_test_client(409.0, 350.0, 0.0, 0.0, 800.0, 400.0),
    Some(whisker),
  )
  assert_eq(frame.hit_test_client(411.0, 350.0, 0.0, 0.0, 800.0, 400.0), None)
  assert_eq(
    frame.hit_test_client(109.0, 87.5, 0.0, 0.0, 200.0, 100.0),
    Some(whisker),
  )
  assert_eq(frame.hit_test_client(111.0, 87.5, 0.0, 0.0, 200.0, 100.0), None)
  assert_eq(frame.hit_test_client(400.0, 199.0, 0.0, 0.0, 800.0, 800.0), None)
  ax.clear()
  ignore(ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]]))
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 25.0)
  let fliers = fig.to_drawing()
  let outlier = find_box_target(fliers, @drawing.BoxPart::Outlier(20.0)).info.point
  assert_eq(
    fliers.hit_test_client(
      outlier.screen_x * 2.0 + 9.0,
      outlier.screen_y * 2.0,
      0.0,
      0.0,
      800.0,
      400.0,
    ),
    Some(outlier),
  )
  assert_eq(
    fliers.hit_test_client(
      outlier.screen_x * 2.0 + 11.0,
      outlier.screen_y * 2.0,
      0.0,
      0.0,
      800.0,
      400.0,
    ),
    None,
  )
}

///|
test "boxplot identity uses the source artist rather than color and old frames survive rebuilds" {
  let (fig, ax) = interactive_box_axes()
  let input = [1.0, 2.0, 3.0, 4.0, 5.0, 20.0]
  let stats = ax.boxplot([input], color="red", label="First")
  ignore(
    ax.boxplot([[6.0, 7.0, 8.0, 9.0, 10.0, 30.0]], color="red", label="Second"),
  )
  ax.legend([])
  ax.set_y_limits(0.0, 35.0)
  let old = fig.to_drawing()
  assert_eq(
    find_box_target(old, @drawing.BoxPart::Outlier(20.0)).info.series,
    "First",
  )
  assert_eq(
    find_box_target(old, @drawing.BoxPart::Outlier(30.0), artist=1).info.series,
    "Second",
  )
  input.clear()
  stats[0].fliers().clear()
  stats.clear()
  assert_eq(
    find_box_target(fig.to_drawing(), @drawing.BoxPart::Outlier(20.0)).info.value,
    20.0,
  )
  ax.clear()
  ignore(ax.boxplot([[10.0, 10.0, 10.0]], label="Current"))
  let current = fig.to_drawing()
  assert_eq(
    find_box_target(current, @drawing.BoxPart::Box).info.box.unwrap().median,
    10.0,
  )
  assert_eq(
    find_box_target(current, @drawing.BoxPart::Box).info.series,
    "Current",
  )
  assert_eq(
    find_box_target(old, @drawing.BoxPart::Box).info.box.unwrap().median,
    3.5,
  )
  assert_eq(
    find_box_target(old, @drawing.BoxPart::Outlier(20.0)).info.value,
    20.0,
  )
}

///|
test "boxplot multiple panels and low high outliers keep independent source group indices" {
  let fig = figure(width=600, height=300)
  let axes = fig.subplots(1, 2)
  ignore(
    axes[0].boxplot(
      [[0.0, 0.0, 0.0], [-100.0, 1.0, 2.0, 3.0, 4.0, 5.0, 100.0]],
      label="Left",
    ),
  )
  ignore(axes[1].boxplot([[2.0, 3.0, 4.0]], horizontal=true, label="Right"))
  for ax in axes {
    ax.legend([])
  }
  let frame = fig.to_drawing()
  let high = find_box_target(frame, @drawing.BoxPart::Outlier(100.0), group=1)
  let low = find_box_target(frame, @drawing.BoxPart::Outlier(-100.0), group=1)
  for target in [high, low] {
    assert_eq(
      (target.info.point.panel_index, target.info.point.point_index),
      (0, 1),
    )
    assert_eq(
      frame.hit_test(
        target.info.point.screen_x,
        target.info.point.screen_y,
        radius=0.0,
      ),
      Some(target.info.point),
    )
  }
  for target in frame.targets() {
    if target.info.point.panel_index == 1 {
      assert_eq(target.info.series, "Right")
      assert_eq(target.info.box.unwrap().group_index, 0)
    }
  }
}

///|
test "embedded SVG legend occludes box regions at intrinsic and CSS coordinates" {
  let (fig, ax) = interactive_box_axes()
  ignore(ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]], label="Covered"))
  ax.set_x_limits(0.0, 1.2)
  ax.set_y_limits(0.0, 5.0)
  ax.legend([])
  let plain = fig.to_drawing()
  assert_true(plain.hit_test(300.0, 24.0, radius=0.0) is Some(_))
  ax.clear_legend()
  let covered = fig.to_drawing()
  assert_eq(covered.hit_test(300.0, 24.0, radius=0.0), None)
  assert_eq(
    covered.hit_test_client(600.0, 48.0, 0.0, 0.0, 800.0, 400.0, radius=0.0),
    None,
  )
  assert_eq(covered.svg(), fig.to_svg_checked())
}
