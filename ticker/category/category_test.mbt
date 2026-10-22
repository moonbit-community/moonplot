///|
test "category positions preserve first-seen order and duplicates" {
  let converter = @category.category()
  let (positions, next) = converter.encode(["low", "high", "low"])
  assert_eq(positions, [0.0, 1.0, 0.0])
  assert_eq(next.tick_labels(), ["low", "high"])
  let (more_positions, extended) = next.encode(["high", "mid"])
  assert_eq(more_positions, [1.0, 2.0])
  assert_eq(extended.tick_positions(), [0.0, 1.0, 2.0])
}

///|
test "category converter preserves empty labels as valid categories" {
  let (positions, converter) = @category.category().encode(["ok", "", ""])
  assert_eq(positions, [0.0, 1.0, 1.0])
  assert_eq(converter.tick_labels(), ["ok", ""])
}

///|
test "category converter can be initialized with labels" {
  let converter = @category.category().with_labels(["a", "b"])
  assert_eq(converter.length(), 2)
  assert_eq(converter.labels(), ["a", "b"])
}

///|
test "category conversion is persistent and owns its returned arrays" {
  let base = @category.category().with_labels(["a"])
  let (_, next) = base.encode(["b", "a"])
  assert_eq(base.labels(), ["a"])
  assert_eq(next.labels(), ["a", "b"])
  let labels = next.labels()
  labels.push("c")
  assert_eq(next.labels(), ["a", "b"])
  let positions = next.tick_positions()
  positions.push(9.0)
  assert_eq(next.tick_positions(), [0.0, 1.0])
}
