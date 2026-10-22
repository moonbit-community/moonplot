///|
test "single-color artists use the axes property cycle" {
  let fig = @scene.figure(width=320, height=240)
  let axes = fig.axes()
  try! axes.set_color_cycle(["#101010", "#202020", "#303030"])
  try! axes.arrow(0.0, 0.0, 1.0, 0.0)
  try! axes.axhspan(0.2, 0.4)
  try! axes.spy([[1.0, 0.0], [0.0, 1.0]])
  let artists = fig.artists()
  match artists[0] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#101010")
    _ => fail("arrow should start with a line artist")
  }
  match artists[2] {
    @scene.Artist::HSpan(_, _, style) => assert_eq(style.fill(), "#202020")
    _ => fail("axhspan should add a horizontal span")
  }
  match artists[3] {
    @scene.Artist::Scatter(_, style) => assert_eq(style.color(), "#303030")
    _ => fail("spy should add a scatter artist")
  }
}

///|
test "contour, triangle, streamplot, and violin consume one cycle color" {
  let fig = @scene.figure(width=360, height=260)
  let axes = fig.axes()
  try! axes.set_color_cycle(["#111111", "#222222", "#333333", "#444444"])
  let contour = try! axes.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  ignore(contour)
  match fig.artists()[0] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#111111")
    _ => fail("contour should add line artists")
  }
  let before_triplot = fig.artists().length()
  try! axes.triplot([0.0, 1.0, 0.0], [0.0, 0.0, 1.0], [[0, 1, 2]])
  match fig.artists()[before_triplot] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#222222")
    _ => fail("triplot should add line artists")
  }
  let stream = try! axes.streamplot(
    [0.0, 1.0, 2.0],
    [0.0, 1.0, 2.0],
    [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
    [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
    density=0.1,
    minlength=0.0,
    max_steps=3,
    arrows=false,
    broken_streamlines=false,
  )
  assert_true(stream.lines().length() > 0)
  match stream.lines()[0] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#333333")
    _ => fail("streamplot should return line artists")
  }
  let stats = try! axes.violinplot([[1.0, 2.0, 3.0]], points=8)
  ignore(stats)
  match fig.artists()[fig.artists().length() - 1] {
    @scene.Artist::Violin(_, _, _, _, _, _, _, _, body, edge, _) => {
      assert_eq(body.fill(), "#444444")
      assert_eq(edge.color(), "#444444")
    }
    _ => fail("violinplot should add a violin artist")
  }
}

///|
test "quiverkey resolves one cycle color for its arrow and label" {
  let fig = @scene.figure(width=320, height=240)
  let axes = fig.axes()
  try! axes.set_color_cycle(["#ababab", "#cdcdcd"])
  try! axes.quiverkey(0.0, 0.0, 1.0, "u")
  axes.plot([0.0, 1.0], [0.0, 1.0])
  let artists = fig.artists()
  match artists[0] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#ababab")
    _ => fail("quiverkey should start with an arrow line")
  }
  match artists[3] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#cdcdcd")
    _ => fail("the next plot should use the next cycle color")
  }
}

///|
test "explicit colors preserve the next cycle item for migrated artists" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! axes.set_color_cycle(["#121212", "#343434"])
  try! axes.triplot(
    [0.0, 1.0, 0.0],
    [0.0, 0.0, 1.0],
    [[0, 1, 2]],
    color="#fedcba",
  )
  axes.plot([0.0, 1.0], [0.0, 1.0])
  match fig.artists()[1] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#121212")
    _ =>
      fail("plot should keep the first cycle color after an explicit triplot")
  }
}

///|
test "reference lines also use one shared cycle color per call" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! axes.set_color_cycle(["#515151", "#626262", "#737373"])
  try! axes.hlines([0.2, 0.4], 0.0, 1.0)
  try! axes.axvline(0.5)
  try! axes.axline(@core.point(0.0, 0.0), slope=1.0)
  let artists = fig.artists()
  match artists[0] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#515151")
    _ => fail("hlines should add line artists")
  }
  match artists[2] {
    @scene.Artist::VLine(_, style) => assert_eq(style.color(), "#626262")
    _ => fail("axvline should add a vertical line")
  }
  match artists[3] {
    @scene.Artist::AxLine(_, _, style) => assert_eq(style.color(), "#737373")
    _ => fail("axline should add an infinite line")
  }
}

///|
test "pie uses one cycle item per default slice and explicit colors preserve it" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! axes.set_color_cycle(["#818181", "#929292", "#a3a3a3"])
  ignore(try! axes.pie([1.0, 1.0]))
  match fig.artists()[0] {
    @scene.Artist::Pie(_, _, colors, _) =>
      assert_eq(colors, ["#818181", "#929292"])
    _ => fail("pie should add a pie artist")
  }
  axes.plot([0.0, 1.0], [0.0, 1.0])
  match fig.artists()[1] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#a3a3a3")
    _ => fail("plot should use the next color after pie slices")
  }
  let explicit = @scene.figure()
  try! explicit.axes().set_color_cycle(["#111111"])
  ignore(try! explicit.axes().pie([1.0, 1.0], colors=["#abcdef", "#fedcba"]))
  explicit.axes().plot([0.0, 1.0], [0.0, 1.0])
  match explicit.artists()[1] {
    @scene.Artist::Line(_, style) => assert_eq(style.color(), "#111111")
    _ => fail("explicit pie colors should not consume the cycle")
  }
}
