///|
test "empty and rejected streamplot preserve earlier series legend and one empty Container" {
  for stagnant in [false, true] {
    let fig = figure()
    let ax = fig.axes()
    ax.plot([0.0, 1.0], [0.0, 1.0], label="Original")
    let before = fig.to_drawing().targets()
    let result = ax.streamplot(
      [0.0, 1.0],
      [0.0, 1.0],
      if stagnant {
        [[0.0, 0.0], [0.0, 0.0]]
      } else {
        [[1.0, 1.0], [1.0, 1.0]]
      },
      [[0.0, 0.0], [0.0, 0.0]],
      density=0.2,
      max_steps=2,
      minlength=10.0,
      maxlength=1.0,
      start_points=[@core.point(0.25, 0.5)],
      integration_direction="forward",
      arrows=false,
      label="Empty",
    )
    assert_eq(result.lines().length(), 0)
    assert_eq(result.arrows().length(), 0)
    assert_eq(fig.artists().length(), 1)
    assert_eq(fig.containers().length(), 1)
    assert_eq(fig.containers()[0].artists().length(), 0)
    assert_eq(ax.legend_entries().map(e => e.label()), ["Original", "Empty"])
    assert_eq(fig.to_drawing().targets(), before)
  }
}
