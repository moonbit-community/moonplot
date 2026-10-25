///|
fn ordinary_logit_bar_axes(
  horizontal : Bool,
  inverted : Bool,
  clipped : Bool,
) -> (Figure, Axes, @axis.Axis) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  let value_axis = if horizontal { ax.x_axis() } else { ax.y_axis() }
  let category_axis = if horizontal { ax.y_axis() } else { ax.x_axis() }
  value_axis.set_scale(
    @scale.logit_scale(nonpositive=if clipped { "clip" } else { "mask" }),
  )
  value_axis.set_limits(
    if inverted {
      0.9
    } else {
      0.1
    },
    if inverted {
      0.1
    } else {
      0.9
    },
  )
  category_axis.set_limits(-0.5, 6.5)
  ax.legend([])
  for axis in [value_axis, category_axis] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, ax, value_axis)
}

///|
fn add_ordinary_logit_bar(
  ax : Axes,
  horizontal : Bool,
  value : Double,
) -> Unit raise {
  if horizontal {
    ax.barh([1.0], [value], color="#e25283", label="Probability")
  } else {
    ax.bar([@core.point(1.0, value)], color="#e25283", label="Probability")
  }
}

///|
test "ordinary bars retain full Logit intervals with invalid value endpoints in both orientations" {
  let counts = []
  for horizontal in [false, true] {
    for inverted in [false, true] {
      for clipped in [false, true] {
        let (fig, ax, _) = ordinary_logit_bar_axes(
          horizontal, inverted, clipped,
        )
        add_ordinary_logit_bar(ax, horizontal, 1.0)
        let frame = fig.to_drawing()
        assert_eq(frame.svg(), fig.to_svg_checked())
        counts.push(frame.targets().length())
        if frame.targets().length() == 1 {
          let target = frame.targets()[0]
          assert_eq(target.info.value, 1.0)
          assert_eq(target.info.series, "Probability")
          assert_eq(target.info.point.point_index, 0)
          assert_eq(
            target.info.kind,
            if horizontal {
              @drawing.HitKind::BarH
            } else {
              Bar
            },
          )
          guard target.shape is @drawing.HitShape::Rectangle(x, y, w, h) else {
            fail("ordinary bar must retain its painted rectangle")
          }
          assert_eq(
            if horizontal {
              (x, w)
            } else {
              (y, h)
            },
            if horizontal {
              (0.0, 400.0)
            } else {
              (0.0, 200.0)
            },
          )
          assert_eq(
            frame.hit_test(x + w * 0.25, y + h * 0.75, radius=0.0),
            Some(target.info.point),
          )
          assert_eq(
            frame.hit_test_client(
              (x + w * 0.75) * 2.0,
              (y + h * 0.25) * 2.0,
              0.0,
              0.0,
              800.0,
              400.0,
              radius=0.0,
            ),
            Some(target.info.point),
          )
        }
      }
    }
  }
  assert_eq(counts, [1, 1, 1, 1, 1, 1, 1, 1])
}

///|
test "ordinary Logit category bars keep raw values labels and missing source indices after clipping" {
  for horizontal in [false, true] {
    for inverted in [false, true] {
      let (fig, ax, _) = ordinary_logit_bar_axes(horizontal, inverted, false)
      let labels = [
        "Missing", "Full", "Beyond", "Partial", "Zero", "Negative", "Below",
      ]
      let values = [0.0 / 0.0, 1.0, 2.0, 0.25, 0.0, -1.0, -2.0]
      if horizontal {
        ax.bar_category_y(values, labels, color="#e25283", label="Rate")
      } else {
        ax.bar_category(labels, values, color="#e25283", label="Rate")
      }
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      assert_eq(frame.targets().map(t => t.info.point.point_index), [1, 2, 3])
      assert_eq(frame.targets().map(t => t.info.value), [1.0, 2.0, 0.25])
      assert_eq(frame.targets().map(t => t.info.category), [
        Some("Full"),
        Some("Beyond"),
        Some("Partial"),
      ])
      assert_eq(frame.targets().map(t => t.info.series), [
        "Rate", "Rate", "Rate",
      ])
      assert_eq(frame.svg().split("fill=\"#e25283\"").count() - 1, 3)
      guard frame.targets()[2].shape
        is @drawing.HitShape::Rectangle(_, _, partial_width, partial_height) else {
        fail("partial interval must use its painted rectangle")
      }
      let partial_span = if horizontal { partial_width } else { partial_height }
      let viewport_span = if horizontal { 400.0 } else { 200.0 }
      assert_true(partial_span > 0.0 && partial_span < viewport_span)
      for target in frame.targets() {
        let point = target.info.point
        let raw_value = if horizontal { point.data_x } else { point.data_y }
        let category = if horizontal { point.data_y } else { point.data_x }
        assert_eq(raw_value, target.info.value)
        assert_eq(category, point.point_index.to_double())
        assert_eq(
          frame.hit_test(point.screen_x, point.screen_y, radius=0.0),
          Some(point),
        )
      }
    }
  }
}

///|
test "ordinary Logit bars wholly below the domain do not emit phantom rectangles" {
  for horizontal in [false, true] {
    let (fig, ax, _) = ordinary_logit_bar_axes(horizontal, false, true)
    if horizontal {
      ax.barh([1.0, 2.0, 3.0], [0.0, -1.0, -2.0], color="#e25283")
    } else {
      ax.bar(
        [@core.point(1.0, 0.0), @core.point(2.0, -1.0), @core.point(3.0, -2.0)],
        color="#e25283",
      )
    }
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.targets(), [])
    assert_eq(frame.points(), [])
    assert_eq(frame.svg().split("fill=\"#e25283\"").count() - 1, 0)
    assert_eq(frame.hit_test(200.0, 100.0, radius=1000.0), None)
  }
}

///|
test "ordinary endpoint bars respect explicit probability minimum and live reversed viewport" {
  for horizontal in [false, true] {
    let (fig, ax, value_axis) = ordinary_logit_bar_axes(
      horizontal, false, false,
    )
    add_ordinary_logit_bar(ax, horizontal, 1.0)
    value_axis.bind_minpos(() => 0.02)
    value_axis.set_limits(0.2, 0.8)
    let original = fig.to_drawing()
    assert_eq(value_axis.get_minpos(), 0.02)
    assert_eq(original.targets().length(), 1)
    assert_eq(original.svg(), fig.to_svg_checked())
    value_axis.set_limits(0.75, 0.25)
    let reversed = fig.to_drawing()
    assert_eq(value_axis.get_minpos(), 0.02)
    assert_eq(reversed.targets().length(), 1)
    assert_eq(reversed.svg(), fig.to_svg_checked())
    for frame in [original, reversed] {
      let point = frame.points()[0]
      assert_eq(
        frame.hit_test(point.screen_x, point.screen_y, radius=0.0),
        Some(point),
      )
      assert_eq(frame.targets()[0].info.value, 1.0)
      assert_true(
        !frame.svg().contains("NaN") && !frame.svg().contains("Infinity"),
      )
    }
  }
}
