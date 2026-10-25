///|
/// This executable imports only the public facade, without browser packages.
fn main raise {
  let figure = @plot.figure(width=600, height=360)
  figure.set_title("MoonPlot from a release archive")
  figure.set_x_label("Sample")
  figure.set_y_label("Value")
  figure.plot([1.0, 2.0, 3.0], [2.0, 5.0, 4.0])
  let drawing = figure.to_drawing()
  assert_eq(drawing.points().length(), 3)
  assert_eq(drawing.svg(), figure.to_svg())
  let line_info = drawing.hit_info(drawing.points()[0]).unwrap()
  assert_eq(line_info.kind, @plot.HitKind::Line)
  let distribution = @plot.figure(width=400, height=240)
  ignore(distribution.hist([0.0, 0.5, 1.0, 2.0], bins=2, label="Samples"))
  let bins = distribution.to_drawing().targets()
  assert_eq(bins.length(), 2)
  assert_eq(bins[0].info.kind, @plot.HitKind::Histogram)
  assert_eq(bins[0].info.series, "Samples")
  assert_eq(bins[0].info.interval, Some((0.0, 1.0)))
  assert_eq(bins[0].info.value, 2.0)
  let shares = @plot.figure(width=400, height=240)
  ignore(shares.pie([1.0, 3.0], labels=["A", "B"]))
  let slices = shares.to_drawing().targets()
  assert_eq(slices[0].info.fraction, Some(0.25))
  assert_eq(slices[1].info.category, Some("B"))
  let matrix = @plot.figure(width=400, height=240)
  matrix.imshow([[1.0, 2.0], [3.0, 0.0 / 0.0]], aspect="auto")
  let cells = matrix.to_drawing().targets()
  assert_eq(cells.length(), 3)
  assert_eq(cells[2].info.kind, @plot.HitKind::Heatmap)
  let cell = cells[2].info.cell.unwrap()
  assert_eq((cell.row, cell.column), (1, 0))
  assert_eq(cells[2].info.value, 3.0)
  let grouped = @plot.figure(width=400, height=240)
  grouped.legend([])
  grouped.grouped_bar(["A", "B"], [[2.0, -1.0], [3.0, 4.0]], labels=[
    "First", "Second",
  ])
  let groups = grouped.to_drawing().targets()
  assert_eq(groups.length(), 4)
  assert_eq(groups[0].info.category, Some("A"))
  assert_eq(groups[0].info.series, "First")
  assert_eq(groups[3].info.value, 4.0)
  let stacked = @plot.figure(width=400, height=240)
  stacked.legend([])
  stacked.stacked_bar(["A", "B"], [[2.0, -1.0], [3.0, 4.0]], horizontal=true)
  let segments = stacked.to_drawing().targets()
  assert_eq(segments.map(target => target.info.value), [2.0, -1.0, 3.0, 4.0])
  assert_eq(segments[3].info.kind, @plot.HitKind::BarH)
  let ring = @plot.figure(width=400, height=240)
  ignore(ring.donut([1.0, 3.0], labels=["A", "B"]))
  let ring_frame = ring.to_drawing()
  assert_eq(ring_frame.targets()[0].info.fraction, Some(0.25))
  guard ring_frame.targets()[0].shape
    is @plot.HitShape::AnnularSector(cx, cy, _, _, _, _) else {
    fail("Ring shape absent from installed public package")
  }
  assert_eq(ring_frame.hit_test(cx, cy, radius=100.0), None)
  let statistics = @plot.figure(width=400, height=200)
  let axes = statistics.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 10.0)
  axes.legend([])
  axes.fill_between([0.0, 4.0], [1.0, 1.0], [7.0, 7.0], label="Band")
  axes.errorbar([1.0], [4.0], yerr=[2.0], label="Measured")
  let stats_frame = statistics.to_drawing()
  assert_eq(stats_frame.svg(), statistics.to_svg_checked())
  let error = stats_frame
    .hit_info(stats_frame.hit_test(100.0, 100.0, radius=0.0).unwrap())
    .unwrap()
  assert_eq(error.kind, @plot.HitKind::ErrorBar)
  assert_eq(error.series, "Measured")
  assert_eq(error.error.unwrap().y_range, (2.0, 6.0))
  let band = stats_frame
    .hit_info(stats_frame.hit_test(320.0, 100.0, radius=0.0).unwrap())
    .unwrap()
  assert_eq(band.kind, @plot.HitKind::Area)
  assert_eq((band.band.unwrap().lower, band.band.unwrap().upper), (1.0, 7.0))
  assert_eq(band.point.point_index, 1)
  let areas = @plot.figure(width=400, height=240)
  areas.legend([])
  ignore(
    areas.stackplot(
      [0.0, 1.0],
      [[2.0, 3.0], [4.0, 1.0]],
      labels=["First", "Second"],
      baseline="sym",
    ),
  )
  let area_frame = areas.to_drawing()
  assert_eq(area_frame.svg(), areas.to_svg_checked())
  for target in area_frame.targets() {
    let info = target.info
    assert_true(info.band.unwrap().stacked)
    let expected = if info.series == "First" { [2.0, 3.0] } else { [4.0, 1.0] }
    assert_eq(info.value, expected[info.point.point_index])
  }
  assert_true(!area_frame.targets().is_empty())
  let boxes = @plot.figure(width=400, height=240)
  boxes.legend([])
  let computed = boxes.boxplot(
    [[1.0, 2.0, 3.0, 4.0, 5.0, 20.0]],
    label="Distribution",
  )
  let box_frame = boxes.to_drawing()
  assert_eq(box_frame.svg(), boxes.to_svg_checked())
  let mut saw_outlier = false
  for target in box_frame.targets() {
    let box = target.info.box.unwrap()
    assert_eq(
      (box.group_index, box.q1, box.median, box.q3),
      (0, computed[0].q1(), computed[0].median(), computed[0].q3()),
    )
    if box.part is @plot.BoxPart::Outlier(value) {
      saw_outlier = true
      assert_eq((value, target.info.value), (20.0, 20.0))
      assert_eq(
        box_frame.hit_test(
          target.info.point.screen_x,
          target.info.point.screen_y,
          radius=0.0,
        ),
        Some(target.info.point),
      )
    }
  }
  assert_true(saw_outlier)
  let mesh = @plot.figure(width=400, height=240)
  mesh.legend([])
  mesh.pcolormesh([[2.0, 0.0 / 0.0], [7.0, 9.0]], x=[0.0, 1.0, 4.0], y=[
    -1.0, 2.0, 5.0,
  ])
  let mesh_frame = mesh.to_drawing()
  assert_eq(mesh_frame.svg(), mesh.to_svg_checked())
  let mesh_targets = mesh_frame.targets()
  assert_eq(mesh_targets.map(t => t.info.point.point_index), [0, 2, 3])
  assert_eq(mesh_targets.map(t => t.info.value), [2.0, 7.0, 9.0])
  let first_mesh = mesh_targets[0].info.cell.unwrap()
  assert_eq((first_mesh.row, first_mesh.column), (0, 0))
  assert_eq((first_mesh.x_range, first_mesh.y_range), ((0.0, 1.0), (-1.0, 2.0)))
  let binned = @plot.figure(width=400, height=240)
  binned.legend([])
  binned.hist2d([0.0, 0.2, 1.8, 2.0], [0.0, 0.2, 0.0, 2.0], bins_x=2, bins_y=2)
  let bins_frame = binned.to_drawing()
  assert_eq(bins_frame.svg(), binned.to_svg_checked())
  let count_targets = bins_frame.targets()
  assert_eq(count_targets.map(t => t.info.value), [2.0, 1.0, 0.0, 1.0])
  for target in count_targets {
    assert_eq(target.info.kind, @plot.HitKind::Histogram2D)
    let cell = target.info.cell.unwrap()
    assert_eq(target.info.point.point_index, cell.row * 2 + cell.column)
  }
  assert_eq(count_targets[2].info.cell.unwrap().x_range, (0.0, 1.0))
  assert_eq(count_targets[2].info.cell.unwrap().y_range, (1.0, 2.0))
  for horizontal in [false, true] {
    let probabilities = @plot.figure(width=400, height=240)
    probabilities.legend([])
    if horizontal {
      probabilities.set_x_scale(@plot.logit_scale())
      probabilities.set_x_limits(0.01, 0.99)
      probabilities.set_y_limits(0.0, 2.0)
      probabilities.barh([1.0], [1.0])
    } else {
      probabilities.set_y_scale(@plot.logit_scale())
      probabilities.set_x_limits(0.0, 2.0)
      probabilities.set_y_limits(0.01, 0.99)
      probabilities.bar([@plot.point(1.0, 1.0)])
    }
    let frame = probabilities.to_drawing()
    assert_eq(frame.svg(), probabilities.to_svg_checked())
    assert_eq(frame.targets().length(), 1)
    let target = frame.targets()[0]
    assert_eq(target.info.value, 1.0)
    guard target.shape is @plot.HitShape::Rectangle(x, y, width, height) else {
      fail("Installed ordinary Logit bar has no real rectangle")
    }
    assert_true(width > 0.0 && height > 0.0)
    assert_eq(
      frame.hit_test(x + width / 2.0, y + height / 2.0, radius=0.0),
      Some(target.info.point),
    )
  }
  let hexagons = @plot.figure(width=400, height=240)
  hexagons.legend([])
  let aggregated = hexagons.hexbin(
    [1.0, 1.0, 1.0],
    [1.0, 1.0, 1.0],
    values=[2.0, 4.0, 6.0],
    gridsize=4,
    extent=[0.0, 4.0, 0.0, 4.0],
    reduce="mean",
    label="Aggregates",
  )
  assert_eq(aggregated.counts(), [3])
  assert_eq(aggregated.values(), [4.0])
  let hex_frame = hexagons.to_drawing()
  assert_eq(hex_frame.svg(), hexagons.to_svg_checked())
  assert_eq(hex_frame.points().length(), 1)
  assert_eq(hex_frame.targets().length(), 2)
  for target in hex_frame.targets() {
    assert_eq(target.info.kind, @plot.HitKind::Hexbin)
    assert_eq(target.info.value, 4.0)
    assert_eq(target.info.series, "Aggregates")
    let bin = target.info.hexbin.unwrap()
    assert_eq(bin.count, 3)
    assert_eq(bin.reduction, @plot.HexbinReduction::Mean)
    assert_eq(hex_frame.hit_info(target.info.point), Some(target.info))
  }
  let violins = @plot.figure(width=400, height=240)
  violins.legend([])
  let summaries = violins.violinplot(
    [[1.0, 2.0, 3.0, 4.0, 5.0]],
    points=5,
    showmeans=true,
    showmedians=true,
    quantiles=[[0.25]],
    label="Distribution",
  )
  let violin_frame = violins.to_drawing()
  assert_eq(violin_frame.svg(), violins.to_svg_checked())
  let mut saw_density = false
  let mut saw_quantile = false
  for target in violin_frame.targets() {
    assert_eq(target.info.kind, @plot.HitKind::Violin)
    assert_eq(target.info.series, "Distribution")
    let violin = target.info.violin.unwrap()
    assert_eq(violin.group_index, 0)
    assert_eq(violin.mean, 3.0)
    assert_eq(violin.median, 3.0)
    assert_eq((violin.minimum, violin.maximum), (1.0, 5.0))
    // Even coincident means, medians and body samples preserve their own part.
    assert_eq(violin_frame.hit_info(target.info.point), Some(target.info))
    match violin.part {
      @plot.ViolinPart::Body(index, coordinate, density) => {
        assert_eq(coordinate, summaries[0].coords()[index])
        assert_eq(density, summaries[0].vals()[index])
        assert_eq(target.info.value, coordinate)
        saw_density = true
      }
      @plot.ViolinPart::Quantile(index, value) => {
        assert_eq(index, 0)
        assert_eq(value, 2.0)
        saw_quantile = true
      }
      _ => ()
    }
  }
  assert_true(saw_density && saw_quantile)
  verify_step_consumer()
  verify_step_roundtrip_consumer()
  verify_stairs_consumer()
  verify_ecdf_consumer()
  verify_discrete_coincident_consumer()
  verify_stem_consumer()
  verify_vector_consumer()
  verify_barb_consumer()
  println(drawing.svg())
}
