///|
test "date formatting keeps escaped unknown and incomplete directives literal" {
  let value = @date.datetime(2021, 1, 1, hour=13)
  assert_eq(
    @date.format_date(value, "%%G %G %%I %I %%p %p %Q %g %"),
    "%G 2020 %I 01 %p PM %Q %g %",
  )
  assert_eq(@date.format_date(value, "日%j 周%V %u"), "日001 周53 5")
  assert_eq(@date.format_date(value, ""), "")
}
