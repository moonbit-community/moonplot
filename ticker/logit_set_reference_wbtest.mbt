// Actual builtin set operations; not a port-model oracle.

///|
fn verify_logit_set_step(
  table : LogitLabelled,
  keys : Array[LogitKey],
  op : Int32,
  key : Int32,
  expected : Bool?,
  expected_error : String?,
  retained : Array[Int32],
  size : Int32,
) -> Unit raise {
  let (actual, error) = try {
    let result = if op == 0 {
      table.add(keys[key])
      None
    } else if op == 1 {
      Some(table.contains(keys[key]))
    } else {
      table.clear()
      None
    }
    (result, None)
  } catch {
    @core.DataError::InvalidTicks(message~) => (None, Some(message))
    _ => (None, Some("unexpected error"))
  }
  assert_eq(actual, expected)
  assert_eq(error, expected_error)
  assert_eq(table.table.length(), size)
  let values = table.keys()
  assert_eq(values.length(), retained.length())
  for index, value in values {
    assert_true(physical_equal(value, keys[retained[index]]))
  }
}

///|
fn logit_set_reference_keys() -> Array[LogitKey] {
  let keys : Array[LogitKey] = []
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915854457062986570792968"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915856762905995784486919"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915859068749004998180870"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915861374592014211874821"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915863680435023425568772"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915865986278032639262723"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915868292121041852956674"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915870597964051066650625"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915872903807060280344576"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915875209650069494038527"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915877515493078707732478"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915879821336087921426429"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915882127179097135120380"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915884433022106348814331"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915886738865115562508282"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915889044708124776202233"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1329227995784915891350551133989896184"),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::NumpyFloat64(5147614374084476928UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Number(5147614374084476928UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::NumpyFloat64(14370986410939252736UL.reinterpret_as_double()),
    ),
  )
  keys.push(LogitKey::new(ScalarNumber::Boolean(false)))
  keys.push(LogitKey::new(ScalarNumber::Boolean(true)))
  keys.push(LogitKey::new(ScalarNumber::NumpyBool(false)))
  keys.push(LogitKey::new(ScalarNumber::NumpyBool(true)))
  keys.push(LogitKey::new(ScalarNumber::NumpyInt64(-9223372036854775808L)))
  keys.push(LogitKey::new(ScalarNumber::NumpyInt64(9223372036854775807L)))
  keys.push(LogitKey::new(ScalarNumber::NumpyInt64(-1L)))
  keys.push(LogitKey::new(ScalarNumber::NumpyInt64(0L)))
  keys.push(LogitKey::new(ScalarNumber::NumpyInt64(1L)))
  keys.push(
    LogitKey::new(ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double())),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4591870180066957722UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::NumpyFloat64(4607182418800017408UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::NumpyFloat64(9221120237041090560UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Number(9221120237041090560UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Number(9218868437227405312UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Number(18442240474082181120UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
        ),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560953119369",
        ),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "-9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999522359560952805211",
        ),
      ),
    ),
  )
  keys.push(
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-1"))),
  )
  keys.push(
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-2"))),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Number(4591870180066957722UL.reinterpret_as_double()),
    ),
  )
  keys.push(
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("3"))),
  )
  keys.push(
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("6"))),
  )
  keys.push(
    LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_string("-3"))),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "23058430092136939510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  keys.push(
    LogitKey::new(
      ScalarNumber::Integer(
        @bigint.BigInt::from_string(
          "23058430092136939510000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
        ),
      ),
    ),
  )
  keys.push(LogitKey::new(ScalarNumber::Number(0UL.reinterpret_as_double())))
  keys.push(
    LogitKey::new(ScalarNumber::NumpyFloat64(0UL.reinterpret_as_double())),
  )
  keys.push(keys[22])
  keys
}

///|
fn logit_set_reference_case_0() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [17, 23], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [17, 23], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [17, 23, 25], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(true), None, [17, 23, 25], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [17, 23, 25], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [17, 23, 25], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(true), None, [17, 23, 25], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [17, 23, 25, 24], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [17, 23, 25, 24],
    8,
  )
  verify_logit_set_step(table, keys, 0, 1, None, None, [17, 23, 25, 24], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [17, 23, 25, 24],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [17, 23, 25, 24],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [17, 23, 25, 24],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [17, 23, 25, 24],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [17, 23, 19, 25, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(true),
    None,
    [17, 23, 19, 25, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [17, 23, 19, 25, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(true),
    None,
    [17, 23, 19, 25, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [17, 23, 19, 25, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [17, 23, 19, 25, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [17, 23, 19, 25, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [17, 23, 19, 25, 22, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [17, 23, 19, 25, 22, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [17, 23, 19, 25, 22, 42, 44, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [17, 23, 19, 25, 22, 42, 44, 43, 38, 35, 36, 40, 39, 24, 45, 41],
    32,
  )
}

///|
fn logit_set_reference_case_1() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [31], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(true), None, [31], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19, 31], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [19, 31, 42], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [19, 31, 42, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [19, 31, 42, 39],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [19, 31, 42, 39],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [19, 31, 42, 39],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [19, 31, 42, 12, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [19, 31, 42, 12, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [19, 31, 42, 12, 29, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [19, 31, 42, 12, 29, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 35, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 35, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 35, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 15, 35, 38, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 15, 35, 38, 36, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 15, 35, 38, 36, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 15, 35, 38, 36, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [19, 31, 42, 12, 29, 13, 2, 44, 11, 43, 18, 15, 35, 38, 36, 26, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 35, 38, 42, 36, 41, 39, 26],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 35, 38, 42, 36, 41, 39, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 35, 38, 42, 36, 41, 39, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 35, 38, 42, 36, 41, 39,
      26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 35, 38, 42, 36, 41, 39,
      26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 35, 38, 42, 36, 41, 39,
      26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 35, 38, 42, 36, 41,
      39, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 35, 38, 42, 36, 41,
      39, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 35, 38, 42, 36, 41,
      39, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 35, 38, 42, 36, 41,
      39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 35, 38, 42, 36, 41,
      39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 35, 38, 42, 36,
      41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 35, 38, 42, 36,
      41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 35, 38, 42, 36,
      41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 35, 38, 42, 36,
      41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 35, 38, 42, 36,
      41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 6, 35, 38, 42,
      36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 6, 35, 38, 42,
      36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 6, 9, 35, 38,
      42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 6, 9, 5, 35,
      38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 6, 9, 5, 35,
      38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 6, 9, 5, 35,
      38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 6, 9, 5, 35,
      38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 3, 6, 9, 5, 35,
      38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(true),
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 35, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 35, 38, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [
      19, 31, 12, 29, 13, 2, 44, 11, 43, 18, 15, 7, 4, 1, 16, 0, 25, 3, 6, 9, 5,
      10, 14, 35, 38, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
}

///|
fn logit_set_reference_case_2() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [20, 44], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [20, 44], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [20, 44], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [20, 44], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(true), None, [20, 44], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [20, 15, 44], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [20, 15, 44], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [20, 15, 44, 11], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [20, 15, 44, 11],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [20, 15, 44, 11],
    8,
  )
  verify_logit_set_step(table, keys, 0, 17, None, None, [20, 15, 44, 11], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [20, 15, 44, 11],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [20, 15, 21, 11, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [20, 15, 21, 11, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [20, 15, 21, 11, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [20, 15, 21, 11, 8, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [20, 15, 21, 11, 8, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [20, 15, 21, 11, 8, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [20, 15, 21, 11, 8, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [20, 15, 21, 11, 8, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [20, 15, 21, 11, 8, 44, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [20, 15, 21, 11, 8, 44, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [20, 15, 21, 11, 8, 44, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(true),
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 35, 24, 39],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 37, 35, 24, 39],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 37, 35, 42, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 24,
      39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 24,
      39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 40,
      24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 40,
      24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 40,
      24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 40,
      24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 40,
      24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 40,
      24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 40,
      24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 40,
      24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 36,
      40, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 36,
      40, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 36,
      40, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 36,
      40, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 36,
      40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 36,
      40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 36,
      40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 35, 42, 36,
      40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 42,
      36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 42,
      36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 42,
      36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 42,
      36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 42,
      36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 42,
      36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 42,
      36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 38,
      42, 36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 38,
      42, 36, 40, 41, 24, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 35, 38,
      42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 35,
      38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 35,
      38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 35,
      38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 35,
      38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 35,
      38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 35,
      38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      14, 35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      14, 35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      14, 35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      14, 35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(true),
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      14, 35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      14, 35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      14, 0, 35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [
      20, 15, 21, 11, 8, 7, 44, 10, 43, 19, 6, 9, 4, 16, 2, 5, 25, 37, 1, 13, 12,
      14, 0, 3, 35, 38, 42, 36, 40, 41, 24, 45, 39,
    ],
    128,
  )
}

///|
fn logit_set_reference_case_3() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [10], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [10, 26], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [10, 26], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [10, 26], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [10, 26], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [10, 37, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    Some("OverflowError: int too large to convert to float"),
    [10, 37, 26],
    8,
  )
  verify_logit_set_step(table, keys, 0, 1, None, None, [10, 37, 26, 1], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [10, 37, 20, 1, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(table, keys, 0, 27, None, None, [10, 37, 20, 1, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [10, 37, 20, 1, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [10, 37, 20, 1, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [10, 37, 20, 1, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [10, 37, 20, 1, 2, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [10, 37, 20, 1, 2, 12, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [10, 37, 20, 1, 2, 12, 0, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [10, 37, 20, 1, 2, 12, 0, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 38, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 11, 38, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(true),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 11, 38, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(true),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 11, 38, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(true),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 11, 38, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 11, 19, 38, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 11, 19, 14, 38, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 42, 7, 11, 19, 14, 16, 38, 36, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 38, 42, 36, 24, 26],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 38, 42, 36, 24, 26],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 38, 42, 36, 24, 26],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 38, 42, 36, 24, 26],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 38, 42, 36, 24, 26],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 38, 42, 36, 24, 26],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 38, 42, 36, 41, 24,
      26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 38, 42, 36, 41, 39,
      24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 43, 38, 42, 36, 41,
      39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 43, 38, 42, 36, 41,
      39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 43, 38, 42, 36, 41,
      39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 43, 38, 42, 36, 41,
      39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 38, 42, 36,
      41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 15, 38, 42,
      36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 15, 9, 38, 42,
      36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 15, 9, 3, 38,
      42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 15, 9, 3, 5,
      38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 15, 9, 3, 5,
      38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 15, 9, 3, 5,
      38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 35, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 35, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    None,
    Some("OverflowError: int too large to convert to float"),
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 35, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 38, 35, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [
      10, 37, 20, 1, 2, 12, 0, 28, 7, 11, 19, 14, 16, 44, 18, 4, 43, 25, 15, 9, 3,
      5, 6, 13, 38, 35, 42, 36, 41, 39, 24, 45, 26,
    ],
    128,
  )
}

///|
fn logit_set_reference_case_4() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3, 37], 8)
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [30, 16], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [30, 16], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [30, 16, 1], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [30, 16, 1, 27], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [30, 16, 5, 1, 27], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [30, 16, 5, 1, 27],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [30, 16, 5, 1, 27],
    32,
  )
  verify_logit_set_step(table, keys, 2, 41, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [3, 5], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [3, 5, 14], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [3, 5, 14], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [3, 5, 14, 12], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [3, 5, 14, 12, 38], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [3, 5, 14, 12, 11, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [3, 5, 14, 12, 11, 7, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [3, 5, 14, 12, 11, 7, 38, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [28, 26], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [4], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [4, 1], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [4, 1], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [4, 1], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [4, 1], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [4, 1], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [4, 1, 35], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [4, 1, 35], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [4, 1, 43, 35], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [4, 1, 28, 43, 35], 32)
  verify_logit_set_step(table, keys, 0, 21, None, None, [4, 1, 28, 43, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [4, 1, 28, 43, 5, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [4, 1, 28, 43, 5, 35],
    32,
  )
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [22, 12], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [22, 12, 44], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [22, 12, 44], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [22, 12, 44], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [22, 12, 44, 11], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [22, 12, 44, 11],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [22, 12, 11, 43, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [22, 12, 11, 43, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [22, 12, 11, 43, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [22, 12, 11, 43, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [22, 12, 11, 43, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [22, 12, 11, 43, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [22, 12, 11, 43, 44, 38, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [22, 12, 11, 43, 44, 38, 39, 40],
    32,
  )
}

///|
fn logit_set_reference_case_5() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [3, 43], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [1, 39], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [1, 39], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [1, 12, 39], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [1, 12, 39], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [1, 12, 39], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [1, 12, 39], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [1, 12, 39], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [1, 12, 42, 39], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [1, 12, 42, 44, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [1, 12, 42, 14, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [1, 12, 42, 14, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [1, 12, 42, 14, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [1, 12, 42, 14, 19, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [1, 12, 42, 14, 19, 11, 44, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 35, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(true),
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 36, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 36, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [1, 12, 42, 14, 19, 11, 44, 25, 4, 21, 18, 27, 3, 35, 36, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [1, 12, 14, 19, 11, 25, 44, 4, 21, 18, 27, 3, 9, 35, 42, 36, 39, 24, 40],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [1, 12, 14, 19, 11, 25, 44, 4, 21, 18, 27, 3, 9, 35, 42, 36, 39, 24, 40],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [1, 12, 14, 19, 11, 25, 44, 4, 21, 18, 27, 3, 9, 7, 35, 42, 36, 39, 24, 40],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [1, 12, 14, 19, 11, 25, 44, 4, 21, 18, 27, 3, 9, 7, 35, 42, 36, 39, 24, 40],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [1, 12, 14, 19, 11, 25, 44, 4, 21, 18, 27, 3, 9, 7, 35, 42, 36, 39, 24, 40],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [1, 12, 14, 19, 11, 25, 44, 4, 21, 18, 27, 3, 9, 7, 35, 42, 36, 39, 24, 40],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [1, 12, 14, 19, 11, 25, 44, 4, 21, 18, 27, 3, 9, 7, 35, 42, 36, 39, 24, 40],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [1, 12, 14, 19, 11, 25, 44, 4, 21, 18, 27, 3, 9, 7, 35, 42, 36, 39, 24, 40],
    128,
  )
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 24], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [9, 24], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [9, 24], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [9, 24], 8)
}

///|
fn logit_set_reference_case_6() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [1, 12], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [1, 12, 3], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [1, 12, 30, 3], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [1, 12, 30, 3],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [1, 12, 30, 3],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [1, 12, 30, 3],
    8,
  )
  verify_logit_set_step(table, keys, 0, 21, None, None, [1, 12, 30, 3, 21], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [1, 12, 30, 3, 21, 9],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [1, 12, 30, 3, 21, 9],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [1, 12, 30, 3, 21, 9],
    32,
  )
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [37], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29, 37], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [29, 37, 3], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [29, 37, 3], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [29, 37, 3], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [29, 37, 3], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [29, 37, 3], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [29, 37, 3, 6], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(true), None, [29, 37, 3, 6], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [29, 37, 3, 6],
    8,
  )
  verify_logit_set_step(table, keys, 2, 28, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23, 38], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [23, 38], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [23, 36, 38], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20, 23, 36, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [20, 23, 36, 38],
    8,
  )
  verify_logit_set_step(table, keys, 0, 6, None, None, [20, 23, 6, 38, 36], 32)
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 35], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [9, 35], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [9, 40, 35], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [9, 2, 40, 35], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [9, 2, 35, 45, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [9, 2, 37, 35, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [9, 2, 37, 35, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [9, 2, 37, 13, 35, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [9, 2, 37, 13, 35, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [9, 2, 37, 13, 35, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [9, 2, 37, 13, 35, 38, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [9, 2, 37, 13, 14, 35, 38, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [9, 2, 37, 13, 14, 35, 38, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    None,
    Some("OverflowError: int too large to convert to float"),
    [9, 2, 37, 13, 14, 35, 38, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [9, 2, 37, 13, 14, 35, 38, 45, 40],
    32,
  )
}

///|
fn logit_set_reference_case_7() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [9, 23], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [9, 23, 6], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(true), None, [9, 23, 6], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [9, 23, 6], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [9, 23, 6], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [9, 23, 6, 1], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [9, 23, 6, 1], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [9, 23, 6, 1], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [9, 23, 29, 6, 1], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(true),
    None,
    [9, 23, 29, 6, 1],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [9, 23, 29, 6, 1, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [9, 23, 29, 6, 1, 3, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [9, 23, 29, 6, 1, 3, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [9, 23, 29, 6, 1, 3, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 44, 5, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 44, 5, 2, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 44, 5, 2, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [9, 23, 29, 6, 1, 3, 44, 5, 2, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 44, 5, 2, 16, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 44, 5, 2, 16, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [9, 23, 29, 6, 1, 3, 44, 5, 2, 16, 36, 45, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12, 40], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12, 40], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [12, 6, 40], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [12, 6, 40, 19], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [12, 6, 40, 19],
    8,
  )
  verify_logit_set_step(table, keys, 0, 25, None, None, [12, 6, 19, 25, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [12, 6, 19, 25, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [12, 6, 19, 25, 4, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [12, 6, 19, 25, 4, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [12, 6, 19, 25, 4, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [12, 6, 19, 25, 4, 41, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35, 38], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 35, 38], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [13, 42, 35, 38], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [13, 5, 42, 35, 38], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [13, 5, 42, 44, 35, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [13, 5, 42, 31, 44, 35, 38],
    32,
  )
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
}

///|
fn logit_set_reference_case_8() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [8, 4], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [8, 4, 2], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [8, 4, 25, 2], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [8, 4, 2, 25, 20], 32)
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [25], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1, 25], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [1, 25], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [1, 25, 40], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [1, 25, 40], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [1, 25, 40], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [1, 5, 25, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [1, 5, 25, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 17, None, None, [1, 5, 25, 40], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [1, 5, 25, 40], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [1, 5, 25, 40], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [1, 5, 21, 25, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [1, 5, 21, 25, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [1, 5, 21, 25, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [1, 5, 21, 25, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [1, 5, 21, 25, 18, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [1, 5, 21, 25, 18, 14, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [39], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [39], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18, 39], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [18, 1, 39], 8)
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2, 44], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(true), None, [2, 44], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [2, 44], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [2, 44, 39], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [2, 44, 39], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [2, 16, 44, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [2, 16, 44, 39],
    8,
  )
  verify_logit_set_step(table, keys, 1, 2, Some(true), None, [2, 16, 44, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [2, 16, 44, 39],
    8,
  )
  verify_logit_set_step(table, keys, 0, 26, None, None, [2, 16, 44, 39, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [2, 16, 44, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [2, 16, 44, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [2, 16, 19, 44, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [2, 16, 19, 8, 44, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [2, 16, 19, 8, 5, 44, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [2, 16, 19, 8, 5, 25, 44, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [2, 16, 19, 8, 5, 25, 44, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [2, 16, 19, 8, 5, 25, 44, 23, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [2, 16, 19, 8, 5, 25, 44, 23, 0, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [2, 16, 19, 8, 5, 25, 44, 23, 0, 39, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [2, 16, 19, 8, 5, 25, 44, 23, 0, 39, 24, 26],
    32,
  )
}

///|
fn logit_set_reference_case_9() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [18], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [18, 23], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [18, 23, 13], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [18, 23, 13], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [18, 23, 13, 1], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [18, 23, 13, 1],
    8,
  )
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [11, 31], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [11, 31], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [11, 31, 36], 8)
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [28, 44], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 28, 44], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [8, 28, 44], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [8, 28, 44], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [8, 28, 44, 29], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [8, 28, 44, 29], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [8, 28, 44, 29],
    8,
  )
  verify_logit_set_step(table, keys, 0, 31, None, None, [8, 28, 44, 29], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [36], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30, 36], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [30, 36], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [30, 36, 17], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [30, 36, 17], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(true), None, [30, 36, 17], 8)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [20], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [20, 12], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [20, 12], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [20, 12], 8)
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [20, 42], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [20, 42, 26], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [20, 42, 26], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [20, 42, 26, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [20, 42, 26, 39],
    8,
  )
  verify_logit_set_step(table, keys, 0, 30, None, None, [20, 42, 26, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [20, 42, 26, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [20, 42, 26, 39, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [20, 42, 26, 39, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [20, 42, 17, 26, 39, 45, 41],
    32,
  )
}

///|
fn logit_set_reference_case_10() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [2, 38], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [2, 38], 8)
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 41], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [13, 14, 41], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [13, 14, 41], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(true), None, [13, 14, 41], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [13, 14, 41], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [13, 14, 41, 15], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [13, 14, 41, 15],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [13, 14, 42, 15, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [13, 14, 42, 15, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [13, 14, 42, 15, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [13, 14, 42, 15, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [13, 14, 42, 15, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [13, 14, 42, 15, 2, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [13, 14, 42, 15, 2, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [13, 14, 42, 15, 2, 38, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [13, 14, 42, 15, 2, 38, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [13, 14, 42, 15, 2, 38, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [13, 14, 42, 15, 2, 12, 38, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [13, 14, 42, 15, 2, 12, 38, 40, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [13, 14, 42, 15, 2, 12, 38, 40, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [13, 14, 42, 15, 2, 12, 3, 38, 40, 24, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [20], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [20, 21], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [20, 21], 8)
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 37], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [13, 37], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [13, 37, 16], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [13, 37, 16], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [13, 37, 16], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [13, 37, 16], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [13, 37, 16], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [13, 37, 16], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [13, 37, 16], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [13, 37, 30, 16], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [13, 37, 30, 16],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [13, 37, 30, 16, 22],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [13, 37, 30, 16, 22],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [13, 37, 30, 16, 22],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [13, 37, 30, 16, 22],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [13, 37, 30, 16, 22],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [13, 37, 30, 16, 22],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [13, 37, 30, 16, 22, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [13, 37, 30, 16, 22, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [13, 37, 30, 16, 22, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [13, 37, 30, 16, 22, 4, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [13, 37, 30, 16, 22, 4, 25, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [13, 37, 30, 16, 22, 4, 25, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [13, 37, 30, 16, 22, 4, 25, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [13, 37, 30, 16, 22, 4, 25, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(true),
    None,
    [13, 37, 30, 16, 22, 4, 25, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [13, 37, 30, 16, 22, 4, 25, 35, 40],
    32,
  )
}

///|
fn logit_set_reference_case_11() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [29, 17], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [29, 17], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(true), None, [29, 17], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [29, 17], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [29, 17, 45], 8)
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [13], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [13, 42], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [13, 42], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [13, 27, 42], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [13, 27, 42], 8)
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [1, 9], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5, 40], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [5, 9, 40], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [5, 9, 40, 21], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [5, 9, 40, 21], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [5, 9, 21, 44, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [5, 9, 21, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [5, 9, 21, 22, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [5, 9, 21, 22, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [5, 9, 21, 22, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [5, 9, 21, 22, 25, 44, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [15, 39], 8)
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [28], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [28], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3, 28], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [3, 28], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [3, 28, 35], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [3, 28, 0, 35], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [3, 28, 0, 35], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [3, 28, 0, 35, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [3, 28, 0, 2, 35, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [31, 43], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [31, 43, 41], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [31, 43, 41], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10, 31, 43, 41], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [10, 31, 43, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [10, 31, 43, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [10, 31, 13, 43, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [10, 31, 13, 43, 19, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [10, 31, 13, 43, 19, 29, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [10, 31, 13, 43, 19, 29, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [10, 31, 13, 43, 19, 29, 18, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [10, 31, 13, 43, 19, 29, 18, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [10, 31, 13, 43, 19, 29, 18, 40, 41],
    32,
  )
}

///|
fn logit_set_reference_case_12() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1, 41], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [1, 2, 41], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [1, 2, 41], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [1, 2, 41, 15], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(true), None, [1, 2, 41, 15], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [1, 2, 15, 25, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [1, 2, 15, 25, 28, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [1, 2, 15, 25, 28, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [1, 2, 15, 25, 28, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [1, 2, 15, 25, 28, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 43, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [42], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [42], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [42, 37], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 43], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [8, 43], 8)
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [42], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [42, 22], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [42, 22], 8)
  verify_logit_set_step(table, keys, 2, 17, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [36], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [36, 31], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 36, 31], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [7, 36, 31], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [7, 36, 31, 35], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [7, 36, 31, 35], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [7, 15, 31, 35, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [7, 15, 31, 35, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [7, 15, 31, 20, 35, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [7, 15, 31, 20, 35, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [7, 15, 31, 20, 35, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [7, 15, 31, 20, 35, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [7, 15, 31, 20, 2, 35, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [7, 15, 31, 20, 2, 35, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(true),
    None,
    [7, 15, 31, 20, 2, 35, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [7, 15, 31, 20, 2, 14, 35, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [7, 15, 31, 20, 2, 14, 35, 36, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [4, 15], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [4, 15, 19], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [4, 15, 43, 19], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [4, 15, 43, 19],
    8,
  )
  verify_logit_set_step(table, keys, 0, 23, None, None, [4, 15, 19, 43, 23], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [4, 15, 19, 43, 23],
    32,
  )
}

///|
fn logit_set_reference_case_13() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [0], 8)
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 35], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [17, 35], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [17, 20, 35], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [17, 20, 35], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [17, 20, 30, 35], 8)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 38], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [7, 38], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [7, 38], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(true), None, [7, 38], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [7, 38], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [7, 38], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [7, 38], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [7, 38], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [7, 45, 38], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [7, 45, 38], 8)
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [0], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [0, 37], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [0, 37], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [0, 37], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [0, 37, 29], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [0, 37, 29], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [0, 37, 43, 29], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [0, 37, 43, 29],
    8,
  )
  verify_logit_set_step(table, keys, 0, 20, None, None, [0, 37, 43, 29], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [0, 37, 43, 29],
    8,
  )
  verify_logit_set_step(table, keys, 0, 26, None, None, [0, 37, 29, 43, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [0, 37, 29, 43, 13, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [0, 37, 29, 43, 13, 19, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [0, 37, 29, 43, 13, 19, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [0, 37, 29, 43, 13, 19, 2, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [0, 37, 29, 43, 13, 19, 2, 25, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [0, 37, 29, 43, 13, 19, 2, 25, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [0, 37, 29, 43, 13, 19, 2, 25, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42], 8)
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [11, 6], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [11, 6], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [11, 6], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [11, 6], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [11, 6], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [11, 6], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [11, 6], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [11, 6], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [11, 6], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [11, 6, 21], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [11, 6, 21, 0], 8)
}

///|
fn logit_set_reference_case_14() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [7], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(true), None, [7], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [7, 23], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [7, 23], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [7, 23, 30], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [7, 23, 30], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [7, 23, 30],
    8,
  )
  verify_logit_set_step(table, keys, 1, 42, Some(true), None, [7, 23, 30], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [7, 23, 30, 0], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [7, 23, 30, 0], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(true), None, [7, 23, 30, 0], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [7, 23, 30, 0],
    8,
  )
  verify_logit_set_step(table, keys, 0, 22, None, None, [7, 23, 30, 0, 22], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [7, 23, 30, 0, 22],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(true),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [7, 23, 30, 0, 22, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [7, 23, 30, 0, 22, 2, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [7, 23, 30, 0, 22, 2, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [7, 23, 30, 0, 22, 2, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [7, 23, 30, 0, 22, 2, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [7, 23, 30, 0, 22, 2, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [7, 23, 30, 0, 22, 2, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [7, 23, 30, 0, 22, 2, 38, 24],
    32,
  )
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36, 25], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [36, 25, 35], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1, 36, 25, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [1, 36, 25, 35],
    8,
  )
  verify_logit_set_step(table, keys, 0, 6, None, None, [1, 6, 25, 35, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [1, 6, 25, 35, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [27, 15], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [27, 15, 30], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [27, 15, 30, 14], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [27, 15, 30, 14, 21],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [27, 15, 30, 14, 21],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [27, 15, 30, 14, 21, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [27, 15, 30, 14, 21, 10, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [27, 15, 30, 14, 21, 10, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [27, 15, 30, 14, 21, 10, 4, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [27, 15, 30, 14, 21, 10, 4, 11, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [27, 15, 30, 14, 21, 10, 4, 11, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [27, 15, 30, 14, 21, 10, 4, 11, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [27, 15, 30, 14, 21, 10, 4, 11, 35],
    32,
  )
}

///|
fn logit_set_reference_case_15() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3, 31], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [3, 31], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [3, 31], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [3, 31], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [3, 31], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [3, 31], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [3, 31, 15], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [3, 31, 15, 8], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [3, 31, 15, 8],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [3, 31, 15, 8],
    8,
  )
  verify_logit_set_step(table, keys, 0, 22, None, None, [3, 31, 22, 15, 8], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [3, 31, 22, 15, 8, 19],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [3, 31, 22, 15, 8, 19],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [3, 31, 22, 15, 8, 19, 1],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [3, 31, 22, 15, 8, 19, 1],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [3, 31, 22, 15, 8, 19, 1],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [3, 31, 22, 15, 8, 19, 1],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [3, 31, 22, 15, 8, 19, 1],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [3, 31, 22, 15, 8, 19, 1],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [3, 31, 22, 15, 8, 19, 1, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 43, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [5, 23], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [5, 23, 6], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [5, 23, 45, 6], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [5, 23, 45, 6],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [5, 23, 45, 6],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [5, 23, 45, 6],
    8,
  )
  verify_logit_set_step(table, keys, 0, 19, None, None, [5, 23, 6, 19, 45], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [5, 23, 6, 19, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [5, 23, 6, 19, 4, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [5, 23, 6, 19, 4, 43, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [1, 26], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [1, 43, 26], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [1, 43, 26], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [1, 9, 43, 26], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [1, 9, 23, 43, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [1, 9, 23, 43, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 28, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [11, 23], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [11, 23], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [11, 23, 43], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [11, 23, 43], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [11, 23, 43], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [11, 23, 43], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [11, 23, 43, 1], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [11, 23, 1, 43, 45], 32)
  verify_logit_set_step(table, keys, 0, 21, None, None, [11, 23, 1, 43, 45], 32)
  verify_logit_set_step(table, keys, 2, 17, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [8, 5], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(true), None, [8, 5], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [8, 5], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(true), None, [8, 5], 8)
}

///|
fn logit_set_reference_case_16() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [45], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [45], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [45, 26], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2, 45, 26], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [2, 37, 45, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [2, 37, 45, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [2, 37, 45, 26],
    8,
  )
  verify_logit_set_step(table, keys, 0, 37, None, None, [2, 37, 45, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [2, 37, 45, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [2, 37, 45, 26],
    8,
  )
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37, 40], 8)
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [10, 36], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [10, 36], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [10, 36, 37], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(true), None, [10, 36, 37], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [10, 36, 37], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [10, 36, 37], 8)
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 37], 8)
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 37], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(true), None, [17, 37], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [17, 37], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [17, 37, 30], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [17, 37, 30], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(true), None, [17, 37, 30], 8)
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [28], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [28], 8)
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 40], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [7, 40, 39], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(true), None, [7, 40, 39], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [7, 19, 40, 39], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [7, 19, 39, 45, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [7, 19, 39, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [7, 19, 39, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [7, 19, 39, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [7, 19, 27, 39, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [7, 19, 27, 12, 39, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [7, 19, 27, 12, 39, 45, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [24], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 24], 8)
}

///|
fn logit_set_reference_case_17() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [30], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [30, 19], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [30, 19], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [30, 19], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [30, 19], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [30, 19], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [30, 19, 39], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [30, 19, 39, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [30, 19, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [30, 19, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [30, 19, 2, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [30, 19, 2, 37, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [30, 19, 2, 37, 16, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [30, 19, 2, 37, 16, 3, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [30, 19, 2, 37, 16, 3, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [30, 19, 2, 37, 16, 3, 0, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [30, 19, 2, 37, 16, 3, 0, 29, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [30, 19, 2, 37, 16, 3, 0, 29, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [30, 19, 2, 37, 16, 3, 0, 29, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [30, 19, 2, 37, 16, 3, 0, 29, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [30, 19, 2, 37, 16, 3, 0, 29, 35, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [30, 19, 2, 37, 16, 3, 0, 29, 35, 39, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [10], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [10], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [10], 8)
  verify_logit_set_step(table, keys, 2, 41, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [10, 44], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [10, 44], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [10, 44], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [10, 7, 44], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [10, 7, 44, 38], 8)
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 2, 43, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [20], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [20], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(true), None, [20], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [20, 24], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [20, 14, 24], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [20, 14, 24, 19], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [20, 14, 24, 19], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [20, 14, 19, 23, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [20, 14, 19, 23, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [20, 14, 19, 23, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [20, 14, 19, 23, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [20, 14, 19, 23, 35, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [20, 14, 19, 23, 8, 35, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [20, 14, 19, 23, 8, 35, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [20, 14, 19, 23, 8, 35, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [20, 14, 19, 23, 8, 13, 35, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [20, 14, 19, 23, 8, 13, 42, 35, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [20, 14, 19, 23, 8, 13, 42, 16, 35, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [20, 14, 19, 23, 8, 13, 42, 16, 5, 35, 38, 24],
    32,
  )
}

///|
fn logit_set_reference_case_18() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25, 41], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [25, 41, 26], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30, 25, 41, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [30, 25, 41, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [30, 12, 25, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [30, 12, 11, 25, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [30, 12, 11, 25, 8, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [30, 12, 11, 25, 8, 3, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [30, 12, 11, 25, 8, 3, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [30, 12, 11, 25, 8, 3, 31, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [30, 12, 11, 25, 8, 3, 31, 26, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41, 35], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0, 41, 35], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [0, 41, 35], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [0, 41, 35], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [0, 11, 41, 35], 8)
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [0, 9], 8)
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 38], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [16, 38], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [16, 38], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [16, 38], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [16, 38], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [16, 8, 38], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [16, 8, 28, 38], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [16, 8, 5, 28, 38], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [16, 8, 5, 28, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [16, 8, 5, 28, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [16, 8, 5, 28, 27, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [16, 8, 5, 28, 27, 19, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [16, 8, 5, 28, 27, 19, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [16, 8, 5, 28, 27, 19, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [16, 8, 5, 28, 27, 19, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [16, 8, 5, 28, 27, 19, 7, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [16, 8, 5, 28, 27, 19, 7, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [16, 8, 5, 28, 27, 19, 7, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [16, 8, 5, 28, 27, 19, 7, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [16, 8, 5, 28, 27, 19, 7, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [16, 8, 5, 28, 27, 19, 7, 15, 38],
    32,
  )
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [0], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [0], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [0, 4], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [0, 4], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [0, 4, 27], 8)
}

///|
fn logit_set_reference_case_19() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [30, 11], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [30, 11, 10], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [30, 11, 10, 16], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [30, 11, 10, 16],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [30, 11, 10, 16],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [30, 11, 10, 16, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [30, 11, 10, 16, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [30, 11, 10, 16, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [30, 11, 10, 16, 5, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [30, 11, 10, 16, 5, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [30, 11, 10, 16, 5, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [30, 11, 10, 16, 5, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [30, 11, 10, 16, 5, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [30, 11, 10, 16, 5, 43, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [30, 11, 10, 16, 5, 43, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [30, 11, 10, 16, 5, 43, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(false),
    None,
    [30, 11, 10, 16, 5, 43, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [30, 11, 10, 16, 5, 43, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [30, 11, 10, 16, 5, 43, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [30, 11, 10, 16, 5, 43, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [30, 11, 10, 16, 5, 43, 14, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [30, 11, 10, 16, 5, 43, 14, 22, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [30, 11, 10, 16, 5, 43, 14, 22, 38, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [30, 11, 10, 16, 5, 43, 14, 22, 38, 36, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [1, 5], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [1, 5, 20], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [1, 5, 20], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [1, 5, 30, 20], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [1, 5, 30, 20, 4], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [1, 5, 30, 20, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [1, 5, 30, 20, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [1, 5, 30, 20, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [1, 5, 30, 20, 4, 28],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [1, 5, 30, 20, 4, 28],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [1, 5, 30, 20, 4, 28],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [1, 5, 30, 20, 4, 28, 10],
    32,
  )
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15], 8)
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [8, 11], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [8, 11], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [8, 11, 19], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [8, 11, 43, 19], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [8, 11, 43, 19],
    8,
  )
  verify_logit_set_step(table, keys, 0, 9, None, None, [8, 11, 19, 43, 9], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [8, 11, 19, 43, 9],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
}

///|
fn logit_set_reference_case_20() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(true), None, [9], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [9, 21], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [9, 21], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [9, 21], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(true), None, [9, 21], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(true), None, [9, 21], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [9, 21, 41], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [9, 21, 41], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [9, 21, 41], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [9, 21, 41], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [9, 21, 41, 19], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [9, 21, 19, 44, 41], 32)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14, 25], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [14, 25], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [14, 25], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [14, 25], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [14, 31, 25], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(true), None, [14, 31, 25], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [14, 31, 25, 13], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [14, 31, 13, 25, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [14, 31, 13, 25, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [14, 31, 13, 25, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [14, 31, 13, 25, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [14, 31, 13, 25, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [14, 31, 13, 25, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [14, 31, 13, 25, 44, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [14, 31, 13, 25, 44, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [14, 31, 13, 25, 44, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [14, 31, 13, 25, 44, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [14, 31, 13, 25, 44, 41, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [0], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [0, 31], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [0, 31, 10], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [0, 31, 10, 29], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(true), None, [0, 31, 10, 29], 8)
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [5], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [5, 30], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [5, 30], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [5, 30], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(true), None, [5, 30], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [5, 30], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [5, 18, 30], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [5, 18, 30], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [5, 18, 30, 36], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [5, 18, 30, 36],
    8,
  )
  verify_logit_set_step(table, keys, 0, 36, None, None, [5, 18, 30, 36], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [5, 18, 30, 1, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [5, 18, 30, 1, 15, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [5, 18, 30, 1, 15, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [5, 18, 30, 1, 15, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [5, 18, 30, 1, 15, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [5, 18, 30, 1, 15, 38, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [5, 18, 30, 1, 15, 38, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [5, 18, 30, 1, 15, 38, 36, 24],
    32,
  )
}

///|
fn logit_set_reference_case_21() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [2, 13], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [2, 13], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [2, 13, 7], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [2, 13, 36, 7], 8)
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 24], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [9, 18, 24], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 18, 24], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4, 45], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [4, 16, 45], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(true), None, [4, 16, 45], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [4, 16, 45], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [4, 16, 45, 13], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [4, 16, 45, 13],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [4, 16, 45, 13],
    8,
  )
  verify_logit_set_step(table, keys, 0, 10, None, None, [4, 16, 13, 10, 45], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [4, 16, 13, 10, 29, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [4, 16, 13, 10, 29, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [4, 16, 13, 10, 29, 9, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [4, 16, 13, 10, 29, 9, 15, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [4, 16, 13, 10, 29, 9, 15, 28, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [4, 16, 13, 10, 29, 9, 15, 28, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [4, 16, 13, 10, 29, 9, 15, 28, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [4, 16, 13, 10, 29, 9, 15, 28, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [4, 16, 13, 10, 29, 9, 15, 28, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [4, 16, 13, 10, 29, 9, 15, 28, 43, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [4, 16, 13, 10, 29, 9, 15, 28, 43, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 37, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [4, 44], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [4, 44], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [4, 42, 44], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [4, 42, 44], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [4, 42, 44], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [4, 42, 44, 41], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [4, 29, 42, 44, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [4, 29, 42, 44, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [4, 29, 42, 15, 44, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [4, 29, 42, 15, 11, 44, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [29, 38], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [29, 8, 38], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [29, 8, 6, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [29, 8, 6, 38],
    8,
  )
  verify_logit_set_step(table, keys, 0, 23, None, None, [29, 8, 23, 6, 38], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [29, 8, 23, 6, 38],
    32,
  )
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [43], 8)
}

///|
fn logit_set_reference_case_22() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [1], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [1, 42], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [1, 42], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [1, 12, 42], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [1, 12, 42], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [1, 12, 42, 2], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [1, 12, 42, 2, 10], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [1, 12, 42, 2, 10, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [1, 12, 42, 2, 10, 43, 3],
    32,
  )
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45, 40], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [45, 40], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [45, 40], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10, 45, 40], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [10, 27, 45, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [10, 27, 45, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 6, None, None, [10, 27, 6, 45, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [10, 27, 6, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [10, 27, 6, 35, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [10, 27, 6, 35, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [10, 27, 6, 23, 35, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [10, 27, 6, 23, 35, 45, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 26], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [8, 26], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [8, 23, 26], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [8, 23, 26], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [8, 23, 26], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [8, 23, 26, 4], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [8, 23, 26, 4],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [8, 23, 26, 4],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [8, 23, 26, 4],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [8, 23, 26, 4],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [8, 23, 26, 4],
    8,
  )
  verify_logit_set_step(table, keys, 0, 3, None, None, [8, 23, 3, 4, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [8, 23, 3, 4, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [8, 23, 3, 4, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [8, 23, 3, 4, 12, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [8, 23, 3, 4, 12, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [8, 23, 3, 4, 12, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [8, 23, 3, 4, 12, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [8, 23, 3, 4, 12, 2, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [8, 23, 3, 4, 12, 2, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [8, 23, 3, 4, 12, 2, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [8, 23, 3, 4, 12, 2, 29, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [8, 23, 3, 4, 12, 2, 29, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [8, 23, 3, 4, 12, 2, 29, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [8, 23, 3, 4, 12, 2, 29, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [8, 23, 3, 4, 12, 2, 29, 25, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [8, 23, 3, 4, 12, 2, 29, 25, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [8, 23, 3, 4, 12, 2, 29, 25, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [8, 23, 3, 4, 12, 2, 29, 25, 5, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [8, 23, 3, 4, 12, 2, 29, 25, 5, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [8, 23, 3, 4, 12, 2, 29, 25, 5, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [8, 23, 3, 4, 12, 2, 29, 25, 5, 6, 36, 26],
    32,
  )
}

///|
fn logit_set_reference_case_23() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [3, 44], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [3, 43, 44], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [3, 16, 43, 44], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(true),
    None,
    [3, 16, 43, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [3, 16, 43, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [3, 16, 43, 44],
    8,
  )
  verify_logit_set_step(table, keys, 0, 15, None, None, [3, 16, 15, 43, 44], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [3, 16, 15, 43, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [3, 16, 15, 43, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [3, 16, 15, 43, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [3, 16, 15, 43, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [3, 16, 15, 43, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [3, 16, 15, 43, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [3, 16, 15, 43, 29, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [3, 16, 15, 43, 29, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [3, 16, 15, 43, 29, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [3, 16, 15, 43, 29, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [3, 16, 15, 43, 29, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [3, 16, 15, 43, 29, 6, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [3, 16, 15, 43, 29, 6, 44, 5, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [3, 16, 15, 43, 29, 6, 44, 5, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [3, 16, 15, 43, 29, 6, 44, 5, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [3, 16, 15, 43, 29, 6, 44, 5, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [3, 16, 15, 43, 29, 6, 44, 5, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [3, 16, 15, 43, 29, 6, 44, 5, 45, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [13], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [13, 41], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [13, 41], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [13, 41], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [13, 41], 8)
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [23], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [23, 40], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [23, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [23, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 31, None, None, [23, 40], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12, 23, 40], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [12, 23, 40, 22], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [12, 23, 40, 22],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [12, 23, 40, 22],
    8,
  )
  verify_logit_set_step(table, keys, 0, 29, None, None, [12, 23, 40, 22], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [12, 23, 11, 22, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [12, 23, 11, 22, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [12, 23, 11, 22, 13, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [12, 23, 11, 22, 13, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [12, 23, 11, 22, 13, 2, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [12, 23, 11, 22, 13, 2, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [12, 23, 11, 22, 13, 2, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [12, 23, 11, 22, 13, 2, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [12, 23, 11, 22, 13, 2, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [12, 23, 11, 22, 13, 2, 6, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [12, 23, 11, 22, 13, 2, 6, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [12, 23, 11, 22, 13, 2, 6, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [12, 23, 11, 22, 13, 2, 6, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [12, 23, 11, 22, 13, 2, 6, 40],
    32,
  )
}

///|
fn logit_set_reference_case_24() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [7], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [7, 1], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [7, 1], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [7, 1, 25], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [7, 1, 25], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [7, 1, 25, 39], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [7, 1, 11, 25, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [7, 1, 11, 25, 42, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [7, 1, 11, 25, 42, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [7, 1, 11, 25, 42, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [7, 1, 11, 25, 42, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 27, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 27, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 27, 9, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 27, 9, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 27, 9, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [7, 1, 11, 25, 42, 19, 3, 37, 15, 27, 9, 41, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [17, 21], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [17, 21], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(true), None, [17, 21], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [17, 21], 8)
  verify_logit_set_step(table, keys, 2, 2, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20, 37], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [20, 37], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [20, 37], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [9], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [9, 18], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [9, 18], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [9, 18], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [9, 18], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [9, 18, 12], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [9, 18, 12, 0], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [9, 18, 12, 0],
    8,
  )
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
}

///|
fn logit_set_reference_case_25() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [2, 28], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [2, 28, 41], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [2, 28, 30, 41], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [2, 28, 30, 4, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [2, 28, 30, 4, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [2, 28, 30, 4, 15, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [2, 28, 30, 4, 15, 36, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [17, 31], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(true), None, [17, 31], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(true), None, [17, 31], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [17, 31, 22], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [17, 31, 43, 22], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [17, 31, 43, 22],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [17, 31, 22, 43, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [17, 31, 22, 43, 25, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [17, 31, 22, 43, 25, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [17, 31, 22, 43, 25, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [17, 31, 22, 43, 25, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [17, 31, 22, 43, 25, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [17, 31, 22, 43, 25, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [17, 31, 22, 43, 25, 44, 24],
    32,
  )
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [24], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25, 24], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12, 25, 24], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [12, 27, 25, 24], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [12, 27, 25, 24],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [12, 27, 28, 25, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [12, 27, 28, 25, 24],
    32,
  )
  verify_logit_set_step(table, keys, 2, 10, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 26], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [7, 12, 26], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [7, 12, 26], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [7, 12, 26], 8)
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [15], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [15, 1], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [15, 1, 20], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [15, 1, 20, 2], 8)
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [42, 43], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [42, 43], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [42, 19, 43], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [42, 19, 43, 3], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [42, 19, 43, 3],
    8,
  )
  verify_logit_set_step(table, keys, 0, 45, None, None, [42, 19, 3, 43, 45], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [42, 19, 3, 43, 5, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [42, 19, 3, 43, 5, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [42, 19, 3, 43, 5, 38, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [42, 19, 3, 43, 5, 38, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [42, 19, 3, 43, 5, 25, 38, 36, 45],
    32,
  )
}

///|
fn logit_set_reference_case_26() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [38], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [38], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20, 38], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [20, 41, 38], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [20, 41, 38], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [20, 31, 41, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [20, 31, 16, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [20, 31, 16, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [20, 31, 16, 38, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25, 43], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [25, 43], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [25, 43], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [25, 43], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [25, 43], 8)
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 41], 8)
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 41], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [7, 41], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [7, 3, 41], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [7, 3, 25, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [7, 3, 25, 41],
    8,
  )
  verify_logit_set_step(table, keys, 1, 41, Some(true), None, [7, 3, 25, 41], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [7, 3, 1, 25, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [7, 3, 1, 25, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [7, 3, 1, 25, 21, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 43], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [13, 43], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [13, 19, 43], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [13, 19, 43, 3], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [13, 19, 43, 3],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [13, 19, 43, 3],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [13, 19, 43, 3],
    8,
  )
  verify_logit_set_step(table, keys, 0, 35, None, None, [13, 19, 3, 43, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [13, 19, 3, 43, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [13, 19, 3, 43, 35],
    32,
  )
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [19], 8)
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [8, 0], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [8, 0, 9], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [8, 0, 9], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [8, 0, 9], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [8, 0, 9, 39], 8)
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42, 35], 8)
}

///|
fn logit_set_reference_case_27() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [30, 27], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [30, 27], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [30, 27, 43], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [30, 27, 43, 31], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [30, 27, 43, 31],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [30, 27, 31, 43, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [30, 27, 31, 43, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [30, 27, 31, 43, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [30, 27, 31, 43, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [30, 27, 31, 43, 13, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [30, 27, 31, 43, 13, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [30, 27, 31, 43, 13, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [30, 27, 31, 43, 13, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [30, 27, 31, 43, 13, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [30, 27, 31, 43, 13, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [30, 27, 31, 43, 13, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [30, 27, 31, 43, 13, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [30, 27, 31, 43, 13, 9, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [30, 27, 31, 43, 13, 9, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [30, 27, 31, 43, 13, 9, 44, 11, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [30, 27, 31, 43, 13, 9, 44, 11, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(true),
    None,
    [30, 27, 31, 43, 13, 9, 44, 11, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [30, 27, 31, 43, 13, 9, 44, 11, 2, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [30, 27, 31, 43, 13, 9, 44, 11, 2, 16, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [1, 43], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [1, 13, 43], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [1, 13, 43, 28], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [1, 13, 43, 28],
    8,
  )
  verify_logit_set_step(table, keys, 0, 26, None, None, [1, 13, 28, 43, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [1, 13, 28, 43, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [1, 13, 28, 43, 16, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [1, 13, 28, 43, 16, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [1, 13, 28, 43, 16, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [1, 13, 28, 43, 16, 7, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [1, 13, 28, 43, 16, 7, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 38, 35, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 14, 38, 35, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 14, 38, 35, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 14, 38, 35, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(true),
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 14, 38, 35, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 14, 38, 35, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 14, 38, 35, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 14, 38, 35, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [1, 13, 28, 43, 16, 7, 44, 19, 5, 14, 11, 38, 35, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19, 45], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [19, 45], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [19, 45], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [19, 3, 45], 8)
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [15], 8)
}

///|
fn logit_set_reference_case_28() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [45], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [45], 8)
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [11, 12], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [11, 12], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [11, 12, 22], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [11, 12, 42, 22], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [11, 12, 42, 22],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [11, 12, 42, 22],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [11, 12, 42, 22, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [11, 12, 42, 22, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [11, 12, 42, 22, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [17, 20], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [17, 20], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [17, 20], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [17, 20], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(true), None, [17, 20], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [17, 20, 36], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [17, 20, 36], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [17, 20, 36, 31], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [17, 20, 36, 31],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [17, 20, 31, 25, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(true),
    None,
    [17, 20, 31, 25, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [17, 20, 31, 25, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [17, 20, 31, 25, 36],
    32,
  )
  verify_logit_set_step(table, keys, 0, 9, None, None, [17, 20, 31, 25, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [17, 20, 31, 25, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [14], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [14, 7], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [14, 7, 40], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [14, 7, 40, 4], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [14, 7, 40, 4], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [14, 7, 40, 4],
    8,
  )
  verify_logit_set_step(table, keys, 0, 45, None, None, [14, 7, 4, 45, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [14, 7, 4, 18, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [14, 7, 4, 18, 43, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [14, 7, 4, 18, 43, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [14, 7, 4, 18, 43, 37, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [14, 7, 4, 18, 43, 37, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [14, 7, 4, 18, 43, 37, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [14, 7, 4, 18, 43, 37, 13, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [14, 7, 4, 18, 43, 37, 13, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [14, 7, 4, 18, 43, 37, 13, 11, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [14, 7, 4, 18, 43, 37, 13, 11, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [14, 7, 4, 18, 43, 37, 13, 11, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [14, 7, 4, 18, 43, 37, 13, 11, 25, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [14, 7, 4, 18, 43, 37, 13, 11, 25, 2, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(true),
    None,
    [14, 7, 4, 18, 43, 37, 13, 11, 25, 2, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [14, 7, 4, 18, 43, 37, 13, 11, 25, 2, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [14, 7, 4, 18, 43, 37, 13, 11, 25, 2, 45, 40],
    32,
  )
}

///|
fn logit_set_reference_case_29() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [0, 25], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [0, 25], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [0, 7, 25], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [0, 7, 25], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [0, 7, 25], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [0, 7, 25], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [0, 7, 25], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [0, 7, 25, 21], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0, 7, 25, 21], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [0, 7, 25, 21],
    8,
  )
  verify_logit_set_step(table, keys, 0, 10, None, None, [0, 7, 21, 25, 10], 32)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [6, 12], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [6, 12, 11], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [6, 12, 11], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [6, 12, 11, 19], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [6, 12, 11, 19],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [6, 12, 11, 19],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [6, 12, 11, 19],
    8,
  )
  verify_logit_set_step(table, keys, 0, 24, None, None, [6, 12, 11, 19, 24], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [6, 12, 11, 19, 10, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [6, 12, 11, 19, 10, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(true),
    None,
    [6, 12, 11, 19, 10, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [6, 12, 11, 19, 10, 31, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [6, 12, 11, 19, 10, 31, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [6, 12, 11, 19, 10, 31, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [6, 12, 11, 19, 10, 31, 24, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 37, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [11, 8], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 8], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [11, 8], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [11, 8, 30], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [11, 8, 30, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [11, 8, 30, 26],
    8,
  )
  verify_logit_set_step(table, keys, 0, 19, None, None, [11, 8, 30, 19, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(false),
    None,
    [11, 8, 30, 19, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [11, 8, 30, 19, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [11, 8, 30, 19, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [11, 8, 30, 19, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [11, 8, 30, 19, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [11, 8, 30, 19, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [11, 8, 30, 19, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [11, 8, 30, 19, 35, 39, 26],
    32,
  )
}

///|
fn logit_set_reference_case_30() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 37], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [17, 37], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [17, 37], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [17, 37, 21], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(true), None, [17, 37, 21], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [17, 37, 45, 21], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(true),
    None,
    [17, 37, 45, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [17, 37, 45, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [17, 37, 45, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [17, 37, 21, 45, 26],
    32,
  )
  verify_logit_set_step(table, keys, 0, 4, None, None, [17, 37, 21, 45, 26], 32)
  verify_logit_set_step(table, keys, 0, 7, None, None, [17, 37, 21, 45, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(true),
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(true),
    None,
    [17, 37, 21, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [17, 37, 21, 44, 36, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(true),
    None,
    [17, 37, 21, 44, 36, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [17, 37, 21, 44, 36, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [17, 37, 21, 44, 36, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [17, 37, 21, 44, 36, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [17, 37, 21, 44, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [17, 37, 21, 44, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [17, 37, 21, 44, 35, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [17, 37, 21, 44, 35, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [17, 37, 21, 44, 35, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [17, 37, 21, 44, 35, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [17, 37, 21, 25, 44, 35, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [17, 37, 21, 25, 44, 35, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [17, 37, 21, 25, 44, 35, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [17, 37, 21, 25, 44, 35, 36, 39, 45, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [4, 8], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4, 8], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [4, 8, 39], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [4, 8, 39, 1], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [4, 8, 12, 1, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [4, 8, 12, 1, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [4, 8, 12, 1, 23, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [31], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [31], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [28], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0, 28], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(true), None, [0, 28], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [0, 28, 19], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [0, 28, 19], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [0, 28, 36, 19], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [0, 28, 19, 3, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [0, 28, 19, 3, 11, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [0, 28, 19, 3, 11, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
}

///|
fn logit_set_reference_case_31() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [22, 31], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [22, 31, 18], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [22, 31, 18], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(true), None, [22, 31, 18], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [22, 31, 18, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [22, 31, 18, 39],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [22, 31, 18, 39],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [22, 31, 16, 18, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [22, 31, 16, 18, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [22, 31, 16, 18, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [22, 31, 16, 18, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [22, 31, 16, 18, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [22, 31, 16, 18, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [22, 31, 16, 18, 19, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [22, 31, 16, 18, 19, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [22, 31, 16, 18, 19, 2, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [22, 31, 16, 18, 19, 2, 42, 41, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43, 45], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [43, 45], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [43, 45], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [43, 45, 35], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [43, 45, 35], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [43, 45, 35], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [43, 45, 35], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [43, 45, 35], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(true), None, [43, 45, 35], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [43, 45, 35], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 43, 45, 35], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [7, 30, 43, 35, 45], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [7, 30, 19, 43, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [7, 30, 19, 43, 21, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [7, 30, 19, 43, 21, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [7, 30, 19, 43, 21, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [7, 30, 19, 43, 21, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [7, 30, 19, 43, 21, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [7, 30, 19, 43, 21, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [7, 30, 19, 43, 21, 9, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [7, 30, 19, 43, 21, 9, 37, 35, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [7, 30, 19, 43, 21, 9, 37, 35, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [7, 30, 19, 43, 21, 9, 37, 35, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [7, 30, 19, 43, 21, 9, 37, 35, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [7, 30, 19, 43, 21, 9, 37, 35, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [7, 30, 19, 43, 21, 9, 37, 35, 36, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [43, 35], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [43, 35], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [43, 35], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6, 43, 35], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [6, 28, 43, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [6, 28, 43, 35],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [6, 28, 43, 35],
    8,
  )
  verify_logit_set_step(table, keys, 0, 11, None, None, [6, 28, 11, 43, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [6, 28, 11, 43, 25, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [6, 28, 11, 43, 25, 35],
    32,
  )
  verify_logit_set_step(table, keys, 2, 10, None, None, [], 8)
}

///|
fn logit_set_reference_case_32() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [16, 35], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [16, 23, 35], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [16, 23, 40, 35], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [16, 23, 2, 35, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [16, 23, 2, 22, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(true),
    None,
    [16, 23, 2, 22, 35, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21, 41], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2, 21, 41], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [2, 21, 41], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [2, 21, 41], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [2, 21, 41, 15], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [2, 21, 13, 15, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [2, 21, 13, 15, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [2, 21, 13, 15, 27, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [2, 21, 13, 15, 27, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [2, 21, 13, 15, 27, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [2, 21, 13, 15, 27, 44, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [2, 21, 13, 15, 27, 5, 44, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [2, 21, 13, 15, 27, 5, 44, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [2, 21, 13, 15, 27, 5, 44, 38, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [30, 1], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [30, 1, 20], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [30, 1, 36, 20], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [30, 1, 20, 31, 36], 32)
  verify_logit_set_step(table, keys, 0, 20, None, None, [30, 1, 20, 31, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [30, 1, 20, 31, 7, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [30, 1, 20, 31, 7, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [30, 1, 20, 31, 7, 25, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [30, 1, 20, 31, 7, 25, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [30, 1, 20, 31, 7, 25, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [30, 1, 20, 31, 7, 25, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [30, 1, 20, 31, 7, 25, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [30, 1, 20, 31, 7, 25, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [30, 1, 20, 31, 7, 25, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [30, 1, 20, 31, 7, 25, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [30, 1, 20, 31, 7, 25, 3, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [22, 43], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [22, 0, 43], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [22, 0, 43], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [22, 0, 43, 6], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [22, 0, 43, 6],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [22, 0, 43, 6],
    8,
  )
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [22, 0, 43, 6], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(false),
    None,
    [22, 0, 43, 6],
    8,
  )
  verify_logit_set_step(table, keys, 2, 43, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 17, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
}

///|
fn logit_set_reference_case_33() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [16, 7], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [16, 7, 26], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [16, 7, 26], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [16, 7, 26, 3], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [16, 7, 26, 3], 8)
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [23], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [23], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0, 23], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [0, 23], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [0, 23], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [0, 23], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [0, 23], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [0, 23], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [0, 23, 11], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [0, 23, 11, 3], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [0, 23, 20, 11, 3], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [0, 23, 20, 11, 3, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [0, 23, 20, 11, 3, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [0, 23, 20, 11, 3, 35, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [45], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [45, 38], 8)
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41, 35], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19, 41, 35], 8)
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [20, 28], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [20, 28], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [20, 28], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [20, 28], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(true), None, [20, 28], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [20, 28, 30], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [20, 28, 30], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [20, 28, 30, 17], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [20, 28, 30, 17], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [20, 28, 30, 17],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [20, 28, 30, 17],
    8,
  )
  verify_logit_set_step(table, keys, 0, 10, None, None, [20, 28, 30, 17], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(true),
    None,
    [20, 28, 30, 17],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [20, 28, 30, 17],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [20, 28, 30, 17, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [20, 28, 30, 17, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [20, 28, 30, 17, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [20, 28, 30, 17, 36],
    32,
  )
  verify_logit_set_step(table, keys, 0, 9, None, None, [20, 28, 30, 17, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [20, 28, 30, 17, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [20, 28, 30, 17, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [20, 28, 30, 17, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(true),
    None,
    [20, 28, 30, 17, 36, 45],
    32,
  )
}

///|
fn logit_set_reference_case_34() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [27, 18], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [27, 18, 5], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [27, 18, 5], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [27, 18, 5, 1], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [27, 18, 9, 5, 1], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [27, 18, 9, 5, 1],
    32,
  )
  verify_logit_set_step(table, keys, 0, 22, None, None, [27, 18, 9, 5, 1], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [27, 18, 9, 5, 1, 30],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [27, 18, 9, 5, 1, 30],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [27, 18, 9, 5, 1, 30, 10],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [27, 18, 9, 5, 1, 30, 10],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [27, 18, 9, 5, 1, 30, 10, 15],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [27, 18, 9, 5, 1, 30, 10, 15],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [27, 18, 9, 5, 1, 30, 10, 15, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [27, 18, 9, 5, 1, 30, 10, 15, 0, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [27, 18, 9, 5, 1, 30, 10, 15, 0, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [27, 18, 9, 5, 1, 30, 10, 15, 0, 35],
    32,
  )
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [14, 0], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14, 0], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [14, 0], 8)
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [19, 15], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [19, 15, 31], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [19, 15, 31, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [19, 15, 16, 31, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [19, 15, 16, 31, 18, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [19, 15, 16, 31, 18, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [19, 15, 16, 31, 18, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [19, 15, 16, 31, 18, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [19, 15, 16, 31, 18, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [19, 15, 16, 31, 18, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [19, 15, 16, 31, 18, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(true),
    None,
    [19, 15, 16, 31, 18, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [19, 15, 16, 31, 18, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [19, 15, 16, 31, 18, 12, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [19, 15, 16, 31, 18, 12, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [19, 15, 16, 31, 18, 12, 14, 30, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 36, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 36, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 22, 36, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 22, 36, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 22, 36, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 22, 0, 36, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [19, 15, 16, 31, 18, 12, 14, 30, 3, 22, 0, 38, 36, 40, 39],
    32,
  )
}

///|
fn logit_set_reference_case_35() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [14], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [14], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [14], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [14], 8)
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25, 40], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [25, 40], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [25, 40], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [25, 40, 38], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27, 25, 40, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [27, 25, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [27, 3, 25, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [27, 3, 25, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [27, 3, 25, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [27, 3, 25, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [27, 3, 25, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [27, 3, 15, 25, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [27, 3, 15, 25, 4, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [27, 3, 15, 25, 4, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [27, 3, 15, 25, 4, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [27, 3, 15, 25, 4, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 37, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 37, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 37, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 37, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 37, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 37, 6, 38, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [27, 3, 15, 25, 4, 10, 8, 16, 37, 6, 38, 24, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [38], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 38], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [17, 38], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [17, 30, 38], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [17, 19, 30, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [17, 19, 30, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [17, 19, 30, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [17, 19, 30, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [17, 19, 30, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [17, 19, 30, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [17, 19, 30, 44, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [17, 19, 30, 44, 38],
    32,
  )
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [45], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10, 45], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [10, 45], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [10, 21, 45], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(true), None, [10, 21, 45], 8)
}

///|
fn logit_set_reference_case_36() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [13, 36], 8)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [8, 23], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [8, 23, 45], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [8, 23, 45], 8)
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42, 43], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [42, 43], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [42, 43, 45], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [42, 22, 43, 45], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [42, 22, 16, 43, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [42, 22, 16, 43, 4, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [42, 22, 16, 43, 4, 9, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(true),
    None,
    [42, 22, 16, 43, 4, 9, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [42, 22, 16, 43, 4, 9, 45, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [19, 28], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [19, 28], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [19, 28, 43], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [19, 28, 43], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [19, 28, 43, 44], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [19, 28, 43, 25, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [19, 28, 7, 43, 25, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [19, 28, 7, 43, 25, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [19, 28, 7, 43, 25, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [19, 28, 7, 43, 25, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [19, 28, 7, 43, 25, 44, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [19, 20], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [19, 20, 7], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [19, 20, 7, 26], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [19, 20, 8, 7, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [19, 20, 8, 7, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [19, 20, 8, 7, 3, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [0], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [0, 7], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [0, 7], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [0, 7], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0, 7], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [0, 7, 13], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [0, 7, 13, 8], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [0, 7, 13, 8, 39], 32)
}

///|
fn logit_set_reference_case_37() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [38], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30, 38], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [30, 11, 38], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [30, 11, 38], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [30, 11, 38], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [30, 11, 38], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [30, 11, 16, 38], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [3, 11], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [3, 11], 8)
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2, 41], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [2, 18, 41], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2, 18, 41], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [2, 18, 41, 11], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [2, 18, 41, 11],
    8,
  )
  verify_logit_set_step(table, keys, 0, 45, None, None, [2, 18, 11, 45, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [2, 18, 11, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(false),
    None,
    [2, 18, 11, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 0, 8, None, None, [2, 18, 11, 45, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [2, 18, 11, 26, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [2, 18, 11, 26, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [2, 18, 11, 26, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [2, 37], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [2, 37, 4], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [2, 37, 4], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [2, 37, 4, 21], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [2, 37, 4, 25, 21], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [2, 37, 4, 25, 21],
    32,
  )
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [39], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [39], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [39], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15, 39], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [15, 18, 39], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [15, 18, 39], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [15, 18, 39, 40], 8)
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [28, 24], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [28, 24], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2, 28, 24], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [2, 28, 24, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [2, 28, 24, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [2, 28, 24, 41],
    8,
  )
  verify_logit_set_step(table, keys, 1, 2, Some(true), None, [2, 28, 24, 41], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [2, 28, 9, 24, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [2, 28, 9, 29, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(true),
    None,
    [2, 28, 9, 29, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [2, 28, 9, 29, 8, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [2, 28, 9, 29, 8, 42, 24, 41],
    32,
  )
}

///|
fn logit_set_reference_case_38() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [0], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [0], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [0, 40], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [0, 3, 40], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [0, 3, 40], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [0, 3, 40, 29], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [0, 3, 31, 29, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [0, 3, 31, 29, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [0, 3, 31, 29, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [6, 10], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [6, 10, 40], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [6, 10, 40, 41], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [6, 10, 21, 41, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [6, 10, 21, 41, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [10], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [10, 4], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [10, 4], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [10, 4, 15], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [10, 4, 15, 0], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [10, 4, 15, 0],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [10, 4, 15, 0],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [10, 4, 15, 0],
    8,
  )
  verify_logit_set_step(table, keys, 0, 30, None, None, [10, 4, 30, 15, 0], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [10, 4, 30, 15, 0, 3],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 43, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [10, 4, 30, 15, 0, 3, 43, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [10, 4, 30, 15, 0, 3, 43, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 8, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 8, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 8, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 8, 44, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 8, 44, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(true),
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 8, 44, 38, 36, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 8, 44, 38, 36, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [10, 4, 30, 15, 0, 3, 43, 21, 8, 44, 38, 36, 40, 24, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [18], 8)
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [44], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [44], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 44], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [16, 13, 44], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [16, 13, 44, 10], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [16, 13, 12, 10, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [16, 13, 12, 10, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [16, 13, 12, 10, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [16, 13, 12, 10, 44, 40],
    32,
  )
}

///|
fn logit_set_reference_case_39() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27, 37], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [27, 37, 6], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [27, 37, 6], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [27, 37, 6, 13], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [27, 37, 6, 13],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [27, 37, 6, 13],
    8,
  )
  verify_logit_set_step(table, keys, 0, 4, None, None, [27, 37, 4, 6, 13], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [27, 37, 4, 6, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [27, 37, 4, 6, 13, 14],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [27, 37, 4, 6, 13, 14],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [27, 37, 4, 6, 13, 14, 8, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 0, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 0, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 0, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 0, 12, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 0, 12, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [27, 37, 4, 6, 13, 14, 8, 21, 0, 12, 24, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(true), None, [37], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [37, 45], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [37, 45], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15, 37, 45], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [15, 37, 45], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [15, 37, 45], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [15, 37, 45, 21], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(true),
    None,
    [15, 37, 45, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [15, 37, 21, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [15, 37, 21, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [15, 37, 21, 38, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [13], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [13], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [13], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [13], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [13], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [13, 19], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [13, 19, 40], 8)
  verify_logit_set_step(table, keys, 2, 41, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [11, 0], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [11, 0], 8)
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [23],
    8,
  )
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 23], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [8, 23], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [8, 23, 24], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [8, 23, 24, 12], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [8, 23, 24, 12],
    8,
  )
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 23, 24, 12], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [8, 23, 24, 12],
    8,
  )
}

///|
fn logit_set_reference_case_40() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [8, 5], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [8, 5], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [8, 5, 22], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(true), None, [8, 5, 22], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(true), None, [8, 5, 22], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [8, 5, 42, 22], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [8, 5, 42, 22], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [8, 5, 42, 22, 21], 32)
  verify_logit_set_step(table, keys, 0, 17, None, None, [8, 5, 42, 22, 21], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [8, 5, 42, 22, 21],
    32,
  )
  verify_logit_set_step(table, keys, 0, 29, None, None, [8, 5, 42, 22, 21], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [8, 5, 42, 22, 21, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [8, 5, 42, 22, 21, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [8, 5, 42, 22, 21, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [8, 5, 42, 22, 21, 38, 45, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [14, 5], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [14, 5, 42], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [14, 5, 42, 2], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [14, 5, 42, 2, 18], 32)
  verify_logit_set_step(table, keys, 0, 30, None, None, [14, 5, 42, 2, 18], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [14, 5, 42, 2, 18, 12],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [14, 5, 42, 2, 18, 12],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [14, 5, 42, 2, 18, 12, 27],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [14, 5, 42, 2, 18, 12, 27],
    32,
  )
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5, 44], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [5, 37, 44], 8)
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [12, 16], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [12, 16], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [12, 16], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [12, 16, 15], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [12, 16, 15], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [12, 16, 15], 8)
  verify_logit_set_step(table, keys, 2, 41, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 26], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [16, 10, 26], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [16, 10, 43, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [16, 10, 14, 43, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [16, 10, 14, 43, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [16, 10, 14, 43, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [16, 10, 14, 43, 42, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [16, 10, 14, 43, 42, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [16, 10, 14, 43, 42, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [16, 10, 14, 43, 42, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [16, 10, 14, 43, 42, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [16, 10, 14, 43, 42, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [16, 10, 14, 43, 42, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [16, 10, 14, 43, 42, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [16, 10, 14, 43, 42, 29, 41, 26],
    32,
  )
}

///|
fn logit_set_reference_case_41() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [17, 43], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(true), None, [17, 43], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [17, 43], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [17, 43], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [17, 43], 8)
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [22, 26], 8)
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [44], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [44], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [44, 41], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37, 44, 41], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18, 37, 44, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [18, 37, 44, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [18, 37, 44, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [18, 37, 22, 44, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [18, 37, 22, 44, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [18, 37, 22, 44, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [18, 37, 22, 44, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [18, 37, 22, 44, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [18, 37, 22, 44, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [18, 37, 22, 44, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [18, 37, 22, 44, 35, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [18, 37, 22, 7, 44, 35, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [18, 37, 22, 7, 44, 35, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [18, 37, 22, 7, 44, 35, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [18, 37, 22, 7, 42, 44, 35, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [18, 37, 22, 7, 42, 44, 35, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [18, 37, 22, 7, 42, 5, 44, 35, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [18, 37, 22, 7, 42, 5, 44, 35, 36, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [30, 44], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [30, 44], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [30, 0, 44], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [30, 0, 44], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [30, 0, 44], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [30, 0, 44, 29], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [30, 0, 29, 44, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [30, 0, 29, 25, 44, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [30, 0, 29, 25, 4, 44, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [2, 19], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [2, 19], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2, 19], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [2, 19], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25, 45], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22, 25, 45], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [22, 25, 45], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(true), None, [22, 25, 45], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [22, 7, 25, 45], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [22, 7, 25, 45],
    8,
  )
  verify_logit_set_step(table, keys, 0, 20, None, None, [22, 7, 25, 45], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
}

///|
fn logit_set_reference_case_42() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [4], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [4], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [4, 28], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [4, 28, 0], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [4, 28, 0, 12], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [4, 28, 0, 12], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [4, 28, 0, 12, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [4, 28, 0, 12, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [4, 28, 0, 12, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(true),
    None,
    [4, 28, 0, 12, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [4, 28, 0, 12, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [4, 28, 0, 12, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [4, 28, 0, 12, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [4, 28, 0, 12, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [4, 28, 0, 12, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [4, 28, 0, 12, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [4, 28, 0, 12, 11, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [4, 28, 0, 12, 11, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [4, 28, 0, 12, 11, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [4, 28, 0, 12, 11, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [4, 28, 0, 12, 11, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [4, 28, 0, 12, 11, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [4, 28, 0, 12, 11, 20, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [4, 28, 0, 12, 11, 20, 35, 24],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [20], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [20, 41], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [20, 41], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [20, 41], 8)
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [27], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [27, 26], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [27, 45, 26], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [27, 45, 26], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [27, 11, 45, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(false),
    None,
    [27, 11, 45, 26],
    8,
  )
  verify_logit_set_step(table, keys, 0, 29, None, None, [27, 11, 45, 26], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27, 11, 45, 26], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [27, 11, 1, 45, 26], 32)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27, 11, 1, 45, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [27, 11, 1, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [27, 11, 1, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [27, 11, 1, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [27, 11, 1, 45, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [13, 19], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [13, 19, 2], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [13, 19, 2], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [13, 19, 24, 2], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [13, 19, 2, 24, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [13, 19, 2, 7, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [13, 19, 2, 7, 16, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [13, 19, 2, 7, 16, 8, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [13, 19, 2, 7, 16, 8, 9, 24, 26],
    32,
  )
}

///|
fn logit_set_reference_case_43() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 39, None, None, [39], 8)
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [16, 11], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [30, 45], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [30, 45], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [30, 37, 45], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(true), None, [30, 37, 45], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    Some("OverflowError: int too large to convert to float"),
    [30, 37, 45],
    8,
  )
  verify_logit_set_step(table, keys, 0, 26, None, None, [30, 37, 45, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [30, 37, 43, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [30, 37, 27, 43, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [30, 37, 27, 43, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    None,
    Some("OverflowError: int too large to convert to float"),
    [30, 37, 27, 43, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [30, 37, 27, 43, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [30, 37, 27, 43, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [30, 37, 27, 43, 4, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [30, 37, 27, 43, 4, 16, 14, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [30, 37, 27, 43, 4, 16, 14, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    None,
    Some("OverflowError: int too large to convert to float"),
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 13, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [30, 37, 27, 43, 4, 16, 14, 9, 3, 13, 45, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [16, 38], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [16, 38], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [16, 38], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(true), None, [16, 38], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [18, 22], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [18, 22], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [18, 22], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [18, 22, 14], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [18, 22, 14, 39], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [18, 22, 0, 14, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [18, 22, 0, 14, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [18, 22, 0, 14, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [18, 22, 0, 14, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [18, 22, 0, 14, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [18, 22, 0, 14, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [18, 22, 0, 14, 11, 21, 39],
    32,
  )
}

///|
fn logit_set_reference_case_44() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [9], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [9], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [9, 15], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [9, 15], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [9, 15, 11], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [9, 15, 11], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [9, 15, 11], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [9, 15, 11], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [9, 15, 11], 8)
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [20], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(true), None, [20], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [20, 19], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [20, 19], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [20, 19], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [20, 19, 4], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [20, 19, 4], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [20, 19, 4, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [20, 19, 4, 38],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [20, 19, 4, 38],
    8,
  )
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [5, 0], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [5, 0, 40], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [5, 0, 40], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [12], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [12], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [12, 28], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [12, 28, 8], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [12, 28, 8, 37], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [12, 28, 8, 37, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [12, 28, 8, 37, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [12, 28, 8, 37, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [12, 28, 8, 37, 4, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [12, 28, 8, 37, 4, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [12, 28, 8, 37, 4, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [12, 28, 8, 37, 4, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [12, 28, 8, 37, 4, 25, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [12, 28, 8, 37, 4, 25, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [12, 28, 8, 37, 4, 25, 44, 41, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [25], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36, 25], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [36, 25, 39], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [36, 25, 39], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 36, 25, 39], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [8, 28, 25, 36, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(true),
    None,
    [8, 28, 25, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [8, 28, 25, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [8, 28, 2, 25, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [8, 28, 2, 25, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [8, 28, 2, 25, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [8, 28, 2, 25, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [8, 28, 2, 25, 36, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [8, 28, 2, 25, 22, 36, 39],
    32,
  )
}

///|
fn logit_set_reference_case_45() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [20], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [20, 25], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [20, 25, 40], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [20, 25, 40], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [20, 1, 25, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [20, 1, 25, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 4, None, None, [20, 1, 4, 25, 40], 32)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 43, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [41, 35], 8)
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43, 40], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(true), None, [43, 40], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [43, 40], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30, 43, 40], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [30, 43, 40], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [30, 43, 40], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [30, 23, 43, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [30, 23, 43, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 7, None, None, [30, 23, 7, 43, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [30, 23, 7, 43, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [30, 23, 7, 43, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [30, 23, 7, 43, 12, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [16, 18], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [16, 18, 26], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [16, 18, 26], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [16, 18, 26], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [16, 18, 26], 8)
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [16, 12], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [16, 12, 28], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [16, 12, 28], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [16, 12, 28, 1], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [16, 12, 28, 1],
    8,
  )
  verify_logit_set_step(table, keys, 0, 35, None, None, [16, 12, 28, 1, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [16, 12, 28, 1, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [16, 12, 28, 1, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [16, 12, 28, 1, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [16, 12, 28, 1, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [16, 12, 28, 1, 35, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [14, 12], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [14, 12], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [14, 12], 8)
}

///|
fn logit_set_reference_case_46() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [25], 8)
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [19, 40], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [19, 23, 40], 8)
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [21], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [21], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [21], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15, 21], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [15, 21, 16], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [15, 21, 16, 18], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [15, 21, 0, 16, 18], 32)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [16, 0], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [16, 0, 43], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [16, 0, 43, 18], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [16, 0, 18, 43, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [16, 0, 18, 43, 6, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [16, 0, 18, 43, 6, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [16, 0, 18, 43, 6, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [16, 0, 18, 43, 6, 15, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [16, 0, 18, 43, 6, 15, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [16, 0, 18, 43, 6, 15, 23, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [16, 0, 18, 43, 6, 15, 23, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [16, 0, 18, 43, 6, 15, 23, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [16, 0, 18, 43, 6, 15, 23, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [16, 0, 18, 43, 6, 15, 23, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [16, 0, 18, 43, 6, 15, 23, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [16, 0, 18, 43, 6, 15, 23, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [7, 10], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [7, 10], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [7, 10, 22], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [7, 10, 22], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [7, 10, 22, 21], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [7, 10, 22, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [7, 10, 22, 21],
    8,
  )
  verify_logit_set_step(table, keys, 0, 3, None, None, [7, 10, 3, 22, 21], 32)
}

///|
fn logit_set_reference_case_47() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [2, 12], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [2, 12], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [2, 12, 20], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [2, 12, 20, 6], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [2, 12, 31, 20, 6], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [2, 12, 31, 20, 6, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [2, 12, 31, 20, 6, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [2, 12, 31, 20, 6, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [2, 12, 31, 20, 6, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [2, 12, 31, 20, 6, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [2, 12, 31, 20, 6, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [2, 12, 31, 20, 6, 0, 36, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 2, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [28], 8)
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(true), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [27, 18], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [27, 18], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [27, 18, 19], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [27, 18, 19, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [27, 18, 19, 43, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [27, 18, 19, 43, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [27, 18, 19, 43, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4, 35], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [4, 35], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [4, 35], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [4, 36, 35], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [4, 36, 35], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [4, 36, 10, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [4, 36, 10, 35],
    8,
  )
  verify_logit_set_step(table, keys, 0, 12, None, None, [4, 12, 10, 35, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [4, 12, 10, 14, 35, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [4, 12, 10, 14, 35, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [4, 12, 10, 14, 35, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [4, 12, 10, 14, 35, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [30, 8], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [30, 8], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [30, 8], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [30, 8, 38], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [30, 8, 38], 8)
}

///|
fn logit_set_reference_case_48() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [3, 11], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [3, 11, 39], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [3, 11, 39], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [3, 11, 39], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [3, 11, 39], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [3, 11, 39, 0], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(false),
    None,
    [3, 11, 39, 0],
    8,
  )
  verify_logit_set_step(table, keys, 0, 1, None, None, [3, 11, 1, 0, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [3, 11, 1, 0, 30, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [3, 11, 1, 0, 30, 43, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [3, 11, 1, 0, 30, 43, 27, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [3, 11, 1, 0, 30, 43, 27, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [3, 11, 1, 0, 30, 43, 27, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [3, 11, 1, 0, 30, 43, 27, 5, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [3, 11, 1, 0, 30, 43, 27, 5, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [3, 11, 1, 0, 30, 43, 27, 5, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [3, 11, 1, 0, 30, 43, 27, 5, 10, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [3, 11, 1, 0, 30, 43, 27, 5, 10, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [3, 11, 1, 0, 30, 43, 27, 5, 10, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [3, 11, 1, 0, 30, 43, 27, 5, 10, 6, 24, 45, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [13, 4], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [13, 4, 15], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [13, 4, 15, 23], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [13, 4, 15, 23],
    8,
  )
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 4, 15, 23], 8)
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [39], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4, 39], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [4, 12, 39], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [4, 12, 39, 41], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [4, 12, 28, 41, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [4, 12, 28, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [4, 12, 28, 43, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [4, 12, 28, 43, 18, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [4, 12, 28, 43, 18, 42, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [4, 12, 28, 43, 18, 42, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [4, 12, 28, 43, 18, 42, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [4, 12, 28, 43, 18, 42, 41, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [6, 25], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [6, 25], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [6, 25, 24], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(true), None, [6, 25, 24], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [4], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [4], 8)
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [42], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [42, 36], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [42, 36, 12], 8)
}

///|
fn logit_set_reference_case_49() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [18, 24], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [18, 1, 24], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [18, 1, 30, 24], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [18, 1, 30, 14, 24], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [18, 1, 30, 14, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [18, 1, 30, 14, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [18, 1, 30, 14, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [18, 1, 30, 14, 28, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [18, 1, 30, 14, 28, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [18, 1, 30, 14, 28, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [18, 1, 30, 14, 28, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [18, 1, 30, 14, 28, 24, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [13], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [13, 25], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [13, 25], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [13, 25], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [13, 7, 25], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [13, 7, 25], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [13, 7, 25, 31], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [13, 7, 25, 31], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [13, 7, 31, 25, 10], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [13, 7, 31, 25, 10, 20],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [13, 7, 31, 25, 10, 20],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [13, 7, 31, 25, 10, 20],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [13, 7, 31, 25, 10, 20, 16],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [13, 7, 31, 25, 10, 20, 16, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [13, 7, 31, 25, 10, 20, 16, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [13, 7, 31, 25, 10, 20, 16, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [13, 7, 31, 25, 10, 20, 16, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [13, 7, 31, 25, 10, 20, 16, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [13, 7, 31, 25, 10, 20, 16, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [13, 7, 31, 25, 10, 20, 16, 2, 11],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [13, 7, 31, 25, 10, 20, 16, 2, 11],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [13, 7, 31, 25, 10, 20, 16, 2, 11],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [13, 7, 31, 25, 10, 20, 16, 2, 11],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [13, 7, 31, 25, 10, 20, 16, 2, 11],
    32,
  )
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [24], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20, 24], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [20, 24], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [20, 24], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [20, 24], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [20, 24], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [20, 24, 26], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [20, 3, 24, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [20, 3, 24, 26],
    8,
  )
  verify_logit_set_step(table, keys, 0, 3, None, None, [20, 3, 24, 26], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [20, 3, 30, 24, 26], 32)
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(true), None, [22], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [22, 12], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [22, 12, 5], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [22, 12, 5], 8)
}

///|
fn logit_set_reference_case_50() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [20, 24], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [20, 24], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [20, 24], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [20, 24], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [20, 24, 40], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(true), None, [20, 24, 40], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [20, 24, 40], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [20, 4, 24, 40], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [20, 4, 11, 24, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [20, 4, 11, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [20, 4, 11, 16, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [20, 4, 11, 16, 24, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [23],
    8,
  )
  verify_logit_set_step(table, keys, 0, 4, None, None, [4, 23], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [4, 23], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [4, 23, 24], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [11, 4], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [11, 4, 9], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [11, 4, 9], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [11, 4, 9, 5], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [11, 4, 9, 5, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [11, 4, 9, 5, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [11, 4, 9, 5, 28, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [11, 4, 9, 5, 28, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [11, 4, 9, 5, 28, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [11, 4, 9, 5, 28, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [11, 4, 9, 5, 28, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [11, 4, 9, 5, 28, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [11, 4, 9, 5, 28, 35, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [41, 39], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [41, 39], 8)
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(true), None, [17], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [17], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(true), None, [17], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [17, 35], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [17, 35], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [17, 35], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [17, 35], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(true), None, [17, 35], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [17, 40, 35], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [19, 26], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [19, 25, 26], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [19, 25, 26], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [19, 28, 25, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [19, 28, 13, 25, 26],
    32,
  )
}

///|
fn logit_set_reference_case_51() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42, 43], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [42, 43, 41], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(true), None, [42, 43, 41], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(true), None, [42, 43, 41], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [42, 43, 41], 8)
  verify_logit_set_step(table, keys, 2, 31, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [8, 29], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [8, 29, 38], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [8, 29, 25, 38], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [8, 29, 14, 25, 38], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [8, 29, 14, 25, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [8, 29, 14, 25, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [8, 29, 14, 25, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [8, 29, 14, 25, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [8, 29, 14, 25, 16, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [8, 29, 14, 25, 16, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [8, 29, 14, 25, 16, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [8, 29, 14, 25, 16, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [8, 29, 14, 25, 16, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [8, 29, 14, 25, 16, 1, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [8, 29, 14, 25, 16, 1, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [8, 29, 14, 25, 16, 1, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [8, 29, 14, 25, 16, 1, 0, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [8, 29, 14, 25, 16, 1, 0, 19, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [8, 29, 14, 25, 16, 1, 0, 19, 38, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [15], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [15, 10], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [15, 10, 39], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [15, 10, 39, 41], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [15, 10, 39, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [15, 10, 39, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [15, 10, 18, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [15, 10, 18, 35, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [15, 10, 18, 35, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [15, 10, 18, 35, 38, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [15, 10, 18, 35, 38, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [15, 10, 18, 11, 35, 38, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [15, 10, 18, 11, 35, 38, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(true),
    None,
    [15, 10, 18, 11, 35, 38, 41, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [15, 10, 18, 11, 35, 38, 41, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [15, 10, 18, 11, 21, 35, 38, 41, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [15, 10, 18, 11, 21, 35, 38, 41, 26, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 44], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [17, 44, 26], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [17, 45, 44, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(true),
    None,
    [17, 45, 44, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [17, 45, 44, 26],
    8,
  )
  verify_logit_set_step(table, keys, 0, 4, None, None, [17, 45, 44, 26], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [17, 45, 44, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [17, 45, 44, 26],
    8,
  )
  verify_logit_set_step(table, keys, 2, 31, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
}

///|
fn logit_set_reference_case_52() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [13, 8], 8)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 44], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [9, 44], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [9, 19, 44], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [9, 19, 44, 35], 8)
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [0, 12], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [0, 12, 24], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [0, 12, 24, 21], 8)
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 36], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [16, 36], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [16, 36], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [16, 36, 35], 8)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [36], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [36], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [36], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [36, 38], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [36, 28, 38], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [36, 28, 38], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [36, 28, 38], 8)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [19, 2], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [19, 2], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [19, 2], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [19, 2], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [19, 2, 1], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [19, 2, 25, 1], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [19, 2, 1, 25, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [19, 2, 1, 25, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [19, 2, 1, 25, 41, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5, 41], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [5, 27, 41], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [5, 27, 41, 18], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(false),
    None,
    [5, 27, 41, 18],
    8,
  )
  verify_logit_set_step(table, keys, 0, 12, None, None, [5, 27, 12, 18, 41], 32)
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [8, 21], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [8, 21, 15], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [8, 21, 15, 7], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(true), None, [8, 21, 15, 7], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [8, 21, 16, 15, 7], 32)
}

///|
fn logit_set_reference_case_53() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [8, 37], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [8, 37, 36], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [8, 37, 36, 3], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [8, 37, 36, 3],
    8,
  )
  verify_logit_set_step(table, keys, 0, 28, None, None, [8, 37, 3, 28, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [8, 37, 3, 28, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [8, 37, 3, 28, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [8, 37, 3, 28, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [8, 37, 3, 28, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [8, 37, 3, 28, 4, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [8, 37, 3, 28, 4, 19, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [8, 37, 3, 28, 4, 19, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [8, 37, 3, 28, 4, 19, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [8, 37, 3, 28, 4, 19, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [8, 37, 3, 28, 4, 19, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 7, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(true),
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(true),
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [8, 37, 3, 28, 4, 19, 7, 15, 0, 36, 39, 24, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [23, 44], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3, 23, 44], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [3, 23, 44, 7], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [3, 23, 7, 44, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [3, 23, 7, 20, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [3, 23, 7, 20, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [3, 23, 7, 20, 1, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [3, 23, 7, 20, 1, 19, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [3, 23, 7, 20, 1, 19, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [3, 23, 7, 20, 1, 19, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [3, 23, 7, 20, 1, 19, 44, 43, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [3, 23, 7, 20, 1, 19, 44, 43, 0, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [3, 23, 7, 20, 1, 19, 44, 43, 0, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [3, 23, 7, 20, 1, 19, 44, 43, 0, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [3, 23, 7, 20, 1, 19, 44, 43, 0, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [3, 23, 7, 20, 1, 19, 44, 43, 0, 2, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [3, 23, 7, 20, 1, 19, 44, 43, 0, 2, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [3, 23, 7, 20, 1, 19, 44, 43, 0, 2, 35, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [24], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [24], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28, 24], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [28, 24], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [28, 24], 8)
}

///|
fn logit_set_reference_case_54() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0, 41], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [0, 41], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [0, 41], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [0, 6, 41], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 41, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [16, 7], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [16, 7, 13], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [16, 7, 13, 12], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [16, 7, 13, 25, 12], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [16, 7, 13, 25, 12],
    32,
  )
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [21], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [21], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [21], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29, 21], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(true), None, [29, 21], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [29, 21, 6], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [29, 21, 24, 6], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [29, 21, 42, 6, 24], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [29, 21, 42, 6, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [29, 21, 42, 6, 24],
    32,
  )
  verify_logit_set_step(table, keys, 2, 41, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [31, 36], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [31, 36, 41], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [31, 36, 41], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29, 31, 36, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [29, 31, 36, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [29, 31, 36, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [29, 31, 36, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [29, 31, 36, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [29, 31, 36, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [29, 31, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [29, 31, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [29, 31, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [29, 31, 36, 24, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [39], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [39], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [39], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [39], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 39], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [11, 39], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [11, 39], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [11, 39], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [11, 39], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [11, 39], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [11, 39], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [11, 43, 39], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [11, 15, 43, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [11, 15, 43, 39],
    8,
  )
  verify_logit_set_step(table, keys, 0, 2, None, None, [11, 15, 2, 43, 39], 32)
}

///|
fn logit_set_reference_case_55() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 17, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [9, 7], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [9, 7], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [9, 7, 24], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [9, 7, 24, 20], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [9, 7, 20, 24, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [9, 7, 20, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [9, 7, 20, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [9, 7, 20, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [9, 7, 20, 23, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [9, 7, 20, 23, 42, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [9, 7, 20, 23, 42, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [9, 7, 20, 23, 42, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [9, 7, 20, 23, 42, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [9, 7, 20, 23, 42, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [9, 7, 20, 23, 42, 44, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [9, 7, 20, 23, 42, 0, 44, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [9, 7, 20, 23, 42, 0, 44, 40, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [9, 7, 20, 23, 42, 0, 44, 40, 24, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [8, 24], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [8, 24], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 37, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [17], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [17], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(true), None, [17], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(true), None, [17], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [1, 16], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [1, 16], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [1, 16, 6], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [1, 16, 6], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [1, 16, 6, 44], 8)
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(true), None, [13], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [13, 28], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(true), None, [13, 28], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [13, 28], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [13, 28, 42], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [13, 28, 42], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(true), None, [13, 28, 42], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [13, 28, 42, 19], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [13, 28, 42, 19],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [13, 28, 42, 19],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [13, 28, 42, 19, 29],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [13, 28, 42, 19, 29, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [13, 28, 42, 19, 29, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [13, 28, 42, 19, 29, 38, 41],
    32,
  )
}

///|
fn logit_set_reference_case_56() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [18], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [18, 2], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36], 8)
  verify_logit_set_step(table, keys, 2, 43, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 21], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [2, 19], 8)
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [14, 6], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [14, 6, 29], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [14, 6, 25, 29], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [14, 6, 25, 29],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [14, 6, 25, 29],
    8,
  )
  verify_logit_set_step(table, keys, 0, 10, None, None, [14, 6, 29, 25, 10], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [14, 6, 29, 25, 10, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [14, 6, 29, 25, 10, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [14, 6, 29, 25, 10, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [14, 6, 29, 25, 10, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [14, 6, 29, 25, 10, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [14, 6, 29, 25, 10, 21, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [14, 6, 29, 25, 10, 21, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [14, 6, 29, 25, 10, 21, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(true),
    None,
    [14, 6, 29, 25, 10, 21, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [14, 6, 29, 25, 10, 21, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [14, 6, 29, 25, 10, 21, 44, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [14, 6, 29, 25, 10, 21, 44, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [14, 6, 29, 25, 10, 21, 44, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [14, 6, 29, 25, 10, 21, 44, 24, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [2, 42], 8)
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [11], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [11, 10], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [11, 10], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [11, 10, 21], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [11, 10, 21], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [11, 10, 21], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [11, 10, 21], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [11, 10, 42, 21], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [11, 10, 42, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [11, 10, 42, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [11, 10, 42, 21],
    8,
  )
  verify_logit_set_step(table, keys, 0, 4, None, None, [11, 10, 42, 21, 4], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [11, 10, 42, 21, 4],
    32,
  )
  verify_logit_set_step(table, keys, 0, 4, None, None, [11, 10, 42, 21, 4], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [11, 10, 42, 21, 4, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [11, 10, 42, 21, 4, 36],
    32,
  )
}

///|
fn logit_set_reference_case_57() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 39, None, None, [39], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [23], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [23, 25], 8)
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [1, 6], 8)
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [3, 1], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [3, 1], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [3, 1, 10], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [3, 1, 10, 28], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [3, 1, 16, 10, 28], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [3, 1, 16, 10, 28, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [3, 1, 16, 10, 28, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [3, 1, 16, 10, 28, 14, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [3, 1, 16, 10, 28, 14, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 31, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [18, 28], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(true), None, [18, 28], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [18, 28], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [18, 28], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [18, 28, 39], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [18, 28, 39, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [18, 28, 39, 40],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [18, 28, 39, 40],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [18, 28, 39, 40],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [18, 28, 19, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [18, 28, 19, 43, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [18, 28, 19, 43, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [18, 28, 19, 43, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [18, 28, 19, 43, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [18, 28, 19, 43, 20, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [18, 28, 19, 43, 20, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [18, 28, 19, 43, 20, 40, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [1, 12], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [1, 12], 8)
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 44], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [16, 44], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [16, 42, 44], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [16, 42, 44], 8)
  verify_logit_set_step(table, keys, 2, 31, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [2, 0], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [2, 0, 45], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [2, 0, 45], 8)
}

///|
fn logit_set_reference_case_58() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [16, 20], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [16, 20, 4], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [16, 20, 4], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [16, 20, 4], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(true), None, [16, 20, 4], 8)
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [0], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [0, 14], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [0, 14], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [0, 14], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [0, 14], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [0, 14, 7], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [0, 14, 30, 7], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [0, 14, 30, 7],
    8,
  )
  verify_logit_set_step(table, keys, 0, 28, None, None, [0, 14, 30, 7, 28], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [0, 14, 30, 7, 28, 16],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [0, 14, 30, 7, 28, 16, 15],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [0, 14, 30, 7, 28, 16, 15],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [0, 14, 30, 7, 28, 16, 15],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2, 20],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2, 20, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2, 20, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [0, 14, 30, 7, 28, 16, 15, 19, 12, 43, 25, 2, 20, 8, 36, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [31], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 31], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [17, 31, 19], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(true), None, [17, 31, 19], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(true), None, [17, 31, 19], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [17, 31, 30, 19], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [17, 31, 30, 19],
    8,
  )
  verify_logit_set_step(table, keys, 0, 11, None, None, [17, 31, 30, 19], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [17, 31, 30, 19], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [17, 31, 30, 19],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [17, 31, 30, 19],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [17, 31, 30, 19, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21], 8)
}

///|
fn logit_set_reference_case_59() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [13, 38], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [13, 10, 38], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [13, 10, 38], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [13, 10, 38], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [13, 10, 0, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [13, 10, 0, 38],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [13, 10, 0, 38],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [13, 10, 0, 38],
    8,
  )
  verify_logit_set_step(table, keys, 0, 19, None, None, [13, 10, 19, 0, 38], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [13, 10, 19, 0, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [13, 10, 19, 0, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [13, 10, 19, 0, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [13, 10, 19, 0, 5, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(true),
    None,
    [13, 10, 19, 0, 5, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [13, 10, 19, 0, 5, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(false),
    None,
    [13, 10, 19, 0, 5, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [13, 10, 19, 0, 5, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [13, 10, 19, 0, 5, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [13, 10, 19, 0, 5, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [13, 10, 19, 0, 5, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 29, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 29, 11, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 29, 11, 37, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 29, 11, 37, 38, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [13, 10, 19, 0, 5, 16, 44, 8, 42, 9, 29, 11, 37, 38, 43, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 2, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27, 31], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [27, 31, 3], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(true), None, [27, 31, 3], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [27, 31, 3, 41], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [27, 31, 18, 3, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [27, 31, 18, 3, 12, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [27, 31, 18, 3, 12, 0, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [27, 31, 18, 3, 12, 0, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [27, 31, 18, 3, 12, 0, 19, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [27, 31, 18, 3, 12, 0, 19, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [27, 31, 18, 3, 12, 0, 19, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [27, 31, 18, 3, 12, 0, 19, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [27, 31, 18, 3, 12, 0, 19, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [27, 31, 18, 3, 12, 0, 19, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [27, 31, 18, 3, 12, 0, 19, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [27, 31, 18, 3, 12, 0, 19, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [27, 31, 18, 3, 12, 0, 19, 38, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [27, 31, 18, 3, 12, 0, 19, 43, 38, 36, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [27, 31, 18, 3, 12, 0, 19, 43, 38, 36, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [2, 42], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [2, 25, 42], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [2, 25, 42], 8)
}

///|
fn logit_set_reference_case_60() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [0, 25], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [0, 25], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [0, 25], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [0, 29, 25], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [0, 29, 25], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [0, 29, 25, 24], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [0, 29, 25, 24, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [0, 29, 25, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [0, 29, 9, 25, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [0, 29, 9, 25, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [0, 29, 9, 25, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [0, 29, 9, 25, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [0, 29, 9, 25, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [0, 29, 9, 25, 24, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [38], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [19, 6], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [19, 6], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [19, 6, 28], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [19, 6, 28, 22], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [19, 6, 14, 28, 22], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [19, 6, 14, 28, 22, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 39, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [19, 6, 14, 28, 22, 42, 13, 9, 8, 5, 35, 39, 24, 40],
    32,
  )
}

///|
fn logit_set_reference_case_61() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [31, 35], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [31, 35], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [31, 35], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29, 31, 35], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [29, 31, 13, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [29, 31, 13, 35],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [29, 31, 13, 35],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [29, 31, 13, 35],
    8,
  )
  verify_logit_set_step(table, keys, 0, 0, None, None, [29, 31, 0, 13, 35], 32)
  verify_logit_set_step(table, keys, 0, 21, None, None, [29, 31, 0, 13, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [29, 31, 0, 13, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [29, 31, 0, 13, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [29, 31, 0, 13, 11, 35],
    32,
  )
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [36], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [36], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12, 36], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [12, 36, 45], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [12, 36, 43, 45], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [12, 36, 43, 45],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [12, 36, 43, 45],
    8,
  )
  verify_logit_set_step(table, keys, 0, 0, None, None, [12, 0, 43, 36, 45], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [12, 0, 43, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [12, 0, 4, 43, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [12, 0, 4, 43, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [12, 0, 4, 43, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [12, 0, 4, 43, 38, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [12, 0, 4, 43, 8, 38, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [12, 0, 4, 43, 8, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [12, 0, 4, 43, 8, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [12, 0, 4, 43, 8, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(true),
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(true),
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 38, 36, 24, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [12, 0, 4, 43, 8, 7, 21, 37, 19, 5, 44, 38, 36, 24, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [29], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [29], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [29], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(true), None, [29], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [29, 35], 8)
}

///|
fn logit_set_reference_case_62() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20, 40], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [20, 40, 41], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [20, 3, 40, 41], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [20, 3, 10, 41, 40], 32)
  verify_logit_set_step(table, keys, 0, 41, None, None, [20, 3, 10, 41, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [20, 3, 10, 35, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [20, 3, 10, 35, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [20, 3, 10, 35, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [20, 3, 10, 35, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [20, 3, 10, 35, 41, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 37, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [4, 26], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [4, 7, 26], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [4, 7, 26], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [4, 7, 26], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [4, 7, 26, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [4, 7, 26, 39],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [4, 7, 26, 39],
    8,
  )
  verify_logit_set_step(table, keys, 0, 30, None, None, [4, 7, 30, 39, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [4, 7, 30, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [4, 7, 30, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [4, 7, 30, 5, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [4, 7, 30, 5, 39, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [16, 19], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [16, 19, 0], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [16, 19, 0, 6], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [16, 19, 0, 6],
    8,
  )
  verify_logit_set_step(table, keys, 0, 12, None, None, [16, 19, 12, 0, 6], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [16, 19, 12, 0, 6, 42],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [16, 19, 12, 0, 6, 42, 20],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [16, 19, 12, 0, 6, 42, 20, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [16, 19, 12, 0, 6, 42, 20, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [16, 19, 12, 0, 6, 42, 20, 4],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [16, 19, 12, 0, 6, 42, 20, 4, 8],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [16, 19, 12, 0, 6, 42, 20, 4, 8],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [16, 19, 12, 0, 6, 42, 20, 4, 8],
    32,
  )
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27, 38], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [27, 31, 38], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [27, 31, 44, 38], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [27, 31, 44, 38], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [10, 7], 8)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [12], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(true), None, [12], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [12, 9], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [12, 9], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [12, 9], 8)
}

///|
fn logit_set_reference_case_63() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [44], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [44], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [44], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6, 44], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [6, 0, 44], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [6, 0, 44], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [6, 0, 44, 12], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [6, 0, 44, 12],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [6, 0, 44, 12],
    8,
  )
  verify_logit_set_step(table, keys, 1, 0, Some(true), None, [6, 0, 44, 12], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [6, 0, 28, 12, 44], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [6, 0, 28, 12, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [6, 0, 28, 12, 44],
    32,
  )
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [31], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14, 31], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [14, 31, 10], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [14, 31, 10], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [14, 31, 10, 20], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [14, 31, 12, 10, 20],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [14, 31, 12, 10, 20],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [14, 31, 12, 10, 20, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [14, 31, 12, 10, 20, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [14, 31, 12, 10, 20, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [14, 31, 12, 10, 20, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [14, 31, 12, 10, 20, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [14, 31, 12, 10, 20, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [14, 31, 12, 10, 20, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [14, 31, 12, 10, 20, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [14, 31, 12, 10, 20, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [14, 31, 12, 10, 20, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [14, 31, 12, 10, 20, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [14, 31, 12, 10, 20, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [14, 31, 12, 10, 20, 9, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [14, 31, 12, 10, 20, 9, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [14, 31, 12, 10, 20, 9, 25, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [14, 31, 12, 10, 20, 9, 25, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [14, 31, 12, 10, 20, 9, 25, 36, 24],
    32,
  )
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42, 24], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [42, 8, 24], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42, 8, 24], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [42, 8, 24], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [42, 8, 24], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [42, 8, 24], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [42, 8, 24, 2], 8)
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6, 37], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [6, 37, 35], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [6, 37, 20, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [6, 37, 20, 35],
    8,
  )
  verify_logit_set_step(table, keys, 0, 16, None, None, [6, 37, 16, 20, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [6, 37, 16, 20, 25, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [6, 37, 16, 20, 25, 21, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [6, 37, 16, 20, 25, 21, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [6, 37, 16, 20, 25, 21, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [6, 37, 16, 20, 25, 21, 35, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [6, 37, 16, 20, 25, 21, 35, 36, 40],
    32,
  )
}

///|
fn logit_set_reference_case_64() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [22, 16], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [22, 16, 4], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [22, 16, 4, 28], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [22, 16, 4, 28, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [22, 16, 4, 28, 2, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [22, 16, 4, 28, 2, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [22, 16, 4, 28, 2, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [22, 16, 4, 28, 2, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [22, 16, 4, 28, 2, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [22, 16, 4, 28, 2, 42, 36, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [22, 16, 4, 28, 2, 42, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(true),
    None,
    [22, 16, 4, 28, 2, 42, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [22, 16, 4, 28, 2, 42, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [22, 16, 4, 28, 2, 42, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [22, 16, 4, 28, 2, 42, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [22, 16, 4, 28, 2, 42, 44, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [22, 16, 4, 28, 2, 42, 44, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [22, 16, 4, 28, 2, 42, 44, 36, 40, 24, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20, 43], 8)
  verify_logit_set_step(table, keys, 2, 31, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [4], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [4, 27], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [4, 27, 23], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [4, 27, 23], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [4, 27, 23], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [4, 27, 23],
    8,
  )
  verify_logit_set_step(table, keys, 0, 24, None, None, [4, 27, 24, 23], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [4, 27, 24, 23],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [4, 27, 24, 23],
    8,
  )
  verify_logit_set_step(table, keys, 0, 26, None, None, [4, 27, 23, 24, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [4, 27, 23, 16, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [4, 27, 23, 16, 42, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [4, 27, 23, 16, 42, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [4, 27, 23, 16, 42, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [4, 27, 23, 16, 42, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [4, 27, 23, 16, 42, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [4, 27, 23, 16, 42, 11, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [4, 27, 23, 16, 42, 11, 24, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [10, 30], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [10, 8, 30], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(true), None, [10, 8, 30], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [10, 8, 30, 1], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [10, 8, 30, 1],
    8,
  )
  verify_logit_set_step(table, keys, 0, 4, None, None, [10, 8, 30, 1, 4], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [10, 8, 30, 1, 4],
    32,
  )
  verify_logit_set_step(table, keys, 0, 8, None, None, [10, 8, 30, 1, 4], 32)
  verify_logit_set_step(table, keys, 0, 9, None, None, [10, 8, 30, 1, 4, 9], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [10, 8, 30, 1, 4, 9, 12],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [10, 8, 30, 1, 4, 9, 12, 19],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [10, 8, 30, 1, 4, 9, 12, 19, 20],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [10, 8, 30, 1, 4, 9, 12, 19, 20, 23],
    32,
  )
}

///|
fn logit_set_reference_case_65() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [37], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29, 43], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [29, 6, 43], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [29, 6, 43], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [29, 6, 43, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [29, 6, 43, 35],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [29, 6, 43, 35],
    8,
  )
  verify_logit_set_step(table, keys, 0, 7, None, None, [29, 6, 7, 43, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [29, 6, 7, 43, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [29, 6, 7, 43, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [29, 6, 7, 43, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [29, 6, 7, 43, 19, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [29, 6, 7, 43, 19, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [29, 6, 7, 43, 19, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [29, 6, 7, 43, 19, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [29, 6, 7, 43, 19, 23, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [29, 6, 7, 43, 19, 23, 18, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [29, 6, 7, 43, 19, 23, 18, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [29, 6, 7, 43, 19, 23, 18, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [29, 6, 7, 43, 19, 23, 18, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [29, 6, 7, 43, 19, 23, 18, 14, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [29, 6, 7, 43, 19, 23, 18, 14, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [29, 6, 7, 43, 19, 23, 18, 14, 13, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [29, 6, 7, 43, 19, 23, 18, 14, 13, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [29, 6, 7, 43, 19, 23, 18, 14, 13, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [29, 6, 7, 43, 19, 23, 18, 14, 13, 35, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 2, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 37, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(true), None, [40], 8)
  verify_logit_set_step(table, keys, 2, 26, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28, 43], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [28, 43], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [28, 43], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [28, 43], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 28, 43], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [9, 28, 43], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [9, 28, 43], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [9, 28, 43], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [9, 28, 43], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [9, 28, 43, 42], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
}

///|
fn logit_set_reference_case_66() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [16, 1], 8)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [28], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10, 28], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [10, 28], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [10, 28], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [10, 28, 9], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [10, 28, 9], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [10, 28, 9], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [10, 28, 9], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [10, 28, 9], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [10, 28, 25, 9], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [10, 28, 25, 9], 8)
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [16, 35], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [16, 15, 35], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [16, 15, 35], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [16, 15, 35], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [16, 15, 35], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [16, 15, 30, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [16, 15, 30, 35],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [16, 15, 30, 35],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [16, 15, 30, 35],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [16, 15, 30, 23, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [16, 15, 30, 23, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [16, 15, 30, 23, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [16, 15, 30, 23, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [16, 15, 30, 23, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [16, 15, 30, 23, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [16, 15, 30, 23, 14, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [16, 15, 30, 23, 14, 43, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [16, 15, 30, 23, 14, 43, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(true),
    None,
    [16, 15, 30, 23, 14, 43, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(true),
    None,
    [16, 15, 30, 23, 14, 43, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [16, 15, 30, 23, 14, 43, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [16, 15, 30, 23, 14, 43, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [16, 15, 30, 23, 14, 43, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [16, 15, 30, 23, 14, 43, 29, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [16, 15, 30, 23, 14, 43, 29, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [16, 15, 30, 23, 14, 43, 29, 19, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [16, 15, 30, 23, 14, 43, 29, 19, 35, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [17, 45], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [17, 42, 45], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [17, 42, 45], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [17, 42, 45], 8)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
}

///|
fn logit_set_reference_case_67() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [17], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [17], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [17, 19], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [17, 19, 36], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [17, 19, 42, 36], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(true),
    None,
    [17, 19, 42, 36],
    8,
  )
  verify_logit_set_step(table, keys, 0, 5, None, None, [17, 19, 42, 36], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [17, 19, 42, 36], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45, 41], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 45, 41], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [11, 45, 41], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [11, 45, 41], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [11, 29, 45, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(true),
    None,
    [11, 29, 45, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [11, 29, 45, 41],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [11, 29, 45, 41],
    8,
  )
  verify_logit_set_step(table, keys, 0, 45, None, None, [11, 29, 45, 41], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [11, 29, 37, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [11, 29, 37, 3, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [11, 29, 37, 3, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [11, 29, 37, 3, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [11, 29, 37, 3, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [11, 29, 37, 3, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    None,
    Some("OverflowError: int too large to convert to float"),
    [11, 29, 37, 3, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [11, 29, 37, 3, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [11, 29, 37, 3, 9, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [11, 29, 37, 3, 9, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [11, 29, 37, 3, 9, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [11, 29, 37, 3, 9, 13, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(true),
    None,
    [11, 29, 37, 3, 9, 13, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [11, 29, 37, 3, 9, 13, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [11, 29, 37, 3, 9, 13, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [11, 29, 37, 3, 9, 13, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 42, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 42, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 42, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 42, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 42, 18, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(true),
    None,
    [11, 29, 37, 3, 9, 13, 42, 18, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [11, 29, 37, 3, 9, 13, 42, 18, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 42, 18, 40, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [11, 29, 37, 3, 9, 13, 42, 18, 16, 40, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [37, 44], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 37, 44], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [13, 37, 44], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [13, 37, 44, 15], 8)
}

///|
fn logit_set_reference_case_68() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [8, 24], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [8, 0, 24], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [8, 0, 30, 24], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [8, 0, 30, 24],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [8, 0, 30, 24],
    8,
  )
  verify_logit_set_step(table, keys, 0, 26, None, None, [8, 0, 30, 24, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [8, 0, 30, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [8, 0, 30, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(false),
    None,
    [8, 0, 30, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [8, 0, 30, 27, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [8, 0, 30, 27, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [8, 0, 30, 27, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [8, 0, 30, 27, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [8, 0, 30, 27, 24, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [12, 23], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [12, 23, 0], 8)
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [43, 40], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [43, 40], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22, 43, 40], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [22, 43, 40], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [22, 21, 43, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [22, 21, 43, 40],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [22, 21, 42, 43, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [22, 21, 42, 43, 8, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [22, 21, 42, 43, 8, 1, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [22, 21, 42, 43, 8, 1, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [22, 21, 42, 43, 8, 1, 44, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(true),
    None,
    [22, 21, 42, 43, 8, 1, 44, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 26], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [8, 26], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [8, 20, 26], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [8, 20, 26], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [8, 20, 26, 6], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [8, 20, 6, 36, 26], 32)
  verify_logit_set_step(table, keys, 0, 36, None, None, [8, 20, 6, 36, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [8, 20, 6, 36, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [40, 39], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14, 40, 39], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14, 40, 39], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [14, 8, 40, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [14, 8, 40, 39],
    8,
  )
  verify_logit_set_step(table, keys, 0, 0, None, None, [14, 8, 0, 39, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [14, 8, 0, 37, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [14, 8, 0, 37, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [14, 8, 0, 37, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [14, 8, 0, 37, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [14, 8, 0, 37, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [14, 8, 0, 37, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [14, 8, 0, 37, 15, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [14, 8, 0, 37, 15, 22, 39, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
}

///|
fn logit_set_reference_case_69() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [9], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [9], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [9], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [9, 42], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [9, 42], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [9, 18, 42], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [9, 18, 42], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [9, 18, 42], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [9, 18, 42], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [9, 18, 42], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [9, 18, 42, 40], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [9, 18, 42, 40], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [9, 18, 42, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [9, 18, 42, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 29, None, None, [9, 18, 42, 29, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [9, 18, 42, 29, 7, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [9, 18, 42, 29, 7, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [9, 18, 42, 29, 7, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [9, 18, 42, 29, 7, 43, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [9, 18, 42, 29, 7, 43, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [9, 18, 42, 29, 7, 43, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [9, 18, 42, 29, 7, 43, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [9, 18, 42, 29, 7, 43, 12, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [9, 18, 42, 29, 7, 43, 12, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [9, 18, 42, 29, 7, 43, 12, 2, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [9, 18, 42, 29, 7, 43, 12, 2, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [9, 18, 42, 29, 7, 43, 12, 2, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 41], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [11, 31, 41], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [11, 31, 41, 15], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [11, 31, 41, 15], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [11, 31, 41, 15], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [11, 31, 19, 15, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [11, 31, 19, 15, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [14, 27], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [14, 27, 23], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [14, 27, 23, 13], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [14, 27, 23, 13],
    8,
  )
  verify_logit_set_step(table, keys, 0, 31, None, None, [14, 27, 23, 13], 8)
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [29], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [29, 43], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [29, 43], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(true), None, [29, 43], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [29, 43], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [29, 37, 43], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    Some("OverflowError: int too large to convert to float"),
    [29, 37, 43],
    8,
  )
  verify_logit_set_step(table, keys, 0, 35, None, None, [29, 37, 43, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [29, 37, 43, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [29, 37, 43, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [29, 37, 7, 43, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [29, 37, 7, 43, 16, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [29, 37, 7, 43, 16, 35, 41],
    32,
  )
}

///|
fn logit_set_reference_case_70() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [17, 40], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [17, 40], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [17, 40], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [17, 40], 8)
  verify_logit_set_step(table, keys, 2, 37, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [19], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [19, 15], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [19, 15], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [19, 15], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [19, 15, 38], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [19, 15, 30, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [19, 15, 30, 16, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [19, 15, 30, 16, 7, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [19, 15, 30, 16, 7, 31, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [19, 15, 30, 16, 7, 31, 8, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [19, 15, 30, 16, 7, 31, 8, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [19, 15, 30, 16, 7, 31, 8, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [19, 15, 30, 16, 7, 31, 8, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(true),
    None,
    [19, 15, 30, 16, 7, 31, 8, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [19, 15, 30, 16, 7, 31, 8, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [19, 15, 30, 16, 7, 31, 8, 38, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [19], 8)
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [6, 11], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [6, 11, 16], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [6, 11, 16, 23], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [6, 11, 16, 23], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [6, 11, 16, 23],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [6, 11, 16, 23],
    8,
  )
  verify_logit_set_step(table, keys, 0, 0, None, None, [6, 11, 0, 16, 23], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [6, 11, 0, 16, 23],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [6, 11, 0, 16, 23],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [6, 11, 0, 16, 23, 29],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [6, 11, 0, 16, 23, 29, 42, 5],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13, 18],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13, 18],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13, 18, 3],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13, 18, 3],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13, 18, 3],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [6, 11, 0, 16, 23, 29, 42, 5, 25, 13, 18, 3],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45, 35], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [45, 39, 35], 8)
}

///|
fn logit_set_reference_case_71() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 45], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [17, 45], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [17, 31, 45], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [17, 31, 45], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [17, 31, 45], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(true), None, [17, 31, 45], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [17, 31, 43, 45], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [17, 31, 43, 45], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [17, 31, 29, 43, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [17, 31, 29, 43, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [17, 31, 29, 43, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [17, 31, 29, 43, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [17, 31, 29, 43, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [17, 31, 29, 43, 38, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [17, 31, 29, 43, 38, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [17, 31, 29, 43, 38, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [17, 31, 29, 43, 38, 45, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 24], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [8, 24, 38], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [8, 24, 38], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [8, 24, 38], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [8, 24, 38], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [8, 25, 24, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [8, 25, 24, 38],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [8, 25, 24, 38],
    8,
  )
  verify_logit_set_step(table, keys, 0, 5, None, None, [8, 5, 25, 38, 24], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [8, 5, 22, 25, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [8, 5, 22, 25, 31, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [8, 5, 22, 25, 31, 4, 38, 24],
    32,
  )
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12, 41], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [12, 41], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [12, 41], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [12, 41, 38], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [12, 25, 41, 38], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [12, 7, 25, 38, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [12, 7, 25, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [12, 7, 25, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [12, 7, 25, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [12, 7, 25, 38, 41],
    32,
  )
  verify_logit_set_step(table, keys, 0, 41, None, None, [12, 7, 25, 38, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(false),
    None,
    [12, 7, 25, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [12, 7, 16, 25, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [12, 7, 16, 25, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [12, 7, 16, 25, 38, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [12, 7, 16, 25, 42, 38, 26, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [22, 2], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [22, 2, 16], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [22, 2, 16, 19], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [22, 2, 12, 16, 19], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [22, 2, 12, 16, 19, 6],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [22, 2, 12, 16, 19, 6],
    32,
  )
}

///|
fn logit_set_reference_case_72() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [12, 4], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [12, 4, 18], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [12, 4, 18], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [12, 4, 18, 35], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [12, 4, 27, 18, 35], 32)
  verify_logit_set_step(table, keys, 0, 20, None, None, [12, 4, 27, 18, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [12, 4, 27, 18, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [12, 4, 27, 18, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [12, 4, 27, 18, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [12, 4, 27, 18, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [12, 4, 27, 18, 10, 35, 24, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(true), None, [26], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4, 26], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [4, 26], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [4, 26], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [4, 26], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [4, 26, 39], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [4, 26, 39], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [4, 26, 39], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [4, 26, 39], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [4, 30, 26, 39], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1, 40], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [1, 12, 40], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [1, 12, 40], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [1, 12, 40], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [1, 12, 40, 8], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [1, 12, 8, 35, 40], 32)
  verify_logit_set_step(table, keys, 0, 40, None, None, [1, 12, 8, 35, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [1, 12, 8, 21, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [1, 12, 8, 21, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [1, 12, 8, 21, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [1, 12, 8, 21, 10, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [1, 12, 8, 21, 10, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [1, 12, 8, 21, 10, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [1, 12, 8, 21, 10, 14, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [1, 12, 8, 21, 10, 14, 4, 35, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [1, 12, 8, 21, 10, 14, 4, 35, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 25], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [9, 25], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [9, 15, 25], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [9, 15, 25, 18], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [9, 15, 25, 18],
    8,
  )
  verify_logit_set_step(table, keys, 0, 41, None, None, [9, 15, 18, 25, 41], 32)
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [13], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [13, 22], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [13, 22], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [13, 22, 19], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [13, 22, 36, 19], 8)
}

///|
fn logit_set_reference_case_73() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41, 35], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [41, 35], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18, 41, 35], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [18, 16, 41, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [18, 16, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [18, 16, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [18, 16, 31, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [18, 16, 31, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [18, 16, 31, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [18, 16, 31, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [18, 16, 31, 9, 38, 35, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(true), None, [30], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [30, 39], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [30, 39], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [30, 39], 8)
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 2, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [11, 25], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [11, 25], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [11, 25], 8)
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [18, 16], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [18, 16, 40], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [18, 16, 42, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [18, 16, 42, 10, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [18, 16, 42, 10, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [18, 16, 42, 10, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [18, 16, 42, 10, 29, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [18, 16, 42, 10, 29, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [18, 16, 42, 10, 29, 24, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [18, 16, 42, 10, 29, 38, 24, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [1, 19], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [1, 19, 37], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [1, 19, 37, 3], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [1, 19, 13, 37, 3], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [1, 19, 13, 37, 3],
    32,
  )
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [15, 19], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [15, 19, 41], 8)
}

///|
fn logit_set_reference_case_74() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [22, 21], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [22, 21], 8)
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [43, 41], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [43, 41], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [43, 41, 26], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [43, 44, 41, 26], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [43, 44, 41, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [43, 44, 41, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [43, 44, 41, 26],
    8,
  )
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 43, 44, 26, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [8, 43, 44, 38, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [8, 21, 43, 44, 38, 26, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [18], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [18, 7], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [18, 7, 15], 8)
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [12, 22], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12, 22], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [12, 22], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [12, 22], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [12, 22], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [12, 22], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [12, 22, 14], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [12, 22, 14], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [12, 22, 14], 8)
  verify_logit_set_step(table, keys, 2, 24, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [30, 7], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [30, 7, 11], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [30, 7, 11], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [30, 7, 11], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [30, 7, 11], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [30, 7, 11], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [30, 7, 36, 11], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [30, 7, 11, 6, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [30, 7, 11, 6, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [30, 7, 11, 6, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [30, 7, 11, 6, 5, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [30, 7, 11, 6, 5, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [30, 7, 11, 6, 5, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [30, 7, 11, 6, 5, 18, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [30, 7, 11, 6, 5, 18, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [30, 7, 11, 6, 5, 18, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [30, 7, 11, 6, 5, 18, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [30, 7, 11, 6, 5, 18, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [30, 7, 11, 6, 5, 18, 3, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [30, 7, 11, 6, 5, 18, 3, 14, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [30, 7, 11, 6, 5, 18, 3, 14, 10, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [30, 7, 11, 6, 5, 18, 3, 14, 10, 25, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [30, 7, 11, 6, 5, 18, 3, 14, 10, 25, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [30, 7, 11, 6, 5, 18, 3, 14, 10, 25, 36, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 2, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
}

///|
fn logit_set_reference_case_75() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [27, 15], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [27, 15], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [27, 15], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [27, 15], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [27, 15, 5], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [14, 24], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [14, 24, 40], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [14, 24, 40], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [14, 24, 40], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [14, 24, 40], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [14, 24, 40], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [2, 11], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(true), None, [2, 11], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [2, 11, 20], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [2, 11, 20], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [2, 11, 20, 16], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [2, 11, 20, 16],
    8,
  )
  verify_logit_set_step(table, keys, 0, 40, None, None, [2, 11, 20, 16, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [2, 11, 20, 16, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [2, 11, 20, 16, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [2, 11, 20, 16, 3, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [2, 11, 20, 16, 3, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [2, 11, 20, 16, 3, 43, 38, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [0, 9], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [0, 9], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [0, 9, 15], 8)
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [21], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [3, 41], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [3, 41], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [3, 0, 41], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [3, 0, 41, 35], 8)
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 35], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [7, 27, 35], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [7, 27, 35], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [7, 27, 35], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [7, 27, 35], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [7, 27, 35], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [7, 27, 11, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [7, 27, 11, 35],
    8,
  )
}

///|
fn logit_set_reference_case_76() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [29], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [29], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [29, 11], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [29, 11, 5], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [29, 11, 5, 10], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [29, 11, 12, 5, 10], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [29, 11, 12, 5, 10, 3],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [29, 11, 12, 5, 10, 3, 30],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [29, 11, 12, 5, 10, 3, 30],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3, 30],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3, 30, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 25, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 25, 9, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 25, 9, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 25, 9, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 25, 9, 19, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 25, 9, 19, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 25, 9, 19, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [29, 11, 12, 5, 10, 3, 30, 43, 13, 31, 15, 4, 25, 9, 19, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 10, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [22, 25], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [22, 25], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [22, 25], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [22, 25, 39], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [22, 10, 25, 39], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [22, 10, 2, 25, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [22, 10, 2, 25, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(false),
    None,
    [22, 10, 2, 25, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [22, 10, 2, 25, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [22, 10, 2, 25, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [22, 10, 2, 25, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [22, 10, 2, 25, 11, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [22, 10, 2, 25, 11, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [22, 10, 2, 25, 11, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [22, 10, 2, 25, 11, 21, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [22, 10, 2, 25, 11, 21, 13, 45, 39],
    32,
  )
}

///|
fn logit_set_reference_case_77() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [5], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [5, 6], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [5, 6, 16], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [5, 6, 16, 41], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [5, 6, 16, 41], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [5, 6, 29, 16, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [5, 6, 29, 16, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [5, 6, 29, 16, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [5, 6, 29, 16, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [5, 6, 29, 16, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [5, 6, 29, 16, 43, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [5, 6, 29, 16, 43, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [5, 6, 29, 16, 43, 40, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [5, 6, 29, 16, 43, 40, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45, 44], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15, 45, 44], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [15, 45, 44, 38], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [15, 9, 44, 38, 45], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [15, 9, 1, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [15, 9, 1, 28, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [15, 9, 1, 28, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [15, 9, 1, 28, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [15, 9, 1, 28, 44, 38, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [15, 9, 1, 28, 44, 38, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [15, 9, 1, 28, 4, 44, 38, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [15, 9, 1, 28, 4, 44, 38, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [15, 9, 1, 28, 4, 44, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 44, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [15, 9, 1, 28, 4, 14, 44, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(false),
    None,
    [15, 9, 1, 28, 4, 14, 44, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 6, 38, 35, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 6, 38, 35, 41, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 6, 38, 35, 41, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 6, 38, 35, 41, 42, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 6, 19, 38, 35, 42, 39, 24, 45, 41],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 6, 19, 38, 35, 42, 39, 24, 45, 41],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 6, 19, 38, 35, 42, 39, 24, 45, 41],
    128,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [15, 9, 1, 28, 4, 14, 44, 25, 27, 5, 6, 19, 13, 38, 35, 42, 39, 24, 45, 41],
    128,
  )
}

///|
fn logit_set_reference_case_78() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [9, 43], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [9, 43], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [9, 43], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [9, 21, 43], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [9, 21, 43, 40], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [9, 21, 1, 43, 40], 32)
  verify_logit_set_step(table, keys, 2, 17, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [25], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [25], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [25], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42, 25], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [42, 22, 25], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [42, 22, 25, 17], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [42, 22, 25, 17], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(true),
    None,
    [42, 22, 25, 17],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(false),
    None,
    [42, 22, 25, 17],
    8,
  )
  verify_logit_set_step(table, keys, 0, 6, None, None, [42, 22, 25, 17], 8)
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [9, 43], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [9, 28, 43], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [9, 28, 43], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [9, 28, 43, 19], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [9, 28, 19, 43, 27], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [9, 28, 19, 43, 27, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [9, 28, 19, 43, 27, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [9, 28, 19, 43, 27, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [9, 28, 19, 43, 27, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [9, 28, 19, 43, 27, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [9, 28, 19, 43, 27, 38, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [9, 28, 19, 43, 27, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [9, 28, 19, 43, 27, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [9, 28, 19, 43, 27, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [9, 28, 19, 43, 27, 38, 24, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [8], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [8], 8)
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [13, 43], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [13, 43, 40], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [13, 43, 40], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [13, 43, 40], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [13, 27, 43, 40], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [13, 27, 43, 40], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [13, 27, 0, 43, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [13, 27, 0, 43, 9, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(true),
    None,
    [13, 27, 0, 43, 9, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [13, 27, 0, 43, 9, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(false),
    None,
    [13, 27, 0, 43, 9, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [13, 27, 0, 43, 9, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [13, 27, 0, 43, 9, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [13, 27, 0, 43, 9, 1, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [13, 27, 0, 43, 9, 1, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [13, 27, 0, 43, 9, 1, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [13, 27, 0, 43, 9, 1, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [13, 27, 0, 43, 9, 1, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [13, 27, 0, 43, 9, 1, 5, 40],
    32,
  )
}

///|
fn logit_set_reference_case_79() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [3, 21], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [3, 21], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [3, 21, 27], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [3, 21, 27, 44], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [3, 21, 27, 44], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [3, 21, 27, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [3, 21, 27, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [3, 21, 27, 44],
    8,
  )
  verify_logit_set_step(table, keys, 0, 21, None, None, [3, 21, 27, 44], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [3, 21, 2, 27, 44], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [3, 21, 2, 27, 44, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [3, 21, 2, 27, 44, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [3, 21, 2, 27, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [3, 21, 2, 27, 43, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [3, 21, 2, 27, 43, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [3, 21, 2, 27, 43, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [3, 21, 2, 27, 43, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [3, 21, 2, 27, 43, 0, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [3, 21, 2, 27, 43, 0, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [3, 21, 2, 27, 43, 0, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [3, 21, 2, 27, 43, 0, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(true),
    None,
    [3, 21, 2, 27, 43, 0, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [3, 21, 2, 27, 43, 0, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [3, 21, 2, 27, 43, 0, 44, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [3, 21, 2, 27, 43, 0, 44, 24, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 18, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [29, 26], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [29, 9, 26], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [29, 9, 26], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [29, 9, 26, 0], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [29, 9, 26, 0],
    8,
  )
  verify_logit_set_step(table, keys, 0, 10, None, None, [29, 9, 10, 0, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(true),
    None,
    [29, 9, 10, 0, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(true),
    None,
    [29, 9, 10, 0, 26],
    32,
  )
  verify_logit_set_step(table, keys, 0, 0, None, None, [29, 9, 10, 0, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [29, 9, 10, 0, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 2, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [17, 42], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [17, 42], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [17, 42], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [17, 42], 8)
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [18], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [18], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [18], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [18, 20], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [18, 20, 36], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [18, 20, 36], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [18, 20, 36, 23], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [18, 20, 23, 43, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [18, 20, 23, 43, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [18, 20, 23, 43, 9, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [18, 20, 23, 43, 9, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [18, 20, 23, 43, 9, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [18, 20, 23, 43, 9, 36],
    32,
  )
}

///|
fn logit_set_reference_case_80() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [11, 7], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [11, 7], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [11, 7], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [11, 7, 44], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [11, 7, 44], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [11, 7, 44], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [11, 7, 44], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [11, 7, 44, 4], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [11, 7, 44, 4], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [11, 7, 44, 4], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [11, 7, 44, 4],
    8,
  )
  verify_logit_set_step(table, keys, 0, 2, None, None, [11, 7, 2, 4, 44], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [11, 7, 2, 4, 21, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [11, 7, 2, 4, 21, 0, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [11, 7, 2, 4, 21, 0, 44, 6],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [11, 7, 2, 4, 21, 0, 44, 6],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [11, 7, 2, 4, 21, 0, 44, 6, 18],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [11, 7, 2, 4, 21, 0, 44, 6, 18, 22],
    32,
  )
  verify_logit_set_step(table, keys, 2, 41, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 37, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [12, 31], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [12, 31], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [12, 31, 9], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [12, 31, 9],
    8,
  )
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [12, 31, 9], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [12, 31, 9, 18], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [12, 31, 9, 18],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [12, 31, 9, 18],
    8,
  )
  verify_logit_set_step(table, keys, 0, 10, None, None, [12, 31, 10, 9, 18], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [12, 31, 10, 9, 18],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [12, 31, 10, 9, 18],
    32,
  )
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [45], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [45, 44], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [45, 44], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 45, 44], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [7, 28, 45, 44], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [7, 28, 45, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [7, 28, 45, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [7, 28, 45, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [7, 28, 45, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [7, 28, 45, 44],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [7, 28, 45, 44],
    8,
  )
  verify_logit_set_step(table, keys, 0, 26, None, None, [7, 28, 44, 45, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [7, 28, 10, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [7, 28, 10, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [7, 28, 10, 44, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(true),
    None,
    [7, 28, 10, 44, 45, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [1, 35], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [1, 41, 35], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [1, 41, 35], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [1, 0, 41, 35], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [1, 0, 4, 35, 41], 32)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
}

///|
fn logit_set_reference_case_81() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7], 8)
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [9], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [9, 24], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [9, 29, 24], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [9, 29, 24], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [9, 29, 24], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [9, 29, 24, 4], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(true), None, [9, 29, 24, 4], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [9, 29, 4, 25, 24], 32)
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [22, 41], 8)
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [41, 35], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [41, 35], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [41, 35], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43, 41, 35], 8)
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [1, 15], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [1, 15], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [1, 15, 2], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [1, 15, 2], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [1, 15, 2, 13], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [1, 15, 2, 13], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [1, 15, 2, 13],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [1, 15, 2, 13],
    8,
  )
  verify_logit_set_step(table, keys, 0, 28, None, None, [1, 15, 28, 2, 13], 32)
  verify_logit_set_step(table, keys, 0, 31, None, None, [1, 15, 28, 2, 13], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [1, 15, 28, 2, 13, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [1, 15, 28, 2, 13, 4, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 43, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42, 23], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [42, 23], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [42, 23], 8)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [16], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [16, 9], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [16, 9, 2], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [16, 9, 2], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [16, 9, 2], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [16, 9, 2], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [16, 9, 2], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [16, 9, 2], 8)
}

///|
fn logit_set_reference_case_82() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [30], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [30, 44], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(true), None, [30, 44], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [30, 44], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30, 44], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [30, 44], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [30, 13, 44], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [30, 13, 44], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [30, 13, 44], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [30, 13, 44, 10], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [30, 13, 10, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [30, 13, 10, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [30, 13, 10, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [30, 13, 10, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [30, 13, 10, 23, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [30, 13, 10, 23, 3, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(true),
    None,
    [30, 13, 10, 23, 3, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [30, 13, 10, 23, 3, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [30, 13, 10, 23, 3, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [30, 13, 10, 23, 3, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 41, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 41, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 41, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 41, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 35, 38, 41, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 5, 35, 38, 41, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 5, 35, 38, 41, 24, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [30, 13, 10, 23, 3, 29, 44, 16, 14, 5, 35, 38, 41, 24, 45, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [24], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [24], 8)
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [42], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [42], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [42, 21], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [42, 21], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [42, 21], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 14, Some(false), None, [], 8)
}

///|
fn logit_set_reference_case_83() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [36], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14, 36], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [14, 36, 38], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [14, 36, 0, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [14, 36, 0, 38],
    8,
  )
  verify_logit_set_step(table, keys, 1, 0, Some(true), None, [14, 36, 0, 38], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [14, 16, 0, 38, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [14, 16, 0, 29, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [14, 16, 0, 29, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [14, 16, 0, 29, 23, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [14, 16, 0, 29, 23, 43, 38, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 41], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [8, 0, 41], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [8, 0, 41], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [8, 0, 41, 11], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [8, 0, 11, 38, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [8, 0, 11, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [8, 0, 11, 20, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [8, 0, 11, 20, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [8, 0, 11, 20, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [8, 0, 11, 20, 12, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [8, 0, 11, 20, 12, 23, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [8, 0, 11, 20, 12, 23, 1, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [8, 0, 11, 20, 12, 23, 1, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [8, 0, 11, 20, 12, 23, 1, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [8, 0, 11, 20, 12, 23, 1, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [8, 0, 11, 20, 12, 23, 1, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [8, 0, 11, 20, 12, 23, 1, 4, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [8, 0, 11, 20, 12, 23, 1, 4, 42, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [8, 0, 11, 20, 12, 23, 1, 4, 42, 38, 35, 36, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 2, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(true), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21, 43], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(true), None, [21, 43], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [21, 43, 35], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [7, 21, 43, 35], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [7, 21, 22, 43, 35], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [7, 21, 22, 43, 19, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [7, 21, 22, 43, 19, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [7, 21, 22, 43, 19, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [7, 21, 22, 43, 19, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [7, 21, 22, 43, 19, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [7, 21, 22, 43, 19, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [7, 21, 22, 43, 19, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [7, 21, 22, 43, 19, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [7, 21, 22, 43, 19, 1, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [7, 21, 22, 43, 19, 1, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [7, 21, 22, 43, 19, 1, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [7, 21, 22, 43, 19, 1, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [7, 21, 22, 43, 19, 1, 10, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [7, 21, 22, 43, 19, 1, 10, 16, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [7, 21, 22, 43, 19, 1, 10, 16, 35, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [7, 21, 22, 43, 19, 1, 10, 16, 35, 36, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [7, 21, 22, 43, 19, 1, 10, 16, 4, 35, 36, 24, 41],
    32,
  )
}

///|
fn logit_set_reference_case_84() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5, 24], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [5, 10, 24], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [21], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(true), None, [21], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [21, 39], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [21, 39, 26], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [21, 39, 26], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19, 21, 39, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [19, 21, 39, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [19, 21, 39, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [19, 21, 39, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [19, 21, 39, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [19, 21, 39, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [19, 21, 36, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [19, 21, 36, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [19, 21, 36, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [19, 21, 36, 26, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [19, 21, 36, 26, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [10, 24], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [10, 24], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [10, 25, 24], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [10, 25, 24], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [10, 25, 24], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [10, 25, 24, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [10, 31, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [10, 31, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [10, 31, 20, 25, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [10, 31, 20, 25, 15, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [10, 31, 20, 25, 15, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [10, 31, 20, 25, 15, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [10, 31, 20, 25, 15, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [10, 31, 20, 25, 15, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [10, 31, 20, 25, 15, 6, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [10, 31, 20, 25, 15, 6, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [10, 31, 20, 25, 15, 6, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(true),
    None,
    [10, 31, 20, 25, 15, 6, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [10, 31, 20, 25, 15, 6, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [10, 31, 20, 25, 15, 6, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [10, 31, 20, 25, 15, 6, 35, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [10, 31, 20, 25, 15, 6, 35, 26, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [10, 31, 20, 25, 15, 6, 35, 26, 24, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [10, 31, 20, 25, 15, 6, 35, 26, 24, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [37], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [37, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [37, 40],
    8,
  )
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [37, 40], 8)
}

///|
fn logit_set_reference_case_85() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 38, None, None, [38], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [38], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [38], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 38], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [11, 35, 38], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [11, 35, 38], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [11, 35, 38], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [11, 4, 35, 38], 8)
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22, 43], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [22, 43, 40], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [22, 43, 40], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [22, 43, 40], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(true), None, [22, 43, 40], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [22, 7, 43, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    8,
    Some(false),
    None,
    [22, 7, 43, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 2, None, None, [22, 7, 2, 43, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [22, 7, 2, 43, 28, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [22, 7, 2, 43, 28, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [22, 7, 2, 43, 28, 30, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [22, 7, 2, 43, 28, 30, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [22, 7, 2, 43, 28, 30, 41, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [43, 39], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1, 43, 39], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [1, 0, 43, 39], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [1, 0, 22, 43, 39], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [1, 0, 22, 43, 2, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [1, 0, 22, 43, 2, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [1, 0, 22, 43, 2, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [1, 0, 22, 43, 2, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [1, 0, 22, 43, 2, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [1, 0, 22, 43, 2, 30, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [1, 0, 22, 43, 2, 30, 6, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [1, 0, 22, 43, 2, 30, 6, 10, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [18, 1], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [18, 1, 27], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [18, 1, 27, 10], 8)
  verify_logit_set_step(table, keys, 2, 11, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [42, 27], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [42, 27], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [42, 27, 31], 8)
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [29, 0], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [29, 0, 41], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [29, 0, 41, 39], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [29, 0, 41, 39, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [29, 0, 41, 39, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [29, 0, 41, 39, 26],
    32,
  )
  verify_logit_set_step(table, keys, 0, 20, None, None, [29, 0, 41, 39, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [29, 0, 41, 39, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
}

///|
fn logit_set_reference_case_86() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [22, 44], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [22, 44], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [22, 44], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [22, 2, 44], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [22, 2, 44], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [22, 2, 44], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [22, 2, 44, 15], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [22, 2, 37, 15, 44], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [22, 2, 37, 15, 44, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(true),
    None,
    [22, 2, 37, 15, 44, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [22, 2, 37, 15, 44, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [22, 2, 37, 15, 9, 44, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [22, 2, 37, 15, 9, 44, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [22, 2, 37, 15, 9, 44, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [22, 2, 37, 15, 9, 44, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [22, 2, 37, 15, 9, 14, 44, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [22, 2, 37, 15, 9, 14, 44, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 6, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 6, 36, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 6, 36, 42, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 6, 5, 36, 42, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 6, 5, 36, 42, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 6, 5, 7, 36, 42, 45, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [22, 2, 37, 15, 9, 14, 44, 8, 13, 4, 6, 5, 7, 28, 36, 42, 45, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 7, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [16, 35], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [16, 21, 35], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [16, 21, 20, 35], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [16, 21, 37, 20, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(true),
    None,
    [16, 21, 37, 20, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [16, 21, 37, 20, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [16, 21, 37, 20, 10, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [16, 21, 37, 20, 10, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [16, 21, 37, 20, 10, 35],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [16, 21, 37, 20, 10, 35],
    32,
  )
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [6, 24], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [6, 2, 24], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [6, 2, 24, 26], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [6, 2, 24, 26],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [6, 2, 24, 26],
    8,
  )
  verify_logit_set_step(table, keys, 2, 29, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [29], 8)
}

///|
fn logit_set_reference_case_87() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 1, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22, 40], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [22, 40], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43, 40], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30, 43, 40], 8)
  verify_logit_set_step(table, keys, 2, 41, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [1, 13], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [1, 13], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [1, 13, 43], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [1, 13, 43, 0], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [1, 13, 0, 43, 36], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(false),
    None,
    [1, 13, 0, 43, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(true),
    None,
    [1, 13, 0, 43, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [1, 13, 0, 43, 12, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [1, 13, 0, 43, 12, 3, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 35, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [12, 26], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [12, 4, 26], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [12, 4, 26, 37], 8)
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [27, 17], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [27, 17], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(true), None, [27, 17], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [27, 17, 42], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [27, 17, 42, 25], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [27, 17, 42, 25, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [27, 17, 42, 25, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [27, 17, 42, 25, 45],
    32,
  )
  verify_logit_set_step(table, keys, 0, 8, None, None, [27, 17, 42, 25, 45], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [27, 17, 42, 25, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [27, 17, 42, 25, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [27, 17, 42, 25, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(true),
    None,
    [27, 17, 42, 25, 44, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [27, 17, 42, 25, 44, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(true),
    None,
    [27, 17, 42, 25, 44, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(true),
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [27, 17, 42, 25, 44, 35, 45, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
}

///|
fn logit_set_reference_case_88() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [39], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [39, 40], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20, 39, 40], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [20, 28, 39, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [20, 28, 39, 40],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [20, 28, 10, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [20, 28, 10, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [20, 28, 10, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [20, 28, 10, 1, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [20, 28, 10, 1, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [20, 28, 10, 1, 3, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [20, 28, 10, 1, 3, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [20, 28, 10, 1, 3, 36, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 36, 40, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    27,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    0,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(true),
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 35, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 11, 35, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [20, 28, 10, 1, 3, 42, 4, 43, 0, 11, 35, 36, 40, 45, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 10, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [19], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [19, 20], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [19, 20, 1], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [19, 20, 1, 14], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [19, 20, 15, 1, 14], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [19, 20, 15, 1, 14, 3],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [19, 20, 15, 1, 14, 3, 6],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [19, 20, 15, 1, 14, 3, 6],
    32,
  )
  verify_logit_set_step(table, keys, 2, 28, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [26], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [4, 26], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [4, 26], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [4, 26], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [4, 14, 26], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [4, 14, 26], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [4, 14, 26], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [4, 14, 26], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [4, 14, 26, 7], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [4, 14, 3, 7, 26], 32)
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [17], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [17, 23], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [17, 23], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(true), None, [17, 23], 8)
}

///|
fn logit_set_reference_case_89() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 9, None, None, [9], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [9, 43], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [9, 43], 8)
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [14, 28], 8)
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [20], 8)
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [42], 8)
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 37], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [11, 37], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [11, 37, 24], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [11, 37, 24], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [11, 37, 24, 14], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [11, 37, 24, 14],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(false),
    None,
    [11, 37, 24, 14],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [11, 37, 14, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [11, 37, 14, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(false),
    None,
    [11, 37, 14, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [11, 37, 14, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [11, 37, 14, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [11, 37, 14, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [11, 37, 14, 35, 24],
    32,
  )
  verify_logit_set_step(table, keys, 2, 9, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [44, 26], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5, 44, 26], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [5, 27, 44, 26], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [5, 27, 10, 44, 26], 32)
  verify_logit_set_step(table, keys, 0, 27, None, None, [5, 27, 10, 44, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [5, 27, 10, 37, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [5, 27, 10, 37, 4, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [5, 27, 10, 37, 4, 43, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [5, 27, 10, 37, 4, 43, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [5, 27, 10, 37, 4, 43, 44, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [5, 27, 10, 37, 4, 43, 44, 42, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [5, 27, 10, 37, 4, 43, 44, 42, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 19, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [3, 19], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3, 19], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [3, 19, 38], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [3, 19, 39, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [3, 19, 39, 38],
    8,
  )
  verify_logit_set_step(table, keys, 0, 41, None, None, [3, 19, 38, 39, 41], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [3, 19, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [3, 19, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [3, 19, 2, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [3, 19, 2, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [3, 19, 2, 23, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    31,
    None,
    None,
    [3, 19, 2, 23, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(false),
    None,
    [3, 19, 2, 23, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [3, 19, 2, 23, 5, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [3, 19, 2, 23, 5, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [3, 19, 2, 23, 5, 38, 39, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [3, 19, 2, 23, 5, 14, 38, 39, 41],
    32,
  )
}

///|
fn logit_set_reference_case_90() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [35], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [35], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0, 35], 8)
  verify_logit_set_step(table, keys, 2, 31, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 2, 14, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 36, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [30], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(true), None, [30], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [30, 29], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [30, 29, 11], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [30, 29, 11], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [30, 29, 11, 26], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [30, 29, 11, 26], 8)
  verify_logit_set_step(table, keys, 2, 16, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(true), None, [31], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10, 31], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [10, 31], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(true), None, [10, 31], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [10, 31], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(true), None, [44], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10, 44], 8)
  verify_logit_set_step(table, keys, 1, 31, Some(false), None, [10, 44], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [10, 44], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [10, 44], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [10, 44, 40], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [10, 44, 40], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [10, 44, 40], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [10, 22, 44, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [10, 22, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [10, 22, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [10, 22, 8, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    4,
    None,
    None,
    [10, 22, 8, 4, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [10, 22, 8, 4, 2, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(false),
    None,
    [10, 22, 8, 4, 2, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 35, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 35, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 35, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 35, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(true),
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [10, 22, 8, 4, 2, 14, 44, 38, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    30,
    Some(false),
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(true),
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 41, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(true),
    None,
    [10, 22, 8, 4, 2, 14, 44, 28, 38, 35, 36, 39, 41, 40],
    32,
  )
}

///|
fn logit_set_reference_case_91() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [41], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [37, 41], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [37, 41], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27, 37, 41], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [27, 37, 41], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [27, 37, 41, 21], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [27, 37, 41, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [27, 37, 41, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [27, 37, 41, 21],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [27, 37, 21, 43, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 15, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [3, 22], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [3, 22], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [3, 22, 30], 8)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [5, 40], 8)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [41], 8)
  verify_logit_set_step(table, keys, 0, 8, None, None, [8, 41], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [8, 41], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [8, 41], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [8, 13, 41], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [8, 13, 41], 8)
  verify_logit_set_step(table, keys, 0, 41, None, None, [8, 13, 41], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [8, 13, 41, 2], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [8, 13, 16, 2, 41], 32)
  verify_logit_set_step(table, keys, 2, 21, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 22, None, None, [22], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [22], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [22, 24], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [22, 24], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(true), None, [22, 24], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(true), None, [22, 24], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [22, 10, 24], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [22, 10, 24, 5], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [22, 10, 24, 5],
    8,
  )
  verify_logit_set_step(table, keys, 0, 21, None, None, [22, 10, 5, 21, 24], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(true),
    None,
    [22, 10, 5, 21, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [22, 10, 5, 21, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [22, 10, 5, 21, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [22, 10, 5, 21, 30, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [22, 10, 5, 21, 30, 15, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [22, 10, 5, 21, 30, 15, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [22, 10, 5, 21, 30, 15, 2, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    18,
    None,
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 18, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 18, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 18, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    17,
    None,
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 18, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 18, 19, 24, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [22, 10, 5, 21, 30, 15, 2, 12, 18, 19, 24, 41],
    32,
  )
}

///|
fn logit_set_reference_case_92() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [3, 7], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [3, 7], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3, 7], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [3, 7], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [3, 7, 11], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [3, 7, 11, 27], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [3, 7, 11, 27, 38], 32)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [17], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [17, 40], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [17, 40], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [17, 40], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [17, 40], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [17, 20, 40], 8)
  verify_logit_set_step(table, keys, 0, 25, None, None, [17, 20, 25, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [17, 20, 25, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 15, None, None, [17, 20, 25, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [17, 20, 25, 40],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [17, 20, 25, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 3, None, None, [17, 20, 25, 40], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [17, 20, 25, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    27,
    Some(true),
    None,
    [17, 20, 25, 40],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [17, 20, 25, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 11, None, None, [17, 20, 25, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [17, 20, 25, 40],
    8,
  )
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [23], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(true), None, [23], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 23], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [9, 23], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [9, 23], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [9, 23], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [9, 23], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [9, 23], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [9, 23, 20], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [9, 23, 20, 16], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [9, 23, 20, 16],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(true),
    None,
    [9, 23, 20, 16],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [9, 23, 20, 16],
    8,
  )
  verify_logit_set_step(table, keys, 0, 5, None, None, [9, 23, 5, 20, 16], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    20,
    Some(true),
    None,
    [9, 23, 5, 20, 16],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [9, 23, 5, 20, 16, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [9, 23, 5, 20, 16, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [9, 23, 5, 20, 16, 43],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [9, 23, 5, 20, 16, 43, 7],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [9, 23, 5, 20, 16, 43, 7, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [9, 23, 5, 20, 16, 43, 7, 8, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [9, 23, 5, 20, 16, 43, 7, 8, 12, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [9, 23, 5, 20, 16, 43, 7, 8, 12, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [9, 23, 5, 20, 16, 43, 7, 8, 12, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [9, 23, 5, 20, 16, 43, 7, 8, 12, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 12, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [43], 8)
}

///|
fn logit_set_reference_case_93() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 29, None, None, [29], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [29], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(true), None, [29], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [29, 36], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [29, 36, 13], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [29, 36, 13, 10], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    28,
    None,
    None,
    [29, 28, 13, 10, 36],
    32,
  )
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [10, 38], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [10, 38], 8)
  verify_logit_set_step(table, keys, 2, 8, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 6, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 2, 10, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [19, 0], 8)
  verify_logit_set_step(table, keys, 0, 29, None, None, [19, 0, 29], 8)
  verify_logit_set_step(table, keys, 0, 42, None, None, [19, 0, 42, 29], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [19, 0, 42, 29],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [19, 0, 42, 29],
    8,
  )
  verify_logit_set_step(table, keys, 0, 13, None, None, [19, 0, 42, 29, 13], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [19, 0, 42, 29, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [19, 0, 42, 29, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [19, 0, 42, 29, 13, 25],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 38],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    36,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    25,
    Some(true),
    None,
    [19, 0, 42, 29, 13, 25, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 9, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25, 9, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(true),
    None,
    [19, 0, 42, 29, 13, 25, 9, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    2,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25, 9, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [19, 0, 42, 29, 13, 25, 9, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    15,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 38, 36],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    26,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(true),
    None,
    [19, 0, 42, 29, 13, 25, 9, 15, 37, 38, 36, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 45, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [6], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [6], 8)
  verify_logit_set_step(table, keys, 1, 40, Some(false), None, [6], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [6], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [6, 40], 8)
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [16, 4], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [16, 4, 20], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [16, 4, 20, 3], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 4, 20, 3], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    23,
    Some(false),
    None,
    [16, 4, 20, 3],
    8,
  )
  verify_logit_set_step(table, keys, 0, 43, None, None, [16, 4, 20, 43, 3], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [16, 4, 20, 43, 3],
    32,
  )
}

///|
fn logit_set_reference_case_94() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 40], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [16, 40], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [16, 40], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [16, 40], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [16, 40], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [16, 40], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 40], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [16, 40], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [16, 40], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [16, 40, 35], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [16, 40, 35], 8)
  verify_logit_set_step(table, keys, 1, 12, Some(false), None, [16, 40, 35], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [16, 5, 40, 35], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [16, 5, 35, 36, 40], 32)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16, 5, 35, 36, 40], 32)
  verify_logit_set_step(table, keys, 0, 35, None, None, [16, 5, 35, 36, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    26,
    Some(true),
    None,
    [16, 5, 35, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [16, 5, 35, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    10,
    None,
    None,
    [16, 5, 10, 35, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [16, 5, 10, 23, 35, 36, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [16, 5, 10, 23, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [16, 5, 10, 23, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [16, 5, 10, 23, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(false),
    None,
    [16, 5, 10, 23, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [16, 5, 10, 23, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [16, 5, 10, 23, 42, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [16, 5, 10, 23, 42, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [16, 5, 10, 23, 42, 13, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [16, 5, 10, 23, 42, 13, 43, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [16, 5, 10, 23, 42, 13, 43, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    14,
    None,
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(true),
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 6, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 6, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 6, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(true),
    None,
    [16, 5, 10, 23, 42, 13, 43, 14, 6, 35, 36, 39, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 20, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [14], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [14], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [14, 23], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [14, 23, 12], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [14, 23, 12, 4], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [14, 23, 13, 12, 4], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    8,
    None,
    None,
    [14, 23, 13, 12, 4, 8],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    40,
    None,
    None,
    [14, 23, 13, 12, 4, 8, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [14, 23, 13, 12, 4, 8, 5, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [14, 23, 13, 12, 4, 8, 5, 30, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [27], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [27], 8)
  verify_logit_set_step(table, keys, 0, 30, None, None, [27, 30], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [27, 30, 38], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [27, 30, 38], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [27, 30, 38], 8)
}

///|
fn logit_set_reference_case_95() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [1, 38], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [1, 45, 38], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [1, 45, 38], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [1, 45, 38], 8)
  verify_logit_set_step(table, keys, 1, 18, Some(false), None, [1, 45, 38], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [1, 4, 45, 38], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(true), None, [1, 4, 45, 38], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [1, 4, 43, 38, 45], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [1, 4, 13, 43, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [1, 4, 13, 43, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    6,
    None,
    None,
    [1, 4, 13, 43, 6, 38, 45],
    32,
  )
  verify_logit_set_step(table, keys, 2, 40, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 2, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 39, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36, 26], 8)
  verify_logit_set_step(table, keys, 1, 30, Some(false), None, [36, 26], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(true), None, [36, 26], 8)
  verify_logit_set_step(table, keys, 0, 10, None, None, [10, 36, 26], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [10, 36, 26, 14], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [10, 14, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [10, 14, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    24,
    Some(false),
    None,
    [10, 14, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    5,
    None,
    None,
    [10, 14, 5, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [10, 14, 5, 2, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [10, 14, 5, 2, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    28,
    Some(false),
    None,
    [10, 14, 5, 2, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [10, 14, 5, 2, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [10, 14, 5, 2, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    25,
    None,
    None,
    [10, 14, 5, 2, 25, 36, 26, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [10, 14, 5, 2, 25, 42, 36, 26, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 5, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 16, None, None, [16], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [16, 38], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [16, 26, 38], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [16, 26, 38], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [16, 24, 26, 38], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [16, 9, 38, 24, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(false),
    None,
    [16, 9, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    1,
    None,
    None,
    [16, 9, 1, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [16, 9, 1, 22, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [16, 9, 1, 22, 19, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    17,
    Some(true),
    None,
    [16, 9, 1, 22, 19, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [16, 9, 1, 22, 19, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [16, 9, 1, 22, 19, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [16, 9, 1, 22, 19, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [16, 9, 1, 22, 19, 7, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [16, 9, 1, 22, 19, 7, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(false),
    None,
    [16, 9, 1, 22, 19, 7, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(true),
    None,
    [16, 9, 1, 22, 19, 7, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [16, 9, 1, 22, 19, 7, 21, 38, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    43,
    None,
    None,
    [16, 9, 1, 22, 19, 7, 21, 43, 38, 24, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 11, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [43], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 43], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [11, 43], 8)
  verify_logit_set_step(table, keys, 0, 4, None, None, [11, 4, 43], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [11, 4, 43], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [11, 4, 43, 3], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    15,
    Some(false),
    None,
    [11, 4, 43, 3],
    8,
  )
}

///|
fn logit_set_reference_case_96() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 31, None, None, [31], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [0, 31], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    37,
    None,
    Some("OverflowError: int too large to convert to float"),
    [0, 31],
    8,
  )
  verify_logit_set_step(table, keys, 0, 40, None, None, [0, 31, 40], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [0, 31, 40, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    13,
    Some(false),
    None,
    [0, 31, 40, 39],
    8,
  )
  verify_logit_set_step(table, keys, 1, 0, Some(true), None, [0, 31, 40, 39], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    29,
    Some(false),
    None,
    [0, 31, 40, 39],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [0, 31, 40, 39],
    8,
  )
  verify_logit_set_step(table, keys, 0, 16, None, None, [0, 31, 16, 39, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    12,
    Some(false),
    None,
    [0, 31, 16, 39, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    7,
    None,
    None,
    [0, 31, 16, 7, 39, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [2], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [2, 14], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [2, 14, 3], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [2, 14, 3, 13], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [2, 14, 9, 3, 13], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    6,
    Some(false),
    None,
    [2, 14, 9, 3, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(true),
    None,
    [2, 14, 9, 3, 13],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [2, 14, 9, 3, 13, 29],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [2, 14, 9, 3, 13, 29],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    22,
    Some(true),
    None,
    [2, 14, 9, 3, 13, 29],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [2, 14, 9, 3, 13, 29],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [2, 14, 9, 3, 13, 29],
    32,
  )
  verify_logit_set_step(table, keys, 2, 27, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 1, 0, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 1, 45, Some(false), None, [3], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [3, 11], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [3, 11], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [3, 11, 44], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [3, 11, 44, 14], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [3, 11, 44, 14],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    7,
    Some(false),
    None,
    [3, 11, 44, 14],
    8,
  )
  verify_logit_set_step(table, keys, 0, 24, None, None, [3, 11, 14, 44, 24], 32)
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [3, 11, 14, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(true),
    None,
    [3, 11, 14, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [3, 11, 14, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [3, 11, 14, 29, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [3, 11, 14, 29, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [3, 11, 14, 29, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [3, 11, 14, 29, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    35,
    Some(false),
    None,
    [3, 11, 14, 29, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(true),
    None,
    [3, 11, 14, 29, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(false),
    None,
    [3, 11, 14, 29, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [3, 11, 14, 29, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [3, 11, 14, 29, 13, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(true),
    None,
    [3, 11, 14, 29, 13, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [3, 11, 14, 29, 13, 19, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(true),
    None,
    [3, 11, 14, 29, 13, 19, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [3, 11, 14, 29, 13, 19, 44, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    1,
    Some(false),
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    3,
    Some(true),
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(false),
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 35, 24],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [3, 11, 14, 29, 13, 19, 44, 30, 35, 24, 39],
    32,
  )
}

///|
fn logit_set_reference_case_97() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 1, None, None, [1], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [1], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [1, 26], 8)
  verify_logit_set_step(table, keys, 0, 39, None, None, [1, 26, 39], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [1, 0, 26, 39], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [1, 0, 26, 39], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [1, 0, 36, 39, 26], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [1, 0, 36, 39, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    9,
    None,
    None,
    [1, 0, 9, 36, 39, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [1, 0, 9, 23, 36, 39, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(true),
    None,
    [1, 0, 9, 23, 36, 39, 41, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    24,
    None,
    None,
    [1, 0, 9, 23, 36, 39, 41, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [1, 0, 9, 23, 13, 36, 39, 41, 24, 26],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [1, 0, 9, 23, 13, 36, 39, 41, 24, 26],
    32,
  )
  verify_logit_set_step(table, keys, 2, 43, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 8, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 26, None, None, [26], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 26], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(true), None, [17, 26], 8)
  verify_logit_set_step(table, keys, 0, 17, None, None, [17, 26], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [17, 26], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [17, 26], 8)
  verify_logit_set_step(table, keys, 0, 20, None, None, [17, 20, 26], 8)
  verify_logit_set_step(table, keys, 0, 23, None, None, [17, 20, 26, 23], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [17, 20, 26, 23], 8)
  verify_logit_set_step(table, keys, 0, 5, None, None, [17, 20, 26, 23], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    16,
    Some(true),
    None,
    [17, 20, 26, 23],
    8,
  )
  verify_logit_set_step(table, keys, 0, 40, None, None, [17, 20, 26, 23], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    31,
    Some(true),
    None,
    [17, 20, 26, 23],
    8,
  )
  verify_logit_set_step(table, keys, 0, 10, None, None, [17, 20, 26, 23], 8)
  verify_logit_set_step(table, keys, 2, 42, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 1, 42, Some(false), None, [19], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [19, 15], 8)
  verify_logit_set_step(table, keys, 1, 38, Some(false), None, [19, 15], 8)
  verify_logit_set_step(table, keys, 1, 24, Some(false), None, [19, 15], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [19, 15, 37], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [19, 15, 37], 8)
  verify_logit_set_step(table, keys, 1, 29, Some(false), None, [19, 15, 37], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [19, 15, 37], 8)
  verify_logit_set_step(table, keys, 0, 7, None, None, [19, 15, 37, 7], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [19, 15, 37, 7],
    8,
  )
  verify_logit_set_step(table, keys, 0, 21, None, None, [19, 15, 21, 37, 7], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [19, 15, 21, 37, 7, 16],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    44,
    Some(false),
    None,
    [19, 15, 21, 37, 7, 16],
    32,
  )
  verify_logit_set_step(table, keys, 2, 3, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 19, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 9, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 10, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 6, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [28], 8)
  verify_logit_set_step(table, keys, 0, 14, None, None, [14, 28], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [14, 28], 8)
  verify_logit_set_step(table, keys, 2, 39, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 37, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 24, None, None, [24], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43, 24], 8)
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 43, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
}

///|
fn logit_set_reference_case_98() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 1, 37, Some(false), None, [44], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11, 44], 8)
  verify_logit_set_step(table, keys, 1, 3, Some(false), None, [11, 44], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [11, 44], 8)
  verify_logit_set_step(table, keys, 0, 27, None, None, [11, 27, 44], 8)
  verify_logit_set_step(table, keys, 1, 4, Some(false), None, [11, 27, 44], 8)
  verify_logit_set_step(table, keys, 1, 15, Some(false), None, [11, 27, 44], 8)
  verify_logit_set_step(table, keys, 1, 27, Some(true), None, [11, 27, 44], 8)
  verify_logit_set_step(table, keys, 0, 37, None, None, [11, 27, 44, 37], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    12,
    None,
    None,
    [11, 27, 12, 37, 44],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    41,
    None,
    None,
    [11, 27, 12, 37, 44, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    36,
    Some(false),
    None,
    [11, 27, 12, 37, 44, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [11, 27, 12, 37, 44, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [11, 27, 12, 37, 44, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [11, 27, 12, 37, 3, 44, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    2,
    None,
    None,
    [11, 27, 12, 37, 3, 2, 44, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    19,
    None,
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    14,
    Some(false),
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    11,
    Some(true),
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 42, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 42, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    38,
    None,
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 42, 38, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    35,
    None,
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 42, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 42, 21, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    5,
    Some(false),
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 42, 21, 38, 35, 41],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(true),
    None,
    [11, 27, 12, 37, 3, 2, 44, 19, 42, 21, 38, 35, 41],
    32,
  )
  verify_logit_set_step(table, keys, 2, 13, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18], 8)
  verify_logit_set_step(table, keys, 2, 10, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 2, None, None, [2], 8)
  verify_logit_set_step(table, keys, 1, 1, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [2], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [2], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [2, 9], 8)
  verify_logit_set_step(table, keys, 0, 13, None, None, [2, 9, 13], 8)
  verify_logit_set_step(table, keys, 2, 4, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 44, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 15, None, None, [15], 8)
  verify_logit_set_step(table, keys, 1, 17, Some(true), None, [15], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [15, 40], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [15, 43, 40], 8)
  verify_logit_set_step(table, keys, 0, 6, None, None, [15, 6, 43, 40], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    39,
    Some(false),
    None,
    [15, 6, 43, 40],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    18,
    Some(false),
    None,
    [15, 6, 43, 40],
    8,
  )
  verify_logit_set_step(table, keys, 0, 36, None, None, [15, 6, 43, 36, 40], 32)
  verify_logit_set_step(
    table,
    keys,
    0,
    45,
    None,
    None,
    [15, 6, 43, 36, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    13,
    None,
    None,
    [15, 6, 13, 43, 36, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    29,
    None,
    None,
    [15, 6, 13, 43, 29, 36, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    30,
    None,
    None,
    [15, 6, 13, 43, 29, 30, 36, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    19,
    Some(false),
    None,
    [15, 6, 13, 43, 29, 30, 36, 45, 40],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    23,
    None,
    None,
    [15, 6, 13, 43, 29, 30, 23, 36, 45, 40],
    32,
  )
  verify_logit_set_step(table, keys, 2, 44, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 23, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [44], 8)
  verify_logit_set_step(table, keys, 2, 30, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 20, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 26, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 12, None, None, [12], 8)
}

///|
fn logit_set_reference_case_99() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 19, None, None, [19], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [19], 8)
  verify_logit_set_step(table, keys, 1, 7, Some(false), None, [19], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [19, 44], 8)
  verify_logit_set_step(table, keys, 0, 38, None, None, [19, 44, 38], 8)
  verify_logit_set_step(table, keys, 0, 45, None, None, [19, 45, 44, 38], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    22,
    None,
    None,
    [19, 22, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    20,
    None,
    None,
    [19, 22, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    21,
    Some(false),
    None,
    [19, 22, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    3,
    None,
    None,
    [19, 22, 3, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    16,
    None,
    None,
    [19, 22, 3, 16, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    42,
    Some(false),
    None,
    [19, 22, 3, 16, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [19, 22, 3, 16, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    21,
    None,
    None,
    [19, 22, 3, 16, 21, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    42,
    None,
    None,
    [19, 22, 3, 16, 21, 42, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    43,
    Some(false),
    None,
    [19, 22, 3, 16, 21, 42, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    10,
    Some(false),
    None,
    [19, 22, 3, 16, 21, 42, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    37,
    Some(false),
    None,
    [19, 22, 3, 16, 21, 42, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    38,
    Some(true),
    None,
    [19, 22, 3, 16, 21, 42, 44, 38, 45],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    39,
    None,
    None,
    [19, 22, 3, 16, 21, 42, 44, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    44,
    None,
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    9,
    Some(false),
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    40,
    Some(false),
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    4,
    Some(false),
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    45,
    Some(true),
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    0,
    Some(false),
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    0,
    11,
    None,
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    41,
    Some(false),
    None,
    [19, 22, 3, 16, 21, 42, 44, 11, 38, 45, 39],
    32,
  )
  verify_logit_set_step(table, keys, 2, 38, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 22, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 43, None, None, [43], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [36, 43], 8)
  verify_logit_set_step(table, keys, 0, 18, None, None, [18, 36, 43], 8)
  verify_logit_set_step(table, keys, 0, 28, None, None, [18, 36, 43, 28], 8)
  verify_logit_set_step(table, keys, 2, 23, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 11, None, None, [11], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 1, 5, Some(false), None, [11], 8)
  verify_logit_set_step(table, keys, 2, 22, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 28, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 2, 25, None, None, [], 8)
  verify_logit_set_step(table, keys, 0, 40, None, None, [40], 8)
  verify_logit_set_step(table, keys, 1, 16, Some(false), None, [40], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [31, 40], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(true), None, [31, 40], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [31, 40], 8)
  verify_logit_set_step(table, keys, 0, 9, None, None, [9, 31, 40], 8)
  verify_logit_set_step(table, keys, 0, 31, None, None, [9, 31, 40], 8)
  verify_logit_set_step(table, keys, 0, 21, None, None, [9, 31, 40], 8)
  verify_logit_set_step(table, keys, 0, 1, None, None, [9, 31, 40, 1], 8)
  verify_logit_set_step(table, keys, 2, 17, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 25, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 21, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 41, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 1, 13, Some(false), None, [], 8)
  verify_logit_set_step(table, keys, 0, 3, None, None, [3], 8)
  verify_logit_set_step(table, keys, 0, 0, None, None, [3, 0], 8)
  verify_logit_set_step(table, keys, 0, 44, None, None, [3, 0, 44], 8)
}

///|
fn logit_set_reference_case_100() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 32, None, None, [32], 8)
  verify_logit_set_step(table, keys, 1, 32, Some(true), None, [32], 8)
  verify_logit_set_step(table, keys, 1, 32, Some(true), None, [32], 8)
  verify_logit_set_step(table, keys, 1, 33, Some(false), None, [32], 8)
  verify_logit_set_step(table, keys, 1, 34, Some(false), None, [32], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    46,
    None,
    Some("OverflowError: int too large to convert to float"),
    [32],
    8,
  )
  verify_logit_set_step(table, keys, 1, 47, Some(false), None, [32], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [32, 35], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [32, 36, 35], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(true), None, [32, 36, 35], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(true), None, [32, 36, 35], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 32, Some(false), None, [], 8)
}

///|
fn logit_set_reference_case_101() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 33, None, None, [33], 8)
  verify_logit_set_step(table, keys, 1, 33, Some(true), None, [33], 8)
  verify_logit_set_step(table, keys, 1, 32, Some(false), None, [33], 8)
  verify_logit_set_step(table, keys, 1, 33, Some(true), None, [33], 8)
  verify_logit_set_step(table, keys, 1, 34, Some(false), None, [33], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    46,
    None,
    Some("OverflowError: int too large to convert to float"),
    [33],
    8,
  )
  verify_logit_set_step(table, keys, 1, 47, Some(false), None, [33], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [33, 35], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [33, 36, 35], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(true), None, [33, 36, 35], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(true), None, [33, 36, 35], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 33, Some(false), None, [], 8)
}

///|
fn logit_set_reference_case_102() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 34, None, None, [34], 8)
  verify_logit_set_step(table, keys, 1, 34, Some(true), None, [34], 8)
  verify_logit_set_step(table, keys, 1, 32, Some(false), None, [34], 8)
  verify_logit_set_step(table, keys, 1, 33, Some(false), None, [34], 8)
  verify_logit_set_step(table, keys, 1, 34, Some(true), None, [34], 8)
  verify_logit_set_step(table, keys, 1, 46, Some(false), None, [34], 8)
  verify_logit_set_step(table, keys, 1, 47, Some(false), None, [34], 8)
  verify_logit_set_step(table, keys, 0, 35, None, None, [34, 35], 8)
  verify_logit_set_step(table, keys, 0, 36, None, None, [34, 36, 35], 8)
  verify_logit_set_step(table, keys, 1, 35, Some(true), None, [34, 36, 35], 8)
  verify_logit_set_step(table, keys, 1, 36, Some(true), None, [34, 36, 35], 8)
  verify_logit_set_step(table, keys, 2, 0, None, None, [], 8)
  verify_logit_set_step(table, keys, 1, 34, Some(false), None, [], 8)
}

///|
fn logit_set_reference_case_103() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 46, None, None, [46], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    32,
    None,
    Some("OverflowError: int too large to convert to float"),
    [46],
    8,
  )
}

///|
fn logit_set_reference_case_104() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 46, None, None, [46], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    33,
    None,
    Some("OverflowError: int too large to convert to float"),
    [46],
    8,
  )
}

///|
fn logit_set_reference_case_105() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 46, None, None, [46], 8)
  verify_logit_set_step(table, keys, 1, 34, Some(false), None, [46], 8)
}

///|
fn logit_set_reference_case_106() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 48, None, None, [48], 8)
  verify_logit_set_step(table, keys, 1, 46, Some(false), None, [48], 8)
  verify_logit_set_step(table, keys, 1, 47, Some(false), None, [48], 8)
  verify_logit_set_step(table, keys, 0, 46, None, None, [48, 46], 8)
  verify_logit_set_step(table, keys, 1, 46, Some(true), None, [48, 46], 8)
}

///|
fn logit_set_reference_case_107() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 49, None, None, [49], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    46,
    None,
    Some("OverflowError: int too large to convert to float"),
    [49],
    8,
  )
  verify_logit_set_step(table, keys, 1, 47, Some(false), None, [49], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    46,
    None,
    Some("OverflowError: int too large to convert to float"),
    [49],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    46,
    None,
    Some("OverflowError: int too large to convert to float"),
    [49],
    8,
  )
}

///|
fn logit_set_reference_case_108() -> Unit raise {
  let table = LogitLabelled::new()
  let keys = logit_set_reference_keys()
  verify_logit_set_step(table, keys, 0, 50, None, None, [22], 8)
  verify_logit_set_step(
    table,
    keys,
    1,
    46,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [22],
    8,
  )
  verify_logit_set_step(table, keys, 1, 47, Some(false), None, [22], 8)
  verify_logit_set_step(
    table,
    keys,
    0,
    46,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [22],
    8,
  )
  verify_logit_set_step(
    table,
    keys,
    1,
    46,
    None,
    Some("OverflowError: Python int too large to convert to C long"),
    [22],
    8,
  )
}

///|
test "logit builtin set reference group 0" {
  logit_set_reference_case_0()
  logit_set_reference_case_1()
  logit_set_reference_case_2()
  logit_set_reference_case_3()
  logit_set_reference_case_4()
  logit_set_reference_case_5()
  logit_set_reference_case_6()
  logit_set_reference_case_7()
  logit_set_reference_case_8()
  logit_set_reference_case_9()
  logit_set_reference_case_10()
  logit_set_reference_case_11()
  logit_set_reference_case_12()
  logit_set_reference_case_13()
  logit_set_reference_case_14()
  logit_set_reference_case_15()
  logit_set_reference_case_16()
  logit_set_reference_case_17()
  logit_set_reference_case_18()
  logit_set_reference_case_19()
  logit_set_reference_case_20()
  logit_set_reference_case_21()
  logit_set_reference_case_22()
  logit_set_reference_case_23()
  logit_set_reference_case_24()
  logit_set_reference_case_25()
  logit_set_reference_case_26()
  logit_set_reference_case_27()
  logit_set_reference_case_28()
  logit_set_reference_case_29()
  logit_set_reference_case_30()
  logit_set_reference_case_31()
}

///|
test "logit builtin set reference group 1" {
  logit_set_reference_case_32()
  logit_set_reference_case_33()
  logit_set_reference_case_34()
  logit_set_reference_case_35()
  logit_set_reference_case_36()
  logit_set_reference_case_37()
  logit_set_reference_case_38()
  logit_set_reference_case_39()
  logit_set_reference_case_40()
  logit_set_reference_case_41()
  logit_set_reference_case_42()
  logit_set_reference_case_43()
  logit_set_reference_case_44()
  logit_set_reference_case_45()
  logit_set_reference_case_46()
  logit_set_reference_case_47()
  logit_set_reference_case_48()
  logit_set_reference_case_49()
  logit_set_reference_case_50()
  logit_set_reference_case_51()
  logit_set_reference_case_52()
  logit_set_reference_case_53()
  logit_set_reference_case_54()
  logit_set_reference_case_55()
  logit_set_reference_case_56()
  logit_set_reference_case_57()
  logit_set_reference_case_58()
  logit_set_reference_case_59()
  logit_set_reference_case_60()
  logit_set_reference_case_61()
  logit_set_reference_case_62()
  logit_set_reference_case_63()
}

///|
test "logit builtin set reference group 2" {
  logit_set_reference_case_64()
  logit_set_reference_case_65()
  logit_set_reference_case_66()
  logit_set_reference_case_67()
  logit_set_reference_case_68()
  logit_set_reference_case_69()
  logit_set_reference_case_70()
  logit_set_reference_case_71()
  logit_set_reference_case_72()
  logit_set_reference_case_73()
  logit_set_reference_case_74()
  logit_set_reference_case_75()
  logit_set_reference_case_76()
  logit_set_reference_case_77()
  logit_set_reference_case_78()
  logit_set_reference_case_79()
  logit_set_reference_case_80()
  logit_set_reference_case_81()
  logit_set_reference_case_82()
  logit_set_reference_case_83()
  logit_set_reference_case_84()
  logit_set_reference_case_85()
  logit_set_reference_case_86()
  logit_set_reference_case_87()
  logit_set_reference_case_88()
  logit_set_reference_case_89()
  logit_set_reference_case_90()
  logit_set_reference_case_91()
  logit_set_reference_case_92()
  logit_set_reference_case_93()
  logit_set_reference_case_94()
  logit_set_reference_case_95()
}

///|
test "logit builtin set reference group 3" {
  logit_set_reference_case_96()
  logit_set_reference_case_97()
  logit_set_reference_case_98()
  logit_set_reference_case_99()
  logit_set_reference_case_100()
  logit_set_reference_case_101()
  logit_set_reference_case_102()
  logit_set_reference_case_103()
  logit_set_reference_case_104()
  logit_set_reference_case_105()
  logit_set_reference_case_106()
  logit_set_reference_case_107()
  logit_set_reference_case_108()
}

///|
test "logit numeric set retains native growth beyond 50000" {
  let table = LogitLabelled::new()
  for index in 0..<80000 {
    table.add(
      LogitKey::new(ScalarNumber::Integer(@bigint.BigInt::from_int(index))),
    )
  }
  assert_eq(table.used, 80000)
  assert_eq(table.table.length(), 262144)
  let mut checksum = 14695981039346656037UL
  for key in table.keys() {
    checksum = (checksum ^ scalar_numeric_integer(key.value()).to_uint64()) *
      1099511628211UL
  }
  assert_eq(checksum, 16390251996665592997UL)
  table.clear()
  assert_eq(table.used, 0)
  assert_eq(table.table.length(), 8)
}
