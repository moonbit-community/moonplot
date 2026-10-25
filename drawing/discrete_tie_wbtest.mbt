///|
fn discrete_coincident_target(
  kind : HitKind,
  index : Int32,
  artist~ : Int32 = 0,
  screen_x~ : Double = 50.0,
) -> HitTarget {
  hit_target(
    hit_info(
      hit_point(0, artist, index, 2.0, 3.0, screen_x, 50.0),
      kind,
      value=3.0,
    ),
    Point,
    (0.0, 0.0, 100.0, 100.0),
  )
}

///|
test "coincident discrete source points select later source slot regardless of capture order" {
  for kind in [Step, Stairs, Ecdf] {
    for order in [[0, 1], [1, 0]] {
      let targets = order.map(i => discrete_coincident_target(kind, i))
      let frame = drawing(100, 100, "", [], targets~)
      for mode in [Nearest, XNearest] {
        assert_eq(
          frame.hit_test(50.0, 50.0, radius=0.0, mode~).unwrap().point_index,
          1,
        )
      }
      if kind == Step {
        assert_eq(
          frame.hit_test(50.0, 80.0, radius=0.0, mode=XNearest).unwrap().point_index,
          1,
        )
      } else {
        assert_true(
          frame.hit_test(50.0, 80.0, radius=0.0, mode=XNearest) is None,
        )
      }
    }
  }
}

///|
test "discrete coincident source tie leaves cross artist paint old point rules and unique positions intact" {
  for mode in [Nearest, XNearest] {
    let earlier = discrete_coincident_target(Step, 9)
    let later = discrete_coincident_target(Step, 1, artist=1)
    let artists = drawing(100, 100, "", [], targets=[earlier, later])
    assert_eq(
      artists.hit_test(50.0, 50.0, radius=0.0, mode~).unwrap().artist_index,
      1,
    )
    let left = discrete_coincident_target(Step, 9, screen_x=49.0)
    let right = discrete_coincident_target(Step, 1, screen_x=51.0)
    let separate = drawing(100, 100, "", [], targets=[left, right])
    assert_eq(
      separate.hit_test(50.0, 50.0, radius=1.0, mode~).unwrap().point_index,
      1,
    )
    for kind in [Line, Scatter, ErrorBar] {
      let old_first = discrete_coincident_target(kind, 0)
      let old_last = discrete_coincident_target(kind, 1)
      let old = drawing(100, 100, "", [], targets=[old_first, old_last])
      assert_eq(
        old.hit_test(50.0, 50.0, radius=0.0, mode~).unwrap().point_index,
        0,
      )
      if kind == Line || kind == ErrorBar {
        assert_eq(
          old.hit_test(50.0, 80.0, radius=0.0, mode=XNearest).unwrap().point_index,
          0,
        )
      }
    }
    let first_line = discrete_coincident_target(Line, 0)
    let last_step = discrete_coincident_target(Step, 1)
    let mixed = drawing(100, 100, "", [], targets=[first_line, last_step])
    assert_eq(
      mixed.hit_test(50.0, 80.0, radius=0.0, mode=XNearest).unwrap().point_index,
      0,
    )
  }
}
