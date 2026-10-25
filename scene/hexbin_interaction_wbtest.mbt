///|
fn hexbin_axes() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 4.0)
  ax.set_y_limits(0.0, 4.0)
  ax.legend([])
  for axis in [ax.x_axis(), ax.y_axis()] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, ax)
}

///|
fn hexbin_pair(
  ax : Axes,
  mincnt~ : Int32 = 0,
  marginals~ : Bool = false,
  color~ : String = "",
  label~ : String = "Bins",
) -> Hexbin raise {
  ax.hexbin(
    [0.8, 1.2, 2.8, 3.1, 3.2],
    [1.6, 2.2, 1.6, 2.0, 2.2],
    gridsize=2,
    extent=[0.0, 4.0, 0.0, 4.0],
    mincnt~,
    marginals~,
    color~,
    label~,
  )
}

///|
test "hexbin interaction returns real centers lattice indices counts and values throughout both true halves" {
  let (fig, ax) = hexbin_axes()
  let bins = hexbin_pair(ax)
  assert_eq(bins.counts(), [2, 3])
  assert_eq(bins.centers().map(p => (p.x(), p.y())), [(1.0, 2.0), (3.0, 2.0)])
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(frame.points().length(), 2)
  assert_eq(frame.targets().length(), 4)
  for index in 0..<2 {
    let first = frame.targets()[index * 2]
    let second = frame.targets()[index * 2 + 1]
    assert_eq(first.info, second.info)
    assert_eq(first.info.kind, @drawing.HitKind::Hexbin)
    assert_eq(first.info.series, "Bins")
    assert_eq(first.info.value, bins.values()[index])
    assert_eq(
      first.info.hexbin,
      Some(@drawing.hexbin_info(1, index, index + 2)),
    )
    assert_eq(first.info.point.point_index, index)
    for target in [first, second] {
      guard target.shape
        is @drawing.HitShape::Quadrilateral(ax, ay, bx, by, cx, cy, dx, dy) else {
        fail("Expected a real four-vertex half")
      }
      // The mean of each convex half's actual vertices is strictly inside it.
      let x = (ax + bx + cx + dx) / 4.0
      let y = (ay + by + cy + dy) / 4.0
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        assert_eq(
          frame.hit_test(x, y, radius=0.0, mode~),
          Some(first.info.point),
        )
      }
    }
    let p = first.info.point
    assert_eq(frame.hit_test(p.screen_x, p.screen_y, radius=0.0), Some(p))
  }
  // The first bin's top-right bounding-box corner lies outside the hexagon.
  assert_eq(frame.hit_test(190.0, 40.0, radius=1000.0), None)
}

///|
test "hexbin interaction preserves all stored reducers and logarithmic color bins without repeating callbacks" {
  for
    (reduce, reduction, expected) in [
      ("mean", @drawing.HexbinReduction::Mean, 3.0),
      ("sum", Sum, 9.0),
      ("min", Min, 1.0),
      ("max", Max, 5.0),
      ("count", Count, 3.0),
    ] {
    for bins in ["linear", "log"] {
      let (fig, ax) = hexbin_axes()
      let result = ax.hexbin(
        [0.1, 0.1, 0.1],
        [0.1, 0.1, 0.1],
        values=[1.0, 3.0, 5.0],
        gridsize=2,
        extent=[0.0, 4.0, 0.0, 4.0],
        reduce~,
        bins~,
      )
      let frame = fig.to_drawing()
      let info = frame.targets()[0].info
      assert_eq((info.value, result.values()[0]), (expected, expected))
      assert_eq(info.hexbin, Some(@drawing.hexbin_info(0, 0, 3, reduction~)))
    }
  }
  let (fig, ax) = hexbin_axes()
  let calls = @ref.Ref(0)
  let source = [1.0, 3.0, 5.0]
  let result = ax.hexbin(
    [0.1, 0.1, 0.1],
    [0.1, 0.1, 0.1],
    values=source,
    gridsize=2,
    extent=[0.0, 4.0, 0.0, 4.0],
    reduce="count",
    reduce_fn=Some(
      hexbin_reducer(samples => {
        calls.val += 1
        let value = samples[0] * 10.0 + samples[1] + samples[2]
        samples[0] = 999.0
        value
      }),
    ),
  )
  assert_eq(calls.val, 1)
  source[0] = -999.0
  result.values()[0] = 999.0
  result.counts()[0] = 999
  result.centers().clear()
  let first = fig.to_drawing()
  ignore(fig.to_svg_checked())
  ignore(fig.to_drawing())
  assert_eq(calls.val, 1)
  assert_eq(first.targets()[0].info.value, 18.0)
  assert_eq(
    first.targets()[0].info.hexbin.unwrap().reduction,
    @drawing.HexbinReduction::Custom,
  )
  assert_eq(first.targets()[0].info.hexbin.unwrap().count, 3)
}

///|
test "hexbin interaction mincnt extent and empty bins follow the original returned order" {
  let (fig, ax) = hexbin_axes()
  let result = hexbin_pair(ax, mincnt=3)
  assert_eq(result.counts(), [3])
  let info = fig.to_drawing().targets()[0].info
  assert_eq(info.point.point_index, 0)
  assert_eq(info.hexbin, Some(@drawing.hexbin_info(1, 1, 3)))
  ax.clear()
  ignore(hexbin_pair(ax))
  ax.set_x_limits(2.0, 4.0)
  let clipped = fig.to_drawing()
  assert_eq(clipped.points().length(), 1)
  assert_eq(clipped.points()[0].point_index, 1)
  assert_eq(clipped.targets()[0].info.hexbin.unwrap().column, 1)
  ax.set_x_limits(0.0, 4.0)
  ax.clear()
  let result = ax.hexbin(
    [-1.0, 0.1, 0.2, 99.0],
    [-1.0, 0.1, 0.2, 99.0],
    values=[999.0, 1.0, 2.0, 999.0],
    gridsize=2,
    extent=[0.0, 4.0, 0.0, 4.0],
    reduce="sum",
  )
  assert_eq(result.counts(), [2])
  assert_eq(fig.to_drawing().targets()[0].info.value, 3.0)
  ax.clear()
  ignore(hexbin_pair(ax, mincnt=99))
  assert_eq(fig.to_drawing().targets().length(), 0)
  ax.clear()
  let result = ax.hexbin([], [], gridsize=2, extent=[0.0, 4.0, 0.0, 4.0])
  assert_eq(result.counts(), [])
  assert_eq(fig.to_drawing().targets().length(), 0)
}

///|
test "hexbin interaction marginal mode transparent fills and nonfinite reductions remain static" {
  for color in ["none", "transparent", "#f000", "#ff000000"] {
    let (fig, ax) = hexbin_axes()
    ignore(hexbin_pair(ax, color~))
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    assert_eq(frame.targets().length(), 0)
    assert_eq(frame.hit_test(100.0, 125.0, radius=1000.0), None)
  }
  let (fig, ax) = hexbin_axes()
  let marginal = hexbin_pair(ax, marginals=true, mincnt=3)
  assert_eq(marginal.counts(), [3])
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_true(ax.state.val.artists.length() > 1)
  assert_eq(frame.targets().length(), 0)
  ax.clear()
  let result = ax.hexbin(
    [0.1, 0.1],
    [0.1, 0.1],
    values=[1.0e308, 1.0e308],
    gridsize=2,
    extent=[0.0, 4.0, 0.0, 4.0],
    reduce="sum",
  )
  assert_true(result.values()[0].is_inf())
  assert_eq(fig.to_drawing().targets().length(), 0)
}

///|
test "hexbin interaction logarithmic symmetric and reversed axes use actual mapped vertices and original centers" {
  for
    scale in [
      @scale.log_scale(),
      @scale.symlog_scale(linthresh=1.0),
      @scale.asinh_scale(),
      @scale.logit_scale(),
    ] {
    for reverse in [false, true] {
      let (fig, ax) = hexbin_axes()
      ax.set_x_scale(scale)
      ax.set_y_scale(scale)
      let (lower, upper) = if scale.is_logit() {
        (0.1, 0.9)
      } else if scale.is_log() {
        (1.0, 100.0)
      } else {
        (-100.0, 100.0)
      }
      ax.set_x_limits(
        if reverse {
          upper
        } else {
          lower
        },
        if reverse {
          lower
        } else {
          upper
        },
      )
      ax.set_y_limits(lower, upper)
      let mid = scale.inverse(
        (scale.transform(lower) + scale.transform(upper)) / 2.0,
      )
      let result = ax.hexbin([mid], [mid], gridsize=4, extent=[
        lower, upper, lower, upper,
      ])
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      assert_eq(frame.targets().length(), 2)
      let p = frame.points()[0]
      assert_eq(
        (p.data_x, p.data_y),
        (result.centers()[0].x(), result.centers()[0].y()),
      )
      assert_eq(frame.hit_test(p.screen_x, p.screen_y, radius=0.0), Some(p))
      assert_eq(frame.targets()[0].info.hexbin.unwrap().count, 1)
    }
  }
}

///|
test "hexbin interaction retains visible faces when centers lie outside limits and rejects painter-truncated faces" {
  let (fig, ax) = hexbin_axes()
  ignore(ax.hexbin([0.8], [1.6], gridsize=2, extent=[0.0, 4.0, 0.0, 4.0]))
  ax.set_x_limits(1.2, 2.0)
  let frame = fig.to_drawing()
  assert_true(frame.points()[0].screen_x < 0.0)
  let p = frame.hit_test(100.0, 100.0, radius=0.0).unwrap()
  assert_eq((p.data_x, p.data_y), (1.0, 2.0))
  assert_eq(frame.hit_test(-1.0, 125.0), None)
  // Later axis-domain changes can make append_polygon discard source vertices.
  ax.clear()
  ax.set_x_scale(@scale.linear_scale())
  ignore(ax.hexbin([0.2], [1.8], gridsize=2, extent=[-0.25, 1.75, 0.0, 4.0]))
  ax.set_x_scale(@scale.log_scale())
  ax.set_x_limits(0.01, 2.0)
  let incomplete = fig.to_drawing()
  assert_eq(incomplete.svg(), fig.to_svg_checked())
  assert_eq(incomplete.targets().length(), 0)
}

///|
test "hexbin interaction color equality preserves series identity and later faces cover both earlier halves" {
  let (fig, ax) = hexbin_axes()
  ignore(hexbin_pair(ax, color="red", label="First"))
  ignore(
    ax.hexbin(
      [0.8],
      [1.6],
      values=[42.0],
      gridsize=2,
      extent=[0.0, 4.0, 0.0, 4.0],
      color="red",
      label="Last",
    ),
  )
  let frame = fig.to_drawing()
  assert_eq(frame.points().length(), 3)
  let expected = frame.points()[2]
  for (x, y) in [(80.0, 80.0), (120.0, 120.0), (100.0, 100.0)] {
    let p = frame.hit_test(x, y, radius=0.0).unwrap()
    assert_eq(p, expected)
    assert_eq(frame.hit_info(p).unwrap().series, "Last")
    assert_eq(frame.hit_info(p).unwrap().value, 42.0)
  }
}

///|
test "hexbin interaction both halves retain statistical overlay priority and reverse painting coverage" {
  for error_first in [false, true] {
    let (fig, ax) = hexbin_axes()
    if error_first {
      ax.errorbar([0.8, 1.2], [2.4, 1.6], xerr=[0.15, 0.15], label="Measured")
    }
    ignore(ax.hexbin([0.8], [1.6], gridsize=2, extent=[0.0, 4.0, 0.0, 4.0]))
    if !error_first {
      ax.errorbar([0.8, 1.2], [2.4, 1.6], xerr=[0.15, 0.15], label="Measured")
    }
    let frame = fig.to_drawing()
    for (x, y) in [(80.0, 80.0), (120.0, 120.0)] {
      for mode in [@drawing.HitMode::Nearest, XNearest] {
        let p = frame.hit_test(x, y, radius=1.0e-10, mode~).unwrap()
        assert_eq(
          frame.hit_info(p).unwrap().kind,
          if error_first {
            @drawing.HitKind::Hexbin
          } else {
            ErrorBar
          },
        )
      }
    }
  }
}

///|
test "hexbin interaction CSS letterboxes legends panels and immutable rebuilds compose" {
  let (fig, ax) = hexbin_axes()
  ignore(hexbin_pair(ax))
  let frame = fig.to_drawing()
  let p = frame.points()[0]
  assert_eq(
    frame.hit_test_client(
      10.0 + p.screen_x / 2.0,
      20.0 + p.screen_y / 2.0,
      10.0,
      20.0,
      200.0,
      100.0,
      radius=0.0,
    ),
    Some(p),
  )
  assert_eq(
    frame.hit_test_client(
      p.screen_x,
      100.0 + p.screen_y,
      0.0,
      0.0,
      400.0,
      400.0,
      radius=0.0,
    ),
    Some(p),
  )
  assert_eq(frame.hit_test_client(100.0, 20.0, 0.0, 0.0, 400.0, 400.0), None)
  ax.set_y_limits(0.0, 2.5)
  assert_true(fig.to_drawing().hit_test(300.0, 24.0, radius=0.0) is Some(_))
  ax.legend([legend_entry("Bins")])
  let legend = fig.to_drawing()
  assert_eq(legend.hit_test(300.0, 24.0, radius=0.0), None)
  let other = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  other.set_x_limits(0.0, 4.0)
  other.set_y_limits(0.0, 4.0)
  other.legend([])
  ignore(hexbin_pair(other, label="Other"))
  let overlay = fig.to_drawing()
  let q = overlay.hit_test(p.screen_x, p.screen_y, radius=0.0).unwrap()
  assert_eq(q.panel_index, 1)
  assert_eq(overlay.hit_info(q).unwrap().series, "Other")
  ax.clear()
  other.clear()
  ignore(
    other.hexbin([0.1], [0.1], values=[99.0], gridsize=2, extent=[
      0.0, 4.0, 0.0, 4.0,
    ]),
  )
  frame.targets().clear()
  assert_eq(frame.hit_info(p).unwrap().value, 2.0)
  assert_eq(fig.to_drawing().targets()[0].info.value, 99.0)
}
