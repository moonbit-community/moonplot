///|
test "violinplot computes density summaries and renders bodies" {
  let fig = @scene.figure(width=360, height=240)
  let stats = try! fig.violinplot(
    [[1.0, 2.0, 3.0, 4.0, 20.0], [2.0, 3.0, 4.0]],
    points=16,
    quantiles=[[0.25, 0.75], [0.5]],
    showmeans=true,
    showmedians=true,
    color="#123456",
    facecolor="#abcdef",
    linecolor="#654321",
    label="distribution",
  )
  assert_eq(stats.length(), 2)
  assert_eq(stats[0].coords().length(), 16)
  assert_eq(stats[0].vals().length(), 16)
  assert_true(stats[0].mean() > 5.0)
  assert_true(stats[0].median() == 3.0)
  assert_eq(stats[0].quantiles(), [2.0, 4.0])
  let svg = fig.to_svg()
  assert_true(svg.contains("<polygon"))
  assert_true(svg.contains("#abcdef"))
  assert_true(svg.contains("#654321"))
  assert_true(svg.contains("distribution"))
}

///|
test "horizontal one-sided violins support positions and widths" {
  let fig = @scene.figure(width=360, height=240)
  let stats = try! fig.violinplot(
    [[0.0, 1.0, 2.0], [1.0, 2.0, 3.0]],
    positions=[10.0, 20.0],
    widths=[2.0, 4.0],
    horizontal=true,
    side=@scene.ViolinSide::High,
    points=8,
    showextrema=false,
  )
  assert_eq(stats.length(), 2)
  assert_true(fig.to_svg().contains("<polygon"))
}

///|
test "violinplot validates data, quantiles, and bandwidth inputs" {
  let fig = @scene.figure()
  try fig.violinplot([]) catch {
    @core.DataError::InvalidViolin(message~) =>
      assert_true(message.contains("at least one"))
    _ => fail("expected an invalid violin error")
  } noraise {
    _ => fail("expected a violin error")
  }
  try fig.violinplot([[1.0, 2.0]], points=1) catch {
    @core.DataError::InvalidViolin(message~) =>
      assert_true(message.contains("at least 2"))
    _ => fail("expected an invalid point count error")
  } noraise {
    _ => fail("expected a violin error")
  }
  try fig.violinplot([[1.0, 2.0]], quantiles=[[1.2]]) catch {
    @core.DataError::InvalidViolin(message~) =>
      assert_true(message.contains("interval"))
    _ => fail("expected an invalid quantile error")
  } noraise {
    _ => fail("expected a violin error")
  }
  try fig.violinplot([[1.0, 2.0], [2.0, 3.0]], quantiles=[[0.5]]) catch {
    @core.DataError::InvalidViolin(message~) =>
      assert_true(message.contains("one entry per violin"))
    _ => fail("expected a quantile count error")
  } noraise {
    _ => fail("expected a quantile count error")
  }
  for
    invalid in [
      @scene.ViolinBandwidth::Fixed(0.0),
      @scene.ViolinBandwidth::Fixed(-1.0),
      @scene.ViolinBandwidth::Fixed(0.0 / 0.0),
      @scene.ViolinBandwidth::Fixed(1.0 / 0.0),
    ] {
    try fig.violinplot([[1.0, 2.0]], bandwidth=invalid) catch {
      @core.DataError::InvalidViolin(message~) =>
        assert_true(message.contains("positive and finite"))
      _ => fail("expected a bandwidth error")
    } noraise {
      _ => fail("expected a bandwidth error")
    }
  }
}

///|
test "violinplot preserves empty and nonfinite series" {
  let fig = @scene.figure(width=360, height=240)
  let stats = try! fig.violinplot(
    [[], [0.0 / 0.0, 1.0 / 0.0], [1.0, 2.0, 3.0]],
    quantiles=[[], [0.5], [0.25, 0.75]],
    points=8,
    showmeans=true,
    showmedians=true,
  )
  assert_eq(stats.length(), 3)
  assert_eq(stats[0].coords(), [])
  assert_eq(stats[0].vals(), [])
  assert_true(stats[0].mean().is_nan())
  assert_true(stats[0].median().is_nan())
  assert_true(stats[1].coords().length() == 0)
  assert_true(stats[1].quantiles()[0].is_nan())
  assert_eq(stats[2].coords().length(), 8)
  assert_true(fig.to_svg().contains("<svg"))
}

///|
test "violinplot supports silverman and fixed positive bandwidths" {
  let silverman = try! @scene.violin_stats(
    [1.0, 2.0, 4.0, 8.0],
    points=12,
    bandwidth=@scene.ViolinBandwidth::Silverman,
  )
  let fixed = try! @scene.violin_stats(
    [1.0, 2.0, 4.0, 8.0],
    points=12,
    bandwidth=@scene.ViolinBandwidth::Fixed(0.25),
  )
  assert_eq(silverman.coords().length(), 12)
  assert_eq(fixed.coords().length(), 12)
  assert_true(silverman.vals()[6] > 0.0)
  assert_true(fixed.vals()[6] > 0.0)
}

///|
test "violinplot validates positions and widths" {
  let fig = @scene.figure()
  try fig.violinplot([[1.0, 2.0], [2.0, 3.0]], positions=[1.0]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) =>
      assert_true(expected == 2 && actual == 1)
    _ => fail("expected a position length error")
  } noraise {
    _ => fail("expected a position length error")
  }
  try fig.violinplot([[1.0, 2.0], [2.0, 3.0]], widths=[0.5]) catch {
    @core.DataError::LengthMismatch(expected~, actual~) =>
      assert_true(expected == 2 && actual == 1)
    _ => fail("expected a width length error")
  } noraise {
    _ => fail("expected a width length error")
  }
  try fig.violinplot([[1.0, 2.0]], positions=[0.0 / 0.0]) catch {
    @core.DataError::NonFiniteLimit(axis~) => assert_eq(axis, "position")
    _ => fail("expected a nonfinite position error")
  } noraise {
    _ => fail("expected a nonfinite position error")
  }
}
