///|
test "delaxes defaults to current axes and restores the most recent survivor" {
  @pyplot.close()
  let fig = @pyplot.figure()
  let first = @pyplot.axes()
  first.set_title("first")
  let second = @pyplot.axes()
  second.set_title("second")
  let third = @pyplot.axes()
  third.set_title("third")
  @pyplot.sca(first)
  @pyplot.sca(second)
  @pyplot.delaxes()
  assert_true(!second.is_attached())
  assert_eq(@pyplot.gca().title(), Some("first"))
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  assert_eq(first.artists().length(), 1)
  assert_eq(third.artists().length(), 0)
  assert_eq(fig.axes_list().map(ax => ax.title()), [
    Some("first"),
    Some("third"),
  ])
  @pyplot.delaxes(ax=third)
  assert_eq(@pyplot.gca().title(), Some("first"))
  @pyplot.close()
}

///|
test "explicit delaxes on another figure preserves the current figure and panel" {
  @pyplot.close()
  let other = @pyplot.figure(width=300)
  let removed = @pyplot.gca()
  let current = @pyplot.figure(width=500)
  let selected = @pyplot.axes()
  selected.set_title("current")
  @pyplot.delaxes(ax=removed)
  assert_eq(other.axes_list().length(), 0)
  assert_eq(@pyplot.gcf().width(), 500)
  assert_eq(@pyplot.gca().title(), Some("current"))
  @pyplot.plot([0.0], [0.0])
  assert_eq(current.axes().artists().length(), 1)
  try @pyplot.delaxes(ax=removed) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  assert_eq(@pyplot.gca().title(), Some("current"))
  @pyplot.close()
}

///|
test "object selection and removal are immediately reflected by pyplot" {
  @pyplot.close()
  let fig = @pyplot.figure()
  let panels = fig.subplots(1, 3)
  for index, ax in panels {
    ax.set_title("panel-\{index}")
  }
  assert_eq(@pyplot.gca().title(), Some("panel-2"))
  ignore(fig.sca(panels[0]))
  assert_eq(@pyplot.gca().title(), Some("panel-0"))
  panels[0].remove()
  assert_eq(@pyplot.gca().title(), Some("panel-2"))
  @pyplot.plot([0.0], [1.0])
  assert_eq(panels[2].artists().length(), 1)
  try @pyplot.sca(panels[0]) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  assert_eq(@pyplot.gca().title(), Some("panel-2"))
  @pyplot.close()
}

///|
test "last axes removal leaves SVG empty and plotting creates a fresh panel" {
  @pyplot.close()
  let fig = @pyplot.figure(width=400, height=200)
  fig.subplots_adjust(left=0.25, bottom=0.25, right=0.75, top=0.75)
  let ax = @pyplot.gca()
  @pyplot.delaxes()
  assert_eq(fig.axes_list().length(), 0)
  assert_true(!@pyplot.render_svg().contains("clipPath"))
  assert_eq(fig.axes_list().length(), 0)
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  let recreated = @pyplot.gca()
  assert_true(!ax.is_attached())
  assert_eq(recreated.artists().length(), 1)
  assert_eq(recreated.get_position().unwrap().width(), 0.5)
  assert_eq(fig.axes_list().length(), 1)
  @pyplot.close()
  @pyplot.delaxes()
  assert_eq(@pyplot.gcf().axes_list().length(), 0)
  @pyplot.close()
}

///|
test "pyplot keeps per figure selection history across cross figure sca" {
  @pyplot.close()
  let first_fig = @pyplot.figure(width=300)
  let first = @pyplot.axes()
  first.set_title("first")
  let sibling = @pyplot.axes()
  sibling.set_title("sibling")
  @pyplot.sca(first)
  let other_fig = @pyplot.figure(width=500)
  let other = @pyplot.gca()
  @pyplot.sca(sibling)
  @pyplot.delaxes()
  assert_eq(@pyplot.gca().title(), Some("first"))
  @pyplot.sca(other)
  assert_eq(@pyplot.gcf().width(), 500)
  assert_eq(first_fig.gca().title(), Some("first"))
  assert_eq(other_fig.axes_list().length(), 1)
  @pyplot.close()
}

///|
test "pyplot subplot convenience retains its first panel selection" {
  @pyplot.close()
  let (fig, panels) = @pyplot.subplots(rows=1, columns=2)
  @pyplot.title("first")
  assert_eq(panels[0].title(), Some("first"))
  panels[0].remove()
  @pyplot.title("second")
  assert_eq(panels[1].title(), Some("second"))
  assert_eq(fig.gca().title(), Some("second"))
  @pyplot.close()
}
