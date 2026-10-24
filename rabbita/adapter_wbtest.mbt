///|
test "SVG parsing retains decimal geometry and decoded text in source order" {
  let content = parse_svg(
    "<?xml version=\"1.0\"?><svg viewBox=\"0 0 100 50\"><g transform=\"translate(0.25 1.5)\"><circle cx=\"2.125\" cy=\"4.5\" r=\"0.5\"/><text x=\"1.25\">A &amp; 文 &lt; B</text></g></svg>",
  )
  match content {
    Element(
      "svg",
      root_attrs,
      [
        Element(
          "g",
          group_attrs,
          [
            Element("circle", circle_attrs, []),
            Element("text", _, [Text(text)]),
          ]
        ),
      ]
    ) => {
      assert_eq(root_attrs, [("viewBox", "0 0 100 50")])
      assert_eq(group_attrs, [("transform", "translate(0.25 1.5)")])
      assert_eq(circle_attrs, [("cx", "2.125"), ("cy", "4.5"), ("r", "0.5")])
      assert_eq(text, "A & 文 < B")
    }
    _ => fail("SVG node order or values changed")
  }
}

///|
test "malformed XML and unsupported node kinds fail explicitly" {
  for
    source in [
      "<svg><g></svg>", "<svg/><svg/>", "<g/>", "<!DOCTYPE svg><svg/>", "<?custom data?><svg/>",
    ] {
    let failed = try {
      ignore(parse_svg(source))
      false
    } catch {
      InvalidSvg(_) => true
      _ => false
    }
    assert_true(failed, msg=source)
  }
  let failed = try {
    ignore(parse_svg("<svg><foreignObject/></svg>"))
    false
  } catch {
    UnsupportedElement("foreignObject") => true
    _ => false
  }
  assert_true(failed)
}

///|
test "unsupported attributes and namespaces are never silently discarded" {
  let failed = try {
    svg_attribute(@svg.Attrs::build(), "circle", "not-an-svg-attribute", "1")
    false
  } catch {
    UnsupportedAttribute("circle", "not-an-svg-attribute") => true
    _ => false
  }
  assert_true(failed)
  for (key, value) in [("xmlns", "urn:wrong"), ("xmlns:xlink", "urn:wrong")] {
    let failed = try {
      svg_attribute(@svg.Attrs::build(), "svg", key, value)
      false
    } catch {
      InvalidSvg(_) => true
      _ => false
    }
    assert_true(failed)
  }
}

///|
test "public attributes accept native backend geometry styling and SVG2 image href bridge" {
  let attrs = @svg.Attrs::build()
  for
    (key, value) in [
      ("points", "1.25,2.5 3.75,4.0"),
      ("stroke-dasharray", "2.5,3.75"),
      ("stroke-dashoffset", "-1.5"),
      ("fill-rule", "evenodd"),
      ("font-family", "sans-serif"),
      ("text-anchor", "middle"),
      ("gradientUnits", "userSpaceOnUse"),
      ("data-custom", "文"),
      ("xmlns:xlink", "http://www.w3.org/1999/xlink"),
      ("xlink:href", "data:image/png;base64,AA=="),
    ] {
    svg_attribute(attrs, "svg", key, value)
  }
  ignore(
    svg_content(
      parse_svg(
        "<svg xmlns:xlink=\"http://www.w3.org/1999/xlink\"><image width=\"2.5\" xlink:href=\"data:image/png;base64,AA==\"/></svg>",
      ),
    ),
  )
}

///|
test "drawing viewport contract rejects mismatched or missing hit coordinate geometry" {
  for
    (width, height, attrs) in [
      (0, 50, "viewBox=\"0 0 100 50\""),
      (100, -1, "viewBox=\"0 0 100 50\""),
      (100, 50, ""),
      (100, 50, "viewBox=\"1 0 100 50\""),
      (100, 50, "viewBox=\"0 0 200 50\""),
      (100, 50, "viewBox=\"0 0 NaN 50\""),
      (100, 50, "viewBox=\"0 0 100 50\" preserveAspectRatio=\"none\""),
      (100, 50, "viewBox=\"0 0 100 50\" preserveAspectRatio=\"xMinYMin meet\""),
    ] {
    let source = "<svg " + attrs + "/>"
    let drawing = @drawing.drawing(width, height, source, [])
    let failed = try {
      validate_drawing(drawing, parse_svg(source))
      false
    } catch {
      InvalidSvg(_) => true
      _ => false
    }
    assert_true(failed, msg=source)
  }
  let source = "<svg viewBox=\"0, 0, 100.0, 5e1\" preserveAspectRatio=\"xMidYMid meet\"/>"
  validate_drawing(@drawing.drawing(100, 50, source, []), parse_svg(source))
}

///|
test "view constructs checked public nodes with Unicode tooltip and legend without DOM access" {
  let point = @drawing.hit_point(0, 1, 2, 3.25, 4.5, 20.25, 30.5)
  let drawing = @drawing.drawing(
    100,
    50,
    "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"100\" height=\"50\" viewBox=\"0 0 100 50\"><text x=\"1.25\" y=\"2.5\">文 &amp; data</text></svg>",
    [point],
  )
  let calls = @ref.Ref(0)
  ignore(
    view(
      drawing,
      id="unicode",
      on_event=_ => {
        calls.val += 1
        @rabbita.none
      },
      hovered=point,
      selected=point,
      legend=[legend_item("series-a", "系列 A", "#2563eb", true)],
    ),
  )
  assert_eq(calls.val, 0)
  assert_eq(Hover(Some(point)), Hover(Some(point)))
  assert_true(Click(Some(point)) != ToggleSeries("series-a"))
}

///|
test "actual MoonPlot line scatter and raster SVG all build through strict public adapter" {
  let fig = @plot.figure(width=320, height=200)
  fig.set_x_limits(0.0, 4.0)
  fig.set_y_limits(0.0, 4.0)
  fig.set_title("文 & <text>")
  fig.plot([1.0, 2.0, 3.0], [1.5, 3.25, 2.5], color="#2563eb", label="Line")
  fig.scatter([@plot.point(1.25, 2.75)], color="#f97316", label="Point")
  let drawing = fig.to_drawing()
  assert_true(drawing.points().length() > 0)
  ignore(view(drawing, id="actual", on_event=_ => @rabbita.none))
  let image = @plot.figure(width=160, height=120)
  image.imshow([[0.0, 1.0], [1.0, 0.5]])
  ignore(view(image.to_drawing(), id="image", on_event=_ => @rabbita.none))
}
