// Original Bbox path and AxesImage extent minpos observations.

///|
test "Log artist minpos original Bbox 0: interior positive" {
  let points = [
    @core.point(-2.0, 1.0),
    @core.point(0.001, 1.0),
    @core.point(100.0, 1.0),
  ]
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], true),
    0.001,
  )
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], false),
    1.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], true),
    0.001,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], false),
    1.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], true),
    0.001,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], false),
    1.0,
  )
}

///|
test "Log artist minpos original Bbox 1: other finite negative remains data" {
  let points = [
    @core.point(10.0, -2.0),
    @core.point(20.0, 0.01),
    @core.point(40.0, 4.0),
  ]
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], true),
    10.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], false),
    0.01,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], true),
    10.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], false),
    0.01,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], true),
    10.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], false),
    0.01,
  )
}

///|
test "Log artist minpos original Bbox 2: paired nonfinite" {
  let points = [
    @core.point(-2.0, 1.0),
    @core.point(0.001, 2.0),
    @core.point(100.0, 3.0),
    @core.point(1.0e-09, 1.0 / 0.0),
    @core.point(0.0 / 0.0, 1.0e-12),
  ]
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], true),
    0.001,
  )
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], false),
    1.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], true),
    0.001,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], false),
    1.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], true),
    0.001,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], false),
    1.0,
  )
}

///|
test "Log artist minpos original Bbox 3: no positives" {
  let points = [
    @core.point(-4.0, -3.0),
    @core.point(-2.0, -1.0),
    @core.point(0.0, 0.0),
  ]
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], true),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], false),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], true),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], false),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], true),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], false),
    1.0 / 0.0,
  )
}

///|
test "Log artist minpos original Bbox 4: subnormal positives" {
  let points = [@core.point(5.0e-324, 1.0), @core.point(1.0, 5.0e-324)]
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], true),
    5.0e-324,
  )
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], false),
    5.0e-324,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], true),
    5.0e-324,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], false),
    5.0e-324,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], true),
    5.0e-324,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], false),
    5.0e-324,
  )
}

///|
test "Log artist minpos original Bbox 5: empty data" {
  let points = []
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], true),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Line(points, @core.style("red"))], false),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], true),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Scatter(points, @core.style("red"))], false),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], true),
    1.0 / 0.0,
  )
  assert_eq(
    artist_minpos([@render.Artist::Polygon(points, @core.style("red"))], false),
    1.0 / 0.0,
  )
}

///|
test "Log artist minpos original image extent 0" {
  let pixel = @colors.rgba(1.0, 1.0, 1.0)
  let image = @render.Artist::ColorImage(
    [[pixel, pixel, pixel], [pixel, pixel, pixel]],
    @render.ImageOrigin::Upper,
    None,
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  assert_eq(artist_minpos([image], true), 2.5)
  assert_eq(artist_minpos([image], false), 1.5)
}

///|
test "Log artist minpos original image extent 1" {
  let pixel = @colors.rgba(1.0, 1.0, 1.0)
  let image = @render.Artist::ColorImage(
    [[pixel, pixel, pixel], [pixel, pixel, pixel]],
    @render.ImageOrigin::Upper,
    Some((-2.0, 8.0, -0.1, 4.0)),
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  assert_eq(artist_minpos([image], true), 8.0)
  assert_eq(artist_minpos([image], false), 4.0)
}

///|
test "Log artist minpos original image extent 2" {
  let pixel = @colors.rgba(1.0, 1.0, 1.0)
  let image = @render.Artist::ColorImage(
    [[pixel, pixel, pixel], [pixel, pixel, pixel]],
    @render.ImageOrigin::Upper,
    Some((8.0, -2.0, 4.0, -0.1)),
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  assert_eq(artist_minpos([image], true), 8.0)
  assert_eq(artist_minpos([image], false), 4.0)
}

///|
test "Log artist minpos original image extent 3" {
  let pixel = @colors.rgba(1.0, 1.0, 1.0)
  let image = @render.Artist::ColorImage(
    [[pixel, pixel, pixel], [pixel, pixel, pixel]],
    @render.ImageOrigin::Upper,
    Some((-8.0, -2.0, -4.0, -0.1)),
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  assert_eq(artist_minpos([image], true), 1.0 / 0.0)
  assert_eq(artist_minpos([image], false), 1.0 / 0.0)
}

///|
test "Log artist minpos original image extent 4" {
  let pixel = @colors.rgba(1.0, 1.0, 1.0)
  let image = @render.Artist::ColorImage(
    [[pixel, pixel, pixel], [pixel, pixel, pixel]],
    @render.ImageOrigin::Lower,
    None,
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  assert_eq(artist_minpos([image], true), 2.5)
  assert_eq(artist_minpos([image], false), 1.5)
}

///|
test "Log artist minpos original image extent 5" {
  let pixel = @colors.rgba(1.0, 1.0, 1.0)
  let image = @render.Artist::ColorImage(
    [[pixel, pixel, pixel], [pixel, pixel, pixel]],
    @render.ImageOrigin::Lower,
    Some((-2.0, 8.0, -0.1, 4.0)),
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  assert_eq(artist_minpos([image], true), 8.0)
  assert_eq(artist_minpos([image], false), 4.0)
}

///|
test "Log artist minpos original image extent 6" {
  let pixel = @colors.rgba(1.0, 1.0, 1.0)
  let image = @render.Artist::ColorImage(
    [[pixel, pixel, pixel], [pixel, pixel, pixel]],
    @render.ImageOrigin::Lower,
    Some((8.0, -2.0, 4.0, -0.1)),
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  assert_eq(artist_minpos([image], true), 8.0)
  assert_eq(artist_minpos([image], false), 4.0)
}

///|
test "Log artist minpos original image extent 7" {
  let pixel = @colors.rgba(1.0, 1.0, 1.0)
  let image = @render.Artist::ColorImage(
    [[pixel, pixel, pixel], [pixel, pixel, pixel]],
    @render.ImageOrigin::Lower,
    Some((-8.0, -2.0, -4.0, -0.1)),
    1.0,
    @render.ImageInterpolation::Nearest,
  )
  assert_eq(artist_minpos([image], true), 1.0 / 0.0)
  assert_eq(artist_minpos([image], false), 1.0 / 0.0)
}

///|
test "Log blended source data minpos 0: axhline" {
  let artist = @render.Artist::HLine(0.125, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 1.0 / 0.0)
  assert_eq(artist_minpos([artist], false), 0.125)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (0.125, 0.125))
}

///|
test "Log blended source data minpos 1: axhline" {
  let artist = @render.Artist::HLine(-2.0, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 1.0 / 0.0)
  assert_eq(artist_minpos([artist], false), 1.0 / 0.0)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (-2.0, -2.0))
}

///|
test "Log blended source data minpos 2: axvline" {
  let artist = @render.Artist::VLine(0.125, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 0.125)
  assert_eq(artist_minpos([artist], false), 1.0 / 0.0)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (0.125, 0.125))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
}

///|
test "Log blended source data minpos 3: axvline" {
  let artist = @render.Artist::VLine(-2.0, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 1.0 / 0.0)
  assert_eq(artist_minpos([artist], false), 1.0 / 0.0)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (-2.0, -2.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
}

///|
test "Log blended source data minpos 4: axhspan" {
  let artist = @render.Artist::HSpan(0.125, 4.0, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 1.0 / 0.0)
  assert_eq(artist_minpos([artist], false), 0.125)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (0.125, 4.0))
}

///|
test "Log blended source data minpos 5: axhspan" {
  let artist = @render.Artist::HSpan(-2.0, 4.0, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 1.0 / 0.0)
  assert_eq(artist_minpos([artist], false), 4.0)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (-2.0, 4.0))
}

///|
test "Log blended source data minpos 6: axhspan" {
  let artist = @render.Artist::HSpan(-4.0, -2.0, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 1.0 / 0.0)
  assert_eq(artist_minpos([artist], false), 1.0 / 0.0)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (-4.0, -2.0))
}

///|
test "Log blended source data minpos 7: axvspan" {
  let artist = @render.Artist::VSpan(0.125, 4.0, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 0.125)
  assert_eq(artist_minpos([artist], false), 1.0 / 0.0)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (0.125, 4.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
}

///|
test "Log blended source data minpos 8: axvspan" {
  let artist = @render.Artist::VSpan(-2.0, 4.0, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 4.0)
  assert_eq(artist_minpos([artist], false), 1.0 / 0.0)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (-2.0, 4.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
}

///|
test "Log blended source data minpos 9: axvspan" {
  let artist = @render.Artist::VSpan(-4.0, -2.0, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 1.0 / 0.0)
  assert_eq(artist_minpos([artist], false), 1.0 / 0.0)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (-4.0, -2.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (1.0 / 0.0, -1.0 / 0.0))
}

///|
test "Log artist minpos original bxp quartile path 0" {
  let stat = @boxplot.box_stats([-2.0, 0.001, 10.0, 20.0, 100.0])
  assert_eq(stat.q1(), 0.001)
  let artist = @render.Artist::BoxPlot([stat], false, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 0.7)
  assert_eq(artist_minpos([artist], false), 0.001)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (0.7, 1.3))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (-2.0, 100.0))
}

///|
test "Log artist minpos original bxp quartile path 1" {
  let stat = @boxplot.box_stats([-2.0, 0.001, 10.0, 20.0, 100.0])
  assert_eq(stat.q1(), 0.001)
  let artist = @render.Artist::BoxPlot([stat], true, @core.style("red"))
  assert_eq(artist_minpos([artist], true), 0.001)
  assert_eq(artist_minpos([artist], false), 0.7)
  let x_bounds = artist_data_interval([artist], true)
  let y_bounds = artist_data_interval([artist], false)
  assert_eq((x_bounds.lower(), x_bounds.upper()), (-2.0, 100.0))
  assert_eq((y_bounds.lower(), y_bounds.upper()), (0.7, 1.3))
}
