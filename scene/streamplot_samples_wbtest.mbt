///|
fn streamplot_sample_call(
  axes : Axes,
  seeds : Array[@core.Point],
  us : Array[Array[Double]],
  vs : Array[Array[Double]],
  colors~ : Array[Array[Double]] = [],
  widths~ : Array[Array[Double]] = [],
) -> StreamplotSet raise {
  axes.streamplot_with_style_grids(
    [0.0, 1.0, 2.0],
    [0.0, 1.0, 2.0],
    us,
    vs,
    color_values=colors,
    linewidths=widths,
    vmin=0.0,
    vmax=2.0,
    start_points=seeds,
    density=0.2,
    max_steps=6,
    minlength=0.0,
    maxlength=1.0,
    integration_direction="forward",
    broken_streamlines=false,
    arrows=false,
    label="Sampled flow",
  )
}

///|
test "streamplot rejected middle seed keeps original attempt slots and width-only styles do not invent color samples" {
  let fig = figure(width=400, height=300)
  fig.set_x_limits(0.0, 2.0)
  fig.set_y_limits(0.0, 2.0)
  let set = streamplot_sample_call(
    fig.axes(),
    [@core.point(0.25, 0.5), @core.point(0.25, 1.0), @core.point(0.25, 1.5)],
    [[1.0, 1.0, 1.0], [0.0, 0.0, 0.0], [1.0, 1.0, 1.0]],
    [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
    widths=[[1.0, 1.0, 1.0], [2.0, 2.0, 2.0], [3.0, 3.0, 3.0]],
  )
  let frame = fig.to_drawing()
  assert_eq(set.lines().length(), 12)
  assert_eq(frame.targets().length(), 12)
  assert_eq(frame.targets().map(t => t.info.streamplot.unwrap().seed_index), [
    0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2,
  ])
  for t in frame.targets() {
    let sample = t.info.streamplot.unwrap()
    assert_eq((sample.u, sample.v, sample.color_value), (0.5, 0.0, None))
  }
}

///|
test "streamplot missing style cells omit painted edges while retaining original joined edge slots" {
  let fig = figure(width=400, height=300)
  fig.set_x_limits(0.0, 2.0)
  fig.set_y_limits(0.0, 2.0)
  let nan = 0.0 / 0.0
  let set = streamplot_sample_call(
    fig.axes(),
    [@core.point(0.25, 0.5)],
    [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
    [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
    colors=[[nan, 1.0, 2.0], [nan, 1.0, 2.0], [nan, 1.0, 2.0]],
  )
  let frame = fig.to_drawing()
  assert_eq(set.lines().length(), 2)
  assert_eq(frame.targets().map(t => t.info.point.point_index), [4, 5])
  assert_eq(frame.targets().map(t => t.info.point.artist_index), [0, 1])
  for t in frame.targets() {
    assert_eq(t.info.streamplot.unwrap().color_value, Some(t.info.point.data_x))
  }
}

///|
test "streamplot stores old bilinear midpoint UV and same-evaluation raw color independently from later source grid mutation" {
  let fig = figure(width=400, height=300)
  fig.set_x_limits(0.0, 2.0)
  fig.set_y_limits(0.0, 2.0)
  let us = [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]]
  let vs = [[0.25, 0.25, 0.25], [0.25, 0.25, 0.25], [0.25, 0.25, 0.25]]
  let colors = [[3.0, 4.0, 5.0], [5.0, 6.0, 7.0], [7.0, 8.0, 9.0]]
  let widths = [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]]
  ignore(
    streamplot_sample_call(
      fig.axes(),
      [@core.point(0.25, 0.5)],
      us,
      vs,
      colors~,
      widths~,
    ),
  )
  let before = fig.to_drawing()
  assert_eq(before.targets().length(), 6)
  for t in before.targets() {
    let p = t.info.point
    let s = t.info.streamplot.unwrap()
    assert_eq((s.u, s.v, t.info.value), (1.0, 0.25, 0.25))
    assert_true(
      (s.color_value.unwrap() - (3.0 + p.data_x + 2.0 * p.data_y)).abs() <
      1.0e-12,
    )
    guard fig.artists()[p.artist_index] is Line(points, _) else { fail("Line") }
    assert_eq(
      (p.data_x, p.data_y),
      (
        (points[0].x() + points[1].x()) / 2.0,
        (points[0].y() + points[1].y()) / 2.0,
      ),
    )
  }
  us[0][0] = 900.0
  vs[0][0] = 800.0
  colors[0][0] = 700.0
  widths[0][0] = 0.0
  let after = fig.to_drawing()
  assert_eq(after.targets(), before.targets())
  assert_eq(after.svg(), before.svg())
}

///|
test "streamplot unavailable midpoint field samples keep actual strokes static rather than creating generic observations" {
  let fig = figure(width=400, height=300)
  fig.set_x_limits(0.0, 1.0)
  fig.set_y_limits(0.0, 1.0)
  let axes = fig.axes()
  let line = [@core.point(0.25, 0.5), @core.point(0.75, 0.5)]
  let us = [[1.0e308, -1.0e308], [1.0e308, -1.0e308]]
  let vs = [[0.0, 0.0], [0.0, 0.0]]
  ignore(
    stream_line_artists(
      axes,
      [0.0, 1.0],
      [0.0, 1.0],
      us,
      vs,
      line,
      1.0,
      "purple",
      None,
      None,
      None,
      None,
      5,
      "Unsampled",
    ),
  )
  let frame = fig.to_drawing()
  assert_eq(fig.artists().length(), 1)
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.targets().length(), 0)
  assert_true(
    streamplot_sample_datum(
      [0.0, 1.0],
      [0.0, 1.0],
      us,
      vs,
      @core.point(1.0 / 0.0, 0.5),
      0,
      5,
      None,
    )
    is None,
  )
}

///|
test "streamplot original joined trajectory edge slots cover both backward and forward integration" {
  let fig = figure(width=400, height=300)
  let set = fig.streamplot(
    [0.0, 1.0, 2.0],
    [0.0, 1.0, 2.0],
    [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]],
    [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]],
    density=0.2,
    max_steps=6,
    minlength=0.0,
    maxlength=1.0,
    start_points=[@core.point(1.0, 1.0)],
    integration_direction="both",
    broken_streamlines=false,
    arrows=false,
    label="Joined",
  )
  guard set.lines()[0] is Line(points, _) else { fail("Line") }
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), points.length() - 1)
  assert_true(points[0].x() < 1.0 && points[points.length() - 1].x() > 1.0)
  for i, t in frame.targets() {
    assert_eq(t.info.point.point_index, i)
    assert_eq(t.info.point.data_x, (points[i].x() + points[i + 1].x()) / 2.0)
    assert_eq(t.info.streamplot.unwrap().seed_index, 0)
  }
}
