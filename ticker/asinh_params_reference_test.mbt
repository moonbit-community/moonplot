// Complete original AsinhLocator object, update and alias observations.

///|
fn verify_asinh_params_number(actual : Double, expected : Double) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
fn verify_asinh_params_values(
  actual : Array[Double],
  expected : Array[Double],
) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    verify_asinh_params_number(actual[index], value)
  }
}

///|
fn verify_asinh_params_count(
  actual : @ticker.LogNumTicks?,
  expected : @ticker.LogNumTicks?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(@ticker.LogNumTicks::Text(a)), Some(@ticker.LogNumTicks::Text(b))) =>
      assert_eq(a, b)
    (
      Some(@ticker.LogNumTicks::Integer(a)),
      Some(@ticker.LogNumTicks::Integer(b)),
    ) => assert_eq(a, b)
    (Some(@ticker.LogNumTicks::Number(a)), Some(@ticker.LogNumTicks::Number(b))) =>
      verify_asinh_params_number(a, b)
    _ => fail("unexpected asinh count storage")
  }
}

///|
fn verify_asinh_params_subs(
  actual : @ticker.AsinhSubs?,
  expected : @ticker.AsinhSubs?,
) -> Unit raise {
  match (actual, expected) {
    (None, None) => ()
    (Some(@ticker.AsinhSubs::Sequence(a)), Some(@ticker.AsinhSubs::Sequence(b))) =>
      verify_asinh_params_values(a, b)
    (Some(@ticker.AsinhSubs::NdArray(a)), Some(@ticker.AsinhSubs::NdArray(b))) =>
      verify_asinh_params_values(a.to_array(), b.to_array())
    (Some(@ticker.AsinhSubs::Number(a)), Some(@ticker.AsinhSubs::Number(b))) =>
      verify_asinh_params_number(a, b)
    (Some(@ticker.AsinhSubs::Text(a)), Some(@ticker.AsinhSubs::Text(b))) =>
      assert_eq(a, b)
    _ => fail("unexpected asinh subs storage")
  }
}

///|
test "Asinh original raw constructor 0" {
  let locator = @ticker.AsinhLocator::new(1.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 1" {
  let locator = @ticker.AsinhLocator::new(0.0)
  verify_asinh_params_number(locator.linear_width(), 0.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 2" {
  let locator = @ticker.AsinhLocator::new(-0.0)
  verify_asinh_params_number(locator.linear_width(), -0.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 3" {
  let locator = @ticker.AsinhLocator::new(-1.0)
  verify_asinh_params_number(locator.linear_width(), -1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 4" {
  let locator = @ticker.AsinhLocator::new(0.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), 0.0 / 0.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 5" {
  let locator = @ticker.AsinhLocator::new(1.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0 / 0.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 6" {
  let locator = @ticker.AsinhLocator::new(-1.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), -1.0 / 0.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 7" {
  let locator = @ticker.AsinhLocator::new(5.0e-324)
  verify_asinh_params_number(locator.linear_width(), 5.0e-324)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 8" {
  let locator = @ticker.AsinhLocator::new(1.7976931348623157e+308)
  verify_asinh_params_number(locator.linear_width(), 1.7976931348623157e+308)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 9" {
  let locator = @ticker.AsinhLocator::new(1.0, symthresh=0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.0)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 10" {
  let locator = @ticker.AsinhLocator::new(1.0, symthresh=-0.2)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), -0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 11" {
  let locator = @ticker.AsinhLocator::new(1.0, symthresh=0.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.0 / 0.0)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 12" {
  let locator = @ticker.AsinhLocator::new(1.0, symthresh=1.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 1.0 / 0.0)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 13" {
  let locator = @ticker.AsinhLocator::new(1.0, symthresh=-1.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), -1.0 / 0.0)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 14" {
  let locator = @ticker.AsinhLocator::new(1.0, base=0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 0.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 15" {
  let locator = @ticker.AsinhLocator::new(1.0, base=-0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), -0.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 16" {
  let locator = @ticker.AsinhLocator::new(1.0, base=-1.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), -1.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 17" {
  let locator = @ticker.AsinhLocator::new(1.0, base=1.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 1.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 18" {
  let locator = @ticker.AsinhLocator::new(1.0, base=2.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 19" {
  let locator = @ticker.AsinhLocator::new(1.0, base=2.5)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 2.5)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 20" {
  let locator = @ticker.AsinhLocator::new(1.0, base=0.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 0.0 / 0.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 21" {
  let locator = @ticker.AsinhLocator::new(1.0, base=1.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 1.0 / 0.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 22" {
  let locator = @ticker.AsinhLocator::new(1.0, base=-1.0 / 0.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), -1.0 / 0.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 23" {
  let locator = @ticker.AsinhLocator::new(1.0, numticks=None)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(locator.numticks(), None)
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 24" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 25" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1")),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("1"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 26" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 27" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Number(11.0)),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Number(11.0)),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 28" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Number(2.5)),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Number(2.5)),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 29" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Number(0.0 / 0.0)),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Number(0.0 / 0.0)),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 30" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Number(1.0 / 0.0)),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Number(1.0 / 0.0)),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 31" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Text("auto")),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Text("auto")),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 32" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string("9223372036854775808"),
      ),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string("9223372036854775808"),
      ),
    ),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 33" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 34" {
  let locator = @ticker.AsinhLocator::new(1.0, subs=None)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 35" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 36" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([0.0])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([0.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 37" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 38" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 39" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([0.0]))),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([0.0]))),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 40" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([2.0, 5.0])),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([2.0, 5.0]))),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 41" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([2L, 5L])),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([2L, 5L])),
    ),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 42" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Number(0.0)),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), Some(@ticker.AsinhSubs::Number(0.0)))
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 43" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Number(2.0)),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), Some(@ticker.AsinhSubs::Number(2.0)))
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 44" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Number(0.0 / 0.0)),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Number(0.0 / 0.0)),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 45" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Text("")),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), Some(@ticker.AsinhSubs::Text("")))
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original raw constructor 46" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Text("auto")),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Text("auto")),
  )
  assert_true(locator.view_interval_provider() is None)
}

///|
test "Asinh original ordered partial update 0" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 1" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(numticks=None, symthresh=None, base=None, subs=None)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 2" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
    symthresh=Some(0.4),
    base=Some(2.0),
    subs=None,
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 3" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
    symthresh=Some(0.4),
    base=Some(2.0),
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(locator.subs(), None)
}

///|
test "Asinh original ordered partial update 4" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
    symthresh=Some(0.4),
    base=Some(2.0),
    subs=Some(@ticker.AsinhSubs::Sequence([0.0])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([0.0])),
  )
}

///|
test "Asinh original ordered partial update 5" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
    symthresh=Some(0.4),
    base=Some(2.0),
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(locator.subs(), None)
}

///|
test "Asinh original ordered partial update 6" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
    symthresh=Some(0.4),
    base=Some(2.0),
    subs=Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([0L])),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([0L]))),
  )
}

///|
test "Asinh original ordered partial update 7" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
    symthresh=Some(0.4),
    base=Some(2.0),
    subs=Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([2L, 5L])),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([2L, 5L])),
    ),
  )
}

///|
test "Asinh original ordered partial update 8" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          numticks=Some(
            @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
          ),
          symthresh=Some(0.4),
          base=Some(2.0),
          subs=Some(@ticker.AsinhSubs::Number(0.0)),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 9" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          numticks=Some(
            @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
          ),
          symthresh=Some(0.4),
          base=Some(2.0),
          subs=Some(@ticker.AsinhSubs::Number(2.0)),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 10" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  assert_true(
    try {
      ignore(
        locator.set_params(
          numticks=Some(
            @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
          ),
          symthresh=Some(0.4),
          base=Some(2.0),
          subs=Some(@ticker.AsinhSubs::Number(0.0 / 0.0)),
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 11" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
    symthresh=Some(0.4),
    base=Some(2.0),
    subs=Some(@ticker.AsinhSubs::Text("")),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(locator.subs(), None)
}

///|
test "Asinh original ordered partial update 12" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3")),
    ),
    symthresh=Some(0.4),
    base=Some(2.0),
    subs=Some(@ticker.AsinhSubs::Text("auto")),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.4)
  verify_asinh_params_number(locator.base(), 2.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Text("auto")),
  )
}

///|
test "Asinh original ordered partial update 13" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 14" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 15" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(numticks=Some(@ticker.LogNumTicks::Number(11.0)))
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Number(11.0)),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 16" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(numticks=Some(@ticker.LogNumTicks::Number(0.0 / 0.0)))
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Number(0.0 / 0.0)),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 17" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(numticks=Some(@ticker.LogNumTicks::Text("auto")))
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Text("auto")),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 18" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string("9223372036854775808"),
      ),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string("9223372036854775808"),
      ),
    ),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original ordered partial update 19" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  locator.set_params(
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
}

///|
test "Asinh original delayed parameter consumption 0" {
  let locator = @ticker.AsinhLocator::new(1.0, numticks=None)
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 1" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("-1")),
    ),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 2" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Number(11.0)),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 3" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Number(2.5)),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 4" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Number(0.0 / 0.0)),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 5" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Number(1.0 / 0.0)),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 6" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Text("auto")),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 7" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string("9223372036854775808"),
      ),
    ),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 8" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(
        @bigint.BigInt::from_string(
          "10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
      ),
    ),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 9" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  assert_true(
    try {
      ignore(locator.tick_values(-1.0, 1.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 10" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(
      @ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("0")),
    ),
  )
  verify_asinh_params_values(locator.tick_values(1.0, 2.0), [])
}

///|
test "Asinh original delayed parameter consumption 11" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_values(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh original delayed parameter consumption 12" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence([0.0])),
  )
  verify_asinh_params_values(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh original delayed parameter consumption 13" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 14" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([0.0]))),
  )
  verify_asinh_params_values(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh original delayed parameter consumption 15" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([2.0, 5.0])),
    ),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 16" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([2L, 5L])),
    ),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original delayed parameter consumption 17" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Number(0.0)),
  )
  verify_asinh_params_values(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh original delayed parameter consumption 18" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Number(2.0)),
  )
  verify_asinh_params_values(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh original delayed parameter consumption 19" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Text("")),
  )
  verify_asinh_params_values(locator.tick_values(0.0, 0.0), [
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  ])
}

///|
test "Asinh original delayed parameter consumption 20" {
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Text("auto")),
  )
  assert_true(
    try {
      ignore(locator.tick_values(0.0, 0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(..) => true
      _ => false
    },
  )
}

///|
test "Asinh original ndarray alias Float64 signed" {
  let owner = [5.0, 2.0, 1.0]
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array(owner).view(-1, -1, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array([1.0, 2.0, 5.0]),
      ),
    ),
  )
  owner[2] = 3.75
  guard locator.subs() is Some(@ticker.AsinhSubs::NdArray(values)) else {
    fail("expected ndarray subs")
  }
  values.set(-1, 7.75)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array([3.75, 2.0, 7.75]),
      ),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array([3.75, 2.0, 7.75]),
      ),
    ),
  )
  verify_asinh_params_values(owner, [7.75, 2.0, 3.75])
  shallow.set_params(
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(3))),
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array([3.75, 2.0, 7.75]),
      ),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
}

///|
test "Asinh original ndarray alias Float64 nested" {
  let owner = [1.0, 0.0, 2.0, 0.0, 5.0]
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array(owner).view(0, 1, 5).view(4, -2, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array([5.0, 2.0, 1.0]),
      ),
    ),
  )
  owner[4] = 3.75
  guard locator.subs() is Some(@ticker.AsinhSubs::NdArray(values)) else {
    fail("expected ndarray subs")
  }
  values.set(-1, 7.75)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array([3.75, 2.0, 7.75]),
      ),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array([3.75, 2.0, 7.75]),
      ),
    ),
  )
  verify_asinh_params_values(owner, [7.75, 0.0, 2.0, 0.0, 3.75])
  shallow.set_params(
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(3))),
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_array([3.75, 2.0, 7.75]),
      ),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
}

///|
test "Asinh original ndarray alias Int64 signed" {
  let owner = [5L, 2L, 1L]
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array(owner).view(-1, -1, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([1L, 2L, 5L]),
      ),
    ),
  )
  owner[2] = 3L
  guard locator.subs() is Some(@ticker.AsinhSubs::NdArray(values)) else {
    fail("expected ndarray subs")
  }
  values.set(-1, 7.75)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([3L, 2L, 7L]),
      ),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([3L, 2L, 7L]),
      ),
    ),
  )
  assert_eq(owner, [7L, 2L, 3L])
  shallow.set_params(
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(3))),
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([3L, 2L, 7L]),
      ),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
}

///|
test "Asinh original ndarray alias Int64 exact" {
  let owner = [9007199254740993L, 9223372036854775807L]
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array(owner)),
    ),
  )
  let shallow = locator.copy()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([
          9007199254740993L, 9223372036854775807L,
        ]),
      ),
    ),
  )
  owner[0] = 3L
  guard locator.subs() is Some(@ticker.AsinhSubs::NdArray(values)) else {
    fail("expected ndarray subs")
  }
  values.set(-1, 7.75)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([3L, 7L])),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([3L, 7L])),
    ),
  )
  assert_eq(owner, [3L, 7L])
  shallow.set_params(
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(3))),
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(@ticker.TickValues::from_int64_array([3L, 7L])),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
}

///|
test "Asinh original ndarray alias Int64 zero stride" {
  let owner = [2L]
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array(owner).view(0, 0, 3),
      ),
    ),
  )
  let shallow = locator.copy()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([2L, 2L, 2L]),
      ),
    ),
  )
  owner[0] = 3L
  guard locator.subs() is Some(@ticker.AsinhSubs::NdArray(values)) else {
    fail("expected ndarray subs")
  }
  values.set(-1, 7.75)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([7L, 7L, 7L]),
      ),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([7L, 7L, 7L]),
      ),
    ),
  )
  assert_eq(owner, [7L])
  shallow.set_params(
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(3))),
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(
      @ticker.AsinhSubs::NdArray(
        @ticker.TickValues::from_int64_array([7L, 7L, 7L]),
      ),
    ),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
}

///|
test "Asinh original ndarray alias Float64 empty" {
  let owner = []
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array(owner))),
  )
  let shallow = locator.copy()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  verify_asinh_params_values(owner, [])
  shallow.set_params(
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(3))),
    subs=Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("3"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
}

///|
test "Asinh original live list and empty reset 0" {
  let owner = []
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence(owner)),
  )
  let shallow = locator.copy()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(@ticker.AsinhSubs::Sequence([])),
  )
  owner.push(3.75)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([3.75])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(@ticker.AsinhSubs::Sequence([3.75])),
  )
  guard locator.subs() is Some(@ticker.AsinhSubs::Sequence(values)) else {
    fail("expected sequence subs")
  }
  values[values.length() - 1] = 7.75
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([7.75])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(@ticker.AsinhSubs::Sequence([7.75])),
  )
  shallow.set_params(subs=Some(@ticker.AsinhSubs::Sequence([])))
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([7.75])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
  owner.clear()
  locator.set_subs(Some(@ticker.AsinhSubs::Sequence(owner)))
  owner.push(2.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
  owner.clear()
  locator.set_params(subs=Some(@ticker.AsinhSubs::Sequence(owner)))
  owner.push(5.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
}

///|
test "Asinh original live list and empty reset 1" {
  let owner = [2.0, 5.0]
  let locator = @ticker.AsinhLocator::new(
    1.0,
    subs=Some(@ticker.AsinhSubs::Sequence(owner)),
  )
  let shallow = locator.copy()
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0])),
  )
  owner.push(3.75)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0, 3.75])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0, 3.75])),
  )
  guard locator.subs() is Some(@ticker.AsinhSubs::Sequence(values)) else {
    fail("expected sequence subs")
  }
  values[values.length() - 1] = 7.75
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0, 7.75])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0, 7.75])),
  )
  shallow.set_params(subs=Some(@ticker.AsinhSubs::Sequence([])))
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0, 5.0, 7.75])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
  owner.clear()
  locator.set_subs(Some(@ticker.AsinhSubs::Sequence(owner)))
  owner.push(2.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(
    locator.subs(),
    Some(@ticker.AsinhSubs::Sequence([2.0])),
  )
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
  owner.clear()
  locator.set_params(subs=Some(@ticker.AsinhSubs::Sequence(owner)))
  owner.push(5.0)
  verify_asinh_params_number(locator.linear_width(), 1.0)
  verify_asinh_params_count(
    locator.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(locator.symthresh(), 0.2)
  verify_asinh_params_number(locator.base(), 10.0)
  verify_asinh_params_subs(locator.subs(), None)
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
}

///|
test "Asinh original raw public slots bypass normalization" {
  let locator = @ticker.AsinhLocator::new(1.0)
  let shallow = locator.copy()
  locator.set_linear_width(-0.0)
  locator.set_numticks(None)
  locator.set_symthresh(1.0 / 0.0)
  locator.set_base(0.0 / 0.0)
  locator.set_subs(Some(@ticker.AsinhSubs::Number(0.0)))
  verify_asinh_params_number(locator.linear_width(), -0.0)
  verify_asinh_params_count(locator.numticks(), None)
  verify_asinh_params_number(locator.symthresh(), 1.0 / 0.0)
  verify_asinh_params_number(locator.base(), 0.0 / 0.0)
  verify_asinh_params_subs(locator.subs(), Some(@ticker.AsinhSubs::Number(0.0)))
  verify_asinh_params_number(shallow.linear_width(), 1.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_string("11"))),
  )
  verify_asinh_params_number(shallow.symthresh(), 0.2)
  verify_asinh_params_number(shallow.base(), 10.0)
  verify_asinh_params_subs(shallow.subs(), None)
  shallow.set_linear_width(2.0)
  shallow.set_numticks(Some(@ticker.LogNumTicks::Number(2.5)))
  shallow.set_symthresh(-1.0)
  shallow.set_base(0.0)
  shallow.set_subs(Some(@ticker.AsinhSubs::Sequence([])))
  verify_asinh_params_number(locator.linear_width(), -0.0)
  verify_asinh_params_count(locator.numticks(), None)
  verify_asinh_params_number(locator.symthresh(), 1.0 / 0.0)
  verify_asinh_params_number(locator.base(), 0.0 / 0.0)
  verify_asinh_params_subs(locator.subs(), Some(@ticker.AsinhSubs::Number(0.0)))
  verify_asinh_params_number(shallow.linear_width(), 2.0)
  verify_asinh_params_count(
    shallow.numticks(),
    Some(@ticker.LogNumTicks::Number(2.5)),
  )
  verify_asinh_params_number(shallow.symthresh(), -1.0)
  verify_asinh_params_number(shallow.base(), 0.0)
  verify_asinh_params_subs(
    shallow.subs(),
    Some(@ticker.AsinhSubs::Sequence([])),
  )
}

///|
test "Asinh original inherited ranges 0" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.AsinhLocator::new(
    0.0 / 0.0,
    numticks=None,
    symthresh=0.0 / 0.0,
    base=0.0 / 0.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_asinh_params_values([lo, hi], [-0.05, 0.05])
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_asinh_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.nonsingular(0.0, 0.0)
  verify_asinh_params_values([lo, hi], [-0.05, 0.05])
  let (lo, hi) = locator.view_limits(0.0, 0.0)
  verify_asinh_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "Asinh original inherited ranges 1" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.AsinhLocator::new(
    0.0 / 0.0,
    numticks=None,
    symthresh=0.0 / 0.0,
    base=0.0 / 0.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_asinh_params_values([lo, hi], [0.95, 1.05])
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_asinh_params_values([lo, hi], [0.999, 1.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.nonsingular(1.0, 1.0)
  verify_asinh_params_values([lo, hi], [0.95, 1.05])
  let (lo, hi) = locator.view_limits(1.0, 1.0)
  verify_asinh_params_values([lo, hi], [0.999, 1.001])
}

///|
test "Asinh original inherited ranges 2" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.AsinhLocator::new(
    0.0 / 0.0,
    numticks=None,
    symthresh=0.0 / 0.0,
    base=0.0 / 0.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_asinh_params_values([lo, hi], [-2.0, 10.0])
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_asinh_params_values([lo, hi], [-2.0, 10.0])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.nonsingular(10.0, -2.0)
  verify_asinh_params_values([lo, hi], [-2.0, 10.0])
  let (lo, hi) = locator.view_limits(10.0, -2.0)
  verify_asinh_params_values([lo, hi], [-2.0, 10.0])
}

///|
test "Asinh original inherited ranges 3" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.AsinhLocator::new(
    0.0 / 0.0,
    numticks=None,
    symthresh=0.0 / 0.0,
    base=0.0 / 0.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_asinh_params_values([lo, hi], [-0.05, 0.05])
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_asinh_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.nonsingular(-1.0 / 0.0, 1.0 / 0.0)
  verify_asinh_params_values([lo, hi], [-0.05, 0.05])
  let (lo, hi) = locator.view_limits(-1.0 / 0.0, 1.0 / 0.0)
  verify_asinh_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "Asinh original inherited ranges 4" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.AsinhLocator::new(
    0.0 / 0.0,
    numticks=None,
    symthresh=0.0 / 0.0,
    base=0.0 / 0.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_asinh_params_values([lo, hi], [-0.05, 0.05])
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_asinh_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.nonsingular(0.0 / 0.0, 1.0)
  verify_asinh_params_values([lo, hi], [-0.05, 0.05])
  let (lo, hi) = locator.view_limits(0.0 / 0.0, 1.0)
  verify_asinh_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "Asinh original inherited ranges 5" {
  let previous = @config.axes_autolimit_mode()
  defer @config.set_axes_autolimit_mode(previous)
  let locator = @ticker.AsinhLocator::new(
    0.0 / 0.0,
    numticks=None,
    symthresh=0.0 / 0.0,
    base=0.0 / 0.0,
    subs=Some(@ticker.AsinhSubs::NdArray(@ticker.TickValues::from_array([]))),
  )
  @config.set_axes_autolimit_mode("data")
  let (lo, hi) = locator.nonsingular(5.0e-324, 5.0e-324)
  verify_asinh_params_values([lo, hi], [-0.05, 0.05])
  let (lo, hi) = locator.view_limits(5.0e-324, 5.0e-324)
  verify_asinh_params_values([lo, hi], [-0.001, 0.001])
  @config.set_axes_autolimit_mode("round_numbers")
  let (lo, hi) = locator.nonsingular(5.0e-324, 5.0e-324)
  verify_asinh_params_values([lo, hi], [-0.05, 0.05])
  let (lo, hi) = locator.view_limits(5.0e-324, 5.0e-324)
  verify_asinh_params_values([lo, hi], [-0.001, 0.001])
}

///|
test "Asinh original owner view copy and rebind" {
  let events : Array[String] = []
  let view = Ref((8.0, -10.0))
  let locator = @ticker.AsinhLocator::new(
    1.0,
    numticks=Some(@ticker.LogNumTicks::Integer(@bigint.BigInt::from_int(1))),
  )
  locator.bind_view_interval(fn() {
    events.push("first")
    view.val
  })
  let shallow = locator.copy()
  verify_asinh_params_values(locator.call(), [8.0])
  view.val = (-10.0, 9.0)
  verify_asinh_params_values(shallow.call(), [-10.0])
  locator.bind_view_interval(fn() {
    events.push("second")
    (1.0, 2.0)
  })
  verify_asinh_params_values(locator.call(), [1.0])
  verify_asinh_params_values(shallow.call(), [-10.0])
  assert_eq(events, ["first", "first", "second", "first"])
}
