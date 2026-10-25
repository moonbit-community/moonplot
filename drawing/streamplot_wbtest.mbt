///|
test "StreamplotInfo finite optional generated samples validate without inventing magnitude or a required record" {
  let p = hit_point(0, 0, 1, 0.5, 0.5, 50.0, 50.0)
  let valid = streamplot_info(2, 1.0e308, -1.0e308)
  assert_eq(valid.color_value, None)
  for
    info in [
      Some(valid),
      Some(streamplot_info(2, 0.0, 0.0, color_value=Some(7.0))),
      None,
      Some(streamplot_info(-1, 1.0, 2.0)),
      Some(streamplot_info(2, 1.0 / 0.0, 0.0)),
      Some(streamplot_info(2, 1.0, 0.0 / 0.0)),
      Some(streamplot_info(2, 1.0, 2.0, color_value=Some(1.0 / 0.0))),
    ] {
    let target = hit_target(
      hit_info(p, Streamplot, value=0.0, streamplot=info),
      Segment(10.0, 50.0, 90.0, 50.0),
      (0.0, 0.0, 100.0, 100.0),
    )
    let frame = drawing(100, 100, "", [], targets=[target])
    let expected = match info {
      None => true
      Some(s) =>
        s.seed_index >= 0 &&
        finite(s.u) &&
        finite(s.v) &&
        (match s.color_value {
          None => true
          Some(c) => finite(c)
        })
    }
    assert_eq(frame.hit_test(50.0, 50.0, radius=0.0) is Some(_), expected)
  }
}
