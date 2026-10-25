///|
// Independent polygon half-plane checks use the actual source vertices. They
// do not repeat the weighted-nearest implementation being tested.
fn hexbin_inside_polygon(
  x : Double,
  y : Double,
  vertices : Array[@core.Point],
  strict~ : Bool = false,
) -> Bool {
  for i in 0..<vertices.length() {
    let a = vertices[i]
    let b = vertices[(i + 1) % vertices.length()]
    let cross = (b.x() - a.x()) * (y - a.y()) - (b.y() - a.y()) * (x - a.x())
    if (if strict { cross <= 1.0e-11 } else { cross < -1.0e-11 }) {
      return false
    }
  }
  true
}

///|
test "hexbin partition every retained source sample lies in its actual aggregated polygon and preserves sample order" {
  let (fig, ax) = hexbin_axes()
  let xs : Array[Double] = []
  let ys : Array[Double] = []
  let values : Array[Double] = []
  for i in 0..<27 {
    for j in 0..<23 {
      xs.push((i.to_double() + 0.137) / 27.0 * 4.0)
      ys.push((j.to_double() + 0.271) / 23.0 * 4.0)
      values.push(values.length().to_double())
    }
  }
  let groups : Array[Array[Double]] = []
  let bins = ax.hexbin(
    xs,
    ys,
    values~,
    gridsize=4,
    extent=[0.0, 4.0, 0.0, 4.0],
    reduce_fn=Some(
      hexbin_reducer(samples => {
        groups.push(samples.copy())
        samples[0]
      }),
    ),
  )
  let frame = fig.to_drawing()
  assert_eq(frame.svg(), fig.to_svg_checked())
  assert_eq(groups.length(), bins.counts().length())
  let mut total = 0
  for index, group in groups {
    assert_eq(group.length(), bins.counts()[index])
    total += group.length()
    let targets = frame.targets().filter(t => t.info.point.point_index == index)
    assert_eq(targets.length(), 2)
    let artist = targets[0].info.point.artist_index
    guard ax.state.val.artists[artist] is Polygon(vertices, _) else {
      fail("Expected the actual bin polygon")
    }
    let isolated = @drawing.drawing(400, 200, "", [], targets~)
    for i, value in group {
      let source = value.to_int()
      assert_true(hexbin_inside_polygon(xs[source], ys[source], vertices))
      let hit = isolated
        .hit_test(xs[source] * 100.0, 200.0 - ys[source] * 50.0, radius=0.0)
        .unwrap()
      assert_eq(hit.point_index, index)
      if i > 0 {
        assert_true(group[i - 1] < value)
      }
    }
  }
  assert_eq(total, xs.length())
  // Rendering reuses the stored result; no custom reducer is executed again.
  assert_eq(groups.length(), bins.counts().length())
}

///|
test "hexbin partition all grid faces cover the extent without positive-area overlap or gaps" {
  for nx in [1, 2, 4, 7] {
    let grid = hexbin_grid(0.0, 8.0, 0.0, 6.0, nx)
    let faces : Array[Array[@core.Point]] = []
    for row in 0..<=(2 * grid.ny) {
      let columns = if row % 2 == 0 { nx + 1 } else { nx }
      for column in 0..<columns {
        faces.push(
          grid.vertices(
            column,
            row,
            @scale.linear_scale(),
            @scale.linear_scale(),
          ),
        )
      }
    }
    for i in 0..<43 {
      for j in 0..<37 {
        let x = (i.to_double() + 0.137) / 43.0 * 8.0
        let y = (j.to_double() + 0.271) / 37.0 * 6.0
        let mut closed = 0
        let mut interior = 0
        for face in faces {
          if hexbin_inside_polygon(x, y, face) {
            closed += 1
          }
          if hexbin_inside_polygon(x, y, face, strict=true) {
            interior += 1
          }
        }
        assert_true(closed >= 1)
        assert_true(interior <= 1)
        let (column, row) = grid.cell(x, y)
        assert_true(
          hexbin_inside_polygon(
            x,
            y,
            grid.vertices(
              column,
              row,
              @scale.linear_scale(),
              @scale.linear_scale(),
            ),
          ),
        )
      }
    }
    // Every interior edge has a neighboring face with exactly the same two
    // endpoints in reverse order, rather than approximately adjacent bounds.
    for face in faces {
      for i in 0..<6 {
        let a = face[i]
        let b = face[(i + 1) % 6]
        let middle_x = (a.x() + b.x()) / 2.0
        let middle_y = (a.y() + b.y()) / 2.0
        if middle_x <= 0.0 ||
          middle_x >= 8.0 ||
          middle_y <= 0.0 ||
          middle_y >= 6.0 {
          continue
        }
        let mut matches = 0
        for other in faces {
          for j in 0..<6 {
            let c = other[j]
            let d = other[(j + 1) % 6]
            if a.x() == d.x() &&
              a.y() == d.y() &&
              b.x() == c.x() &&
              b.y() == c.y() {
              matches += 1
            }
          }
        }
        assert_eq(matches, 1)
      }
    }
  }
}

///|
test "hexbin partition inclusive four edges maxima and ties choose containing valid cells deterministically" {
  let grid = hexbin_grid(0.0, 8.0, 0.0, 4.0, 4)
  assert_eq((grid.nx, grid.ny), (4, 2))
  assert_eq(hexbin_nearest_integer(0.5), 0)
  assert_eq(hexbin_nearest_integer(1.5), 2)
  assert_eq(hexbin_nearest_integer(2.5), 2)
  assert_eq(hexbin_nearest_integer(3.5), 4)
  assert_eq(grid.cell(1.0, 0.0), (0, 0))
  assert_eq(grid.cell(3.0, 0.0), (2, 0))
  // Equal distances to integer (0,0) and half-grid (1,1): half wins.
  assert_eq(grid.cell(0.5, 0.5), (0, 1))
  assert_eq(grid.cell(0.5 - 1.0e-8, 0.5), (0, 0))
  assert_eq(grid.cell(0.5 + 1.0e-8, 0.5), (0, 1))
  assert_eq(grid.cell(8.0, 1.0), (3, 1))
  assert_eq(grid.cell(8.0, 4.0), (4, 4))
  for
    (x, y) in [
      (0.0, 0.0),
      (8.0, 0.0),
      (0.0, 4.0),
      (8.0, 4.0),
      (0.0, 1.0),
      (8.0, 1.0),
      (0.0, 3.0),
      (8.0, 3.0),
      (1.0, 0.0),
      (1.0, 4.0),
      (7.0, 0.0),
      (7.0, 4.0),
      (0.5, 0.5),
    ] {
    let (column, row) = grid.cell(x, y)
    assert_true(
      hexbin_inside_polygon(
        x,
        y,
        grid.vertices(column, row, @scale.linear_scale(), @scale.linear_scale()),
      ),
    )
  }
  let (fig, ax) = hexbin_axes()
  let result = ax.hexbin([0.1], [0.1], gridsize=2, extent=[0.0, 4.0, 0.0, 4.0])
  assert_eq((result.centers()[0].x(), result.centers()[0].y()), (0.0, 0.0))
  assert_true(fig.to_drawing().hit_test(10.0, 195.0, radius=0.0) is Some(_))
}

///|
test "hexbin partition sparse filtering first encounter order and custom reduction input order stay stable" {
  let (fig, ax) = hexbin_axes()
  let groups : Array[Array[Double]] = []
  let result = ax.hexbin(
    [3.1, 0.8, 3.2, 1.2, 0.9],
    [2.0, 1.6, 2.2, 2.2, 2.0],
    values=[7.0, 2.0, 8.0, 5.0, 6.0],
    gridsize=2,
    extent=[0.0, 4.0, 0.0, 4.0],
    reduce_fn=Some(
      hexbin_reducer(samples => {
        groups.push(samples.copy())
        samples.fold(init=0.0, (value, sample) => value * 10.0 + sample)
      }),
    ),
  )
  assert_eq(groups, [[7.0, 8.0], [2.0, 5.0, 6.0]])
  assert_eq(result.values(), [78.0, 256.0])
  assert_eq(result.counts(), [2, 3])
  assert_eq(result.centers().map(p => (p.x(), p.y())), [(3.0, 2.0), (1.0, 2.0)])
  let frame = fig.to_drawing()
  assert_eq(frame.targets()[0].info.hexbin.unwrap().column, 1)
  assert_eq(frame.targets()[2].info.hexbin.unwrap().column, 0)
  ax.clear()
  let filtered = hexbin_pair(ax, mincnt=3)
  assert_eq(filtered.counts(), [3])
  assert_eq(fig.to_drawing().points()[0].point_index, 0)
  assert_eq(fig.to_drawing().targets()[0].info.hexbin.unwrap().column, 1)
}

///|
test "hexbin partition transformed axes and inverse vertices contain original samples with reversed extents" {
  for
    scale in [
      @scale.log_scale(),
      @scale.symlog_scale(linthresh=1.0),
      @scale.asinh_scale(),
      @scale.logit_scale(),
    ] {
    let (fig, ax) = hexbin_axes()
    ax.set_x_scale(scale)
    ax.set_y_scale(scale)
    let (low, high) = if scale.is_logit() {
      (0.1, 0.9)
    } else if scale.is_log() {
      (1.0, 100.0)
    } else {
      (-10.0, 10.0)
    }
    ax.set_x_limits(high, low)
    ax.set_y_limits(low, high)
    let first = scale.transform(low)
    let last = scale.transform(high)
    for (u, v) in [(0.017, 0.023), (0.31, 0.47), (0.83, 0.71), (0.99, 0.99)] {
      ax.clear()
      ax.set_x_scale(scale)
      ax.set_y_scale(scale)
      ax.set_x_limits(high, low)
      ax.set_y_limits(low, high)
      let x = scale.inverse(first + u * (last - first))
      let y = scale.inverse(first + v * (last - first))
      ignore(ax.hexbin([x], [y], gridsize=4, extent=[high, low, high, low]))
      let frame = fig.to_drawing()
      assert_eq(frame.svg(), fig.to_svg_checked())
      let hit = frame
        .hit_test(400.0 * (1.0 - u), 200.0 * (1.0 - v), radius=0.0)
        .unwrap()
      assert_eq(frame.hit_info(hit).unwrap().hexbin.unwrap().count, 1)
    }
  }
}

///|
test "hexbin partition marginals retain all counts and finite clipped bars at the real maximum lattice indices" {
  let cells : Array[HexbinCell] = [
    { col: 0, row: 0, count: 1, sum: 0.0, samples: [], },
    { col: 2, row: 2, count: 2, sum: 0.0, samples: [], },
    { col: 1, row: 1, count: 3, sum: 0.0, samples: [], },
  ]
  let marginal = hexbin_marginals(cells)
  assert_eq(marginal.columns.get((2, 0)), Some(2))
  assert_eq(marginal.rows.get(2), Some(2))
  let mut column_total = 0
  let mut row_total = 0
  for _, n in marginal.columns {
    column_total += n
  }
  for _, n in marginal.rows {
    row_total += n
  }
  assert_eq((column_total, row_total), (6, 6))
  for scale in [@scale.linear_scale(), @scale.log_scale()] {
    let (fig, ax) = hexbin_axes()
    ax.set_x_scale(scale)
    ax.set_y_scale(scale)
    let low = if scale.is_log() { 1.0 } else { 0.0 }
    let high = if scale.is_log() { 100.0 } else { 4.0 }
    ax.set_x_limits(low, high)
    ax.set_y_limits(low, high)
    let middle = scale.inverse(
      (scale.transform(low) + scale.transform(high)) / 2.0,
    )
    let result = ax.hexbin(
      [low, high, middle],
      [low, high, middle],
      gridsize=2,
      extent=[low, high, low, high],
      mincnt=99,
      marginals=true,
    )
    assert_eq(result.counts(), [])
    assert_true(ax.state.val.artists.length() > 0)
    for artist in ax.state.val.artists {
      guard artist is Polygon(vertices, _) else {
        fail("Expected marginal rectangle")
      }
      assert_eq(vertices.length(), 4)
      for p in vertices {
        assert_true(p.is_finite())
        assert_true(p.x() >= low && p.x() <= high)
        assert_true(p.y() >= low && p.y() <= high)
      }
      assert_true(vertices[0].x() < vertices[1].x())
      assert_true(vertices[0].y() < vertices[2].y())
    }
    assert_eq(fig.to_drawing().targets().length(), 0)
  }
}
