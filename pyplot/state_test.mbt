///|
test "pyplot current figure lifecycle" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=240))
  @pyplot.plot([0.0, 1.0], [1.0, 0.0])
  @pyplot.title("state")
  @pyplot.xlabel("x")
  @pyplot.ylabel("y")
  try! @pyplot.xticks([0.0, 1.0], labels=["start", "end"])
  @pyplot.xlim(10.0, 0.0)
  @pyplot.ylim(20.0, 0.0)
  ignore(@pyplot.gcf())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("state"))
  assert_true(svg.contains("start"))
  assert_true(svg.contains("viewBox=\"0 0 320 240\""))
  @pyplot.clf()
  assert_true(!@pyplot.render_svg().contains("polyline"))
  @pyplot.close()
}

///|
test "pyplot plotting uses the axes property color cycle" {
  @pyplot.close()
  ignore(@pyplot.figure())
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  @pyplot.plot([0.0, 1.0], [1.0, 0.0], color="#123456")
  @pyplot.scatter([0.0], [0.5])
  let artists = @pyplot.gca().artists()
  match (artists[0], artists[1], artists[2]) {
    (
      @scene.Artist::Line(_, first),
      @scene.Artist::Line(_, explicit),
      @scene.Artist::Scatter(_, third),
    ) => {
      assert_eq(first.color(), "#1f77b4")
      assert_eq(explicit.color(), "#123456")
      assert_eq(third.color(), "#ff7f0e")
    }
    _ => fail("expected line, line, scatter artists")
  }
  @pyplot.close()
}

///|
test "pyplot property-cycle helpers configure new figures" {
  @pyplot.rcdefaults()
  try! @pyplot.set_prop_cycle(["#112233"])
  @pyplot.close()
  ignore(@pyplot.figure())
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  match @pyplot.gca().artists()[0] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#112233")
    _ => fail("expected line artist")
  }
  @pyplot.rcdefaults()
  @pyplot.close()
}

///|
test "pyplot forwards major grid configuration" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  assert_true(!@pyplot.render_svg().contains("#123456"))
  try! @pyplot.grid(color="#123456", which="y", linewidth=0.75)
  assert_true(@pyplot.render_svg().contains("#123456"))
  try! @pyplot.grid(visible=false, which="y")
  assert_true(!@pyplot.render_svg().contains("#123456"))
  @pyplot.close()
}

///|
test "pyplot forwards major and minor locator configuration" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  @pyplot.plot([0.0, 10.0], [0.0, 10.0])
  try! @pyplot.xaxis_locator(try! @ticker.maxn_locator(count=5))
  try! @pyplot.yaxis_locator(try! @ticker.maxn_locator(count=5))
  try! @pyplot.xaxis_minor_locator(
    try! @ticker.auto_minor_locator(subdivisions=2),
  )
  try! @pyplot.yaxis_minor_locator(
    try! @ticker.auto_minor_locator(subdivisions=2),
  )
  try! @pyplot.grid(which="major", color="#123456", linewidth=0.8, axis="x")
  try! @pyplot.grid(which="minor", color="#abcdef", linewidth=0.3, axis="both")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  @pyplot.close()
}

///|
test "pyplot cla clears only the current axes" {
  @pyplot.close()
  let (fig, axes) = try! @pyplot.subplots(rows=1, columns=2)
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  axes[1].plot([0.0, 1.0], [1.0, 0.0])
  @pyplot.cla()
  assert_eq(@pyplot.gca().artists().length(), 0)
  assert_eq(axes[1].artists().length(), 1)
  assert_eq(fig.axes_list().length(), 2)
  @pyplot.close()
}

///|
test "pyplot axis modes control decorations" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  @pyplot.xlabel("x label")
  try! @pyplot.axis(mode="off")
  let hidden = @pyplot.render_svg()
  assert_true(hidden.contains("polyline"))
  assert_true(!hidden.contains("x label"))
  try! @pyplot.axis(mode="on")
  assert_true(@pyplot.render_svg().contains("x label"))
  try! @pyplot.axis(mode="tight")
  assert_eq(@pyplot.margins(), (0.0, 0.0))
  try @pyplot.axis(mode="invalid") catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("axis mode"))
    _ => fail("expected invalid axis mode")
  } noraise {
    _ => fail("expected invalid axis mode")
  }
  @pyplot.close()
}

///|
test "pyplot array helpers validate lengths" {
  @pyplot.close()
  try @pyplot.scatter([0.0, 1.0], [2.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 2)
      assert_eq(actual, 1)
    }
    @core.DataError::NonFiniteLimit(_) => fail("unexpected limit error")
    @core.DataError::InvalidErrorBar(_) => fail("unexpected error bar error")
    @core.DataError::InvalidBins => fail("unexpected histogram error")
    @core.DataError::InvalidImage(_) => fail("unexpected image error")
    @core.DataError::InvalidPie(_) => fail("unexpected pie error")
    @core.DataError::InvalidBoxPlot(_) => fail("unexpected boxplot error")
    @core.DataError::InvalidQuiver(_) => fail("unexpected quiver error")
    @core.DataError::InvalidViolin(_) => fail("unexpected violin error")
    @core.DataError::InvalidContour(_) => fail("unexpected contour error")
    @core.DataError::InvalidAnnotation(_) => fail("unexpected annotation error")
    @core.DataError::InvalidReference(_) => fail("unexpected reference error")
    @core.DataError::InvalidStreamplot(_) => fail("unexpected streamplot error")
    @core.DataError::InvalidStatistics(_) => fail("unexpected statistics error")
    @core.DataError::InvalidTicks(_) => fail("unexpected tick error")
    @core.DataError::InvalidCollection(_) => fail("unexpected collection error")
  } noraise {
    _ => fail("expected a length mismatch")
  }
  @pyplot.close()
}

///|
test "pyplot subplots select the first axes" {
  @pyplot.close()
  let (fig, axes) = try! @pyplot.subplots(
    rows=1,
    columns=2,
    width=320,
    height=220,
  )
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  assert_eq(@pyplot.gca().artists().length(), 1)
  axes[1].bar([@core.point(0.0, 2.0), @core.point(1.0, 3.0)])
  let svg = fig.to_svg()
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("<rect"))
  @pyplot.close()
}

///|
test "pyplot subplots forward GridSpec ratios" {
  @pyplot.close()
  let (fig, axes) = try! @pyplot.subplots(
    rows=1,
    columns=2,
    width=420,
    height=240,
    width_ratios=[1.0, 3.0],
  )
  match (axes[0].rect(), axes[1].rect()) {
    (Some(first), Some(second)) =>
      assert_true(second.width() > first.width() * 2.9)
    _ => fail("expected ratio-aware pyplot rectangles")
  }
  assert_true(fig.to_svg().contains("viewBox=\"0 0 420 240\""))
  @pyplot.close()
}

///|
test "pyplot subplots_adjust forwards to the current figure" {
  @pyplot.close()
  let (fig, axes) = try! @pyplot.subplots(
    rows=1,
    columns=2,
    width=400,
    height=300,
  )
  try! @pyplot.subplots_adjust(left=0.2, right=0.8, wspace=0.5)
  match (axes[0].rect(), axes[1].rect()) {
    (Some(first), Some(second)) => {
      assert_true((first.x() - 80.0).abs() < 1.0e-10)
      assert_true((second.x() - 224.0).abs() < 1.0e-10)
    }
    _ => fail("expected adjusted pyplot rectangles")
  }
  assert_eq(fig.subplot_bounds(), (0.2, 56.0 / 300.0, 0.8, 1.0 - 56.0 / 300.0))
  @pyplot.close()
}

///|
test "pyplot axes creates and selects an independent normalized panel" {
  @pyplot.close()
  let fig = @pyplot.figure(width=400, height=300)
  let axes = try! @pyplot.axes(left=0.1, bottom=0.2, width=0.5, height=0.4)
  try! axes.set_x_limits(0.0, 1.0)
  try! axes.set_y_limits(0.0, 1.0)
  try! @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  let rect = axes.rect().unwrap()
  assert_eq(
    (rect.x(), rect.y(), rect.width(), rect.height()),
    (40.0, 120.0, 200.0, 120.0),
  )
  assert_eq(@pyplot.gca().rect().unwrap().x(), 40.0)
  assert_eq(fig.axes_list().length(), 1)
  assert_true(@pyplot.render_svg().contains("points=\"40,240 240,120\""))
  @pyplot.close()
}

///|
test "pyplot axes without a rectangle follows subplot bounds" {
  @pyplot.close()
  let fig = @pyplot.figure(width=400, height=300)
  let axes = try! @pyplot.axes()
  assert_true(axes.get_subplotspec() is Some(_))
  let before = axes.rect().unwrap()
  try! @pyplot.subplots_adjust(left=0.2, bottom=0.2, right=0.8, top=0.8)
  let after = axes.rect().unwrap()
  assert_true(after.x() != before.x())
  assert_true((after.x() - 80.0).abs() < 1.0e-10)
  assert_true((after.y() - 60.0).abs() < 1.0e-10)
  assert_true((after.width() - 240.0).abs() < 1.0e-10)
  assert_true((after.height() - 180.0).abs() < 1.0e-10)
  assert_eq(fig.axes_list().length(), 1)
  @pyplot.close()
}

///|
test "pyplot sca switches figures and rejects detached axes atomically" {
  @pyplot.close()
  let first = @pyplot.figure(width=400, height=300)
  let first_axes = first.axes()
  let (second, second_axes) = try! @pyplot.subplots(
    rows=1,
    columns=2,
    width=320,
    height=220,
  )
  try! @pyplot.sca(first_axes)
  @pyplot.title("first")
  assert_eq(@pyplot.gcf().width(), 400)
  assert_eq(first_axes.title(), Some("first"))
  try! @pyplot.sca(second_axes[1])
  @pyplot.title("second")
  assert_eq(@pyplot.gcf().width(), 320)
  assert_eq(second_axes[1].title(), Some("second"))
  let old = second_axes[1]
  let replacement = try! second.subplots(1, 1)
  ignore(replacement)
  try @pyplot.sca(old) catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("detached"))
    _ => fail("expected detached axes error")
  } noraise {
    _ => fail("expected detached axes error")
  }
  assert_eq(@pyplot.gcf().width(), 320)
  assert_eq(@pyplot.gca().title(), None)
  @pyplot.close()
}

///|
test "pyplot subplots_with_grid preserves row and column sharing" {
  @pyplot.close()
  let grid = try! @gridspec.gridspec(2, 2).with_shared_axes(
    @gridspec.ShareMode::Row,
    @gridspec.ShareMode::Column,
  )
  let (fig, axes) = try! @pyplot.subplots_with_grid(grid, width=320, height=220)
  try! axes[0].set_x_limits(4.0, 0.0)
  try! axes[0].set_y_limits(3.0, -3.0)
  match (axes[1].x_limits(), axes[2].y_limits()) {
    (Some(x), Some(y)) => {
      assert_true(x.lower() == 4.0)
      assert_true(y.upper() == -3.0)
    }
    _ => fail("pyplot did not keep GridSpec sharing")
  }
  assert_true(fig.to_svg().contains("viewBox=\"0 0 320 220\""))
  @pyplot.close()
}

///|
test "pyplot exposes custom image colormaps" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  let cmap = try! @colors.custom_colormap("red-blue", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  try! @pyplot.imshow_with_colormap([[0.0, 1.0]], cmap, vmin=0.0, vmax=1.0)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#ff0000"))
  assert_true(svg.contains("#0000ff"))
  @pyplot.close()
}

///|
test "pyplot exposes explicit image normalization" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  let norm = @colors.log_color_norm(try! @colors.log_norm(vmin=1.0, vmax=10.0))
  try! @pyplot.imshow_with_norm([[1.0, 10.0]], norm)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#000000"))
  assert_true(svg.contains("#ffffff"))
  @pyplot.close()
}

///|
test "pyplot forwards nonlinear image normalizations" {
  @pyplot.close()
  ignore(@pyplot.figure(width=280, height=180))
  let symlog = @colors.symlog_color_norm(
    try! @colors.symlog_norm(1.0, vmin=-10.0, vmax=10.0),
  )
  try! @pyplot.imshow_with_norm([[-10.0, 0.0, 10.0]], symlog, cmap="gray")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("fill=\"#000000\""))
  assert_true(svg.contains("fill=\"#ffffff\""))
  assert_true(!svg.contains("NaN"))
  @pyplot.close()
}

///|
test "pyplot imshow forwards image origin extent and aspect" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  try! @pyplot.imshow(
    [[0.0, 1.0], [1.0, 0.0]],
    origin="lower",
    extent=[10.0, 14.0, 20.0, 24.0],
    aspect="auto",
  )
  assert_true(!@pyplot.gca().aspect_equal())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("<rect"))
  assert_true(!svg.contains("NaN"))
  @pyplot.close()
}

///|
test "pyplot imshow forwards none interpolation" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  try! @pyplot.imshow(
    [[0.0, 1.0]],
    vmin=0.0,
    vmax=1.0,
    aspect="auto",
    interpolation="NONE",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("data:image/png;base64,"))
  @pyplot.close()
}

///|
test "pyplot exposes explicit discrete normalization and colormap" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  let norm = @colors.boundary_color_norm(
    try! @colors.boundary_norm([0.0, 1.0, 2.0], 2),
  )
  let cmap = try! @colors.listed_colormap("binary", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  try! @pyplot.imshow_with_norm_and_colormap([[0.5, 1.5]], norm, cmap)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#ff0000"))
  assert_true(svg.contains("#0000ff"))
  @pyplot.close()
}

///|
test "pyplot exposes explicit pcolor normalization and colormap" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=200))
  let norm = @colors.boundary_color_norm(
    try! @colors.boundary_norm([0.0, 1.0, 2.0], 2),
  )
  let cmap = try! @colors.listed_colormap("traffic", [
    try! @colors.rgba(1.0, 0.0, 0.0),
    try! @colors.rgba(0.0, 0.0, 1.0),
  ])
  cmap.set_under(try! @colors.rgba(0.0, 1.0, 0.0))
  cmap.set_over(try! @colors.rgba(1.0, 1.0, 0.0))
  try! @pyplot.pcolor_with_norm_and_colormap(
    [[-1.0, 0.5, 1.5, 3.0]],
    norm,
    cmap,
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#00ff00"))
  assert_true(svg.contains("#ff0000"))
  assert_true(svg.contains("#0000ff"))
  assert_true(svg.contains("#ffff00"))
  @pyplot.close()
}

///|
test "pyplot exposes named pcolor normalization" {
  @pyplot.close()
  ignore(@pyplot.figure(width=280, height=190))
  let norm = @colors.log_color_norm(try! @colors.log_norm(vmin=1.0, vmax=10.0))
  try! @pyplot.pcolormesh_with_norm([[1.0, 10.0]], norm, cmap="gray")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#000000"))
  assert_true(svg.contains("#ffffff"))
  @pyplot.close()
}

///|
test "pyplot exposes step, stairs, and fill_betweenx" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  try! @pyplot.step([0.0, 1.0, 2.0], [1.0, 2.0, 1.0], where_="post")
  try! @pyplot.fill_betweenx(
    [0.0, 1.0, 2.0],
    [0.0, 0.5, 0.0],
    right=[1.0, 1.5, 1.0],
    color="#123456",
  )
  try! @pyplot.stairs(
    [1.0, 2.0],
    edges=[0.0, 1.0, 2.0],
    fill=true,
    color="#abcdef",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("<polygon"))
  @pyplot.close()
}

///|
test "pyplot exposes stem and eventplot" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  try! @pyplot.stem([1.0, 2.0], color="#123456")
  try! @pyplot.eventplot(
    [[0.0, 1.0], [0.5]],
    lineoffsets=[1.0, 2.0],
    color="#abcdef",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  @pyplot.close()
}

///|
test "pyplot exposes tables" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let table = try! @pyplot.table(
    cell_text=[["10", "20"]],
    col_labels=["x", "y"],
    row_labels=["value"],
    loc="center",
  )
  assert_eq(table.rows(), 2)
  assert_eq(table.columns(), 3)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">x<"))
  assert_true(svg.contains(">value<"))
  assert_true(svg.contains(">20<"))
  @pyplot.close()
}

///|
test "pyplot exposes fill, hist2d, and quiverkey" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  try! @pyplot.fill([0.0, 1.0, 0.5], [0.0, 0.0, 1.0], color="#123456")
  try! @pyplot.hist2d([0.0, 1.0], [0.0, 1.0], bins_x=2, bins_y=2)
  try! @pyplot.quiverkey(0.0, 0.0, 0.5, "key", color="#abcdef")
  assert_true(@pyplot.render_svg().contains("key"))
  @pyplot.close()
}

///|
test "pyplot exposes matshow" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=240))
  try! @pyplot.matshow([[0.0, 1.0], [2.0, 3.0]])
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">0<"))
  assert_true(svg.contains(">1<"))
  assert_true(svg.contains("#440154"))
  @pyplot.close()
}

///|
test "pyplot matshow forwards interpolation" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=240))
  try! @pyplot.matshow([[0.0, 1.0], [1.0, 0.0]], interpolation="none")
  assert_true(@pyplot.render_svg().contains("data:image/png;base64,"))
  @pyplot.close()
}

///|
test "pyplot exposes colorbars" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  let norm = @colors.linear_color_norm(
    try! @colors.normalize(vmin=0.0, vmax=1.0),
  )
  let bar = try! @pyplot.colorbar(norm, cmap="gray")
  bar.set_label("scale")
  assert_true(@pyplot.render_svg().contains("scale"))
  @pyplot.close()
}

///|
test "pyplot forwards explicit legends" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  @pyplot.legend([@scene.legend_entry("diagonal")])
  assert_true(@pyplot.render_svg().contains("diagonal"))
  @pyplot.close()
}

///|
test "pyplot exposes category x plotting" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  try! @pyplot.plot_category(["A", "B", "A"], [1.0, 2.0, 1.5])
  let svg = @pyplot.render_svg()
  assert_true(svg.contains(">A<"))
  assert_true(svg.contains(">B<"))
  @pyplot.close()
}

///|
test "pyplot exposes pie charts" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  ignore(try! @pyplot.pie([1.0, 2.0], labels=["left", "right"]))
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("<path"))
  assert_true(svg.contains("left"))
  assert_true(svg.contains("right"))
  @pyplot.close()
}

///|
test "pyplot exposes reference segments and spans" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  try! @pyplot.hlines([0.5], 0.0, 1.0, color="#123456")
  try! @pyplot.vlines([0.5], 0.0, 1.0, color="#654321")
  try! @pyplot.axhspan(0.4, 0.6, color="#abcdef")
  try! @pyplot.axvspan(0.4, 0.6, color="#fedcba")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  @pyplot.close()
}

///|
test "pyplot exposes boxplots" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  ignore(try! @pyplot.boxplot([[1.0, 2.0, 3.0, 20.0]]))
  assert_true(@pyplot.render_svg().contains("<rect"))
  @pyplot.close()
}

///|
test "pyplot exposes quiver" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  try! @pyplot.quiver([0.0], [0.0], [1.0], [1.0], label="field")
  assert_true(@pyplot.render_svg().contains("field"))
  @pyplot.close()
}

///|
test "pyplot exposes arrow and annotate" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=240))
  try! @pyplot.arrow(0.0, 0.0, 1.0, 1.0, color="#123456", label="arrow")
  try! @pyplot.annotate(
    "target",
    1.0,
    1.0,
    offset_x=0.25,
    offset_y=0.25,
    arrow=true,
    arrowcolor="#abcdef",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("target"))
  assert_true(svg.contains("<polygon"))
  @pyplot.close()
}

///|
test "pyplot forwards annotation coordinate modes" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  try! @pyplot.annotate(
    "display",
    0.3,
    0.7,
    offset_x=24.0,
    offset_y=12.0,
    arrow=true,
    xycoords="axes fraction",
    textcoords="offset points",
    connector="angle",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("display"))
  assert_true(svg.contains("<polyline"))
  @pyplot.close()
}

///|
test "pyplot exposes axline" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=240))
  try! @pyplot.axline(@core.point(0.0, 0.0), slope=1.0, color="#123456")
  assert_true(@pyplot.render_svg().contains("stroke=\"#123456\""))
  @pyplot.close()
}

///|
test "pyplot exposes secondary axes" {
  @pyplot.close()
  ignore(@pyplot.figure(width=360, height=240))
  let axis = try! @pyplot.secondary_xaxis(x => x * 2.0, x => x / 2.0)
  axis.set_label("secondary")
  assert_true(@pyplot.render_svg().contains("secondary"))
  @pyplot.close()
}

///|
test "pyplot exposes pcolor and pcolormesh" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.pcolor([[0.0, 1.0], [1.0, 0.0]], vmin=0.0, vmax=1.0, cmap="gray")
  try! @pyplot.pcolormesh([[0.0, 1.0]], cmap="viridis")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("#000000"))
  assert_true(svg.contains("#440154"))
  @pyplot.close()
}

///|
test "pyplot forwards rectangular mesh antialiasing" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.pcolor([[0.0]], antialiased=true)
  assert_true(@pyplot.render_svg().contains("stroke-width=\"0.5\""))
  @pyplot.close()
}

///|
test "pyplot exposes curvilinear pcolor grids" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.pcolormesh_grid(
    [[0.0, 1.0], [2.0, 3.0]],
    [[0.0, 1.0], [0.2, 1.2]],
    [[0.0, 0.1], [1.0, 1.1]],
    shading="nearest",
    cmap="viridis",
  )
  assert_true(@pyplot.render_svg().contains("<polygon"))
  @pyplot.close()
}

///|
test "pyplot forwards gouraud curvilinear grids" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.pcolor_grid(
    [[0.0, 0.5, 1.0], [0.25, 0.75, 1.25], [0.5, 1.0, 1.5]],
    [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
    [[0.0, 0.0, 0.0], [1.0, 1.0, 1.0], [2.0, 2.0, 2.0]],
    shading="gouraud",
    cmap="gray",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("linearGradient"))
  assert_true(svg.contains("url(#gouraud-0-0)"))
  @pyplot.close()
}

///|
test "pyplot forwards masked curvilinear grids" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  let data = try! @core.masked_matrix([[0.0, 1.0], [2.0, 3.0]], mask=[
    [false, true],
    [false, false],
  ])
  let x = try! @core.masked_matrix(
    [[0.0, 1.0, 2.0], [0.0, 1.0, 2.0], [0.0, 1.0, 2.0]],
    mask=[[true, false, false], [false, false, false], [false, false, false]],
  )
  let y = try! @core.masked_matrix([
    [0.0, 0.0, 0.0],
    [1.0, 1.0, 1.0],
    [2.0, 2.0, 2.0],
  ])
  try! @pyplot.pcolor_grid_masked(data, x, y, shading="flat")
  assert_true(@pyplot.render_svg().contains("<polygon"))
  @pyplot.close()
}

///|
test "pyplot forwards curvilinear antialiasing" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.pcolor_grid(
    [[0.0]],
    [[0.0, 1.0], [0.0, 1.0]],
    [[0.0, 0.0], [1.0, 1.0]],
    shading="flat",
    antialiased=true,
  )
  assert_true(@pyplot.render_svg().contains("stroke-width=\"0.5\""))
  @pyplot.close()
}

///|
test "pyplot exposes masked image and mesh" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  let data = try! @core.masked_matrix([[0.0, 1.0], [2.0, 3.0]], mask=[
    [false, true],
    [false, false],
  ])
  try! @pyplot.imshow_masked(
    data,
    vmin=0.0,
    vmax=3.0,
    origin="lower",
    extent=[10.0, 12.0, 20.0, 22.0],
    aspect="auto",
  )
  try! @pyplot.pcolormesh_masked(data, vmin=0.0, vmax=3.0)
  let svg = @pyplot.render_svg()
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
  assert_true(!@pyplot.gca().aspect_equal())
  @pyplot.close()
}

///|
test "pyplot exposes barbs" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.barbs([0.0], [0.0], [1.0], [0.5], color="#123456", label="wind")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("wind"))
  assert_true(svg.contains("<line"))
  @pyplot.close()
}

///|
test "pyplot exposes advanced barb options" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.barbs_with_options(
    [0.0, 1.0],
    [0.0, 1.0],
    [55.0, 25.0],
    [0.0, 0.0],
    color="#123456",
    flip=true,
    pivot="middle",
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("#123456"))
  @pyplot.close()
}

///|
test "pyplot exposes streamplot" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  ignore(
    try! @pyplot.streamplot(
      [0.0, 1.0, 2.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
      color="#123456",
      label="flow",
    ),
  )
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("<polyline"))
  assert_true(svg.contains("flow"))
  @pyplot.close()
}

///|
test "pyplot forwards streamplot color bounds" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  let result = try! @pyplot.streamplot_with_style_grids(
    [0.0, 1.0],
    [0.0, 1.0],
    [[1.0, 1.0], [1.0, 1.0]],
    [[0.0, 0.0], [0.0, 0.0]],
    color_values=[[5.0, 5.0], [5.0, 5.0]],
    cmap="gray",
    vmin=0.0,
    vmax=10.0,
    density=0.1,
    arrows=false,
    broken_streamlines=false,
    minlength=0.0,
    max_steps=3,
  )
  assert_true(result.lines().length() > 0)
  assert_true(@pyplot.render_svg().contains("#808080"))
  @pyplot.close()
}

///|
test "pyplot exposes correlation and ecdf helpers" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let auto = try! @pyplot.acorr(
    [1.0, 2.0, 3.0],
    maxlags=1,
    detrend=values => values.map(value => value - 2.0),
    label="auto",
  )
  assert_eq(auto.lags().length(), 3)
  assert_true(auto.values()[1] == 1.0)
  let cdf = try! @pyplot.ecdf([2.0, 1.0, 3.0], compress=true, label="cdf")
  assert_eq(cdf.values(), [1.0, 2.0, 3.0])
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("auto"))
  assert_true(svg.contains("cdf"))
  @pyplot.close()
}

///|
test "pyplot exposes hexbin" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let bins = try! @pyplot.hexbin(
    [0.0, 0.5, 1.0],
    [0.0, 0.5, 1.0],
    values=[1.0, 3.0, 5.0],
    gridsize=2,
    reduce="sum",
    color="#123456",
    edgecolor="#654321",
    linewidth=1.25,
    bins="log",
    extent=[0.0, 1.0, 0.0, 1.0],
    marginals=true,
    label="hexes",
  )
  assert_true(bins.centers().length() > 0)
  assert_eq(bins.values().length(), bins.counts().length())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#654321"))
  assert_true(svg.contains("hexes"))
  @pyplot.close()
}

///|
test "pyplot forwards a callable hexbin reducer" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let bins = try! @pyplot.hexbin(
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
    values=[1.0, 3.0, 5.0],
    gridsize=1,
    reduce_fn=@scene.hexbin_reducer(samples => {
      samples[0] + samples[1] * 2.0 + samples[2]
    }),
  )
  assert_eq(bins.values(), [12.0])
  @pyplot.close()
}

///|
test "pyplot exposes spy" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  try! @pyplot.spy(
    [[0.0, 1.0], [2.0, 0.0]],
    color="#123456",
    label="sparse",
    markersize=4.0,
    origin="lower",
    aspect="auto",
  )
  assert_true(!@pyplot.gca().aspect_equal())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("<circle"))
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("sparse"))
  @pyplot.close()
}

///|
test "pyplot spy forwards marker shapes" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  try! @pyplot.spy([[1.0, 0.0], [0.0, 1.0]], marker="D")
  assert_true(@pyplot.render_svg().contains("<polygon"))
  @pyplot.close()
}

///|
test "pyplot exposes triplot and tripcolor" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let xs = [0.0, 1.0, 0.0]
  let ys = [0.0, 0.0, 1.0]
  let triangles = [[0, 1, 2]]
  try! @pyplot.triplot(xs, ys, triangles, color="#123456")
  try! @pyplot.tripcolor(xs, ys, triangles, [0.0, 0.5, 1.0], cmap="viridis")
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("<polygon"))
  @pyplot.close()
}

///|
test "pyplot reuses an automatically generated triangulation" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let mesh = try! @pyplot.triangulation([0.0, 1.0, 0.0, 1.0], [
    0.0, 0.0, 1.0, 1.0,
  ])
  try! @pyplot.triplot_triangulation(mesh, color="#123456")
  try! @pyplot.tripcolor_triangulation(
    mesh,
    [0.0, 1.0, 2.0, 3.0],
    cmap="viridis",
  )
  let lines = try! @pyplot.tricontour_triangulation(
    mesh,
    [0.0, 1.0, 2.0, 3.0],
    levels=[0.5, 1.5, 2.5],
  )
  assert_true(!lines.filled())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("<polygon"))
  @pyplot.close()
}

///|
test "pyplot exposes a triangulation point finder" {
  @pyplot.close()
  let mesh = try! @pyplot.triangulation(
    [0.0, 1.0, 0.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    triangles=[[0, 1, 2], [1, 3, 2]],
  )
  let finder = @pyplot.get_trifinder(mesh)
  assert_eq(finder.find(0.2, 0.2), 0)
  assert_eq(try! finder.find_many([0.2, 0.8], [0.2, 0.8]), [0, 1])
  @pyplot.close()
}

///|
test "pyplot exposes tricontour and tricontourf" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let xs = [0.0, 1.0, 0.0]
  let ys = [0.0, 0.0, 1.0]
  let triangles = [[0, 1, 2]]
  let lines = try! @pyplot.tricontour(xs, ys, triangles, [0.0, 1.0, 2.0], levels=[
    0.5, 1.5,
  ])
  let filled = try! @pyplot.tricontourf(
    xs,
    ys,
    triangles,
    [0.0, 1.0, 2.0],
    levels=[0.0, 1.0, 2.0],
    colors=["#abcdef", "#fedcba"],
  )
  assert_true(!lines.filled())
  assert_true(filled.filled())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("<polygon"))
  @pyplot.close()
}

///|
test "pyplot forwards contour locators" {
  @pyplot.close()
  ignore(@pyplot.figure(width=320, height=220))
  let contours = try! @pyplot.contour(
    [[0.0, 1.0], [2.0, 3.0]],
    locator=@ticker.fixed_locator([0.5, 1.5, 2.5]),
  )
  assert_eq(contours.levels(), [0.5, 1.5, 2.5])
  @pyplot.close()
}

///|
test "pyplot exposes violinplots" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  let stats = try! @pyplot.violinplot(
    [[1.0, 2.0, 3.0], [2.0, 3.0, 4.0]],
    points=8,
    showmedians=true,
    side=@scene.ViolinSide::Low,
    label="violins",
  )
  assert_eq(stats.length(), 2)
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("violins"))
  @pyplot.close()
}

///|
test "pyplot exposes contour and filled contour plots" {
  @pyplot.close()
  ignore(@pyplot.figure(width=300, height=220))
  let lines = try! @pyplot.contour(
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0], [2.0, 3.0, 4.0]],
    levels=[1.0, 2.0, 3.0],
    color="#123456",
    label="levels",
  )
  assert_eq(lines.levels(), [1.0, 2.0, 3.0])
  assert_true(!lines.filled())
  try! @pyplot.clabel(lines, color="#abcdef")
  let filled = try! @pyplot.contourf(
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0], [2.0, 3.0, 4.0]],
    levels=[0.0, 2.0, 4.0],
    colors=["#abcdef", "#fedcba"],
    label="bands",
    extend_mode="both",
    corner_mask=false,
  )
  assert_eq(filled.levels(), [0.0, 2.0, 4.0])
  assert_true(filled.filled())
  assert_eq(filled.extend_mode(), "both")
  assert_true(!filled.corner_mask())
  let svg = @pyplot.render_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("levels"))
  assert_true(svg.contains("bands"))
  @pyplot.close()
}

///|
test "pyplot plot labels populate the automatic legend" {
  @pyplot.close()
  ignore(@pyplot.figure(width=240, height=180))
  @pyplot.plot([0.0, 1.0], [0.0, 1.0], label="diagonal")
  @pyplot.scatter([0.0, 1.0], [1.0, 0.0], label="samples")
  let entries = @pyplot.gca().legend_entries()
  assert_eq(entries.length(), 2)
  assert_eq(entries[0].label(), "diagonal")
  assert_eq(entries[1].label(), "samples")
  assert_true(@pyplot.render_svg().contains("samples"))
  @pyplot.close()
}
