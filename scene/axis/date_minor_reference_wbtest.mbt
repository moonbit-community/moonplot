// Generated from pinned axis.get_minorticklocs.

///|
test "date minor overlap upstream reference 0" {
  let axis = axis()
  axis.set_minor_overlap_removal(true)
  assert_eq(
    axis.filter_date_minor_ticks(
      [0.0, 0.5, 1.0],
      [0.0, 1.0],
      @core.limits(0.0, 1.0),
    ),
    [0.5],
  )
}

///|
test "date minor overlap upstream reference 1" {
  let axis = axis()
  axis.set_minor_overlap_removal(true)
  assert_eq(
    axis.filter_date_minor_ticks(
      [9.0e-06, 1.1e-05, 0.999989, 0.999991],
      [0.0, 1.0],
      @core.limits(1.0, 0.0),
    ),
    [1.1e-05, 0.999989],
  )
}

///|
test "date minor overlap upstream reference 2" {
  let axis = axis()
  axis.set_minor_overlap_removal(true)
  assert_eq(
    axis.filter_date_minor_ticks(
      [19847.500009, 19847.500011, 19847.4],
      [19847.5],
      @core.limits(19847.0, 19848.0),
    ),
    [19847.500011, 19847.4],
  )
}

///|
test "date minor overlap upstream reference 3" {
  let axis = axis()
  axis.set_minor_overlap_removal(true)
  assert_eq(
    axis.filter_date_minor_ticks([0.0, 1.0e-06], [0.0], @core.limits(0.0, 0.0)),
    [1.0e-06],
  )
}

///|
test "date minor overlap upstream reference 4" {
  let axis = axis()
  axis.set_minor_overlap_removal(true)
  assert_eq(
    axis.filter_date_minor_ticks([0.0, 0.5, 1.0], [], @core.limits(0.0, 1.0)),
    [0.0, 0.5, 1.0],
  )
}

///|
test "date minor overlap upstream reference 5" {
  let axis = axis()
  axis.set_minor_overlap_removal(false)
  assert_eq(
    axis.filter_date_minor_ticks(
      [0.0, 0.5, 1.0],
      [0.0, 1.0],
      @core.limits(0.0, 1.0),
    ),
    [0.0, 0.5, 1.0],
  )
}
