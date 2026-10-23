// Generated from complete original string Formatter / Axis / Secondary batches.

///|
test "string Formatter original public SVG 0" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.float64(0.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.float64(2.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:0.00<").count() - 1, 1)
  assert_eq(svg.split(">m:2:1.00<").count() - 1, 1)
  assert_eq(svg.split(">m:3:2.00<").count() - 1, 1)
  assert_eq(svg.split(">m:4:3.00<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.float64(-1.0)<"))
  assert_true(!svg.contains(">M:np.float64(4.0)<"))
  assert_true(!svg.contains(">m:0:−2.00<"))
  assert_true(!svg.contains(">m:5:5.00<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 1" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.float64(0.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.float64(2.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:1.00<").count() - 1, 1)
  assert_eq(svg.split(">m:2:3.00<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.float64(-1.0)<"))
  assert_true(!svg.contains(">M:np.float64(4.0)<"))
  assert_true(!svg.contains(">m:0:−2.00<"))
  assert_true(!svg.contains(">m:3:5.00<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 2" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.float64(0.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.float64(2.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:0.0<").count() - 1, 1)
  assert_eq(svg.split(">m:1.0<").count() - 1, 1)
  assert_eq(svg.split(">m:2.0<").count() - 1, 1)
  assert_eq(svg.split(">m:3.0<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.float64(−1.0)<"))
  assert_true(!svg.contains(">M:3:np.float64(4.0)<"))
  assert_true(!svg.contains(">m:-2.0<"))
  assert_true(!svg.contains(">m:5.0<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 3" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.float64(0.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.float64(2.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1.0<").count() - 1, 1)
  assert_eq(svg.split(">m:3.0<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.float64(−1.0)<"))
  assert_true(!svg.contains(">M:3:np.float64(4.0)<"))
  assert_true(!svg.contains(">m:-2.0<"))
  assert_true(!svg.contains(">m:5.0<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 4" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.int64(0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.int64(2)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:0<").count() - 1, 1)
  assert_eq(svg.split(">m:2:1<").count() - 1, 1)
  assert_eq(svg.split(">m:3:2<").count() - 1, 1)
  assert_eq(svg.split(">m:4:3<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.int64(-1)<"))
  assert_true(!svg.contains(">M:np.int64(4)<"))
  assert_true(!svg.contains(">m:0:−2<"))
  assert_true(!svg.contains(">m:5:5<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 5" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.int64(0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.int64(2)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:1<").count() - 1, 1)
  assert_eq(svg.split(">m:2:3<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.int64(-1)<"))
  assert_true(!svg.contains(">M:np.int64(4)<"))
  assert_true(!svg.contains(">m:0:−2<"))
  assert_true(!svg.contains(">m:3:5<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 6" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.int64(0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.int64(2)<").count() - 1, 1)
  assert_eq(svg.split(">m:0<").count() - 1, 1)
  assert_eq(svg.split(">m:1<").count() - 1, 1)
  assert_eq(svg.split(">m:2<").count() - 1, 1)
  assert_eq(svg.split(">m:3<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.int64(−1)<"))
  assert_true(!svg.contains(">M:3:np.int64(4)<"))
  assert_true(!svg.contains(">m:-2<"))
  assert_true(!svg.contains(">m:5<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 7" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.int64(0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.int64(2)<").count() - 1, 1)
  assert_eq(svg.split(">m:1<").count() - 1, 1)
  assert_eq(svg.split(">m:3<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.int64(−1)<"))
  assert_true(!svg.contains(">M:3:np.int64(4)<"))
  assert_true(!svg.contains(">m:-2<"))
  assert_true(!svg.contains(">m:5<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 8" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.float64(0.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.float64(2.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:0.00<").count() - 1, 1)
  assert_eq(svg.split(">m:2:1.00<").count() - 1, 1)
  assert_eq(svg.split(">m:3:2.00<").count() - 1, 1)
  assert_eq(svg.split(">m:4:3.00<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.float64(-1.0)<"))
  assert_true(!svg.contains(">M:np.float64(4.0)<"))
  assert_true(!svg.contains(">m:0:−2.00<"))
  assert_true(!svg.contains(">m:5:5.00<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 9" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.float64(0.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.float64(2.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:1.00<").count() - 1, 1)
  assert_eq(svg.split(">m:2:3.00<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.float64(-1.0)<"))
  assert_true(!svg.contains(">M:np.float64(4.0)<"))
  assert_true(!svg.contains(">m:0:−2.00<"))
  assert_true(!svg.contains(">m:3:5.00<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 10" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.float64(0.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.float64(2.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:0.0<").count() - 1, 1)
  assert_eq(svg.split(">m:1.0<").count() - 1, 1)
  assert_eq(svg.split(">m:2.0<").count() - 1, 1)
  assert_eq(svg.split(">m:3.0<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.float64(−1.0)<"))
  assert_true(!svg.contains(">M:3:np.float64(4.0)<"))
  assert_true(!svg.contains(">m:-2.0<"))
  assert_true(!svg.contains(">m:5.0<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 11" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([
    -2.0, 0.0, 1.0, 2.0, 3.0, 5.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.float64(0.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.float64(2.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1.0<").count() - 1, 1)
  assert_eq(svg.split(">m:3.0<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.float64(−1.0)<"))
  assert_true(!svg.contains(">M:3:np.float64(4.0)<"))
  assert_true(!svg.contains(">m:-2.0<"))
  assert_true(!svg.contains(">m:5.0<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 12" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.int64(0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.int64(2)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:0<").count() - 1, 1)
  assert_eq(svg.split(">m:2:1<").count() - 1, 1)
  assert_eq(svg.split(">m:3:2<").count() - 1, 1)
  assert_eq(svg.split(">m:4:3<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.int64(-1)<"))
  assert_true(!svg.contains(">M:np.int64(4)<"))
  assert_true(!svg.contains(">m:0:−2<"))
  assert_true(!svg.contains(">m:5:5<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 13" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.int64(0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.int64(2)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:1<").count() - 1, 1)
  assert_eq(svg.split(">m:2:3<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.int64(-1)<"))
  assert_true(!svg.contains(">M:np.int64(4)<"))
  assert_true(!svg.contains(">m:0:−2<"))
  assert_true(!svg.contains(">m:3:5<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 14" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.int64(0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.int64(2)<").count() - 1, 1)
  assert_eq(svg.split(">m:0<").count() - 1, 1)
  assert_eq(svg.split(">m:1<").count() - 1, 1)
  assert_eq(svg.split(">m:2<").count() - 1, 1)
  assert_eq(svg.split(">m:3<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.int64(−1)<"))
  assert_true(!svg.contains(">M:3:np.int64(4)<"))
  assert_true(!svg.contains(">m:-2<"))
  assert_true(!svg.contains(">m:5<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 15" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([-1L, 0L, 2L, 4L])
  let minor_view = @ticker.TickValues::from_int64_array([
    -2L, 0L, 1L, 2L, 3L, 5L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.int64(0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.int64(2)<").count() - 1, 1)
  assert_eq(svg.split(">m:1<").count() - 1, 1)
  assert_eq(svg.split(">m:3<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.int64(−1)<"))
  assert_true(!svg.contains(">M:3:np.int64(4)<"))
  assert_true(!svg.contains(">m:-2<"))
  assert_true(!svg.contains(">m:5<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 16" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([
    1.0, 5.0, 7.0, 9.0, 11.0, 15.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.float64(5.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.float64(9.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:5.00<").count() - 1, 1)
  assert_eq(svg.split(">m:2:7.00<").count() - 1, 1)
  assert_eq(svg.split(">m:3:9.00<").count() - 1, 1)
  assert_eq(svg.split(">m:4:11.00<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.float64(13.0)<"))
  assert_true(!svg.contains(">M:np.float64(3.0)<"))
  assert_true(!svg.contains(">m:0:1.00<"))
  assert_true(!svg.contains(">m:5:15.00<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 17" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([
    1.0, 5.0, 7.0, 9.0, 11.0, 15.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.float64(5.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.float64(9.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:7.00<").count() - 1, 1)
  assert_eq(svg.split(">m:2:11.00<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.float64(13.0)<"))
  assert_true(!svg.contains(">M:np.float64(3.0)<"))
  assert_true(!svg.contains(">m:0:1.00<"))
  assert_true(!svg.contains(">m:3:15.00<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 18" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([
    1.0, 5.0, 7.0, 9.0, 11.0, 15.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.float64(5.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.float64(9.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:11.0<").count() - 1, 1)
  assert_eq(svg.split(">m:5.0<").count() - 1, 1)
  assert_eq(svg.split(">m:7.0<").count() - 1, 1)
  assert_eq(svg.split(">m:9.0<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.float64(3.0)<"))
  assert_true(!svg.contains(">M:3:np.float64(13.0)<"))
  assert_true(!svg.contains(">m:1.0<"))
  assert_true(!svg.contains(">m:15.0<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 19" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([
    1.0, 5.0, 7.0, 9.0, 11.0, 15.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.float64(5.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.float64(9.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:11.0<").count() - 1, 1)
  assert_eq(svg.split(">m:7.0<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.float64(3.0)<"))
  assert_true(!svg.contains(">M:3:np.float64(13.0)<"))
  assert_true(!svg.contains(">m:1.0<"))
  assert_true(!svg.contains(">m:15.0<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 20" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([3L, 5L, 9L, 13L])
  let minor_view = @ticker.TickValues::from_int64_array([
    1L, 5L, 7L, 9L, 11L, 15L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.int64(5)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.int64(9)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:5<").count() - 1, 1)
  assert_eq(svg.split(">m:2:7<").count() - 1, 1)
  assert_eq(svg.split(">m:3:9<").count() - 1, 1)
  assert_eq(svg.split(">m:4:11<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.int64(13)<"))
  assert_true(!svg.contains(">M:np.int64(3)<"))
  assert_true(!svg.contains(">m:0:1<"))
  assert_true(!svg.contains(">m:5:15<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 21" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([3L, 5L, 9L, 13L])
  let minor_view = @ticker.TickValues::from_int64_array([
    1L, 5L, 7L, 9L, 11L, 15L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.int64(5)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.int64(9)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:7<").count() - 1, 1)
  assert_eq(svg.split(">m:2:11<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.int64(13)<"))
  assert_true(!svg.contains(">M:np.int64(3)<"))
  assert_true(!svg.contains(">m:0:1<"))
  assert_true(!svg.contains(">m:3:15<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 22" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([3L, 5L, 9L, 13L])
  let minor_view = @ticker.TickValues::from_int64_array([
    1L, 5L, 7L, 9L, 11L, 15L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.int64(5)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.int64(9)<").count() - 1, 1)
  assert_eq(svg.split(">m:11<").count() - 1, 1)
  assert_eq(svg.split(">m:5<").count() - 1, 1)
  assert_eq(svg.split(">m:7<").count() - 1, 1)
  assert_eq(svg.split(">m:9<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.int64(3)<"))
  assert_true(!svg.contains(">M:3:np.int64(13)<"))
  assert_true(!svg.contains(">m:1<"))
  assert_true(!svg.contains(">m:15<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 23" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([3L, 5L, 9L, 13L])
  let minor_view = @ticker.TickValues::from_int64_array([
    1L, 5L, 7L, 9L, 11L, 15L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.int64(5)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.int64(9)<").count() - 1, 1)
  assert_eq(svg.split(">m:11<").count() - 1, 1)
  assert_eq(svg.split(">m:7<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.int64(3)<"))
  assert_true(!svg.contains(">M:3:np.int64(13)<"))
  assert_true(!svg.contains(">m:1<"))
  assert_true(!svg.contains(">m:15<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 24" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([
    1.0, 5.0, 7.0, 9.0, 11.0, 15.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.float64(5.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.float64(9.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:5.00<").count() - 1, 1)
  assert_eq(svg.split(">m:2:7.00<").count() - 1, 1)
  assert_eq(svg.split(">m:3:9.00<").count() - 1, 1)
  assert_eq(svg.split(">m:4:11.00<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.float64(13.0)<"))
  assert_true(!svg.contains(">M:np.float64(3.0)<"))
  assert_true(!svg.contains(">m:0:1.00<"))
  assert_true(!svg.contains(">m:5:15.00<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 25" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:.2f}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([
    1.0, 5.0, 7.0, 9.0, 11.0, 15.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.float64(5.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.float64(9.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:7.00<").count() - 1, 1)
  assert_eq(svg.split(">m:2:11.00<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.float64(13.0)<"))
  assert_true(!svg.contains(">M:np.float64(3.0)<"))
  assert_true(!svg.contains(">m:0:1.00<"))
  assert_true(!svg.contains(">m:3:15.00<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 26" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([
    1.0, 5.0, 7.0, 9.0, 11.0, 15.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.float64(5.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.float64(9.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:11.0<").count() - 1, 1)
  assert_eq(svg.split(">m:5.0<").count() - 1, 1)
  assert_eq(svg.split(">m:7.0<").count() - 1, 1)
  assert_eq(svg.split(">m:9.0<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.float64(3.0)<"))
  assert_true(!svg.contains(">M:3:np.float64(13.0)<"))
  assert_true(!svg.contains(">m:1.0<"))
  assert_true(!svg.contains(">m:15.0<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 27" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([
    1.0, 5.0, 7.0, 9.0, 11.0, 15.0,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.float64(5.0)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.float64(9.0)<").count() - 1, 1)
  assert_eq(svg.split(">m:11.0<").count() - 1, 1)
  assert_eq(svg.split(">m:7.0<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.float64(3.0)<"))
  assert_true(!svg.contains(">M:3:np.float64(13.0)<"))
  assert_true(!svg.contains(">m:1.0<"))
  assert_true(!svg.contains(">m:15.0<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 28" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([3L, 5L, 9L, 13L])
  let minor_view = @ticker.TickValues::from_int64_array([
    1L, 5L, 7L, 9L, 11L, 15L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.int64(5)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.int64(9)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:5<").count() - 1, 1)
  assert_eq(svg.split(">m:2:7<").count() - 1, 1)
  assert_eq(svg.split(">m:3:9<").count() - 1, 1)
  assert_eq(svg.split(">m:4:11<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.int64(13)<"))
  assert_true(!svg.contains(">M:np.int64(3)<"))
  assert_true(!svg.contains(">m:0:1<"))
  assert_true(!svg.contains(">m:5:15<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 29" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("M:%r").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("m:{pos}:{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([3L, 5L, 9L, 13L])
  let minor_view = @ticker.TickValues::from_int64_array([
    1L, 5L, 7L, 9L, 11L, 15L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:np.int64(5)<").count() - 1, 1)
  assert_eq(svg.split(">M:np.int64(9)<").count() - 1, 1)
  assert_eq(svg.split(">m:1:7<").count() - 1, 1)
  assert_eq(svg.split(">m:2:11<").count() - 1, 1)
  assert_true(!svg.contains(">M:np.int64(13)<"))
  assert_true(!svg.contains(">M:np.int64(3)<"))
  assert_true(!svg.contains(">m:0:1<"))
  assert_true(!svg.contains(">m:3:15<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 30" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([3L, 5L, 9L, 13L])
  let minor_view = @ticker.TickValues::from_int64_array([
    1L, 5L, 7L, 9L, 11L, 15L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(false)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.int64(5)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.int64(9)<").count() - 1, 1)
  assert_eq(svg.split(">m:11<").count() - 1, 1)
  assert_eq(svg.split(">m:5<").count() - 1, 1)
  assert_eq(svg.split(">m:7<").count() - 1, 1)
  assert_eq(svg.split(">m:9<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.int64(3)<"))
  assert_true(!svg.contains(">M:3:np.int64(13)<"))
  assert_true(!svg.contains(">m:1<"))
  assert_true(!svg.contains(">m:15<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 6)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 31" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("M:{pos}:{x!r}").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("m:%s").as_base_formatter()
  let major_view = @ticker.TickValues::from_int64_array([3L, 5L, 9L, 13L])
  let minor_view = @ticker.TickValues::from_int64_array([
    1L, 5L, 7L, 9L, 11L, 15L,
  ])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">M:1:np.int64(5)<").count() - 1, 1)
  assert_eq(svg.split(">M:2:np.int64(9)<").count() - 1, 1)
  assert_eq(svg.split(">m:11<").count() - 1, 1)
  assert_eq(svg.split(">m:7<").count() - 1, 1)
  assert_true(!svg.contains(">M:0:np.int64(3)<"))
  assert_true(!svg.contains(">M:3:np.int64(13)<"))
  assert_true(!svg.contains(">m:1<"))
  assert_true(!svg.contains(">m:15<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 32" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.FormatStrFormatter::new("%x").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("%g").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([-2.0, 1.0, 3.0, 5.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("TypeError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 33" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.StrMethodFormatter::new("{x:d}").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("{x}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([-2.0, 1.0, 3.0, 5.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 34" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.FormatStrFormatter::new("%g").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("%x").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([-2.0, 1.0, 3.0, 5.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("TypeError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 35" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  let major = @ticker.StrMethodFormatter::new("{x}").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([-2.0, 1.0, 3.0, 5.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 36" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.FormatStrFormatter::new("%x").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("%g").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([-2.0, 1.0, 3.0, 5.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("TypeError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 37" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.StrMethodFormatter::new("{x:d}").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("{x}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([-2.0, 1.0, 3.0, 5.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 38" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.FormatStrFormatter::new("%g").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("%x").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([-2.0, 1.0, 3.0, 5.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("TypeError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 39" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  let major = @ticker.StrMethodFormatter::new("{x}").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([-1.0, 0.0, 2.0, 4.0])
  let minor_view = @ticker.TickValues::from_array([-2.0, 1.0, 3.0, 5.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 40" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("%x").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("%g").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([1.0, 7.0, 11.0, 15.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("TypeError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 41" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("{x:d}").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("{x}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([1.0, 7.0, 11.0, 15.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 42" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("%g").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("%x").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([1.0, 7.0, 11.0, 15.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("TypeError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 43" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_xaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("{x}").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([1.0, 7.0, 11.0, 15.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 44" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("%x").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("%g").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([1.0, 7.0, 11.0, 15.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("TypeError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 45" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("{x:d}").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("{x}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([1.0, 7.0, 11.0, 15.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 0)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 46" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.FormatStrFormatter::new("%g").as_base_formatter()
  let minor = @ticker.FormatStrFormatter::new("%x").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([1.0, 7.0, 11.0, 15.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("TypeError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}

///|
test "string Formatter original public SVG 47" {
  @config.set_unicode_minus(true)
  defer @config.set_unicode_minus(true)
  let figure = @scene.figure(width=300, height=160)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 3.0)
  axes.set_y_limits(0.0, 3.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.secondary_yaxis(value => value * 2.0 + 5.0, value => {
    (value - 5.0) / 2.0
  })
  let major = @ticker.StrMethodFormatter::new("{x}").as_base_formatter()
  let minor = @ticker.StrMethodFormatter::new("{x:d}").as_base_formatter()
  let major_view = @ticker.TickValues::from_array([3.0, 5.0, 9.0, 13.0])
  let minor_view = @ticker.TickValues::from_array([1.0, 7.0, 11.0, 15.0])
  axis.set_locator(@ticker.FixedLocator::from_view(major_view).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::from_view(minor_view).as_minor_locator(),
  )
  axis.set_minor_overlap_removal(true)
  axis.set_named_formatter(major)
  axis.set_minor_named_formatter(minor)
  assert_true(
    try {
      ignore(figure.to_svg_checked())
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  assert_eq(major.locations().length(), 4)
  assert_eq(minor.locations().length(), 4)
  assert_eq(major.axis(), Some(axis.formatter_axis_binding()))
  assert_eq(major.get_offset(), "")
}
