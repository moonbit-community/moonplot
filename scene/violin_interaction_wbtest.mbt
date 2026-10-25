///|
fn interactive_violin_axes(
  horizontal~ : Bool = false,
  inverted~ : Bool = false,
) -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  let category = if horizontal { ax.y_axis() } else { ax.x_axis() }
  let value = if horizontal { ax.x_axis() } else { ax.y_axis() }
  category.set_limits(0.0, 2.0)
  value.set_limits(
    if inverted {
      10.0
    } else {
      0.0
    },
    if inverted {
      0.0
    } else {
      10.0
    },
  )
  ax.legend([])
  for axis in [category, value] {
    axis.set_locator(@ticker.NullLocator::new().as_locator())
    axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
  }
  (fig, ax)
}

///|
fn violin_part_target(
  frame : @drawing.Drawing,
  part : @drawing.ViolinPart,
  group~ : Int32 = 0,
) -> @drawing.HitTarget raise {
  for target in frame.targets() {
    if target.info.violin is Some(violin) &&
      violin.group_index == group &&
      violin.part == part {
      return target
    }
  }
  fail("missing violin part")
}

///|
test "violin filled strips select original KDE samples and estimated density in both orientations and directions" {
  for horizontal in [false, true] {
    for inverted in [false, true] {
      let (fig, ax) = interactive_violin_axes(horizontal~, inverted~)
      let stats = ax.violinplot(
        [[1.0, 2.0, 3.0, 4.0, 8.0]],
        points=3,
        width=0.8,
        horizontal~,
        showextrema=false,
        linecolor="none",
        facecolor="red",
        label="Estimated",
      )
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      assert_eq(frame.targets().length(), 4)
      for target in frame.targets() {
        let info = target.info
        let violin = info.violin.unwrap()
        guard violin.part
          is @drawing.ViolinPart::Body(index, coordinate, density) else {
          fail("expected KDE body")
        }
        assert_eq(
          (coordinate, density),
          (stats[0].coords()[index], stats[0].vals()[index]),
        )
        assert_eq(info.value, coordinate)
        assert_eq(
          (violin.group_index, violin.position, violin.horizontal),
          (0, 1.0, horizontal),
        )
        assert_eq(
          (violin.mean, violin.median, violin.minimum, violin.maximum),
          (3.6, 3.0, 1.0, 8.0),
        )
        assert_eq(info.series, "Estimated")
        assert_true(
          target.shape
          is @drawing.HitShape::Quadrilateral(_, _, _, _, _, _, _, _),
        )
        let hit = frame
          .hit_test(info.point.screen_x, info.point.screen_y, radius=0.0)
          .unwrap()
        assert_eq(frame.hit_info(hit).unwrap().violin, Some(violin))
      }
    }
  }
}

///|
test "violin actual mean median extrema range and quantile strokes win over their own filled body" {
  for horizontal in [false, true] {
    let (fig, ax) = interactive_violin_axes(horizontal~)
    ignore(
      ax.violinplot(
        [[1.0, 2.0, 3.0, 4.0, 8.0]],
        points=17,
        width=0.8,
        horizontal~,
        showmeans=true,
        showmedians=true,
        quantiles=[[0.25, 0.75]],
        label="Measured",
      ),
    )
    let frame = fig.to_drawing()
    assert_eq(frame.svg(), fig.to_svg_checked())
    for
      (part, value) in [
        (@drawing.ViolinPart::Mean, 3.6),
        (Median, 3.0),
        (Minimum, 1.0),
        (Maximum, 8.0),
        (Quantile(0, 2.0), 2.0),
        (Quantile(1, 4.0), 4.0),
        (Range, 3.0),
      ] {
      let target = violin_part_target(frame, part)
      guard target.shape is @drawing.HitShape::Segment(x0, y0, x1, y1) else {
        fail("expected actual summary segment")
      }
      let (x, y) = if part == @drawing.ViolinPart::Range {
        if horizontal {
          (5.5 / 10.0 * 400.0, 100.0)
        } else {
          (200.0, (1.0 - 5.5 / 10.0) * 200.0)
        }
      } else {
        (x0 + (x1 - x0) * 0.7, y0 + (y1 - y0) * 0.7)
      }
      let hit = frame.hit_test(x, y, radius=1.0e-8).unwrap()
      let info = frame.hit_info(hit).unwrap()
      assert_eq(info.violin.unwrap().part, part)
      assert_eq(info.value, value)
      assert_eq(info.series, "Measured")
      assert_eq(frame.hit_info(target.info.point), Some(target.info))
    }
  }
}

///|
test "coincident constant violin body and summaries retain unique identities through hit lookup" {
  let (fig, ax) = interactive_violin_axes()
  ignore(
    ax.violinplot(
      [[2.0, 2.0, 2.0]],
      points=5,
      showmeans=true,
      showmedians=true,
      quantiles=[[0.25, 0.75]],
    ),
  )
  let frame = fig.to_drawing()
  assert_true(
    frame
    .targets()
    .any(t => {
      t.shape is @drawing.HitShape::Quadrilateral(_, _, _, _, _, _, _, _)
    }),
  )
  let mean = violin_part_target(frame, @drawing.ViolinPart::Mean)
  let median = violin_part_target(frame, @drawing.ViolinPart::Median)
  assert_true(mean.info.point.point_index != median.info.point.point_index)
  for target in frame.targets() {
    assert_eq(frame.hit_info(target.info.point), Some(target.info))
  }
  let hit = frame.hit_test(200.0, 160.0, radius=0.0).unwrap()
  assert_eq(
    frame.hit_info(hit).unwrap().violin.unwrap().part,
    @drawing.ViolinPart::Quantile(1, 2.0),
  )
  assert_true(
    !frame
    .targets()
    .any(t => t.info.violin.unwrap().part == @drawing.ViolinPart::Range),
  )
}

///|
test "violin one-sided bodies exclude the unpainted half and summaries preserve source side on reversed axes" {
  for horizontal in [false, true] {
    for side in [ViolinSide::Low, High] {
      let (fig, ax) = interactive_violin_axes(horizontal~)
      ignore(
        ax.violinplot(
          [[1.0, 2.0, 3.0, 4.0, 8.0]],
          width=0.8,
          points=5,
          horizontal~,
          side~,
          showextrema=false,
          linecolor="none",
          facecolor="red",
        ),
      )
      let frame = fig.to_drawing()
      let wrong_category = if side is ViolinSide::Low { 1.2 } else { 0.8 }
      let (x, y) = if horizontal {
        (120.0, (1.0 - wrong_category / 2.0) * 200.0)
      } else {
        (wrong_category / 2.0 * 400.0, 140.0)
      }
      assert_eq(frame.hit_test(x, y, radius=1000.0), None)
      assert_true(!frame.targets().is_empty())
    }
  }
}

///|
test "violin missing groups retain original indices and source getters and old frames stay independent" {
  let (fig, ax) = interactive_violin_axes()
  let input = [1.0, 2.0, 3.0]
  let stats = ax.violinplot(
    [[], [0.0 / 0.0, 1.0 / 0.0], input],
    positions=[0.5, 0.75, 1.0],
    points=5,
    quantiles=[[], [0.5], [0.25]],
    showmeans=true,
    showmedians=true,
  )
  let old = fig.to_drawing()
  assert_true(!old.targets().is_empty())
  for target in old.targets() {
    assert_eq(target.info.violin.unwrap().group_index, 2)
    assert_true(target.info.point.point_index >= 11)
  }
  input.clear()
  stats[2].coords().clear()
  stats[2].vals().clear()
  stats.clear()
  assert_eq(fig.to_drawing().targets(), old.targets())
  ax.clear()
  ignore(ax.violinplot([[5.0, 6.0, 7.0]], points=5))
  assert_eq(old.targets()[0].info.violin.unwrap().mean, 2.0)
  assert_eq(fig.to_drawing().targets()[0].info.violin.unwrap().mean, 6.0)
}

///|
test "violin nonlinear domain rejects the whole original body but keeps genuinely valid summary lines" {
  let (fig, ax) = interactive_violin_axes()
  ignore(
    ax.violinplot(
      [[-1.0, 1.0, 2.0]],
      points=5,
      showmeans=true,
      showmedians=true,
      quantiles=[[0.5]],
    ),
  )
  ax.set_y_scale(@scale.log_scale())
  ax.set_y_limits(0.1, 10.0)
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_true(!frame.targets().is_empty())
  for target in frame.targets() {
    assert_true(target.shape is @drawing.HitShape::Segment(_, _, _, _))
    assert_true(
      !(target.info.violin.unwrap().part is @drawing.ViolinPart::Body(_, _, _)),
    )
    assert_true(
      target.info.violin.unwrap().part != @drawing.ViolinPart::Minimum &&
      target.info.violin.unwrap().part != @drawing.ViolinPart::Range,
    )
  }
  ax.clear()
  ignore(
    ax.violinplot([[0.5, 0.5, 0.5]], points=5, showmeans=true, showmedians=true),
  )
  ax.set_y_scale(@scale.logit_scale())
  ax.set_y_limits(0.1, 0.9)
  let constant = fig.to_drawing()
  assert_true(
    constant
    .targets()
    .all(t => {
      !(t.info.violin.unwrap().part is @drawing.ViolinPart::Body(_, _, _))
    }),
  )
  assert_true(!constant.targets().is_empty())
}

///|
test "clipped violin strips keep anchors in their real visible intersection and CSS letterboxes excluded" {
  let (fig, ax) = interactive_violin_axes()
  ignore(
    ax.violinplot(
      [[1.0, 2.0, 3.0, 4.0, 8.0]],
      width=0.8,
      points=3,
      showextrema=false,
      linecolor="none",
      facecolor="red",
    ),
  )
  ax.set_x_limits(1.05, 1.15)
  ax.set_y_limits(2.4, 3.4)
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_true(!frame.targets().is_empty())
  for target in frame.targets() {
    let p = target.info.point
    assert_true(
      p.screen_x >= 0.0 &&
      p.screen_x <= 400.0 &&
      p.screen_y >= 0.0 &&
      p.screen_y <= 200.0,
    )
    let hit = frame
      .hit_test_client(
        p.screen_x * 0.5,
        p.screen_y * 0.5 + 50.0,
        0.0,
        0.0,
        200.0,
        200.0,
        radius=0.0,
      )
      .unwrap()
    assert_eq(frame.hit_info(hit).unwrap().violin, target.info.violin)
  }
  assert_eq(frame.hit_test_client(100.0, 10.0, 0.0, 0.0, 200.0, 200.0), None)
}

///|
test "later violin summary lines win over preceding bar areas and later areas occlude earlier violin strokes" {
  for later_bar in [false, true] {
    let (fig, ax) = interactive_violin_axes()
    if !later_bar {
      ax.bar([@core.point(1.0, 10.0)], color="gray")
    }
    ignore(ax.violinplot([[1.0, 2.0, 3.0, 4.0, 8.0]], showmeans=true, points=5))
    if later_bar {
      ax.bar([@core.point(1.0, 10.0)], color="gray")
    }
    let frame = fig.to_drawing()
    let hit = frame.hit_test(220.0, 128.0, radius=1.0e-8).unwrap()
    let info = frame.hit_info(hit).unwrap()
    if later_bar {
      assert_eq(info.kind, @drawing.HitKind::Bar)
    } else {
      assert_eq(info.violin.unwrap().part, @drawing.ViolinPart::Mean)
    }
  }
}

///|
test "violin original artist identity retains distinct series across image prefixes inline contours and line removal" {
  let (fig, ax) = interactive_violin_axes()
  ax.imshow([[-99.0]], aspect="auto")
  let removed = ax.plot_line(
    LineData::Numeric([1.0, 2.0]),
    LineData::Numeric([1.0, 2.0]),
    label="Remove",
  )
  let contour = ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  ignore(ax.violinplot([[1.0, 2.0, 3.0]], points=5, color="red", label="First"))
  ignore(
    ax.violinplot([[4.0, 5.0, 6.0]], points=5, color="red", label="Second"),
  )
  ax.clabel(contour, inline=true)
  removed.remove()
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  let targets = frame.targets().filter(t => t.info.violin is Some(_))
  assert_true(!targets.is_empty())
  for target in targets {
    let violin = target.info.violin.unwrap()
    assert_eq(violin.group_index, 0)
    assert_eq(
      target.info.series,
      if violin.mean == 2.0 {
        "First"
      } else {
        "Second"
      },
    )
  }
}

///|
test "violin keeps existing zero-width validation rather than inventing filled targets" {
  let (fig, _) = interactive_violin_axes()
  for width in [0.0, -1.0] {
    try fig.violinplot([[1.0, 2.0, 3.0]], width~) catch {
      @core.DataError::InvalidViolin(_) => ()
      _ => fail("expected existing width validation")
    } noraise {
      _ => fail("nonpositive public width must remain rejected")
    }
  }
  assert_eq(fig.to_drawing().targets(), [])
}
