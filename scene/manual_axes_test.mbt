///|
test "manual panels preserve creation order and independent plot state" {
  let fig = @scene.figure(width=400, height=300)
  let implicit = fig.axes()
  let first = fig.add_axes(0.1, 0.1, 0.5, 0.5)
  assert_true(!implicit.is_attached())
  let second = fig.add_axes(0.2, 0.2, 0.5, 0.5)
  assert_true(first.is_attached() && second.is_attached())
  first.set_title("first-created")
  second.set_title("second-created")
  for panel in [first, second] {
    panel.set_color_cycle(["#123456", "#abcdef"])
  }
  first.plot([0.0, 1.0], [0.0, 1.0])
  first.plot([0.0, 1.0], [1.0, 0.0])
  second.plot([10.0, 20.0], [30.0, 40.0])
  first.set_x_limits(0.0, 2.0)
  assert_true(second.x_limits() is None)
  second.set_x_limits(10.0, 20.0)
  assert_true(first.x_limits() is Some(limits) && limits.upper() == 2.0)
  assert_eq(first.artists().length(), 2)
  assert_eq(second.artists().length(), 1)
  match (first.artists()[1], second.artists()[0]) {
    (@scene.Artist::Line(_, first_style), @scene.Artist::Line(_, second_style)) => {
      assert_eq(first_style.color(), "#abcdef")
      assert_eq(second_style.color(), "#123456")
    }
    _ => fail("expected independent line artists")
  }
  assert_eq(fig.axes_list().map(panel => panel.title()), [
    Some("first-created"),
    Some("second-created"),
  ])
  assert_eq(fig.axes().title(), Some("first-created"))
  let svg = fig.to_svg()
  assert_true(
    svg.find(">first-created<").unwrap() < svg.find(">second-created<").unwrap(),
  )
  let replacements = fig.subplots(1, 2)
  assert_true(!first.is_attached() && !second.is_attached())
  assert_true(replacements[0].is_attached() && replacements[1].is_attached())
}

///|
test "manual panels coexist with shared GridSpec panels and stay fixed" {
  let fig = @scene.figure(width=400, height=300)
  let shared = fig.subplots(1, 2, share_x=true, share_y=true)
  let manual = fig.add_axes(0.25, 0.25, 0.5, 0.5)
  shared[0].set_x_limits(1.0, 10.0)
  shared[0].set_y_limits(2.0, 20.0)
  assert_true(manual.x_limits() is None && manual.y_limits() is None)
  manual.set_x_limits(-10.0, -1.0)
  manual.set_y_limits(-20.0, -2.0)
  for panel in shared {
    assert_true(panel.x_limits() is Some(limits) && limits.lower() == 1.0)
    assert_true(panel.y_limits() is Some(limits) && limits.lower() == 2.0)
  }
  let previous = shared[0].rect().unwrap()
  fig.subplots_adjust(left=0.25, bottom=0.25, right=0.75, top=0.75, wspace=0.5)
  assert_true(shared[0].rect().unwrap().x() != previous.x())
  let fixed = manual.rect().unwrap()
  assert_eq(
    (fixed.x(), fixed.y(), fixed.width(), fixed.height()),
    (100.0, 75.0, 200.0, 150.0),
  )
  assert_true(manual.get_subplotspec() is None)
  assert_eq(fig.axes_list().length(), 3)
}

///|
test "fully collapsed manual panels remain finite in SVG" {
  let fig = @scene.figure(width=400, height=300)
  let panel = fig.add_axes(0.25, 0.25, -0.0, 0.0)
  panel.plot([0.0, 1.0], [0.0, 1.0])
  let bounds = panel.rect().unwrap()
  assert_eq(
    (bounds.x(), bounds.y(), bounds.width(), bounds.height()),
    (100.0, 225.0, 0.0, 0.0),
  )
  let svg = fig.to_svg()
  assert_true(!svg.contains("NaN"))
  assert_true(!svg.contains("Infinity"))
}
