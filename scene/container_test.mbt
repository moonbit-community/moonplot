///|
test "composite plotting calls expose labeled containers" {
  let fig = @scene.figure()
  let axes = fig.axes()
  axes.bar([@core.point(0.0, 1.0)], label="bars")
  try! axes.errorbar([0.0], [1.0], yerr=[0.1], label="errors")
  ignore(try! axes.boxplot([[1.0, 2.0, 3.0]], label="boxes"))
  try! axes.quiver([0.0], [0.0], [1.0], [1.0], label="vectors")
  ignore(try! axes.violinplot([[1.0, 2.0, 3.0]], points=8, label="violins"))
  ignore(try! axes.pie([1.0, 2.0]))
  try! axes.stem([1.0], locs=[0.0], label="stems")
  let containers = axes.containers()
  assert_eq(containers.length(), 7)
  match (containers[0].kind(), containers[1].kind(), containers[2].kind()) {
    (
      @scene.ContainerKind::Bar,
      @scene.ContainerKind::ErrorBar,
      @scene.ContainerKind::BoxPlot,
    ) => ()
    _ => fail("expected bar, errorbar, and boxplot containers")
  }
  assert_eq(containers[0].label(), "bars")
  assert_eq(containers[1].label(), "errors")
  assert_eq(containers[2].label(), "boxes")
  assert_eq(containers[3].label(), "vectors")
  assert_eq(containers[4].label(), "violins")
  assert_eq(containers[5].label(), "")
  assert_eq(containers[6].label(), "stems")
  assert_eq(containers[6].artists().length(), 3)
}

///|
test "horizontal bars and histograms use bar containers" {
  let fig = @scene.figure()
  let axes = fig.axes()
  try! axes.barh([0.0], [1.0], label="horizontal")
  ignore(try! axes.hist([0.0, 1.0, 2.0], bins=2, label="histogram"))
  let containers = axes.containers()
  assert_eq(containers.length(), 2)
  match (containers[0].kind(), containers[1].kind()) {
    (@scene.ContainerKind::Bar, @scene.ContainerKind::Bar) => ()
    _ => fail("expected bar containers for barh and hist")
  }
  assert_eq(containers[0].label(), "horizontal")
  assert_eq(containers[1].label(), "histogram")
  assert_eq(containers[0].artists().length(), 1)
  assert_eq(containers[1].artists().length(), 1)
}

///|
test "containers group contour and streamplot artists" {
  let fig = @scene.figure()
  let axes = fig.axes()
  ignore(
    try! axes.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5], label="contours"),
  )
  ignore(
    try! axes.contourf(
      [[0.0, 1.0], [1.0, 2.0]],
      levels=[0.0, 1.0, 2.0],
      colors=["#abcdef", "#fedcba"],
      label="filled",
    ),
  )
  ignore(
    try! axes.tricontour(
      [0.0, 1.0, 0.0],
      [0.0, 0.0, 1.0],
      [[0, 1, 2]],
      [0.0, 1.0, 2.0],
      levels=[0.5],
      label="tri-lines",
    ),
  )
  ignore(
    try! axes.tricontourf(
      [0.0, 1.0, 0.0],
      [0.0, 0.0, 1.0],
      [[0, 1, 2]],
      [0.0, 1.0, 2.0],
      levels=[0.0, 1.0, 2.0],
      colors=["#123456", "#654321"],
      label="tri-filled",
    ),
  )
  ignore(
    try! axes.streamplot(
      [0.0, 1.0, 2.0],
      [0.0, 1.0, 2.0],
      [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
      [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
      arrows=false,
      label="flow",
    ),
  )
  let containers = axes.containers()
  assert_eq(containers.length(), 5)
  for container in containers {
    match container.kind() {
      @scene.ContainerKind::Contour => ()
      @scene.ContainerKind::Streamplot => ()
      _ => fail("expected contour or streamplot container")
    }
  }
  assert_eq(containers[0].label(), "contours")
  assert_eq(containers[1].label(), "filled")
  assert_eq(containers[2].label(), "tri-lines")
  assert_eq(containers[3].label(), "tri-filled")
  assert_eq(containers[4].label(), "flow")
  assert_true(containers[4].artists().length() > 0)
}

///|
test "container and artist arrays are copied and clearable" {
  let fig = @scene.figure()
  let axes = fig.axes()
  axes.barh([0.0], [1.0], label="bars")
  assert_eq(fig.containers().length(), 1)
  let snapshots = axes.containers()
  snapshots.clear()
  assert_eq(axes.containers().length(), 1)
  let artists = axes.containers()[0].artists()
  artists.clear()
  assert_eq(axes.containers()[0].artists().length(), 1)
  axes.clear()
  assert_eq(axes.containers().length(), 0)
  assert_eq(fig.containers().length(), 0)
}
