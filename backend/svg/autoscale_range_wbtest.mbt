///|
fn autoscale_range_panel(
  x : @axis.Axis,
  y : @axis.Axis,
  artists : Array[@render.Artist],
  group : Int32?,
  bounds~ : @core.Bounds? = None,
  margin~ : Double = 0.0,
) -> @render.Panel {
  @render.panel_with_sharing(
    None,
    artists,
    None,
    [],
    bounds,
    x,
    y,
    group,
    None,
    false,
    [],
    [],
    x_margin=margin,
    y_margin=margin,
  )
}

///|
fn autoscale_range_line(lower : Double, upper : Double) -> @render.Artist {
  @render.Artist::Line(
    [@core.point(lower, 1.0), @core.point(upper, 2.0)],
    @core.style("red"),
  )
}

///|
test "standalone numeric autoscale uses shared raw data rather than a peer viewport" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let first = @axis.axis()
  let second = @axis.axis()
  second.set_limits(1000.0, 2000.0)
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(
        first,
        @axis.axis(),
        [autoscale_range_line(0.0, 1.0)],
        Some(0),
      ),
      autoscale_range_panel(
        second,
        @axis.axis(),
        [autoscale_range_line(10.0, 20.0)],
        Some(0),
      ),
    ],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (0.0, 20.0))
  assert_eq(
    (second.stored_view_limits().lower(), second.stored_view_limits().upper()),
    (0.0, 20.0),
  )
  assert_true(!second.autoscale_on())
}

///|
test "standalone explicit numeric viewport skips pending range providers" {
  let x = @axis.axis()
  x.set_limits(100.0, 200.0)
  x.request_autoscale()
  x.bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(message="unreachable shared minpos")
  })
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(
        x,
        @axis.axis(),
        [autoscale_range_line(0.0, 1.0)],
        None,
      ),
    ],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (100.0, 200.0))
  assert_true(!x.autoscale_stale())
  assert_true(!x.autoscale_on())
}

///|
test "standalone IR bounds are explicit views while artist intervals remain raw" {
  let x = @axis.axis()
  x.set_auto_limits(-10.0, -5.0)
  let artists = [autoscale_range_line(1.0, 2.0)]
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(
        x,
        @axis.axis(),
        artists,
        None,
        bounds=Some(@core.bounds(100.0, 200.0, 3.0, 4.0)),
      ),
    ],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (100.0, 200.0))
  let raw = artist_data_interval(artists, true)
  assert_eq((raw.lower(), raw.upper()), (1.0, 2.0))
  assert_true(!x.autoscale_on())
}

///|
test "Scene resolver output owns its viewport before IR group selection" {
  let x = @axis.axis()
  let reads = [0]
  x.bind_autoscale_view(() => {
    reads[0] += 1
    ignore(x.set_bound_limits_checked(2.0, 3.0))
  })
  x.bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(message="unreachable fallback minpos")
  })
  let peer = @axis.axis()
  peer.set_limits(100.0, 200.0)
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(peer, @axis.axis(), [], Some(0)),
      autoscale_range_panel(
        x,
        @axis.axis(),
        [autoscale_range_line(-1000.0, 1000.0)],
        Some(0),
      ),
    ],
    [],
    None,
  )
  let scale = compute_scale(figure, 1)
  assert_eq((scale.xmin, scale.xmax), (2.0, 3.0))
  assert_eq(reads[0], 1)
}

///|
test "render minpos includes positive interior data and preserves explicit provider failures" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  x.set_scale(@ticker_scale.log_scale())
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(
        x,
        @axis.axis(),
        [
          @render.Artist::Line(
            [
              @core.point(-1.0, 1.0),
              @core.point(0.001, 1.0),
              @core.point(100.0, 2.0),
            ],
            @core.style("red"),
          ),
        ],
        None,
      ),
    ],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_true((scale.xmin / 0.001 - 1.0).abs() < 1.0e-12)
  assert_true((scale.xmax / 100.0 - 1.0).abs() < 1.0e-12)
  x.request_autoscale()
  x.bind_minpos(() => {
    raise @core.DataError::InvalidTicks(message="own minpos poison")
  })
  assert_true(
    try {
      ignore(compute_scale(figure, 0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "own minpos poison"
      _ => false
    },
  )
}

///|
test "typed bar baseline sticky edges clamp only their data direction" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let bars = [
    @render.Artist::Bar(
      [@core.point(1.0, 2.0), @core.point(2.0, 4.0)],
      @core.style("red"),
    ),
  ]
  assert_eq(artist_sticky_edges(bars, true), [])
  assert_eq(artist_sticky_edges(bars, false), [0.0, 0.0])
  let figure = @render.figure(
    400,
    200,
    0,
    [autoscale_range_panel(@axis.axis(), @axis.axis(), bars, None, margin=0.05)],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_eq(scale.ymin, 0.0)
  assert_true((scale.ymax / 4.2 - 1.0).abs() < 1.0e-12)
}

///|
test "no finite data preserves mutated automatic views before reading minpos" {
  let x = @axis.axis()
  x.set_auto_limits(100.0, 200.0)
  x.request_autoscale()
  x.bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(message="unreachable empty-data minpos")
  })
  let figure = @render.figure(
    400,
    200,
    0,
    [autoscale_range_panel(x, @axis.axis(), [], None)],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (100.0, 200.0))
  assert_true(x.autoscale_on())
}

///|
test "standalone set_bound reads view twice and uses the second direction" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let reads = [0]
  x.bind_view_interval(() => {
    reads[0] += 1
    if reads[0] == 1 {
      (0.0, 1.0)
    } else {
      (1.0, 0.0)
    }
  })
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(
        x,
        @axis.axis(),
        [autoscale_range_line(10.0, 20.0)],
        None,
      ),
    ],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (20.0, 10.0))
  assert_eq(reads[0], 2)
}

///|
test "standalone pending requests are shared even when target already stores a view" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let first = @axis.axis()
  let second = @axis.axis()
  first.set_auto_limits(100.0, 200.0)
  second.set_auto_limits(100.0, 200.0)
  second.request_autoscale()
  assert_true(!first.autoscale_stale())
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(
        first,
        @axis.axis(),
        [autoscale_range_line(0.0, 1.0)],
        Some(0),
      ),
      autoscale_range_panel(
        second,
        @axis.axis(),
        [autoscale_range_line(10.0, 20.0)],
        Some(0),
      ),
    ],
    [],
    None,
  )
  let scale = compute_scale(figure, 0)
  assert_eq((scale.xmin, scale.xmax), (0.0, 20.0))
  assert_eq(
    (second.stored_view_limits().lower(), second.stored_view_limits().upper()),
    (0.0, 20.0),
  )
  assert_true(!first.autoscale_stale())
  assert_true(!second.autoscale_stale())
}

///|
test "raw autoscale minpos does not consume the final own-axis provider early" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  @config.set_axes_autolimit_mode("data")
  let x = @axis.axis()
  let events : Array[String] = []
  x.bind_view_interval(() => {
    events.push("view")
    (0.0, 1.0)
  })
  x.bind_shared_minpos(() => {
    raise @core.DataError::InvalidTicks(
      message="unexpected locator shared minpos",
    )
  })
  x.bind_minpos(() => {
    events.push("own")
    raise @core.DataError::InvalidTicks(message="final own minpos")
  })
  let figure = @render.figure(
    400,
    200,
    0,
    [
      autoscale_range_panel(
        x,
        @axis.axis(),
        [autoscale_range_line(10.0, 20.0)],
        None,
      ),
    ],
    [],
    None,
  )
  assert_true(
    try {
      ignore(compute_scale(figure, 0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) => message == "final own minpos"
      _ => false
    },
  )
  assert_eq(events, ["view", "view", "own"])
}
