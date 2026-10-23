///|
fn line_units_panel(
  x : @axis.Axis,
  artists : Array[@render.Artist],
) -> @render.Figure raise @core.DataError {
  let y = @axis.axis(horizontal=false)
  y.set_limits(0.0, 1.0)
  @render.figure(
    400,
    200,
    0,
    [@render.panel(None, artists, None, [], None, x, y, false, [], [])],
    [],
    None,
  )
}

///|
test "numeric IR displays remapped and native line vertices independently of category tick order" {
  let x = @axis.axis()
  x.set_categories(["猫", "b<&"])
  x.set_limits(0.0, 1.0)
  let remapped = [@core.point(1.0, 0.0), @core.point(0.0, 1.0)]
  let native = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let figure = line_units_panel(x, [
    @render.Artist::Line(remapped, @core.style("#123abc")),
    @render.Artist::Line(native, @core.style("#456def")),
  ])
  let scale = compute_scale(figure, 0)
  assert_eq(points_text(scale, 0.0, 0.0, 400.0, 200.0, remapped), "400,200 0,0")
  assert_eq(points_text(scale, 0.0, 0.0, 400.0, 200.0, native), "0,200 400,0")
  let svg = render_with_positions_checked(figure).0
  assert_true(svg.contains("points=\"400,200 0,0\""))
  assert_true(svg.contains("points=\"0,200 400,0\""))
  assert_true(svg.contains("b&lt;&amp;"))
  assert_true(svg.contains("猫"))
}

///|
test "category names do not replace numeric data or infer origins in standalone IR" {
  let x = @axis.axis()
  x.set_categories(["zero", "one"])
  x.set_limits(10.0, 20.0)
  let points = [@core.point(10.0, 0.0), @core.point(20.0, 1.0)]
  let figure = line_units_panel(x, [
    @render.Artist::Line(points, @core.style("#aabbcc")),
  ])
  let scale = compute_scale(figure, 0)
  let data = artist_data_interval(figure.panels()[0].artists(), true)
  assert_eq((data.lower(), data.upper()), (10.0, 20.0))
  assert_eq((scale.xmin, scale.xmax), (10.0, 20.0))
  assert_eq(points_text(scale, 0.0, 0.0, 400.0, 200.0, points), "0,200 400,0")
  let svg = render_with_positions_checked(figure).0
  assert_true(svg.contains("#aabbcc"))
  assert_true(svg.contains("points=\"0,200 400,0\""))
  assert_true(!svg.contains(">zero<"))
  assert_true(!svg.contains(">one<"))
}
