///|
test "named string base adapters preserve live format slots and shallow copy identity" {
  let percent = @ticker.FormatStrFormatter::new("%s")
  let base = percent.as_base_formatter()
  let retained = base.format_str_formatter().unwrap()
  assert_true(physical_equal(base, retained.as_base_formatter()))
  retained.set_fmt("%")
  assert_eq(percent.fmt(), "%")
  let copied = base.copy().format_str_formatter().unwrap()
  copied.set_fmt("%r")
  assert_eq(percent.fmt(), "%")
  assert_eq(copied.fmt(), "%r")
  assert_true(!physical_equal(base, copied.as_base_formatter()))
  let method_formatter = @ticker.StrMethodFormatter::new("{x}")
  let method_base = method_formatter.as_base_formatter()
  let method_retained = method_base.str_method_formatter().unwrap()
  assert_true(physical_equal(method_base, method_retained.as_base_formatter()))
  method_retained.set_fmt("{")
  assert_eq(method_formatter.fmt(), "{")
  let method_copied = method_base.copy().str_method_formatter().unwrap()
  method_copied.set_fmt("{pos}")
  assert_eq(method_formatter.fmt(), "{")
  assert_eq(method_copied.fmt(), "{pos}")
  assert_eq(base.get_offset(), "")
  assert_eq(method_base.get_offset(), "")
}

///|
test "named checked string formatters preserve legacy convenience behavior separately" {
  let percent = @ticker.format_str_formatter("%q")
  assert_eq(percent.format_value(2.0), "%q")
  let named_percent = @ticker.FormatStrFormatter::new("%q")
  assert_true(
    try {
      ignore(named_percent.call(2.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
  let method_formatter = @ticker.str_method_formatter("{x:05d}-{pos:02d}")
  assert_eq(method_formatter.format_values([2.0]), ["00002-00"])
  let named_method = @ticker.StrMethodFormatter::new("{x:05d}-{pos:02d}")
  assert_true(
    try {
      ignore(named_method.call(2.0, pos=0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message.has_prefix("ValueError:")
      _ => false
    },
  )
}
