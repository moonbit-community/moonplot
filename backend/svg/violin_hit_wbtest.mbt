///|
fn violin_control_svg(
  horizontal : Bool,
  side : @render.ViolinSide,
) -> String raise {
  let writer = @xml.Writer::new()
  writer.start_element("svg", [])
  let scale : Scale = {
    xmin: 0.0,
    xmax: 5.0,
    ymin: 0.0,
    ymax: 5.0,
    x_axis_scale: @ticker_scale.Linear,
    y_axis_scale: @ticker_scale.Linear,
  }
  append_violin(
    writer,
    scale,
    0.0,
    0.0,
    400.0,
    200.0,
    [
      @render.violin_stats(
        [1.0, 2.0, 4.0],
        [0.2, 1.0, 0.4],
        2.5,
        2.0,
        1.0,
        4.0,
        [1.5, 3.0],
      ),
      @render.violin_stats(
        [1.5, 2.0, 2.5],
        [0.3, 1.0, 0.3],
        2.0,
        2.0,
        2.0,
        2.0,
        [2.0, 2.0],
      ),
      @render.violin_stats([], [], 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, 0.0 / 0.0, []),
    ],
    [1.0, 2.0, 3.0],
    [0.6, 0.8, 1.0],
    horizontal,
    side,
    true,
    true,
    true,
    @core.style("blue", fill="blue"),
    @core.style("red", width=1.5),
    0.35,
  )
  writer.end_element("svg")
  writer.to_string()
}

///|
fn violin_ir_frame(
  stat : @render.ViolinStats,
  fill~ : String = "blue",
  line~ : String = "red",
  line_width~ : Double = 1.5,
  opacity~ : Double = 0.35,
  width~ : Double = 0.8,
  means~ : Bool = false,
) -> @drawing.Drawing raise {
  let x = @axis.axis()
  let y = @axis.axis(horizontal=false)
  x.set_limits(0.0, 4.0)
  y.set_limits(0.0, 5.0)
  let figure = @render.figure(
    400,
    200,
    0,
    [
      @render.panel(
        None,
        [
          @render.Artist::Violin(
            [stat],
            [1.0],
            [width],
            false,
            Both,
            means,
            false,
            false,
            @core.style(fill, fill~),
            @core.style(line, width=line_width),
            opacity,
          ),
        ],
        None,
        [],
        None,
        x,
        y,
        false,
        [],
        [],
      ),
    ],
    [],
    None,
  )
  let (frame, _) = render_drawing_with_positions_checked(figure)
  assert_eq(frame.svg(), render_with_positions_checked(figure).0)
  frame
}

///|
fn violin_ir_stats() -> @render.ViolinStats {
  @render.violin_stats([1.0, 2.0, 4.0], [0.2, 1.0, 0.4], 2.5, 2.0, 1.0, 4.0, [])
}

///|
test "violin independent fill stroke opacity and zero line width capture only actual visible paint" {
  for
    (fill, line, line_width, opacity, areas, strokes) in [
      ("none", "red", 1.5, 0.35, false, true),
      ("blue", "none", 1.5, 0.35, true, false),
      ("blue", "red", 0.0, 0.35, true, false),
      ("blue", "red", 1.5, 0.0, false, true),
      ("transparent", "#f000", 1.5, 0.35, false, false),
    ] {
    let frame = violin_ir_frame(
      violin_ir_stats(),
      fill~,
      line~,
      line_width~,
      opacity~,
      means=true,
    )
    assert_eq(
      frame
      .targets()
      .any(t => {
        t.shape is @drawing.HitShape::Quadrilateral(_, _, _, _, _, _, _, _)
      }),
      areas,
    )
    assert_eq(
      frame
      .targets()
      .any(t => t.shape is @drawing.HitShape::Segment(_, _, _, _)),
      strokes,
    )
    if !areas && !strokes {
      assert_eq(frame.points(), [])
    }
    for target in frame.targets() {
      assert_eq(frame.hit_info(target.info.point), Some(target.info))
    }
  }
}

///|
test "violin absent zero density and nonmonotone bodies keep only real summaries while zero width outlines remain lines" {
  for
    (coords, vals) in [
      ([1.0, 2.0, 4.0], [0.0, 0.0, 0.0]),
      ([1.0, 4.0, 2.0], [0.2, 1.0, 0.4]),
    ] {
    let stat = @render.violin_stats(coords, vals, 2.5, 2.0, 1.0, 4.0, [])
    let frame = violin_ir_frame(stat, means=true)
    assert_eq(frame.targets().length(), 1)
    assert_eq(
      frame.targets()[0].info.violin.unwrap().part,
      @drawing.ViolinPart::Mean,
    )
  }
  let zero = violin_ir_frame(violin_ir_stats(), width=0.0)
  assert_true(!zero.targets().is_empty())
  assert_true(
    zero.targets().all(t => t.shape is @drawing.HitShape::Segment(_, _, _, _)),
  )
}

///|
test "violin visible quad anchors reject mere bounding box overlap and diagonal outlines clip to real centerlines" {
  let diamond = [(2.0, 0.0), (4.0, 2.0), (2.0, 4.0), (0.0, 2.0)]
  assert_eq(violin_visible_quad_anchor(diamond, (0.0, 0.0, 0.5, 0.5)), None)
  let (x, y) = violin_visible_quad_anchor(diamond, (0.0, 0.0, 2.0, 2.0)).unwrap()
  assert_true(x >= 0.0 && x <= 2.0 && y >= 0.0 && y <= 2.0 && x + y >= 2.0)
  assert_eq(
    violin_visible_segment((-1.0, -1.0, 2.0, 2.0), (0.0, 0.0, 1.0, 1.0)),
    Some((0.0, 0.0, 1.0, 1.0)),
  )
  assert_eq(
    violin_visible_segment((-1.0, 1.0, 0.0, 2.0), (0.0, 0.0, 0.5, 0.5)),
    None,
  )
}

///|
test "violin exact static controls predate interaction and cover sides orientations constant and absent groups" {
  let documents = []
  for horizontal in [false, true] {
    for side in [@render.ViolinSide::Both, Low, High] {
      documents.push(violin_control_svg(horizontal, side))
    }
  }
  debug_inspect(
    documents,
    content=(
      #|[
      #|  "<svg><polygon points=\"84.80000000000001,160 104,120 89.60000000000001,40 70.39999999999999,40 55.99999999999999,120 75.2,160\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"100\" x2=\"104\" y2=\"100\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"120\" x2=\"104\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"160\" x2=\"104\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"40\" x2=\"104\" y2=\"40\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"160\" x2=\"80\" y2=\"40\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"140\" x2=\"104\" y2=\"140\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"80\" x2=\"104\" y2=\"80\" stroke=\"red\" stroke-width=\"1.5\"/><polygon points=\"169.60000000000002,140 192,120 169.60000000000002,100 150.4,100 128,120 150.4,140\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/></svg>",
      #|  "<svg><polygon points=\"80,160 80,120 80,40 70.39999999999999,40 55.99999999999999,120 75.2,160\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"100\" x2=\"80\" y2=\"100\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"120\" x2=\"80\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"160\" x2=\"80\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"40\" x2=\"80\" y2=\"40\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"160\" x2=\"80\" y2=\"40\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"140\" x2=\"80\" y2=\"140\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"55.99999999999999\" y1=\"80\" x2=\"80\" y2=\"80\" stroke=\"red\" stroke-width=\"1.5\"/><polygon points=\"160,140 160,120 160,100 150.4,100 128,120 150.4,140\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"128\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/></svg>",
      #|  "<svg><polygon points=\"84.80000000000001,160 104,120 89.60000000000001,40 80,40 80,120 80,160\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"100\" x2=\"104\" y2=\"100\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"120\" x2=\"104\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"160\" x2=\"104\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"40\" x2=\"104\" y2=\"40\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"160\" x2=\"80\" y2=\"40\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"140\" x2=\"104\" y2=\"140\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"80\" x2=\"104\" y2=\"80\" stroke=\"red\" stroke-width=\"1.5\"/><polygon points=\"169.60000000000002,140 192,120 169.60000000000002,100 160,100 160,120 160,140\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"192\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/></svg>",
      #|  "<svg><polygon points=\"80,157.6 160,148 320,155.20000000000002 320,164.8 160,172 80,162.4\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"200\" y1=\"172\" x2=\"200\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"172\" x2=\"160\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"172\" x2=\"80\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"320\" y1=\"172\" x2=\"320\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"160\" x2=\"320\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"120\" y1=\"172\" x2=\"120\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"240\" y1=\"172\" x2=\"240\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><polygon points=\"120,115.19999999999999 160,104 200,115.19999999999999 200,124.8 160,136 120,124.8\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/></svg>",
      #|  "<svg><polygon points=\"80,160 160,160 320,160 320,164.8 160,172 80,162.4\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"200\" y1=\"172\" x2=\"200\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"172\" x2=\"160\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"172\" x2=\"80\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"320\" y1=\"172\" x2=\"320\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"160\" x2=\"320\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"120\" y1=\"172\" x2=\"120\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"240\" y1=\"172\" x2=\"240\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><polygon points=\"120,120 160,120 200,120 200,124.8 160,136 120,124.8\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"136\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/></svg>",
      #|  "<svg><polygon points=\"80,157.6 160,148 320,155.20000000000002 320,160 160,160 80,160\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"200\" y1=\"160\" x2=\"200\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"160\" x2=\"160\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"160\" x2=\"80\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"320\" y1=\"160\" x2=\"320\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"80\" y1=\"160\" x2=\"320\" y2=\"160\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"120\" y1=\"160\" x2=\"120\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"240\" y1=\"160\" x2=\"240\" y2=\"148\" stroke=\"red\" stroke-width=\"1.5\"/><polygon points=\"120,115.19999999999999 160,104 200,115.19999999999999 200,120 160,120 120,120\" fill=\"blue\" fill-opacity=\"0.35\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"120\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/><line x1=\"160\" y1=\"120\" x2=\"160\" y2=\"104\" stroke=\"red\" stroke-width=\"1.5\"/></svg>",
      #|]
    ),
  )
}
