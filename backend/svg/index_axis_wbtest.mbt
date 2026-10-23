///|
fn index_data_panel(
  x_axis : @axis.Axis,
  y_axis : @axis.Axis,
  artists : Array[@render.Artist],
  group? : Int32,
) -> @render.Panel {
  @render.panel_with_sharing(
    None,
    artists,
    None,
    [],
    None,
    x_axis,
    y_axis,
    group,
    None,
    false,
    [],
    [],
    x_margin=0.0,
    y_margin=0.0,
  )
}

///|
test "Index renderer data interval excludes explicit view and retains local artists" {
  let x = @axis.axis()
  let y = @axis.axis()
  let artists = [
    @render.Artist::Line(
      [@core.point(0.0, 10.0), @core.point(4.0, 14.0)],
      @core.style("red"),
    ),
  ]
  x.bind_data_interval(fn() {
    let interval = artist_data_interval(artists, true)
    (interval.lower(), interval.upper())
  })
  let locator = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  x.set_locator(locator.as_locator())
  x.set_limits(100.0, 200.0)
  let figure = @render.figure(
    400,
    240,
    0,
    [index_data_panel(x, y, artists)],
    [],
    None,
  )
  let scales = compute_scales(figure)
  assert_eq((scales[0].xmin, scales[0].xmax), (100.0, 200.0))
  assert_eq(locator.call(), [0.0, 1.0, 2.0, 3.0, 4.0])
  for value in locator.call() {
    assert_true(!tick_in_view(value, x.scale(), scales[0].xmin, scales[0].xmax))
  }
  artists.push(
    @render.Artist::Line([@core.point(8.0, 18.0)], @core.style("blue")),
  )
  assert_eq(locator.call(), Array::makei(9, index => Double::from_int(index)))
}

///|
test "Index shared render view unions data but does not replace bound owner data" {
  let x0 = @axis.axis()
  let x1 = @axis.axis()
  let y0 = @axis.axis()
  let y1 = @axis.axis()
  let artists0 = [
    @render.Artist::Line(
      [@core.point(0.0, 0.0), @core.point(2.0, 1.0)],
      @core.style("red"),
    ),
  ]
  let artists1 = [
    @render.Artist::Line(
      [@core.point(100.0, 0.0), @core.point(104.0, 1.0)],
      @core.style("blue"),
    ),
  ]
  x0.bind_data_interval(fn() {
    let data = artist_data_interval(artists0, true)
    (data.lower(), data.upper())
  })
  x1.bind_data_interval(fn() {
    let data = artist_data_interval(artists1, true)
    (data.lower(), data.upper())
  })
  let locator = @ticker.IndexLocator::new(base=1.0, offset=0.0)
  x0.set_locator(locator.as_locator())
  x1.set_locator(locator.as_locator())
  let panels = [
    index_data_panel(x0, y0, artists0, group=0),
    index_data_panel(x1, y1, artists1, group=0),
  ]
  let figure = @render.figure(400, 240, 0, panels, [], None)
  for scale in compute_scales(figure) {
    assert_eq((scale.xmin, scale.xmax), (0.0, 104.0))
  }
  assert_eq(locator.call(), [100.0, 101.0, 102.0, 103.0, 104.0])
  // The source shared setter propagates its final view to both axes.
  // Independent IR Axis handles need that resulting state projected explicitly.
  x0.set_limits(1000.0, 2000.0)
  x1.set_limits(1000.0, 2000.0)
  for scale in compute_scales(figure) {
    assert_eq((scale.xmin, scale.xmax), (1000.0, 2000.0))
  }
  assert_eq(locator.call(), [100.0, 101.0, 102.0, 103.0, 104.0])
}
