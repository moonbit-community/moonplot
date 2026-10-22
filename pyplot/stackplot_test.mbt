///|
test "pyplot stackplot forwards layers and colors" {
  @pyplot.close()
  ignore(
    @pyplot.figure().stackplot([0.0, 1.0], [[1.0, 1.0], [2.0, 2.0]], colors=[
      "#abcdef",
    ]),
  )
  assert_true(@pyplot.render_svg().contains("#abcdef"))
}
