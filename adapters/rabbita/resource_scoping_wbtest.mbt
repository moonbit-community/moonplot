///|
fn resource_test_attrs(
  content : SvgContent,
  tag : String,
) -> Array[Array[(String, String)]] {
  match content {
    Text(_) => []
    Element(name, attributes, children) => {
      let found = if name == tag { [attributes] } else { [] }
      for child in children {
        found.append(resource_test_attrs(child, tag))
      }
      found
    }
  }
}

///|
fn resource_test_attr(
  attributes : Array[(String, String)],
  key : String,
) -> String {
  for (name, value) in attributes {
    if name == key {
      return value
    }
  }
  ""
}

///|
fn resource_test_invalid(source : String, chart_id : String) -> Bool {
  try {
    ignore(scope_svg_resources(parse_svg(source), chart_id))
    false
  } catch {
    InvalidSvg(_) => true
    _ => false
  }
}

///|
test "resource IDs isolate identical defs across charts without changing geometry or input" {
  let source = "<svg viewBox=\"0 0 100 50\"><defs><linearGradient id=\"paint\"><stop offset=\"0.25\" stop-color=\"#abcdef\"/></linearGradient><clipPath id=\"cut\"><rect width=\"8.125\" height=\"9.5\"/></clipPath></defs><rect fill=\"url(#paint)\" clip-path=\"url(#cut)\" x=\"1.25\" y=\"2.5\" width=\"7.75\"/></svg>"
  let parsed = parse_svg(source)
  let first = scope_svg_resources(parsed, "chart-a")
  let second = scope_svg_resources(parsed, "chart-b")
  let first_gradient = resource_test_attrs(first, "linearGradient")[0]
  let second_gradient = resource_test_attrs(second, "linearGradient")[0]
  let first_id = resource_test_attr(first_gradient, "id")
  let second_id = resource_test_attr(second_gradient, "id")
  assert_true(first_id != second_id)
  assert_eq(first_id, resource_id("chart-a", "paint"))
  let first_rect = resource_test_attrs(first, "rect")[1]
  assert_eq(
    resource_test_attr(first_rect, "fill"),
    "url(\"#" + first_id + "\")",
  )
  assert_eq(
    resource_test_attr(first_rect, "clip-path"),
    "url(\"#" + resource_id("chart-a", "cut") + "\")",
  )
  assert_eq(resource_test_attr(first_rect, "x"), "1.25")
  assert_eq(resource_test_attr(first_rect, "y"), "2.5")
  assert_eq(resource_test_attr(first_rect, "width"), "7.75")
  assert_eq(
    resource_test_attr(resource_test_attrs(parsed, "linearGradient")[0], "id"),
    "paint",
  )
  assert_eq(
    resource_test_attr(resource_test_attrs(first, "stop")[0], "stop-color"),
    "#abcdef",
  )
  // The same chart/source pairs are stable on redraw, without global counters.
  let again = scope_svg_resources(parsed, "chart-a")
  assert_eq(
    resource_test_attrs(again, "linearGradient"),
    resource_test_attrs(first, "linearGradient"),
  )
  assert_eq(
    resource_test_attrs(again, "rect"),
    resource_test_attrs(first, "rect"),
  )
}

///|
test "resource names are injective safe and deterministic for arbitrary Unicode chart and source IDs" {
  assert_true(resource_id("a-b", "c") != resource_id("a", "b-c"))
  assert_true(resource_id("ab", "c") != resource_id("a", "bc"))
  assert_true(resource_id("1", "23") != resource_id("12", "3"))
  let chart = "图 \"' 🐇"
  let source_id = "渐变 \"' 🐇"
  let id = resource_id(chart, source_id)
  for char in id.iter() {
    assert_true(
      char.is_ascii_alphabetic() ||
      char.is_ascii_digit() ||
      char == '-' ||
      char == '_',
    )
  }
  assert_eq(resource_id(chart, source_id), id)
  assert_true(
    resource_id(chart, source_id) != resource_id(chart + "🐇", source_id),
  )
  let content = parse_svg(
    "<svg><defs><linearGradient id=\"渐变 &quot;' 🐇\"/></defs><rect fill=\"url('#渐变 &quot;\\' 🐇')\"/></svg>",
  )
  let scoped = scope_svg_resources(content, chart)
  assert_eq(
    resource_test_attr(resource_test_attrs(scoped, "linearGradient")[0], "id"),
    id,
  )
  assert_eq(
    resource_test_attr(resource_test_attrs(scoped, "rect")[0], "fill"),
    "url(\"#" + id + "\")",
  )
}

///|
test "all local href spellings follow gradient chains and the actual overridden SVG root ID" {
  let source = "<svg id=\"old-root\" viewBox=\"0 0 100 50\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><defs><linearGradient id=\"base\"/><linearGradient id=\"paint\" href=\"#base\"/><linearGradient id=\"legacy\" xlink:href=\"#paint\"/></defs><image href=\"#old-root\"/><rect clip-path=\"url( '#old-root' )\"/></svg>"
  let scoped = scope_svg_resources(parse_svg(source), "chart-a")
  let gradients = resource_test_attrs(scoped, "linearGradient")
  assert_eq(
    resource_test_attr(gradients[1], "href"),
    "#" + resource_id("chart-a", "base"),
  )
  assert_eq(
    resource_test_attr(gradients[2], "xlink:href"),
    "#" + resource_id("chart-a", "paint"),
  )
  assert_eq(
    resource_test_attr(resource_test_attrs(scoped, "svg")[0], "id"),
    "chart-a-svg",
  )
  assert_eq(
    resource_test_attr(resource_test_attrs(scoped, "image")[0], "href"),
    "#chart-a-svg",
  )
  assert_eq(
    resource_test_attr(resource_test_attrs(scoped, "rect")[0], "clip-path"),
    "url(\"#chart-a-svg\")",
  )
  ignore(
    view(@drawing.drawing(100, 50, source, []), id="chart-a", on_event=_ => {
      @rabbita.none
    }),
  )
  let same_href = scope_svg_resources(
    parse_svg(
      "<svg><g id=\"base\"/><image href=\"#base\" xlink:href=\"#base\"/></svg>",
    ),
    "a",
  )
  let image_attrs = resource_test_attrs(same_href, "image")[0]
  assert_eq(
    resource_test_attr(image_attrs, "href"),
    resource_test_attr(image_attrs, "xlink:href"),
  )
  let unusual = scope_svg_resources(parse_svg(source), "图 \"🐇%")
  let root_url = resource_test_attr(
    resource_test_attrs(unusual, "image")[0],
    "href",
  )
  assert_eq(resource_fragment(root_url[1:].to_owned()), "图 \"🐇%-svg")
  assert_eq(
    resource_test_attr(resource_test_attrs(unusual, "rect")[0], "clip-path"),
    "url(\"" + root_url + "\")",
  )
}

///|
test "inline style scopes CSS url tokens with quotes whitespace escapes and prefix IDs" {
  let ids : Map[String, String] = Map([
    ("paint", "safe-paint"),
    ("paint-long", "safe-paint-long"),
    ("a b", "safe-space"),
    ("文", "safe-unicode"),
  ])
  let input = "fill:url(#paint);stroke:URL(  '#paint-long' \t);clip-path:url(\"#a b\");mask:u\\72l(#\\70 aint);filter:url(#%E6%96%87);color:#abcdef"
  assert_eq(
    scope_resource_urls(input, ids),
    "fill:url(\"#safe-paint\");stroke:url(\"#safe-paint-long\");clip-path:url(\"#safe-space\");mask:url(\"#safe-paint\");filter:url(\"#safe-unicode\");color:#abcdef",
  )
  assert_eq(
    scope_resource_urls("url( #paint\n ) #abc url('#paint-long')", ids),
    "url(\"#safe-paint\") #abc url(\"#safe-paint-long\")",
  )
  assert_eq(scope_resource_urls("url(#a\\20 b)", ids), "url(\"#safe-space\")")
}

///|
test "external data URLs color literals CSS strings comments and unrelated attributes stay unchanged" {
  let ids : Map[String, String] = Map([("paint", "scoped")])
  let value = "fill:url(https://example.test/image.svg#paint);mask:url( '//example.test/x#paint' );cursor:url(data:image/svg+xml;base64,AAAA#paint);color:#paint;--text:\"url(#paint)\";/* url(#missing) */font-family:'url(#missing)';--x:xurl(#paint)"
  assert_eq(scope_resource_urls(value, ids), value)
  let source = "<svg><image href=\"https://example.test/image.svg#paint\"/><image xlink:href=\"data:image/png;base64,AA==#paint\"/><rect fill=\"#paint\" data-reference=\"url(#missing)\"/><text>url(#paint) &amp; 文</text></svg>"
  let scoped = scope_svg_resources(parse_svg(source), "a")
  assert_eq(
    resource_test_attrs(scoped, "image"),
    resource_test_attrs(parse_svg(source), "image"),
  )
  assert_eq(
    resource_test_attrs(scoped, "rect"),
    resource_test_attrs(parse_svg(source), "rect"),
  )
  match scoped {
    Element(_, _, [_, _, _, Element("text", _, [Text(value)])]) =>
      assert_eq(value, "url(#paint) & 文")
    _ => fail("Unexpected SVG structure")
  }
}

///|
test "duplicate empty unresolved malformed and ambiguous resources fail before building DOM" {
  for
    source in [
      "<svg id=\"same\"><g id=\"same\"/></svg>", "<svg><g id=\"a\"/><rect id=\"a\"/></svg>",
      "<svg><g id=\"\"/></svg>", "<svg><g id=\"   \"/></svg>", "<svg><g id=\"a\" id=\"b\"/></svg>",
      "<svg><rect fill=\"url(#missing)\"/></svg>", "<svg><image href=\"#missing\"/></svg>",
      "<svg><g id=\"a\"/><g id=\"b\"/><image href=\"#a\" xlink:href=\"#b\"/></svg>",
      "<svg><image href=\"#\"/></svg>", "<svg><g id=\"a b\"/><g id=\"a%20b\"/><image href=\"#a%20b\"/></svg>",
      "<svg><g id=\"a\"/><image href=\"#%GG\"/></svg>", "<svg><g id=\"a\"/><image href=\"#%C0%AF\"/></svg>",
      "<svg><rect style=\"fill:url( '#missing' \"/></svg>", "<svg><rect style=\"/*\"/></svg>",
    ] {
    assert_true(resource_test_invalid(source, "chart-a"), msg=source)
  }
  assert_true(resource_test_invalid("<svg/>", ""))
  assert_true(resource_test_invalid("<svg/>", " \t"))
  let failed = try {
    ignore(
      view(
        @drawing.drawing(
          100,
          50,
          "<svg viewBox=\"0 0 100 50\"><rect fill=\"url(#missing)\"/></svg>",
          [],
        ),
        id="a",
        on_event=_ => @rabbita.none,
      ),
    )
    false
  } catch {
    InvalidSvg(_) => true
    _ => false
  }
  assert_true(failed)
}

///|
test "pure IDREF normalization preserves separators while public SVG ARIA remains explicitly unsupported" {
  let source = "<svg aria-labelledby=\"title desc\"><title id=\"title\">Caption</title><desc id=\"desc\">Details</desc><rect aria-describedby=\" desc\t title \"/></svg>"
  let scoped = scope_svg_resources(parse_svg(source), "a")
  assert_eq(
    resource_test_attr(resource_test_attrs(scoped, "svg")[0], "aria-labelledby"),
    resource_id("a", "title") + " " + resource_id("a", "desc"),
  )
  assert_eq(
    resource_test_attr(
      resource_test_attrs(scoped, "rect")[0],
      "aria-describedby",
    ),
    " " + resource_id("a", "desc") + "  " + resource_id("a", "title") + " ",
  )
  assert_eq(
    scope_resource_idrefs(
      "title\t desc",
      Map([("title", "scoped-title"), ("desc", "scoped-desc")]),
    ),
    "scoped-title\t scoped-desc",
  )
  assert_true(resource_test_invalid("<svg aria-labelledby=\"missing\"/>", "a"))
  let failed = try {
    ignore(svg_content(scoped))
    false
  } catch {
    UnsupportedAttribute("svg", "aria-labelledby") => true
    _ => false
  }
  assert_true(failed)
}
