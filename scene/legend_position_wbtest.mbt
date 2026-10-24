///|
test "legend placement is a backend-independent per-panel render snapshot" {
  let fig = figure()
  let panels = fig.subplots(1, 2)
  panels[0].set_legend([legend_entry("first")])
  panels[0].set_legend_position(UpperLeft)
  panels[1].set_legend([legend_entry("second")])
  panels[1].set_legend_position(LowerRight)
  let retained = fig.to_render_figure()
  assert_eq(retained.panels()[0].legend_position(), UpperLeft)
  assert_eq(retained.panels()[1].legend_position(), LowerRight)
  panels[0].set_legend_position(LowerLeft)
  panels[1].clear_legend()
  let current = fig.to_render_figure()
  assert_eq(current.panels()[0].legend_position(), LowerLeft)
  assert_eq(current.panels()[1].legend_position(), LowerRight)
  assert_eq(retained.panels()[0].legend_position(), UpperLeft)
  assert_eq(retained.panels()[1].legend()[0].label(), "second")
}
