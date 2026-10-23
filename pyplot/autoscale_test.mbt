///|
test "pyplot autoscale_view preserves disabled views and nonzero margins" {
  @pyplot.close()
  ignore(@pyplot.figure())
  let ax = @pyplot.gca()
  ax.plot([10.0, 20.0], [30.0, 40.0])
  ax.set_margins(0.1, 0.2)
  ax.set_xlim(100.0, 200.0)
  @pyplot.autoscale_view(tight=true, scaley=false)
  let fixed = ax.get_xlim_checked()
  assert_eq((fixed.lower(), fixed.upper()), (100.0, 200.0))
  assert_eq(ax.margins(), (0.1, 0.2))
  assert_true(!ax.get_autoscalex_on())
  @pyplot.autoscale(axis="x")
  let automatic = ax.get_xlim_checked()
  assert_eq((automatic.lower(), automatic.upper()), (9.0, 21.0))
  assert_eq(ax.autoscale_tight(), Some(true))
  @pyplot.close()
}

///|
test "pyplot autoscale forwards None enable and keeps both coordinate switches" {
  @pyplot.close()
  ignore(@pyplot.figure())
  let ax = @pyplot.gca()
  ax.set_margins(0.1, 0.2)
  ax.set_autoscaley_on(false)
  @pyplot.autoscale(axis="x", enable=None, tight=true)
  assert_true(ax.get_autoscalex_on())
  assert_true(!ax.get_autoscaley_on())
  assert_eq(ax.margins(), (0.0, 0.0))
  assert_true(ax.x_axis().autoscale_stale())
  assert_true(ax.y_axis().autoscale_stale())
  @pyplot.close()
}
