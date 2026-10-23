///|
test "numeric locale retains grouping and survives an rc reset" {
  let previous = @config.numeric_locale()
  defer @config.set_numeric_locale(previous)
  defer @config.reset()
  let grouping = [3, 0]
  let locale = @config.NumericLocale::new(
    decimal_point=",",
    thousands_sep="🐍",
    grouping~,
  )
  @config.set_numeric_locale(locale)
  @config.reset()
  let current = @config.numeric_locale()
  assert_eq(current.decimal_point(), ",")
  assert_eq(current.thousands_sep(), "🐍")
  assert_true(physical_equal(current.grouping(), grouping))
  grouping[0] = 2
  assert_eq(current.grouping(), [2, 0])
}
