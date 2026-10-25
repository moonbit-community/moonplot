///|
test "known Barbs identity replacement stays static without reverting to generic endpoints" {
  for role in 0..<3 {
    let fig = figure(width=400, height=240)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(0.0, 10.0)
    ax.set_y_limits(0.0, 10.0)
    if role == 0 {
      ax.barbs([2.0], [3.0], [3.0], [4.0], barb_length=0.0, label="stroke")
    } else if role == 1 {
      ax.barbs_with_options(
        [2.0],
        [3.0],
        [5.0],
        [0.0],
        half_increment=1.0,
        full_increment=2.0,
        flag_increment=5.0,
        barb_length=2.0,
        label="flag",
      )
    } else {
      ax.barbs_with_options(
        [2.0],
        [3.0],
        [0.0],
        [0.0],
        barb_length=4.0,
        label="calm",
      )
    }
    let old = fig.to_drawing()
    let index = if role == 1 { 1 } else { 0 }
    let previous = old.targets().filter(t => t.info.point.artist_index == index)
    assert_true(previous.length() > 0)
    let original = ax.state.val.artists[index]
    ax.state.val.artists[index] = copy_artist(original)
    let current = fig.to_drawing()
    assert_eq(current.svg(), old.svg())
    assert_eq(
      current.targets().filter(t => t.info.point.artist_index == index).length(),
      0,
    )
    assert_true(old.targets().all(t => t.info.kind == Barbs))
  }
}

///|
test "known Barbs replacement content changes cannot authorize a new datum or generic fallback" {
  for role in 0..<3 {
    for same_array in [false, true] {
      let fig = figure()
      let ax = fig.axes()
      if role == 0 {
        ax.barbs([1.0], [1.0], [2.0], [1.0], barb_length=0.0)
      } else if role == 1 {
        ax.barbs_with_options([1.0], [1.0], [55.0], [0.0])
      } else {
        ax.barbs_with_options([1.0], [1.0], [0.0], [0.0])
      }
      let index = if role == 1 { 1 } else { 0 }
      let original = ax.state.val.artists[index]
      let replacement = match original {
        Line(points, style) => {
          let next = if same_array { points } else { points.copy() }
          next[0] = @core.point(9.0, 9.0)
          Artist::Line(next, style)
        }
        Polygon(points, style) => {
          let next = if same_array { points } else { points.copy() }
          next[0] = @core.point(9.0, 9.0)
          Artist::Polygon(next, style)
        }
        Scatter(points, style) => {
          let next = if same_array { points } else { points.copy() }
          next[0] = @core.point(9.0, 9.0)
          Artist::Scatter(next, style)
        }
        _ => fail("Expected Barbs component")
      }
      ax.state.val.artists[index] = replacement
      assert_eq(
        fig
        .to_drawing()
        .targets()
        .filter(t => t.info.point.artist_index == index)
        .length(),
        0,
      )
    }
  }
}

///|
test "Barbs invalid identity intent remains aligned after image contour expansion Line removal and clear" {
  let fig = figure(width=400, height=240)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 10.0)
  ax.set_y_limits(0.0, 10.0)
  let removed = ax.plot_line(Numeric([0.0, 1.0]), Numeric([0.0, 1.0]))
  ax.imshow([[0.0]], aspect="auto")
  let contour = ax.contour([[0.0, 1.0], [1.0, 2.0]], levels=[0.5])
  ax.barbs([2.0], [3.0], [3.0], [4.0], barb_length=0.0, label="wind")
  ax.clabel(contour, inline=true)
  removed.remove()
  let slots = []
  for slot, _ in ax.state.val.barb_intents {
    slots.push(slot)
  }
  assert_eq(slots.length(), 1)
  let index = slots[0]
  let old = fig.to_drawing()
  assert_eq(old.targets().filter(t => t.info.kind == Barbs).length(), 1)
  assert_eq(
    old.targets().filter(t => t.info.kind == Barbs)[0].info.point.artist_index,
    index,
  )
  ax.state.val.artists[index] = copy_artist(ax.state.val.artists[index])
  let current = fig.to_drawing()
  assert_eq(current.svg(), old.svg())
  assert_eq(
    current.targets().filter(t => t.info.point.artist_index == index).length(),
    0,
  )
  assert_eq(
    current.targets(),
    old.targets().filter(t => t.info.point.artist_index != index),
  )
  assert_eq(old.targets().filter(t => t.info.kind == Barbs).length(), 1)
  ax.clear_checked()
  assert_true(ax.state.val.barb_intents.is_empty())
  ax.plot([0.0, 1.0], [0.0, 1.0])
  assert_true(fig.to_drawing().targets().all(t => t.info.kind == Line))
  ax.barbs([2.0], [3.0], [3.0], [4.0], barb_length=0.0)
  assert_eq(
    fig.to_drawing().targets().filter(t => t.info.kind == Barbs).length(),
    1,
  )
}

///|
test "ordinary Line identity rewrites retain their preexisting generic fallback" {
  let fig = figure()
  let ax = fig.axes()
  ax.plot([0.0, 1.0], [0.0, 1.0])
  ax.state.val.artists[0] = copy_artist(ax.state.val.artists[0])
  let frame = fig.to_drawing()
  assert_eq(frame.targets().length(), 2)
  assert_true(
    frame.targets().all(t => t.info.kind == Line && t.info.vector is None),
  )
}
