///|
fn area_axes() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  for axis in [ax.x_axis(), ax.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, ax)
}

///|
fn area_info_at(
  frame : @drawing.Drawing,
  x : Double,
  y : Double,
) -> @drawing.HitInfo raise {
  guard frame.hit_test(x, y, radius=0.0) is Some(point) else {
    fail("Expected a filled area at (\{x}, \{y})")
  }
  frame.hit_info(point).unwrap()
}

///|
test "area fill selects real unevenly spaced samples throughout its true polygon" {
  let (fig, ax) = area_axes()
  ax.fill_between(
    [0.0, 2.0, 10.0],
    [1.0, 2.0, 4.0],
    [5.0, 8.0, 6.0],
    label="Confidence",
  )
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.points().map(p => p.point_index), [0, 1, 2])
  assert_true(
    frame.svg().contains("points=\"0,100 80,40 400,80 400,120 80,160 0,180\""),
  )
  assert_eq(frame.targets().length(), 4)
  assert_true(frame.targets().all(t => t.info.kind == @drawing.HitKind::Area))
  for
    (x, y, expected) in [
      (30.0, 130.0, 0),
      (50.0, 100.0, 1),
      (230.0, 100.0, 1),
      (250.0, 100.0, 2),
    ] {
    assert_eq(area_info_at(frame, x, y).point.point_index, expected)
  }
  let info = area_info_at(frame, 50.0, 100.0)
  assert_eq(info.series, "Confidence")
  assert_eq((info.point.data_x, info.point.data_y, info.value), (2.0, 8.0, 8.0))
  assert_eq(info.band, Some(@drawing.band_info(2.0, 8.0)))
  // Both neighboring halves include their shared boundary; later target wins.
  assert_eq(area_info_at(frame, 40.0, 120.0).point.point_index, 1)
  assert_eq(area_info_at(frame, 240.0, 100.0).point.point_index, 2)
  assert_eq(frame.hit_test(5.0, 70.0, radius=1000.0), None)
  assert_eq(frame.hit_test(300.0, 150.0, radius=1000.0), None)
}

///|
test "area horizontal fills sample by y and retain unsorted source bounds" {
  let (fig, ax) = area_axes()
  ax.fill_betweenx(
    [0.0, 2.0, 10.0],
    [8.0, 7.0, 5.0],
    right=[2.0, 1.0, 3.0],
    label="Horizontal",
  )
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  let info = area_info_at(frame, 160.0, 175.0)
  assert_eq(info.point.point_index, 1)
  assert_eq((info.point.data_x, info.point.data_y, info.value), (1.0, 2.0, 1.0))
  assert_eq(info.band, Some(@drawing.band_info(7.0, 1.0, horizontal=true)))
  assert_eq(area_info_at(frame, 160.0, 10.0).point.point_index, 2)
  assert_eq(frame.hit_test(10.0, 100.0, radius=1000.0), None)
}

///|
test "area NaN and masked breaks retain original indices and never bridge missing intervals" {
  let (fig, ax) = area_axes()
  ax.fill_between([0.0, 1.0, 0.0 / 0.0, 3.0, 4.0], [1.0, 1.0, 1.0, 1.0, 1.0], [
    5.0, 5.0, 5.0, 5.0, 5.0,
  ])
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.points().map(p => p.point_index), [0, 1, 3, 4])
  assert_eq(area_info_at(frame, 145.0, 140.0).point.point_index, 4)
  assert_eq(frame.hit_test(80.0, 140.0, radius=1000.0), None)
  ax.clear()
  ax.set_x_limits(0.0, 6.0)
  ax.set_y_limits(0.0, 10.0)
  let positions = @core.masked_array([0.0, 1.0, 2.0, 3.0, 4.0], mask=[
    false, false, true, false, false,
  ])
  let lower = @core.masked_array([1.0, 1.0, 1.0, 1.0, 1.0])
  let upper = @core.masked_array([5.0, 5.0, 1000.0, 5.0, 5.0])
  ax.fill_between_masked(positions, lower, upper)
  let masked = fig.to_drawing()
  assert_eq(masked.points().map(p => p.point_index), [0, 1, 3, 4])
  assert_eq(masked.hit_test(400.0 / 3.0, 140.0), None)
  ax.clear()
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_limits(0.0, 6.0)
  ax.fill_betweenx_masked(positions, lower, upper)
  let horizontal_masked = fig.to_drawing()
  assert_eq(horizontal_masked.points().map(p => p.point_index), [0, 1, 3, 4])
  assert_true(
    horizontal_masked.targets().all(t => t.info.band.unwrap().horizontal),
  )
  assert_eq(horizontal_masked.hit_test(120.0, 200.0 * 2.0 / 3.0), None)
  ax.clear()
  ax.fill_between([0.0 / 0.0, 1.0, 0.0 / 0.0], [0.0, 0.0, 0.0], [5.0, 5.0, 5.0])
  assert_eq(fig.to_drawing().targets().length(), 0)
}

///|
test "area reversed positions axes and logarithmic positions split in real screen space" {
  let (fig, ax) = area_axes()
  ax.fill_between([10.0, 2.0, 0.0], [1.0, 1.0, 1.0], [8.0, 8.0, 8.0])
  assert_eq(area_info_at(fig.to_drawing(), 250.0, 100.0).point.point_index, 0)
  ax.set_x_limits(10.0, 0.0)
  ax.set_y_limits(10.0, 0.0)
  assert_eq(area_info_at(fig.to_drawing(), 150.0, 100.0).point.point_index, 0)
  ax.clear()
  ax.set_x_scale(@scale.log_scale())
  ax.set_x_limits(1.0, 100.0)
  ax.set_y_limits(0.0, 10.0)
  ax.fill_between([1.0, 10.0, 100.0], [1.0, 1.0, 1.0], [8.0, 8.0, 8.0])
  let nonlinear = fig.to_drawing()
  assert_eq(nonlinear.svg(), fig.to_svg_checked())
  assert_eq(area_info_at(nonlinear, 90.0, 100.0).point.data_x, 1.0)
  assert_eq(area_info_at(nonlinear, 110.0, 100.0).point.data_x, 10.0)
  ax.clear()
  ax.set_x_scale(@scale.log_scale())
  ax.set_x_limits(1.0, 1000.0)
  ax.set_y_limits(0.0, 10.0)
  ax.fill_between([1.0, 10.0, -1.0, 100.0, 1000.0], [1.0, 1.0, 1.0, 1.0, 1.0], [
    8.0, 8.0, 8.0, 8.0, 8.0,
  ])
  let invalid_log = fig.to_drawing()
  assert_eq(invalid_log.points().map(p => p.point_index), [0, 1, 3, 4])
  assert_eq(invalid_log.hit_test(200.0, 100.0), None)
  ax.clear()
  ax.set_x_scale(@scale.linear_scale())
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_scale(@scale.log_scale())
  ax.set_y_limits(1.0, 100.0)
  ax.fill_betweenx([1.0, 10.0, 100.0], [1.0, 1.0, 1.0], right=[8.0, 8.0, 8.0])
  let horizontal = fig.to_drawing()
  assert_eq(area_info_at(horizontal, 160.0, 155.0).point.data_y, 1.0)
  assert_eq(area_info_at(horizontal, 160.0, 145.0).point.data_y, 10.0)
}

///|
test "area stackplot captures exact original values and already computed bounds for every baseline" {
  for baseline in ["zero", "sym", "wiggle", "weighted_wiggle"] {
    let (fig, ax) = area_axes()
    ax.set_y_limits(-10.0, 15.0)
    let ys = [[1.0, 2.0, 3.0], [4.0, 3.0, 2.0]]
    ignore(
      ax.stackplot(
        [0.0, 2.0, 10.0],
        ys,
        labels=["First", "Second"],
        colors=["red"],
        baseline~,
      ),
    )
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.points().length(), 6)
    for target in frame.targets() {
      let artist = target.info.point.artist_index
      let sample = target.info.point.point_index
      assert_eq(
        target.info.series,
        if artist == 0 {
          "First"
        } else {
          "Second"
        },
      )
      assert_eq(target.info.value, ys[artist][sample])
      guard ax.state.val.artists[artist] is Artist::FillBetween(upper, lower, _) else {
        fail("Expected the actual stack layer")
      }
      assert_eq(
        target.info.band,
        Some(
          @drawing.band_info(lower[sample].y(), upper[sample].y(), stacked=true),
        ),
      )
      assert_eq(frame.hit_info(target.info.point), Some(target.info))
    }
    ys[1][1] = 999.0
    assert_eq(fig.to_drawing().targets()[5].info.value, 3.0)
    assert_eq(frame.targets()[5].info.value, 3.0)
  }
  // At this magnitude subtracting accumulated bounds loses part of 0.1.
  let (fig, ax) = area_axes()
  ax.set_y_limits(1000000.0, 1000001.0)
  ignore(
    ax.stackplot([0.0, 10.0], [[1000000.0, 1000000.0], [0.1, 0.1]], labels=[
      "Base", "Small",
    ]),
  )
  let frame = fig.to_drawing()
  let info = area_info_at(frame, 100.0, 190.0)
  assert_eq(info.series, "Small")
  assert_eq(info.value, 0.1)
  let band = info.band.unwrap()
  assert_true(band.upper - band.lower != info.value)
}

///|
test "area same colors stable identities paint overlap and rebuilding keep current semantic frames" {
  let (fig, ax) = area_axes()
  let xs = [0.0, 10.0]
  let upper = [8.0, 8.0]
  ax.fill_between(xs, [1.0, 1.0], upper, color="red", label="First")
  ax.fill_between(xs, [4.0, 4.0], [6.0, 6.0], color="red", label="Second")
  let old = fig.to_drawing()
  assert_eq(area_info_at(old, 100.0, 100.0).series, "Second")
  assert_eq(area_info_at(old, 100.0, 160.0).series, "First")
  xs[0] = 100.0
  upper[0] = 999.0
  assert_eq(
    area_info_at(fig.to_drawing(), 100.0, 160.0).band.unwrap().upper,
    8.0,
  )
  ax.clear()
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  ax.fill_between([0.0, 10.0], [2.0, 2.0], [7.0, 7.0], label="Replacement")
  let current = fig.to_drawing()
  assert_eq(area_info_at(current, 100.0, 100.0).series, "Replacement")
  assert_eq(area_info_at(old, 100.0, 100.0).series, "Second")
  assert_eq(current.hit_info(old.points()[0]), None)
}

///|
test "area viewport clipping CSS letterbox panel identity and actual SVG legend exclusion compose" {
  let (fig, ax) = area_axes()
  ax.fill_between([-1.0, 5.0], [-2.0, -2.0], [12.0, 12.0], label="Clipped")
  let frame = fig.to_drawing()
  let point = area_info_at(frame, 40.0, 100.0).point
  assert_eq((point.point_index, point.data_x, point.data_y), (0, -1.0, 12.0))
  assert_eq(frame.hit_test(-1.0, 100.0), None)
  assert_eq(frame.hit_test(300.0, 100.0), None)
  assert_eq(
    frame.hit_test_client(30.0, 70.0, 10.0, 20.0, 200.0, 100.0, radius=0.0),
    Some(point),
  )
  assert_eq(
    frame.hit_test_client(40.0, 200.0, 0.0, 0.0, 400.0, 400.0, radius=0.0),
    Some(point),
  )
  assert_eq(
    frame.hit_test_client(40.0, 20.0, 0.0, 0.0, 400.0, 400.0, radius=0.0),
    None,
  )
  ax.clear()
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_limits(0.0, 10.0)
  ax.fill_between([0.0, 10.0], [0.0, 0.0], [10.0, 10.0])
  ax.legend([legend_entry("Band")])
  let legend = fig.to_drawing()
  assert_eq(legend.hit_test(300.0, 24.0, radius=0.0), None)
  assert_true(legend.hit_test(300.0, 100.0, radius=0.0) is Some(_))
  let overlay = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  overlay.set_x_limits(0.0, 10.0)
  overlay.set_y_limits(0.0, 10.0)
  overlay.legend([])
  overlay.fill_between([0.0, 10.0], [0.0, 0.0], [10.0, 10.0], label="Overlay")
  let multi = fig.to_drawing()
  let info = area_info_at(multi, 300.0, 24.0)
  assert_eq(info.point.panel_index, 1)
  assert_eq(info.series, "Overlay")
}

///|
test "area crossing bounds hit both actual lobes and omit empty regions" {
  let (fig, ax) = area_axes()
  ax.fill_between([0.0, 10.0], [2.0, 8.0], [8.0, 2.0])
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(area_info_at(frame, 40.0, 100.0).point.point_index, 0)
  assert_eq(area_info_at(frame, 360.0, 100.0).point.point_index, 1)
  assert_eq(frame.hit_test(200.0, 50.0), None)
  assert_eq(frame.hit_test(200.0, 150.0), None)
}

///|
test "area nonmonotone duplicate positions zero area and invisible fills retain static SVG without false hits" {
  for xs in [[0.0, 10.0, 5.0], [0.0, 0.0, 10.0]] {
    let (fig, ax) = area_axes()
    ax.fill_between(xs, [1.0, 1.0, 1.0], [8.0, 8.0, 8.0])
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_true(frame.svg().contains("<polygon"))
    assert_eq(frame.targets().length(), 0)
    assert_eq(frame.points().length(), 0)
    assert_eq(frame.hit_test(100.0, 100.0), None)
  }
  let (fig, ax) = area_axes()
  ax.fill_between([0.0, 10.0], [3.0, 3.0], [3.0, 3.0])
  assert_eq(fig.to_drawing().hit_test(100.0, 140.0, radius=0.0), None)
  for color in ["none", "transparent"] {
    let (fig, ax) = area_axes()
    ax.fill_between([0.0, 10.0], [1.0, 1.0], [8.0, 8.0], color~)
    assert_eq(fig.to_drawing().targets().length(), 0)
  }
}
