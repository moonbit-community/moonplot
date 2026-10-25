///|
test "facade violin data is immutable typed summary and original KDE sampling" {
  let fig = @mathplotlib.figure(width=400, height=200)
  let stats = fig.violinplot(
    [[1.0, 2.0, 3.0, 4.0, 8.0]],
    points=5,
    showextrema=false,
    linecolor="none",
    facecolor="red",
  )
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  let info : @mathplotlib.ViolinInfo = frame.targets()[0].info.violin.unwrap()
  let part : @mathplotlib.ViolinPart = info.part
  guard part is @mathplotlib.ViolinPart::Body(index, coordinate, density) else {
    fail("expected original KDE sample")
  }
  assert_eq(
    (coordinate, density),
    (stats[0].coords()[index], stats[0].vals()[index]),
  )
  assert_eq(
    (info.group_index, info.mean, info.median, info.minimum, info.maximum),
    (0, 3.6, 3.0, 1.0, 8.0),
  )
}
