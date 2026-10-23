///|
fn line_width_backend_widths(svg : String, color : String) -> Array[String] {
  let widths = []
  for index, element in svg.split("<polyline ").to_array() {
    if index == 0 {
      continue
    }
    if element.split_once("/>") is Some((attributes, _)) &&
      attributes.contains("stroke=\"" + color + "\"") {
      let (_, remaining) = attributes.split_once("stroke-width=\"").unwrap()
      let (value, _) = remaining.split_once("\"").unwrap()
      widths.push(value.to_owned())
    }
  }
  widths
}

///|
test "prepared Style is used together with prepared points while static fallback keeps enum width" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let current = [@core.point(0.0, 1.0), @core.point(1.0, 0.0)]
  let completed = [0]
  let prepared = line2d_ir_fixture(
    [@render.Artist::Line(points, @core.style("#111111", width=2.0))],
    line_provider=Some(_ => {
      Some(
        (current, @core.style("#678baf", width=3.25), () => completed[0] += 1),
      )
    }),
  )
  let svg = render_with_positions_checked(prepared).0
  assert_eq(line_width_backend_widths(svg, "#678baf"), ["3.25"])
  assert_eq(line_width_backend_widths(svg, "#111111"), [])
  assert_true(svg.contains("points=\"0,0 400,200\""))
  assert_eq(completed[0], 1)
  let fallback_artists = [
    @render.Artist::Line(points, @core.style("#789cc0", width=6.25)),
  ]
  let static_svg = render_with_positions_checked(
      line2d_ir_fixture(fallback_artists),
    ).0
  assert_eq(line_width_backend_widths(static_svg, "#789cc0"), ["6.25"])
  let none_svg = render_with_positions_checked(
      line2d_ir_fixture(fallback_artists, line_provider=Some(_ => None)),
    ).0
  assert_eq(line_width_backend_widths(none_svg, "#789cc0"), ["6.25"])
}

///|
test "a later Line preparation cannot retroactively replace the earlier appended Style" {
  let first = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let second = [@core.point(0.0, 1.0), @core.point(1.0, 0.0)]
  let first_style = [@core.style("#89add1", width=2.0)]
  let events : Array[String] = []
  let figure = line2d_ir_fixture(
    [
      @render.Artist::Line(first, first_style[0]),
      @render.Artist::Line(second, @core.style("#9abee2", width=2.0)),
    ],
    line_provider=Some(points => {
      if physical_equal(points, first) {
        return Some(
          (first, first_style[0], () => events.push("first-complete")),
        )
      }
      events.push("second-prepare")
      first_style[0] = @core.style("#89add1", width=9.0)
      Some(
        (
          second,
          @core.style("#9abee2", width=4.0),
          () => events.push("second-complete"),
        ),
      )
    }),
  )
  let first_frame = render_with_positions_checked(figure).0
  assert_eq(events, ["first-complete", "second-prepare", "second-complete"])
  assert_eq(line_width_backend_widths(first_frame, "#89add1"), ["2"])
  assert_eq(line_width_backend_widths(first_frame, "#9abee2"), ["4"])
  let next_frame = render_with_positions_checked(figure).0
  assert_eq(line_width_backend_widths(next_frame, "#89add1"), ["9"])
  assert_eq(line_width_backend_widths(next_frame, "#9abee2"), ["4"])
}
