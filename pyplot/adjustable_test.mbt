///|
test "pyplot equal uses datalim while gca numeric settings remain selectable" {
  @pyplot.close()
  let fig = @pyplot.figure(width=400, height=200)
  let ax = @pyplot.axes(left=0.0, bottom=0.0, width=1.0, height=1.0)
  @pyplot.plot([0.0, 1.0], [0.0, 1.0])
  @pyplot.axis(mode="equal")
  assert_eq(ax.get_adjustable(), "datalim")
  let svg = fig.to_svg_checked()
  assert_true(svg.contains("#1f77b4"))
  assert_eq(ax.get_position().unwrap().width(), 1.0)
  assert_true(ax.get_xlim() is Some(_))
  @pyplot.axis(mode="auto")
  assert_true(ax.get_aspect() is None)
  assert_eq(ax.get_position().unwrap().width(), 1.0)
  @pyplot.close()
}

///|
test "pyplot equal rejects two shared axes before resetting existing limits" {
  @pyplot.close()
  let (fig, axes) = @pyplot.subplots(
    rows=1,
    columns=2,
    share_x=true,
    share_y=true,
  )
  axes[0].set_xlim(10.0, 20.0)
  try @pyplot.axis(mode="equal") catch {
    @core.DataError::InvalidReference(_) => ()
    _ => fail("expected shared aspect error")
  } noraise {
    _ => fail("expected shared aspect error")
  }
  assert_eq(axes[0].get_xlim().unwrap().lower(), 10.0)
  assert_eq(axes[0].get_adjustable(), "box")
  assert_true(axes[0].get_aspect() is None)
  assert_eq(fig.axes_list().length(), 2)
  @pyplot.close()
}
