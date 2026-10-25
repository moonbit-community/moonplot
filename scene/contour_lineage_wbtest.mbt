///|
test "inline matching geometry preserves each Contour call and leaves ordinary Line and invalidated Barbs separate" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 2.0)
  let color = "#226688"
  ax.plot([1.0, 0.5], [0.0, 0.5], color~, label="Ordinary")
  let a = ax.tricontour(
    [0.0, 2.0, 2.0],
    [0.0, 0.0, 2.0],
    [[0, 1, 2]],
    [0.0, 2.0, 4.0],
    levels=[1.0],
    color~,
    label="A",
  )
  let b = ax.tricontour(
    [0.0, 2.0, 2.0],
    [0.0, 0.0, 2.0],
    [[0, 1, 2]],
    [0.0, 4.0, 8.0],
    levels=[2.0],
    color~,
    label="B",
  )
  ax.barbs([1.0], [0.0], [-0.5], [0.5], barb_length=0.0, color~, label="Wind")
  let original = fig.to_drawing()
  assert_eq(original.targets().filter(t => t.info.kind == Barbs).length(), 1)
  ax.clabel(a)
  let frame = fig.to_drawing()
  assert_eq(a.segments().length(), 1)
  assert_eq(b.segments().length(), 1)
  assert_eq(frame.targets().filter(t => t.info.kind == Barbs).length(), 0)
  assert_eq(frame.targets().filter(t => t.info.kind == Line).length(), 4)
  assert_eq(
    frame
    .targets()
    .filter(t => t.info.kind == Contour)
    .map(t => {
      (
        t.info.point.artist_index,
        t.info.point.point_index,
        t.info.value,
        t.info.series,
      )
    }),
    [(2, 0, 1.0, "A"), (3, 0, 1.0, "A"), (4, 0, 2.0, "B"), (5, 0, 2.0, "B")],
  )
  for target in frame.targets().filter(t => t.info.kind == Contour) {
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let point = target.info.point
      let info = frame
        .hit_info(
          frame
          .hit_test(point.screen_x, point.screen_y, radius=1.0e-7, mode~)
          .unwrap(),
        )
        .unwrap()
      assert_eq((info.kind, info.value, info.series), (Contour, 2.0, "B"))
    }
  }
  assert_eq(frame.svg(), fig.to_svg_checked())
}

///|
test "content invalid contour inline split cannot recover a different call lineage from equal new geometry" {
  let fig = figure()
  let ax = fig.axes()
  ignore(ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5], label="Invalid"))
  let changed = ax.contour(
    [[0.0, 1.0], [1.0, 2.0]],
    levels=[1.5],
    label="Valid",
  )
  guard ax.state.val.artists[0] is Line(points, _) else { fail("Line") }
  let target = changed.segments()[0]
  points.clear()
  for p in target {
    points.push(p)
  }
  assert_eq(
    fig
    .to_drawing()
    .targets()
    .filter(t => t.info.point.artist_index == 0)
    .length(),
    0,
  )
  ax.clabel(changed)
  assert_true(
    fig
    .to_drawing()
    .targets()
    .all(t => {
      t.info.kind == Contour && t.info.series == "Valid" && t.info.value == 1.5
    }),
  )
  assert_true(
    fig.to_drawing().targets().all(t => t.info.point.artist_index >= 2),
  )
}

///|
test "Contour and Barbs intents and cursor stay aligned after image prefixes inline expansion remove and clear" {
  let fig = figure(width=400, height=300)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_limits(0.0, 10.0)
  let first = ax.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  ax.imshow([[0.0]], aspect="auto")
  ax.imshow([[0.0]], aspect="auto")
  let sets = []
  for i in 0..<4 {
    let shift = i.to_double() * 2.0
    sets.push(
      ax.contour(
        [[0.0, 1.0], [1.0, 2.0]],
        x=[shift, shift + 1.0],
        y=[1.0, 2.0],
        levels=[0.5],
        label="C\{i}",
      ),
    )
    ax.barbs(
      [shift + 0.25],
      [4.0],
      [1.0],
      [1.0],
      barb_length=0.0,
      label="W\{i}",
    )
  }
  for contours in sets {
    ax.clabel(contours)
  }
  first.remove()
  let old = fig.to_drawing()
  assert_eq(old.targets().filter(t => t.info.kind == Contour).length(), 12)
  assert_eq(old.targets().filter(t => t.info.kind == Barbs).length(), 4)
  for target in old.targets() {
    let info = target.info
    if info.kind == Contour {
      let intent = ax.state.val.contour_intents
        .get(info.point.artist_index)
        .unwrap()
      assert_eq(
        (info.series, info.value, info.point.point_index),
        (intent.view.series(), 0.5, 0),
      )
      assert_true(intent.source.cursor.val > 0)
      assert_true(
        ax.state.val.artist_hits[intent.source.cursor.val - 1].contour
        is Some(_),
      )
    }
    if info.kind == Barbs {
      let intent = ax.state.val.barb_intents
        .get(info.point.artist_index)
        .unwrap()
      assert_eq(info.series, intent.view.series())
    }
  }
  ax.clear_checked()
  assert_true(ax.state.val.contour_intents.is_empty())
  assert_true(ax.state.val.barb_intents.is_empty())
  ax.plot([0.0, 1.0], [0.0, 1.0], label="After")
  assert_true(
    fig
    .to_drawing()
    .targets()
    .all(t => t.info.kind == Line && t.info.series == "After"),
  )
  assert_eq(old.targets().filter(t => t.info.kind == Contour).length(), 12)
}

///|
test "contour long path keeps one shared source snapshot while emitting one target per actual edge" {
  let fig = figure(width=512, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 4096.0)
  ax.set_y_limits(0.0, 1.0)
  let points = Array::makei(4097, i => @core.point(i.to_double(), 0.5))
  ax.push_contour_path(points, @core.style("red"), 9, 42.0, "Long")
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 4096)
  for i, target in frame.targets() {
    assert_eq(
      (
        target.info.kind,
        target.info.value,
        target.info.series,
        target.info.point.point_index,
      ),
      (Contour, 42.0, "Long", 9),
    )
    assert_eq(
      (target.info.point.data_x, target.info.point.data_y),
      (i.to_double() + 0.5, 0.5),
    )
  }
  assert_eq(frame.svg(), fig.to_svg_checked())
}
