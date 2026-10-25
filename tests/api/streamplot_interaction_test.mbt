///|
test "facade Streamplot exposes readonly generated field metadata while retaining one complete Container" {
  let typed : @mathplotlib.StreamplotInfo = @mathplotlib.streamplot_info(
    4,
    1.0,
    -2.0,
    color_value=Some(7.0),
  )
  assert_eq(
    (typed.seed_index, typed.u, typed.v, typed.color_value),
    (4, 1.0, -2.0, Some(7.0)),
  )
  let fig = @mathplotlib.figure(width=400, height=300)
  let set = fig.streamplot(
    [0.0, 1.0],
    [0.0, 1.0],
    [[1.0, 1.0], [1.0, 1.0]],
    [[0.0, 0.0], [0.0, 0.0]],
    density=0.2,
    max_steps=4,
    minlength=0.0,
    maxlength=1.0,
    start_points=[@mathplotlib.point(0.25, 0.5)],
    integration_direction="forward",
    broken_streamlines=false,
    arrows=true,
    label="Public flow",
  )
  let frame = fig.to_drawing()
  assert_eq(fig.containers().length(), 1)
  assert_eq(set.lines().length(), 1)
  assert_true(frame.targets().length() > 0)
  for target in frame.targets() {
    let info : @mathplotlib.HitInfo = target.info
    assert_eq(
      (info.kind, info.series, info.value),
      (@mathplotlib.HitKind::Streamplot, "Public flow", 0.0),
    )
    assert_eq(
      info.streamplot.unwrap(),
      @mathplotlib.streamplot_info(0, 1.0, 0.0),
    )
    assert_eq((info.cell, info.vector, info.interval), (None, None, None))
  }
}
