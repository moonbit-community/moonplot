///|
fn typed_autoscale_figure(
  x : @axis.Axis,
  points : Array[@core.Point],
  margin~ : Double = 0.05,
  bounds~ : @core.Bounds? = None,
) -> @render.Figure {
  @render.figure(
    400,
    200,
    0,
    [
      @render.panel_with_sharing(
        None,
        [@render.Artist::Line(points, @core.style("red"))],
        None,
        [],
        bounds,
        x,
        @axis.axis(horizontal=false),
        None,
        None,
        false,
        [],
        [],
        x_margin=margin,
      ),
    ],
    [],
    None,
  )
}

///|
test "category standalone ranges use ordinary source locator nonsingular rather than a half category" {
  let x = @axis.axis()
  x.set_categories(["one"])
  x.request_autoscale()
  let figure = typed_autoscale_figure(x, [@core.point(0.0, 1.0)])
  let scale = compute_scale(figure, 0)
  assert_eq(scale.xmin, -0.05500000000000001)
  assert_eq(scale.xmax, 0.05500000000000001)
  assert_eq(x.tick_values_checked(@core.limits(scale.xmin, scale.xmax)), [0.0])
}

///|
test "date standalone ranges store the source automatic expansion and ignore later formatter role changes" {
  let x = @axis.axis()
  x.set_date()
  x.request_autoscale()
  let figure = typed_autoscale_figure(x, [@core.point(10000.0, 1.0)])
  let first = compute_scale(figure, 0)
  assert_eq((first.xmin, first.xmax), (9197.0, 10803.0))
  let formatter = @ticker.FuncFormatter::new((_, pos) => {
    "date-position:" + pos.unwrap_or(-1).to_string()
  }).as_base_formatter()
  x.set_named_formatter(formatter)
  let second = compute_scale(figure, 0)
  assert_eq((second.xmin, second.xmax), (first.xmin, first.xmax))
  let bundle = numeric_axis_bundle(x, @core.limits(second.xmin, second.xmax))
  assert_true(bundle.major.length() >= 5)
  assert_true(bundle.major_labels[0].has_prefix("date-position:"))
  assert_true(x.auto_date_locator() is Some(_))
  assert_true(!x.autoscale_stale())
}

///|
test "date standalone shared ranges union raw data without treating another viewport as date data" {
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_date()
  second.set_date()
  second.set_limits(1000.0, 2000.0)
  first.request_autoscale()
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(
        first,
        @axis.axis(horizontal=false),
        [autoscale_range_line(10.0, 20.0)],
        Some(0),
      ),
      autoscale_range_panel(
        second,
        @axis.axis(horizontal=false),
        [autoscale_range_line(30.0, 40.0)],
        Some(0),
      ),
    ],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (10.0, 40.0))
  assert_eq(
    (second.stored_view_limits().lower(), second.stored_view_limits().upper()),
    (10.0, 40.0),
  )
  assert_true(!second.autoscale_on())
}

///|
test "typed standalone explicit panel bounds remain views independent of category data" {
  let x = @axis.axis()
  x.set_categories(["first", "second"])
  let figure = typed_autoscale_figure(
    x,
    [@core.point(0.0, 1.0), @core.point(1.0, 2.0)],
    bounds=Some(@core.bounds(100.0, 200.0, 3.0, 4.0)),
  )
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (100.0, 200.0))
  let data = artist_data_interval(figure.panels()[0].artists(), true)
  assert_eq((data.lower(), data.upper()), (0.0, 1.0))
  assert_true(!x.autoscale_on())
}

///|
test "category locators retain their full list while an independent named formatter batches before visibility" {
  let x = @axis.axis()
  x.set_categories(["first", "second", "third"])
  x.set_limits(-0.25, 0.25)
  let seen : Array[(Double, Int32?)] = []
  x.set_named_formatter(
    @ticker.FuncFormatter::new((value, position) => {
      seen.push((value, position))
      "category-position:" + position.unwrap_or(-1).to_string()
    }).as_base_formatter(),
  )
  let bundle = numeric_axis_bundle(x, @core.limits(-0.25, 0.25))
  assert_eq(bundle.major, [0.0, 1.0, 2.0])
  assert_eq(seen, [(0.0, Some(0)), (1.0, Some(1)), (2.0, Some(2))])
  assert_eq(bundle.major_labels, [
    "category-position:0", "category-position:1", "category-position:2",
  ])
  assert_eq(x.categories(), Some(["first", "second", "third"]))
}

///|
test "typed explicit stored ranges skip checked autoscale data callbacks" {
  let x = @axis.axis()
  x.set_date()
  x.set_limits(100.0, 200.0)
  x.request_autoscale()
  x.bind_autoscale_minpos(() => {
    raise @core.DataError::InvalidTicks(message="raw minima are unreachable")
  })
  let scale = compute_scale(
    typed_autoscale_figure(x, [@core.point(10000.0, 1.0)]),
    0,
  )
  assert_eq((scale.xmin, scale.xmax), (100.0, 200.0))
  assert_true(!x.autoscale_stale())
}

///|
test "category generated locations preserve Python integer formatting while explicit Double batches remain floats" {
  let x = @axis.axis()
  x.set_categories(["first", "second"])
  x.set_limits(-0.25, 0.25)
  let formatter = @ticker.StrMethodFormatter::new("{x:d}/{x!r}").as_base_formatter()
  x.set_named_formatter(formatter)
  let bundle = numeric_axis_bundle(x, @core.limits(-0.25, 0.25))
  assert_eq(bundle.major, [0.0, 1.0])
  assert_eq(bundle.major_labels, ["0/0", "1/1"])
  assert_true(formatter.locations() is @ticker.FormatterLocations::Integers(_))
  assert_eq(formatter.locations().dtype(), None)
  assert_true(
    try {
      ignore(x.tick_labels_checked([0.0]))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.contains("Unknown format code")
      _ => false
    },
  )
}
