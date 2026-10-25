///|
test "a bar spanning both Logit boundaries draws and hits the valid viewport" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.grouped_bar(["A"], [[1.0]], labels=["Whole"])
  ax.legend([])
  ax.set_y_scale(@mathplotlib.logit_scale())
  ax.set_x_limits(-0.5, 0.5)
  ax.set_y_limits(0.1, 0.9)
  let drawing = fig.to_drawing()
  assert_eq(drawing.targets().length(), 1)
  assert_true(drawing.hit_test(200.0, 100.0, radius=0.0) is Some(_))
}

///|
test "vertical and horizontal Logit bars retain original values while both ends clip in either direction" {
  for horizontal in [false, true] {
    for inverted in [false, true] {
      for mode in ["mask", "clip"] {
        for (baseline, value) in [(0.0, 1.0), (-1.0, 3.0), (2.0, -3.0)] {
          let fig = @mathplotlib.figure(width=400, height=200)
          let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
          ax.stacked_bar(
            ["Probability"],
            [[0.0 / 0.0], [value]],
            baseline~,
            labels=["Missing", "Span"],
            colors=["red", "blue"],
            horizontal~,
          )
          ax.legend([])
          let lo = if inverted { 0.9 } else { 0.1 }
          let hi = if inverted { 0.1 } else { 0.9 }
          if horizontal {
            ax.set_x_scale(@mathplotlib.logit_scale(nonpositive=mode))
            ax.set_x_limits(lo, hi)
            ax.set_y_limits(-0.5, 0.5)
          } else {
            ax.set_y_scale(@mathplotlib.logit_scale(nonpositive=mode))
            ax.set_y_limits(lo, hi)
            ax.set_x_limits(-0.5, 0.5)
          }
          let frame = fig.to_drawing()
          assert_eq(frame.svg(), fig.to_svg_checked())
          assert_eq(frame.targets().length(), 1)
          let target = frame.targets()[0]
          assert_eq(target.info.point.artist_index, 1)
          assert_eq(target.info.point.point_index, 0)
          assert_eq(target.info.series, "Span")
          assert_eq(target.info.category, Some("Probability"))
          assert_eq(target.info.value, value)
          assert_eq(
            if horizontal {
              target.info.point.data_x
            } else {
              target.info.point.data_y
            },
            baseline + value,
          )
          let raw = ax.data_limits(horizontal~)
          assert_eq(
            (raw.lower(), raw.upper()),
            (
              Double::min(baseline, baseline + value),
              Double::max(baseline, baseline + value),
            ),
          )
          guard target.shape
            is @mathplotlib.HitShape::Rectangle(x, y, width, height) else {
            fail("expected clipped rectangle")
          }
          if horizontal {
            bars_close(x, 0.0)
            bars_close(width, 400.0)
          } else {
            bars_close(y, 0.0)
            bars_close(height, 200.0)
          }
          for (fx, fy) in [(0.0, 0.0), (0.2, 0.8), (0.9, 0.1), (1.0, 1.0)] {
            assert_eq(
              frame.hit_test(x + fx * width, y + fy * height, radius=0.0),
              Some(target.info.point),
            )
          }
          assert_eq(
            frame.hit_test_client(
              100.0,
              50.0,
              0.0,
              0.0,
              200.0,
              100.0,
              radius=0.0,
            ),
            Some(target.info.point),
          )
          assert_eq(frame.hit_test(-0.1, 100.0, radius=100.0), None)
          assert_eq(frame.hit_test(200.0, 200.1, radius=100.0), None)
          assert_false(frame.svg().contains("NaN"))
          assert_false(frame.svg().contains("Infinity"))
        }
      }
    }
  }
}

///|
test "bars wholly beyond either Logit domain edge never paint or return a hit" {
  for horizontal in [false, true] {
    for inverted in [false, true] {
      for
        (baseline, value) in [(-3.0, 1.0), (-1.0, 1.0), (1.0, 1.0), (3.0, -1.0)] {
        let fig = @mathplotlib.figure(width=400, height=200)
        let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
        ax.grouped_bar(["Outside"], [[value]], horizontal~, baseline~, colors=[
          "red",
        ])
        ax.legend([])
        let lo = if inverted { 0.9 } else { 0.1 }
        let hi = if inverted { 0.1 } else { 0.9 }
        if horizontal {
          ax.set_x_scale(@mathplotlib.logit_scale())
          ax.set_x_limits(lo, hi)
          ax.set_y_limits(-0.5, 0.5)
        } else {
          ax.set_y_scale(@mathplotlib.logit_scale())
          ax.set_y_limits(lo, hi)
          ax.set_x_limits(-0.5, 0.5)
        }
        let frame = fig.to_drawing()
        assert_eq(frame.targets().length(), 0)
        assert_eq(frame.hit_test(200.0, 100.0, radius=1000.0), None)
        assert_false(frame.svg().contains("fill=\"red\""))
      }
    }
  }
}
