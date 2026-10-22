// Generated from original datestr2num/default parser under controlled TZ/clock.

///|
test "string parser original reference: UTC/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Thu Sep 25 10:36:28 2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441990740741))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Thu Sep 25 2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003-09-25T10:49:41",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.45116898148))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003-09-25T10:49",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.450694444444))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003-09-25T10",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003-09-25",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "20030925T104941",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.45116898148))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "20030925T1049",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.450694444444))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "20030925T10",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "20030925",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003-09-25 10:49:41,502",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.451174791666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "199709020908",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(10106.380555555555))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "19970902090807",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(10106.380636574075))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "09-25-2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "25-09-2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10-09-2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10-09-03",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003.09.25",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "09.25.2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "25.09.2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10.09.2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10.09.03",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003/09/25",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "09/25/2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "25/09/2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10/09/2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10/09/03",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003 09 25",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "09 25 2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "25 09 2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10 09 2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10 09 03",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "25 09 03",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "03 25 Sep",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "25 03 Sep",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(20334.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "  July   4 ,  1976   12:01:02   am  ",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0007175925925))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Wed, July 10, '96",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(9687.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "1996.July.10 AD 12:08 PM",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(9687.505555555555))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "July 4, 1976",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "7 4 1976",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "4 jul 1976",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "4 Jul 1976",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "7-4-76",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "19760704",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0:01:02 on July 4, 1976",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0007175925925))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "July 4, 1976 12:01:02 am",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2376.0007175925925))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Mon Jan  2 04:24:27 1995",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(9132.183645833333))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "04.04.95 00:22",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(9224.015277777778))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Jan 1 1999 11:23:34.578",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(10592.474705763889))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "950404 122212",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(9224.515416666667))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "3rd of May 2001",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(11445.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5th of March 2001",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(11386.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "1st of May 2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12173.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0099-01-01T00:00:00",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(-683368.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0031-01-01T00:00:00",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(-708205.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "20080227T21:26:01.123456789",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(13936.893068558518))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/56" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "13NOV2017",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(17483.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/57" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0003-03-04",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(-718370.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/58" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "December.0031.30",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(-707842.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/59" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2016-12-21 04.2h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(17156.175))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/60" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Thu Sep 25 10:36:28",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441990740741))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/61" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Thu Sep 10:36:28",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441990740741))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/62" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Thu 10:36:28",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441990740741))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/63" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Sep 10:36:28",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441990740741))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/64" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:36:28",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441990740741))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/65" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:36",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/66" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Sep 2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/67" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Sep",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/68" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2003",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/69" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10h36m28.5s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441996527778))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/70" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10h36m28s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441990740741))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/71" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10h36m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/72" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/73" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10 h 36",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.441666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/74" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10 h 36.5",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.442013888889))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/75" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "36 m 5",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.02505787037))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/76" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "36 m 5 s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.02505787037))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/77" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "36 m 05",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.02505787037))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/78" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "36 m 05 s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.02505787037))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/79" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10h am",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/80" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10h pm",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.916666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/81" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10am",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/82" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10pm",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.916666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/83" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:00 am",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/84" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:00 pm",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.916666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/85" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:00am",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/86" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:00pm",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.916666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/87" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:00a.m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/88" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:00p.m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.916666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/89" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:00a.m.",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.416666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/90" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "10:00p.m.",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.916666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/91" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Wed",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12326.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/92" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Wednesday",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12326.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/93" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "October",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12350.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/94" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "31-Dec-00",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(11322.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/95" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0:01:02",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000717592593))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/96" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "12h 01m02s am",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000717592593))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/97" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "12:08 PM",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.505555555555))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/98" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "01h02m03",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.043090277777))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/99" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "01h02",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.043055555556))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/100" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "01h02s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.041689814814))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/101" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "01m02",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000717592593))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/102" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "01m02h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.084027777777))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/103" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2004 10 Apr 11h30m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12518.479166666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/104" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/105" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      " ",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/106" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "ad",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/107" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "AM",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/108" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "25 PM",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/109" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0 am",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/110" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "12 am",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/111" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "13 PM",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.541666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/112" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "13pm",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.541666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/113" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "23 pm",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.958333333334))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/114" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Jan of 01",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(11347.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/115" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Jan of 76",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2215.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/116" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Jan of 77",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2581.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/117" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Jan of 25",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(20113.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/118" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Feb 31",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/119" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2000-00-01",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/120" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-32",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/121" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "２０２４-０２-２９ １３:０５:２９,１２３４５６７",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19782.545475965926))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/122" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "٢٠٢٤-٠٢-٢٩ ١٣:٠٥",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19782.54513888889))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/123" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "² Jan 2024",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/124" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 UTC",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.416666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/125" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 GMT",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.416666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/126" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 z",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.416666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/127" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 BRST",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.416666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: UTC/128" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 GMT+3",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.541666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/129" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 BRST-3",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.291666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/130" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 -0300 (BRST)",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.541666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/131" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 +00:99",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.347916666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/132" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 +24:00",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/133" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 NAN",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/134" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 INF",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/135" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00 UTC+00",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.416666666668))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/136" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 10:00:60",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/137" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "99h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/138" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "1: test",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/139" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "NaN",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/140" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2024-01-01 12:30:45.1234567890123456789",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(19723.521355595556))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/141" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "2000-01",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(10981.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/142" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0001-01",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12053.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/143" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "24-12-31",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(22637.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/144" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "76-01-01",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2191.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/145" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "77-01-01",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2557.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/146" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Jan 77",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2581.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/147" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "Jan 76",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(2215.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/148" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "4.2h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.175))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/149" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "4.2m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.002916666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/150" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "4.2s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000048611111))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/151" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.6h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.233333333334))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/152" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.6m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.003888888888))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/153" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.6s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000064814814))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/154" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.29h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.011805555556))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/155" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.29m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.00019675926))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/156" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.29s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000003356481))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/157" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "1.00000000000000000000000000001h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.041666666666))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/158" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "1.00000000000000000000000000001m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000694444445))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/159" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "1.00000000000000000000000000001s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000011574075))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/160" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.999999999999999999999999999h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.040972222223))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/161" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.999999999999999999999999999m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.00068287037))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/162" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.999999999999999999999999999s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000011574062))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/163" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.9999999999999999999999999999h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.040972222223))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/164" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.9999999999999999999999999999m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.00068287037))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/165" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.9999999999999999999999999999s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000011574062))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/166" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.99999999999999999999999999999h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/167" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.99999999999999999999999999999m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/168" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.99999999999999999999999999999s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000011574062))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/169" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.000000000000000000000000000000000000000000000000001h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/170" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.000000000000000000000000000000000000000000000000001m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/171" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "0.000000000000000000000000000000000000000000000000001s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.0))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/172" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.5999999999999999999999999999h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.232638888889))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/173" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.5999999999999999999999999999m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.003877314815))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/174" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.5999999999999999999999999999s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000064814803))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/175" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.6000000000000000000000000001h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.233333333334))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/176" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.6000000000000000000000000001m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.003888888888))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/177" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "5.6000000000000000000000000001s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000064814814))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/178" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "100.1h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/179" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "100.1m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/180" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "100.1s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/181" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "23.99999999999999999999999999999h",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/182" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "23.99999999999999999999999999999m",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/183" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestr2num(
      "23.99999999999999999999999999999s",
      parser~,
      default_date=@date.parse_iso("2003-09-25T00:00:00"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some(12320.000277777766))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/184" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/185" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/186" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/187" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/188" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/189" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/190" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/191" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: UTC/192" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: UTC/193" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: UTC/194" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: UTC/195" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: UTC/196" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: UTC/197" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: UTC/198" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: UTC/199" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: UTC/200" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: UTC/201" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/202" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/203" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.3125))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/204" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: UTC/205" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: UTC/206" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/207" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/208" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/209" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: UTC/210" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: UTC/211" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: UTC/212" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: UTC/213" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/214" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/215" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/216" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/217" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/218" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/219" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19792.104166666668, 20030.0625]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/220" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/221" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: UTC/222" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: UTC/223" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/224" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/225" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/226" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/227" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/228" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/229" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/230" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/231" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/232" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/233" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/234" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/235" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19820.072916666668, 20002.09375]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/236" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/237" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19813.0625, 20023.0625]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/238" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/239" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: UTC/240" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::utc(clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["UTC", "UTC"])
  assert_eq(parser.local_offsets(), (0, 0))
  calls.val = 0
  times.val = [1798761599000L, 1798761601000L, 1798761602000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.645833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.604166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: America/New_York/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: America/New_York/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: America/New_York/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: America/New_York/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.270833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.229166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.270833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.270833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.645833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.3125))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: America/New_York/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.354166666664))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: America/New_York/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: America/New_York/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: America/New_York/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: America/New_York/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.708333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19792.3125, 20030.229166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: America/New_York/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: America/New_York/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19820.239583333332, 20002.260416666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19813.229166666668, 20023.229166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: America/New_York/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("America/New_York", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["EST", "EDT"])
  assert_eq(parser.local_offsets(), (-18000, -14400))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20818.416666666668, 20818.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Europe/Paris/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Europe/Paris/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.395833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: Europe/Paris/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: Europe/Paris/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: Europe/Paris/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Europe/Paris/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Europe/Paris/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Europe/Paris/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Europe/Paris/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.3125))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.604166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Europe/Paris/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: Europe/Paris/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: Europe/Paris/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: Europe/Paris/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: Europe/Paris/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19792.0625, 20030.020833333332]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: Europe/Paris/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: Europe/Paris/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19819.989583333332, 20002.010416666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19813.020833333332, 20022.979166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Paris/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Paris", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["CET", "CEST"])
  assert_eq(parser.local_offsets(), (3600, 7200))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Europe/Dublin/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Europe/Dublin/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: Europe/Dublin/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.395833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: Europe/Dublin/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Europe/Dublin/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Europe/Dublin/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Europe/Dublin/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Europe/Dublin/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.395833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: Europe/Dublin/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Europe/Dublin/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: Europe/Dublin/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: Europe/Dublin/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: Europe/Dublin/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: Europe/Dublin/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19792.104166666668, 20030.0625]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: Europe/Dublin/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: Europe/Dublin/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19820.03125, 20002.052083333332]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19813.0625, 20023.020833333332]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Europe/Dublin/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["GMT", "IST"])
  assert_eq(parser.local_offsets(), (0, 3600))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Australia/Lord_Howe/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: Australia/Lord_Howe/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Australia/Lord_Howe/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Australia/Lord_Howe/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.3125))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: Australia/Lord_Howe/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: Australia/Lord_Howe/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: Australia/Lord_Howe/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.041666666668]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19791.645833333332, 20029.604166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: Australia/Lord_Howe/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: Australia/Lord_Howe/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19819.614583333332, 20001.65625]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19812.604166666668, 20022.604166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Australia/Lord_Howe/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Australia/Lord_Howe", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["+1030", "+11"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Asia/Kolkata/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Asia/Kolkata/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: Asia/Kolkata/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.208333333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.208333333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: Asia/Kolkata/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Asia/Kolkata/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Asia/Kolkata/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Asia/Kolkata/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: Asia/Kolkata/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.208333333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: Asia/Kolkata/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: Asia/Kolkata/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: Asia/Kolkata/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: Asia/Kolkata/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: Asia/Kolkata/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: Asia/Kolkata/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.270833333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19791.875, 20029.833333333332]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: Asia/Kolkata/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: Asia/Kolkata/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19819.84375, 20001.864583333332]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19812.833333333332, 20022.833333333332]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: Asia/Kolkata/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Asia/Kolkata", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "IST"])
  assert_eq(parser.local_offsets(), (19800, 19800))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20620.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2206.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST-14/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST-14/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: POSIX:XST-14/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: POSIX:XST-14/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: POSIX:XST-14/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: POSIX:XST-14/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST-14/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST-14/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST-14/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST-14/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.3125))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: POSIX:XST-14/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST-14/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: POSIX:XST-14/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: POSIX:XST-14/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: POSIX:XST-14/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: POSIX:XST-14/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19723.916666666668]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19791.520833333332, 20029.479166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: POSIX:XST-14/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: POSIX:XST-14/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19819.489583333332, 20001.510416666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19812.479166666668, 20022.479166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-14/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-14", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (50400, 50400))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST12/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST12/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: POSIX:XST12/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: POSIX:XST12/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: POSIX:XST12/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: POSIX:XST12/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST12/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST12/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST12/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST12/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.3125))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: POSIX:XST12/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST12/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: POSIX:XST12/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: POSIX:XST12/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: POSIX:XST12/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: POSIX:XST12/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19725.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19792.604166666668, 20030.5625]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: POSIX:XST12/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: POSIX:XST12/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19820.572916666668, 20002.59375]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19813.5625, 20023.5625]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST12/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST12", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (-43200, -43200))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20818.416666666668, 20818.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.3125))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.493506944444]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19792.09767361111, 20030.056006944444]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19820.06642361111, 20002.087256944444]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19813.056006944444, 20023.056006944444]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:XST-0:09:21/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix("XST-0:09:21", clock~),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["XST", "XST"])
  assert_eq(parser.local_offsets(), (561, 561))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.395833333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19820.072916666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHST")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20002.09375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("LHDT")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19792.104166666668, 20030.0625]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19820.03125, 20002.052083333332]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19813.0625, 20023.020833333332]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: OVERRIDE:Europe/Dublin/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@tzdb.parser_context("Europe/Dublin", clock~).with_local_info(
      3600,
      0,
      ["IST", "GMT"],
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["IST", "GMT"])
  assert_eq(parser.local_offsets(), (3600, 0))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/0" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("10:30", parser~)) catch { _ => None }
  assert_eq(result, Some(20619.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/1" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan 1", parser~)) catch { _ => None }
  assert_eq(result, Some(20454.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/2" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Wed", parser~)) catch { _ => None }
  assert_eq(result, Some(20621.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/3" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Feb 29", parser~)) catch { _ => None }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/4" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("Jan of 76", parser~)) catch { _ => None }
  assert_eq(result, Some(2205.0))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/5" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 UTC", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/6" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/7" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/8" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/9" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/10" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/11" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 IST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("IST")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/12" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 BRST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/13" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/14" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-11-03 01:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20030.0625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/15" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/16" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-03-10 02:30 EDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19792.104166666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EDT")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/17" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 EST+0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/18" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-07-01 10:30 GMT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19905.4375))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/19" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 10:30 IST-0300", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.3125))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/20" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1900-01-01 10:30 CET", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-25566.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("CET")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/21" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("1800-01-01 10:30 EST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(-62090.5625))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("EST")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/22" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("0001-01-01 00:00 +2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/23" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("9999-12-31 23:30 -2300", parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/24" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-01-01 23:59:59.123456789", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19723.999989854816))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/25" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19819.635416666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/26" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-04-07 01:45 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(19819.614583333332))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/27" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHST", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20001.635416666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/28" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestr2num("2024-10-06 02:15 LHDT", parser~)) catch {
    _ => None
  }
  assert_eq(result, Some(20001.635416666668))
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/29" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num([], parser~)) catch { _ => None }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/30" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      [],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/31" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 UTC", "2024-01-02 12:00"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.041666666668]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/32" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-01-02 12:00"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/33" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00", "2024-01-02 12:00 UTC"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19724.5]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/34" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00", "2024-01-02 12:00 UTC"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.500661151113]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/35" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19792.0, 19791.645833333332, 20029.604166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/36" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-03-10 00:00 UTC", "2024-03-10 02:30", "2024-11-03 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19792.000661151113, 19792.104827817777, 20030.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/37" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01 12:00 BRST", "Jan 2"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [
    @date.UnknownTimezone("BRST"),
    @date.UnknownTimezone("BRST"),
  ])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/38" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 BRST", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.500661151113, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [@date.UnknownTimezone("BRST")])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/39" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01", "invalid"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/40" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "invalid"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/41" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["invalid", "2024-01-01"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/42" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["invalid", "2024-01-01"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/43" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(["2024-01-01", "0001-01-01 00:00 +2300"], parser~),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.0, -719162.9583333334]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/44" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01", "0001-01-01 00:00 +2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/45" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["2024-01-01 UTC", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 1)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/46" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 UTC", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/47" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/48" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "9999-12-31 23:30 -2300"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, None)
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/49" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(@date.datestrs2num(["Jan 1", "Jan 2"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20454.0, 20455.0]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/50" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["Jan 1", "Jan 2"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.999272262223, 19724.999272262223]))
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/51" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19819.614583333332, 20001.65625]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/52" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-04-07 01:45", "2024-10-06 02:15"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19820.073577817777, 20002.094411151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/53" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
    ),
  ) catch {
    _ => None
  }
  assert_eq(result, Some([19723.5, 19812.604166666668, 20022.604166666668]))
  assert_eq(calls.val, 4)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/54" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1781524800000L]
  let result = Some(
    @date.datestrs2num(
      ["2024-01-01 12:00 UTC", "2024-03-31 01:30", "2024-10-27 01:30"],
      parser~,
      default_date=@date.parse_iso("2024-01-31T23:58:57.123456"),
    ),
  ) catch {
    _ => None
  }
  assert_eq(
    result,
    Some([19723.500661151113, 19813.063161151113, 20023.063161151113]),
  )
  assert_eq(calls.val, 0)
  assert_eq(parser.warnings(), [])
}

///|
test "string parser original reference: POSIX:LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2/55" {
  let calls = Ref(0)
  let times = Ref([1781524800000L])
  let clock = fn() {
    let index = Int32::min(calls.val, times.val.length() - 1)
    calls.val += 1
    times.val[index]
  }
  let parser = @date.DateStringParser::new(
    context=@date.DateParserContext::from_posix(
      "LHST-10:30LHDT-11,M10.1.0/2,M4.1.0/2",
      clock~,
    ),
  )
  assert_eq(parser.reference_year(), 2026)
  assert_eq(parser.local_names(), ["LHST", "LHDT"])
  assert_eq(parser.local_offsets(), (37800, 39600))
  calls.val = 0
  times.val = [1798761300000L, 1798761700000L, 1798761800000L]
  let result = Some(@date.datestrs2num(["10:00", "11:00"], parser~)) catch {
    _ => None
  }
  assert_eq(result, Some([20819.416666666668, 20819.458333333332]))
  assert_eq(calls.val, 3)
  assert_eq(parser.warnings(), [])
}
