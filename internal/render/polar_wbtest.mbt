///|
test "polar projection snapshots and getters never expose mutable tick or closure aliases" {
  let theta = [0.0, 1.0]
  let labels = ["one", "two"]
  let radius = [1.0, 2.0]
  let closed = [true, false]
  let projection = polar_projection(
    Some(2.0),
    1.0,
    true,
    theta,
    labels,
    Some(radius),
    labels,
    closed,
  )
  theta[0] = 9.0
  labels[0] = "Changed"
  radius[0] = 9.0
  closed[0] = false
  projection.theta_ticks()[0] = 8.0
  projection.theta_labels()[0] = "Changed again"
  projection.radius_ticks().unwrap()[0] = 8.0
  projection.radius_labels()[0] = "Changed again"
  assert_eq(projection.theta_ticks(), [0.0, 1.0])
  assert_eq(projection.theta_labels(), ["one", "two"])
  assert_eq(projection.radius_ticks(), Some([1.0, 2.0]))
  assert_eq(projection.radius_labels(), ["one", "two"])
  assert_true(
    projection.closed(0) && !projection.closed(1) && !projection.closed(2),
  )
}
