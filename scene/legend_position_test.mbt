///|
test "legend position applies to automatic and explicit legends and survives legend clear" {
  let fig = @scene.figure()
  let axes = fig.axes()
  assert_eq(axes.legend_position(), @scene.LegendPosition::UpperRight)
  axes.plot([0.0, 1.0], [0.0, 1.0], label="automatic")
  axes.set_legend_position(@scene.LegendPosition::LowerLeft)
  assert_eq(axes.legend_entries()[0].label(), "automatic")
  axes.set_legend([@scene.legend_entry("explicit")])
  assert_eq(axes.legend_position(), @scene.LegendPosition::LowerLeft)
  assert_eq(axes.legend_entries()[0].label(), "explicit")
  axes.clear_legend()
  assert_eq(axes.legend_position(), @scene.LegendPosition::LowerLeft)
  assert_eq(axes.legend_entries()[0].label(), "automatic")
  axes.clear()
  assert_eq(axes.legend_position(), @scene.LegendPosition::UpperRight)
  assert_eq(axes.legend_entries().length(), 0)
}

///|
test "legend positions belong to independent panels and Figure delegates to default axes" {
  let fig = @scene.figure()
  let panels = fig.subplots(1, 2)
  panels[0].set_legend_position(@scene.LegendPosition::UpperLeft)
  panels[1].set_legend_position(@scene.LegendPosition::LowerRight)
  assert_eq(panels[0].legend_position(), @scene.LegendPosition::UpperLeft)
  assert_eq(panels[1].legend_position(), @scene.LegendPosition::LowerRight)
  panels[1].clear()
  assert_eq(panels[0].legend_position(), @scene.LegendPosition::UpperLeft)
  assert_eq(panels[1].legend_position(), @scene.LegendPosition::UpperRight)
  let other = @scene.figure()
  other.set_legend_position(@scene.LegendPosition::LowerLeft)
  assert_eq(other.legend_position(), @scene.LegendPosition::LowerLeft)
  assert_eq(other.axes().legend_position(), @scene.LegendPosition::LowerLeft)
  assert_eq(panels[0].legend_position(), @scene.LegendPosition::UpperLeft)
  other.clear()
  assert_eq(other.legend_position(), @scene.LegendPosition::UpperRight)
}
