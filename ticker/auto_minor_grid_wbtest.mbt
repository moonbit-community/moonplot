///|
test "AutoMinor unique keeps exact Int64 coordinates and owns a new buffer" {
  let owner = [9007199254740993L, 9007199254740992L, 9007199254740993L]
  let major = TickValues::from_int64_array(owner)
  let unique = auto_minor_unique(major)
  assert_true(unique.is_int64())
  assert_eq(unique.length(), 2)
  assert_eq(unique.get_int64(0), 9007199254740992L)
  assert_eq(unique.get_int64(1), 9007199254740993L)
  assert_eq(
    auto_minor_step(unique, @config.MinorTickDivisions::Number(2.0)),
    0.5,
  )
  unique.set(0, 7.0)
  assert_eq(owner[0], 9007199254740993L)
  assert_eq(owner[1], 9007199254740992L)
}

///|
test "AutoMinor unique sorts a reverse view without modifying its owner" {
  let owner = [1.0, -0.0, 0.0, 3.0, 1.0]
  let major = TickValues::from_array(owner).view(-1, -1, 5)
  let unique = auto_minor_unique(major)
  assert_eq(unique.length(), 3)
  assert_eq(unique.get(0).reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(unique.get(1), 1.0)
  assert_eq(unique.get(2), 3.0)
  unique.set(0, 9.0)
  assert_eq(owner[1].reinterpret_as_uint64(), 0x8000000000000000UL)
  assert_eq(owner[2].reinterpret_as_uint64(), 0UL)
  assert_eq(owner[0], 1.0)
  assert_eq(owner[4], 1.0)
}

///|
test "AutoMinor Python round retains ties and arbitrarily large finite phases" {
  assert_eq(auto_minor_round(2.5), @bigint.BigInt::from_int(2))
  assert_eq(auto_minor_round(3.5), @bigint.BigInt::from_int(4))
  assert_eq(auto_minor_round(-2.5), @bigint.BigInt::from_int(-2))
  assert_eq(auto_minor_round(-3.5), @bigint.BigInt::from_int(-4))
  let huge = auto_minor_round(1.0e308)
  assert_true(huge > @bigint.BigInt::from_int(1) << 1000)
  assert_eq(index_round_binary(huge, 0), 1.0e308)
  let unique = TickValues::from_array([0.0, 1.0])
  let ticks = auto_minor_grid(unique, 1.0, 1.0e308, 1.0e308)
  assert_eq(ticks.length(), 1)
  assert_eq(ticks[0], 1.0e308)
}

///|
test "AutoMinor cap retains the original global phase and prefix endpoint" {
  let unique = TickValues::from_array([1.0, 1.5])
  let step = auto_minor_step(unique, @config.MinorTickDivisions::Number(2.0))
  let ticks = auto_minor_grid(unique, step, -5000.0, 30000.0)
  assert_eq(ticks.length(), 100000)
  assert_eq(ticks[0], -5000.0)
  assert_eq(ticks[1], -4999.75)
  assert_eq(ticks[99999], 19999.75)
}
