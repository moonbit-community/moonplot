///|
test "numeric formatters cover fixed, printf, null, and logarithmic labels" {
  let fixed = @ticker.fixed_formatter(["low", "high"])
  assert_eq(fixed.format_values([0.0, 1.0, 2.0]), ["low", "high", ""])

  let printf = @ticker.format_str_formatter("value=%.2f")
  assert_eq(printf.format_value(1.234), "value=1.23")
  assert_eq(@ticker.format_str_formatter("%% %g").format_value(2.5), "% 2.5")
  assert_eq(@ticker.format_str_formatter("%1.2f").format_value(1.234), "1.23")
  assert_eq(@ticker.format_str_formatter("%0.2f").format_value(1.234), "1.23")
  assert_eq(@ticker.format_str_formatter("%.2f").format_value(-1.234), "-1.23")
  assert_eq(
    @ticker.format_str_formatter("%+07.2f").format_value(1.2),
    "+001.20",
  )
  assert_eq(
    @ticker.format_str_formatter("%+07.2f").format_value(-1.2),
    "-001.20",
  )
  assert_eq(@ticker.format_str_formatter("%-7.2f").format_value(1.2), "1.20   ")
  assert_eq(@ticker.format_str_formatter("%.2e").format_value(12.3), "1.23e+01")
  assert_eq(
    @ticker.format_str_formatter("%.2e").format_value(-12.3),
    "-1.23e+01",
  )
  assert_eq(
    @ticker.format_str_formatter("%-12.2e").format_value(-12.3),
    "-1.23e+01   ",
  )
  assert_eq(@ticker.format_str_formatter("%.3g").format_value(12.34), "12.3")
  assert_eq(@ticker.format_str_formatter("%d").format_value(-12.9), "-12")

  let null = @ticker.null_formatter()
  assert_eq(null.format_values([0.0, 1.0]), ["", ""])

  let log = try! @ticker.log_formatter(base=10.0, label_only_base=true)
  assert_eq(log.format_values([1.0, 10.0, 100.0, 2.0]), ["1", "10", "100", ""])
  let default_log = try! @ticker.log_formatter()
  assert_eq(default_log.format_values([1.0, 10.0, 100.0, 2.0]), [
    "1", "10", "100", "2",
  ])
  assert_eq(default_log.format_values([-10.0, 0.0]), ["10", "0"])
}

///|
test "extended formatter family covers index, str method, engineering, and percent" {
  let index = @ticker.index_formatter(["zero", "one", "two"])
  assert_eq(index.format_values([0.0, 1.0, 1.5, 3.0]), ["zero", "one", "", ""])
  let str_formatter = @ticker.str_method_formatter("{x:05d}-{pos:02d}")
  assert_eq(str_formatter.format_values([2.0, -2.0]), ["00002-00", "-0002-01"])
  let engineering = try! @ticker.eng_formatter(unit="Hz", places=2)
  assert_eq(engineering.format_value(1234.567), "1.23 kHz")
  assert_eq(engineering.format_value(0.000001), "1.00 µHz")
  let automatic_engineering = try! @ticker.eng_formatter()
  assert_eq(automatic_engineering.format_value(0.1), "100 m")
  assert_eq(automatic_engineering.format_value(999.9), "999.9")
  assert_eq(automatic_engineering.format_value(999.9999), "1 k")
  assert_eq(automatic_engineering.format_value(1.23e33), "1230 Q")
  let percent = try! @ticker.percent_formatter(xmax=1.0, decimals=1)
  assert_eq(percent.format_values([0.0, 0.125, 1.0]), [
    "0.0%", "12.5%", "100.0%",
  ])
  let automatic_percent = try! @ticker.percent_formatter(xmax=1.0)
  assert_eq(automatic_percent.format_values([0.95, 1.0]), ["95.0%", "100.0%"])
  assert_eq(
    (try! @ticker.percent_formatter(xmax=100.0)).format_values_with_range(
      [95.0],
      1.0,
    ),
    ["95.00%"],
  )
  assert_eq(automatic_percent.format_values_with_range([3.0], 6.0), ["300%"])
  assert_eq(
    (try! @ticker.percent_formatter(xmax=17.0)).format_values_with_range(
      [1.0],
      8.5,
    ),
    ["6%"],
  )
  assert_eq(
    (try! @ticker.percent_formatter(xmax=17.0)).format_values_with_range(
      [1.0],
      8.4,
    ),
    ["5.9%"],
  )
  assert_eq(
    (try! @ticker.percent_formatter(xmax=5.0)).format_values_with_range(
      [-100.0],
      1.0e-6,
    ),
    ["-2000.00000%"],
  )
}

///|
test "engineering and printf formatters preserve non-finite values" {
  let nan = Double::div(0.0, 0.0)
  let inf = Double::div(1.0, 0.0)
  let negative_inf = Double::neg(inf)
  let engineering = try! @ticker.eng_formatter(unit="V")
  assert_eq(engineering.format_values([nan, inf, negative_inf]), [
    "nan V", "inf V", "-inf V",
  ])
  let fixed = @ticker.format_str_formatter("%.2f")
  assert_eq(fixed.format_values([nan, inf, negative_inf]), [
    "nan", "inf", "-inf",
  ])
  let scientific = @ticker.format_str_formatter("%.2e")
  assert_eq(scientific.format_values([nan, inf, negative_inf]), [
    "nan", "inf", "-inf",
  ])
  let integer = @ticker.format_str_formatter("%d")
  assert_eq(integer.format_values([nan, inf, negative_inf]), ["%d", "%d", "%d"])
}

///|
test "engineering formatter promotes negative rounded mantissas" {
  let engineering = try! @ticker.eng_formatter(places=2)
  assert_eq(engineering.format_value(-999.9999), "-1.00 k")
  assert_eq(engineering.format_value(-0.001), "-1.00 m")
}

///|
test "non-decimal logarithmic formatter uses its configured base" {
  let formatter = try! @ticker.log_formatter(base=2.0, label_only_base=true)
  assert_eq(formatter.format_values([1.0, 2.0, 4.0, 3.0]), ["1", "2", "4", ""])
}

///|
test "scalar formatter accepts a fixed power and copies labels" {
  let labels = ["a", "b"]
  let formatter = @ticker.fixed_formatter(labels)
  labels[0] = "changed"
  assert_eq(formatter.format_values([0.0, 1.0]), ["a", "b"])
  let fixed_power = try! @ticker.scalar_formatter(power_min=3, power_max=3)
  assert_eq(fixed_power.format_values([1000.0, 2000.0]), ["1", "2"])
}

///|
test "scalar formatter uses an offset only when enabled" {
  let values = [1000000.0, 1000001.0, 1000002.0]
  let with_offset = try! @ticker.scalar_formatter()
  assert_true(with_offset.offset(values) != 0.0)
  assert_eq(with_offset.format_values(values), ["0", "1", "2"])
  let without_offset = try! @ticker.scalar_formatter(use_offset=false)
  assert_eq(without_offset.offset(values), 0.0)
  assert_eq(without_offset.format_values(values), [
    "1.000000", "1.000001", "1.000002",
  ])
  assert_eq(with_offset.offset([12341.0, 12349.0]), 12340.0)
  assert_eq(with_offset.offset([99999.5, 100010.5]), 100000.0)
  assert_eq(with_offset.offset([1233999.0, 1234001.0]), 1234000.0)
}
