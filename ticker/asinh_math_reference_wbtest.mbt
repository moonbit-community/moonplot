// Independent Decimal oracle; actual Darwin NumPy values are retained separately.

///|
fn verify_asinh_math_reference_number(
  actual : Double,
  expected : Double,
) -> Unit raise {
  if expected.is_nan() {
    assert_true(actual.is_nan())
  } else {
    assert_eq(actual.reinterpret_as_uint64(), expected.reinterpret_as_uint64())
  }
}

///|
test "Asinh independent asinh 0" {
  let actual = asinh_math_asinh(0.0)
  verify_asinh_math_reference_number(actual, 0.0)
}

///|
test "Asinh independent asinh 1" {
  let actual = asinh_math_asinh(-0.0)
  verify_asinh_math_reference_number(actual, -0.0)
}

///|
test "Asinh independent asinh 2" {
  let actual = asinh_math_asinh(0.0 / 0.0)
  verify_asinh_math_reference_number(actual, 0.0 / 0.0)
}

///|
test "Asinh independent asinh 3" {
  let actual = asinh_math_asinh(1.0 / 0.0)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent asinh 4" {
  let actual = asinh_math_asinh(-1.0 / 0.0)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent asinh 5" {
  let actual = asinh_math_asinh(5.0e-324)
  verify_asinh_math_reference_number(actual, 5.0e-324)
}

///|
test "Asinh independent asinh 6" {
  let actual = asinh_math_asinh(-5.0e-324)
  verify_asinh_math_reference_number(actual, -5.0e-324)
}

///|
test "Asinh independent asinh 7" {
  let actual = asinh_math_asinh(1.0e-323)
  verify_asinh_math_reference_number(actual, 1.0e-323)
}

///|
test "Asinh independent asinh 8" {
  let actual = asinh_math_asinh(-1.0e-323)
  verify_asinh_math_reference_number(actual, -1.0e-323)
}

///|
test "Asinh independent asinh 9" {
  let actual = asinh_math_asinh(1.5e-323)
  verify_asinh_math_reference_number(actual, 1.5e-323)
}

///|
test "Asinh independent asinh 10" {
  let actual = asinh_math_asinh(-1.5e-323)
  verify_asinh_math_reference_number(actual, -1.5e-323)
}

///|
test "Asinh independent asinh 11" {
  let actual = asinh_math_asinh(2.2250738585072014e-308)
  verify_asinh_math_reference_number(actual, 2.2250738585072014e-308)
}

///|
test "Asinh independent asinh 12" {
  let actual = asinh_math_asinh(-2.2250738585072014e-308)
  verify_asinh_math_reference_number(actual, -2.2250738585072014e-308)
}

///|
test "Asinh independent asinh 13" {
  let actual = asinh_math_asinh(1.0e-320)
  verify_asinh_math_reference_number(actual, 1.0e-320)
}

///|
test "Asinh independent asinh 14" {
  let actual = asinh_math_asinh(-1.0e-320)
  verify_asinh_math_reference_number(actual, -1.0e-320)
}

///|
test "Asinh independent asinh 15" {
  let actual = asinh_math_asinh(1.0e-308)
  verify_asinh_math_reference_number(actual, 1.0e-308)
}

///|
test "Asinh independent asinh 16" {
  let actual = asinh_math_asinh(-1.0e-308)
  verify_asinh_math_reference_number(actual, -1.0e-308)
}

///|
test "Asinh independent asinh 17" {
  let actual = asinh_math_asinh(1.0e-100)
  verify_asinh_math_reference_number(actual, 1.0e-100)
}

///|
test "Asinh independent asinh 18" {
  let actual = asinh_math_asinh(-1.0e-100)
  verify_asinh_math_reference_number(actual, -1.0e-100)
}

///|
test "Asinh independent asinh 19" {
  let actual = asinh_math_asinh(1.0e-20)
  verify_asinh_math_reference_number(actual, 1.0e-20)
}

///|
test "Asinh independent asinh 20" {
  let actual = asinh_math_asinh(-1.0e-20)
  verify_asinh_math_reference_number(actual, -1.0e-20)
}

///|
test "Asinh independent asinh 21" {
  let actual = asinh_math_asinh(0.1)
  verify_asinh_math_reference_number(actual, 0.09983407889920756)
  assert_true(actual.reinterpret_as_uint64() != 4591858224191634495UL)
}

///|
test "Asinh independent asinh 22" {
  let actual = asinh_math_asinh(-0.1)
  verify_asinh_math_reference_number(actual, -0.09983407889920756)
  assert_true(actual.reinterpret_as_uint64() != 13815230261046410303UL)
}

///|
test "Asinh independent asinh 23" {
  let actual = asinh_math_asinh(0.5)
  verify_asinh_math_reference_number(actual, 0.48121182505960347)
}

///|
test "Asinh independent asinh 24" {
  let actual = asinh_math_asinh(-0.5)
  verify_asinh_math_reference_number(actual, -0.48121182505960347)
}

///|
test "Asinh independent asinh 25" {
  let actual = asinh_math_asinh(1.0)
  verify_asinh_math_reference_number(actual, 0.881373587019543)
}

///|
test "Asinh independent asinh 26" {
  let actual = asinh_math_asinh(-1.0)
  verify_asinh_math_reference_number(actual, -0.881373587019543)
}

///|
test "Asinh independent asinh 27" {
  let actual = asinh_math_asinh(2.0)
  verify_asinh_math_reference_number(actual, 1.4436354751788103)
}

///|
test "Asinh independent asinh 28" {
  let actual = asinh_math_asinh(-2.0)
  verify_asinh_math_reference_number(actual, -1.4436354751788103)
}

///|
test "Asinh independent asinh 29" {
  let actual = asinh_math_asinh(10.0)
  verify_asinh_math_reference_number(actual, 2.99822295029797)
}

///|
test "Asinh independent asinh 30" {
  let actual = asinh_math_asinh(-10.0)
  verify_asinh_math_reference_number(actual, -2.99822295029797)
}

///|
test "Asinh independent asinh 31" {
  let actual = asinh_math_asinh(100.0)
  verify_asinh_math_reference_number(actual, 5.298342365610589)
}

///|
test "Asinh independent asinh 32" {
  let actual = asinh_math_asinh(-100.0)
  verify_asinh_math_reference_number(actual, -5.298342365610589)
}

///|
test "Asinh independent asinh 33" {
  let actual = asinh_math_asinh(1000.0)
  verify_asinh_math_reference_number(actual, 7.600902709541988)
}

///|
test "Asinh independent asinh 34" {
  let actual = asinh_math_asinh(-1000.0)
  verify_asinh_math_reference_number(actual, -7.600902709541988)
}

///|
test "Asinh independent asinh 35" {
  let actual = asinh_math_asinh(3.725290298461914e-09)
  verify_asinh_math_reference_number(actual, 3.725290298461914e-09)
}

///|
test "Asinh independent asinh 36" {
  let actual = asinh_math_asinh(-3.725290298461914e-09)
  verify_asinh_math_reference_number(actual, -3.725290298461914e-09)
}

///|
test "Asinh independent asinh 37" {
  let actual = asinh_math_asinh(3.7252902984619136e-09)
  verify_asinh_math_reference_number(actual, 3.7252902984619136e-09)
}

///|
test "Asinh independent asinh 38" {
  let actual = asinh_math_asinh(-3.7252902984619136e-09)
  verify_asinh_math_reference_number(actual, -3.7252902984619136e-09)
}

///|
test "Asinh independent asinh 39" {
  let actual = asinh_math_asinh(3.725290298461915e-09)
  verify_asinh_math_reference_number(actual, 3.725290298461915e-09)
}

///|
test "Asinh independent asinh 40" {
  let actual = asinh_math_asinh(-3.725290298461915e-09)
  verify_asinh_math_reference_number(actual, -3.725290298461915e-09)
}

///|
test "Asinh independent asinh 41" {
  let actual = asinh_math_asinh(3.7252902984619132e-09)
  verify_asinh_math_reference_number(actual, 3.7252902984619132e-09)
}

///|
test "Asinh independent asinh 42" {
  let actual = asinh_math_asinh(-3.7252902984619132e-09)
  verify_asinh_math_reference_number(actual, -3.7252902984619132e-09)
}

///|
test "Asinh independent asinh 43" {
  let actual = asinh_math_asinh(3.725290298461916e-09)
  verify_asinh_math_reference_number(actual, 3.725290298461916e-09)
}

///|
test "Asinh independent asinh 44" {
  let actual = asinh_math_asinh(-3.725290298461916e-09)
  verify_asinh_math_reference_number(actual, -3.725290298461916e-09)
}

///|
test "Asinh independent asinh 45" {
  let actual = asinh_math_asinh(7.450580596923828e-09)
  verify_asinh_math_reference_number(actual, 7.450580596923828e-09)
}

///|
test "Asinh independent asinh 46" {
  let actual = asinh_math_asinh(-7.450580596923828e-09)
  verify_asinh_math_reference_number(actual, -7.450580596923828e-09)
}

///|
test "Asinh independent asinh 47" {
  let actual = asinh_math_asinh(7.450580596923827e-09)
  verify_asinh_math_reference_number(actual, 7.450580596923827e-09)
}

///|
test "Asinh independent asinh 48" {
  let actual = asinh_math_asinh(-7.450580596923827e-09)
  verify_asinh_math_reference_number(actual, -7.450580596923827e-09)
}

///|
test "Asinh independent asinh 49" {
  let actual = asinh_math_asinh(7.45058059692383e-09)
  verify_asinh_math_reference_number(actual, 7.45058059692383e-09)
}

///|
test "Asinh independent asinh 50" {
  let actual = asinh_math_asinh(-7.45058059692383e-09)
  verify_asinh_math_reference_number(actual, -7.45058059692383e-09)
}

///|
test "Asinh independent asinh 51" {
  let actual = asinh_math_asinh(2.225073858507201e-308)
  verify_asinh_math_reference_number(actual, 2.225073858507201e-308)
}

///|
test "Asinh independent asinh 52" {
  let actual = asinh_math_asinh(-2.225073858507201e-308)
  verify_asinh_math_reference_number(actual, -2.225073858507201e-308)
}

///|
test "Asinh independent asinh 53" {
  let actual = asinh_math_asinh(2.225073858507202e-308)
  verify_asinh_math_reference_number(actual, 2.225073858507202e-308)
}

///|
test "Asinh independent asinh 54" {
  let actual = asinh_math_asinh(-2.225073858507202e-308)
  verify_asinh_math_reference_number(actual, -2.225073858507202e-308)
}

///|
test "Asinh independent asinh 55" {
  let actual = asinh_math_asinh(1.0e+100)
  verify_asinh_math_reference_number(actual, 230.95165647996453)
}

///|
test "Asinh independent asinh 56" {
  let actual = asinh_math_asinh(-1.0e+100)
  verify_asinh_math_reference_number(actual, -230.95165647996453)
}

///|
test "Asinh independent asinh 57" {
  let actual = asinh_math_asinh(1.0e+200)
  verify_asinh_math_reference_number(actual, 461.2101657793691)
}

///|
test "Asinh independent asinh 58" {
  let actual = asinh_math_asinh(-1.0e+200)
  verify_asinh_math_reference_number(actual, -461.2101657793691)
}

///|
test "Asinh independent asinh 59" {
  let actual = asinh_math_asinh(1.0e+308)
  verify_asinh_math_reference_number(actual, 709.889355822726)
}

///|
test "Asinh independent asinh 60" {
  let actual = asinh_math_asinh(-1.0e+308)
  verify_asinh_math_reference_number(actual, -709.889355822726)
}

///|
test "Asinh independent asinh 61" {
  let actual = asinh_math_asinh(1.7976931348623157e+308)
  verify_asinh_math_reference_number(actual, 710.475860073944)
  assert_true(actual.reinterpret_as_uint64() != 4649460627574225021UL)
}

///|
test "Asinh independent asinh 62" {
  let actual = asinh_math_asinh(-1.7976931348623157e+308)
  verify_asinh_math_reference_number(actual, -710.475860073944)
  assert_true(actual.reinterpret_as_uint64() != 13872832664429000829UL)
}

///|
test "Asinh independent asinh 63" {
  let actual = asinh_math_asinh(0.9999999999999999)
  verify_asinh_math_reference_number(actual, 0.8813735870195429)
}

///|
test "Asinh independent asinh 64" {
  let actual = asinh_math_asinh(-0.9999999999999999)
  verify_asinh_math_reference_number(actual, -0.8813735870195429)
}

///|
test "Asinh independent asinh 65" {
  let actual = asinh_math_asinh(1.0000000000000002)
  verify_asinh_math_reference_number(actual, 0.8813735870195432)
}

///|
test "Asinh independent asinh 66" {
  let actual = asinh_math_asinh(-1.0000000000000002)
  verify_asinh_math_reference_number(actual, -0.8813735870195432)
}

///|
test "Asinh independent asinh 67" {
  let actual = asinh_math_asinh(9.999999999999998)
  verify_asinh_math_reference_number(actual, 2.9982229502979694)
}

///|
test "Asinh independent asinh 68" {
  let actual = asinh_math_asinh(-9.999999999999998)
  verify_asinh_math_reference_number(actual, -2.9982229502979694)
}

///|
test "Asinh independent asinh 69" {
  let actual = asinh_math_asinh(10.000000000000002)
  verify_asinh_math_reference_number(actual, 2.99822295029797)
}

///|
test "Asinh independent asinh 70" {
  let actual = asinh_math_asinh(-10.000000000000002)
  verify_asinh_math_reference_number(actual, -2.99822295029797)
}

///|
test "Asinh independent asinh 71" {
  let actual = asinh_math_asinh(99.99999999999999)
  verify_asinh_math_reference_number(actual, 5.298342365610589)
}

///|
test "Asinh independent asinh 72" {
  let actual = asinh_math_asinh(-99.99999999999999)
  verify_asinh_math_reference_number(actual, -5.298342365610589)
}

///|
test "Asinh independent asinh 73" {
  let actual = asinh_math_asinh(100.00000000000001)
  verify_asinh_math_reference_number(actual, 5.298342365610589)
}

///|
test "Asinh independent asinh 74" {
  let actual = asinh_math_asinh(-100.00000000000001)
  verify_asinh_math_reference_number(actual, -5.298342365610589)
}

///|
test "Asinh independent asinh 75" {
  let actual = asinh_math_asinh(999.9999999999999)
  verify_asinh_math_reference_number(actual, 7.600902709541988)
}

///|
test "Asinh independent asinh 76" {
  let actual = asinh_math_asinh(-999.9999999999999)
  verify_asinh_math_reference_number(actual, -7.600902709541988)
}

///|
test "Asinh independent asinh 77" {
  let actual = asinh_math_asinh(1000.0000000000001)
  verify_asinh_math_reference_number(actual, 7.600902709541988)
}

///|
test "Asinh independent asinh 78" {
  let actual = asinh_math_asinh(-1000.0000000000001)
  verify_asinh_math_reference_number(actual, -7.600902709541988)
}

///|
test "Asinh independent asinh 79" {
  let actual = asinh_math_asinh(1.7976931348623155e+308)
  verify_asinh_math_reference_number(actual, 710.475860073944)
  assert_true(actual.reinterpret_as_uint64() != 4649460627574225021UL)
}

///|
test "Asinh independent asinh 80" {
  let actual = asinh_math_asinh(-1.7976931348623155e+308)
  verify_asinh_math_reference_number(actual, -710.475860073944)
  assert_true(actual.reinterpret_as_uint64() != 13872832664429000829UL)
}

///|
test "Asinh independent asinh 81" {
  let actual = asinh_math_asinh(3.699810317765155e+300)
  verify_asinh_math_reference_number(actual, 692.7769566316408)
}

///|
test "Asinh independent asinh 82" {
  let actual = asinh_math_asinh(-3.699810317765155e+300)
  verify_asinh_math_reference_number(actual, -692.7769566316408)
}

///|
test "Asinh independent asinh 83" {
  let actual = asinh_math_asinh(1.4253175199280404e-216)
  verify_asinh_math_reference_number(actual, 1.4253175199280404e-216)
}

///|
test "Asinh independent asinh 84" {
  let actual = asinh_math_asinh(-1.4253175199280404e-216)
  verify_asinh_math_reference_number(actual, -1.4253175199280404e-216)
}

///|
test "Asinh independent asinh 85" {
  let actual = asinh_math_asinh(1.9860043803972514e-212)
  verify_asinh_math_reference_number(actual, 1.9860043803972514e-212)
}

///|
test "Asinh independent asinh 86" {
  let actual = asinh_math_asinh(-1.9860043803972514e-212)
  verify_asinh_math_reference_number(actual, -1.9860043803972514e-212)
}

///|
test "Asinh independent asinh 87" {
  let actual = asinh_math_asinh(4.353774067027276e+206)
  verify_asinh_math_reference_number(actual, 476.4967194079007)
}

///|
test "Asinh independent asinh 88" {
  let actual = asinh_math_asinh(-4.353774067027276e+206)
  verify_asinh_math_reference_number(actual, -476.4967194079007)
}

///|
test "Asinh independent asinh 89" {
  let actual = asinh_math_asinh(9.653116874458389e-66)
  verify_asinh_math_reference_number(actual, 9.653116874458389e-66)
}

///|
test "Asinh independent asinh 90" {
  let actual = asinh_math_asinh(-9.653116874458389e-66)
  verify_asinh_math_reference_number(actual, -9.653116874458389e-66)
}

///|
test "Asinh independent asinh 91" {
  let actual = asinh_math_asinh(4.150054581351543e-21)
  verify_asinh_math_reference_number(actual, 4.150054581351543e-21)
}

///|
test "Asinh independent asinh 92" {
  let actual = asinh_math_asinh(-4.150054581351543e-21)
  verify_asinh_math_reference_number(actual, -4.150054581351543e-21)
}

///|
test "Asinh independent asinh 93" {
  let actual = asinh_math_asinh(99234848754951.95)
  verify_asinh_math_reference_number(actual, 32.92165754702163)
}

///|
test "Asinh independent asinh 94" {
  let actual = asinh_math_asinh(-99234848754951.95)
  verify_asinh_math_reference_number(actual, -32.92165754702163)
}

///|
test "Asinh independent asinh 95" {
  let actual = asinh_math_asinh(1.8471775419439224e-241)
  verify_asinh_math_reference_number(actual, 1.8471775419439224e-241)
}

///|
test "Asinh independent asinh 96" {
  let actual = asinh_math_asinh(-1.8471775419439224e-241)
  verify_asinh_math_reference_number(actual, -1.8471775419439224e-241)
}

///|
test "Asinh independent asinh 97" {
  let actual = asinh_math_asinh(4.590982840564325e-111)
  verify_asinh_math_reference_number(actual, 4.590982840564325e-111)
}

///|
test "Asinh independent asinh 98" {
  let actual = asinh_math_asinh(-4.590982840564325e-111)
  verify_asinh_math_reference_number(actual, -4.590982840564325e-111)
}

///|
test "Asinh independent asinh 99" {
  let actual = asinh_math_asinh(1.9293040048120616e-180)
  verify_asinh_math_reference_number(actual, 1.9293040048120616e-180)
}

///|
test "Asinh independent asinh 100" {
  let actual = asinh_math_asinh(-1.9293040048120616e-180)
  verify_asinh_math_reference_number(actual, -1.9293040048120616e-180)
}

///|
test "Asinh independent asinh 101" {
  let actual = asinh_math_asinh(2.5544351294683665e+246)
  verify_asinh_math_reference_number(actual, 568.0669111719513)
  assert_true(actual.reinterpret_as_uint64() != 4648207985212488228UL)
}

///|
test "Asinh independent asinh 102" {
  let actual = asinh_math_asinh(-2.5544351294683665e+246)
  verify_asinh_math_reference_number(actual, -568.0669111719513)
  assert_true(actual.reinterpret_as_uint64() != 13871580022067264036UL)
}

///|
test "Asinh independent asinh 103" {
  let actual = asinh_math_asinh(1.8366822591619744e+170)
  verify_asinh_math_reference_number(actual, 392.7405738135703)
}

///|
test "Asinh independent asinh 104" {
  let actual = asinh_math_asinh(-1.8366822591619744e+170)
  verify_asinh_math_reference_number(actual, -392.7405738135703)
}

///|
test "Asinh independent asinh 105" {
  let actual = asinh_math_asinh(7.091773728698459e+146)
  verify_asinh_math_reference_number(actual, 338.82950624024676)
}

///|
test "Asinh independent asinh 106" {
  let actual = asinh_math_asinh(-7.091773728698459e+146)
  verify_asinh_math_reference_number(actual, -338.82950624024676)
}

///|
test "Asinh independent asinh 107" {
  let actual = asinh_math_asinh(1.9109466216089914e-233)
  verify_asinh_math_reference_number(actual, 1.9109466216089914e-233)
}

///|
test "Asinh independent asinh 108" {
  let actual = asinh_math_asinh(-1.9109466216089914e-233)
  verify_asinh_math_reference_number(actual, -1.9109466216089914e-233)
}

///|
test "Asinh independent asinh 109" {
  let actual = asinh_math_asinh(3.8022499498293115e-59)
  verify_asinh_math_reference_number(actual, 3.8022499498293115e-59)
}

///|
test "Asinh independent asinh 110" {
  let actual = asinh_math_asinh(-3.8022499498293115e-59)
  verify_asinh_math_reference_number(actual, -3.8022499498293115e-59)
}

///|
test "Asinh independent asinh 111" {
  let actual = asinh_math_asinh(1.657396214129153e-170)
  verify_asinh_math_reference_number(actual, 1.657396214129153e-170)
}

///|
test "Asinh independent asinh 112" {
  let actual = asinh_math_asinh(-1.657396214129153e-170)
  verify_asinh_math_reference_number(actual, -1.657396214129153e-170)
}

///|
test "Asinh independent asinh 113" {
  let actual = asinh_math_asinh(3.5067804953384994e-59)
  verify_asinh_math_reference_number(actual, 3.5067804953384994e-59)
}

///|
test "Asinh independent asinh 114" {
  let actual = asinh_math_asinh(-3.5067804953384994e-59)
  verify_asinh_math_reference_number(actual, -3.5067804953384994e-59)
}

///|
test "Asinh independent asinh 115" {
  let actual = asinh_math_asinh(1.5859029771149241e-77)
  verify_asinh_math_reference_number(actual, 1.5859029771149241e-77)
}

///|
test "Asinh independent asinh 116" {
  let actual = asinh_math_asinh(-1.5859029771149241e-77)
  verify_asinh_math_reference_number(actual, -1.5859029771149241e-77)
}

///|
test "Asinh independent asinh 117" {
  let actual = asinh_math_asinh(3.4500417701260215e+226)
  verify_asinh_math_reference_number(actual, 522.3157645354671)
}

///|
test "Asinh independent asinh 118" {
  let actual = asinh_math_asinh(-3.4500417701260215e+226)
  verify_asinh_math_reference_number(actual, -522.3157645354671)
}

///|
test "Asinh independent asinh 119" {
  let actual = asinh_math_asinh(2.5493117660428197e+33)
  verify_asinh_math_reference_number(actual, 77.61427867643592)
}

///|
test "Asinh independent asinh 120" {
  let actual = asinh_math_asinh(-2.5493117660428197e+33)
  verify_asinh_math_reference_number(actual, -77.61427867643592)
}

///|
test "Asinh independent asinh 121" {
  let actual = asinh_math_asinh(4.815317521254916e+80)
  verify_asinh_math_reference_number(actual, 186.47175660734533)
}

///|
test "Asinh independent asinh 122" {
  let actual = asinh_math_asinh(-4.815317521254916e+80)
  verify_asinh_math_reference_number(actual, -186.47175660734533)
}

///|
test "Asinh independent asinh 123" {
  let actual = asinh_math_asinh(1.4392545425084418e+115)
  verify_asinh_math_reference_number(actual, 265.85455817560756)
}

///|
test "Asinh independent asinh 124" {
  let actual = asinh_math_asinh(-1.4392545425084418e+115)
  verify_asinh_math_reference_number(actual, -265.85455817560756)
}

///|
test "Asinh independent asinh 125" {
  let actual = asinh_math_asinh(8.23136279913855e-167)
  verify_asinh_math_reference_number(actual, 8.23136279913855e-167)
}

///|
test "Asinh independent asinh 126" {
  let actual = asinh_math_asinh(-8.23136279913855e-167)
  verify_asinh_math_reference_number(actual, -8.23136279913855e-167)
}

///|
test "Asinh independent asinh 127" {
  let actual = asinh_math_asinh(8.7779251941155e+246)
  verify_asinh_math_reference_number(actual, 569.3013201263512)
}

///|
test "Asinh independent asinh 128" {
  let actual = asinh_math_asinh(-8.7779251941155e+246)
  verify_asinh_math_reference_number(actual, -569.3013201263512)
}

///|
test "Asinh independent sinh 129" {
  let actual = asinh_math_sinh(0.0)
  verify_asinh_math_reference_number(actual, 0.0)
}

///|
test "Asinh independent sinh 130" {
  let actual = asinh_math_sinh(-0.0)
  verify_asinh_math_reference_number(actual, -0.0)
}

///|
test "Asinh independent sinh 131" {
  let actual = asinh_math_sinh(0.0 / 0.0)
  verify_asinh_math_reference_number(actual, 0.0 / 0.0)
}

///|
test "Asinh independent sinh 132" {
  let actual = asinh_math_sinh(1.0 / 0.0)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 133" {
  let actual = asinh_math_sinh(-1.0 / 0.0)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 134" {
  let actual = asinh_math_sinh(5.0e-324)
  verify_asinh_math_reference_number(actual, 5.0e-324)
}

///|
test "Asinh independent sinh 135" {
  let actual = asinh_math_sinh(-5.0e-324)
  verify_asinh_math_reference_number(actual, -5.0e-324)
}

///|
test "Asinh independent sinh 136" {
  let actual = asinh_math_sinh(1.0e-323)
  verify_asinh_math_reference_number(actual, 1.0e-323)
}

///|
test "Asinh independent sinh 137" {
  let actual = asinh_math_sinh(-1.0e-323)
  verify_asinh_math_reference_number(actual, -1.0e-323)
}

///|
test "Asinh independent sinh 138" {
  let actual = asinh_math_sinh(1.5e-323)
  verify_asinh_math_reference_number(actual, 1.5e-323)
}

///|
test "Asinh independent sinh 139" {
  let actual = asinh_math_sinh(-1.5e-323)
  verify_asinh_math_reference_number(actual, -1.5e-323)
}

///|
test "Asinh independent sinh 140" {
  let actual = asinh_math_sinh(2.2250738585072014e-308)
  verify_asinh_math_reference_number(actual, 2.2250738585072014e-308)
}

///|
test "Asinh independent sinh 141" {
  let actual = asinh_math_sinh(-2.2250738585072014e-308)
  verify_asinh_math_reference_number(actual, -2.2250738585072014e-308)
}

///|
test "Asinh independent sinh 142" {
  let actual = asinh_math_sinh(1.0e-320)
  verify_asinh_math_reference_number(actual, 1.0e-320)
}

///|
test "Asinh independent sinh 143" {
  let actual = asinh_math_sinh(-1.0e-320)
  verify_asinh_math_reference_number(actual, -1.0e-320)
}

///|
test "Asinh independent sinh 144" {
  let actual = asinh_math_sinh(1.0e-308)
  verify_asinh_math_reference_number(actual, 1.0e-308)
}

///|
test "Asinh independent sinh 145" {
  let actual = asinh_math_sinh(-1.0e-308)
  verify_asinh_math_reference_number(actual, -1.0e-308)
}

///|
test "Asinh independent sinh 146" {
  let actual = asinh_math_sinh(1.0e-100)
  verify_asinh_math_reference_number(actual, 1.0e-100)
}

///|
test "Asinh independent sinh 147" {
  let actual = asinh_math_sinh(-1.0e-100)
  verify_asinh_math_reference_number(actual, -1.0e-100)
}

///|
test "Asinh independent sinh 148" {
  let actual = asinh_math_sinh(1.0e-20)
  verify_asinh_math_reference_number(actual, 1.0e-20)
}

///|
test "Asinh independent sinh 149" {
  let actual = asinh_math_sinh(-1.0e-20)
  verify_asinh_math_reference_number(actual, -1.0e-20)
}

///|
test "Asinh independent sinh 150" {
  let actual = asinh_math_sinh(0.1)
  verify_asinh_math_reference_number(actual, 0.10016675001984403)
}

///|
test "Asinh independent sinh 151" {
  let actual = asinh_math_sinh(-0.1)
  verify_asinh_math_reference_number(actual, -0.10016675001984403)
}

///|
test "Asinh independent sinh 152" {
  let actual = asinh_math_sinh(0.5)
  verify_asinh_math_reference_number(actual, 0.5210953054937474)
}

///|
test "Asinh independent sinh 153" {
  let actual = asinh_math_sinh(-0.5)
  verify_asinh_math_reference_number(actual, -0.5210953054937474)
}

///|
test "Asinh independent sinh 154" {
  let actual = asinh_math_sinh(1.0)
  verify_asinh_math_reference_number(actual, 1.1752011936438014)
}

///|
test "Asinh independent sinh 155" {
  let actual = asinh_math_sinh(-1.0)
  verify_asinh_math_reference_number(actual, -1.1752011936438014)
}

///|
test "Asinh independent sinh 156" {
  let actual = asinh_math_sinh(2.0)
  verify_asinh_math_reference_number(actual, 3.6268604078470186)
}

///|
test "Asinh independent sinh 157" {
  let actual = asinh_math_sinh(-2.0)
  verify_asinh_math_reference_number(actual, -3.6268604078470186)
}

///|
test "Asinh independent sinh 158" {
  let actual = asinh_math_sinh(10.0)
  verify_asinh_math_reference_number(actual, 11013.232874703393)
}

///|
test "Asinh independent sinh 159" {
  let actual = asinh_math_sinh(-10.0)
  verify_asinh_math_reference_number(actual, -11013.232874703393)
}

///|
test "Asinh independent sinh 160" {
  let actual = asinh_math_sinh(100.0)
  verify_asinh_math_reference_number(actual, 1.3440585709080678e+43)
}

///|
test "Asinh independent sinh 161" {
  let actual = asinh_math_sinh(-100.0)
  verify_asinh_math_reference_number(actual, -1.3440585709080678e+43)
}

///|
test "Asinh independent sinh 162" {
  let actual = asinh_math_sinh(1000.0)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 163" {
  let actual = asinh_math_sinh(-1000.0)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 164" {
  let actual = asinh_math_sinh(3.725290298461914e-09)
  verify_asinh_math_reference_number(actual, 3.725290298461914e-09)
}

///|
test "Asinh independent sinh 165" {
  let actual = asinh_math_sinh(-3.725290298461914e-09)
  verify_asinh_math_reference_number(actual, -3.725290298461914e-09)
}

///|
test "Asinh independent sinh 166" {
  let actual = asinh_math_sinh(3.7252902984619136e-09)
  verify_asinh_math_reference_number(actual, 3.7252902984619136e-09)
}

///|
test "Asinh independent sinh 167" {
  let actual = asinh_math_sinh(-3.7252902984619136e-09)
  verify_asinh_math_reference_number(actual, -3.7252902984619136e-09)
}

///|
test "Asinh independent sinh 168" {
  let actual = asinh_math_sinh(3.725290298461915e-09)
  verify_asinh_math_reference_number(actual, 3.725290298461915e-09)
}

///|
test "Asinh independent sinh 169" {
  let actual = asinh_math_sinh(-3.725290298461915e-09)
  verify_asinh_math_reference_number(actual, -3.725290298461915e-09)
}

///|
test "Asinh independent sinh 170" {
  let actual = asinh_math_sinh(3.7252902984619132e-09)
  verify_asinh_math_reference_number(actual, 3.7252902984619132e-09)
}

///|
test "Asinh independent sinh 171" {
  let actual = asinh_math_sinh(-3.7252902984619132e-09)
  verify_asinh_math_reference_number(actual, -3.7252902984619132e-09)
}

///|
test "Asinh independent sinh 172" {
  let actual = asinh_math_sinh(3.725290298461916e-09)
  verify_asinh_math_reference_number(actual, 3.725290298461916e-09)
}

///|
test "Asinh independent sinh 173" {
  let actual = asinh_math_sinh(-3.725290298461916e-09)
  verify_asinh_math_reference_number(actual, -3.725290298461916e-09)
}

///|
test "Asinh independent sinh 174" {
  let actual = asinh_math_sinh(7.450580596923828e-09)
  verify_asinh_math_reference_number(actual, 7.450580596923828e-09)
}

///|
test "Asinh independent sinh 175" {
  let actual = asinh_math_sinh(-7.450580596923828e-09)
  verify_asinh_math_reference_number(actual, -7.450580596923828e-09)
}

///|
test "Asinh independent sinh 176" {
  let actual = asinh_math_sinh(7.450580596923827e-09)
  verify_asinh_math_reference_number(actual, 7.450580596923827e-09)
}

///|
test "Asinh independent sinh 177" {
  let actual = asinh_math_sinh(-7.450580596923827e-09)
  verify_asinh_math_reference_number(actual, -7.450580596923827e-09)
}

///|
test "Asinh independent sinh 178" {
  let actual = asinh_math_sinh(7.45058059692383e-09)
  verify_asinh_math_reference_number(actual, 7.45058059692383e-09)
}

///|
test "Asinh independent sinh 179" {
  let actual = asinh_math_sinh(-7.45058059692383e-09)
  verify_asinh_math_reference_number(actual, -7.45058059692383e-09)
}

///|
test "Asinh independent sinh 180" {
  let actual = asinh_math_sinh(2.225073858507201e-308)
  verify_asinh_math_reference_number(actual, 2.225073858507201e-308)
}

///|
test "Asinh independent sinh 181" {
  let actual = asinh_math_sinh(-2.225073858507201e-308)
  verify_asinh_math_reference_number(actual, -2.225073858507201e-308)
}

///|
test "Asinh independent sinh 182" {
  let actual = asinh_math_sinh(2.225073858507202e-308)
  verify_asinh_math_reference_number(actual, 2.225073858507202e-308)
}

///|
test "Asinh independent sinh 183" {
  let actual = asinh_math_sinh(-2.225073858507202e-308)
  verify_asinh_math_reference_number(actual, -2.225073858507202e-308)
}

///|
test "Asinh independent sinh 184" {
  let actual = asinh_math_sinh(20.0)
  verify_asinh_math_reference_number(actual, 242582597.70489514)
}

///|
test "Asinh independent sinh 185" {
  let actual = asinh_math_sinh(-20.0)
  verify_asinh_math_reference_number(actual, -242582597.70489514)
}

///|
test "Asinh independent sinh 186" {
  let actual = asinh_math_sinh(700.0)
  verify_asinh_math_reference_number(actual, 5.0711602736750225e+303)
}

///|
test "Asinh independent sinh 187" {
  let actual = asinh_math_sinh(-700.0)
  verify_asinh_math_reference_number(actual, -5.0711602736750225e+303)
}

///|
test "Asinh independent sinh 188" {
  let actual = asinh_math_sinh(709.0)
  verify_asinh_math_reference_number(actual, 4.109203730777486e+307)
}

///|
test "Asinh independent sinh 189" {
  let actual = asinh_math_sinh(-709.0)
  verify_asinh_math_reference_number(actual, -4.109203730777486e+307)
}

///|
test "Asinh independent sinh 190" {
  let actual = asinh_math_sinh(710.0)
  verify_asinh_math_reference_number(actual, 1.1169973830808555e+308)
}

///|
test "Asinh independent sinh 191" {
  let actual = asinh_math_sinh(-710.0)
  verify_asinh_math_reference_number(actual, -1.1169973830808555e+308)
}

///|
test "Asinh independent sinh 192" {
  let actual = asinh_math_sinh(711.0)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 193" {
  let actual = asinh_math_sinh(-711.0)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 194" {
  let actual = asinh_math_sinh(1024.0)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 195" {
  let actual = asinh_math_sinh(-1024.0)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 196" {
  let actual = asinh_math_sinh(1025.0)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 197" {
  let actual = asinh_math_sinh(-1025.0)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 198" {
  let actual = asinh_math_sinh(1.7976931348623157e+308)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 199" {
  let actual = asinh_math_sinh(-1.7976931348623157e+308)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 200" {
  let actual = asinh_math_sinh(710.475860073944)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 201" {
  let actual = asinh_math_sinh(-710.475860073944)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 202" {
  let actual = asinh_math_sinh(710.4758600739439)
  verify_asinh_math_reference_number(actual, 1.7976931348621744e+308)
}

///|
test "Asinh independent sinh 203" {
  let actual = asinh_math_sinh(-710.4758600739439)
  verify_asinh_math_reference_number(actual, -1.7976931348621744e+308)
}

///|
test "Asinh independent sinh 204" {
  let actual = asinh_math_sinh(710.4758600739441)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 205" {
  let actual = asinh_math_sinh(-710.4758600739441)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 206" {
  let actual = asinh_math_sinh(710.4758600739437)
  verify_asinh_math_reference_number(actual, 1.79769313486197e+308)
}

///|
test "Asinh independent sinh 207" {
  let actual = asinh_math_sinh(-710.4758600739437)
  verify_asinh_math_reference_number(actual, -1.79769313486197e+308)
}

///|
test "Asinh independent sinh 208" {
  let actual = asinh_math_sinh(710.4758600739442)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 209" {
  let actual = asinh_math_sinh(-710.4758600739442)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 210" {
  let actual = asinh_math_sinh(710.4758600739436)
  verify_asinh_math_reference_number(actual, 1.7976931348617657e+308)
}

///|
test "Asinh independent sinh 211" {
  let actual = asinh_math_sinh(-710.4758600739436)
  verify_asinh_math_reference_number(actual, -1.7976931348617657e+308)
}

///|
test "Asinh independent sinh 212" {
  let actual = asinh_math_sinh(710.4758600739443)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 213" {
  let actual = asinh_math_sinh(-710.4758600739443)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 214" {
  let actual = asinh_math_sinh(710.4758600739435)
  verify_asinh_math_reference_number(actual, 1.7976931348615613e+308)
}

///|
test "Asinh independent sinh 215" {
  let actual = asinh_math_sinh(-710.4758600739435)
  verify_asinh_math_reference_number(actual, -1.7976931348615613e+308)
}

///|
test "Asinh independent sinh 216" {
  let actual = asinh_math_sinh(710.4758600739444)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 217" {
  let actual = asinh_math_sinh(-710.4758600739444)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 218" {
  let actual = asinh_math_sinh(709.9999999999999)
  verify_asinh_math_reference_number(actual, 1.1169973830807285e+308)
}

///|
test "Asinh independent sinh 219" {
  let actual = asinh_math_sinh(-709.9999999999999)
  verify_asinh_math_reference_number(actual, -1.1169973830807285e+308)
}

///|
test "Asinh independent sinh 220" {
  let actual = asinh_math_sinh(710.0000000000001)
  verify_asinh_math_reference_number(actual, 1.1169973830809826e+308)
}

///|
test "Asinh independent sinh 221" {
  let actual = asinh_math_sinh(-710.0000000000001)
  verify_asinh_math_reference_number(actual, -1.1169973830809826e+308)
}

///|
test "Asinh independent sinh 222" {
  let actual = asinh_math_sinh(709.9999999999998)
  verify_asinh_math_reference_number(actual, 1.1169973830806016e+308)
}

///|
test "Asinh independent sinh 223" {
  let actual = asinh_math_sinh(-709.9999999999998)
  verify_asinh_math_reference_number(actual, -1.1169973830806016e+308)
}

///|
test "Asinh independent sinh 224" {
  let actual = asinh_math_sinh(710.0000000000002)
  verify_asinh_math_reference_number(actual, 1.1169973830811095e+308)
}

///|
test "Asinh independent sinh 225" {
  let actual = asinh_math_sinh(-710.0000000000002)
  verify_asinh_math_reference_number(actual, -1.1169973830811095e+308)
}

///|
test "Asinh independent sinh 226" {
  let actual = asinh_math_sinh(1023.9999999999999)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 227" {
  let actual = asinh_math_sinh(-1023.9999999999999)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 228" {
  let actual = asinh_math_sinh(1024.0000000000002)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent sinh 229" {
  let actual = asinh_math_sinh(-1024.0000000000002)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent sinh 230" {
  let actual = asinh_math_sinh(261.86073746362285)
  verify_asinh_math_reference_number(actual, 2.6524262170431062e+113)
}

///|
test "Asinh independent sinh 231" {
  let actual = asinh_math_sinh(-261.86073746362285)
  verify_asinh_math_reference_number(actual, -2.6524262170431062e+113)
}

///|
test "Asinh independent sinh 232" {
  let actual = asinh_math_sinh(276.90764733768253)
  verify_asinh_math_reference_number(actual, 9.087265981454372e+119)
}

///|
test "Asinh independent sinh 233" {
  let actual = asinh_math_sinh(-276.90764733768253)
  verify_asinh_math_reference_number(actual, -9.087265981454372e+119)
}

///|
test "Asinh independent sinh 234" {
  let actual = asinh_math_sinh(456.92700697301416)
  verify_asinh_math_reference_number(actual, 1.3799004786291558e+198)
}

///|
test "Asinh independent sinh 235" {
  let actual = asinh_math_sinh(-456.92700697301416)
  verify_asinh_math_reference_number(actual, -1.3799004786291558e+198)
}

///|
test "Asinh independent sinh 236" {
  let actual = asinh_math_sinh(578.0856206844646)
  verify_asinh_math_reference_number(actual, 5.732778145603158e+250)
}

///|
test "Asinh independent sinh 237" {
  let actual = asinh_math_sinh(-578.0856206844646)
  verify_asinh_math_reference_number(actual, -5.732778145603158e+250)
}

///|
test "Asinh independent sinh 238" {
  let actual = asinh_math_sinh(182.43084189480157)
  verify_asinh_math_reference_number(actual, 8.46599423133165e+78)
}

///|
test "Asinh independent sinh 239" {
  let actual = asinh_math_sinh(-182.43084189480157)
  verify_asinh_math_reference_number(actual, -8.46599423133165e+78)
}

///|
test "Asinh independent sinh 240" {
  let actual = asinh_math_sinh(644.0094313924744)
  verify_asinh_math_reference_number(actual, 2.4474416795923285e+279)
}

///|
test "Asinh independent sinh 241" {
  let actual = asinh_math_sinh(-644.0094313924744)
  verify_asinh_math_reference_number(actual, -2.4474416795923285e+279)
}

///|
test "Asinh independent sinh 242" {
  let actual = asinh_math_sinh(416.43283948963546)
  verify_asinh_math_reference_number(actual, 3.576467459652427e+180)
}

///|
test "Asinh independent sinh 243" {
  let actual = asinh_math_sinh(-416.43283948963546)
  verify_asinh_math_reference_number(actual, -3.576467459652427e+180)
}

///|
test "Asinh independent sinh 244" {
  let actual = asinh_math_sinh(235.88939452739854)
  verify_asinh_math_reference_number(actual, 1.394544531782273e+102)
}

///|
test "Asinh independent sinh 245" {
  let actual = asinh_math_sinh(-235.88939452739854)
  verify_asinh_math_reference_number(actual, -1.394544531782273e+102)
}

///|
test "Asinh independent sinh 246" {
  let actual = asinh_math_sinh(67.05829046305759)
  verify_asinh_math_reference_number(actual, 6.637667878412224e+28)
}

///|
test "Asinh independent sinh 247" {
  let actual = asinh_math_sinh(-67.05829046305759)
  verify_asinh_math_reference_number(actual, -6.637667878412224e+28)
}

///|
test "Asinh independent sinh 248" {
  let actual = asinh_math_sinh(86.93990394007074)
  verify_asinh_math_reference_number(actual, 2.8608200620998915e+37)
}

///|
test "Asinh independent sinh 249" {
  let actual = asinh_math_sinh(-86.93990394007074)
  verify_asinh_math_reference_number(actual, -2.8608200620998915e+37)
}

///|
test "Asinh independent sinh 250" {
  let actual = asinh_math_sinh(14.1605493637723)
  verify_asinh_math_reference_number(actual, 706022.357069937)
}

///|
test "Asinh independent sinh 251" {
  let actual = asinh_math_sinh(-14.1605493637723)
  verify_asinh_math_reference_number(actual, -706022.357069937)
}

///|
test "Asinh independent sinh 252" {
  let actual = asinh_math_sinh(32.67889959594913)
  verify_asinh_math_reference_number(actual, 77845905289601.62)
}

///|
test "Asinh independent sinh 253" {
  let actual = asinh_math_sinh(-32.67889959594913)
  verify_asinh_math_reference_number(actual, -77845905289601.62)
}

///|
test "Asinh independent log10 254" {
  let actual = asinh_math_log10(0.0)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent log10 255" {
  let actual = asinh_math_log10(-0.0)
  verify_asinh_math_reference_number(actual, -1.0 / 0.0)
}

///|
test "Asinh independent log10 256" {
  let actual = asinh_math_log10(0.0 / 0.0)
  verify_asinh_math_reference_number(actual, 0.0 / 0.0)
}

///|
test "Asinh independent log10 257" {
  let actual = asinh_math_log10(1.0 / 0.0)
  verify_asinh_math_reference_number(actual, 1.0 / 0.0)
}

///|
test "Asinh independent log10 258" {
  let actual = asinh_math_log10(-1.0 / 0.0)
  verify_asinh_math_reference_number(actual, 0.0 / 0.0)
}

///|
test "Asinh independent log10 259" {
  let actual = asinh_math_log10(-1.0)
  verify_asinh_math_reference_number(actual, 0.0 / 0.0)
}

///|
test "Asinh independent log10 260" {
  let actual = asinh_math_log10(-0.1)
  verify_asinh_math_reference_number(actual, 0.0 / 0.0)
}

///|
test "Asinh independent log10 261" {
  let actual = asinh_math_log10(-5.0e-324)
  verify_asinh_math_reference_number(actual, 0.0 / 0.0)
}

///|
test "Asinh independent log10 262" {
  let actual = asinh_math_log10(5.0e-324)
  verify_asinh_math_reference_number(actual, -323.3062153431158)
}

///|
test "Asinh independent log10 263" {
  let actual = asinh_math_log10(1.0e-323)
  verify_asinh_math_reference_number(actual, -323.0051853474518)
}

///|
test "Asinh independent log10 264" {
  let actual = asinh_math_log10(1.5e-323)
  verify_asinh_math_reference_number(actual, -322.8290940883961)
}

///|
test "Asinh independent log10 265" {
  let actual = asinh_math_log10(2.2250738585072014e-308)
  verify_asinh_math_reference_number(actual, -307.6526555685888)
}

///|
test "Asinh independent log10 266" {
  let actual = asinh_math_log10(1.7976931348623157e+308)
  verify_asinh_math_reference_number(actual, 308.25471555991675)
}

///|
test "Asinh independent log10 267" {
  let actual = asinh_math_log10(1.0e-308)
  verify_asinh_math_reference_number(actual, -308.0)
}

///|
test "Asinh independent log10 268" {
  let actual = asinh_math_log10(9.999999999999994e-309)
  verify_asinh_math_reference_number(actual, -308.0)
}

///|
test "Asinh independent log10 269" {
  let actual = asinh_math_log10(1.0000000000000004e-308)
  verify_asinh_math_reference_number(actual, -308.0)
}

///|
test "Asinh independent log10 270" {
  let actual = asinh_math_log10(1.0e-200)
  verify_asinh_math_reference_number(actual, -200.0)
}

///|
test "Asinh independent log10 271" {
  let actual = asinh_math_log10(9.999999999999998e-201)
  verify_asinh_math_reference_number(actual, -200.0)
}

///|
test "Asinh independent log10 272" {
  let actual = asinh_math_log10(1.0000000000000001e-200)
  verify_asinh_math_reference_number(actual, -200.0)
}

///|
test "Asinh independent log10 273" {
  let actual = asinh_math_log10(1.0e-100)
  verify_asinh_math_reference_number(actual, -100.0)
}

///|
test "Asinh independent log10 274" {
  let actual = asinh_math_log10(9.999999999999999e-101)
  verify_asinh_math_reference_number(actual, -100.0)
}

///|
test "Asinh independent log10 275" {
  let actual = asinh_math_log10(1.0000000000000001e-100)
  verify_asinh_math_reference_number(actual, -100.0)
}

///|
test "Asinh independent log10 276" {
  let actual = asinh_math_log10(1.0e-10)
  verify_asinh_math_reference_number(actual, -10.0)
}

///|
test "Asinh independent log10 277" {
  let actual = asinh_math_log10(9.999999999999999e-11)
  verify_asinh_math_reference_number(actual, -10.0)
}

///|
test "Asinh independent log10 278" {
  let actual = asinh_math_log10(1.0000000000000002e-10)
  verify_asinh_math_reference_number(actual, -10.0)
}

///|
test "Asinh independent log10 279" {
  let actual = asinh_math_log10(0.001)
  verify_asinh_math_reference_number(actual, -3.0)
}

///|
test "Asinh independent log10 280" {
  let actual = asinh_math_log10(0.0009999999999999998)
  verify_asinh_math_reference_number(actual, -3.0)
}

///|
test "Asinh independent log10 281" {
  let actual = asinh_math_log10(0.0010000000000000002)
  verify_asinh_math_reference_number(actual, -3.0)
}

///|
test "Asinh independent log10 282" {
  let actual = asinh_math_log10(0.01)
  verify_asinh_math_reference_number(actual, -2.0)
}

///|
test "Asinh independent log10 283" {
  let actual = asinh_math_log10(0.009999999999999998)
  verify_asinh_math_reference_number(actual, -2.0)
}

///|
test "Asinh independent log10 284" {
  let actual = asinh_math_log10(0.010000000000000002)
  verify_asinh_math_reference_number(actual, -2.0)
}

///|
test "Asinh independent log10 285" {
  let actual = asinh_math_log10(0.1)
  verify_asinh_math_reference_number(actual, -1.0)
}

///|
test "Asinh independent log10 286" {
  let actual = asinh_math_log10(0.09999999999999999)
  verify_asinh_math_reference_number(actual, -1.0)
}

///|
test "Asinh independent log10 287" {
  let actual = asinh_math_log10(0.10000000000000002)
  verify_asinh_math_reference_number(actual, -0.9999999999999999)
}

///|
test "Asinh independent log10 288" {
  let actual = asinh_math_log10(1.0)
  verify_asinh_math_reference_number(actual, 0.0)
}

///|
test "Asinh independent log10 289" {
  let actual = asinh_math_log10(0.9999999999999999)
  verify_asinh_math_reference_number(actual, -4.821637332766436e-17)
}

///|
test "Asinh independent log10 290" {
  let actual = asinh_math_log10(1.0000000000000002)
  verify_asinh_math_reference_number(actual, 9.64327466553287e-17)
}

///|
test "Asinh independent log10 291" {
  let actual = asinh_math_log10(10.0)
  verify_asinh_math_reference_number(actual, 1.0)
}

///|
test "Asinh independent log10 292" {
  let actual = asinh_math_log10(9.999999999999998)
  verify_asinh_math_reference_number(actual, 0.9999999999999999)
}

///|
test "Asinh independent log10 293" {
  let actual = asinh_math_log10(10.000000000000002)
  verify_asinh_math_reference_number(actual, 1.0)
}

///|
test "Asinh independent log10 294" {
  let actual = asinh_math_log10(100.0)
  verify_asinh_math_reference_number(actual, 2.0)
}

///|
test "Asinh independent log10 295" {
  let actual = asinh_math_log10(99.99999999999999)
  verify_asinh_math_reference_number(actual, 2.0)
}

///|
test "Asinh independent log10 296" {
  let actual = asinh_math_log10(100.00000000000001)
  verify_asinh_math_reference_number(actual, 2.0)
}

///|
test "Asinh independent log10 297" {
  let actual = asinh_math_log10(1000.0)
  verify_asinh_math_reference_number(actual, 3.0)
}

///|
test "Asinh independent log10 298" {
  let actual = asinh_math_log10(999.9999999999999)
  verify_asinh_math_reference_number(actual, 3.0)
}

///|
test "Asinh independent log10 299" {
  let actual = asinh_math_log10(1000.0000000000001)
  verify_asinh_math_reference_number(actual, 3.0)
}

///|
test "Asinh independent log10 300" {
  let actual = asinh_math_log10(10000.0)
  verify_asinh_math_reference_number(actual, 4.0)
}

///|
test "Asinh independent log10 301" {
  let actual = asinh_math_log10(9999.999999999998)
  verify_asinh_math_reference_number(actual, 4.0)
}

///|
test "Asinh independent log10 302" {
  let actual = asinh_math_log10(10000.000000000002)
  verify_asinh_math_reference_number(actual, 4.0)
}

///|
test "Asinh independent log10 303" {
  let actual = asinh_math_log10(100000.0)
  verify_asinh_math_reference_number(actual, 5.0)
}

///|
test "Asinh independent log10 304" {
  let actual = asinh_math_log10(99999.99999999999)
  verify_asinh_math_reference_number(actual, 5.0)
}

///|
test "Asinh independent log10 305" {
  let actual = asinh_math_log10(100000.00000000001)
  verify_asinh_math_reference_number(actual, 5.0)
}

///|
test "Asinh independent log10 306" {
  let actual = asinh_math_log10(1000000.0)
  verify_asinh_math_reference_number(actual, 6.0)
}

///|
test "Asinh independent log10 307" {
  let actual = asinh_math_log10(999999.9999999999)
  verify_asinh_math_reference_number(actual, 6.0)
}

///|
test "Asinh independent log10 308" {
  let actual = asinh_math_log10(1000000.0000000001)
  verify_asinh_math_reference_number(actual, 6.0)
}

///|
test "Asinh independent log10 309" {
  let actual = asinh_math_log10(10000000.0)
  verify_asinh_math_reference_number(actual, 7.0)
}

///|
test "Asinh independent log10 310" {
  let actual = asinh_math_log10(9999999.999999998)
  verify_asinh_math_reference_number(actual, 7.0)
}

///|
test "Asinh independent log10 311" {
  let actual = asinh_math_log10(10000000.000000002)
  verify_asinh_math_reference_number(actual, 7.0)
}

///|
test "Asinh independent log10 312" {
  let actual = asinh_math_log10(100000000.0)
  verify_asinh_math_reference_number(actual, 8.0)
}

///|
test "Asinh independent log10 313" {
  let actual = asinh_math_log10(99999999.99999999)
  verify_asinh_math_reference_number(actual, 8.0)
}

///|
test "Asinh independent log10 314" {
  let actual = asinh_math_log10(100000000.00000001)
  verify_asinh_math_reference_number(actual, 8.0)
}

///|
test "Asinh independent log10 315" {
  let actual = asinh_math_log10(1000000000.0)
  verify_asinh_math_reference_number(actual, 9.0)
}

///|
test "Asinh independent log10 316" {
  let actual = asinh_math_log10(999999999.9999999)
  verify_asinh_math_reference_number(actual, 9.0)
}

///|
test "Asinh independent log10 317" {
  let actual = asinh_math_log10(1000000000.0000001)
  verify_asinh_math_reference_number(actual, 9.0)
}

///|
test "Asinh independent log10 318" {
  let actual = asinh_math_log10(10000000000.0)
  verify_asinh_math_reference_number(actual, 10.0)
}

///|
test "Asinh independent log10 319" {
  let actual = asinh_math_log10(9999999999.999998)
  verify_asinh_math_reference_number(actual, 10.0)
}

///|
test "Asinh independent log10 320" {
  let actual = asinh_math_log10(10000000000.000002)
  verify_asinh_math_reference_number(actual, 10.0)
}

///|
test "Asinh independent log10 321" {
  let actual = asinh_math_log10(100000000000.0)
  verify_asinh_math_reference_number(actual, 11.0)
}

///|
test "Asinh independent log10 322" {
  let actual = asinh_math_log10(99999999999.99998)
  verify_asinh_math_reference_number(actual, 11.0)
}

///|
test "Asinh independent log10 323" {
  let actual = asinh_math_log10(100000000000.00002)
  verify_asinh_math_reference_number(actual, 11.0)
}

///|
test "Asinh independent log10 324" {
  let actual = asinh_math_log10(1000000000000.0)
  verify_asinh_math_reference_number(actual, 12.0)
}

///|
test "Asinh independent log10 325" {
  let actual = asinh_math_log10(999999999999.9999)
  verify_asinh_math_reference_number(actual, 12.0)
}

///|
test "Asinh independent log10 326" {
  let actual = asinh_math_log10(1000000000000.0001)
  verify_asinh_math_reference_number(actual, 12.0)
}

///|
test "Asinh independent log10 327" {
  let actual = asinh_math_log10(10000000000000.0)
  verify_asinh_math_reference_number(actual, 13.0)
}

///|
test "Asinh independent log10 328" {
  let actual = asinh_math_log10(9999999999999.998)
  verify_asinh_math_reference_number(actual, 13.0)
}

///|
test "Asinh independent log10 329" {
  let actual = asinh_math_log10(10000000000000.002)
  verify_asinh_math_reference_number(actual, 13.0)
}

///|
test "Asinh independent log10 330" {
  let actual = asinh_math_log10(100000000000000.0)
  verify_asinh_math_reference_number(actual, 14.0)
}

///|
test "Asinh independent log10 331" {
  let actual = asinh_math_log10(99999999999999.98)
  verify_asinh_math_reference_number(actual, 14.0)
}

///|
test "Asinh independent log10 332" {
  let actual = asinh_math_log10(100000000000000.02)
  verify_asinh_math_reference_number(actual, 14.0)
}

///|
test "Asinh independent log10 333" {
  let actual = asinh_math_log10(1000000000000000.0)
  verify_asinh_math_reference_number(actual, 15.0)
}

///|
test "Asinh independent log10 334" {
  let actual = asinh_math_log10(999999999999999.9)
  verify_asinh_math_reference_number(actual, 15.0)
}

///|
test "Asinh independent log10 335" {
  let actual = asinh_math_log10(1000000000000000.1)
  verify_asinh_math_reference_number(actual, 15.0)
}

///|
test "Asinh independent log10 336" {
  let actual = asinh_math_log10(1.0e+16)
  verify_asinh_math_reference_number(actual, 16.0)
}

///|
test "Asinh independent log10 337" {
  let actual = asinh_math_log10(9999999999999998.0)
  verify_asinh_math_reference_number(actual, 16.0)
}

///|
test "Asinh independent log10 338" {
  let actual = asinh_math_log10(1.0000000000000002e+16)
  verify_asinh_math_reference_number(actual, 16.0)
}

///|
test "Asinh independent log10 339" {
  let actual = asinh_math_log10(1.0e+17)
  verify_asinh_math_reference_number(actual, 17.0)
}

///|
test "Asinh independent log10 340" {
  let actual = asinh_math_log10(9.999999999999998e+16)
  verify_asinh_math_reference_number(actual, 17.0)
}

///|
test "Asinh independent log10 341" {
  let actual = asinh_math_log10(1.0000000000000002e+17)
  verify_asinh_math_reference_number(actual, 17.0)
}

///|
test "Asinh independent log10 342" {
  let actual = asinh_math_log10(1.0e+18)
  verify_asinh_math_reference_number(actual, 18.0)
}

///|
test "Asinh independent log10 343" {
  let actual = asinh_math_log10(9.999999999999999e+17)
  verify_asinh_math_reference_number(actual, 18.0)
}

///|
test "Asinh independent log10 344" {
  let actual = asinh_math_log10(1.0000000000000001e+18)
  verify_asinh_math_reference_number(actual, 18.0)
}

///|
test "Asinh independent log10 345" {
  let actual = asinh_math_log10(1.0e+19)
  verify_asinh_math_reference_number(actual, 19.0)
}

///|
test "Asinh independent log10 346" {
  let actual = asinh_math_log10(9.999999999999998e+18)
  verify_asinh_math_reference_number(actual, 19.0)
}

///|
test "Asinh independent log10 347" {
  let actual = asinh_math_log10(1.0000000000000002e+19)
  verify_asinh_math_reference_number(actual, 19.0)
}

///|
test "Asinh independent log10 348" {
  let actual = asinh_math_log10(1.0e+20)
  verify_asinh_math_reference_number(actual, 20.0)
}

///|
test "Asinh independent log10 349" {
  let actual = asinh_math_log10(9.999999999999998e+19)
  verify_asinh_math_reference_number(actual, 20.0)
}

///|
test "Asinh independent log10 350" {
  let actual = asinh_math_log10(1.0000000000000002e+20)
  verify_asinh_math_reference_number(actual, 20.0)
}

///|
test "Asinh independent log10 351" {
  let actual = asinh_math_log10(1.0e+21)
  verify_asinh_math_reference_number(actual, 21.0)
}

///|
test "Asinh independent log10 352" {
  let actual = asinh_math_log10(9.999999999999999e+20)
  verify_asinh_math_reference_number(actual, 21.0)
}

///|
test "Asinh independent log10 353" {
  let actual = asinh_math_log10(1.0000000000000001e+21)
  verify_asinh_math_reference_number(actual, 21.0)
}

///|
test "Asinh independent log10 354" {
  let actual = asinh_math_log10(1.0e+22)
  verify_asinh_math_reference_number(actual, 22.0)
}

///|
test "Asinh independent log10 355" {
  let actual = asinh_math_log10(9.999999999999998e+21)
  verify_asinh_math_reference_number(actual, 22.0)
}

///|
test "Asinh independent log10 356" {
  let actual = asinh_math_log10(1.0000000000000002e+22)
  verify_asinh_math_reference_number(actual, 22.0)
}

///|
test "Asinh independent log10 357" {
  let actual = asinh_math_log10(1.0e+23)
  verify_asinh_math_reference_number(actual, 23.0)
}

///|
test "Asinh independent log10 358" {
  let actual = asinh_math_log10(9.999999999999997e+22)
  verify_asinh_math_reference_number(actual, 23.0)
}

///|
test "Asinh independent log10 359" {
  let actual = asinh_math_log10(1.0000000000000001e+23)
  verify_asinh_math_reference_number(actual, 23.0)
}

///|
test "Asinh independent log10 360" {
  let actual = asinh_math_log10(1.0e+34)
  verify_asinh_math_reference_number(actual, 34.0)
}

///|
test "Asinh independent log10 361" {
  let actual = asinh_math_log10(9.999999999999998e+33)
  verify_asinh_math_reference_number(actual, 34.0)
}

///|
test "Asinh independent log10 362" {
  let actual = asinh_math_log10(1.0000000000000001e+34)
  verify_asinh_math_reference_number(actual, 34.0)
}

///|
test "Asinh independent log10 363" {
  let actual = asinh_math_log10(1.0e+100)
  verify_asinh_math_reference_number(actual, 100.0)
}

///|
test "Asinh independent log10 364" {
  let actual = asinh_math_log10(9.999999999999998e+99)
  verify_asinh_math_reference_number(actual, 100.0)
}

///|
test "Asinh independent log10 365" {
  let actual = asinh_math_log10(1.0000000000000002e+100)
  verify_asinh_math_reference_number(actual, 100.0)
}

///|
test "Asinh independent log10 366" {
  let actual = asinh_math_log10(1.0e+200)
  verify_asinh_math_reference_number(actual, 200.0)
}

///|
test "Asinh independent log10 367" {
  let actual = asinh_math_log10(9.999999999999998e+199)
  verify_asinh_math_reference_number(actual, 200.0)
}

///|
test "Asinh independent log10 368" {
  let actual = asinh_math_log10(1.0000000000000001e+200)
  verify_asinh_math_reference_number(actual, 200.0)
}

///|
test "Asinh independent log10 369" {
  let actual = asinh_math_log10(1.0e+300)
  verify_asinh_math_reference_number(actual, 300.0)
}

///|
test "Asinh independent log10 370" {
  let actual = asinh_math_log10(9.999999999999999e+299)
  verify_asinh_math_reference_number(actual, 300.0)
}

///|
test "Asinh independent log10 371" {
  let actual = asinh_math_log10(1.0000000000000002e+300)
  verify_asinh_math_reference_number(actual, 300.0)
}

///|
test "Asinh independent log10 372" {
  let actual = asinh_math_log10(1.0e+308)
  verify_asinh_math_reference_number(actual, 308.0)
}

///|
test "Asinh independent log10 373" {
  let actual = asinh_math_log10(9.999999999999998e+307)
  verify_asinh_math_reference_number(actual, 308.0)
}

///|
test "Asinh independent log10 374" {
  let actual = asinh_math_log10(1.0000000000000002e+308)
  verify_asinh_math_reference_number(actual, 308.0)
}

///|
test "Asinh independent log10 375" {
  let actual = asinh_math_log10(3.699810317765155e+300)
  verify_asinh_math_reference_number(actual, 300.568179459186)
}

///|
test "Asinh independent log10 376" {
  let actual = asinh_math_log10(1.4253175199280404e-216)
  verify_asinh_math_reference_number(actual, -215.8460883765034)
}

///|
test "Asinh independent log10 377" {
  let actual = asinh_math_log10(1.9860043803972514e-212)
  verify_asinh_math_reference_number(actual, -211.70201979794524)
}

///|
test "Asinh independent log10 378" {
  let actual = asinh_math_log10(4.353774067027276e+206)
  verify_asinh_math_reference_number(actual, 206.6388658881894)
}

///|
test "Asinh independent log10 379" {
  let actual = asinh_math_log10(9.653116874458389e-66)
  verify_asinh_math_reference_number(actual, -65.01533243558706)
}

///|
test "Asinh independent log10 380" {
  let actual = asinh_math_log10(4.150054581351543e-21)
  verify_asinh_math_reference_number(actual, -20.381946191426724)
}

///|
test "Asinh independent log10 381" {
  let actual = asinh_math_log10(99234848754951.95)
  verify_asinh_math_reference_number(actual, 13.996664212116059)
}

///|
test "Asinh independent log10 382" {
  let actual = asinh_math_log10(1.8471775419439224e-241)
  verify_asinh_math_reference_number(actual, -240.7334913602279)
}

///|
test "Asinh independent log10 383" {
  let actual = asinh_math_log10(4.590982840564325e-111)
  verify_asinh_math_reference_number(actual, -110.33809433046686)
}

///|
test "Asinh independent log10 384" {
  let actual = asinh_math_log10(1.9293040048120616e-180)
  verify_asinh_math_reference_number(actual, -179.71459933419652)
}

///|
test "Asinh independent log10 385" {
  let actual = asinh_math_log10(2.5544351294683665e+246)
  verify_asinh_math_reference_number(actual, 246.4072948781392)
}

///|
test "Asinh independent log10 386" {
  let actual = asinh_math_log10(1.8366822591619744e+170)
  verify_asinh_math_reference_number(actual, 170.26403403108634)
}

///|
test "Asinh independent log10 387" {
  let actual = asinh_math_log10(7.091773728698459e+146)
  verify_asinh_math_reference_number(actual, 146.8507548704786)
}

///|
test "Asinh independent log10 388" {
  let actual = asinh_math_log10(1.9109466216089914e-233)
  verify_asinh_math_reference_number(actual, -232.71875144390492)
}

///|
test "Asinh independent log10 389" {
  let actual = asinh_math_log10(3.8022499498293115e-59)
  verify_asinh_math_reference_number(actual, -58.41995933716453)
}

///|
test "Asinh independent log10 390" {
  let actual = asinh_math_log10(1.657396214129153e-170)
  verify_asinh_math_reference_number(actual, -169.7805736575188)
}

///|
test "Asinh independent log10 391" {
  let actual = asinh_math_log10(3.5067804953384994e-59)
  verify_asinh_math_reference_number(actual, -58.4550914176505)
}

///|
test "Asinh independent log10 392" {
  let actual = asinh_math_log10(1.5859029771149241e-77)
  verify_asinh_math_reference_number(actual, -76.79972338561394)
}

///|
test "Asinh independent log10 393" {
  let actual = asinh_math_log10(3.4500417701260215e+226)
  verify_asinh_math_reference_number(actual, 226.5378243531676)
}

///|
test "Asinh independent log10 394" {
  let actual = asinh_math_log10(2.5493117660428197e+33)
  verify_asinh_math_reference_number(actual, 33.40642295041336)
}

///|
test "Asinh independent log10 395" {
  let actual = asinh_math_log10(4.815317521254916e+80)
  verify_asinh_math_reference_number(actual, 80.68262492971233)
}

///|
test "Asinh independent log10 396" {
  let actual = asinh_math_log10(1.4392545425084418e+115)
  verify_asinh_math_reference_number(actual, 115.15813760882943)
}

///|
test "Asinh independent log10 397" {
  let actual = asinh_math_log10(8.23136279913855e-167)
  verify_asinh_math_reference_number(actual, -166.08452825626418)
}

///|
test "Asinh independent log10 398" {
  let actual = asinh_math_log10(8.7779251941155e+246)
  verify_asinh_math_reference_number(actual, 246.94339187544708)
}
