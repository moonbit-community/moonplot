///|
test "hexbin groups points into colored hexagons" {
  let fig = @scene.figure(width=360, height=260)
  let bins = try! fig.hexbin(
    [0.0, 0.1, 1.0, 1.0],
    [0.0, 0.0, 1.0, 1.0],
    values=[1.0, 3.0, 5.0, 7.0],
    gridsize=3,
    mincnt=1,
    cmap="viridis",
    label="bins",
  )
  assert_true(bins.centers().length() > 0)
  assert_eq(bins.counts().length(), bins.values().length())
  let total = {
    let mut result = 0
    for count in bins.counts() {
      result += count
    }
    result
  }
  assert_eq(total, 4)
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("#440154"))
  assert_true(svg.contains("bins"))
}

///|
test "hexbin validates lengths, grid size, and finite values" {
  let fig = @scene.figure()
  try fig.hexbin([0.0], [0.0, 1.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) => {
      assert_eq(expected, 1)
      assert_eq(actual, 2)
    }
    _ => fail("expected a hexbin coordinate error")
  } noraise {
    _ => fail("expected a hexbin coordinate error")
  }
  try fig.hexbin([0.0], [0.0], gridsize=0) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("gridsize"))
    _ => fail("expected a hexbin grid error")
  } noraise {
    _ => fail("expected a hexbin grid error")
  }
  try fig.hexbin([0.0 / 0.0], [0.0]) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected a hexbin finite value error")
  } noraise {
    _ => fail("expected a hexbin finite value error")
  }
}

///|
test "hexbin supports value reducers" {
  let fig = @scene.figure()
  let xs = [0.0, 0.0, 0.0]
  let ys = [0.0, 0.0, 0.0]
  let values = [1.0, 3.0, 5.0]
  let mean = try! fig.hexbin(xs, ys, values~, gridsize=1, reduce="mean")
  assert_eq(mean.values(), [3.0])
  let sum = try! fig.hexbin(xs, ys, values~, gridsize=1, reduce="sum")
  assert_eq(sum.values(), [9.0])
  let min = try! fig.hexbin(xs, ys, values~, gridsize=1, reduce="min")
  assert_eq(min.values(), [1.0])
  let max = try! fig.hexbin(xs, ys, values~, gridsize=1, reduce="max")
  assert_eq(max.values(), [5.0])
  let count = try! fig.hexbin(xs, ys, values~, gridsize=1, reduce="count")
  assert_eq(count.values(), [3.0])
  let plain_count = try! fig.hexbin(xs, ys, gridsize=1)
  assert_eq(plain_count.values(), [3.0])
}

///|
test "hexbin accepts a callable reducer" {
  let fig = @scene.figure()
  let bins = try! fig.hexbin(
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
    values=[1.0, 3.0, 5.0],
    gridsize=1,
    reduce_fn=@scene.hexbin_reducer(samples => {
      samples[0] * 10.0 + samples[1] + samples[2]
    }),
  )
  assert_eq(bins.values(), [18.0])
  try
    fig.hexbin(
      [0.0],
      [0.0],
      reduce_fn=@scene.hexbin_reducer(samples => samples[0]),
    )
  catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("requires values"))
    _ => fail("expected a callable reducer values error")
  } noraise {
    _ => fail("expected a callable reducer values error")
  }
  try
    fig.hexbin(
      [0.0],
      [0.0],
      values=[1.0],
      gridsize=1,
      reduce_fn=@scene.hexbin_reducer(_ => 0.0 / 0.0),
    )
  catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected a callable reducer result error")
  } noraise {
    _ => fail("expected a callable reducer result error")
  }
}

///|
test "hexbin rejects unknown reducers" {
  let fig = @scene.figure()
  try fig.hexbin([0.0], [0.0], reduce="median") catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("reduce"))
    _ => fail("expected a hexbin reducer error")
  } noraise {
    _ => fail("expected a hexbin reducer error")
  }
}

///|
test "hexbin bins in transformed coordinates on logarithmic axes" {
  let fig = @scene.figure()
  try! fig.set_x_scale(@scale.log_scale())
  try! fig.set_y_scale(@scale.log_scale())
  let bins = try! fig.hexbin([1.0, 10.0, 100.0], [1.0, 10.0, 100.0], gridsize=2)
  assert_true(bins.centers().length() > 0)
  for center in bins.centers() {
    assert_true(center.x() > 0.0)
    assert_true(center.y() > 0.0)
  }
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(!svg.contains("NaN"))
}

///|
test "hexbin supports symmetric logarithmic axes" {
  let fig = @scene.figure()
  let symlog = try! @scale.symlog_scale(linthresh=1.0)
  try! fig.set_x_scale(symlog)
  try! fig.set_y_scale(symlog)
  let bins = try! fig.hexbin(
    [-100.0, -1.0, 0.0, 1.0, 100.0],
    [-100.0, -1.0, 0.0, 1.0, 100.0],
    gridsize=3,
  )
  assert_true(bins.centers().length() > 0)
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(!svg.contains("NaN"))
}

///|
test "hexbin exposes polygon edge styling" {
  let fig = @scene.figure()
  ignore(
    try! fig.hexbin(
      [0.0, 1.0],
      [0.0, 1.0],
      gridsize=2,
      color="#abcdef",
      edgecolor="#102030",
      linewidth=1.5,
    ),
  )
  let svg = fig.to_svg()
  assert_true(svg.contains("#102030"))
  assert_true(svg.contains("stroke-width=\"1.5\""))
}

///|
test "hexbin validates edge linewidth" {
  let fig = @scene.figure()
  try fig.hexbin([0.0], [0.0], linewidth=-1.0) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("linewidth"))
    _ => fail("expected a hexbin linewidth error")
  } noraise {
    _ => fail("expected a hexbin linewidth error")
  }
}

///|
test "hexbin supports logarithmic color bins" {
  let fig = @scene.figure()
  let bins = try! fig.hexbin(
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
    gridsize=1,
    bins="log",
  )
  assert_eq(bins.values(), [3.0])
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(!svg.contains("NaN"))
}

///|
test "hexbin validates logarithmic color bins" {
  let fig = @scene.figure()
  try fig.hexbin([0.0], [0.0], bins="levels") catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("bins"))
    _ => fail("expected a hexbin bins error")
  } noraise {
    _ => fail("expected a hexbin bins error")
  }
  try
    fig.hexbin(
      [0.0, 0.0],
      [0.0, 0.0],
      values=[-1.0, 1.0],
      gridsize=1,
      bins="log",
    )
  catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("positive"))
    _ => fail("expected a positive logarithmic bins error")
  } noraise {
    _ => fail("expected a positive logarithmic bins error")
  }
}

///|
test "hexbin extent clips points before aggregation" {
  let fig = @scene.figure()
  let bins = try! fig.hexbin(
    [0.0, 0.5, 2.0],
    [0.0, 0.5, 2.0],
    values=[1.0, 3.0, 9.0],
    gridsize=1,
    reduce="sum",
    extent=[0.0, 1.0, 0.0, 1.0],
  )
  assert_eq(bins.counts(), [2])
  assert_eq(bins.values(), [4.0])
  assert_true(bins.centers()[0].x() >= 0.0)
  assert_true(bins.centers()[0].x() <= 1.0)
}

///|
test "hexbin validates extent" {
  let fig = @scene.figure()
  try fig.hexbin([0.0], [0.0], extent=[0.0, 1.0]) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("extent"))
    _ => fail("expected a hexbin extent error")
  } noraise {
    _ => fail("expected a hexbin extent error")
  }
  try fig.hexbin([0.0], [0.0], extent=[0.0, 0.0, 0.0, 1.0]) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("span"))
    _ => fail("expected a degenerate hexbin extent error")
  } noraise {
    _ => fail("expected a degenerate hexbin extent error")
  }
}

///|
test "hexbin renders marginal count bars" {
  let data_x = [0.0, 0.1, 0.8, 1.0]
  let data_y = [0.0, 0.2, 0.7, 1.0]
  let regular = @scene.figure()
  ignore(try! regular.hexbin(data_x, data_y, gridsize=2))
  let with_marginals = @scene.figure()
  ignore(try! with_marginals.hexbin(data_x, data_y, gridsize=2, marginals=true))
  assert_true(with_marginals.artists().length() > regular.artists().length())
  let svg = with_marginals.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(!svg.contains("NaN"))
}

///|
test "hexbin rejects values outside a logarithmic axis domain" {
  let fig = @scene.figure()
  try! fig.set_x_scale(@scale.log_scale())
  try fig.hexbin([0.0], [1.0]) catch {
    @core.DataError::InvalidStatistics(message~) =>
      assert_true(message.contains("axis scale"))
    _ => fail("expected a hexbin scale-domain error")
  } noraise {
    _ => fail("expected a hexbin scale-domain error")
  }
}
