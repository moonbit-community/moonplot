///|
test "category producers retain user formatting on subsequent appended names" {
  let axes = figure().axes()
  axes.plot_category(["a", "b"], [1.0, 2.0])
  let formatter = @ticker.FuncFormatter::new((value, _) => {
    "value=" + value.to_string()
  })
  axes.set_x_named_formatter(formatter.as_base_formatter())
  axes.scatter_category(["b", "c"], [3.0, 4.0])
  assert_true(
    physical_equal(
      axes.x_axis().named_formatter().unwrap(),
      formatter.as_base_formatter(),
    ),
  )
  assert_eq(axes.x_axis().get_category_units().unwrap().labels(), [
    "a", "b", "c",
  ])
}

///|
test "unit callback rebuilds both raw intervals but requests one coordinate" {
  let axes = figure().axes()
  axes.plot([10.0, 20.0], [30.0, 40.0])
  axes.unstale_view()
  ignore(axes.update_x_category_units(["a"]))
  assert_true(axes.x_axis().autoscale_stale())
  assert_true(!axes.y_axis().autoscale_stale())
  let x = axes.data_limits()
  let y = axes.data_limits(horizontal=false)
  assert_eq((x.lower(), x.upper()), (10.0, 20.0))
  assert_eq((y.lower(), y.upper()), (30.0, 40.0))
}

///|
test "shared unit holder extends even when peer converter is discovered later" {
  let panels = figure().subplots(1, 2, share_x=true)
  panels[0].plot_category(["b", "a"], [1.0, 2.0])
  assert_true(panels[1].x_axis().have_units())
  assert_eq(panels[1].x_axis().unit_converter_kind(), None)
  panels[1].plot_category(["a", "c"], [2.0, 3.0])
  let first = panels[0].x_axis().get_category_units().unwrap()
  let second = panels[1].x_axis().get_category_units().unwrap()
  assert_true(physical_equal(first, second))
  assert_eq(first.labels(), ["b", "a", "c"])
  assert_eq(panels[1].x_axis().unit_converter_kind(), Some("category"))
}

///|
test "empty ordinary date producer does not infer a converter" {
  let axes = figure().axes()
  axes.plot_date_units([], [])
  assert_true(!axes.x_axis().have_units())
  assert_true(axes.x_axis().date_converter() is None)
}

///|
test "sharing after category data aliases ticker roles without copying unit metadata" {
  let fig = figure()
  let target = fig.axes()
  target.plot_category(["a", "b"], [1.0, 2.0])
  let spec = fig.grid_spec(1, 2).cell_spec(0, 1)
  let peer = fig.add_subplot_with_targets(spec, Some(target.state), None)
  assert_true(peer.x_axis().unit_tag() is None)
  assert_eq(peer.x_axis().unit_converter_kind(), None)
  // Slot tags are private to the Axis package; public tick locations still
  // prove the shared category holder without inventing a copied unit.
  assert_eq(peer.x_axis().tick_values_checked(@core.limits(0.0, 1.0)), [
    0.0, 1.0,
  ])
}

///|
test "explicit shared category configuration keeps one mapping through later appends" {
  let panels = figure().subplots(1, 2, share_x=true)
  panels[0].set_x_categories(["a", "b"])
  panels[0].plot_category(["c"], [1.0])
  panels[1].plot_category(["d"], [2.0])
  assert_eq(panels[0].x_axis().categories(), Some(["a", "b", "c", "d"]))
  assert_eq(panels[1].x_axis().categories(), Some(["a", "b", "c", "d"]))
  assert_eq(panels[0].x_axis().tick_values_checked(@core.limits(0.0, 3.0)), [
    0.0, 1.0, 2.0, 3.0,
  ])
}
