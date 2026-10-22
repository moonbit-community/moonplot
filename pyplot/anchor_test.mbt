///|
test "anchor through gca follows selection sharing and cla lifecycle" {
  @pyplot.close()
  let (fig, axes) = @pyplot.subplots(rows=1, columns=2, share_x=true)
  @pyplot.gca().set_anchor(@scene.Anchor::Named("SW"))
  assert_true(axes[0].get_anchor() is @scene.Anchor::Named("SW"))
  assert_true(axes[1].get_anchor() is @scene.Anchor::Named("C"))
  @pyplot.sca(axes[1])
  @pyplot.gca().set_aspect(2.0, anchor=@scene.Anchor::Named("NE"), share=true)
  assert_true(axes[0].get_anchor() is @scene.Anchor::Named("NE"))
  @pyplot.cla()
  assert_true(@pyplot.gca().get_anchor() is @scene.Anchor::Named("NE"))
  @pyplot.axis(mode="equal")
  assert_true(@pyplot.gca().get_anchor() is @scene.Anchor::Named("NE"))
  assert_eq(fig.axes_list().length(), 2)
  @pyplot.clf()
  assert_true(@pyplot.gca().get_anchor() is @scene.Anchor::Named("C"))
  @pyplot.close()
}
