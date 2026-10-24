///|
test "masked image example" {
  let data = try! @mathplotlib.masked_matrix([[1.0, 1000.0, 2.0]], mask=[
    [false, true, false],
  ])
  let fig = @mathplotlib.figure(width=280, height=180)
  try! fig.imshow_masked(data, cmap="gray")
  let _svg = fig.to_svg()
  assert_true(_svg.contains("<svg"))
}
