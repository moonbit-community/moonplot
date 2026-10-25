///|
fn bars_close(actual : Double, expected : Double) -> Unit raise {
  assert_true((actual - expected).abs() < 1.0e-10)
}

///|
test "grouped bars use centered slots explicit widths categories series and containers" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  let categories = ["North", "South"]
  let first = [3.0, 5.0]
  let second = [4.0, 2.0]
  ax.grouped_bar(categories, [first, second], labels=["2025", "2026"], colors=[
    "red", "blue",
  ])
  ax.legend([])
  let artists = ax.artists()
  assert_eq(artists.length(), 2)
  guard artists[0] is @mathplotlib.Artist::BarSegments(a, false, style_a) else {
    fail("expected vertical bar segments")
  }
  guard artists[1] is @mathplotlib.Artist::BarSegments(b, false, style_b) else {
    fail("expected second series")
  }
  bars_close(a[0].position, -0.2)
  bars_close(a[1].position, 0.8)
  bars_close(b[0].position, 0.2)
  bars_close(b[1].position, 1.2)
  for segment in a + b {
    bars_close(segment.width, 0.36)
    assert_eq(segment.baseline, 0.0)
  }
  assert_eq((style_a.fill(), style_b.fill()), ("red", "blue"))
  let x = ax.x_axis().data_interval()
  bars_close(x.lower(), -0.38)
  bars_close(x.upper(), 1.38)
  assert_eq(ax.y_axis().data_interval().lower(), 0.0)
  assert_eq(ax.y_axis().data_interval().upper(), 5.0)
  let snapshot = fig.to_drawing()
  assert_eq(snapshot.svg(), fig.to_svg_checked())
  assert_eq(snapshot.targets().map(t => t.info.series), [
    "2025", "2025", "2026", "2026",
  ])
  assert_eq(snapshot.targets().map(t => t.info.category), [
    Some("North"),
    Some("South"),
    Some("North"),
    Some("South"),
  ])
  assert_eq(snapshot.targets().map(t => t.info.value), [3.0, 5.0, 4.0, 2.0])
  assert_eq(ax.containers().map(c => c.label()), ["2025", "2026"])
  first[0] = 99.0
  second.clear()
  categories[0] = "mutated"
  a.clear()
  assert_eq(fig.to_drawing().targets()[0].info.value, 3.0)
  assert_eq(fig.to_drawing().targets()[0].info.category, Some("North"))
}

///|
test "stacked bars independently accumulate signs and retain segment magnitudes at nonzero baseline" {
  for horizontal in [false, true] {
    let fig = @mathplotlib.figure(width=400, height=200)
    fig.stacked_bar(
      ["North", "South"],
      [[2.0, -3.0], [4.0, -5.0], [-1.0, 6.0]],
      labels=["A", "B", "C"],
      horizontal~,
      baseline=10.0,
      width=0.6,
    )
    fig.legend([])
    let starts : Array[Array[Double]] = []
    for artist in fig.artists() {
      guard artist is @mathplotlib.Artist::BarSegments(segments, sideways, _) else {
        fail("expected bar segments")
      }
      assert_eq(sideways, horizontal)
      starts.push(segments.map(s => s.baseline))
    }
    assert_eq(starts, [[10.0, 10.0], [12.0, 7.0], [10.0, 10.0]])
    let value_axis = if horizontal {
      fig.axes().x_axis()
    } else {
      fig.axes().y_axis()
    }
    let category_axis = if horizontal {
      fig.axes().y_axis()
    } else {
      fig.axes().x_axis()
    }
    assert_eq(
      (value_axis.data_interval().lower(), value_axis.data_interval().upper()),
      (2.0, 16.0),
    )
    bars_close(category_axis.data_interval().lower(), -0.3)
    bars_close(category_axis.data_interval().upper(), 1.3)
    let snapshot = fig.to_drawing()
    assert_eq(snapshot.svg(), fig.to_svg_checked())
    assert_eq(snapshot.targets().map(t => t.info.value), [
      2.0, -3.0, 4.0, -5.0, -1.0, 6.0,
    ])
    assert_eq(snapshot.targets().map(t => t.info.series), [
      "A", "A", "B", "B", "C", "C",
    ])
    let third = snapshot.targets()[2].info
    assert_eq(third.value, 4.0)
    assert_eq(
      if horizontal {
        third.point.data_x
      } else {
        third.point.data_y
      },
      16.0,
    )
    for target in snapshot.targets() {
      assert_eq(
        target.info.kind,
        if horizontal {
          @mathplotlib.HitKind::BarH
        } else {
          @mathplotlib.HitKind::Bar
        },
      )
      guard target.shape is @mathplotlib.HitShape::Rectangle(x, y, w, h) else {
        fail("expected painted rectangle")
      }
      assert_eq(
        snapshot.hit_test(x + w * 0.15, y + h * 0.85, radius=0.0),
        Some(target.info.point),
      )
    }
  }
}

///|
test "grouped rectangle gaps and letterbox margins do not hit" {
  for horizontal in [false, true] {
    let fig = @mathplotlib.figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.grouped_bar(["Only"], [[3.0], [3.0]], horizontal~, width=0.8, gap=0.25)
    ax.legend([])
    let snapshot = fig.to_drawing()
    let first = snapshot.targets()[0]
    let second = snapshot.targets()[1]
    guard first.shape is @mathplotlib.HitShape::Rectangle(x0, y0, w0, h0) else {
      fail("expected first rectangle")
    }
    guard second.shape is @mathplotlib.HitShape::Rectangle(x1, y1, w1, h1) else {
      fail("expected second rectangle")
    }
    let (gap_x, gap_y) = if horizontal {
      (x0 + w0 / 2.0, (y1 + h1 + y0) / 2.0)
    } else {
      ((x0 + w0 + x1) / 2.0, y0 + h0 / 2.0)
    }
    assert_eq(snapshot.hit_test(gap_x, gap_y, radius=0.0), None)
    let point = second.info.point
    assert_eq(
      snapshot.hit_test_client(
        10.0 + point.screen_x * 2.0,
        20.0 + 100.0 + point.screen_y * 2.0,
        10.0,
        20.0,
        800.0,
        600.0,
        radius=0.0,
      ),
      Some(point),
    )
    assert_eq(
      snapshot.hit_test_client(
        410.0,
        50.0,
        10.0,
        20.0,
        800.0,
        600.0,
        radius=100.0,
      ),
      None,
    )
    assert_true(w1 > 0.0)
  }
}

///|
test "bar dimensions options infinities and overflow fail before attaching artists" {
  let cases : Array[(@mathplotlib.Figure) -> Unit raise @mathplotlib.DataError] = [
    fig => fig.grouped_bar(["A", "B"], [[1.0]]),
    fig => fig.grouped_bar(["A"], [[1.0], [2.0]], labels=["only"]),
    fig => fig.stacked_bar(["A"], [[1.0]], colors=["red", "blue"]),
    fig => fig.grouped_bar(["A"], [[1.0]], width=0.0),
    fig => fig.grouped_bar(["A"], [[1.0]], gap=1.0),
    fig => fig.grouped_bar(["A"], [[1.0]], gap=-0.1),
    fig => fig.stacked_bar(["A"], [[1.0]], baseline=1.0 / 0.0),
    fig => fig.stacked_bar(["A"], [[1.0 / 0.0]]),
    fig => fig.stacked_bar(["A"], [[1.7e308], [1.7e308]]),
    fig => fig.grouped_bar(["A"], [[1.7e308]], baseline=1.7e308),
  ]
  for operation in cases {
    let fig = @mathplotlib.figure()
    try operation(fig) catch {
      _ => ()
    } noraise {
      _ => fail("expected invalid bar input to raise")
    }
    assert_eq(fig.artists().length(), 0)
    assert_eq(fig.legend_entries().length(), 0)
    assert_true(fig.axes().x_axis().get_category_units() is None)
    assert_true(fig.axes().y_axis().get_category_units() is None)
  }
}

///|
test "missing and zero segments keep original indices and do not advance a stack" {
  let fig = @mathplotlib.figure(width=400, height=200)
  fig.stacked_bar(["A", "B", "C"], [[2.0, 0.0 / 0.0, 0.0], [3.0, 4.0, -2.0]], labels=[
    "First", "Second",
  ])
  fig.legend([])
  let snapshot = fig.to_drawing()
  assert_eq(snapshot.targets().map(t => t.info.value), [2.0, 3.0, 4.0, -2.0])
  assert_eq(snapshot.targets().map(t => t.info.point.point_index), [0, 0, 1, 2])
  assert_eq(snapshot.targets()[2].info.category, Some("B"))
  assert_eq(snapshot.targets()[2].info.point.data_y, 4.0)
  assert_eq(snapshot.targets()[1].info.point.data_y, 5.0)
  assert_true(!snapshot.svg().contains("NaN"))
  assert_true(!snapshot.svg().contains("Infinity"))
}

///|
test "bar rebuilds preserve independent panels old snapshots labels colors and current values" {
  let fig = @mathplotlib.figure(width=600, height=300)
  let axes = fig.subplots(1, 2)
  axes[0].grouped_bar(["Old"], [[2.0], [4.0]], labels=["Visible", "Hidden"], colors=[
    "red", "red",
  ])
  axes[1].stacked_bar(
    ["Other"],
    [[-3.0], [5.0]],
    labels=["One", "Two"],
    horizontal=true,
  )
  for ax in axes {
    ax.legend([])
  }
  let old = fig.to_drawing()
  axes[0].clear()
  axes[0].grouped_bar(["New"], [[7.0]], labels=["Visible"], colors=["red"])
  axes[0].legend([])
  let current = fig.to_drawing()
  assert_eq(current.targets().map(t => t.info.series), ["Visible", "One", "Two"])
  assert_eq(current.targets().map(t => t.info.category), [
    Some("New"),
    Some("Other"),
    Some("Other"),
  ])
  assert_eq(current.targets().map(t => t.info.value), [7.0, -3.0, 5.0])
  assert_eq(current.targets().map(t => t.info.point.panel_index), [0, 1, 1])
  assert_eq(old.targets().map(t => t.info.value), [2.0, 4.0, -3.0, 5.0])
  assert_eq(old.targets()[0].info.category, Some("Old"))
  assert_eq(axes[0].containers().length(), 1)
  assert_eq(axes[1].containers().length(), 2)
}

///|
test "grouped and stacked regions respect inverted axes clipping and SVG legend occlusion" {
  for horizontal in [false, true] {
    let fig = @mathplotlib.figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.stacked_bar(
      ["A"],
      [[2.0], [8.0]],
      labels=["Low", "High"],
      horizontal~,
      baseline=1.0,
      width=0.6,
    )
    if horizontal {
      ax.set_x_limits(6.0, 2.0)
      ax.set_y_limits(0.2, -0.2)
    } else {
      ax.set_x_limits(0.2, -0.2)
      ax.set_y_limits(6.0, 2.0)
    }
    ax.legend([])
    let snapshot = fig.to_drawing()
    assert_eq(snapshot.targets().length(), 2)
    assert_eq(snapshot.targets().map(t => t.info.value), [2.0, 8.0])
    for target in snapshot.targets() {
      let point = target.info.point
      assert_true(point.screen_x >= 0.0 && point.screen_x <= 400.0)
      assert_true(point.screen_y >= 0.0 && point.screen_y <= 200.0)
      assert_eq(
        snapshot.hit_test(point.screen_x, point.screen_y, radius=0.0),
        Some(point),
      )
    }
    assert_eq(snapshot.hit_test(-1.0, 100.0, radius=100.0), None)
    assert_eq(snapshot.hit_test(200.0, -1.0, radius=100.0), None)
    ax.clear_legend()
    let with_legend = fig.to_drawing()
    assert_eq(with_legend.svg(), fig.to_svg_checked())
    assert_eq(with_legend.hit_test(300.0, 24.0, radius=0.0), None)
  }
  let empty = @mathplotlib.figure()
  empty.grouped_bar([], [])
  empty.stacked_bar([], [[]], labels=["Empty"])
  assert_eq(empty.artists().length(), 0)
  assert_eq(empty.legend_entries().length(), 0)
}
