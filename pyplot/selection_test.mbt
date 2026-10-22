///|
test "sca preserves drawing order and routes plots to the selected panel" {
  @pyplot.close()
  let fig = @pyplot.figure(width=400, height=300)
  let first = @pyplot.axes(left=0.1, bottom=0.1, width=0.5, height=0.5)
  @pyplot.title("first")
  @pyplot.plot([0.0, 1.0], [0.0, 1.0], color="#123456")
  let second = @pyplot.axes(left=0.2, bottom=0.2, width=0.5, height=0.5)
  @pyplot.title("second")
  @pyplot.plot([0.0, 1.0], [1.0, 0.0], color="#abcdef")
  let before = fig.to_svg()
  @pyplot.sca(first)
  assert_eq(@pyplot.gca().title(), Some("first"))
  assert_eq(fig.to_svg(), before)
  @pyplot.plot([0.0, 1.0], [0.5, 0.5])
  assert_eq(first.artists().length(), 2)
  assert_eq(second.artists().length(), 1)
  @pyplot.sca(second)
  assert_eq(@pyplot.gca().title(), Some("second"))
  assert_eq(fig.axes().title(), Some("first"))
  assert_eq(fig.axes_list().map(panel => panel.title()), [
    Some("first"),
    Some("second"),
  ])
  @pyplot.close()
}

///|
test "failed selection leaves another figure and its plotting route intact" {
  @pyplot.close()
  let old_figure = @pyplot.figure(width=400)
  let stale = @pyplot.axes()
  ignore(old_figure.subplots(1, 2))
  let current_figure = @pyplot.figure(width=320)
  let current = @pyplot.axes()
  @pyplot.title("current")
  try @pyplot.sca(stale) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected detached axes error")
  } noraise {
    _ => fail("expected detached axes error")
  }
  assert_eq(@pyplot.gcf().width(), 320)
  assert_eq(@pyplot.gca().title(), Some("current"))
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  assert_eq(current.artists().length(), 1)
  assert_eq(current_figure.axes().artists().length(), 1)
  assert_eq(stale.artists().length(), 0)
  assert_eq(old_figure.axes().artists().length(), 0)
  @pyplot.close()
}

///|
test "pyplot recovers the current panel after object API replacements" {
  @pyplot.close()
  let fig = @pyplot.figure()
  let old_default = @pyplot.gca()
  let manual = fig.add_axes(0.1, 0.1, 0.5, 0.5)
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  assert_eq(manual.artists().length(), 1)
  assert_eq(old_default.artists().length(), 0)
  let panels = fig.subplots(1, 2)
  @pyplot.plot([0.0, 1.0], [1.0, 0.0])
  assert_eq(panels[0].artists().length(), 0)
  assert_eq(panels[1].artists().length(), 1)
  assert_eq(manual.artists().length(), 1)
  @pyplot.close()
}

///|
test "default axes use adjusted bounds while explicit coordinates stay fixed" {
  @pyplot.close()
  let fig = @pyplot.figure(width=400, height=300)
  @pyplot.subplots_adjust(left=0.25, bottom=0.25, right=0.75, top=0.75)
  let subplot = @pyplot.axes()
  let bounds = subplot.rect().unwrap()
  assert_eq(
    (bounds.x(), bounds.y(), bounds.width(), bounds.height()),
    (100.0, 75.0, 200.0, 150.0),
  )
  let manual = @pyplot.axes(left=0.125, bottom=0.125, width=0.5, height=0.5)
  @pyplot.subplots_adjust(left=0.125, bottom=0.125, right=0.875, top=0.875)
  assert_eq(subplot.rect().unwrap().width(), 300.0)
  let fixed = manual.rect().unwrap()
  assert_eq(
    (fixed.x(), fixed.y(), fixed.width(), fixed.height()),
    (50.0, 112.5, 200.0, 150.0),
  )
  let partial = @pyplot.axes(width=0.0)
  assert_true(partial.get_subplotspec() is None)
  assert_eq(partial.rect().unwrap().width(), 0.0)
  assert_eq(partial.rect().unwrap().x(), 50.0)
  @pyplot.title("still selected")
  let count = fig.axes_list().length()
  try @pyplot.axes(height=-1.0) catch {
    @gridspec.LayoutError::InvalidBounds => ()
    _ => fail("expected invalid rectangle")
  } noraise {
    _ => fail("expected invalid rectangle")
  }
  assert_eq(fig.axes_list().length(), count)
  assert_eq(@pyplot.gca().title(), Some("still selected"))
  @pyplot.close()
}
