///|
test "tripcolor empty calls preserve preceding series and the static automatic legend" {
  for wrapper in [false, true] {
    for masked in [false, true] {
      let fig = figure()
      let ax = fig.axes()
      ax.plot([0.0, 1.0], [0.0, 1.0], label="Original")
      let before = fig.to_drawing().targets()
      let xs = [0.0, 1.0, 0.0]
      let ys = [0.0, 0.0, 1.0]
      let triangles = [[0, 1, 2]]
      let mask = [masked]
      let values = [if masked { 2.0 } else { 0.0 / 0.0 }]
      if wrapper {
        let mesh = triangulation(xs, ys, triangles~, mask~)
        ax.tripcolor_triangulation(mesh, values, label="Empty")
      } else {
        ax.tripcolor(xs, ys, triangles, values, mask~, label="Empty")
      }
      assert_eq(fig.artists().length(), 1)
      assert_eq(ax.legend_entries().map(e => e.label()), ["Original", "Empty"])
      assert_eq(fig.to_drawing().targets(), before)
    }
  }
}
