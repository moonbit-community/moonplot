///|
test "polar bar prepared IR requires genuine angular configuration but unproven source remains drawable" {
  let points = [@core.point(0.0, 1.0)]
  let style = @core.style("#398575", width=0.0, fill="#398575")
  let make = (data : @render.PolarHitData) => {
    let projection = @render.polar_projection(
      Some(1.0),
      0.0,
      false,
      [],
      [],
      Some([]),
      [],
      [false],
      hit_data=[data],
    )
    @render.panel(
      None,
      [@render.Artist::Bar(points, style)],
      None,
      [],
      None,
      @axis.axis(),
      @axis.axis(),
      false,
      [],
      [],
      polar=Some(projection),
    )
  }
  let source = @render.polar_bar_hit_data(points, "Known", 0.5)
  let panel = make(source)
  validate_polar_panel(panel)
  let copy = make(@render.polar_bar_hit_data(points.copy(), "Unknown", 0.5))
  validate_polar_panel(copy)
  assert_true(!copy.polar().unwrap().hit_data(0).unwrap().matches_bar(points))
  for
    data in [
      @render.polar_hit_data(points, "Curve"),
      @render.polar_hit_data(points, "Marker", scatter=true),
      @render.polar_bar_hit_data(points, "Invalid", 0.0),
      @render.polar_bar_hit_data(points, "Invalid", 7.0),
      @render.polar_bar_hit_data(points, "Invalid", 0.0 / 0.0),
    ] {
    let rejected = try {
      validate_polar_panel(make(data))
      false
    } catch {
      @core.DataError::InvalidReference(..) => true
      _ => false
    }
    assert_true(rejected)
  }
}
