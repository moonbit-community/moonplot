///|
fn line_alpha_backend_elements(svg : String) -> Array[String] {
  let elements = []
  for index, element in svg.split("<polyline ").to_array() {
    if index == 0 {
      continue
    }
    if element.split_once("/>") is Some((attributes, _)) {
      elements.push(attributes.to_owned())
    }
  }
  elements
}

///|
test "Line-only opacity is conditional and the prepared Style owns its returned opacity" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let initial = @core.style("red")
  let fallback = line2d_ir_fixture([@render.Artist::Line(points, initial)])
  let old_svg = render_with_positions_checked(fallback).0
  let old_elements = line_alpha_backend_elements(old_svg)
  assert_eq(old_elements.length(), 1)
  assert_true(!old_elements[0].contains("stroke-opacity="))
  let explicit = line2d_ir_fixture([
    @render.Artist::Line(points, @core.style("red", line_alpha=Some(0.25))),
  ])
  let explicit_elements = line_alpha_backend_elements(
    render_with_positions_checked(explicit).0,
  )
  assert_true(explicit_elements[0].contains("stroke-opacity=\"0.25\""))
  let completed = [false]
  let prepared = line2d_ir_fixture(
    [@render.Artist::Line(points, @core.style("red", line_alpha=Some(0.25)))],
    line_provider=Some(_ => {
      Some(
        (
          points,
          @core.style("blue", line_alpha=Some(0.0)),
          () => completed[0] = true,
        ),
      )
    }),
  )
  let prepared_elements = line_alpha_backend_elements(
    render_with_positions_checked(prepared).0,
  )
  assert_eq(prepared_elements.length(), 1)
  assert_true(prepared_elements[0].contains("stroke=\"blue\""))
  assert_true(prepared_elements[0].contains("stroke-opacity=\"0\""))
  assert_true(completed[0])
}

///|
test "ErrorBar center reuse of append_line does not consume the Line-only Style alpha" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let shared = @core.style("red", line_alpha=Some(0.25))
  let figure = line2d_ir_fixture([
    @render.Artist::Line(points, shared),
    @render.Artist::ErrorBar(points, [], [], shared),
  ])
  let elements = line_alpha_backend_elements(
    render_with_positions_checked(figure).0,
  )
  assert_eq(elements.length(), 2)
  assert_true(elements[0].contains("stroke-opacity=\"0.25\""))
  assert_true(!elements[1].contains("stroke-opacity="))
}
