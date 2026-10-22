// Generated from actual Grouper/GridSpec/Axes.share*/Axis setter/Figure removal AST.

///|
test "Index actual Grouper order 0 Figure all remove [0]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 3)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
}

///|
test "Index actual Grouper order 1 Figure all remove [1]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 3)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
}

///|
test "Index actual Grouper order 2 Figure all remove [2]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 3)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  figure.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0, 1024.0])
}

///|
test "Index actual Grouper order 3 Figure all remove [0]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 4 Figure all remove [1]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 5 Figure all remove [2]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 6 Figure all remove [3]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 7 Figure all remove [0]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 8 Figure all remove [1]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 9 Figure all remove [2]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 10 Figure all remove [3]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 11 Figure row remove [0]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 12 Figure row remove [1]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 13 Figure row remove [2]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 14 Figure row remove [3]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 15 Figure row remove [4]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[4])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[4].plot([44.0], [1044.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 16 Figure row remove [5]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[5])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[5].plot([54.0], [1054.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0, 1054.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0, 1054.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0, 1054.0])
}

///|
test "Index actual Grouper order 17 Figure col remove [0]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 18 Figure col remove [1]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 19 Figure col remove [2]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 20 Figure col remove [3]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 21 Figure col remove [4]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[4])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[4].plot([44.0], [1044.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0, 44.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0, 1044.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0, 44.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0, 1044.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0, 44.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0, 1044.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 22 Figure col remove [5]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  figure.delaxes(axes[5])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[5].plot([54.0], [1054.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0, 1054.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0, 1054.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0, 1054.0])
}

///|
test "Index actual Grouper order 23 Figure all remove [0, 1, 3]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 24 Figure all remove [1, 0, 3]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 25 Figure all remove [3, 0, 1]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 26 Figure all remove [3, 2, 1]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  figure.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 27 Figure row remove [3, 0, 1]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(2, 4)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  figure.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  figure.delaxes(axes[1])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
}

///|
test "Index actual Grouper order 28 Figure col remove [6, 0, 2]" {
  let figure = @scene.figure()
  let grid_0 = figure
    .grid_spec(4, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = figure.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  figure.delaxes(axes[6])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[6].plot([64.0], [1064.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  figure.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  figure.delaxes(axes[2])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
}

///|
test "Index actual Grouper order 29 SubFigure all remove [0]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 3)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
}

///|
test "Index actual Grouper order 30 SubFigure all remove [1]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 3)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
}

///|
test "Index actual Grouper order 31 SubFigure all remove [2]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 3)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  sub_0.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0, 1024.0])
}

///|
test "Index actual Grouper order 32 SubFigure all remove [0]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 33 SubFigure all remove [1]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 34 SubFigure all remove [2]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 35 SubFigure all remove [3]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 36 SubFigure all remove [0]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 37 SubFigure all remove [1]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 38 SubFigure all remove [2]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
}

///|
test "Index actual Grouper order 39 SubFigure all remove [3]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 2)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 40 SubFigure row remove [0]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 41 SubFigure row remove [1]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 42 SubFigure row remove [2]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0, 24.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0, 1024.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 43 SubFigure row remove [3]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 44 SubFigure row remove [4]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[4])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[4].plot([44.0], [1044.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 45 SubFigure row remove [5]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[5])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[5].plot([54.0], [1054.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0, 1054.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0, 1054.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0, 1054.0])
}

///|
test "Index actual Grouper order 46 SubFigure col remove [0]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 47 SubFigure col remove [1]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 48 SubFigure col remove [2]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 49 SubFigure col remove [3]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 50 SubFigure col remove [4]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[4])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[4].plot([44.0], [1044.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0, 44.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0, 1044.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0, 44.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0, 1044.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0, 44.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0, 1044.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
}

///|
test "Index actual Grouper order 51 SubFigure col remove [5]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  sub_0.delaxes(axes[5])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  axes[5].plot([54.0], [1054.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0, 1054.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0, 1054.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0, 54.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0, 1054.0])
}

///|
test "Index actual Grouper order 52 SubFigure all remove [0, 1, 3]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 53 SubFigure all remove [1, 0, 3]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 54 SubFigure all remove [3, 0, 1]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 55 SubFigure all remove [3, 2, 1]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(1, 4)
    .with_shared_axes(@gridspec.ShareMode::All, @gridspec.ShareMode::All)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  sub_0.delaxes(axes[2])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [0.0, 1.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1001.0, 1002.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [0.0, 2.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1000.0, 1002.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
}

///|
test "Index actual Grouper order 56 SubFigure row remove [3, 0, 1]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 4)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [30.0, 31.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1031.0, 1032.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [30.0, 32.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1030.0, 1032.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  sub_0.delaxes(axes[3])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[3].plot([34.0], [1034.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [10.0, 11.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1011.0, 1012.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [10.0, 12.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1010.0, 1012.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  sub_0.delaxes(axes[1])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[1].plot([14.0], [1014.0])
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[0].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[1].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[1].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[2].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[2].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[3].call(), [30.0, 32.0, 34.0])
  assert_eq(copies_y[3].call(), [1030.0, 1032.0, 1034.0])
  assert_eq(copies_x[4].call(), [70.0, 72.0])
  assert_eq(copies_y[4].call(), [1070.0, 1072.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [70.0, 72.0])
  assert_eq(copies_y[6].call(), [1070.0, 1072.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
}

///|
test "Index actual Grouper order 57 SubFigure col remove [6, 0, 2]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 1)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(4, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let axes = axes_0
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  sub_0.delaxes(axes[6])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[6].plot([64.0], [1064.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  sub_0.delaxes(axes[0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[0].plot([4.0], [1004.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  sub_0.delaxes(axes[2])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
  axes[2].plot([24.0], [1024.0])
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(copies_x[0].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[0].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[1].call(), [70.0, 72.0])
  assert_eq(copies_y[1].call(), [1070.0, 1072.0])
  assert_eq(copies_x[2].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[2].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[3].call(), [70.0, 72.0])
  assert_eq(copies_y[3].call(), [1070.0, 1072.0])
  assert_eq(copies_x[4].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[4].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[5].call(), [70.0, 72.0])
  assert_eq(copies_y[5].call(), [1070.0, 1072.0])
  assert_eq(copies_x[6].call(), [60.0, 62.0, 64.0])
  assert_eq(copies_y[6].call(), [1060.0, 1062.0, 1064.0])
  assert_eq(copies_x[7].call(), [70.0, 72.0])
  assert_eq(copies_y[7].call(), [1070.0, 1072.0])
}

///|
test "Index actual Grouper order 58 SubFigure row remove [8]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 2)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let outer_1 = figure.grid_spec(1, 2)
  let sub_1 = figure.add_subfigure(outer_1.cell_spec(0, 1))
  let grid_1 = sub_1
    .subplot_spec()
    .subgridspec(2, 3)
    .with_shared_axes(@gridspec.ShareMode::Row, @gridspec.ShareMode::Row)
  let axes_1 = sub_1.subplots_with_grid(grid_1)
  let axes : Array[@scene.Axes] = []
  for axis in axes_0 {
    axes.push(axis)
  }
  for axis in axes_1 {
    axes.push(axis)
  }
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [80.0, 81.0, 82.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1080.0, 1081.0, 1082.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [80.0, 82.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1080.0, 1082.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [80.0, 81.0, 82.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1080.0, 1081.0, 1082.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [80.0, 82.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1080.0, 1082.0],
  )
  assert_eq(
    axes[8].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [80.0, 81.0, 82.0],
  )
  assert_eq(
    axes[8].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1080.0, 1081.0, 1082.0],
  )
  assert_eq(
    axes[8].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [80.0, 82.0],
  )
  assert_eq(
    axes[8].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1080.0, 1082.0],
  )
  assert_eq(
    axes[9].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[9].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[10].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[10].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  assert_eq(copies_x[6].call(), [80.0, 82.0])
  assert_eq(copies_y[6].call(), [1080.0, 1082.0])
  assert_eq(copies_x[7].call(), [80.0, 82.0])
  assert_eq(copies_y[7].call(), [1080.0, 1082.0])
  assert_eq(copies_x[8].call(), [80.0, 82.0])
  assert_eq(copies_y[8].call(), [1080.0, 1082.0])
  assert_eq(copies_x[9].call(), [110.0, 112.0])
  assert_eq(copies_y[9].call(), [1110.0, 1112.0])
  assert_eq(copies_x[10].call(), [110.0, 112.0])
  assert_eq(copies_y[10].call(), [1110.0, 1112.0])
  assert_eq(copies_x[11].call(), [110.0, 112.0])
  assert_eq(copies_y[11].call(), [1110.0, 1112.0])
  sub_1.delaxes(axes[8])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[9].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[9].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[10].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[10].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  assert_eq(copies_x[6].call(), [80.0, 82.0])
  assert_eq(copies_y[6].call(), [1080.0, 1082.0])
  assert_eq(copies_x[7].call(), [80.0, 82.0])
  assert_eq(copies_y[7].call(), [1080.0, 1082.0])
  assert_eq(copies_x[8].call(), [80.0, 82.0])
  assert_eq(copies_y[8].call(), [1080.0, 1082.0])
  assert_eq(copies_x[9].call(), [110.0, 112.0])
  assert_eq(copies_y[9].call(), [1110.0, 1112.0])
  assert_eq(copies_x[10].call(), [110.0, 112.0])
  assert_eq(copies_y[10].call(), [1110.0, 1112.0])
  assert_eq(copies_x[11].call(), [110.0, 112.0])
  assert_eq(copies_y[11].call(), [1110.0, 1112.0])
  axes[8].plot([84.0], [1084.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [20.0, 21.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1021.0, 1022.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [20.0, 22.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1020.0, 1022.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [70.0, 71.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1071.0, 1072.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [70.0, 72.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1070.0, 1072.0],
  )
  assert_eq(
    axes[9].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[9].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[10].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[10].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(copies_x[0].call(), [20.0, 22.0])
  assert_eq(copies_y[0].call(), [1020.0, 1022.0])
  assert_eq(copies_x[1].call(), [20.0, 22.0])
  assert_eq(copies_y[1].call(), [1020.0, 1022.0])
  assert_eq(copies_x[2].call(), [20.0, 22.0])
  assert_eq(copies_y[2].call(), [1020.0, 1022.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [50.0, 52.0])
  assert_eq(copies_y[4].call(), [1050.0, 1052.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  assert_eq(copies_x[6].call(), [80.0, 82.0, 84.0])
  assert_eq(copies_y[6].call(), [1080.0, 1082.0, 1084.0])
  assert_eq(copies_x[7].call(), [80.0, 82.0, 84.0])
  assert_eq(copies_y[7].call(), [1080.0, 1082.0, 1084.0])
  assert_eq(copies_x[8].call(), [80.0, 82.0, 84.0])
  assert_eq(copies_y[8].call(), [1080.0, 1082.0, 1084.0])
  assert_eq(copies_x[9].call(), [110.0, 112.0])
  assert_eq(copies_y[9].call(), [1110.0, 1112.0])
  assert_eq(copies_x[10].call(), [110.0, 112.0])
  assert_eq(copies_y[10].call(), [1110.0, 1112.0])
  assert_eq(copies_x[11].call(), [110.0, 112.0])
  assert_eq(copies_y[11].call(), [1110.0, 1112.0])
}

///|
test "Index actual Grouper order 59 SubFigure col remove [8]" {
  let figure = @scene.figure()
  let outer_0 = figure.grid_spec(1, 2)
  let sub_0 = figure.add_subfigure(outer_0.cell_spec(0, 0))
  let grid_0 = sub_0
    .subplot_spec()
    .subgridspec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_0 = sub_0.subplots_with_grid(grid_0)
  let outer_1 = figure.grid_spec(1, 2)
  let sub_1 = figure.add_subfigure(outer_1.cell_spec(0, 1))
  let grid_1 = sub_1
    .subplot_spec()
    .subgridspec(3, 2)
    .with_shared_axes(@gridspec.ShareMode::Column, @gridspec.ShareMode::Column)
  let axes_1 = sub_1.subplots_with_grid(grid_1)
  let axes : Array[@scene.Axes] = []
  for axis in axes_0 {
    axes.push(axis)
  }
  for axis in axes_1 {
    axes.push(axis)
  }
  for index, axis in axes {
    let start = Double::from_int(index) * 10.0
    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])
    axis.set_x_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_x_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
    axis.set_y_locator(
      @ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator(),
    )
    axis.set_y_minor_locator(
      @ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator(),
    )
  }
  let copies_x = axes.map(axis => {
    axis.x_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_x {
    locator.set_params(base=2.0)
  }
  let copies_y = axes.map(axis => {
    axis.y_axis().locator().unwrap().index_locator().unwrap().copy()
  })
  for locator in copies_y {
    locator.set_params(base=2.0)
  }
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [100.0, 101.0, 102.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1100.0, 1101.0, 1102.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [100.0, 102.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1100.0, 1102.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[8].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [100.0, 101.0, 102.0],
  )
  assert_eq(
    axes[8].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1100.0, 1101.0, 1102.0],
  )
  assert_eq(
    axes[8].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [100.0, 102.0],
  )
  assert_eq(
    axes[8].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1100.0, 1102.0],
  )
  assert_eq(
    axes[9].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[9].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [100.0, 101.0, 102.0],
  )
  assert_eq(
    axes[10].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1100.0, 1101.0, 1102.0],
  )
  assert_eq(
    axes[10].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [100.0, 102.0],
  )
  assert_eq(
    axes[10].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1100.0, 1102.0],
  )
  assert_eq(
    axes[11].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  assert_eq(copies_x[6].call(), [100.0, 102.0])
  assert_eq(copies_y[6].call(), [1100.0, 1102.0])
  assert_eq(copies_x[7].call(), [110.0, 112.0])
  assert_eq(copies_y[7].call(), [1110.0, 1112.0])
  assert_eq(copies_x[8].call(), [100.0, 102.0])
  assert_eq(copies_y[8].call(), [1100.0, 1102.0])
  assert_eq(copies_x[9].call(), [110.0, 112.0])
  assert_eq(copies_y[9].call(), [1110.0, 1112.0])
  assert_eq(copies_x[10].call(), [100.0, 102.0])
  assert_eq(copies_y[10].call(), [1100.0, 1102.0])
  assert_eq(copies_x[11].call(), [110.0, 112.0])
  assert_eq(copies_y[11].call(), [1110.0, 1112.0])
  sub_1.delaxes(axes[8])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[9].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[9].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[10].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[10].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[10].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[11].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  assert_eq(copies_x[6].call(), [100.0, 102.0])
  assert_eq(copies_y[6].call(), [1100.0, 1102.0])
  assert_eq(copies_x[7].call(), [110.0, 112.0])
  assert_eq(copies_y[7].call(), [1110.0, 1112.0])
  assert_eq(copies_x[8].call(), [100.0, 102.0])
  assert_eq(copies_y[8].call(), [1100.0, 1102.0])
  assert_eq(copies_x[9].call(), [110.0, 112.0])
  assert_eq(copies_y[9].call(), [1110.0, 1112.0])
  assert_eq(copies_x[10].call(), [100.0, 102.0])
  assert_eq(copies_y[10].call(), [1100.0, 1102.0])
  assert_eq(copies_x[11].call(), [110.0, 112.0])
  assert_eq(copies_y[11].call(), [1110.0, 1112.0])
  axes[8].plot([84.0], [1084.0])
  assert_eq(
    axes[0].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[0].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[0].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[1].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[1].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[1].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[2].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[2].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[2].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[3].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[3].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[3].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[4].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [40.0, 41.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1041.0, 1042.0],
  )
  assert_eq(
    axes[4].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [40.0, 42.0],
  )
  assert_eq(
    axes[4].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1040.0, 1042.0],
  )
  assert_eq(
    axes[5].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [50.0, 51.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1051.0, 1052.0],
  )
  assert_eq(
    axes[5].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [50.0, 52.0],
  )
  assert_eq(
    axes[5].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1050.0, 1052.0],
  )
  assert_eq(
    axes[6].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[6].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[6].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[6].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[7].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[7].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[7].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[7].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[9].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[9].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[9].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(
    axes[10].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [60.0, 61.0, 62.0],
  )
  assert_eq(
    axes[10].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1061.0, 1062.0],
  )
  assert_eq(
    axes[10].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [60.0, 62.0],
  )
  assert_eq(
    axes[10].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1060.0, 1062.0],
  )
  assert_eq(
    axes[11].x_axis().locator().unwrap().index_locator().unwrap().call(),
    [110.0, 111.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1111.0, 1112.0],
  )
  assert_eq(
    axes[11].x_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [110.0, 112.0],
  )
  assert_eq(
    axes[11].y_axis().minor_locator().unwrap().index_locator().unwrap().call(),
    [1110.0, 1112.0],
  )
  assert_eq(copies_x[0].call(), [40.0, 42.0])
  assert_eq(copies_y[0].call(), [1040.0, 1042.0])
  assert_eq(copies_x[1].call(), [50.0, 52.0])
  assert_eq(copies_y[1].call(), [1050.0, 1052.0])
  assert_eq(copies_x[2].call(), [40.0, 42.0])
  assert_eq(copies_y[2].call(), [1040.0, 1042.0])
  assert_eq(copies_x[3].call(), [50.0, 52.0])
  assert_eq(copies_y[3].call(), [1050.0, 1052.0])
  assert_eq(copies_x[4].call(), [40.0, 42.0])
  assert_eq(copies_y[4].call(), [1040.0, 1042.0])
  assert_eq(copies_x[5].call(), [50.0, 52.0])
  assert_eq(copies_y[5].call(), [1050.0, 1052.0])
  assert_eq(copies_x[6].call(), [100.0, 102.0])
  assert_eq(copies_y[6].call(), [1100.0, 1102.0])
  assert_eq(copies_x[7].call(), [110.0, 112.0])
  assert_eq(copies_y[7].call(), [1110.0, 1112.0])
  assert_eq(copies_x[8].call(), [100.0, 102.0])
  assert_eq(copies_y[8].call(), [1100.0, 1102.0])
  assert_eq(copies_x[9].call(), [110.0, 112.0])
  assert_eq(copies_y[9].call(), [1110.0, 1112.0])
  assert_eq(copies_x[10].call(), [100.0, 102.0])
  assert_eq(copies_y[10].call(), [1100.0, 1102.0])
  assert_eq(copies_x[11].call(), [110.0, 112.0])
  assert_eq(copies_y[11].call(), [1110.0, 1112.0])
}
