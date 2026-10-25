///|
test "step exact source endpoint survives fractional meet CSS roundtrip without absorbing real riser interiors" {
  let fig = figure(width=401, height=257)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-1.7, 4.8)
  ax.set_y_limits(-3.2, 10.3)
  ax.legend([])
  ax.step([0.2, 1.9, 4.1], [2.3, 7.2, 4.4], where_="pre")
  let frame = fig.to_drawing()
  let canonical = frame.points().filter(p => p.point_index == 0)[0]
  let client_x = 128.10461538461536
  let client_y = 156.16361873095036
  for mode in [@drawing.HitMode::Nearest, XNearest] {
    let selected = frame
      .hit_test_client(
        client_x,
        client_y,
        17.7,
        5.8999999999999995,
        377.7,
        255.7,
        radius=1.0e-6,
        mode~,
      )
      .unwrap()
    assert_eq(
      (selected.point_index, frame.hit_info(selected).unwrap().value),
      (0, 2.3),
    )
    // A real position one millionth of an SVG pixel inside the riser must
    // keep its incoming sample; the repair is only binary64 roundoff.
    let inside = frame
      .hit_test(
        canonical.screen_x,
        canonical.screen_y - 1.0e-6,
        radius=1.0e-5,
        mode~,
      )
      .unwrap()
    assert_eq(
      (inside.point_index, frame.hit_info(inside).unwrap().value),
      (1, 7.2),
    )
  }
}
