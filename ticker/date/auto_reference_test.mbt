// Generated from pinned AutoDateFormatter by generate_auto_date_reference.py.

///|
test "automatic date reference 365.0 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(365.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["2024", "2024"])
  assert_eq(formatter.format_value(values[0]), "2024")
  assert_eq(formatter.as_formatter().format_values(values), ["2024", "2024"])
}

///|
test "automatic date reference 365.0 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(365.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{2024}$", "$\\mathdefault{2024}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{2024}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{2024}$", "$\\mathdefault{2024}$",
  ])
}

///|
test "automatic date reference 365.0 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(365.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["INFINITE 2024", "INFINITE 2024"])
  assert_eq(formatter.format_value(values[0]), "INFINITE 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "INFINITE 2024", "INFINITE 2024",
  ])
}

///|
test "automatic date reference 365.0 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(365.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 30.0 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(30.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["2024-05", "2024-05"])
  assert_eq(formatter.format_value(values[0]), "2024-05")
  assert_eq(formatter.as_formatter().format_values(values), [
    "2024-05", "2024-05",
  ])
}

///|
test "automatic date reference 30.0 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(30.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{2024{-}05}$", "$\\mathdefault{2024{-}05}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{2024{-}05}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{2024{-}05}$", "$\\mathdefault{2024{-}05}$",
  ])
}

///|
test "automatic date reference 30.0 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(30.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["MONTH 2024-05", "MONTH 2024-05"])
  assert_eq(formatter.format_value(values[0]), "MONTH 2024-05")
  assert_eq(formatter.as_formatter().format_values(values), [
    "MONTH 2024-05", "MONTH 2024-05",
  ])
}

///|
test "automatic date reference 30.0 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(30.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 7.0 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(7.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["2024-05", "2024-05"])
  assert_eq(formatter.format_value(values[0]), "2024-05")
  assert_eq(formatter.as_formatter().format_values(values), [
    "2024-05", "2024-05",
  ])
}

///|
test "automatic date reference 7.0 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(7.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{2024{-}05}$", "$\\mathdefault{2024{-}05}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{2024{-}05}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{2024{-}05}$", "$\\mathdefault{2024{-}05}$",
  ])
}

///|
test "automatic date reference 7.0 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(7.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["MONTH 2024-05", "MONTH 2024-05"])
  assert_eq(formatter.format_value(values[0]), "MONTH 2024-05")
  assert_eq(formatter.as_formatter().format_values(values), [
    "MONTH 2024-05", "MONTH 2024-05",
  ])
}

///|
test "automatic date reference 7.0 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(7.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 1.0 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(1.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["2024-05-06", "2024-05-06"])
  assert_eq(formatter.format_value(values[0]), "2024-05-06")
  assert_eq(formatter.as_formatter().format_values(values), [
    "2024-05-06", "2024-05-06",
  ])
}

///|
test "automatic date reference 1.0 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(1.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{2024{-}05{-}06}$", "$\\mathdefault{2024{-}05{-}06}$",
  ])
  assert_eq(
    formatter.format_value(values[0]),
    "$\\mathdefault{2024{-}05{-}06}$",
  )
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{2024{-}05{-}06}$", "$\\mathdefault{2024{-}05{-}06}$",
  ])
}

///|
test "automatic date reference 1.0 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(1.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["REPLACED 06", "REPLACED 06"])
  assert_eq(formatter.format_value(values[0]), "REPLACED 06")
  assert_eq(formatter.as_formatter().format_values(values), [
    "REPLACED 06", "REPLACED 06",
  ])
}

///|
test "automatic date reference 1.0 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(1.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 0.041666666666666664 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(0.041666666666666664)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["05-06 12", "05-06 13"])
  assert_eq(formatter.format_value(values[0]), "05-06 12")
  assert_eq(formatter.as_formatter().format_values(values), [
    "05-06 12", "05-06 13",
  ])
}

///|
test "automatic date reference 0.041666666666666664 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(0.041666666666666664)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{05{-}06\\;12}$", "$\\mathdefault{05{-}06\\;13}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{05{-}06\\;12}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{05{-}06\\;12}$", "$\\mathdefault{05{-}06\\;13}$",
  ])
}

///|
test "automatic date reference 0.041666666666666664 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.041666666666666664)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["SHORT 12:34", "SHORT 13:34"])
  assert_eq(formatter.format_value(values[0]), "SHORT 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "SHORT 12:34", "SHORT 13:34",
  ])
}

///|
test "automatic date reference 0.041666666666666664 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.041666666666666664)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 0.0006944444444444445 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(0.0006944444444444445)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["06 12:34", "06 13:34"])
  assert_eq(formatter.format_value(values[0]), "06 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "06 12:34", "06 13:34",
  ])
}

///|
test "automatic date reference 0.0006944444444444445 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(0.0006944444444444445)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{06\\;12{:}34}$", "$\\mathdefault{06\\;13{:}34}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{06\\;12{:}34}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{06\\;12{:}34}$", "$\\mathdefault{06\\;13{:}34}$",
  ])
}

///|
test "automatic date reference 0.0006944444444444445 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0006944444444444445)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["SHORT 12:34", "SHORT 13:34"])
  assert_eq(formatter.format_value(values[0]), "SHORT 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "SHORT 12:34", "SHORT 13:34",
  ])
}

///|
test "automatic date reference 0.0006944444444444445 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0006944444444444445)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 1.1574074074074073e-05 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(1.1574074074074073e-05)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["12:34:56", "13:34:56"])
  assert_eq(formatter.format_value(values[0]), "12:34:56")
  assert_eq(formatter.as_formatter().format_values(values), [
    "12:34:56", "13:34:56",
  ])
}

///|
test "automatic date reference 1.1574074074074073e-05 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(1.1574074074074073e-05)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{12{:}34{:}56}$", "$\\mathdefault{13{:}34{:}56}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{12{:}34{:}56}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{12{:}34{:}56}$", "$\\mathdefault{13{:}34{:}56}$",
  ])
}

///|
test "automatic date reference 1.1574074074074073e-05 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(1.1574074074074073e-05)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["SHORT 12:34", "SHORT 13:34"])
  assert_eq(formatter.format_value(values[0]), "SHORT 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "SHORT 12:34", "SHORT 13:34",
  ])
}

///|
test "automatic date reference 1.1574074074074073e-05 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(1.1574074074074073e-05)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 1.1574074074074074e-11 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(1.1574074074074074e-11)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["34:56.123456", "34:56.123456"])
  assert_eq(formatter.format_value(values[0]), "34:56.123456")
  assert_eq(formatter.as_formatter().format_values(values), [
    "34:56.123456", "34:56.123456",
  ])
}

///|
test "automatic date reference 1.1574074074074074e-11 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(1.1574074074074074e-11)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{34{:}56.123456}$", "$\\mathdefault{34{:}56.123456}$",
  ])
  assert_eq(
    formatter.format_value(values[0]),
    "$\\mathdefault{34{:}56.123456}$",
  )
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{34{:}56.123456}$", "$\\mathdefault{34{:}56.123456}$",
  ])
}

///|
test "automatic date reference 1.1574074074074074e-11 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(1.1574074074074074e-11)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["SHORT 12:34", "SHORT 13:34"])
  assert_eq(formatter.format_value(values[0]), "SHORT 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "SHORT 12:34", "SHORT 13:34",
  ])
}

///|
test "automatic date reference 1.1574074074074074e-11 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(1.1574074074074074e-11)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 400.0 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(400.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 400.0 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(400.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "fallback$\\mathdefault{\\;2024}$", "fallback$\\mathdefault{\\;2024}$",
  ])
  assert_eq(
    formatter.format_value(values[0]),
    "fallback$\\mathdefault{\\;2024}$",
  )
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback$\\mathdefault{\\;2024}$", "fallback$\\mathdefault{\\;2024}$",
  ])
}

///|
test "automatic date reference 400.0 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(400.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["INFINITE 2024", "INFINITE 2024"])
  assert_eq(formatter.format_value(values[0]), "INFINITE 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "INFINITE 2024", "INFINITE 2024",
  ])
}

///|
test "automatic date reference 400.0 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(400.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference -11.0 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(-11.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["34:56.123456", "34:56.123456"])
  assert_eq(formatter.format_value(values[0]), "34:56.123456")
  assert_eq(formatter.as_formatter().format_values(values), [
    "34:56.123456", "34:56.123456",
  ])
}

///|
test "automatic date reference -11.0 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(-11.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{34{:}56.123456}$", "$\\mathdefault{34{:}56.123456}$",
  ])
  assert_eq(
    formatter.format_value(values[0]),
    "$\\mathdefault{34{:}56.123456}$",
  )
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{34{:}56.123456}$", "$\\mathdefault{34{:}56.123456}$",
  ])
}

///|
test "automatic date reference -11.0 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(-11.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["NEG 12", "NEG 13"])
  assert_eq(formatter.format_value(values[0]), "NEG 12")
  assert_eq(formatter.as_formatter().format_values(values), ["NEG 12", "NEG 13"])
}

///|
test "automatic date reference -11.0 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(-11.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 0.0 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(0.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["34:56.123456", "34:56.123456"])
  assert_eq(formatter.format_value(values[0]), "34:56.123456")
  assert_eq(formatter.as_formatter().format_values(values), [
    "34:56.123456", "34:56.123456",
  ])
}

///|
test "automatic date reference 0.0 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(0.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{34{:}56.123456}$", "$\\mathdefault{34{:}56.123456}$",
  ])
  assert_eq(
    formatter.format_value(values[0]),
    "$\\mathdefault{34{:}56.123456}$",
  )
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{34{:}56.123456}$", "$\\mathdefault{34{:}56.123456}$",
  ])
}

///|
test "automatic date reference 0.0 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["ZERO 12:34", "ZERO 13:34"])
  assert_eq(formatter.format_value(values[0]), "ZERO 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "ZERO 12:34", "ZERO 13:34",
  ])
}

///|
test "automatic date reference 0.0 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 2.3148148148148147e-11 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(2.3148148148148147e-11)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["12:34:56", "13:34:56"])
  assert_eq(formatter.format_value(values[0]), "12:34:56")
  assert_eq(formatter.as_formatter().format_values(values), [
    "12:34:56", "13:34:56",
  ])
}

///|
test "automatic date reference 2.3148148148148147e-11 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(2.3148148148148147e-11)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{12{:}34{:}56}$", "$\\mathdefault{13{:}34{:}56}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{12{:}34{:}56}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{12{:}34{:}56}$", "$\\mathdefault{13{:}34{:}56}$",
  ])
}

///|
test "automatic date reference 2.3148148148148147e-11 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(2.3148148148148147e-11)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["SHORT 12:34", "SHORT 13:34"])
  assert_eq(formatter.format_value(values[0]), "SHORT 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "SHORT 12:34", "SHORT 13:34",
  ])
}

///|
test "automatic date reference 2.3148148148148147e-11 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(2.3148148148148147e-11)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 0.0006944444444444446 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(0.0006944444444444446)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["05-06 12", "05-06 13"])
  assert_eq(formatter.format_value(values[0]), "05-06 12")
  assert_eq(formatter.as_formatter().format_values(values), [
    "05-06 12", "05-06 13",
  ])
}

///|
test "automatic date reference 0.0006944444444444446 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(0.0006944444444444446)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{05{-}06\\;12}$", "$\\mathdefault{05{-}06\\;13}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{05{-}06\\;12}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{05{-}06\\;12}$", "$\\mathdefault{05{-}06\\;13}$",
  ])
}

///|
test "automatic date reference 0.0006944444444444446 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0006944444444444446)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["SHORT 12:34", "SHORT 13:34"])
  assert_eq(formatter.format_value(values[0]), "SHORT 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "SHORT 12:34", "SHORT 13:34",
  ])
}

///|
test "automatic date reference 0.0006944444444444446 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0006944444444444446)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference 0.0006944444444444444 / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(0.0006944444444444444)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["06 12:34", "06 13:34"])
  assert_eq(formatter.format_value(values[0]), "06 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "06 12:34", "06 13:34",
  ])
}

///|
test "automatic date reference 0.0006944444444444444 / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(0.0006944444444444444)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "$\\mathdefault{06\\;12{:}34}$", "$\\mathdefault{06\\;13{:}34}$",
  ])
  assert_eq(formatter.format_value(values[0]), "$\\mathdefault{06\\;12{:}34}$")
  assert_eq(formatter.as_formatter().format_values(values), [
    "$\\mathdefault{06\\;12{:}34}$", "$\\mathdefault{06\\;13{:}34}$",
  ])
}

///|
test "automatic date reference 0.0006944444444444444 / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0006944444444444444)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["SHORT 12:34", "SHORT 13:34"])
  assert_eq(formatter.format_value(values[0]), "SHORT 12:34")
  assert_eq(formatter.as_formatter().format_values(values), [
    "SHORT 12:34", "SHORT 13:34",
  ])
}

///|
test "automatic date reference 0.0006944444444444444 / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0006944444444444444)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference inf / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(1.0 / 0.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference inf / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(1.0 / 0.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "fallback$\\mathdefault{\\;2024}$", "fallback$\\mathdefault{\\;2024}$",
  ])
  assert_eq(
    formatter.format_value(values[0]),
    "fallback$\\mathdefault{\\;2024}$",
  )
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback$\\mathdefault{\\;2024}$", "fallback$\\mathdefault{\\;2024}$",
  ])
}

///|
test "automatic date reference inf / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(1.0 / 0.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["INFINITE 2024", "INFINITE 2024"])
  assert_eq(formatter.format_value(values[0]), "INFINITE 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "INFINITE 2024", "INFINITE 2024",
  ])
}

///|
test "automatic date reference inf / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(1.0 / 0.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference nan / default" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=false,
  ).with_locator_unit(0.0 / 0.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference nan / tex" {
  let formatter = @date.AutoDateFormatter::new(
    default_format="fallback %Y",
    usetex=true,
  ).with_locator_unit(0.0 / 0.0)
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), [
    "fallback$\\mathdefault{\\;2024}$", "fallback$\\mathdefault{\\;2024}$",
  ])
  assert_eq(
    formatter.format_value(values[0]),
    "fallback$\\mathdefault{\\;2024}$",
  )
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback$\\mathdefault{\\;2024}$", "fallback$\\mathdefault{\\;2024}$",
  ])
}

///|
test "automatic date reference nan / scaled" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0 / 0.0)
    .with_scaled([
      (0.0, @date.Text("ZERO %H:%M")),
      (0.1, @date.Text("SHORT %H:%M")),
      (30.0, @date.Text("MONTH %Y-%m")),
      (1.0, @date.Text("DAY %Y-%m-%d")),
      (1.0, @date.Text("REPLACED %d")),
      (-10.0, @date.Text("NEG %H")),
      (1.0 / 0.0, @date.Text("INFINITE %Y")),
    ])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference nan / empty" {
  let formatter = @date.AutoDateFormatter::new(
      default_format="fallback %Y",
      usetex=false,
    )
    .with_locator_unit(0.0 / 0.0)
    .with_scaled([])
  let values = [19849.524260688147, 19849.565927354815]
  assert_eq(formatter.format_ticks(values), ["fallback 2024", "fallback 2024"])
  assert_eq(formatter.format_value(values[0]), "fallback 2024")
  assert_eq(formatter.as_formatter().format_values(values), [
    "fallback 2024", "fallback 2024",
  ])
}

///|
test "automatic date reference missing unit fallback" {
  assert_eq(
    @date.AutoDateFormatter::new().format_value(19849.524260688147),
    "2024-05-06",
  )
}

///|
test "automatic date reference recurrence base units exclude interval" {
  assert_eq(@date.rrule_locator(@date.Yearly, interval=17).unit_scale(), 365.0)
  assert_eq(@date.rrule_locator(@date.Monthly, interval=17).unit_scale(), 30.0)
  assert_eq(@date.rrule_locator(@date.Weekly, interval=17).unit_scale(), 7.0)
  assert_eq(@date.rrule_locator(@date.Daily, interval=17).unit_scale(), 1.0)
  assert_eq(
    @date.rrule_locator(@date.Hourly, interval=17).unit_scale(),
    0.041666666666666664,
  )
  assert_eq(
    @date.rrule_locator(@date.Minutely, interval=17).unit_scale(),
    0.0006944444444444445,
  )
  assert_eq(
    @date.rrule_locator(@date.Secondly, interval=17).unit_scale(),
    1.1574074074074073e-05,
  )
}

///|
test "automatic date reference scalar callable original input and position" {
  let formatter = @date.AutoDateFormatter::new(usetex=true)
    .with_locator_unit(-11.0)
    .with_scale(
      -10.0,
      @date.Func(fn(value, pos) {
        "v:" +
        pos.map(index => index.to_string()).unwrap_or("none") +
        ":" +
        (try! @date.date_formatter("%H:%M", tz="UTC")).format_value(value)
      }),
    )
    .with_offset(180)
  assert_eq(formatter.format_ticks([19849.524260688147, 19849.565927354815]), [
    "v:0:12:34", "v:1:13:34",
  ])
  assert_eq(formatter.format_value(19849.524260688147), "v:none:12:34")
}

///|
test "automatic date reference original datetime array callable" {
  let formatter = @date.AutoDateFormatter::new()
    .with_locator_unit(-11.0)
    .with_scale(
      -10.0,
      @date.DatesFunc(fn(dates, _) {
        dates.map(value => @date.format_date(value, "%d-%m//%Y"))
      }),
    )
  assert_eq(
    formatter.format_dates([@date.datetime(2014, 12, 25, offset_minutes=1380)]),
    ["25-12//2014"],
  )
}

///|
test "automatic date reference numeric array callable" {
  let formatter = @date.AutoDateFormatter::new()
    .with_locator_unit(-11.0)
    .with_scale(
      -10.0,
      @date.ValuesFunc(fn(values, pos) {
        values.map(value => (value.to_int() + pos.unwrap()).to_string())
      }),
    )
  assert_eq(formatter.format_array([2.0, 3.0], pos=7), ["9", "10"])
}
