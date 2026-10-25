///|
test "public errorbar invisible colors do not create center whisker or cap hits" {
  let counts = []
  for color in ["none", "transparent", "#ff000000", "#f000", " TrAnSpArEnT "] {
    let (fig, ax) = errorbar_axes()
    ax.errorbar([1.0], [4.0], yerr=[2.0], color~)
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    counts.push(frame.targets().length())
  }
  assert_eq(counts, [0, 0, 0, 0, 0])
}

///|
test "public boxplot invisible colors do not create filled box line or outlier hits" {
  let counts = []
  for horizontal in [false, true] {
    for color in ["none", "transparent", "#ff000000", "#f000", " TrAnSpArEnT "] {
      let (fig, ax) = interactive_box_axes(horizontal~)
      ignore(ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]], horizontal~, color~))
      ax.legend([])
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      counts.push(frame.targets().length())
    }
  }
  assert_eq(counts, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
}

///|
test "visible and partially transparent public statistics retain their targets" {
  for color in ["red", "#ff000001", "#f001", "rebeccapurple", "currentColor"] {
    let (error_fig, error_axes) = errorbar_axes()
    error_axes.errorbar([1.0], [4.0], yerr=[2.0], color~)
    let error_frame = error_fig.to_drawing()
    assert_eq(error_frame.targets().length(), 4)
    assert_eq(error_frame.svg(), error_fig.to_svg_checked())
    for horizontal in [false, true] {
      let (fig, ax) = interactive_box_axes(horizontal~)
      ignore(ax.boxplot([[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]], horizontal~, color~))
      ax.legend([])
      let frame = fig.to_drawing()
      assert_eq(frame.targets().length(), 7)
      assert_eq(frame.svg(), fig.to_svg_checked())
    }
  }
}
