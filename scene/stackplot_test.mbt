///|
test "stackplot builds cumulative filled layers and legends" {
  let fig = @scene.figure(width=320, height=220)
  let artists = try! fig.stackplot(
    [0.0, 1.0, 2.0],
    [[1.0, 2.0, 1.0], [2.0, 1.0, 2.0]],
    labels=["first", "second"],
    colors=["#123456", "#abcdef"],
  )
  assert_eq(artists.length(), 2)
  assert_eq(fig.artists().length(), 2)
  assert_eq(fig.legend_entries().map(entry => entry.label()), [
    "first", "second",
  ])
  assert_eq(fig.containers().length(), 1)
  match fig.containers()[0].kind() {
    @scene.ContainerKind::Stackplot => ()
    _ => fail("expected a stackplot container")
  }
  assert_eq(fig.containers()[0].artists().length(), 2)
  match fig.artists()[0] {
    @scene.Artist::FillBetween(upper, lower, style) => {
      assert_eq(style.fill(), "#123456")
      assert_eq(lower.map(point => (point.x(), point.y())), [
        (0.0, 0.0),
        (1.0, 0.0),
        (2.0, 0.0),
      ])
      assert_eq(upper.map(point => (point.x(), point.y())), [
        (0.0, 1.0),
        (1.0, 2.0),
        (2.0, 1.0),
      ])
    }
    _ => fail("expected a filled stackplot layer")
  }
  match fig.artists()[1] {
    @scene.Artist::FillBetween(upper, lower, _) => {
      assert_eq(lower.map(point => point.y()), [1.0, 2.0, 1.0])
      assert_eq(upper.map(point => point.y()), [3.0, 3.0, 3.0])
    }
    _ => fail("expected a second filled stackplot layer")
  }
  assert_true(fig.to_svg().contains("#123456"))
  assert_true(fig.to_svg().contains("#abcdef"))
}

///|
test "stackplot baselines match the upstream formulas" {
  let xs = [0.0, 1.0, 2.0]
  let ys = [[1.0, 2.0, 3.0], [2.0, 1.0, 2.0]]
  let symmetric = try! @scene.figure().stackplot(xs, ys, baseline="sym")
  let wiggle = try! @scene.figure().stackplot(xs, ys, baseline="wiggle")
  let weighted = try! @scene.figure().stackplot(
    xs,
    ys,
    baseline="weighted_wiggle",
  )
  match symmetric[0] {
    @scene.Artist::FillBetween(_, lower, _) =>
      assert_eq(lower.map(point => point.y()), [-1.5, -1.5, -2.5])
    _ => fail("expected symmetric baseline")
  }
  match wiggle[0] {
    @scene.Artist::FillBetween(_, lower, _) =>
      assert_eq(lower.map(point => point.y()), [-1.25, -1.75, -2.75])
    _ => fail("expected wiggle baseline")
  }
  match weighted[0] {
    @scene.Artist::FillBetween(_, lower, _) =>
      assert_eq(lower.map(point => point.y()), [-1.5, -1.0, -2.1])
    _ => fail("expected weighted wiggle baseline")
  }
}

///|
test "stackplot validates shapes and baseline names" {
  let fig = @scene.figure()
  try fig.stackplot([0.0, 1.0], [[1.0]]) catch {
    @core.DataError::LengthMismatch(expected=2, actual=1) => ()
    _ => fail("expected stackplot series length error")
  } noraise {
    _ => fail("expected stackplot series length error")
  }
  try fig.stackplot([0.0, 1.0], [[1.0, 2.0]], baseline="invalid") catch {
    @core.DataError::InvalidReference(message~) =>
      assert_true(message.contains("baseline"))
    _ => fail("expected stackplot baseline error")
  } noraise {
    _ => fail("expected stackplot baseline error")
  }
  assert_eq(fig.artists().length(), 0)
}

///|
test "stackplot cycles explicit colors" {
  let fig = @scene.figure()
  let artists = try! fig.stackplot(
    [0.0, 1.0],
    [[1.0, 1.0], [2.0, 2.0], [3.0, 3.0]],
    colors=["#111111", "#222222"],
  )
  for index, artist in artists {
    match artist {
      @scene.Artist::FillBetween(_, _, style) =>
        assert_eq(
          style.fill(),
          if index % 2 == 0 {
            "#111111"
          } else {
            "#222222"
          },
        )
      _ => fail("expected filled stackplot artist")
    }
  }
}
