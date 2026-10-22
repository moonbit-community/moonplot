///|
test "pyplot exposes per-point scatter collections" {
  ignore(@pyplot.figure(width=300, height=200))
  let collection = try! @pyplot.scatter_collection(
    [0.0, 1.0],
    [1.0, 0.0],
    colors=["#123456", "#654321"],
    sizes=[4.0, 16.0],
    label="samples",
  )
  assert_eq(collection.length(), 2)
  assert_eq(@pyplot.get_legend_handles_labels().length(), 1)
  assert_true(@pyplot.render_svg().contains("#123456"))
}
