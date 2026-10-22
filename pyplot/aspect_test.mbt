///|
test "numeric aspect through gca follows selection and existing axis modes" {
  @pyplot.close()
  let (fig, axes) = @pyplot.subplots(rows=1, columns=2, share_x=true)
  @pyplot.gca().set_aspect(2.0)
  assert_eq(axes[0].get_aspect(), Some(2.0))
  assert_true(axes[1].get_aspect() is None)
  @pyplot.sca(axes[1])
  @pyplot.gca().set_aspect(0.5, share=true)
  assert_eq(axes[0].get_aspect(), Some(0.5))
  @pyplot.axis(mode="equal")
  assert_eq(axes[1].get_aspect(), Some(1.0))
  assert_eq(axes[0].get_aspect(), Some(0.5))
  @pyplot.axis(mode="auto")
  assert_true(axes[1].get_aspect() is None)
  assert_eq(fig.axes_list().length(), 2)
  @pyplot.close()
}
