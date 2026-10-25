///|
test "empty and invisible Barbs calls retain earlier ordinary Line and previous Barbs series" {
  for previous_barbs in [false, true] {
    for mode in 0..<4 {
      let fig = figure()
      let ax = fig.axes()
      if previous_barbs {
        ax.barbs([0.0], [0.0], [1.0], [1.0], label="original")
      } else {
        ax.plot([0.0, 1.0], [0.0, 1.0], label="original")
      }
      let before = fig.to_drawing()
      let artists = fig.artists().length()
      match mode {
        0 => ax.barbs([], [], [], [], label="empty")
        1 => ax.barbs([0.0], [0.0], [0.0], [0.0], label="empty")
        2 => ax.barbs_with_options([], [], [], [], label="empty")
        _ =>
          ax.barbs_with_options(
            [0.0],
            [0.0],
            [1.0],
            [0.0],
            label="empty",
            fill_empty=false,
          )
      }
      assert_eq(fig.artists().length(), artists)
      assert_eq(fig.to_drawing().targets(), before.targets())
      assert_true(fig.to_svg_checked().contains("empty"))
      assert_eq(ax.state.val.legend_entries().map(e => e.label()), [
        "original", "empty",
      ])
    }
  }
}
