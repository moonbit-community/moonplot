///|
test "box aspect through gca preserves selection shared siblings and cla state" {
  @pyplot.close()
  let (fig, axes) = @pyplot.subplots(
    rows=1,
    columns=2,
    share_x=true,
    share_y=true,
  )
  @pyplot.gca().set_box_aspect(aspect=1.0)
  assert_eq(axes[0].get_box_aspect(), Some(1.0))
  assert_true(axes[1].get_box_aspect() is None)
  @pyplot.cla()
  assert_eq(@pyplot.gca().get_box_aspect(), Some(1.0))
  @pyplot.sca(axes[1])
  @pyplot.gca().set_box_aspect(aspect=2.0)
  assert_eq(axes[1].get_box_aspect(), Some(2.0))
  ignore(fig.to_svg_checked())
  @pyplot.gca().set_box_aspect()
  assert_true(axes[1].get_box_aspect() is None)
  @pyplot.close()
}
