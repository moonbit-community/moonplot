///|
test "streamplot uses nearest mask coordinates and boundary-first seeds" {
  assert_eq(stream_cell(0.26, 0.0, 1.0, 3), 1)
  let seeds = stream_seed_points(3, 3, 0.0, 2.0, 0.0, 2.0)
  assert_eq(seeds[0].x(), 0.0)
  assert_eq(seeds[0].y(), 0.0)
  assert_eq(seeds[1].x(), 1.0)
  assert_eq(seeds[1].y(), 0.0)
  assert_eq(seeds[2].x(), 2.0)
  assert_eq(seeds[2].y(), 0.0)
  assert_eq(seeds[3].x(), 2.0)
  assert_eq(seeds[3].y(), 1.0)
  assert_eq(seeds[8].x(), 1.0)
  assert_eq(seeds[8].y(), 1.0)
}

///|
test "streamplot seed generation handles one-cell mask dimensions" {
  let one_column = stream_seed_points(1, 2, 0.0, 1.0, 0.0, 1.0)
  assert_eq(one_column.length(), 2)
  assert_eq(one_column[1].x(), 0.5)
  assert_eq(one_column[1].y(), 1.0)
  let one_row = stream_seed_points(2, 1, 0.0, 1.0, 0.0, 1.0)
  assert_eq(one_row.length(), 2)
  assert_eq(one_row[1].x(), 1.0)
  assert_eq(one_row[1].y(), 0.5)
}
