///|
test "automatic month and year ticks follow local offset boundaries" {
  for offset in [330, 345, -210] {
    let start = @date.datetime(2024, 1, 15, offset_minutes=offset).to_ordinal()
    let finish = @date.datetime(2024, 7, 15, offset_minutes=offset).to_ordinal()
    let ticks = @date.date_tick_values(
      start,
      finish,
      count=8,
      offset_minutes=offset,
    )
    assert_eq(
      @date.format_date_ticks(
        ticks,
        format="%m-%d %H:%M",
        offset_minutes=offset,
      ),
      [
        "02-01 00:00", "03-01 00:00", "04-01 00:00", "05-01 00:00", "06-01 00:00",
        "07-01 00:00",
      ],
    )
    assert_eq(
      @date.date_tick_values(finish, start, count=8, offset_minutes=offset),
      ticks.rev(),
    )
    let year_start = @date.datetime(2019, 10, 10, offset_minutes=offset).to_ordinal()
    let year_finish = @date.datetime(2021, 4, 10, offset_minutes=offset).to_ordinal()
    let years = @date.date_tick_values(
      year_start,
      year_finish,
      count=2,
      offset_minutes=offset,
    )
    assert_eq(
      @date.format_date_ticks(
        years,
        format="%Y-%m-%d %H:%M",
        offset_minutes=offset,
      ),
      ["2020-01-01 00:00", "2021-01-01 00:00"],
    )
  }
}

///|
test "automatic subday ticks align half and quarter hour offsets" {
  for offset in [330, 345, -210] {
    let start = @date.datetime(2024, 1, 1, offset_minutes=offset).to_ordinal()
    let finish = @date.datetime(2024, 1, 1, hour=4, offset_minutes=offset).to_ordinal()
    let ticks = @date.date_tick_values(
      start,
      finish,
      count=5,
      offset_minutes=offset,
    )
    assert_eq(
      @date.format_date_ticks(ticks, format="%H:%M", offset_minutes=offset),
      ["00:00", "01:00", "02:00", "03:00", "04:00"],
    )
  }
}
