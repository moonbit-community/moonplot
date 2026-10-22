///|
test "default axes view delegates to figure" {
  let fig = @scene.figure(width=200, height=200)
  let ax = fig.axes()
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.set_x_limits(1.0, 0.0)
  ax.set_y_limits(1.0, 0.0)
  let svg = ax.figure().to_svg()
  assert_true(svg.contains("polyline"))
  assert_true(svg.contains("viewBox=\"0 0 200 200\""))
}

///|
test "figure owns artist point arrays" {
  let fig = @scene.figure()
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  fig.line(points)
  points.push(@core.point(2.0, 2.0))
  let artists = fig.artists()
  match artists[0] {
    @scene.Artist::Line(stored, _) => assert_eq(stored.length(), 2)
    _ => fail("expected line artist")
  }
}

///|
test "axes use the tab10 property cycle and preserve explicit colors" {
  let fig = @scene.figure()
  let axes = fig.axes()
  axes.plot([0.0, 1.0], [0.0, 1.0])
  axes.plot([0.0, 1.0], [1.0, 0.0])
  axes.plot([0.0, 1.0], [0.5, 0.5], color="#123456")
  axes.scatter([@core.point(0.0, 0.0)])
  let artists = axes.artists()
  match (artists[0], artists[1], artists[2], artists[3]) {
    (
      @scene.Artist::Line(_, first),
      @scene.Artist::Line(_, second),
      @scene.Artist::Line(_, explicit),
      @scene.Artist::Scatter(_, fourth),
    ) => {
      assert_eq(first.color(), "#1f77b4")
      assert_eq(second.color(), "#ff7f0e")
      assert_eq(explicit.color(), "#123456")
      assert_eq(fourth.color(), "#2ca02c")
    }
    _ => fail("expected line, line, line, scatter artists")
  }
}

///|
test "new figures read global rc params defaults" {
  @config.reset()
  try! @config.set_color_cycle(["#111111"])
  try! @config.set_x_margin(0.0)
  try! @config.set_y_margin(0.1)
  let fig = @scene.figure()
  let axes = fig.axes()
  axes.plot([0.0, 1.0], [0.0, 1.0])
  match axes.artists()[0] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#111111")
    _ => fail("expected line artist")
  }
  assert_eq(axes.margins(), (0.0, 0.1))
  @config.reset()
}

///|
test "common patch and error artists consume the property cycle" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! axes.errorbar([0.0, 1.0], [0.0, 1.0])
  try! axes.fill([0.0, 1.0, 0.5], [0.0, 0.0, 1.0])
  ignore(try! axes.hist([0.0, 1.0], bins=2))
  ignore(try! axes.boxplot([[0.0, 1.0, 2.0]]))
  let artists = axes.artists()
  match (artists[0], artists[1], artists[2], artists[3]) {
    (
      @scene.Artist::ErrorBar(_, _, _, first),
      @scene.Artist::Polygon(_, second),
      @scene.Artist::Bar(_, third),
      @scene.Artist::BoxPlot(_, _, fourth),
    ) => {
      assert_eq(first.color(), "#1f77b4")
      assert_eq(second.color(), "#ff7f0e")
      assert_eq(third.color(), "#2ca02c")
      assert_eq(fourth.color(), "#d62728")
    }
    _ => fail("expected errorbar, polygon, bar, boxplot artists")
  }
}

///|
test "forwarded line and vector helpers use automatic colors" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! axes.step([0.0, 1.0], [0.0, 1.0])
  try! axes.quiver([0.0], [0.0], [1.0], [1.0])
  ignore(try! axes.ecdf([0.0, 1.0]))
  let artists = axes.artists()
  match (artists[0], artists[1], artists[2]) {
    (
      @scene.Artist::Line(_, first),
      @scene.Artist::Quiver(_, _, second),
      @scene.Artist::Line(_, third),
    ) => {
      assert_eq(first.color(), "#1f77b4")
      assert_eq(second.color(), "#ff7f0e")
      assert_eq(third.color(), "#2ca02c")
    }
    _ => fail("expected step, quiver, ecdf artists")
  }
}

///|
test "axes allow replacing and inspecting the property cycle" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! axes.set_color_cycle(["#abcdef", "#fedcba"])
  assert_eq(axes.color_cycle(), ["#abcdef", "#fedcba"])
  axes.plot([0.0, 1.0], [0.0, 1.0])
  axes.plot([0.0, 1.0], [1.0, 0.0])
  axes.plot([0.0, 1.0], [0.5, 0.5])
  let artists = axes.artists()
  match (artists[0], artists[1], artists[2]) {
    (
      @scene.Artist::Line(_, first),
      @scene.Artist::Line(_, second),
      @scene.Artist::Line(_, third),
    ) => {
      assert_eq(first.color(), "#abcdef")
      assert_eq(second.color(), "#fedcba")
      assert_eq(third.color(), "#abcdef")
    }
    _ => fail("expected three line artists")
  }
  try axes.set_color_cycle([]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("at least one"))
    _ => fail("expected empty color cycle error")
  } noraise {
    _ => fail("expected empty color cycle error")
  }
  try axes.set_color_cycle([""]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("must not be empty"))
    _ => fail("expected empty color error")
  } noraise {
    _ => fail("expected empty color error")
  }
  try! axes.set_prop_cycle(["#112233"])
  assert_eq(axes.color_cycle(), ["#112233"])
}

///|
test "axes expose configurable autoscale margins" {
  let fig = @scene.figure()
  let axes = fig.axes()
  assert_eq(axes.margins(), (0.05, 0.05))
  try! axes.set_margins(0.0, 0.2)
  assert_eq(axes.margins(), (0.0, 0.2))
  try! axes.set_x_margin(-0.25)
  assert_eq(axes.x_margin(), -0.25)
  try axes.set_y_margin(-0.5) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("greater than -0.5"))
    _ => fail("expected invalid margin error")
  } noraise {
    _ => fail("expected invalid margin error")
  }
}

///|
test "axes autoscale clears explicit limits and supports tight views" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! fig.set_bounds(@core.bounds(-1.0, 2.0, -2.0, 3.0))
  try! axes.autoscale(axis="x")
  match axes.x_limits() {
    None => ()
    Some(_) => fail("x autoscale should clear x limits")
  }
  match axes.y_limits() {
    Some(limits) => {
      assert_true(limits.lower() == -2.0)
      assert_true(limits.upper() == 3.0)
    }
    None => fail("x-only autoscale should retain y limits")
  }
  try! axes.autoscale(tight=true)
  match (axes.x_limits(), axes.y_limits()) {
    (None, None) => ()
    _ => fail("tight autoscale should clear both limits")
  }
  assert_eq(axes.margins(), (0.0, 0.0))
  try axes.autoscale(axis="z") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("'both'"))
    _ => fail("expected invalid autoscale axis error")
  } noraise {
    _ => fail("expected invalid autoscale axis error")
  }
}

///|
test "figure rejects non-finite explicit limits" {
  let fig = @scene.figure()
  try fig.set_x_limits(0.0 / 0.0, 1.0) catch {
    @core.DataError::NonFiniteLimit(axis~) => assert_eq(axis, "x")
    _ => fail("expected a non-finite x limit error")
  } noraise {
    _ => fail("expected a limit error")
  }
}

///|
test "figure exposes deterministic grid cells" {
  let fig = @scene.figure(width=200, height=100)
  let cells = try! fig.grid_cells(1, 2)
  assert_eq(cells.length(), 2)
  assert_true(cells[1].x() > cells[0].x())
}

///|
test "figure grid follows Matplotlib visibility and axis selection" {
  let fig = @scene.figure(width=240, height=180)
  let default_svg = fig.to_svg()
  assert_true(!default_svg.contains("#e5e7eb"))
  try! fig.axes().grid(which="x", color="#123456", linewidth=0.5)
  let x_svg = fig.to_svg()
  assert_true(x_svg.contains("#123456"))
  try! fig.axes().grid(visible=false, which="x")
  assert_true(!fig.to_svg().contains("#123456"))
  try fig.axes().grid(which="z") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("both"))
    _ => fail("expected invalid grid axis")
  } noraise {
    _ => fail("expected invalid grid axis")
  }
  try fig.axes().grid(which="x", axis="y") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("only valid"))
    _ => fail("expected invalid grid selector")
  } noraise {
    _ => fail("expected invalid grid selector")
  }
}

///|
test "major and minor locators reach axes and SVG grids" {
  let fig = @scene.figure(width=320, height=220)
  let axes = fig.axes()
  axes.plot([0.0, 10.0], [0.0, 10.0])
  try! axes.set_x_locator(try! @ticker.maxn_locator(count=5))
  try! axes.set_y_locator(try! @ticker.maxn_locator(count=5))
  try! axes.set_x_minor_locator(try! @ticker.auto_minor_locator(subdivisions=2))
  try! axes.set_y_minor_locator(try! @ticker.auto_minor_locator(subdivisions=2))
  try! axes.grid(which="major", color="#123456", linewidth=0.8, axis="x")
  try! axes.grid(which="minor", color="#abcdef", linewidth=0.3, axis="both")
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_eq(axes.x_axis().tick_values(@core.limits(0.0, 10.0)), [
    0.0, 2.5, 5.0, 7.5, 10.0,
  ])
}

///|
test "axes clear resets artists and axis presentation but keeps layout" {
  let fig = @scene.figure(width=240, height=180)
  let axes = try! fig.subplots(1, 2)
  axes[1].plot([0.0, 1.0], [0.0, 1.0])
  axes[1].set_title("old")
  try! axes[1].set_x_limits(0.0, 2.0)
  try! axes[1].grid(color="#123456")
  let old_rect = axes[1].rect()
  axes[1].clear()
  assert_eq(axes[1].artists().length(), 0)
  assert_eq(axes[1].title(), None)
  match axes[1].x_limits() {
    None => ()
    Some(_) => fail("clear should remove x limits")
  }
  assert_true(!fig.to_svg().contains("#123456"))
  match (axes[1].rect(), old_rect) {
    (Some(current), Some(previous)) => {
      assert_true(current.x() == previous.x())
      assert_true(current.y() == previous.y())
      assert_true(current.width() == previous.width())
      assert_true(current.height() == previous.height())
    }
    _ => fail("clear should retain the subplot rectangle")
  }
}

///|
test "figure clear removes all panel content and title" {
  let fig = @scene.figure()
  fig.set_title("old")
  fig.plot([0.0, 1.0], [0.0, 1.0])
  fig.clear()
  assert_eq(fig.title(), None)
  assert_eq(fig.artists().length(), 0)
  assert_true(!fig.to_svg().contains("polyline"))
}

///|
test "axis decorations can be hidden without removing artists" {
  let fig = @scene.figure(width=240, height=180)
  let axes = fig.axes()
  axes.plot([0.0, 1.0], [0.0, 1.0])
  axes.set_x_label("x label")
  try! axes.grid(color="#123456")
  let visible = fig.to_svg()
  assert_true(visible.contains("polyline"))
  assert_true(visible.contains("#123456"))
  axes.set_axis_off()
  let hidden = fig.to_svg()
  assert_true(hidden.contains("polyline"))
  assert_true(!hidden.contains("#123456"))
  assert_true(!hidden.contains("x label"))
  axes.set_axis_on()
  assert_true(fig.to_svg().contains("x label"))
}

///|
test "subplots keep independent artists and render panels" {
  let fig = @scene.figure(width=360, height=220)
  let axes = try! fig.subplots(1, 2)
  assert_eq(axes.length(), 2)
  axes[0].plot([0.0, 1.0], [0.0, 1.0])
  axes[0].set_title("left panel")
  axes[0].set_x_label("left")
  axes[1].scatter([@core.point(10.0, 2.0), @core.point(20.0, 3.0)])
  axes[1].set_y_label("right")
  assert_eq(fig.axes_list().length(), 2)
  assert_eq(axes[0].artists().length(), 1)
  assert_eq(axes[1].artists().length(), 1)
  match (axes[0].rect(), axes[1].rect()) {
    (Some(first), Some(second)) => assert_true(second.x() > first.x())
    _ => fail("expected subplot rectangles")
  }
  let svg = fig.to_svg()
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("<circle"))
  assert_true(svg.contains("left"))
  assert_true(svg.contains("left panel"))
  assert_true(svg.contains("right"))
}

///|
test "subplots reject invalid dimensions" {
  let fig = @scene.figure()
  try fig.subplots(0, 2) catch {
    @gridspec.LayoutError::InvalidDimension => ()
    _ => fail("expected invalid subplot dimensions")
  } noraise {
    _ => fail("expected a layout error")
  }
}

///|
test "subplots forward GridSpec width and height ratios" {
  let fig = @scene.figure(width=420, height=320)
  let axes = try! fig.subplots(2, 2, width_ratios=[1.0, 3.0], height_ratios=[
    3.0, 1.0,
  ])
  match (axes[0].rect(), axes[1].rect(), axes[2].rect()) {
    (Some(first), Some(second), Some(third)) => {
      assert_true(second.width() > first.width() * 2.9)
      assert_true(first.height() > third.height() * 2.9)
    }
    _ => fail("expected ratio-aware subplot rectangles")
  }
}

///|
test "subplots_adjust updates live subplot geometry" {
  let fig = @scene.figure(width=400, height=300)
  let axes = try! fig.subplots(1, 2)
  let before = match axes[0].rect() {
    Some(rect) => rect
    None => fail("expected a subplot rectangle")
  }
  try! fig.subplots_adjust(left=0.2, bottom=0.1, right=0.8, top=0.9, wspace=0.5)
  assert_eq(fig.subplot_bounds(), (0.2, 0.1, 0.8, 0.9))
  match (axes[0].rect(), axes[1].rect()) {
    (Some(first), Some(second)) => {
      assert_true(first.x() > before.x())
      assert_true((first.x() - 80.0).abs() < 1.0e-10)
      assert_true((first.y() - 30.0).abs() < 1.0e-10)
      assert_true((first.width() - 96.0).abs() < 1.0e-10)
      assert_true((second.x() - 224.0).abs() < 1.0e-10)
      assert_true((second.width() - 96.0).abs() < 1.0e-10)
      assert_true(second.x() > first.x() + first.width())
    }
    _ => fail("expected adjusted subplot rectangles")
  }
  assert_true(fig.to_svg().contains("viewBox=\"0 0 400 300\""))
}

///|
test "add_axes uses normalized lower-left coordinates and stays independent" {
  let fig = @scene.figure(width=400, height=300)
  let axes = try! fig.add_axes(0.1, 0.2, 0.5, 0.4)
  axes.plot([0.0, 1.0], [0.0, 1.0])
  try! axes.set_x_limits(0.0, 1.0)
  try! axes.set_y_limits(0.0, 1.0)
  let rect = axes.rect().unwrap()
  assert_eq(
    (rect.x(), rect.y(), rect.width(), rect.height()),
    (40.0, 120.0, 200.0, 120.0),
  )
  match axes.get_subplotspec() {
    None => ()
    Some(_) => fail("add_axes must not create a SubplotSpec")
  }
  assert_eq(fig.axes_list().length(), 1)
  assert_true(fig.to_svg().contains("points=\"40,240 240,120\""))
  try! fig.subplots_adjust(left=0.3, bottom=0.3, right=0.7, top=0.7)
  let after = axes.rect().unwrap()
  assert_eq(
    (after.x(), after.y(), after.width(), after.height()),
    (40.0, 120.0, 200.0, 120.0),
  )
}

///|
test "add_axes accepts zero dimensions and rejects invalid rectangles atomically" {
  let fig = @scene.figure(width=200, height=100)
  let original = fig.axes()
  original.plot([0.0, 1.0], [0.0, 1.0])
  let zero_width = try! fig.add_axes(0.1, 0.1, 0.0, 0.5)
  assert_eq(zero_width.rect().unwrap().width(), 0.0)
  let zero_height = try! fig.add_axes(0.1, 0.1, 0.5, 0.0)
  assert_eq(zero_height.rect().unwrap().height(), 0.0)
  for
    values in [
      (0.1, 0.1, -0.1, 0.5),
      (0.1, 0.1, 0.5, -0.1),
      (0.0 / 0.0, 0.1, 0.5, 0.5),
      (0.1, 0.0 / 0.0, 0.5, 0.5),
      (0.1, 0.1, 0.0 / 0.0, 0.5),
      (0.1, 0.1, 0.5, 0.0 / 0.0),
      (-1.0 / 0.0, 0.1, 0.5, 0.5),
      (0.1, 1.0 / 0.0, 0.5, 0.5),
      (0.1, 0.1, 1.0 / 0.0, 0.5),
      (0.1, 0.1, 0.5, 1.0 / 0.0),
      (1.0e308, 0.1, 1.0e308, 0.5),
      (0.1, 1.0e308, 0.5, 1.0e308),
      (0.0, 0.0, 1.0e308, 0.5),
    ] {
    try fig.add_axes(values.0, values.1, values.2, values.3) catch {
      @gridspec.LayoutError::InvalidBounds => ()
      _ => fail("expected invalid axes rectangle")
    } noraise {
      _ => fail("expected invalid axes rectangle")
    }
    assert_eq(fig.axes_list().length(), 3)
    assert_eq(fig.axes().artists().length(), 1)
  }
}

///|
test "add_axes accepts rectangles outside the figure" {
  let fig = @scene.figure(width=200, height=100)
  let axes = try! fig.add_axes(-0.2, -0.1, 1.5, 1.4)
  let rect = axes.rect().unwrap()
  assert_true((rect.x() + 40.0).abs() < 1.0e-10)
  assert_true((rect.y() + 30.0).abs() < 1.0e-10)
  assert_true((rect.width() - 300.0).abs() < 1.0e-10)
  assert_true((rect.height() - 140.0).abs() < 1.0e-10)
}

///|
test "subplots_adjust preserves default axes handles and updates SVG positions" {
  let fig = @scene.figure(width=400, height=300)
  let axes = fig.axes()
  axes.plot([0.0, 1.0], [0.0, 1.0])
  axes.set_x_limits(0.0, 1.0)
  axes.set_y_limits(0.0, 1.0)
  fig.subplots_adjust(left=0.25, bottom=0.25, right=0.75, top=0.75)
  assert_eq(axes.artists().length(), 1)
  let rect = axes.rect().unwrap()
  assert_eq(
    (rect.x(), rect.y(), rect.width(), rect.height()),
    (100.0, 75.0, 200.0, 150.0),
  )
  assert_true(fig.to_svg().contains("points=\"100,225 300,75\""))
  axes.scatter([@core.point(0.5, 0.5)])
  assert_eq(fig.axes().artists().length(), 2)
  fig.subplots_adjust(left=0.125)
  assert_eq(fig.subplot_bounds(), (0.125, 0.25, 0.75, 0.75))
  assert_true(fig.to_svg().contains("points=\"50,225 300,75\""))
  let new_axes = fig.subplots(1, 2)
  let cells = fig.grid_cells(1, 2)
  assert_eq(new_axes[0].rect().unwrap().x(), 50.0)
  assert_eq(new_axes[1].rect().unwrap().x(), cells[1].x())
}

///|
test "subplots_adjust keeps explicit nested spacing and validates atomically" {
  let fig = @scene.figure(width=420, height=260)
  let outer = try! fig.grid_spec(1, 2)
  let child = try! outer.cell_spec(0, 1).subgridspec(1, 2, hspace=0.2)
  let axes = [
    fig.add_subplot(try! child.cell_spec(0, 0)),
    fig.add_subplot(try! child.cell_spec(0, 1)),
  ]
  try! fig.subplots_adjust(left=0.1, right=0.9, wspace=0.8)
  let before = match (axes[0].rect(), axes[1].rect()) {
    (Some(first), Some(second)) => (first, second)
    _ => fail("expected nested rectangles")
  }
  assert_true(before.1.x() > before.0.x() + before.0.width())
  assert_true((before.0.x() - 258.0).abs() < 1.0e-10)
  assert_true((before.0.width() - 120.0 / 2.2).abs() < 1.0e-10)
  assert_true(
    (before.1.x() - before.0.x() - before.0.width() * 1.2).abs() < 1.0e-10,
  )
  let bounds_before = fig.subplot_bounds()
  try fig.subplots_adjust(left=0.9, right=0.1) catch {
    @gridspec.LayoutError::InvalidBounds => ()
    _ => fail("expected invalid subplot bounds")
  } noraise {
    _ => fail("expected invalid subplot bounds")
  }
  assert_eq(fig.subplot_bounds(), bounds_before)
  match (axes[0].rect(), axes[1].rect()) {
    (Some(first), Some(second)) => {
      assert_true(first.x() == before.0.x())
      assert_true(second.x() == before.1.x())
    }
    _ => fail("expected nested rectangles after rejected adjustment")
  }
  for invalid in [-1.0, 0.0 / 0.0, 1.0 / 0.0] {
    try fig.subplots_adjust(left=0.2, wspace=invalid) catch {
      @gridspec.LayoutError::InvalidSpacing => ()
      _ => fail("expected invalid subplot spacing")
    } noraise {
      _ => fail("expected invalid subplot spacing")
    }
    assert_eq(fig.subplot_bounds(), bounds_before)
    assert_eq(axes[0].rect().unwrap().x(), before.0.x())
  }
  for invalid in [0.9, 0.0 / 0.0, 1.0 / 0.0] {
    try fig.subplots_adjust(left=invalid, wspace=0.2) catch {
      @gridspec.LayoutError::InvalidBounds => ()
      _ => fail("expected invalid subplot bounds")
    } noraise {
      _ => fail("expected invalid subplot bounds")
    }
    assert_eq(fig.subplot_bounds(), bounds_before)
    assert_eq(axes[0].rect().unwrap().x(), before.0.x())
  }
}

///|
test "figure adds a subplot from a span" {
  let fig = @scene.figure(width=320, height=240)
  let grid = try! fig.grid_spec(2, 2)
  let ax = fig.add_subplot(try! grid.subplot(0, 2, 0, 1))
  ax.plot([0.0, 1.0], [1.0, 0.0])
  assert_eq(fig.axes_list().length(), 1)
  assert_true(fig.to_svg().contains("<polyline"))
}

///|
test "figure adds subplots from a nested grid" {
  let fig = @scene.figure(width=360, height=260)
  let outer = try! fig.grid_spec(1, 2, width_ratios=[1.0, 1.0])
  let child = try! outer.cell_spec(0, 1).subgridspec(1, 2)
  let first = fig.add_subplot(try! child.cell_spec(0, 0))
  let second = fig.add_subplot(try! child.cell_spec(0, 1))
  first.plot([0.0, 1.0], [0.0, 1.0])
  second.scatter([@core.point(0.5, 0.5)])
  assert_eq(fig.axes_list().length(), 2)
  match (first.rect(), second.rect()) {
    (Some(a), Some(b)) => assert_true(b.x() > a.x())
    _ => fail("expected nested subplot rectangles")
  }
  let before = match first.rect() {
    Some(rect) => rect
    None => fail("expected first subplot rectangle")
  }
  try! outer.set_width_ratios([3.0, 1.0])
  let after = match first.rect() {
    Some(rect) => rect
    None => fail("expected updated first subplot rectangle")
  }
  assert_true(after.x() > before.x())
  assert_true(after.width() < before.width())
  let svg = fig.to_svg()
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("<circle"))
}

///|
test "axes fixed ticks reach the SVG labels" {
  let fig = @scene.figure(width=320, height=220)
  let ax = fig.axes()
  try! ax.set_x_ticks([0.0, 1.0])
  try! ax.set_x_tick_labels(["zero", "one"])
  ax.plot([0.0, 1.0], [0.0, 1.0])
  let svg = fig.to_svg()
  assert_true(svg.contains("zero"))
  assert_true(svg.contains("one"))
}

///|
test "axes legend renders labeled samples" {
  let fig = @scene.figure(width=320, height=220)
  let ax = fig.axes()
  ax.plot([0.0, 1.0], [0.0, 1.0], color="#123456")
  ax.set_legend([
    @scene.legend_entry("line", color="#123456"),
    @scene.legend_entry(
      "points",
      color="#abcdef",
      kind=@scene.LegendKind::Marker,
    ),
  ])
  let svg = fig.to_svg()
  assert_true(svg.contains("line"))
  assert_true(svg.contains("points"))
  assert_true(svg.contains("fill-opacity=\"0.85\""))
}

///|
test "plot labels build a deduplicated automatic legend" {
  let fig = @scene.figure(width=360, height=240)
  let ax = fig.axes()
  ax.plot([0.0, 1.0], [0.0, 1.0], color="#123456", label="series")
  ax.plot([0.0, 1.0], [1.0, 0.0], color="#654321", label="series")
  ax.scatter([@core.point(0.5, 0.5)], color="#abcdef", label="observations")
  ax.bar([@core.point(2.0, 1.0)], color="#fedcba", label="bars")
  let entries = ax.legend_entries()
  assert_eq(entries.length(), 3)
  assert_eq(entries[0].label(), "series")
  assert_eq(entries[1].label(), "observations")
  assert_eq(entries[2].label(), "bars")
  let svg = fig.to_svg()
  assert_true(svg.contains("series"))
  assert_true(svg.contains("observations"))
  assert_true(svg.contains("bars"))
}

///|
test "explicit legends override and clear back to automatic labels" {
  let fig = @scene.figure(width=320, height=220)
  let ax = fig.axes()
  ax.plot([0.0, 1.0], [0.0, 1.0], label="automatic")
  ax.set_legend([@scene.legend_entry("explicit")])
  assert_eq(ax.legend_entries().length(), 1)
  assert_eq(ax.legend_entries()[0].label(), "explicit")
  ax.clear_legend()
  assert_eq(ax.legend_entries().length(), 1)
  assert_eq(ax.legend_entries()[0].label(), "automatic")
}
