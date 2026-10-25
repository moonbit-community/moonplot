///|
test "hexbin mapped convexity validates the two-quad decomposition in either orientation" {
  let vertices = [
    (80.0, 40.0),
    (50.0, 20.0),
    (20.0, 40.0),
    (20.0, 60.0),
    (50.0, 80.0),
    (80.0, 60.0),
  ]
  assert_true(valid_hexbin_screen(vertices))
  let reversed = [
    vertices[5],
    vertices[4],
    vertices[3],
    vertices[2],
    vertices[1],
    vertices[0],
  ]
  assert_true(valid_hexbin_screen(reversed))
  assert_true(!valid_hexbin_screen(vertices[:5].to_owned()))
  assert_true(
    !valid_hexbin_screen([
      (0.0, 0.0),
      (1.0, 0.0),
      (2.0, 0.0),
      (3.0, 0.0),
      (4.0, 0.0),
      (5.0, 0.0),
    ]),
  )
  let concave = vertices.copy()
  concave[1] = (50.0, 55.0)
  assert_true(!valid_hexbin_screen(concave))
  let crossing = [
    vertices[0],
    vertices[2],
    vertices[4],
    vertices[1],
    vertices[3],
    vertices[5],
  ]
  assert_true(!valid_hexbin_screen(crossing))
  let repeated = vertices.copy()
  repeated[1] = repeated[0]
  assert_true(!valid_hexbin_screen(repeated))
  for invalid in [0.0 / 0.0, 1.0 / 0.0] {
    let invalid_vertices = vertices.copy()
    invalid_vertices[0] = (invalid, 40.0)
    assert_true(!valid_hexbin_screen(invalid_vertices))
  }
}

///|
test "hexbin actual vertex capture excludes incomplete faces and leaves centers outside the viewport valid" {
  let scale : Scale = {
    xmin: 1.2,
    xmax: 2.0,
    ymin: 0.0,
    ymax: 3.0,
    x_axis_scale: @ticker_scale.linear_scale(),
    y_axis_scale: @ticker_scale.linear_scale(),
  }
  let vertices = [
    @core.point(1.8, 1.0),
    @core.point(1.0, 0.5),
    @core.point(0.2, 1.0),
    @core.point(0.2, 2.0),
    @core.point(1.0, 2.5),
    @core.point(1.8, 2.0),
  ]
  let metadata = @render.hit_metadata(
    "Bins",
    hexbin=Some(
      @render.hexbin_hit_data(
        4,
        @core.point(1.0, 1.5),
        8.0,
        @drawing.hexbin_info(2, 3, 2, reduction=Sum),
      ),
    ),
  )
  let capture : DrawingCapture = {
    points: [],
    targets: [],
    exclusions: [],
    polar_circles: [],
  }
  collect_drawing_hexbin(
    capture,
    0,
    0,
    vertices,
    scale,
    (0.0, 0.0, 400.0, 200.0),
    metadata,
    @core.style("red"),
  )
  assert_eq(capture.points.length(), 1)
  assert_eq(capture.targets.length(), 2)
  assert_true(capture.points[0].screen_x < 0.0)
  let frame = @drawing.drawing(
    400,
    200,
    "",
    capture.points,
    targets=capture.targets,
  )
  let point = frame.hit_test(100.0, 100.0, radius=0.0).unwrap()
  assert_eq((point.data_x, point.data_y, point.point_index), (1.0, 1.5, 4))
  assert_eq(frame.hit_info(point).unwrap().series, "Bins")
  for
    input in [
      vertices[:5].to_owned(),
      [
        vertices[0],
        vertices[0],
        vertices[2],
        vertices[3],
        vertices[4],
        vertices[5],
      ],
    ] {
    let invalid : DrawingCapture = {
      points: [],
      targets: [],
      exclusions: [],
      polar_circles: [],
    }
    collect_drawing_hexbin(
      invalid,
      0,
      0,
      input,
      scale,
      (0.0, 0.0, 400.0, 200.0),
      metadata,
      @core.style("red"),
    )
    assert_eq(invalid.targets.length(), 0)
  }
  let outside_scale : Scale = { ..scale, xmin: 2.0, xmax: 3.0, }
  let outside : DrawingCapture = {
    points: [],
    targets: [],
    exclusions: [],
    polar_circles: [],
  }
  collect_drawing_hexbin(
    outside,
    0,
    0,
    vertices,
    outside_scale,
    (0.0, 0.0, 400.0, 200.0),
    metadata,
    @core.style("red"),
  )
  assert_eq(outside.points.length(), 0)
  assert_eq(outside.targets.length(), 0)
}
