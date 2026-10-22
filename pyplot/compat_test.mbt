///|
test "pyplot compatibility aliases keep the current figure" {
  ignore(@pyplot.figure(width=280, height=180))
  @pyplot.suptitle("compat")
  @pyplot.plot([0.0, 1.0], [1.0, 0.0])
  assert_true(@pyplot.savefig().contains("compat"))
}
