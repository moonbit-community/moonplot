///|
test "removing axes preserves survivor order and removes their SVG and legends" {
  let fig = @scene.figure(width=400, height=300)
  let panels = fig.subplots(1, 3)
  for index, ax in panels {
    ax.set_title("panel-\{index}")
  }
  panels[0].plot([0.0, 1.0], [0.0, 1.0], color="#123456", label="keep-line")
  panels[1].scatter(
    [@core.point(0.5, 0.5)],
    color="#abcdef",
    label="remove-dot",
  )
  panels[2].plot([0.0, 1.0], [1.0, 0.0], color="#654321")
  let same_panel = fig.axes_list()[1]
  let retained = panels[2].get_position(original=true).unwrap()
  same_panel.remove()
  assert_eq(fig.axes_list().map(ax => ax.title()), [
    Some("panel-0"),
    Some("panel-2"),
  ])
  assert_true(!panels[1].is_attached())
  assert_eq(panels[1].artists().length(), 1)
  assert_eq(panels[1].legend_entries().length(), 1)
  assert_eq(panels[2].get_position(original=true).unwrap().x(), retained.x())
  let svg = fig.to_svg()
  assert_true(svg.contains("#123456"))
  assert_true(svg.contains("#654321"))
  assert_true(!svg.contains("#abcdef"))
  assert_true(!svg.contains("remove-dot"))
  assert_true(!svg.contains("panel-1"))
  assert_true(svg.find("#123456").unwrap() < svg.find("#654321").unwrap())
}

///|
test "foreign stale and repeated axes removals are atomic" {
  let fig = @scene.figure()
  let panels = fig.subplots(1, 2)
  panels[0].set_title("first")
  panels[1].set_title("second")
  let foreign = @scene.figure().axes()
  let before = fig.to_svg()
  try fig.delaxes(foreign) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  try fig.sca(foreign) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  assert_eq(fig.to_svg(), before)
  assert_eq(fig.gca().title(), Some("second"))
  assert_true(foreign.is_attached())
  panels[0].remove()
  let after = fig.to_svg()
  try panels[0].remove() catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  try fig.delaxes(panels[0]) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  try fig.sca(panels[0]) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  assert_eq(fig.to_svg(), after)
  let stale = fig.axes()
  ignore(fig.subplots(1, 2))
  try stale.remove() catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  assert_eq(fig.axes_list().length(), 2)
}

///|
test "empty figure draws without recreating axes and gca uses adjusted bounds" {
  let fig = @scene.figure(width=400, height=200)
  fig.set_title("figure stays")
  fig.subplots_adjust(left=0.25, bottom=0.25, right=0.75, top=0.75)
  let removed = fig.axes()
  removed.remove()
  assert_eq(fig.axes_list().length(), 0)
  assert_eq(fig.get_axes().length(), 0)
  let svg = fig.to_svg()
  assert_true(svg.contains("figure stays"))
  assert_true(!svg.contains("clipPath"))
  assert_eq(fig.axes_list().length(), 0)
  let next = fig.gca()
  assert_true(next.is_attached())
  assert_true(!removed.is_attached())
  assert_true(next.get_subplotspec() is Some(_))
  let p = next.get_position(original=true).unwrap()
  assert_eq((p.x(), p.y(), p.width(), p.height()), (0.25, 0.25, 0.5, 0.5))
  assert_eq(fig.axes_list().length(), 1)
}

///|
test "default figure plotting recreates one axes after the last is removed" {
  let fig = @scene.figure()
  fig.axes().remove()
  fig.plot([0.0, 1.0], [0.0, 1.0])
  assert_eq(fig.axes_list().length(), 1)
  assert_eq(fig.axes().artists().length(), 1)
  assert_eq(fig.gca().artists().length(), 1)
  fig.axes().remove()
  fig.set_xlabel("new axis")
  assert_eq(fig.axes_list().length(), 1)
  assert_eq(fig.gca().get_xlabel(), Some("new axis"))
}

///|
test "figure selection history is independent from creation and drawing order" {
  let fig = @scene.figure()
  let panels = fig.subplots(1, 4)
  for index, ax in panels {
    ax.set_title("panel-\{index}")
  }
  assert_eq(fig.gca().title(), Some("panel-3"))
  let before = fig.to_svg()
  assert_eq(fig.sca(panels[0]).title(), Some("panel-0"))
  ignore(fig.sca(panels[2]))
  assert_eq(fig.to_svg(), before)
  assert_eq(fig.axes().title(), Some("panel-0"))
  panels[1].remove()
  assert_eq(fig.gca().title(), Some("panel-2"))
  panels[2].remove()
  assert_eq(fig.gca().title(), Some("panel-0"))
  panels[0].remove()
  assert_eq(fig.gca().title(), Some("panel-3"))
  let manual = fig.add_axes(0.0, 0.0, 0.5, 0.5)
  manual.set_title("manual")
  assert_eq(fig.gca().title(), Some("manual"))
  manual.remove()
  assert_eq(fig.gca().title(), Some("panel-3"))
}

///|
test "removed shared axes keep ticker aliases while limits scales and margins separate" {
  let fig = @scene.figure()
  let panels = fig.subplots(1, 3, share_x=true, share_y=true)
  panels[0].set_xlim(1.0, 10.0)
  panels[0].set_ylim(2.0, 20.0)
  panels[0].set_xticks([1.0, 10.0])
  panels[0].set_xticklabels(["one", "ten"])
  panels[1].remove()
  panels[1].set_xlim(100.0, 200.0)
  panels[1].set_ylim(300.0, 400.0)
  panels[1].set_x_scale(@scale.log_scale())
  panels[1].set_xticks([100.0])
  panels[1].set_xticklabels(["detached"])
  panels[1].set_x_margin(0.75)
  for index in [0, 2] {
    let limits = panels[index].get_xlim().unwrap()
    assert_eq((limits.lower(), limits.upper()), (1.0, 10.0))
    assert_true(!panels[index].x_scale().is_log())
    assert_eq(panels[index].margins().0, 0.05)
  }
  panels[0].set_xlim(5.0, 15.0)
  assert_eq(panels[2].get_xlim().unwrap().lower(), 5.0)
  assert_eq(panels[1].get_xlim().unwrap().lower(), 100.0)
  // Figure._remove_axes breaks group membership, retaining the shared Ticker.
  // The detached axis can still replace its aliased tick positions and labels.
  for index in [0, 2] {
    let axis = panels[index].x_axis()
    assert_eq(axis.ticks(), Some([100.0]))
    assert_true(!axis.is_default_locator())
    assert_true(!axis.is_default_formatter())
    assert_eq(axis.tick_labels_checked([100.0]), ["detached"])
  }
  let svg = fig.to_svg()
  assert_true(!svg.contains(">detached<"))
  // The shared raw tick is now100; visibility still uses the survivor's[5,15].
  assert_true(!svg.contains(">ten<"))
  assert_true(!svg.contains(">one<"))
}

///|
test "removed shared data stops contributing to autoscale and active geometry" {
  let fig = @scene.figure(width=400, height=200)
  fig.subplots_adjust(left=0.0, bottom=0.0, right=1.0, top=1.0, wspace=0.0)
  let panels = fig.subplots(1, 2, share_x=true, share_y=true)
  panels[0].plot([0.0, 1.0], [0.0, 1.0])
  panels[1].plot([0.0, 1.0], [0.0, 100.0])
  panels[0].set_margins(0.0, 0.0)
  panels[0].set_aspect_equal()
  assert_true(panels[0].get_position().unwrap().width() < 0.01)
  panels[1].remove()
  // Figure._remove_axes changes membership and ticker ownership, retaining
  // the existing shared view until an actual autoscale request is made.
  assert_true(panels[0].get_position().unwrap().width() < 0.01)
  panels[0].request_autoscale_view()
  let rect = panels[0].get_position().unwrap()
  assert_eq(
    (rect.x(), rect.y(), rect.width(), rect.height()),
    (0.0, 0.0, 0.5, 1.0),
  )
  assert_true(fig.to_svg().contains("points=\"0,200 200,0\""))
  panels[1].plot([0.0, 1.0], [0.0, 1000.0])
  assert_eq(panels[0].get_position().unwrap().width(), 0.5)
}

///|
test "nested subfigure membership tracks removal through every entry point" {
  let fig = @scene.figure()
  let grid = fig.grid_spec(1, 1)
  let outer = fig.add_subfigure(grid.cell_spec(0, 0))
  let direct_axes = outer.subplots(1, 1)[0]
  let inner_grid = outer.subplot_spec().subgridspec(1, 1)
  let child = outer.add_subfigure(inner_grid.cell_spec(0, 0))
  let nested = child.subplots(1, 2)
  let aliases = fig.subfigures()[0].subfigures()[0]
  try outer.delaxes(nested[0]) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  try child.delaxes(direct_axes) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  assert_eq(fig.axes_list().length(), 3)
  nested[0].remove()
  assert_eq(child.axes_list().length(), 1)
  assert_eq(aliases.axes_list().length(), 1)
  fig.delaxes(nested[1])
  assert_eq(child.get_axes().length(), 0)
  outer.delaxes(direct_axes)
  assert_eq(outer.axes_list().length(), 0)
  assert_eq(fig.axes_list().length(), 0)
  try outer.delaxes(direct_axes) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
}

///|
test "subplot replacement clears selection history and hides stale nested members" {
  let fig = @scene.figure()
  let grid = fig.grid_spec(1, 1)
  let sub = fig.add_subfigure(grid.cell_spec(0, 0))
  let old = sub.subplots(1, 2)
  ignore(fig.sca(old[0]))
  let panels = fig.subplots(1, 2)
  panels[1].set_title("replacement")
  assert_eq(fig.gca().title(), Some("replacement"))
  assert_eq(sub.axes_list().length(), 0)
  try sub.delaxes(old[0]) catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected InvalidReference")
  } noraise {
    _ => fail("expected InvalidReference")
  }
  assert_eq(fig.axes_list().length(), 2)
}
