// Generated from pinned DateFormatter and C-locale strftime.

///|
test "date format reference 0: 0001-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0001-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0001-W01-1|001|00|01|12:00:00 AM|Mon Jan  1 00:00:00 0001|01/01/01|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -719162.0,
    ),
    "0001-W01-1|001|00|01|12:00:00 AM|Mon Jan  1 00:00:00 0001|01/01/01|00:00:00",
  )
}

///|
test "date format reference 1: 0001-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0001-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0002-W01-1|365|52|53|12:00:00 AM|Mon Dec 31 00:00:00 0001|12/31/01|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -718798.0,
    ),
    "0002-W01-1|365|52|53|12:00:00 AM|Mon Dec 31 00:00:00 0001|12/31/01|00:00:00",
  )
}

///|
test "date format reference 2: 0009-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0009-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0009-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 0009|01/01/09|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -716240.0,
    ),
    "0009-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 0009|01/01/09|00:00:00",
  )
}

///|
test "date format reference 3: 0009-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0009-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0009-W53-4|365|52|52|12:00:00 AM|Thu Dec 31 00:00:00 0009|12/31/09|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -715876.0,
    ),
    "0009-W53-4|365|52|52|12:00:00 AM|Thu Dec 31 00:00:00 0009|12/31/09|00:00:00",
  )
}

///|
test "date format reference 4: 0099-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0099-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0099-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 0099|01/01/99|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -683368.0,
    ),
    "0099-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 0099|01/01/99|00:00:00",
  )
}

///|
test "date format reference 5: 0099-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0099-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0099-W53-4|365|52|52|12:00:00 AM|Thu Dec 31 00:00:00 0099|12/31/99|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -683004.0,
    ),
    "0099-W53-4|365|52|52|12:00:00 AM|Thu Dec 31 00:00:00 0099|12/31/99|00:00:00",
  )
}

///|
test "date format reference 6: 0100-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0100-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0099-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 0100|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -683003.0,
    ),
    "0099-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 0100|01/01/00|00:00:00",
  )
}

///|
test "date format reference 7: 0100-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0100-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0100-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 0100|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -682639.0,
    ),
    "0100-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 0100|12/31/00|00:00:00",
  )
}

///|
test "date format reference 8: 0400-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0400-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0399-W52-6|001|00|00|12:00:00 AM|Sat Jan  1 00:00:00 0400|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -573431.0,
    ),
    "0399-W52-6|001|00|00|12:00:00 AM|Sat Jan  1 00:00:00 0400|01/01/00|00:00:00",
  )
}

///|
test "date format reference 9: 0400-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0400-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0400-W52-7|366|53|52|12:00:00 AM|Sun Dec 31 00:00:00 0400|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -573066.0,
    ),
    "0400-W52-7|366|53|52|12:00:00 AM|Sun Dec 31 00:00:00 0400|12/31/00|00:00:00",
  )
}

///|
test "date format reference 10: 0999-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0999-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "0999-W01-2|001|00|00|12:00:00 AM|Tue Jan  1 00:00:00 0999|01/01/99|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -354650.0,
    ),
    "0999-W01-2|001|00|00|12:00:00 AM|Tue Jan  1 00:00:00 0999|01/01/99|00:00:00",
  )
}

///|
test "date format reference 11: 0999-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("0999-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1000-W01-2|365|52|52|12:00:00 AM|Tue Dec 31 00:00:00 0999|12/31/99|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -354286.0,
    ),
    "1000-W01-2|365|52|52|12:00:00 AM|Tue Dec 31 00:00:00 0999|12/31/99|00:00:00",
  )
}

///|
test "date format reference 12: 1000-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1000-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1000-W01-3|001|00|00|12:00:00 AM|Wed Jan  1 00:00:00 1000|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -354285.0,
    ),
    "1000-W01-3|001|00|00|12:00:00 AM|Wed Jan  1 00:00:00 1000|01/01/00|00:00:00",
  )
}

///|
test "date format reference 13: 1000-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1000-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1001-W01-3|365|52|52|12:00:00 AM|Wed Dec 31 00:00:00 1000|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -353921.0,
    ),
    "1001-W01-3|365|52|52|12:00:00 AM|Wed Dec 31 00:00:00 1000|12/31/00|00:00:00",
  )
}

///|
test "date format reference 14: 1582-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1582-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1581-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 1582|01/01/82|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -141714.0,
    ),
    "1581-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 1582|01/01/82|00:00:00",
  )
}

///|
test "date format reference 15: 1582-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1582-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1582-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 1582|12/31/82|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -141350.0,
    ),
    "1582-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 1582|12/31/82|00:00:00",
  )
}

///|
test "date format reference 16: 1600-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1600-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1599-W52-6|001|00|00|12:00:00 AM|Sat Jan  1 00:00:00 1600|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -135140.0,
    ),
    "1599-W52-6|001|00|00|12:00:00 AM|Sat Jan  1 00:00:00 1600|01/01/00|00:00:00",
  )
}

///|
test "date format reference 17: 1600-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1600-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1600-W52-7|366|53|52|12:00:00 AM|Sun Dec 31 00:00:00 1600|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -134775.0,
    ),
    "1600-W52-7|366|53|52|12:00:00 AM|Sun Dec 31 00:00:00 1600|12/31/00|00:00:00",
  )
}

///|
test "date format reference 18: 1700-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1700-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1699-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 1700|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -98615.0,
    ),
    "1699-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 1700|01/01/00|00:00:00",
  )
}

///|
test "date format reference 19: 1700-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1700-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1700-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 1700|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -98251.0,
    ),
    "1700-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 1700|12/31/00|00:00:00",
  )
}

///|
test "date format reference 20: 1800-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1800-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1800-W01-3|001|00|00|12:00:00 AM|Wed Jan  1 00:00:00 1800|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -62091.0,
    ),
    "1800-W01-3|001|00|00|12:00:00 AM|Wed Jan  1 00:00:00 1800|01/01/00|00:00:00",
  )
}

///|
test "date format reference 21: 1800-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1800-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1801-W01-3|365|52|52|12:00:00 AM|Wed Dec 31 00:00:00 1800|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -61727.0,
    ),
    "1801-W01-3|365|52|52|12:00:00 AM|Wed Dec 31 00:00:00 1800|12/31/00|00:00:00",
  )
}

///|
test "date format reference 22: 1900-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1900-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1900-W01-1|001|00|01|12:00:00 AM|Mon Jan  1 00:00:00 1900|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -25567.0,
    ),
    "1900-W01-1|001|00|01|12:00:00 AM|Mon Jan  1 00:00:00 1900|01/01/00|00:00:00",
  )
}

///|
test "date format reference 23: 1900-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1900-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1901-W01-1|365|52|53|12:00:00 AM|Mon Dec 31 00:00:00 1900|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      -25203.0,
    ),
    "1901-W01-1|365|52|53|12:00:00 AM|Mon Dec 31 00:00:00 1900|12/31/00|00:00:00",
  )
}

///|
test "date format reference 24: 1998-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1998-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1998-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 1998|01/01/98|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      10227.0,
    ),
    "1998-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 1998|01/01/98|00:00:00",
  )
}

///|
test "date format reference 25: 1998-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1998-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1998-W53-4|365|52|52|12:00:00 AM|Thu Dec 31 00:00:00 1998|12/31/98|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      10591.0,
    ),
    "1998-W53-4|365|52|52|12:00:00 AM|Thu Dec 31 00:00:00 1998|12/31/98|00:00:00",
  )
}

///|
test "date format reference 26: 1999-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1999-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1998-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 1999|01/01/99|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      10592.0,
    ),
    "1998-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 1999|01/01/99|00:00:00",
  )
}

///|
test "date format reference 27: 1999-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("1999-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1999-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 1999|12/31/99|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      10956.0,
    ),
    "1999-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 1999|12/31/99|00:00:00",
  )
}

///|
test "date format reference 28: 2000-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2000-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "1999-W52-6|001|00|00|12:00:00 AM|Sat Jan  1 00:00:00 2000|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      10957.0,
    ),
    "1999-W52-6|001|00|00|12:00:00 AM|Sat Jan  1 00:00:00 2000|01/01/00|00:00:00",
  )
}

///|
test "date format reference 29: 2000-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2000-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2000-W52-7|366|53|52|12:00:00 AM|Sun Dec 31 00:00:00 2000|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      11322.0,
    ),
    "2000-W52-7|366|53|52|12:00:00 AM|Sun Dec 31 00:00:00 2000|12/31/00|00:00:00",
  )
}

///|
test "date format reference 30: 2004-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2004-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2004-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 2004|01/01/04|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      12418.0,
    ),
    "2004-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 2004|01/01/04|00:00:00",
  )
}

///|
test "date format reference 31: 2004-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2004-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2004-W53-5|366|52|52|12:00:00 AM|Fri Dec 31 00:00:00 2004|12/31/04|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      12783.0,
    ),
    "2004-W53-5|366|52|52|12:00:00 AM|Fri Dec 31 00:00:00 2004|12/31/04|00:00:00",
  )
}

///|
test "date format reference 32: 2015-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2015-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2015-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 2015|01/01/15|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      16436.0,
    ),
    "2015-W01-4|001|00|00|12:00:00 AM|Thu Jan  1 00:00:00 2015|01/01/15|00:00:00",
  )
}

///|
test "date format reference 33: 2015-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2015-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2015-W53-4|365|52|52|12:00:00 AM|Thu Dec 31 00:00:00 2015|12/31/15|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      16800.0,
    ),
    "2015-W53-4|365|52|52|12:00:00 AM|Thu Dec 31 00:00:00 2015|12/31/15|00:00:00",
  )
}

///|
test "date format reference 34: 2016-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2016-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2015-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 2016|01/01/16|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      16801.0,
    ),
    "2015-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 2016|01/01/16|00:00:00",
  )
}

///|
test "date format reference 35: 2016-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2016-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2016-W52-6|366|52|52|12:00:00 AM|Sat Dec 31 00:00:00 2016|12/31/16|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      17166.0,
    ),
    "2016-W52-6|366|52|52|12:00:00 AM|Sat Dec 31 00:00:00 2016|12/31/16|00:00:00",
  )
}

///|
test "date format reference 36: 2017-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2017-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2016-W52-7|001|01|00|12:00:00 AM|Sun Jan  1 00:00:00 2017|01/01/17|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      17167.0,
    ),
    "2016-W52-7|001|01|00|12:00:00 AM|Sun Jan  1 00:00:00 2017|01/01/17|00:00:00",
  )
}

///|
test "date format reference 37: 2017-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2017-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2017-W52-7|365|53|52|12:00:00 AM|Sun Dec 31 00:00:00 2017|12/31/17|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      17531.0,
    ),
    "2017-W52-7|365|53|52|12:00:00 AM|Sun Dec 31 00:00:00 2017|12/31/17|00:00:00",
  )
}

///|
test "date format reference 38: 2018-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2018-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2018-W01-1|001|00|01|12:00:00 AM|Mon Jan  1 00:00:00 2018|01/01/18|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      17532.0,
    ),
    "2018-W01-1|001|00|01|12:00:00 AM|Mon Jan  1 00:00:00 2018|01/01/18|00:00:00",
  )
}

///|
test "date format reference 39: 2018-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2018-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2019-W01-1|365|52|53|12:00:00 AM|Mon Dec 31 00:00:00 2018|12/31/18|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      17896.0,
    ),
    "2019-W01-1|365|52|53|12:00:00 AM|Mon Dec 31 00:00:00 2018|12/31/18|00:00:00",
  )
}

///|
test "date format reference 40: 2019-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2019-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2019-W01-2|001|00|00|12:00:00 AM|Tue Jan  1 00:00:00 2019|01/01/19|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      17897.0,
    ),
    "2019-W01-2|001|00|00|12:00:00 AM|Tue Jan  1 00:00:00 2019|01/01/19|00:00:00",
  )
}

///|
test "date format reference 41: 2019-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2019-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2020-W01-2|365|52|52|12:00:00 AM|Tue Dec 31 00:00:00 2019|12/31/19|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      18261.0,
    ),
    "2020-W01-2|365|52|52|12:00:00 AM|Tue Dec 31 00:00:00 2019|12/31/19|00:00:00",
  )
}

///|
test "date format reference 42: 2020-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2020-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2020-W01-3|001|00|00|12:00:00 AM|Wed Jan  1 00:00:00 2020|01/01/20|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      18262.0,
    ),
    "2020-W01-3|001|00|00|12:00:00 AM|Wed Jan  1 00:00:00 2020|01/01/20|00:00:00",
  )
}

///|
test "date format reference 43: 2020-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2020-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2020-W53-4|366|52|52|12:00:00 AM|Thu Dec 31 00:00:00 2020|12/31/20|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      18627.0,
    ),
    "2020-W53-4|366|52|52|12:00:00 AM|Thu Dec 31 00:00:00 2020|12/31/20|00:00:00",
  )
}

///|
test "date format reference 44: 2021-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2021-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2020-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 2021|01/01/21|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      18628.0,
    ),
    "2020-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 2021|01/01/21|00:00:00",
  )
}

///|
test "date format reference 45: 2021-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2021-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2021-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 2021|12/31/21|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      18992.0,
    ),
    "2021-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 2021|12/31/21|00:00:00",
  )
}

///|
test "date format reference 46: 2023-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2023-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2022-W52-7|001|01|00|12:00:00 AM|Sun Jan  1 00:00:00 2023|01/01/23|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19358.0,
    ),
    "2022-W52-7|001|01|00|12:00:00 AM|Sun Jan  1 00:00:00 2023|01/01/23|00:00:00",
  )
}

///|
test "date format reference 47: 2023-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2023-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2023-W52-7|365|53|52|12:00:00 AM|Sun Dec 31 00:00:00 2023|12/31/23|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19722.0,
    ),
    "2023-W52-7|365|53|52|12:00:00 AM|Sun Dec 31 00:00:00 2023|12/31/23|00:00:00",
  )
}

///|
test "date format reference 48: 2024-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2024-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W01-1|001|00|01|12:00:00 AM|Mon Jan  1 00:00:00 2024|01/01/24|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19723.0,
    ),
    "2024-W01-1|001|00|01|12:00:00 AM|Mon Jan  1 00:00:00 2024|01/01/24|00:00:00",
  )
}

///|
test "date format reference 49: 2024-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2024-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2025-W01-2|366|52|53|12:00:00 AM|Tue Dec 31 00:00:00 2024|12/31/24|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      20088.0,
    ),
    "2025-W01-2|366|52|53|12:00:00 AM|Tue Dec 31 00:00:00 2024|12/31/24|00:00:00",
  )
}

///|
test "date format reference 50: 2400-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2400-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2399-W52-6|001|00|00|12:00:00 AM|Sat Jan  1 00:00:00 2400|01/01/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      157054.0,
    ),
    "2399-W52-6|001|00|00|12:00:00 AM|Sat Jan  1 00:00:00 2400|01/01/00|00:00:00",
  )
}

///|
test "date format reference 51: 2400-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2400-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2400-W52-7|366|53|52|12:00:00 AM|Sun Dec 31 00:00:00 2400|12/31/00|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      157419.0,
    ),
    "2400-W52-7|366|53|52|12:00:00 AM|Sun Dec 31 00:00:00 2400|12/31/00|00:00:00",
  )
}

///|
test "date format reference 52: 9999-01-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("9999-01-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "9998-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 9999|01/01/99|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      2932532.0,
    ),
    "9998-W53-5|001|00|00|12:00:00 AM|Fri Jan  1 00:00:00 9999|01/01/99|00:00:00",
  )
}

///|
test "date format reference 53: 9999-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("9999-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "9999-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 9999|12/31/99|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      2932896.0,
    ),
    "9999-W52-5|365|52|52|12:00:00 AM|Fri Dec 31 00:00:00 9999|12/31/99|00:00:00",
  )
}

///|
test "date format reference 54: 2024-02-29T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2024-02-29T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-4|060|08|09|12:00:00 AM|Thu Feb 29 00:00:00 2024|02/29/24|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19782.0,
    ),
    "2024-W09-4|060|08|09|12:00:00 AM|Thu Feb 29 00:00:00 2024|02/29/24|00:00:00",
  )
}

///|
test "date format reference 55: 2024-02-29T00:00:01+00:00/UTC" {
  let value = @date.parse_iso("2024-02-29T00:00:01+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-4|060|08|09|12:00:01 AM|Thu Feb 29 00:00:01 2024|02/29/24|00:00:01",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19782.000011574073,
    ),
    "2024-W09-4|060|08|09|12:00:01 AM|Thu Feb 29 00:00:01 2024|02/29/24|00:00:01",
  )
}

///|
test "date format reference 56: 2024-02-29T11:59:59+00:00/UTC" {
  let value = @date.parse_iso("2024-02-29T11:59:59+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-4|060|08|09|11:59:59 AM|Thu Feb 29 11:59:59 2024|02/29/24|11:59:59",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19782.499988425927,
    ),
    "2024-W09-4|060|08|09|11:59:59 AM|Thu Feb 29 11:59:59 2024|02/29/24|11:59:59",
  )
}

///|
test "date format reference 57: 2024-02-29T12:00:00+00:00/UTC" {
  let value = @date.parse_iso("2024-02-29T12:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-4|060|08|09|12:00:00 PM|Thu Feb 29 12:00:00 2024|02/29/24|12:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19782.5,
    ),
    "2024-W09-4|060|08|09|12:00:00 PM|Thu Feb 29 12:00:00 2024|02/29/24|12:00:00",
  )
}

///|
test "date format reference 58: 2024-02-29T12:00:01+00:00/UTC" {
  let value = @date.parse_iso("2024-02-29T12:00:01+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-4|060|08|09|12:00:01 PM|Thu Feb 29 12:00:01 2024|02/29/24|12:00:01",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19782.500011574073,
    ),
    "2024-W09-4|060|08|09|12:00:01 PM|Thu Feb 29 12:00:01 2024|02/29/24|12:00:01",
  )
}

///|
test "date format reference 59: 2024-02-29T13:00:00+00:00/UTC" {
  let value = @date.parse_iso("2024-02-29T13:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-4|060|08|09|01:00:00 PM|Thu Feb 29 13:00:00 2024|02/29/24|13:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19782.541666666668,
    ),
    "2024-W09-4|060|08|09|01:00:00 PM|Thu Feb 29 13:00:00 2024|02/29/24|13:00:00",
  )
}

///|
test "date format reference 60: 2024-02-29T23:59:59+00:00/UTC" {
  let value = @date.parse_iso("2024-02-29T23:59:59+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-4|060|08|09|11:59:59 PM|Thu Feb 29 23:59:59 2024|02/29/24|23:59:59",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19782.999988425927,
    ),
    "2024-W09-4|060|08|09|11:59:59 PM|Thu Feb 29 23:59:59 2024|02/29/24|23:59:59",
  )
}

///|
test "date format reference 61: 2015-12-28T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2015-12-28T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2015-W53-1|362|52|52|12:00:00 AM|Mon Dec 28 00:00:00 2015|12/28/15|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      16797.0,
    ),
    "2015-W53-1|362|52|52|12:00:00 AM|Mon Dec 28 00:00:00 2015|12/28/15|00:00:00",
  )
}

///|
test "date format reference 62: 2016-01-03T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2016-01-03T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2015-W53-7|003|01|00|12:00:00 AM|Sun Jan  3 00:00:00 2016|01/03/16|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      16803.0,
    ),
    "2015-W53-7|003|01|00|12:00:00 AM|Sun Jan  3 00:00:00 2016|01/03/16|00:00:00",
  )
}

///|
test "date format reference 63: 2016-01-04T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2016-01-04T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2016-W01-1|004|01|01|12:00:00 AM|Mon Jan  4 00:00:00 2016|01/04/16|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      16804.0,
    ),
    "2016-W01-1|004|01|01|12:00:00 AM|Mon Jan  4 00:00:00 2016|01/04/16|00:00:00",
  )
}

///|
test "date format reference 64: 2018-12-31T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2018-12-31T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2019-W01-1|365|52|53|12:00:00 AM|Mon Dec 31 00:00:00 2018|12/31/18|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      17896.0,
    ),
    "2019-W01-1|365|52|53|12:00:00 AM|Mon Dec 31 00:00:00 2018|12/31/18|00:00:00",
  )
}

///|
test "date format reference 65: 2019-12-30T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2019-12-30T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2020-W01-1|364|52|52|12:00:00 AM|Mon Dec 30 00:00:00 2019|12/30/19|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      18260.0,
    ),
    "2020-W01-1|364|52|52|12:00:00 AM|Mon Dec 30 00:00:00 2019|12/30/19|00:00:00",
  )
}

///|
test "date format reference 66: 2021-01-03T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2021-01-03T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2020-W53-7|003|01|00|12:00:00 AM|Sun Jan  3 00:00:00 2021|01/03/21|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      18630.0,
    ),
    "2020-W53-7|003|01|00|12:00:00 AM|Sun Jan  3 00:00:00 2021|01/03/21|00:00:00",
  )
}

///|
test "date format reference 67: 2021-01-04T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2021-01-04T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2021-W01-1|004|01|01|12:00:00 AM|Mon Jan  4 00:00:00 2021|01/04/21|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      18631.0,
    ),
    "2021-W01-1|004|01|01|12:00:00 AM|Mon Jan  4 00:00:00 2021|01/04/21|00:00:00",
  )
}

///|
test "date format reference 68: 2023-01-02T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2023-01-02T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2023-W01-1|002|01|01|12:00:00 AM|Mon Jan  2 00:00:00 2023|01/02/23|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19359.0,
    ),
    "2023-W01-1|002|01|01|12:00:00 AM|Mon Jan  2 00:00:00 2023|01/02/23|00:00:00",
  )
}

///|
test "date format reference 69: 2024-02-28T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2024-02-28T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-3|059|08|09|12:00:00 AM|Wed Feb 28 00:00:00 2024|02/28/24|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19781.0,
    ),
    "2024-W09-3|059|08|09|12:00:00 AM|Wed Feb 28 00:00:00 2024|02/28/24|00:00:00",
  )
}

///|
test "date format reference 70: 2024-03-01T00:00:00+00:00/UTC" {
  let value = @date.parse_iso("2024-03-01T00:00:00+00:00")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X"),
    "2024-W09-5|061|08|09|12:00:00 AM|Fri Mar  1 00:00:00 2024|03/01/24|00:00:00",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X").format_value(
      19783.0,
    ),
    "2024-W09-5|061|08|09|12:00:00 AM|Fri Mar  1 00:00:00 2024|03/01/24|00:00:00",
  )
}

///|
test "date format reference 71: 2021-01-04T00:09:21+00:09:21/561" {
  let zone = @date.fixed_timezone_seconds(561)
  let value = @date.parse_iso("2021-01-04T00:09:21+00:09:21")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2021-W01-1|004|01|01|12:09:21 AM|Mon Jan  4 00:09:21 2021|01/04/21|00:09:21|+000921 UTC+00:09:21",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(18631.0),
    "2021-W01-1|004|01|01|12:09:21 AM|Mon Jan  4 00:09:21 2021|01/04/21|00:09:21|+000921 UTC+00:09:21",
  )
}

///|
test "date format reference 72: 2024-03-10T07:09:20+00:09:21/561" {
  let zone = @date.fixed_timezone_seconds(561)
  let value = @date.parse_iso("2024-03-10T07:09:20+00:09:21")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W10-7|070|10|10|07:09:20 AM|Sun Mar 10 07:09:20 2024|03/10/24|07:09:20|+000921 UTC+00:09:21",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(19792.29165509259),
    "2024-W10-7|070|10|10|07:09:20 AM|Sun Mar 10 07:09:20 2024|03/10/24|07:09:20|+000921 UTC+00:09:21",
  )
}

///|
test "date format reference 73: 2024-03-10T07:09:21+00:09:21/561" {
  let zone = @date.fixed_timezone_seconds(561)
  let value = @date.parse_iso("2024-03-10T07:09:21+00:09:21")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W10-7|070|10|10|07:09:21 AM|Sun Mar 10 07:09:21 2024|03/10/24|07:09:21|+000921 UTC+00:09:21",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(19792.291666666668),
    "2024-W10-7|070|10|10|07:09:21 AM|Sun Mar 10 07:09:21 2024|03/10/24|07:09:21|+000921 UTC+00:09:21",
  )
}

///|
test "date format reference 74: 2024-11-03T05:39:21+00:09:21/561" {
  let zone = @date.fixed_timezone_seconds(561)
  let value = @date.parse_iso("2024-11-03T05:39:21+00:09:21")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W44-7|308|44|44|05:39:21 AM|Sun Nov  3 05:39:21 2024|11/03/24|05:39:21|+000921 UTC+00:09:21",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(20030.229166666668),
    "2024-W44-7|308|44|44|05:39:21 AM|Sun Nov  3 05:39:21 2024|11/03/24|05:39:21|+000921 UTC+00:09:21",
  )
}

///|
test "date format reference 75: 2024-11-03T06:39:21+00:09:21/561" {
  let zone = @date.fixed_timezone_seconds(561)
  let value = @date.parse_iso("2024-11-03T06:39:21+00:09:21")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W44-7|308|44|44|06:39:21 AM|Sun Nov  3 06:39:21 2024|11/03/24|06:39:21|+000921 UTC+00:09:21",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(20030.270833333332),
    "2024-W44-7|308|44|44|06:39:21 AM|Sun Nov  3 06:39:21 2024|11/03/24|06:39:21|+000921 UTC+00:09:21",
  )
}

///|
test "date format reference 76: 2021-01-03T19:03:58-04:56:02/-17762" {
  let zone = @date.fixed_timezone_seconds(-17762)
  let value = @date.parse_iso("2021-01-03T19:03:58-04:56:02")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2020-W53-7|003|01|00|07:03:58 PM|Sun Jan  3 19:03:58 2021|01/03/21|19:03:58|-045602 UTC-04:56:02",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(18631.0),
    "2020-W53-7|003|01|00|07:03:58 PM|Sun Jan  3 19:03:58 2021|01/03/21|19:03:58|-045602 UTC-04:56:02",
  )
}

///|
test "date format reference 77: 2024-03-10T02:03:57-04:56:02/-17762" {
  let zone = @date.fixed_timezone_seconds(-17762)
  let value = @date.parse_iso("2024-03-10T02:03:57-04:56:02")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W10-7|070|10|10|02:03:57 AM|Sun Mar 10 02:03:57 2024|03/10/24|02:03:57|-045602 UTC-04:56:02",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(19792.29165509259),
    "2024-W10-7|070|10|10|02:03:57 AM|Sun Mar 10 02:03:57 2024|03/10/24|02:03:57|-045602 UTC-04:56:02",
  )
}

///|
test "date format reference 78: 2024-03-10T02:03:58-04:56:02/-17762" {
  let zone = @date.fixed_timezone_seconds(-17762)
  let value = @date.parse_iso("2024-03-10T02:03:58-04:56:02")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W10-7|070|10|10|02:03:58 AM|Sun Mar 10 02:03:58 2024|03/10/24|02:03:58|-045602 UTC-04:56:02",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(19792.291666666668),
    "2024-W10-7|070|10|10|02:03:58 AM|Sun Mar 10 02:03:58 2024|03/10/24|02:03:58|-045602 UTC-04:56:02",
  )
}

///|
test "date format reference 79: 2024-11-03T00:33:58-04:56:02/-17762" {
  let zone = @date.fixed_timezone_seconds(-17762)
  let value = @date.parse_iso("2024-11-03T00:33:58-04:56:02")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W44-7|308|44|44|12:33:58 AM|Sun Nov  3 00:33:58 2024|11/03/24|00:33:58|-045602 UTC-04:56:02",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(20030.229166666668),
    "2024-W44-7|308|44|44|12:33:58 AM|Sun Nov  3 00:33:58 2024|11/03/24|00:33:58|-045602 UTC-04:56:02",
  )
}

///|
test "date format reference 80: 2024-11-03T01:33:58-04:56:02/-17762" {
  let zone = @date.fixed_timezone_seconds(-17762)
  let value = @date.parse_iso("2024-11-03T01:33:58-04:56:02")
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W44-7|308|44|44|01:33:58 AM|Sun Nov  3 01:33:58 2024|11/03/24|01:33:58|-045602 UTC-04:56:02",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(20030.270833333332),
    "2024-W44-7|308|44|44|01:33:58 AM|Sun Nov  3 01:33:58 2024|11/03/24|01:33:58|-045602 UTC-04:56:02",
  )
}

///|
test "date format reference 81: 2021-01-03T19:00:00-05:00/NY" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let value = @date.parse_iso("2021-01-03T19:00:00-05:00").with_timezone(zone)
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2020-W53-7|003|01|00|07:00:00 PM|Sun Jan  3 19:00:00 2021|01/03/21|19:00:00|-0500 EST",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(18631.0),
    "2020-W53-7|003|01|00|07:00:00 PM|Sun Jan  3 19:00:00 2021|01/03/21|19:00:00|-0500 EST",
  )
}

///|
test "date format reference 82: 2024-03-10T01:59:59-05:00/NY" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let value = @date.parse_iso("2024-03-10T01:59:59-05:00").with_timezone(zone)
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W10-7|070|10|10|01:59:59 AM|Sun Mar 10 01:59:59 2024|03/10/24|01:59:59|-0500 EST",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(19792.29165509259),
    "2024-W10-7|070|10|10|01:59:59 AM|Sun Mar 10 01:59:59 2024|03/10/24|01:59:59|-0500 EST",
  )
}

///|
test "date format reference 83: 2024-03-10T03:00:00-04:00/NY" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let value = @date.parse_iso("2024-03-10T03:00:00-04:00").with_timezone(zone)
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W10-7|070|10|10|03:00:00 AM|Sun Mar 10 03:00:00 2024|03/10/24|03:00:00|-0400 EDT",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(19792.291666666668),
    "2024-W10-7|070|10|10|03:00:00 AM|Sun Mar 10 03:00:00 2024|03/10/24|03:00:00|-0400 EDT",
  )
}

///|
test "date format reference 84: 2024-11-03T01:30:00-04:00/NY" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let value = @date.parse_iso("2024-11-03T01:30:00-04:00").with_timezone(zone)
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W44-7|308|44|44|01:30:00 AM|Sun Nov  3 01:30:00 2024|11/03/24|01:30:00|-0400 EDT",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(20030.229166666668),
    "2024-W44-7|308|44|44|01:30:00 AM|Sun Nov  3 01:30:00 2024|11/03/24|01:30:00|-0400 EDT",
  )
}

///|
test "date format reference 85: 2024-11-03T01:30:00-05:00/NY" {
  let zone = @date.tzif_timezone(tzif_new_york)
  let value = @date.parse_iso("2024-11-03T01:30:00-05:00").with_timezone(zone)
  assert_eq(
    @date.format_date(value, "%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z"),
    "2024-W44-7|308|44|44|01:30:00 AM|Sun Nov  3 01:30:00 2024|11/03/24|01:30:00|-0500 EST",
  )
  assert_eq(
    @date.date_formatter("%G-W%V-%u|%j|%U|%W|%I:%M:%S %p|%c|%x|%X|%z %Z")
    .with_timezone(zone)
    .format_value(20030.270833333332),
    "2024-W44-7|308|44|44|01:30:00 AM|Sun Nov  3 01:30:00 2024|11/03/24|01:30:00|-0500 EST",
  )
}

///|
test "date format reference 86: 2021-01-01T13:05:00+00:00/UTC" {
  let value = @date.parse_iso("2021-01-01T13:05:00+00:00")
  assert_eq(
    @date.format_date(value, "week %G-W%V %I:%M %p"),
    "week 2020-W53 01:05 PM",
  )
  assert_eq(
    @date.date_formatter("week %G-W%V %I:%M %p")
    .with_usetex(true)
    .format_value(18628.54513888889),
    "week$\\mathdefault{\\;2020{-}}$W$\\mathdefault{53\\;01{:}05\\;}$PM",
  )
}

///|
test "C locale calendar oracle covers every day of the first Gregorian cycle" {
  let expected : Array[Int64] = [
    838397628L, 94969640L, 609372284L, 693363038L, 668689533L, 511634694L, 880724432L,
    566655056L, 4960695L, 279077676L, 269880051L, 257921933L, 987379266L, 501781903L,
    195431313L, 160127887L, 404044313L, 773134051L, 682676887L, 344821344L, 510182056L,
    162289670L, 594514931L, 697025447L, 394191522L, 87840932L, 552508860L, 284220028L,
    266755834L, 70259496L, 584662140L, 254179497L, 643979389L, 486924550L, 856014288L,
    127471515L, 980250558L, 444918479L, 97026093L, 914386106L, 962669122L, 477071759L,
    170721169L, 720944353L, 379334169L, 748423907L, 4995919L, 853141703L, 337328098L,
    27519046L, 569804787L, 257841906L, 369481378L, 63130788L, 527798716L, 845036494L,
    640833526L, 897405545L, 764054006L, 814995963L, 619269245L, 462214406L, 831304144L,
    688287981L, 955540414L, 420208335L, 72315949L, 327058751L, 442785981L, 452361615L,
    146011025L, 281760812L, 354624025L, 723713763L, 980285782L, 413958162L, 312617954L,
    964725575L, 396950829L, 818658372L, 344771234L, 38420644L, 503088572L, 405852953L,
    616123382L, 872695401L, 387098038L, 323316315L, 446415287L, 434466126L, 806594000L,
    249104440L, 930830270L, 395498191L, 47605805L, 887875217L, 765105020L, 279507657L,
    973157074L, 340194733L, 830534629L, 262759883L, 631849621L, 387549057L, 756085891L,
    220753812L, 872861433L, 26319827L, 243331458L, 252907092L, 946556509L, 981021895L,
    155169502L, 524259240L, 780831259L, 113219238L, 113163431L, 765271052L, 197496306L,
    517919448L, 145316711L, 838966128L, 303634049L, 105114029L, 416668859L, 673240878L,
    187643515L, 22577391L, 246960764L, 235011603L, 607139477L, 948365523L, 731375747L,
    196043668L, 848151289L, 587136293L, 565650497L, 80053134L, 773702551L, 527425581L,
    130459358L, 499549096L, 756121115L, 674035704L, 88453287L, 740560908L, 172786162L,
    26239800L, 324708577L, 814255984L, 278923905L, 665930495L, 391958715L, 648530734L,
    162933371L, 583393857L, 222250620L, 65195781L, 35497683L, 509181982L, 706665603L,
    171333524L, 823441145L, 147952752L, 540940353L, 55342990L, 748992407L, 50158706L,
    957605407L, 474838952L, 731410971L, 234852163L, 63743143L, 715850764L, 148076018L,
    587056266L, 947752616L, 641402026L, 106069947L, 319356525L, 367248571L, 623820590L,
    138223227L, 144210316L, 197540476L, 40485637L, 409575375L, 17502334L, 533811645L,
    807928626L, 798731001L, 708769218L, 516230209L, 30632846L, 724282263L, 610975172L,
    932895263L, 301984994L, 453623234L, 813561670L, 507211080L, 971879008L, 623986622L,
    847213835L, 341485830L, 855888474L, 549537884L, 749419789L, 758150884L, 275384429L,
    531956448L, 934113246L, 864288627L, 516396241L, 948621502L, 286317342L, 748298093L,
    441947503L, 906615431L, 18617601L, 167794048L, 424366067L, 938768711L, 843471399L,
    998085960L, 841031121L, 210120852L, 716763417L, 334357122L, 608474103L, 599276478L,
    408030294L, 316775686L, 831178330L, 524827740L, 310236248L, 733440740L, 102530471L,
    12073307L, 494929705L, 839578483L, 491686097L, 923911358L, 847133808L, 723587949L,
    417237359L, 881905287L, 434328389L, 596152261L, 399655923L, 914058567L, 404287858L,
    973375816L, 816320977L, 185410708L, 277579876L, 309646978L, 774314906L, 426422520L,
    64494460L, 292065542L, 806468186L, 500117596L, 871052714L, 708730596L, 77820327L,
    334392346L, 3250057L, 666724525L, 356915473L, 899201214L, 407950267L, 698877805L,
    392527215L, 857195143L, 995144855L, 970229953L, 226801965L, 93450426L, 965104324L,
    948665672L, 791610833L, 160700564L, 838396342L, 284936834L, 749604762L, 401712376L,
    477167112L, 772182408L, 781758042L, 475407452L, 431869173L, 684020452L, 53110183L,
    309682202L, 564066523L, 642014381L, 294121995L, 726347256L, 836039007L, 92611019L,
    607013663L, 300663073L, 570313790L, 509276073L, 878365811L, 134937823L, 702511140L,
    467270002L, 157460950L, 699746691L, 107211343L, 499423282L, 193072692L, 657740620L,
    694405931L, 770775430L, 27347442L, 893995910L, 664365400L, 749211149L, 592156310L,
    961246048L, 537657418L, 85482311L, 550150239L, 202257853L, 176428188L, 572727885L,
    582303519L, 275952929L, 131130249L, 484565929L, 853655667L, 110227679L, 263327599L,
    442559858L, 94667472L, 526892733L, 668027809L, 474713138L, 168362548L, 633030476L,
    255222390L, 746065286L, 2637298L, 517039942L, 172685752L, 576357191L, 564408030L,
    936535904L, 98473877L, 60772167L, 525440095L, 177547709L, 737244654L, 895046924L,
    409449561L, 103098971L, 677533942L, 459855785L, 828945523L, 85517535L, 824144065L,
    417849714L, 69957328L, 502182589L, 176348161L, 654105004L, 143652404L, 608320332L,
    816038856L, 721355142L, 977927161L, 492329798L, 733502218L, 551647047L, 394592208L,
    364894110L, 659290343L, 36062023L, 500729951L, 152837565L, 298061113L, 870336780L,
    384739417L, 78388827L, 200267067L, 287001827L, 804235379L, 60807391L, 384960524L,
    393139570L, 45247184L, 477472445L, 737164627L, 277149036L, 970798453L, 435466374L,
    967740876L,
  ]
  for index in 0..<400 {
    let year = index + 1
    let first = @date.datetime(year, 1, 1).to_ordinal()
    let last = @date.datetime(year + 1, 1, 1).to_ordinal()
    let mut hash = 0L
    for day in 0..<(last - first).to_int() {
      let value = @date.num2date(first + Double::from_int(day))
      let label = @date.format_date(value, "%j %U %W %G %V %u")
      for char in label.to_array() {
        hash = (hash * 31L + Int64::from_int(char.to_int())) % 1_000_000_007L
      }
    }
    assert_eq((year, hash), (year, expected[index]))
  }
}

///|
test "C locale date directives propagate through original automatic formatter" {
  let formatter = @date.AutoDateFormatter::new()
    .with_locator_unit(1.0 / 24.0)
    .with_scale(1.0 / 24.0, @date.Text("%G-W%V-%u %I:%M %p"))
  assert_eq(formatter.format_ticks([18627.958333333332, 18628.541666666668]), [
    "2020-W53-4 11:00 PM", "2020-W53-5 01:00 PM",
  ])
}

///|
test "C locale date directives propagate through original concise formatter" {
  let formats = [
    "%G-W%V-%u %I:%M %p", "%G-W%V-%u %I:%M %p", "%G-W%V-%u %I:%M %p", "%G-W%V-%u %I:%M %p",
    "%G-W%V-%u %I:%M %p", "%G-W%V-%u %I:%M %p",
  ]
  let formatter = @date.concise_date_formatter(
    formats~,
    zero_formats=formats,
    offset_formats=formats,
  )
  assert_eq(formatter.format_ticks([18627.958333333332, 18628.541666666668]), [
    "2020-W53-4 11:00 PM", "2020-W53-5 01:00 PM",
  ])
  assert_eq(formatter.get_offset(), "2020-W53-5 01:00 PM")
}
