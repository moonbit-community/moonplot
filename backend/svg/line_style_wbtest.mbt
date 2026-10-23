///|
fn line_style_backend_elements(svg : String) -> Array[String] {
  let elements = []
  for index, element in svg.split("<polyline ").to_array() {
    if index > 0 && element.split_once("/>") is Some((attributes, _)) {
      elements.push(attributes.to_owned())
    }
  }
  elements
}

///|
test "Line GC validates before finite splitting and failed completion remains pending" {
  let points = [@core.point(0.0 / 0.0, 0.0), @core.point(1.0, 1.0 / 0.0)]
  for
    (pattern, expected) in [
      (
        [-1.0, 0.0],
        "ValueError: All values in the dash list must be non-negative",
      ),
      (
        [0.0, 0.0 / 0.0],
        "ValueError: At least one value in the dash list must be positive",
      ),
    ] {
    let completed = [false]
    let style = @core.style(
      "red",
      line_stroke=@core.line_stroke("--", dashes=Some(pattern)),
    )
    let figure = line2d_ir_fixture(
      [@render.Artist::Line(points, style)],
      line_provider=Some(_ => Some((points, style, () => completed[0] = true))),
    )
    try render_with_positions_checked(figure) catch {
      @core.DataError::InvalidTicks(message~) => assert_eq(message, expected)
      _ => fail("expected exact late GC dash error")
    } noraise {
      _ => fail("nonempty all-nonfinite path must still validate its dashes")
    }
    assert_true(!completed[0])
  }
  for width in [0.0, -2.0, 0.0 / 0.0] {
    let completed = [false]
    let style = @core.style(
      "red",
      width~,
      line_stroke=@core.line_stroke("--", dashes=Some([-1.0, 0.0])),
    )
    let figure = line2d_ir_fixture(
      [@render.Artist::Line(points, style)],
      line_provider=Some(_ => Some((points, style, () => completed[0] = true))),
    )
    assert_eq(
      line_style_backend_elements(render_with_positions_checked(figure).0),
      [],
    )
    assert_true(completed[0])
  }
}

///|
test "static Line carrier emits empty dash sequence and None while Errorbar stays solid" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let empty = @core.style(
    "red",
    line_stroke=@core.line_stroke("--", offset=0.25, dashes=Some([])),
  )
  let elements = line_style_backend_elements(
    render_with_positions_checked(
      line2d_ir_fixture([
        @render.Artist::Line(points, empty),
        @render.Artist::ErrorBar(points, [], [], empty),
      ]),
    ).0,
  )
  assert_eq(elements.length(), 2)
  assert_true(elements[0].contains("stroke-dasharray=\"\""))
  assert_true(elements[0].contains("stroke-dashoffset=\"0.25\""))
  assert_true(!elements[1].contains("stroke-dash"))
  let no_stroke = @core.style("blue", line_stroke=@core.line_stroke("None"))
  let hidden = line_style_backend_elements(
    render_with_positions_checked(
      line2d_ir_fixture([
        @render.Artist::Line(points, no_stroke),
        @render.Artist::ErrorBar(points, [], [], no_stroke),
      ]),
    ).0,
  )
  assert_eq(hidden.length(), 1)
  assert_true(hidden[0].contains("stroke=\"blue\""))
  assert_true(!hidden[0].contains("stroke-dash"))
}

///|
test "positive dash validation accepts NaN beside a positive entry and nonpositive widths omit dashes" {
  let points = [@core.point(0.0, 0.0), @core.point(1.0, 1.0)]
  let mixed = @core.style(
    "red",
    line_stroke=@core.line_stroke("--", dashes=Some([0.0 / 0.0, 1.0])),
  )
  let accepted = line_style_backend_elements(
    render_with_positions_checked(
      line2d_ir_fixture([@render.Artist::Line(points, mixed)]),
    ).0,
  )
  assert_eq(accepted.length(), 1)
  assert_true(accepted[0].contains("stroke-dasharray="))
  for width in [0.0, -2.0, 0.0 / 0.0] {
    let style = @core.style(
      "red",
      width~,
      line_stroke=@core.line_stroke("--", dashes=Some([-1.0, 0.0])),
    )
    let elements = line_style_backend_elements(
      render_with_positions_checked(
        line2d_ir_fixture([@render.Artist::Line(points, style)]),
      ).0,
    )
    assert_eq(elements.length(), 1)
    assert_true(!elements[0].contains("stroke-dash"))
  }
}
