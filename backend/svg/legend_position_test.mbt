///|
fn legend_position_fixture(
  position : @render.LegendPosition?,
  entries : Array[@render.LegendEntry],
) -> @render.Figure {
  let x = @axis.axis()
  let y = @axis.axis()
  try! x.set_limits(0.0, 1.0)
  try! y.set_limits(0.0, 1.0)
  let panel = match position {
    None => @render.panel(None, [], None, entries, None, x, y, false, [], [])
    Some(position) =>
      @render.panel(
        None,
        [],
        None,
        entries,
        None,
        x,
        y,
        false,
        [],
        [],
        legend_position=position,
      )
  }
  @render.figure(400, 300, 40, [panel], [], None)
}

///|
test "SVG legends anchor to each plot corner with the existing box dimensions" {
  let entries = [
    @render.legend_entry("series", "#123456", @render.LegendKind::Line),
  ]
  let cases = [
    (@render.LegendPosition::UpperRight, "200", "48"),
    (@render.LegendPosition::UpperLeft, "48", "48"),
    (@render.LegendPosition::LowerRight, "200", "220"),
    (@render.LegendPosition::LowerLeft, "48", "220"),
  ]
  for (position, x, y) in cases {
    let fig = legend_position_fixture(Some(position), entries)
    let svg = @svg.render(fig)
    assert_true(
      svg.contains(
        "<rect x=\"\{x}\" y=\"\{y}\" width=\"152\" height=\"32\" fill=\"white\" fill-opacity=\"0.85\"",
      ),
    )
    assert_true(svg.contains("series"))
    assert_true(svg.contains("#123456"))
  }
  assert_eq(
    @svg.render(legend_position_fixture(None, entries)),
    @svg.render(
      legend_position_fixture(Some(@render.LegendPosition::UpperRight), entries),
    ),
  )
}

///|
test "lower legends account for all entries and empty legends remain absent" {
  let entries = [
    @render.legend_entry("one", "#123456", @render.LegendKind::Line),
    @render.legend_entry("two", "#abcdef", @render.LegendKind::Marker),
  ]
  let svg = @svg.render(
    legend_position_fixture(Some(@render.LegendPosition::LowerLeft), entries),
  )
  assert_true(
    svg.contains(
      "<rect x=\"48\" y=\"200\" width=\"152\" height=\"52\" fill=\"white\" fill-opacity=\"0.85\"",
    ),
  )
  let empty = @svg.render(
    legend_position_fixture(Some(@render.LegendPosition::LowerRight), []),
  )
  assert_true(!empty.contains("fill-opacity=\"0.85\""))
}
