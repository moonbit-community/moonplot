///|
test "axis stores limits labels and tick count" {
  let value = @axis.axis()
  value.set_label("time")
  value.set_tick_count(4)
  try! value.set_limits(10.0, 0.0)
  assert_eq(value.label(), Some("time"))
  assert_eq(value.tick_count(), 4)
  let ticks = value.tick_values(@core.limits(0.0, 1.0))
  assert_eq(ticks.length(), 4)
  assert_true(ticks[0] == 10.0)
  assert_true(ticks[3] == 0.0)
  value.clear_limits()
  match value.limits() {
    None => ()
    Some(_) => fail("limits should be cleared")
  }
}

///|
test "axis supports fixed positions and labels" {
  let value = @axis.axis()
  try! value.set_ticks([0.0, 0.5, 1.0])
  try! value.set_tick_labels(["low", "mid", "high"])
  let ticks = value.tick_values(@core.limits(10.0, 20.0))
  assert_eq(ticks.length(), 3)
  assert_true(ticks[1] == 0.5)
  assert_eq(value.tick_labels(ticks), ["low", "mid", "high"])
  value.clear_ticks()
  assert_eq(value.tick_values(@core.limits(0.0, 1.0)).length(), 6)
}

///|
test "axis rejects invalid tick data" {
  let value = @axis.axis()
  try value.set_ticks([0.0 / 0.0]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("finite"))
    _ => fail("expected invalid tick positions")
  } noraise {
    _ => fail("expected a tick error")
  }
  try value.set_tick_labels(["orphan"]) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("positions"))
    _ => fail("expected invalid tick labels")
  } noraise {
    _ => fail("expected a tick error")
  }
}

///|
test "category axis conversion extends without renumbering" {
  let axis = @axis.axis()
  assert_eq(try! axis.category_positions(["c", "a", "c"]), [0.0, 1.0, 0.0])
  assert_eq(try! axis.category_positions(["a", "b"]), [1.0, 2.0])
  let ticks = axis.tick_values(@core.limits(-1.0, 4.0))
  assert_eq(ticks, [0.0, 1.0, 2.0])
  assert_eq(axis.tick_labels(ticks), ["c", "a", "b"])
  axis.clear_categories()
  assert_eq(axis.categories(), None)
}

///|
test "fixed numeric ticks replace category mode" {
  let axis = @axis.axis()
  try! axis.set_categories(["one", "two"])
  try! axis.set_ticks([10.0, 20.0])
  try! axis.set_tick_labels(["ten", "twenty"])
  assert_eq(axis.categories(), None)
  let ticks = axis.tick_values(@core.limits(0.0, 1.0))
  assert_eq(ticks, [10.0, 20.0])
  assert_eq(axis.tick_labels(ticks), ["ten", "twenty"])
}

///|
test "empty strings extend category axes as valid categories" {
  let axis = @axis.axis()
  try! axis.set_categories(["one"])
  assert_eq(try! axis.category_positions(["two", ""]), [1.0, 2.0])
  assert_eq(axis.categories(), Some(["one", "two", ""]))
}

///|
test "major grids are disabled by default and keep their style" {
  let axis = @axis.axis()
  assert_true(!axis.grid_visible())
  try! axis.set_grid(true, "#123456", 0.75)
  assert_true(axis.grid_visible())
  assert_eq(axis.grid_color(), "#123456")
  assert_true(axis.grid_width() == 0.75)
  try axis.set_grid(true, "", 1.0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("color"))
    _ => fail("expected invalid grid color")
  } noraise {
    _ => fail("expected invalid grid color")
  }
  try axis.set_grid(true, "#123456", 0.0) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("linewidth"))
    _ => fail("expected invalid grid width")
  } noraise {
    _ => fail("expected invalid grid width")
  }
}

///|
test "new axes read grid defaults from rc params" {
  @config.reset()
  try! @config.set_grid(true, "#abcdef", 0.5)
  let axis = @axis.axis()
  assert_true(axis.grid_visible())
  assert_eq(axis.grid_color(), "#abcdef")
  assert_true(axis.grid_width() == 0.5)
  axis.clear()
  assert_true(axis.grid_visible())
  assert_eq(axis.grid_color(), "#abcdef")
  @config.reset()
}

///|
test "axis accepts major and minor locators" {
  let value = @axis.axis()
  let major = try! @ticker.maxn_locator(count=5)
  try! value.set_locator(major)
  assert_eq(value.tick_values(@core.limits(0.0, 10.0)), [
    0.0, 2.5, 5.0, 7.5, 10.0,
  ])
  let minor = try! @ticker.auto_minor_locator(subdivisions=2)
  try! value.set_minor_locator(minor)
  assert_eq(value.minor_tick_values(@core.limits(0.0, 10.0)), [
    1.25, 3.75, 6.25, 8.75,
  ])
  try! value.set_minor_grid(true, "#abcdef", 0.25)
  assert_true(value.minor_grid_visible())
  assert_eq(value.minor_grid_color(), "#abcdef")
  assert_true(value.minor_grid_width() == 0.25)
}

///|
test "axis applies numeric formatter to generated labels" {
  let value = @axis.axis()
  try! value.set_limits(0.0, 2.0)
  try! value.set_formatter(@ticker.format_str_formatter("x=%.1f"))
  assert_eq(value.tick_labels([0.0, 1.0, 2.0]), ["x=0.0", "x=1.0", "x=2.0"])
  value.clear_formatter()
  match value.formatter() {
    None => ()
    Some(_) => fail("formatter should be cleared")
  }
}

///|
test "axis locator getters and setters isolate array storage" {
  let axis = @axis.axis()
  let major_values = [1.0, 2.0]
  try! axis.set_locator(@ticker.Locator::Fixed(major_values))
  major_values[0] = 99.0
  assert_eq(axis.tick_values(@core.limits(0.0, 3.0)), [1.0, 2.0])
  match axis.locator() {
    Some(@ticker.Locator::Fixed(values)) => values[0] = 88.0
    _ => fail("expected fixed locator")
  }
  assert_eq(axis.tick_values(@core.limits(0.0, 3.0)), [1.0, 2.0])

  let minor_values = [1.5]
  try! axis.set_minor_locator(@ticker.MinorLocator::Fixed(minor_values))
  minor_values[0] = 77.0
  assert_eq(axis.minor_tick_values(@core.limits(0.0, 3.0)), [1.5])
  match axis.minor_locator() {
    Some(@ticker.MinorLocator::Fixed(values)) => values[0] = 66.0
    _ => fail("expected fixed minor locator")
  }
  assert_eq(axis.minor_tick_values(@core.limits(0.0, 3.0)), [1.5])
}

///|
test "axis passes its viewport to automatic percentage labels" {
  let value = @axis.axis()
  try! value.set_limits(0.0, 100.0)
  try! value.set_formatter(try! @ticker.percent_formatter(xmax=100.0))
  assert_eq(value.tick_labels([95.0]), ["95%"])
  assert_eq(value.tick_labels_with_view([95.0], Some(@core.limits(0.0, 1.0))), [
    "95.00%",
  ])
}

///|
test "axis exposes scalar formatter offset labels" {
  let value = @axis.axis()
  try! value.set_formatter(try! @ticker.scalar_formatter())
  assert_eq(value.formatter_offset_label([1000000.0, 1000001.0]), "+1e6")
  try! value.set_formatter(try! @ticker.scalar_formatter(use_offset=false))
  assert_eq(value.formatter_offset_label([1000000.0, 1000001.0]), "1e6")
  try! value.set_ticks([1000000.0, 1000001.0])
  try! value.set_tick_labels(["a", "b"])
  assert_eq(value.formatter_offset_label([1000000.0, 1000001.0]), "")
}

///|
test "axis rejects numeric formatter in date and category modes" {
  let date_axis = @axis.axis()
  try! date_axis.set_date()
  try date_axis.set_formatter(@ticker.null_formatter()) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("date"))
    _ => fail("expected date formatter conflict")
  } noraise {
    _ => fail("expected date formatter conflict")
  }
  let category_axis = @axis.axis()
  try! category_axis.set_categories(["a", "b"])
  try category_axis.set_formatter(@ticker.null_formatter()) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("category"))
    _ => fail("expected category formatter conflict")
  } noraise {
    _ => fail("expected category formatter conflict")
  }
}

///|
test "axis rejects incompatible log locators" {
  let value = @axis.axis()
  try! value.set_scale(@scale.log_scale())
  try value.set_locator(@ticker.linear_locator()) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("log scale"))
    _ => fail("expected log locator error")
  } noraise {
    _ => fail("expected log locator error")
  }
  try! value.set_locator(try! @ticker.log_locator())
  try value.set_minor_locator(try! @ticker.auto_minor_locator()) catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_true(message.contains("log scale"))
    _ => fail("expected log minor locator error")
  } noraise {
    _ => fail("expected log minor locator error")
  }
}
