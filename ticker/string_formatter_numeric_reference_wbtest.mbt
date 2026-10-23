// Generated from original named formatters and actual Python/NumPy numeric formatting.

///|
test "string numeric original shortest repr 0" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0000000000000002UL.reinterpret_as_double(), "1e-323"),
    (0x000fffffffffffffUL.reinterpret_as_double(), "2.225073858507201e-308"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x8000000000000001UL.reinterpret_as_double(), "-5e-324"),
    (0x8000000000000002UL.reinterpret_as_double(), "-1e-323"),
    (0x0031fa182c40c60bUL.reinterpret_as_double(), "9.999999999999995e-308"),
    (0x8031fa182c40c60bUL.reinterpret_as_double(), "-9.999999999999995e-308"),
    (0x0031fa182c40c60cUL.reinterpret_as_double(), "9.999999999999997e-308"),
    (0x8031fa182c40c60cUL.reinterpret_as_double(), "-9.999999999999997e-308"),
    (0x0031fa182c40c60dUL.reinterpret_as_double(), "1e-307"),
    (0x8031fa182c40c60dUL.reinterpret_as_double(), "-1e-307"),
    (0x0031fa182c40c60eUL.reinterpret_as_double(), "1.0000000000000001e-307"),
    (0x8031fa182c40c60eUL.reinterpret_as_double(), "-1.0000000000000001e-307"),
    (0x0031fa182c40c60fUL.reinterpret_as_double(), "1.0000000000000003e-307"),
    (0x8031fa182c40c60fUL.reinterpret_as_double(), "-1.0000000000000003e-307"),
    (0x03b8f2b061aea070UL.reinterpret_as_double(), "9.999999999999998e-291"),
    (0x83b8f2b061aea070UL.reinterpret_as_double(), "-9.999999999999998e-291"),
    (0x03b8f2b061aea071UL.reinterpret_as_double(), "9.999999999999999e-291"),
    (0x83b8f2b061aea071UL.reinterpret_as_double(), "-9.999999999999999e-291"),
    (0x03b8f2b061aea072UL.reinterpret_as_double(), "1e-290"),
    (0x83b8f2b061aea072UL.reinterpret_as_double(), "-1e-290"),
    (0x03b8f2b061aea073UL.reinterpret_as_double(), "1.0000000000000002e-290"),
    (0x83b8f2b061aea073UL.reinterpret_as_double(), "-1.0000000000000002e-290"),
    (0x03b8f2b061aea074UL.reinterpret_as_double(), "1.0000000000000004e-290"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 1" {
  let cases : Array[(Double, String)] = [
    (0x83b8f2b061aea074UL.reinterpret_as_double(), "-1.0000000000000004e-290"),
    (0x07414fa7ddefe39eUL.reinterpret_as_double(), "9.999999999999997e-274"),
    (0x87414fa7ddefe39eUL.reinterpret_as_double(), "-9.999999999999997e-274"),
    (0x07414fa7ddefe39fUL.reinterpret_as_double(), "9.999999999999999e-274"),
    (0x87414fa7ddefe39fUL.reinterpret_as_double(), "-9.999999999999999e-274"),
    (0x07414fa7ddefe3a0UL.reinterpret_as_double(), "1e-273"),
    (0x87414fa7ddefe3a0UL.reinterpret_as_double(), "-1e-273"),
    (0x07414fa7ddefe3a1UL.reinterpret_as_double(), "1.0000000000000003e-273"),
    (0x87414fa7ddefe3a1UL.reinterpret_as_double(), "-1.0000000000000003e-273"),
    (0x07414fa7ddefe3a2UL.reinterpret_as_double(), "1.0000000000000005e-273"),
    (0x87414fa7ddefe3a2UL.reinterpret_as_double(), "-1.0000000000000005e-273"),
    (0x0ac8062864ac6f41UL.reinterpret_as_double(), "9.999999999999997e-257"),
    (0x8ac8062864ac6f41UL.reinterpret_as_double(), "-9.999999999999997e-257"),
    (0x0ac8062864ac6f42UL.reinterpret_as_double(), "9.999999999999998e-257"),
    (0x8ac8062864ac6f42UL.reinterpret_as_double(), "-9.999999999999998e-257"),
    (0x0ac8062864ac6f43UL.reinterpret_as_double(), "1e-256"),
    (0x8ac8062864ac6f43UL.reinterpret_as_double(), "-1e-256"),
    (0x0ac8062864ac6f44UL.reinterpret_as_double(), "1.0000000000000001e-256"),
    (0x8ac8062864ac6f44UL.reinterpret_as_double(), "-1.0000000000000001e-256"),
    (0x0ac8062864ac6f45UL.reinterpret_as_double(), "1.0000000000000003e-256"),
    (0x8ac8062864ac6f45UL.reinterpret_as_double(), "-1.0000000000000003e-256"),
    (0x0e50ab877c142ff8UL.reinterpret_as_double(), "9.999999999999996e-240"),
    (0x8e50ab877c142ff8UL.reinterpret_as_double(), "-9.999999999999996e-240"),
    (0x0e50ab877c142ff9UL.reinterpret_as_double(), "9.999999999999999e-240"),
    (0x8e50ab877c142ff9UL.reinterpret_as_double(), "-9.999999999999999e-240"),
    (0x0e50ab877c142ffaUL.reinterpret_as_double(), "1e-239"),
    (0x8e50ab877c142ffaUL.reinterpret_as_double(), "-1e-239"),
    (0x0e50ab877c142ffbUL.reinterpret_as_double(), "1.0000000000000003e-239"),
    (0x8e50ab877c142ffbUL.reinterpret_as_double(), "-1.0000000000000003e-239"),
    (0x0e50ab877c142ffcUL.reinterpret_as_double(), "1.0000000000000005e-239"),
    (0x8e50ab877c142ffcUL.reinterpret_as_double(), "-1.0000000000000005e-239"),
    (0x11d72262f3133ecfUL.reinterpret_as_double(), "9.999999999999997e-223"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 2" {
  let cases : Array[(Double, String)] = [
    (0x91d72262f3133ecfUL.reinterpret_as_double(), "-9.999999999999997e-223"),
    (0x11d72262f3133ed0UL.reinterpret_as_double(), "9.999999999999999e-223"),
    (0x91d72262f3133ed0UL.reinterpret_as_double(), "-9.999999999999999e-223"),
    (0x11d72262f3133ed1UL.reinterpret_as_double(), "1e-222"),
    (0x91d72262f3133ed1UL.reinterpret_as_double(), "-1e-222"),
    (0x11d72262f3133ed2UL.reinterpret_as_double(), "1.0000000000000002e-222"),
    (0x91d72262f3133ed2UL.reinterpret_as_double(), "-1.0000000000000002e-222"),
    (0x11d72262f3133ed3UL.reinterpret_as_double(), "1.0000000000000004e-222"),
    (0x91d72262f3133ed3UL.reinterpret_as_double(), "-1.0000000000000004e-222"),
    (0x15600d7b2e28c65aUL.reinterpret_as_double(), "9.999999999999996e-206"),
    (0x95600d7b2e28c65aUL.reinterpret_as_double(), "-9.999999999999996e-206"),
    (0x15600d7b2e28c65bUL.reinterpret_as_double(), "9.999999999999998e-206"),
    (0x95600d7b2e28c65bUL.reinterpret_as_double(), "-9.999999999999998e-206"),
    (0x15600d7b2e28c65cUL.reinterpret_as_double(), "1e-205"),
    (0x95600d7b2e28c65cUL.reinterpret_as_double(), "-1e-205"),
    (0x15600d7b2e28c65dUL.reinterpret_as_double(), "1.0000000000000002e-205"),
    (0x95600d7b2e28c65dUL.reinterpret_as_double(), "-1.0000000000000002e-205"),
    (0x15600d7b2e28c65eUL.reinterpret_as_double(), "1.0000000000000004e-205"),
    (0x95600d7b2e28c65eUL.reinterpret_as_double(), "-1.0000000000000004e-205"),
    (0x18e6470cff6546b4UL.reinterpret_as_double(), "9.999999999999996e-189"),
    (0x98e6470cff6546b4UL.reinterpret_as_double(), "-9.999999999999996e-189"),
    (0x18e6470cff6546b5UL.reinterpret_as_double(), "9.999999999999998e-189"),
    (0x98e6470cff6546b5UL.reinterpret_as_double(), "-9.999999999999998e-189"),
    (0x18e6470cff6546b6UL.reinterpret_as_double(), "1e-188"),
    (0x98e6470cff6546b6UL.reinterpret_as_double(), "-1e-188"),
    (0x18e6470cff6546b7UL.reinterpret_as_double(), "1.0000000000000001e-188"),
    (0x98e6470cff6546b7UL.reinterpret_as_double(), "-1.0000000000000001e-188"),
    (0x18e6470cff6546b8UL.reinterpret_as_double(), "1.0000000000000003e-188"),
    (0x98e6470cff6546b8UL.reinterpret_as_double(), "-1.0000000000000003e-188"),
    (0x1c6eea92a61c3116UL.reinterpret_as_double(), "9.999999999999998e-172"),
    (0x9c6eea92a61c3116UL.reinterpret_as_double(), "-9.999999999999998e-172"),
    (0x1c6eea92a61c3117UL.reinterpret_as_double(), "9.999999999999999e-172"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 3" {
  let cases : Array[(Double, String)] = [
    (0x9c6eea92a61c3117UL.reinterpret_as_double(), "-9.999999999999999e-172"),
    (0x1c6eea92a61c3118UL.reinterpret_as_double(), "1e-171"),
    (0x9c6eea92a61c3118UL.reinterpret_as_double(), "-1e-171"),
    (0x1c6eea92a61c3119UL.reinterpret_as_double(), "1.0000000000000001e-171"),
    (0x9c6eea92a61c3119UL.reinterpret_as_double(), "-1.0000000000000001e-171"),
    (0x1c6eea92a61c311aUL.reinterpret_as_double(), "1.0000000000000002e-171"),
    (0x9c6eea92a61c311aUL.reinterpret_as_double(), "-1.0000000000000002e-171"),
    (0x1ff573d68f903ea0UL.reinterpret_as_double(), "9.999999999999996e-155"),
    (0x9ff573d68f903ea0UL.reinterpret_as_double(), "-9.999999999999996e-155"),
    (0x1ff573d68f903ea1UL.reinterpret_as_double(), "9.999999999999998e-155"),
    (0x9ff573d68f903ea1UL.reinterpret_as_double(), "-9.999999999999998e-155"),
    (0x1ff573d68f903ea2UL.reinterpret_as_double(), "1e-154"),
    (0x9ff573d68f903ea2UL.reinterpret_as_double(), "-1e-154"),
    (0x1ff573d68f903ea3UL.reinterpret_as_double(), "1.0000000000000001e-154"),
    (0x9ff573d68f903ea3UL.reinterpret_as_double(), "-1.0000000000000001e-154"),
    (0x1ff573d68f903ea4UL.reinterpret_as_double(), "1.0000000000000003e-154"),
    (0x9ff573d68f903ea4UL.reinterpret_as_double(), "-1.0000000000000003e-154"),
    (0x237dc574d80cf169UL.reinterpret_as_double(), "9.999999999999997e-138"),
    (0xa37dc574d80cf169UL.reinterpret_as_double(), "-9.999999999999997e-138"),
    (0x237dc574d80cf16aUL.reinterpret_as_double(), "9.999999999999999e-138"),
    (0xa37dc574d80cf16aUL.reinterpret_as_double(), "-9.999999999999999e-138"),
    (0x237dc574d80cf16bUL.reinterpret_as_double(), "1e-137"),
    (0xa37dc574d80cf16bUL.reinterpret_as_double(), "-1e-137"),
    (0x237dc574d80cf16cUL.reinterpret_as_double(), "1.0000000000000001e-137"),
    (0xa37dc574d80cf16cUL.reinterpret_as_double(), "-1.0000000000000001e-137"),
    (0x237dc574d80cf16dUL.reinterpret_as_double(), "1.0000000000000002e-137"),
    (0xa37dc574d80cf16dUL.reinterpret_as_double(), "-1.0000000000000002e-137"),
    (0x2704a8729fc3ddb5UL.reinterpret_as_double(), "9.999999999999996e-121"),
    (0xa704a8729fc3ddb5UL.reinterpret_as_double(), "-9.999999999999996e-121"),
    (0x2704a8729fc3ddb6UL.reinterpret_as_double(), "9.999999999999998e-121"),
    (0xa704a8729fc3ddb6UL.reinterpret_as_double(), "-9.999999999999998e-121"),
    (0x2704a8729fc3ddb7UL.reinterpret_as_double(), "1e-120"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 4" {
  let cases : Array[(Double, String)] = [
    (0xa704a8729fc3ddb7UL.reinterpret_as_double(), "-1e-120"),
    (0x2704a8729fc3ddb8UL.reinterpret_as_double(), "1.0000000000000002e-120"),
    (0xa704a8729fc3ddb8UL.reinterpret_as_double(), "-1.0000000000000002e-120"),
    (0x2704a8729fc3ddb9UL.reinterpret_as_double(), "1.0000000000000003e-120"),
    (0xa704a8729fc3ddb9UL.reinterpret_as_double(), "-1.0000000000000003e-120"),
    (0x2a8cab3210f3bb93UL.reinterpret_as_double(), "9.999999999999997e-104"),
    (0xaa8cab3210f3bb93UL.reinterpret_as_double(), "-9.999999999999997e-104"),
    (0x2a8cab3210f3bb94UL.reinterpret_as_double(), "9.999999999999998e-104"),
    (0xaa8cab3210f3bb94UL.reinterpret_as_double(), "-9.999999999999998e-104"),
    (0x2a8cab3210f3bb95UL.reinterpret_as_double(), "1e-103"),
    (0xaa8cab3210f3bb95UL.reinterpret_as_double(), "-1e-103"),
    (0x2a8cab3210f3bb96UL.reinterpret_as_double(), "1.0000000000000001e-103"),
    (0xaa8cab3210f3bb96UL.reinterpret_as_double(), "-1.0000000000000001e-103"),
    (0x2a8cab3210f3bb97UL.reinterpret_as_double(), "1.0000000000000002e-103"),
    (0xaa8cab3210f3bb97UL.reinterpret_as_double(), "-1.0000000000000002e-103"),
    (0x2e13e497065cd61dUL.reinterpret_as_double(), "9.999999999999997e-87"),
    (0xae13e497065cd61dUL.reinterpret_as_double(), "-9.999999999999997e-87"),
    (0x2e13e497065cd61eUL.reinterpret_as_double(), "9.999999999999999e-87"),
    (0xae13e497065cd61eUL.reinterpret_as_double(), "-9.999999999999999e-87"),
    (0x2e13e497065cd61fUL.reinterpret_as_double(), "1e-86"),
    (0xae13e497065cd61fUL.reinterpret_as_double(), "-1e-86"),
    (0x2e13e497065cd620UL.reinterpret_as_double(), "1.0000000000000003e-86"),
    (0xae13e497065cd620UL.reinterpret_as_double(), "-1.0000000000000003e-86"),
    (0x2e13e497065cd621UL.reinterpret_as_double(), "1.0000000000000004e-86"),
    (0xae13e497065cd621UL.reinterpret_as_double(), "-1.0000000000000004e-86"),
    (0x319b9b6364f30302UL.reinterpret_as_double(), "9.999999999999997e-70"),
    (0xb19b9b6364f30302UL.reinterpret_as_double(), "-9.999999999999997e-70"),
    (0x319b9b6364f30303UL.reinterpret_as_double(), "9.999999999999998e-70"),
    (0xb19b9b6364f30303UL.reinterpret_as_double(), "-9.999999999999998e-70"),
    (0x319b9b6364f30304UL.reinterpret_as_double(), "1e-69"),
    (0xb19b9b6364f30304UL.reinterpret_as_double(), "-1e-69"),
    (0x319b9b6364f30305UL.reinterpret_as_double(), "1.0000000000000001e-69"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 5" {
  let cases : Array[(Double, String)] = [
    (0xb19b9b6364f30305UL.reinterpret_as_double(), "-1.0000000000000001e-69"),
    (0x319b9b6364f30306UL.reinterpret_as_double(), "1.0000000000000002e-69"),
    (0xb19b9b6364f30306UL.reinterpret_as_double(), "-1.0000000000000002e-69"),
    (0x352327fc58da0f6eUL.reinterpret_as_double(), "9.999999999999996e-53"),
    (0xb52327fc58da0f6eUL.reinterpret_as_double(), "-9.999999999999996e-53"),
    (0x352327fc58da0f6fUL.reinterpret_as_double(), "9.999999999999998e-53"),
    (0xb52327fc58da0f6fUL.reinterpret_as_double(), "-9.999999999999998e-53"),
    (0x352327fc58da0f70UL.reinterpret_as_double(), "1e-52"),
    (0xb52327fc58da0f70UL.reinterpret_as_double(), "-1e-52"),
    (0x352327fc58da0f71UL.reinterpret_as_double(), "1.0000000000000002e-52"),
    (0xb52327fc58da0f71UL.reinterpret_as_double(), "-1.0000000000000002e-52"),
    (0x352327fc58da0f72UL.reinterpret_as_double(), "1.0000000000000004e-52"),
    (0xb52327fc58da0f72UL.reinterpret_as_double(), "-1.0000000000000004e-52"),
    (0x38aa95a5b7f87a0dUL.reinterpret_as_double(), "9.999999999999997e-36"),
    (0xb8aa95a5b7f87a0dUL.reinterpret_as_double(), "-9.999999999999997e-36"),
    (0x38aa95a5b7f87a0eUL.reinterpret_as_double(), "9.999999999999999e-36"),
    (0xb8aa95a5b7f87a0eUL.reinterpret_as_double(), "-9.999999999999999e-36"),
    (0x38aa95a5b7f87a0fUL.reinterpret_as_double(), "1e-35"),
    (0xb8aa95a5b7f87a0fUL.reinterpret_as_double(), "-1e-35"),
    (0x38aa95a5b7f87a10UL.reinterpret_as_double(), "1.0000000000000001e-35"),
    (0xb8aa95a5b7f87a10UL.reinterpret_as_double(), "-1.0000000000000001e-35"),
    (0x38aa95a5b7f87a11UL.reinterpret_as_double(), "1.0000000000000003e-35"),
    (0xb8aa95a5b7f87a11UL.reinterpret_as_double(), "-1.0000000000000003e-35"),
    (0x3c32725dd1d243aaUL.reinterpret_as_double(), "9.999999999999997e-19"),
    (0xbc32725dd1d243aaUL.reinterpret_as_double(), "-9.999999999999997e-19"),
    (0x3c32725dd1d243abUL.reinterpret_as_double(), "9.999999999999999e-19"),
    (0xbc32725dd1d243abUL.reinterpret_as_double(), "-9.999999999999999e-19"),
    (0x3c32725dd1d243acUL.reinterpret_as_double(), "1e-18"),
    (0xbc32725dd1d243acUL.reinterpret_as_double(), "-1e-18"),
    (0x3c32725dd1d243adUL.reinterpret_as_double(), "1.0000000000000003e-18"),
    (0xbc32725dd1d243adUL.reinterpret_as_double(), "-1.0000000000000003e-18"),
    (0x3c32725dd1d243aeUL.reinterpret_as_double(), "1.0000000000000005e-18"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 6" {
  let cases : Array[(Double, String)] = [
    (0xbc32725dd1d243aeUL.reinterpret_as_double(), "-1.0000000000000005e-18"),
    (0x3ee4f8b588e368efUL.reinterpret_as_double(), "9.999999999999997e-06"),
    (0xbee4f8b588e368efUL.reinterpret_as_double(), "-9.999999999999997e-06"),
    (0x3ee4f8b588e368f0UL.reinterpret_as_double(), "9.999999999999999e-06"),
    (0xbee4f8b588e368f0UL.reinterpret_as_double(), "-9.999999999999999e-06"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0xbee4f8b588e368f1UL.reinterpret_as_double(), "-1e-05"),
    (0x3ee4f8b588e368f2UL.reinterpret_as_double(), "1.0000000000000003e-05"),
    (0xbee4f8b588e368f2UL.reinterpret_as_double(), "-1.0000000000000003e-05"),
    (0x3ee4f8b588e368f3UL.reinterpret_as_double(), "1.0000000000000004e-05"),
    (0xbee4f8b588e368f3UL.reinterpret_as_double(), "-1.0000000000000004e-05"),
    (0x3f1a36e2eb1c432bUL.reinterpret_as_double(), "9.999999999999998e-05"),
    (0xbf1a36e2eb1c432bUL.reinterpret_as_double(), "-9.999999999999998e-05"),
    (0x3f1a36e2eb1c432cUL.reinterpret_as_double(), "9.999999999999999e-05"),
    (0xbf1a36e2eb1c432cUL.reinterpret_as_double(), "-9.999999999999999e-05"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0xbf1a36e2eb1c432dUL.reinterpret_as_double(), "-0.0001"),
    (0x3f1a36e2eb1c432eUL.reinterpret_as_double(), "0.00010000000000000002"),
    (0xbf1a36e2eb1c432eUL.reinterpret_as_double(), "-0.00010000000000000002"),
    (0x3f1a36e2eb1c432fUL.reinterpret_as_double(), "0.00010000000000000003"),
    (0xbf1a36e2eb1c432fUL.reinterpret_as_double(), "-0.00010000000000000003"),
    (0x3f50624dd2f1a9faUL.reinterpret_as_double(), "0.0009999999999999996"),
    (0xbf50624dd2f1a9faUL.reinterpret_as_double(), "-0.0009999999999999996"),
    (0x3f50624dd2f1a9fbUL.reinterpret_as_double(), "0.0009999999999999998"),
    (0xbf50624dd2f1a9fbUL.reinterpret_as_double(), "-0.0009999999999999998"),
    (0x3f50624dd2f1a9fcUL.reinterpret_as_double(), "0.001"),
    (0xbf50624dd2f1a9fcUL.reinterpret_as_double(), "-0.001"),
    (0x3f50624dd2f1a9fdUL.reinterpret_as_double(), "0.0010000000000000002"),
    (0xbf50624dd2f1a9fdUL.reinterpret_as_double(), "-0.0010000000000000002"),
    (0x3f50624dd2f1a9feUL.reinterpret_as_double(), "0.0010000000000000005"),
    (0xbf50624dd2f1a9feUL.reinterpret_as_double(), "-0.0010000000000000005"),
    (0x3fb9999999999998UL.reinterpret_as_double(), "0.09999999999999998"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 7" {
  let cases : Array[(Double, String)] = [
    (0xbfb9999999999998UL.reinterpret_as_double(), "-0.09999999999999998"),
    (0x3fb9999999999999UL.reinterpret_as_double(), "0.09999999999999999"),
    (0xbfb9999999999999UL.reinterpret_as_double(), "-0.09999999999999999"),
    (0x3fb999999999999aUL.reinterpret_as_double(), "0.1"),
    (0xbfb999999999999aUL.reinterpret_as_double(), "-0.1"),
    (0x3fb999999999999bUL.reinterpret_as_double(), "0.10000000000000002"),
    (0xbfb999999999999bUL.reinterpret_as_double(), "-0.10000000000000002"),
    (0x3fb999999999999cUL.reinterpret_as_double(), "0.10000000000000003"),
    (0xbfb999999999999cUL.reinterpret_as_double(), "-0.10000000000000003"),
    (0x42d6bcc41e8ffffeUL.reinterpret_as_double(), "99999999999999.97"),
    (0xc2d6bcc41e8ffffeUL.reinterpret_as_double(), "-99999999999999.97"),
    (0x42d6bcc41e8fffffUL.reinterpret_as_double(), "99999999999999.98"),
    (0xc2d6bcc41e8fffffUL.reinterpret_as_double(), "-99999999999999.98"),
    (0x42d6bcc41e900000UL.reinterpret_as_double(), "100000000000000.0"),
    (0xc2d6bcc41e900000UL.reinterpret_as_double(), "-100000000000000.0"),
    (0x42d6bcc41e900001UL.reinterpret_as_double(), "100000000000000.02"),
    (0xc2d6bcc41e900001UL.reinterpret_as_double(), "-100000000000000.02"),
    (0x42d6bcc41e900002UL.reinterpret_as_double(), "100000000000000.03"),
    (0xc2d6bcc41e900002UL.reinterpret_as_double(), "-100000000000000.03"),
    (0x430c6bf52633fffeUL.reinterpret_as_double(), "999999999999999.8"),
    (0xc30c6bf52633fffeUL.reinterpret_as_double(), "-999999999999999.8"),
    (0x430c6bf52633ffffUL.reinterpret_as_double(), "999999999999999.9"),
    (0xc30c6bf52633ffffUL.reinterpret_as_double(), "-999999999999999.9"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0xc30c6bf526340000UL.reinterpret_as_double(), "-1000000000000000.0"),
    (0x430c6bf526340001UL.reinterpret_as_double(), "1000000000000000.1"),
    (0xc30c6bf526340001UL.reinterpret_as_double(), "-1000000000000000.1"),
    (0x430c6bf526340002UL.reinterpret_as_double(), "1000000000000000.2"),
    (0xc30c6bf526340002UL.reinterpret_as_double(), "-1000000000000000.2"),
    (0x4341c37937e07ffeUL.reinterpret_as_double(), "9999999999999996.0"),
    (0xc341c37937e07ffeUL.reinterpret_as_double(), "-9999999999999996.0"),
    (0x4341c37937e07fffUL.reinterpret_as_double(), "9999999999999998.0"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 8" {
  let cases : Array[(Double, String)] = [
    (0xc341c37937e07fffUL.reinterpret_as_double(), "-9999999999999998.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0xc341c37937e08000UL.reinterpret_as_double(), "-1e+16"),
    (0x4341c37937e08001UL.reinterpret_as_double(), "1.0000000000000002e+16"),
    (0xc341c37937e08001UL.reinterpret_as_double(), "-1.0000000000000002e+16"),
    (0x4341c37937e08002UL.reinterpret_as_double(), "1.0000000000000004e+16"),
    (0xc341c37937e08002UL.reinterpret_as_double(), "-1.0000000000000004e+16"),
    (0x4376345785d89ffeUL.reinterpret_as_double(), "9.999999999999997e+16"),
    (0xc376345785d89ffeUL.reinterpret_as_double(), "-9.999999999999997e+16"),
    (0x4376345785d89fffUL.reinterpret_as_double(), "9.999999999999998e+16"),
    (0xc376345785d89fffUL.reinterpret_as_double(), "-9.999999999999998e+16"),
    (0x4376345785d8a000UL.reinterpret_as_double(), "1e+17"),
    (0xc376345785d8a000UL.reinterpret_as_double(), "-1e+17"),
    (0x4376345785d8a001UL.reinterpret_as_double(), "1.0000000000000002e+17"),
    (0xc376345785d8a001UL.reinterpret_as_double(), "-1.0000000000000002e+17"),
    (0x4376345785d8a002UL.reinterpret_as_double(), "1.0000000000000003e+17"),
    (0xc376345785d8a002UL.reinterpret_as_double(), "-1.0000000000000003e+17"),
    (0x4480f0cf064dd590UL.reinterpret_as_double(), "9.999999999999996e+21"),
    (0xc480f0cf064dd590UL.reinterpret_as_double(), "-9.999999999999996e+21"),
    (0x4480f0cf064dd591UL.reinterpret_as_double(), "9.999999999999998e+21"),
    (0xc480f0cf064dd591UL.reinterpret_as_double(), "-9.999999999999998e+21"),
    (0x4480f0cf064dd592UL.reinterpret_as_double(), "1e+22"),
    (0xc480f0cf064dd592UL.reinterpret_as_double(), "-1e+22"),
    (0x4480f0cf064dd593UL.reinterpret_as_double(), "1.0000000000000002e+22"),
    (0xc480f0cf064dd593UL.reinterpret_as_double(), "-1.0000000000000002e+22"),
    (0x4480f0cf064dd594UL.reinterpret_as_double(), "1.0000000000000004e+22"),
    (0xc480f0cf064dd594UL.reinterpret_as_double(), "-1.0000000000000004e+22"),
    (0x44b52d02c7e14af4UL.reinterpret_as_double(), "9.999999999999996e+22"),
    (0xc4b52d02c7e14af4UL.reinterpret_as_double(), "-9.999999999999996e+22"),
    (0x44b52d02c7e14af5UL.reinterpret_as_double(), "9.999999999999997e+22"),
    (0xc4b52d02c7e14af5UL.reinterpret_as_double(), "-9.999999999999997e+22"),
    (0x44b52d02c7e14af6UL.reinterpret_as_double(), "1e+23"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 9" {
  let cases : Array[(Double, String)] = [
    (0xc4b52d02c7e14af6UL.reinterpret_as_double(), "-1e+23"),
    (0x44b52d02c7e14af7UL.reinterpret_as_double(), "1.0000000000000001e+23"),
    (0xc4b52d02c7e14af7UL.reinterpret_as_double(), "-1.0000000000000001e+23"),
    (0x44b52d02c7e14af8UL.reinterpret_as_double(), "1.0000000000000003e+23"),
    (0xc4b52d02c7e14af8UL.reinterpret_as_double(), "-1.0000000000000003e+23"),
    (0x46c8a6e32246c99aUL.reinterpret_as_double(), "9.999999999999997e+32"),
    (0xc6c8a6e32246c99aUL.reinterpret_as_double(), "-9.999999999999997e+32"),
    (0x46c8a6e32246c99bUL.reinterpret_as_double(), "9.999999999999998e+32"),
    (0xc6c8a6e32246c99bUL.reinterpret_as_double(), "-9.999999999999998e+32"),
    (0x46c8a6e32246c99cUL.reinterpret_as_double(), "1e+33"),
    (0xc6c8a6e32246c99cUL.reinterpret_as_double(), "-1e+33"),
    (0x46c8a6e32246c99dUL.reinterpret_as_double(), "1.0000000000000001e+33"),
    (0xc6c8a6e32246c99dUL.reinterpret_as_double(), "-1.0000000000000001e+33"),
    (0x46c8a6e32246c99eUL.reinterpret_as_double(), "1.0000000000000002e+33"),
    (0xc6c8a6e32246c99eUL.reinterpret_as_double(), "-1.0000000000000002e+33"),
    (0x4a511b0ec57e6498UL.reinterpret_as_double(), "9.999999999999997e+49"),
    (0xca511b0ec57e6498UL.reinterpret_as_double(), "-9.999999999999997e+49"),
    (0x4a511b0ec57e6499UL.reinterpret_as_double(), "9.999999999999999e+49"),
    (0xca511b0ec57e6499UL.reinterpret_as_double(), "-9.999999999999999e+49"),
    (0x4a511b0ec57e649aUL.reinterpret_as_double(), "1e+50"),
    (0xca511b0ec57e649aUL.reinterpret_as_double(), "-1e+50"),
    (0x4a511b0ec57e649bUL.reinterpret_as_double(), "1.0000000000000003e+50"),
    (0xca511b0ec57e649bUL.reinterpret_as_double(), "-1.0000000000000003e+50"),
    (0x4a511b0ec57e649cUL.reinterpret_as_double(), "1.0000000000000005e+50"),
    (0xca511b0ec57e649cUL.reinterpret_as_double(), "-1.0000000000000005e+50"),
    (0x4dd7bd29d1c87a17UL.reinterpret_as_double(), "9.999999999999997e+66"),
    (0xcdd7bd29d1c87a17UL.reinterpret_as_double(), "-9.999999999999997e+66"),
    (0x4dd7bd29d1c87a18UL.reinterpret_as_double(), "9.999999999999998e+66"),
    (0xcdd7bd29d1c87a18UL.reinterpret_as_double(), "-9.999999999999998e+66"),
    (0x4dd7bd29d1c87a19UL.reinterpret_as_double(), "1e+67"),
    (0xcdd7bd29d1c87a19UL.reinterpret_as_double(), "-1e+67"),
    (0x4dd7bd29d1c87a1aUL.reinterpret_as_double(), "1.0000000000000001e+67"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 10" {
  let cases : Array[(Double, String)] = [
    (0xcdd7bd29d1c87a1aUL.reinterpret_as_double(), "-1.0000000000000001e+67"),
    (0x4dd7bd29d1c87a1bUL.reinterpret_as_double(), "1.0000000000000003e+67"),
    (0xcdd7bd29d1c87a1bUL.reinterpret_as_double(), "-1.0000000000000003e+67"),
    (0x516078e111c3556bUL.reinterpret_as_double(), "9.999999999999996e+83"),
    (0xd16078e111c3556bUL.reinterpret_as_double(), "-9.999999999999996e+83"),
    (0x516078e111c3556cUL.reinterpret_as_double(), "9.999999999999998e+83"),
    (0xd16078e111c3556cUL.reinterpret_as_double(), "-9.999999999999998e+83"),
    (0x516078e111c3556dUL.reinterpret_as_double(), "1e+84"),
    (0xd16078e111c3556dUL.reinterpret_as_double(), "-1e+84"),
    (0x516078e111c3556eUL.reinterpret_as_double(), "1.0000000000000003e+84"),
    (0xd16078e111c3556eUL.reinterpret_as_double(), "-1.0000000000000003e+84"),
    (0x516078e111c3556fUL.reinterpret_as_double(), "1.0000000000000005e+84"),
    (0xd16078e111c3556fUL.reinterpret_as_double(), "-1.0000000000000005e+84"),
    (0x54e6dc186ef9f45aUL.reinterpret_as_double(), "9.999999999999997e+100"),
    (0xd4e6dc186ef9f45aUL.reinterpret_as_double(), "-9.999999999999997e+100"),
    (0x54e6dc186ef9f45bUL.reinterpret_as_double(), "9.999999999999998e+100"),
    (0xd4e6dc186ef9f45bUL.reinterpret_as_double(), "-9.999999999999998e+100"),
    (0x54e6dc186ef9f45cUL.reinterpret_as_double(), "1e+101"),
    (0xd4e6dc186ef9f45cUL.reinterpret_as_double(), "-1e+101"),
    (0x54e6dc186ef9f45dUL.reinterpret_as_double(), "1.0000000000000001e+101"),
    (0xd4e6dc186ef9f45dUL.reinterpret_as_double(), "-1.0000000000000001e+101"),
    (0x54e6dc186ef9f45eUL.reinterpret_as_double(), "1.0000000000000003e+101"),
    (0xd4e6dc186ef9f45eUL.reinterpret_as_double(), "-1.0000000000000003e+101"),
    (0x586fb969f40042c3UL.reinterpret_as_double(), "9.999999999999997e+117"),
    (0xd86fb969f40042c3UL.reinterpret_as_double(), "-9.999999999999997e+117"),
    (0x586fb969f40042c4UL.reinterpret_as_double(), "9.999999999999999e+117"),
    (0xd86fb969f40042c4UL.reinterpret_as_double(), "-9.999999999999999e+117"),
    (0x586fb969f40042c5UL.reinterpret_as_double(), "1e+118"),
    (0xd86fb969f40042c5UL.reinterpret_as_double(), "-1e+118"),
    (0x586fb969f40042c6UL.reinterpret_as_double(), "1.0000000000000001e+118"),
    (0xd86fb969f40042c6UL.reinterpret_as_double(), "-1.0000000000000001e+118"),
    (0x586fb969f40042c7UL.reinterpret_as_double(), "1.0000000000000002e+118"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 11" {
  let cases : Array[(Double, String)] = [
    (0xd86fb969f40042c7UL.reinterpret_as_double(), "-1.0000000000000002e+118"),
    (0x5bf6035ce8b6203bUL.reinterpret_as_double(), "9.999999999999996e+134"),
    (0xdbf6035ce8b6203bUL.reinterpret_as_double(), "-9.999999999999996e+134"),
    (0x5bf6035ce8b6203cUL.reinterpret_as_double(), "9.999999999999998e+134"),
    (0xdbf6035ce8b6203cUL.reinterpret_as_double(), "-9.999999999999998e+134"),
    (0x5bf6035ce8b6203dUL.reinterpret_as_double(), "1e+135"),
    (0xdbf6035ce8b6203dUL.reinterpret_as_double(), "-1e+135"),
    (0x5bf6035ce8b6203eUL.reinterpret_as_double(), "1.0000000000000001e+135"),
    (0xdbf6035ce8b6203eUL.reinterpret_as_double(), "-1.0000000000000001e+135"),
    (0x5bf6035ce8b6203fUL.reinterpret_as_double(), "1.0000000000000003e+135"),
    (0xdbf6035ce8b6203fUL.reinterpret_as_double(), "-1.0000000000000003e+135"),
    (0x5f7e8ca3185deb70UL.reinterpret_as_double(), "9.999999999999998e+151"),
    (0xdf7e8ca3185deb70UL.reinterpret_as_double(), "-9.999999999999998e+151"),
    (0x5f7e8ca3185deb71UL.reinterpret_as_double(), "9.999999999999999e+151"),
    (0xdf7e8ca3185deb71UL.reinterpret_as_double(), "-9.999999999999999e+151"),
    (0x5f7e8ca3185deb72UL.reinterpret_as_double(), "1e+152"),
    (0xdf7e8ca3185deb72UL.reinterpret_as_double(), "-1e+152"),
    (0x5f7e8ca3185deb73UL.reinterpret_as_double(), "1.0000000000000002e+152"),
    (0xdf7e8ca3185deb73UL.reinterpret_as_double(), "-1.0000000000000002e+152"),
    (0x5f7e8ca3185deb74UL.reinterpret_as_double(), "1.0000000000000003e+152"),
    (0xdf7e8ca3185deb74UL.reinterpret_as_double(), "-1.0000000000000003e+152"),
    (0x630532a837eae8a3UL.reinterpret_as_double(), "9.999999999999996e+168"),
    (0xe30532a837eae8a3UL.reinterpret_as_double(), "-9.999999999999996e+168"),
    (0x630532a837eae8a4UL.reinterpret_as_double(), "9.999999999999998e+168"),
    (0xe30532a837eae8a4UL.reinterpret_as_double(), "-9.999999999999998e+168"),
    (0x630532a837eae8a5UL.reinterpret_as_double(), "1e+169"),
    (0xe30532a837eae8a5UL.reinterpret_as_double(), "-1e+169"),
    (0x630532a837eae8a6UL.reinterpret_as_double(), "1.0000000000000001e+169"),
    (0xe30532a837eae8a6UL.reinterpret_as_double(), "-1.0000000000000001e+169"),
    (0x630532a837eae8a7UL.reinterpret_as_double(), "1.0000000000000003e+169"),
    (0xe30532a837eae8a7UL.reinterpret_as_double(), "-1.0000000000000003e+169"),
    (0x668d6affe45f818dUL.reinterpret_as_double(), "9.999999999999997e+185"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 12" {
  let cases : Array[(Double, String)] = [
    (0xe68d6affe45f818dUL.reinterpret_as_double(), "-9.999999999999997e+185"),
    (0x668d6affe45f818eUL.reinterpret_as_double(), "9.999999999999999e+185"),
    (0xe68d6affe45f818eUL.reinterpret_as_double(), "-9.999999999999999e+185"),
    (0x668d6affe45f818fUL.reinterpret_as_double(), "1e+186"),
    (0xe68d6affe45f818fUL.reinterpret_as_double(), "-1e+186"),
    (0x668d6affe45f8190UL.reinterpret_as_double(), "1.0000000000000001e+186"),
    (0xe68d6affe45f8190UL.reinterpret_as_double(), "-1.0000000000000001e+186"),
    (0x668d6affe45f8191UL.reinterpret_as_double(), "1.0000000000000002e+186"),
    (0xe68d6affe45f8191UL.reinterpret_as_double(), "-1.0000000000000002e+186"),
    (0x6a1469ae42c8560aUL.reinterpret_as_double(), "9.999999999999996e+202"),
    (0xea1469ae42c8560aUL.reinterpret_as_double(), "-9.999999999999996e+202"),
    (0x6a1469ae42c8560bUL.reinterpret_as_double(), "9.999999999999998e+202"),
    (0xea1469ae42c8560bUL.reinterpret_as_double(), "-9.999999999999998e+202"),
    (0x6a1469ae42c8560cUL.reinterpret_as_double(), "1e+203"),
    (0xea1469ae42c8560cUL.reinterpret_as_double(), "-1e+203"),
    (0x6a1469ae42c8560dUL.reinterpret_as_double(), "1.0000000000000002e+203"),
    (0xea1469ae42c8560dUL.reinterpret_as_double(), "-1.0000000000000002e+203"),
    (0x6a1469ae42c8560eUL.reinterpret_as_double(), "1.0000000000000003e+203"),
    (0xea1469ae42c8560eUL.reinterpret_as_double(), "-1.0000000000000003e+203"),
    (0x6d9c5416bb92e3e4UL.reinterpret_as_double(), "9.999999999999997e+219"),
    (0xed9c5416bb92e3e4UL.reinterpret_as_double(), "-9.999999999999997e+219"),
    (0x6d9c5416bb92e3e5UL.reinterpret_as_double(), "9.999999999999999e+219"),
    (0xed9c5416bb92e3e5UL.reinterpret_as_double(), "-9.999999999999999e+219"),
    (0x6d9c5416bb92e3e6UL.reinterpret_as_double(), "1e+220"),
    (0xed9c5416bb92e3e6UL.reinterpret_as_double(), "-1e+220"),
    (0x6d9c5416bb92e3e7UL.reinterpret_as_double(), "1.0000000000000001e+220"),
    (0xed9c5416bb92e3e7UL.reinterpret_as_double(), "-1.0000000000000001e+220"),
    (0x6d9c5416bb92e3e8UL.reinterpret_as_double(), "1.0000000000000002e+220"),
    (0xed9c5416bb92e3e8UL.reinterpret_as_double(), "-1.0000000000000002e+220"),
    (0x7123a825c100dd0fUL.reinterpret_as_double(), "9.999999999999996e+236"),
    (0xf123a825c100dd0fUL.reinterpret_as_double(), "-9.999999999999996e+236"),
    (0x7123a825c100dd10UL.reinterpret_as_double(), "9.999999999999998e+236"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 13" {
  let cases : Array[(Double, String)] = [
    (0xf123a825c100dd10UL.reinterpret_as_double(), "-9.999999999999998e+236"),
    (0x7123a825c100dd11UL.reinterpret_as_double(), "1e+237"),
    (0xf123a825c100dd11UL.reinterpret_as_double(), "-1e+237"),
    (0x7123a825c100dd12UL.reinterpret_as_double(), "1.0000000000000001e+237"),
    (0xf123a825c100dd12UL.reinterpret_as_double(), "-1.0000000000000001e+237"),
    (0x7123a825c100dd13UL.reinterpret_as_double(), "1.0000000000000003e+237"),
    (0xf123a825c100dd13UL.reinterpret_as_double(), "-1.0000000000000003e+237"),
    (0x74ab4781ead1989cUL.reinterpret_as_double(), "9.999999999999997e+253"),
    (0xf4ab4781ead1989cUL.reinterpret_as_double(), "-9.999999999999997e+253"),
    (0x74ab4781ead1989dUL.reinterpret_as_double(), "9.999999999999998e+253"),
    (0xf4ab4781ead1989dUL.reinterpret_as_double(), "-9.999999999999998e+253"),
    (0x74ab4781ead1989eUL.reinterpret_as_double(), "1e+254"),
    (0xf4ab4781ead1989eUL.reinterpret_as_double(), "-1e+254"),
    (0x74ab4781ead1989fUL.reinterpret_as_double(), "1.0000000000000001e+254"),
    (0xf4ab4781ead1989fUL.reinterpret_as_double(), "-1.0000000000000001e+254"),
    (0x74ab4781ead198a0UL.reinterpret_as_double(), "1.0000000000000002e+254"),
    (0xf4ab4781ead198a0UL.reinterpret_as_double(), "-1.0000000000000002e+254"),
    (0x7832edc82110c2f7UL.reinterpret_as_double(), "9.999999999999996e+270"),
    (0xf832edc82110c2f7UL.reinterpret_as_double(), "-9.999999999999996e+270"),
    (0x7832edc82110c2f8UL.reinterpret_as_double(), "9.999999999999998e+270"),
    (0xf832edc82110c2f8UL.reinterpret_as_double(), "-9.999999999999998e+270"),
    (0x7832edc82110c2f9UL.reinterpret_as_double(), "1e+271"),
    (0xf832edc82110c2f9UL.reinterpret_as_double(), "-1e+271"),
    (0x7832edc82110c2faUL.reinterpret_as_double(), "1.0000000000000001e+271"),
    (0xf832edc82110c2faUL.reinterpret_as_double(), "-1.0000000000000001e+271"),
    (0x7832edc82110c2fbUL.reinterpret_as_double(), "1.0000000000000003e+271"),
    (0xf832edc82110c2fbUL.reinterpret_as_double(), "-1.0000000000000003e+271"),
    (0x7bba44df832b8d44UL.reinterpret_as_double(), "9.999999999999997e+287"),
    (0xfbba44df832b8d44UL.reinterpret_as_double(), "-9.999999999999997e+287"),
    (0x7bba44df832b8d45UL.reinterpret_as_double(), "9.999999999999999e+287"),
    (0xfbba44df832b8d45UL.reinterpret_as_double(), "-9.999999999999999e+287"),
    (0x7bba44df832b8d46UL.reinterpret_as_double(), "1e+288"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 14" {
  let cases : Array[(Double, String)] = [
    (0xfbba44df832b8d46UL.reinterpret_as_double(), "-1e+288"),
    (0x7bba44df832b8d47UL.reinterpret_as_double(), "1.0000000000000001e+288"),
    (0xfbba44df832b8d47UL.reinterpret_as_double(), "-1.0000000000000001e+288"),
    (0x7bba44df832b8d48UL.reinterpret_as_double(), "1.0000000000000003e+288"),
    (0xfbba44df832b8d48UL.reinterpret_as_double(), "-1.0000000000000003e+288"),
    (0x7f423a516e82d9b8UL.reinterpret_as_double(), "9.999999999999995e+304"),
    (0xff423a516e82d9b8UL.reinterpret_as_double(), "-9.999999999999995e+304"),
    (0x7f423a516e82d9b9UL.reinterpret_as_double(), "9.999999999999997e+304"),
    (0xff423a516e82d9b9UL.reinterpret_as_double(), "-9.999999999999997e+304"),
    (0x7f423a516e82d9baUL.reinterpret_as_double(), "1e+305"),
    (0xff423a516e82d9baUL.reinterpret_as_double(), "-1e+305"),
    (0x7f423a516e82d9bbUL.reinterpret_as_double(), "1.0000000000000001e+305"),
    (0xff423a516e82d9bbUL.reinterpret_as_double(), "-1.0000000000000001e+305"),
    (0x7f423a516e82d9bcUL.reinterpret_as_double(), "1.0000000000000003e+305"),
    (0xff423a516e82d9bcUL.reinterpret_as_double(), "-1.0000000000000003e+305"),
    (0xf518d9a9a4a2ec1aUL.reinterpret_as_double(), "-1.1660226939015896e+256"),
    (0x4593a7d0ac1f69cfUL.reinterpret_as_double(), "1.5207728064532962e+27"),
    (0x737525b1291659f8UL.reinterpret_as_double(), "1.478597698047793e+248"),
    (0x672445b555597635UL.reinterpret_as_double(), "7.056515245060646e+188"),
    (0x5113eac1d6a9a122UL.reinterpret_as_double(), "3.778532778160804e+82"),
    (0x36c5303475cdfb87UL.reinterpret_as_double(), "7.422783230625592e-45"),
    (0x087408d47323e0b0UL.reinterpret_as_double(), "6.067673404258352e-268"),
    (0x13e8585c4346fe13UL.reinterpret_as_double(), "9.039526212720722e-213"),
    (0xfb3b1944c33cc15dUL.reinterpret_as_double(), "-4.029623325361996e+285"),
    (0x57fedee079f2ac9cUL.reinterpret_as_double(), "7.60227546478801e+115"),
    (0x0fefc1927052da8eUL.reinterpret_as_double(), "6.3920633368340775e-232"),
    (0x738e33396e080c92UL.reinterpret_as_double(), "4.2231329137395813e+248"),
    (0x38acdf933dbff41cUL.reinterpret_as_double(), "1.0860943556759175e-35"),
    (0x9454238408896b70UL.reinterpret_as_double(), "-9.571394064676581e-211"),
    (0xb2a9713dc8ecc61fUL.reinterpret_as_double(), "-1.2079477432825747e-64"),
    (0xb545eaa3baecbf10UL.reinterpret_as_double(), "-4.576391432618647e-52"),
    (0xa8f84b26608427f4UL.reinterpret_as_double(), "-2.5254145199499837e-111"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 15" {
  let cases : Array[(Double, String)] = [
    (0x5c39ca4ab59bb214UL.reinterpret_as_double(), "1.8745317866314033e+136"),
    (0xc1a49fe1a34e6608UL.reinterpret_as_double(), "-173011153.6531222"),
    (0x1875dd541cf254a6UL.reinterpret_as_double(), "7.667673176214515e-191"),
    (0x4066581c0119a978UL.reinterpret_as_double(), "178.75341849338633"),
    (0x74460504a6528c14UL.reinterpret_as_double(), "1.261234543385899e+252"),
    (0x3f4214f7d59c0736UL.reinterpret_as_double(), "0.0005518159989323704"),
    (0x648f8a24d3bce017UL.reinterpret_as_double(), "2.4962265517775411e+176"),
    (0x6e983ee7535b8190UL.reinterpret_as_double(), "5.6090823843351106e+224"),
    (0x523ce423bc0d1dfbUL.reinterpret_as_double(), "1.436825030052463e+88"),
    (0x238aacbb8d2d3f3fUL.reinterpret_as_double(), "1.791975770804179e-137"),
    (0x200d1c0dece8ce33UL.reinterpret_as_double(), "2.7138652751123924e-154"),
    (0x524727979ba83e8aUL.reinterpret_as_double(), "2.303069801887551e+88"),
    (0x424283c739665b77UL.reinterpret_as_double(), "159040565964.71457"),
    (0xec50caa293fba34dUL.reinterpret_as_double(), "-5.65285116555162e+213"),
    (0x87eb195edb6ef325UL.reinterpret_as_double(), "-1.6029826911353274e-270"),
    (0xa90bc9f7dc483db1UL.reinterpret_as_double(), "-5.7775480117683654e-111"),
    (0xb35c1106649f8405UL.reinterpret_as_double(), "-2.7290356554008964e-61"),
    (0x03c97cee2944b159UL.reinterpret_as_double(), "2.0432904520320452e-290"),
    (0x0fe58ae709bb18e3UL.reinterpret_as_double(), "4.336219165317583e-232"),
    (0xdfe6c51f5c00c343UL.reinterpret_as_double(), "-9.54049741796661e+153"),
    (0x965f4ba8b94ca746UL.reinterpret_as_double(), "-6.388301432529885e-201"),
    (0xc519d07270c273bbUL.reinterpret_as_double(), "-7.801877193202736e+24"),
    (0xcaff4a1a901b4206UL.reinterpret_as_double(), "-1.873084761993981e+53"),
    (0xf1c30f8763e21a8fUL.reinterpret_as_double(), "-9.929433873430591e+239"),
    (0x5f51a62151be8760UL.reinterpret_as_double(), "1.4442973447209843e+151"),
    (0x047f8ab6e88112d1UL.reinterpret_as_double(), "5.1785879319708805e-287"),
    (0x10d13f8e2cedf998UL.reinterpret_as_double(), "1.1376499623338055e-227"),
    (0x66df112efb755d36UL.reinterpret_as_double(), "3.3793903469444412e+187"),
    (0xae31e478be42c922UL.reinterpret_as_double(), "-3.5977541536741394e-86"),
    (0x32e58b3362fa2bf2UL.reinterpret_as_double(), "1.6365613173093462e-63"),
    (0x5dd21a40f7ecfd0cUL.reinterpret_as_double(), "8.82994081361197e+143"),
    (0x21cb1b1c9cac342dUL.reinterpret_as_double(), "6.783534356232654e-146"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 16" {
  let cases : Array[(Double, String)] = [
    (0xc3c04140dce36ddcUL.reinterpret_as_double(), "-2.3425773910913004e+18"),
    (0x04a73b1f9bda624eUL.reinterpret_as_double(), "3.0512733940240934e-286"),
    (0xbca5210ba0fc61c3UL.reinterpret_as_double(), "-1.4661247002684874e-16"),
    (0x7e5dfb4c91db3240UL.reinterpret_as_double(), "5.019622222296569e+300"),
    (0x51c8e4af70ada78eUL.reinterpret_as_double(), "9.671888685682806e+85"),
    (0x1c3ea937637bc941UL.reinterpret_as_double(), "1.2396778249039332e-172"),
    (0x5a6fc60b783416c2UL.reinterpret_as_double(), "4.301647093896463e+127"),
    (0x761f52b2e2e3a4e4UL.reinterpret_as_double(), "9.632082559213935e+260"),
    (0x07f3569735d3e448UL.reinterpret_as_double(), "2.2878152770148903e-270"),
    (0x331b0a4b86ee5286UL.reinterpret_as_double(), "1.643278034775599e-62"),
    (0x89bf32f726fee3b9UL.reinterpret_as_double(), "-9.907991397723655e-262"),
    (0x070bfb1a1340f5a4UL.reinterpret_as_double(), "1.0102180613062196e-274"),
    (0xde8fc3020cd52221UL.reinterpret_as_double(), "-3.1728703078183727e+147"),
    (0x63680f54b27e2849UL.reinterpret_as_double(), "7.264088495187582e+170"),
    (0xa5a37187e5e387daUL.reinterpret_as_double(), "-2.244015425876803e-127"),
    (0x38165df9c9672aadUL.reinterpret_as_double(), "1.643274444060991e-38"),
    (0xb55ba308fb7f41aaUL.reinterpret_as_double(), "-1.1541689516994622e-51"),
    (0x903e9238090141d1UL.reinterpret_as_double(), "-1.9691343811406373e-230"),
    (0xf69b2191a6ba9833UL.reinterpret_as_double(), "-2.1358172479583238e+263"),
    (0xec1b1b3822286f4bUL.reinterpret_as_double(), "-5.703318190187877e+212"),
    (0xf441377f1e153e43UL.reinterpret_as_double(), "-9.86139611688064e+251"),
    (0x0a89a340fa156534UL.reinterpret_as_double(), "6.6698022678637005e-258"),
    (0x1b824ba2e8a3fc62UL.reinterpret_as_double(), "3.611900259346313e-176"),
    (0x55ee70c036867e92UL.reinterpret_as_double(), "8.726886351526889e+105"),
    (0xc39ea921a915a8fcUL.reinterpret_as_double(), "-5.523335255746312e+17"),
    (0xc45b5fa8191472c2UL.reinterpret_as_double(), "-2.0198195071818552e+21"),
    (0x0b949879ae8766d6UL.reinterpret_as_double(), "7.022928405728686e-253"),
    (0xfbde2809dd02daccUL.reinterpret_as_double(), "-4.591931130458714e+288"),
    (0x54160738101d03a8UL.reinterpret_as_double(), "1.1762986980368433e+97"),
    (0x7bab0fab6d7f1c9eUL.reinterpret_as_double(), "5.150780945167966e+287"),
    (0xcb7f651e79d44586UL.reinterpret_as_double(), "-4.811269179733288e+55"),
    (0x746f30b58acfa83cUL.reinterpret_as_double(), "7.14604119202883e+252"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 17" {
  let cases : Array[(Double, String)] = [
    (0x74ba1eb15bbfb700UL.reinterpret_as_double(), "1.914995528098899e+254"),
    (0x024e48929a9510e7UL.reinterpret_as_double(), "1.4470388047738496e-297"),
    (0xdf087d4cb6a6ae88UL.reinterpret_as_double(), "-6.262776682064993e+149"),
    (0x5e035c7cf0260b84UL.reinterpret_as_double(), "7.55513151932803e+144"),
    (0xbb71166c3ac089b3UL.reinterpret_as_double(), "-2.2615235673022717e-22"),
    (0x278d4d3657d9cb13UL.reinterpret_as_double(), "3.6311417524170352e-118"),
    (0xf46fc06adebf5d80UL.reinterpret_as_double(), "-7.274655208908424e+252"),
    (0xbcaba62b9b80bcbdUL.reinterpret_as_double(), "-1.9185419153788523e-16"),
    (0x54aa8d76d8adbe1eUL.reinterpret_as_double(), "7.2596477508975655e+99"),
    (0xaafd343a0e25b070UL.reinterpret_as_double(), "-1.303899069525641e-101"),
    (0xb4fad180e866d100UL.reinterpret_as_double(), "-1.7499805064400717e-53"),
    (0x9f17767e69376890UL.reinterpret_as_double(), "-6.675493316031998e-159"),
    (0x17e0c2390da0a143UL.reinterpret_as_double(), "1.1478699442209554e-193"),
    (0x6cdcb52e2e8e403cUL.reinterpret_as_double(), "2.4740920101030732e+216"),
    (0x12a7b96de409b4ceUL.reinterpret_as_double(), "8.400926269138878e-219"),
    (0x437d5d7ce66aca15UL.reinterpret_as_double(), "1.32249045563122e+17"),
    (0xdda4d6b65d5cb43bUL.reinterpret_as_double(), "-1.2705711809323534e+143"),
    (0xfe4c65537ce4deb0UL.reinterpret_as_double(), "-2.3770585665362468e+300"),
    (0x83187c0affb65be5UL.reinterpret_as_double(), "-9.584208212546134e-294"),
    (0xd5991448945c8332UL.reinterpret_as_double(), "-2.2468431630246692e+104"),
    (0x98558d9139a080daUL.reinterpret_as_double(), "-1.889602431295351e-191"),
    (0x186aed0484f9b3edUL.reinterpret_as_double(), "4.7213064178164823e-191"),
    (0x36b181e84ee55a30UL.reinterpret_as_double(), "3.0666455236007697e-45"),
    (0xbef07250910ca724UL.reinterpret_as_double(), "-1.568464455484817e-05"),
    (0x0057a5bfe2a59afeUL.reinterpret_as_double(), "5.261734325915378e-307"),
    (0x0db8c7ed1f3e8299UL.reinterpret_as_double(), "1.451716002915797e-242"),
    (0xc41edf8a0b714efaUL.reinterpret_as_double(), "-1.4237750545245369e+20"),
    (0xa991c06ad038ab4eUL.reinterpret_as_double(), "-1.8896431741121376e-108"),
    (0x8bb41e8a7e1dac5bUL.reinterpret_as_double(), "-2.7442048306116807e-252"),
    (0xd69a349f180e2569UL.reinterpret_as_double(), "-1.5386214035555524e+109"),
    (0x180f88d561445320UL.reinterpret_as_double(), "8.639703111375443e-193"),
    (0x7aa44e6401da3972UL.reinterpret_as_double(), "5.897594298003674e+282"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 18" {
  let cases : Array[(Double, String)] = [
    (0x7c48c4f2ccd12043UL.reinterpret_as_double(), "4.8276979418786344e+290"),
    (0x6f2e41f6e2254254UL.reinterpret_as_double(), "3.583952741327459e+227"),
    (0xc6f5719a20d02e32UL.reinterpret_as_double(), "-6.958897350416641e+33"),
    (0x25a1aaef9fb2bc68UL.reinterpret_as_double(), "2.039070881820784e-127"),
    (0xc00273b2b093ded3UL.reinterpret_as_double(), "-2.306493167412421"),
    (0x2e0f57a031825962UL.reinterpret_as_double(), "7.877745752814903e-87"),
    (0x60235496f6d26eb0UL.reinterpret_as_double(), "1.2958933646751222e+155"),
    (0xe33df07c23371e1eUL.reinterpret_as_double(), "-1.1299014869060028e+170"),
    (0x8cd5d06e069bf04dUL.reinterpret_as_double(), "-7.799781450078314e-247"),
    (0x9f5fcbe01ddef477UL.reinterpret_as_double(), "-1.4474383511268016e-157"),
    (0xcb6458a18c0db835UL.reinterpret_as_double(), "-1.559024189037141e+55"),
    (0x449f6bc73533b9d9UL.reinterpret_as_double(), "3.7095379255276635e+22"),
    (0x47208723ce286c90UL.reinterpret_as_double(), "4.290885591075997e+34"),
    (0x9b5fbc45bde5ec35UL.reinterpret_as_double(), "-7.83153820633234e-177"),
    (0x4197c7ad3ec74ef6UL.reinterpret_as_double(), "99740495.69463715"),
    (0xb6f72d3be1b146c4UL.reinterpret_as_double(), "-6.495493414162411e-44"),
    (0x90f199db9d8418faUL.reinterpret_as_double(), "-4.643664142375242e-227"),
    (0xfcc8306e8f422adfUL.reinterpret_as_double(), "-1.2069438620195858e+293"),
    (0xc0621e17839d705bUL.reinterpret_as_double(), "-144.940370376108"),
    (0xdf2243ee23b7241bUL.reinterpret_as_double(), "-1.8684260383492366e+150"),
    (0x193122aa5a56df54UL.reinterpret_as_double(), "2.4613719870689155e-187"),
    (0xea67d450f5e05028UL.reinterpret_as_double(), "-3.7355921844430724e+204"),
    (0xfcd995d12a5cc66fUL.reinterpret_as_double(), "-2.553200955811466e+293"),
    (0x645db320b50ea2daUL.reinterpret_as_double(), "2.9382572531299427e+175"),
    (0x7ee34c668f004f28UL.reinterpret_as_double(), "1.654275558365528e+303"),
    (0x776a7252c3efc665UL.reinterpret_as_double(), "1.7055152771959185e+267"),
    (0xa35531ccdef1f727UL.reinterpret_as_double(), "-1.7797780295136206e-138"),
    (0xca065c038e8d05b8UL.reinterpret_as_double(), "-4.084792811545409e+48"),
    (0x74bb36b31047123eUL.reinterpret_as_double(), "1.995186366679352e+254"),
    (0xcbf656dd7d7deb97UL.reinterpret_as_double(), "-8.764135411842608e+57"),
    (0x743963ca2d15d8c1UL.reinterpret_as_double(), "7.271361490365595e+251"),
    (0x225a3250c4a217e9UL.reinterpret_as_double(), "3.356650223570889e-143"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 19" {
  let cases : Array[(Double, String)] = [
    (0xa01ba26f78ef83caUL.reinterpret_as_double(), "-5.1526904282756994e-154"),
    (0x2d5bbe33efa078e7UL.reinterpret_as_double(), "3.404822043329451e-90"),
    (0x5a59fc2ea142bad4UL.reinterpret_as_double(), "1.7589858858038004e+127"),
    (0xd7ab6b603a43de1eUL.reinterpret_as_double(), "-2.1101188070325227e+114"),
    (0x9bdd3ff4a6c14d64UL.reinterpret_as_double(), "-1.8478462071696696e-174"),
    (0x0da5270181b98eb8UL.reinterpret_as_double(), "6.195729884339293e-243"),
    (0xe24938fe40905124UL.reinterpret_as_double(), "-2.9049455655771382e+165"),
    (0x838c0d2d70d54d12UL.reinterpret_as_double(), "-1.4054969471696134e-291"),
    (0xaa58ea449e94ee47UL.reinterpret_as_double(), "-1.0863363673367758e-104"),
    (0xabdb885f03d3906eUL.reinterpret_as_double(), "-2.0140498389924567e-97"),
    (0x76f0eb5064243aaaUL.reinterpret_as_double(), "8.524244702025653e+264"),
    (0x8a6f03e8f2680305UL.reinterpret_as_double(), "-2.017201790003823e-258"),
    (0x9c90dbb138af41b9UL.reinterpret_as_double(), "-4.362274355966713e-171"),
    (0x0ed196216cbdf78cUL.reinterpret_as_double(), "2.7007323459422713e-237"),
    (0x0741592f88c1e21dUL.reinterpret_as_double(), "1.0021504265766254e-273"),
    (0x0d89951897ca1750UL.reinterpret_as_double(), "1.8733326920052806e-243"),
    (0x5719dc580d45c956UL.reinterpret_as_double(), "3.887039921277876e+111"),
    (0xcc281b84c4c3078eUL.reinterpret_as_double(), "-7.566259821424432e+58"),
    (0x66c2451b83ce776dUL.reinterpret_as_double(), "9.936757916372146e+186"),
    (0x36add2b0e7775d83UL.reinterpret_as_double(), "2.6119337936008092e-45"),
    (0x8dbeed40f5dbd46dUL.reinterpret_as_double(), "-1.8117493020533867e-242"),
    (0x3524fd0c6d75cf98UL.reinterpret_as_double(), "1.095649302467589e-52"),
    (0x1b900cbacd3c6326UL.reinterpret_as_double(), "6.337093958574646e-176"),
    (0xad0881afd2695a57UL.reinterpret_as_double(), "-9.398838774012144e-92"),
    (0x2e0f3c755a75baa7UL.reinterpret_as_double(), "7.851072346741097e-87"),
    (0xa2a6a05bcadcfc06UL.reinterpret_as_double(), "-9.277426530094444e-142"),
    (0xc1ab95cbeee2837fUL.reinterpret_as_double(), "-231400951.4424095"),
    (0x4d4a1af6541c2e32UL.reinterpret_as_double(), "2.1478212482277272e+64"),
    (0x49c927414b307fe8UL.reinterpret_as_double(), "2.8720037243513767e+47"),
    (0x7ef63b729f2f4a0eUL.reinterpret_as_double(), "3.811522026457369e+303"),
    (0x3102739cc4cf2acfUL.reinterpret_as_double(), "1.3054052059503937e-72"),
    (0x61ab398b87fe170bUL.reinterpret_as_double(), "3.0620490565804257e+162"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 20" {
  let cases : Array[(Double, String)] = [
    (0x61043d7de08254e5UL.reinterpret_as_double(), "2.2231182591319587e+159"),
    (0x6170836373773ad9UL.reinterpret_as_double(), "2.3216133240164317e+161"),
    (0x466fec013c7907c2UL.reinterpret_as_double(), "2.0232903958083644e+31"),
    (0xa77967ec0f8d2c6cUL.reinterpret_as_double(), "-1.5741897616805543e-118"),
    (0x44494ec08faffe71UL.reinterpret_as_double(), "9.33686590718553e+20"),
    (0x6c161afa8b27f4a4UL.reinterpret_as_double(), "4.651093273680244e+212"),
    (0x075029e1d4e1218fUL.reinterpret_as_double(), "1.8674203983382156e-273"),
    (0x3830794403bf7f5aUL.reinterpret_as_double(), "4.84118357942543e-38"),
    (0x7d0683ca19e2e321UL.reinterpret_as_double(), "1.797438021083797e+294"),
    (0x2180037fc8b72068UL.reinterpret_as_double(), "2.50474180901852e-147"),
    (0x95ff58cbf5b8e074UL.reinterpret_as_double(), "-9.998089166619576e-203"),
    (0xe3513df49a2c214bUL.reinterpret_as_double(), "-2.6028284557592745e+170"),
    (0x0fab4e34fea302caUL.reinterpret_as_double(), "3.4351320865311003e-233"),
    (0x7cee5ddf98748663UL.reinterpret_as_double(), "6.060707005046536e+293"),
    (0x21ec5713d9696676UL.reinterpret_as_double(), "2.8369664237202736e-145"),
    (0x5677eae2ef16d75fUL.reinterpret_as_double(), "3.510707905876849e+108"),
    (0xe84e8147a6ea2939UL.reinterpret_as_double(), "-2.7835449818402414e+194"),
    (0x5e3b954b8a826f7eUL.reinterpret_as_double(), "8.610776439971959e+145"),
    (0x550e4932ba112cf2UL.reinterpret_as_double(), "5.299433836437932e+101"),
    (0xf65b36e10bb67182UL.reinterpret_as_double(), "-1.3389814265515116e+262"),
    (0x37e089c4ece03c02UL.reinterpret_as_double(), "1.5187902293842953e-39"),
    (0x49a8777b4aa7c6a6UL.reinterpret_as_double(), "6.984015369673728e+46"),
    (0x3b8c76f4c685d6aeUL.reinterpret_as_double(), "7.534536069115999e-22"),
    (0xf08daa101f6513f2UL.reinterpret_as_double(), "-1.4737400211302196e+234"),
    (0xe8f4dc638d86c9f3UL.reinterpret_as_double(), "-3.89843314114111e+197"),
    (0x5cbcb650845dc701UL.reinterpret_as_double(), "5.3424932287063647e+138"),
    (0x80364588e9fa7ceeUL.reinterpret_as_double(), "-1.2389000079939552e-307"),
    (0xfff31794aa090d10UL.reinterpret_as_double(), "nan"),
    (0xf184e5f45fb2a056UL.reinterpret_as_double(), "-6.804194333949697e+238"),
    (0x014002de0e93cabbUL.reinterpret_as_double(), "1.1673961885858696e-302"),
    (0xf41ec254a9617b07UL.reinterpret_as_double(), "-2.2022675841110795e+251"),
    (0xd96de32b104d81a3UL.reinterpret_as_double(), "-6.174133811527679e+122"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 21" {
  let cases : Array[(Double, String)] = [
    (0x2f4e1b5c7e7a371fUL.reinterpret_as_double(), "7.934817235953828e-81"),
    (0x3af08356843f3b59UL.reinterpret_as_double(), "8.537041014258982e-25"),
    (0xc9dd7cfc6f9edd8bUL.reinterpret_as_double(), "-6.733920601483001e+47"),
    (0xf2c22d9b788ca068UL.reinterpret_as_double(), "-6.206064139188797e+244"),
    (0x32e1f4913963cbd8UL.reinterpret_as_double(), "1.3639692507403917e-63"),
    (0x38de4c91e96ec0c1UL.reinterpret_as_double(), "9.117804179317244e-35"),
    (0xd8ae750670b09cd3UL.reinterpret_as_double(), "-1.5360921677500156e+119"),
    (0xea3d5859b0bec32dUL.reinterpret_as_double(), "-5.7503324638971235e+203"),
    (0x916c8c585b812a56UL.reinterpret_as_double(), "-9.640783533373592e-225"),
    (0xb54081619e463ca1UL.reinterpret_as_double(), "-3.446487451880034e-52"),
    (0x61ac062c2ab061a4UL.reinterpret_as_double(), "3.1519515374388776e+162"),
    (0x810b1b991b0a50deUL.reinterpret_as_double(), "-1.2352894601240034e-303"),
    (0xb1412060394cc601UL.reinterpret_as_double(), "-1.9386475038503842e-71"),
    (0x616b6ad501a66426UL.reinterpret_as_double(), "1.927314475112248e+161"),
    (0x1d98d501500537c5UL.reinterpret_as_double(), "4.2110946080529244e-166"),
    (0xe5506aba73c8f242UL.reinterpret_as_double(), "-1.0644095845917115e+180"),
    (0xe49bdc3654dd6db0UL.reinterpret_as_double(), "-4.4100322870997336e+176"),
    (0x4178df6a80608f0dUL.reinterpret_as_double(), "26080936.023573924"),
    (0x29c072b2cea67d0dUL.reinterpret_as_double(), "1.400701950428082e-107"),
    (0xb7ba6ebf23dd3778UL.reinterpret_as_double(), "-3.0343141364796247e-40"),
    (0xc089371c1c0658c9UL.reinterpret_as_double(), "-806.8887253280492"),
    (0xa004065519389764UL.reinterpret_as_double(), "-1.866891301787947e-154"),
    (0x598dee02b1c9efabUL.reinterpret_as_double(), "2.4731532181206236e+123"),
    (0xf84a7d2494cdd820UL.reinterpret_as_double(), "-2.7987818020149446e+271"),
    (0xfd36e363e8164ab6UL.reinterpret_as_double(), "-1.461800908804769e+295"),
    (0x75de2e9ab71836a8UL.reinterpret_as_double(), "5.800761223445024e+259"),
    (0x6df1248a7f6c58c0UL.reinterpret_as_double(), "3.872906581760903e+221"),
    (0x48cfa63c480cc595UL.reinterpret_as_double(), "5.5140957291552146e+42"),
    (0xdeaa793ecaf25bffUL.reinterpret_as_double(), "-1.057842782057661e+148"),
    (0xca8d1f44985b31baUL.reinterpret_as_double(), "-1.3619857894164633e+51"),
    (0xdc0b92cf10bfd218UL.reinterpret_as_double(), "-2.505183407758407e+135"),
    (0x3bb16347789b9c70UL.reinterpret_as_double(), "3.682011842131696e-21"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original shortest repr 22" {
  let cases : Array[(Double, String)] = [
    (0xe5243cfbc6f42e91UL.reinterpret_as_double(), "-1.6402108546618246e+179"),
    (0x34ab014c22bfb51eUL.reinterpret_as_double(), "5.5067590877588456e-55"),
    (0x6dddd3df7cac5872UL.reinterpret_as_double(), "1.6846728068706763e+221"),
    (0xce952db9f22f694eUL.reinterpret_as_double(), "-3.654236332144878e+70"),
    (0x187df749c589e921UL.reinterpret_as_double(), "1.0508750706833312e-190"),
    (0x7757ac211e08c385UL.reinterpret_as_double(), "7.63304996790657e+266"),
    (0x82db7f4f6adbceb8UL.reinterpret_as_double(), "-6.727200902841583e-295"),
    (0x5f3500eb964c7d8fUL.reinterpret_as_double(), "4.297060616566106e+150"),
    (0x67bd97e3ddf77dceUL.reinterpret_as_double(), "5.2741315815522016e+191"),
    (0x1c6432ccd5ef63e6UL.reinterpret_as_double(), "6.533264952207473e-172"),
    (0x9613aa77c5345d1dUL.reinterpret_as_double(), "-2.5089761282207556e-202"),
    (0x253d35a34993334fUL.reinterpret_as_double(), "2.6337001915486967e-129"),
    (0xc260328d5b187067UL.reinterpret_as_double(), "-556540811459.5126"),
    (0x3165567cd96d1181UL.reinterpret_as_double(), "9.661432718115886e-71"),
    (0x4c542a501de175ebUL.reinterpret_as_double(), "5.0631818147439615e+59"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_repr(value), expected)
  }
}

///|
test "string numeric original digits ''" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.999999999999998"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316493862389376e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747758998346729e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711458981876e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535197809287e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '\u0000', None, false), expected)
  }
}

///|
test "string numeric original digits '#'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.999999999999998"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316493862389376e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747758998346729e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711458981876e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535197809287e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '\u0000', None, true), expected)
  }
}

///|
test "string numeric original digits '.0'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "4e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "3e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(0), false),
      expected,
    )
  }
}

///|
test "string numeric original digits '#.0'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "4.e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "3.e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(0), true),
      expected,
    )
  }
}

///|
test "string numeric original digits '.1'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "4e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "3e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(1), false),
      expected,
    )
  }
}

///|
test "string numeric original digits '#.1'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "4.e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "3.e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(1), true),
      expected,
    )
  }
}

///|
test "string numeric original digits '.2'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.2e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(2), false),
      expected,
    )
  }
}

///|
test "string numeric original digits '#.2'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.2e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.0e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.0e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.0e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(2), true),
      expected,
    )
  }
}

///|
test "string numeric original digits '.6'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(6), false),
      expected,
    )
  }
}

///|
test "string numeric original digits '#.6'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67500"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00500"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3400"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.9990"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(6), true),
      expected,
    )
  }
}

///|
test "string numeric original digits '.17'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.6749999999999998"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0049999999999999"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.998999999999995"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.9999999999999982"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0000000000000001e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9406564584124654e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3164938623893759e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7477589983467292e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5271145898187601e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.1985351978092871e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(17), false),
      expected,
    )
  }
}

///|
test "string numeric original digits '#.17'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0000000000000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0000000000000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0000000000000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0000000000000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5000000000000000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5000000000000000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.6749999999999998"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0049999999999999"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000000000000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.998999999999995"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.9999999999999982"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010000000000000000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0000000000000001e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0000000000000000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0000000000000000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9406564584124654e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3164938623893759e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7477589983467292e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5271145898187601e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.1985351978092871e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(17), true),
      expected,
    )
  }
}

///|
test "string numeric original digits '.101'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.339999999999999857891452847979962825775146484375",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.998999999999995225152815692126750946044921875",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.9999999999999982236431605997495353221893310546875",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.000100000000000000004792173602385929598312941379845142364501953125",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.0000000000000000818030539140313095458623138256371021270751953125e-05",
    ),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.0"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.000000000000000010979063629440455417404923096773118463368106829031575854049114915371633289784946889e+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599238e-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.2250738585072013830902327173324040642192159804623318305533274168872044348139181958542831590125110206e-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.7976931348623157081452742373170435679807056752584499659891747680315726078002853876058955863276687817e+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.9212809253432473569480083263091796953962008935665447128685553082455521739613549698938463855600893479e-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.3164938623893758927775792791600822795243767540726031029919357489699704824038842368349384230467957081e-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.4195253377486358110244389220398724131635707465113706831196071097958171695851276807472283193981178359e+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.7477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826e+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.12238054250656205113045871257781982421875",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.527114589818760057257516182233707348587318491004647588514186397897428538735410927804510927568843575e-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.0",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(101), false),
      expected,
    )
  }
}

///|
test "string numeric original digits '#.101'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.6749999999999998223643160599749535322189331054687500000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.0049999999999998934185896359849721193313598632812500000000000000000000000000000000000000000000000000",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.339999999999999857891452847979962825775146484375000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.998999999999995225152815692126750946044921875000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.9999999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.00010000000000000000479217360238592959831294137984514236450195312500000000000000000000000000000000000000",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.0000000000000000818030539140313095458623138256371021270751953125000000000000000000000000000000000000e-05",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.0000000000000000109790636294404554174049230967731184633681068290315758540491149153716332897849468890e+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599238e-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.2250738585072013830902327173324040642192159804623318305533274168872044348139181958542831590125110206e-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.7976931348623157081452742373170435679807056752584499659891747680315726078002853876058955863276687817e+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.9212809253432473569480083263091796953962008935665447128685553082455521739613549698938463855600893479e-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.3164938623893758927775792791600822795243767540726031029919357489699704824038842368349384230467957081e-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.4195253377486358110244389220398724131635707465113706831196071097958171695851276807472283193981178359e+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.7477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826e+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.1223805425065620511304587125778198242187500000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0000000000000000000000000000",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.5271145898187600572575161822337073485873184910046475885141863978974285387354109278045109275688435750e-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(
      named_format_float_digits(value, '\u0000', Some(101), true),
      expected,
    )
  }
}

///|
test "string numeric original digits 'e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.234000e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.999900e+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.000000e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.000000e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.000000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.000000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.000000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.000000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.940656e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.225074e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.797693e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.921281e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316494e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.419525e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747759e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.297122e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.330332e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.527115e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', None, false), expected)
  }
}

///|
test "string numeric original digits '#e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.234000e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.999900e+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.000000e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.000000e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.000000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.000000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.000000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.000000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.940656e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.225074e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.797693e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.921281e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316494e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.419525e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747759e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.297122e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.330332e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.527115e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', None, true), expected)
  }
}

///|
test "string numeric original digits '.0e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "4e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "3e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(0), false), expected)
  }
}

///|
test "string numeric original digits '#.0e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "4.e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "3.e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(0), true), expected)
  }
}

///|
test "string numeric original digits '.1e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.2e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.0e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.0e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.0e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.0e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(1), false), expected)
  }
}

///|
test "string numeric original digits '#.1e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.2e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.0e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.0e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.0e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.0e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(1), true), expected)
  }
}

///|
test "string numeric original digits '.2e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.23e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.00e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.00e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.00e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.23e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.80e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.32e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.42e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.75e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.30e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.53e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.20e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(2), false), expected)
  }
}

///|
test "string numeric original digits '#.2e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.23e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.00e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.00e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.00e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.23e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.80e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.32e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.42e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.75e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.30e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.53e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.20e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(2), true), expected)
  }
}

///|
test "string numeric original digits '.6e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.234000e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.999900e+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.000000e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.000000e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.000000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.000000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.000000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.000000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.940656e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.225074e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.797693e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.921281e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316494e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.419525e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747759e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.297122e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.330332e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.527115e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(6), false), expected)
  }
}

///|
test "string numeric original digits '#.6e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.234000e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.999900e+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.000000e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.000000e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.000000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.000000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.000000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.000000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.940656e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.225074e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.797693e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.921281e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316494e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.419525e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747759e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.297122e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.330332e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.527115e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(6), true), expected)
  }
}

///|
test "string numeric original digits '.17e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000000000000000e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000000000000000e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000000000000000e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000000000000000e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67499999999999982e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00499999999999989e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.23399999999999999e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.99989999999999952e+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.99999999999999822e+00"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.00000000000000005e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000000000000008e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000000000000000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000000000000000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000000000000001e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94065645841246544e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507385850720138e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769313486231571e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128092534324736e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649386238937589e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41952533774863581e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74775899834672922e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.29712238054250656e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033166235618631e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711458981876006e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19853519780928710e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(17), false), expected)
  }
}

///|
test "string numeric original digits '#.17e'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000e+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000e+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000000000000000e+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000000000000000e+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000000000000000e+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000000000000000e+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67499999999999982e+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00499999999999989e+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.23399999999999999e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.99989999999999952e+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.99999999999999822e+00"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.00000000000000005e-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000000000000008e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000000000000000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000000000000000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000000000000001e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94065645841246544e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507385850720138e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769313486231571e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128092534324736e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649386238937589e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41952533774863581e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74775899834672922e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.29712238054250656e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033166235618631e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711458981876006e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19853519780928710e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(17), true), expected)
  }
}

///|
test "string numeric original digits '.101e'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "1.23399999999999998578914528479799628257751464843750000000000000000000000000000000000000000000000000000e+01",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "9.99989999999999952251528156921267509460449218750000000000000000000000000000000000000000000000000000000e+01",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.99999999999999822364316059974953532218933105468750000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "1.00000000000000004792173602385929598312941379845142364501953125000000000000000000000000000000000000000e-04",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.00000000000000008180305391403130954586231382563710212707519531250000000000000000000000000000000000000e-05",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+15",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+16",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.00000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899e+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.94065645841246544176568792868221372365059802614324764425585682500675507270208751865299836361635992380e-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.22507385850720138309023271733240406421921598046233183055332741688720443481391819585428315901251102056e-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.79769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878172e+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.92128092534324735694800832630917969539620089356654471286855530824555217396135496989384638556008934794e-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.31649386238937589277757927916008227952437675407260310299193574896997048240388423683493842304679570814e-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.41952533774863581102443892203987241316357074651137068311960710979581716958512768074722831939811783588e+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.74775899834672921808997733256651826554373116633871451866008532231158957673091733677699225529056928260e+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2.29712238054250656205113045871257781982421875000000000000000000000000000000000000000000000000000000000e+03",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1.33033166235618630582407585345247218026258346769237423553354528415180390400000000000000000000000000000e+72",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.52711458981876005725751618223370734858731849100464758851418639789742853873541092780451092756884357502e-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2.19853519780928709659197440000000000000000000000000000000000000000000000000000000000000000000000000000e+25",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(101), false), expected)
  }
}

///|
test "string numeric original digits '#.101e'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "1.23399999999999998578914528479799628257751464843750000000000000000000000000000000000000000000000000000e+01",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "9.99989999999999952251528156921267509460449218750000000000000000000000000000000000000000000000000000000e+01",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.99999999999999822364316059974953532218933105468750000000000000000000000000000000000000000000000000000e+00",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "1.00000000000000004792173602385929598312941379845142364501953125000000000000000000000000000000000000000e-04",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.00000000000000008180305391403130954586231382563710212707519531250000000000000000000000000000000000000e-05",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+15",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+16",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.00000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899e+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.94065645841246544176568792868221372365059802614324764425585682500675507270208751865299836361635992380e-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.22507385850720138309023271733240406421921598046233183055332741688720443481391819585428315901251102056e-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.79769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878172e+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.92128092534324735694800832630917969539620089356654471286855530824555217396135496989384638556008934794e-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.31649386238937589277757927916008227952437675407260310299193574896997048240388423683493842304679570814e-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.41952533774863581102443892203987241316357074651137068311960710979581716958512768074722831939811783588e+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.74775899834672921808997733256651826554373116633871451866008532231158957673091733677699225529056928260e+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2.29712238054250656205113045871257781982421875000000000000000000000000000000000000000000000000000000000e+03",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1.33033166235618630582407585345247218026258346769237423553354528415180390400000000000000000000000000000e+72",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.52711458981876005725751618223370734858731849100464758851418639789742853873541092780451092756884357502e-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2.19853519780928709659197440000000000000000000000000000000000000000000000000000000000000000000000000000e+25",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'e', Some(101), true), expected)
  }
}

///|
test "string numeric original digits 'E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.234000E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.999900E+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.000000E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.000000E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.000000E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.000000E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.000000E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.000000E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.940656E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.225074E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.797693E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.921281E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316494E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.419525E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747759E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.297122E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.330332E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.527115E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', None, false), expected)
  }
}

///|
test "string numeric original digits '#E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.234000E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.999900E+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.000000E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.000000E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.000000E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.000000E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.000000E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.000000E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.940656E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.225074E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.797693E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.921281E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316494E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.419525E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747759E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.297122E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.330332E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.527115E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', None, true), expected)
  }
}

///|
test "string numeric original digits '.0E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "4E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "3E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(0), false), expected)
  }
}

///|
test "string numeric original digits '#.0E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "4.E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "3.E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(0), true), expected)
  }
}

///|
test "string numeric original digits '.1E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.2E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.0E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.0E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.0E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.0E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(1), false), expected)
  }
}

///|
test "string numeric original digits '#.1E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.2E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.0E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.0E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.0E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.0E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(1), true), expected)
  }
}

///|
test "string numeric original digits '.2E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.23E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.00E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.00E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.00E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.23E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.80E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.32E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.42E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.75E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.30E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.53E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.20E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(2), false), expected)
  }
}

///|
test "string numeric original digits '#.2E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.23E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.00E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.00E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.00E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.23E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.80E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.32E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.42E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.75E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.30E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.53E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.20E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(2), true), expected)
  }
}

///|
test "string numeric original digits '.6E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.234000E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.999900E+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.000000E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.000000E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.000000E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.000000E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.000000E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.000000E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.940656E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.225074E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.797693E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.921281E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316494E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.419525E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747759E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.297122E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.330332E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.527115E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(6), false), expected)
  }
}

///|
test "string numeric original digits '#.6E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.234000E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.999900E+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.000000E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.000000E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.000000E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.000000E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.000000E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.000000E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.940656E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.225074E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.797693E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.921281E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.316494E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.419525E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.747759E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.297122E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.330332E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.527115E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.198535E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(6), true), expected)
  }
}

///|
test "string numeric original digits '.17E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000000000000000E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000000000000000E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000000000000000E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000000000000000E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67499999999999982E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00499999999999989E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.23399999999999999E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.99989999999999952E+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.99999999999999822E+00"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.00000000000000005E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000000000000008E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000000000000000E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000000000000000E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000000000000001E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94065645841246544E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507385850720138E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769313486231571E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128092534324736E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649386238937589E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41952533774863581E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74775899834672922E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.29712238054250656E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033166235618631E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711458981876006E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19853519780928710E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(17), false), expected)
  }
}

///|
test "string numeric original digits '#.17E'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000E+00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000E+00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000000000000000E+00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000000000000000E+00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000000000000000E+00"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000000000000000E+00"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67499999999999982E+00"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00499999999999989E+00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.23399999999999999E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9.99989999999999952E+01"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.99999999999999822E+00"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "1.00000000000000005E-04"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000000000000008E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000000000000000E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000000000000000E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000000000000001E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94065645841246544E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507385850720138E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769313486231571E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128092534324736E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649386238937589E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41952533774863581E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74775899834672922E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.29712238054250656E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033166235618631E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711458981876006E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19853519780928710E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(17), true), expected)
  }
}

///|
test "string numeric original digits '.101E'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "1.23399999999999998578914528479799628257751464843750000000000000000000000000000000000000000000000000000E+01",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "9.99989999999999952251528156921267509460449218750000000000000000000000000000000000000000000000000000000E+01",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.99999999999999822364316059974953532218933105468750000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "1.00000000000000004792173602385929598312941379845142364501953125000000000000000000000000000000000000000E-04",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.00000000000000008180305391403130954586231382563710212707519531250000000000000000000000000000000000000E-05",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+15",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+16",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.00000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899E+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.94065645841246544176568792868221372365059802614324764425585682500675507270208751865299836361635992380E-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.22507385850720138309023271733240406421921598046233183055332741688720443481391819585428315901251102056E-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.79769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878172E+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.92128092534324735694800832630917969539620089356654471286855530824555217396135496989384638556008934794E-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.31649386238937589277757927916008227952437675407260310299193574896997048240388423683493842304679570814E-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.41952533774863581102443892203987241316357074651137068311960710979581716958512768074722831939811783588E+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.74775899834672921808997733256651826554373116633871451866008532231158957673091733677699225529056928260E+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2.29712238054250656205113045871257781982421875000000000000000000000000000000000000000000000000000000000E+03",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1.33033166235618630582407585345247218026258346769237423553354528415180390400000000000000000000000000000E+72",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.52711458981876005725751618223370734858731849100464758851418639789742853873541092780451092756884357502E-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2.19853519780928709659197440000000000000000000000000000000000000000000000000000000000000000000000000000E+25",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(101), false), expected)
  }
}

///|
test "string numeric original digits '#.101E'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "1.23399999999999998578914528479799628257751464843750000000000000000000000000000000000000000000000000000E+01",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "9.99989999999999952251528156921267509460449218750000000000000000000000000000000000000000000000000000000E+01",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.99999999999999822364316059974953532218933105468750000000000000000000000000000000000000000000000000000E+00",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "1.00000000000000004792173602385929598312941379845142364501953125000000000000000000000000000000000000000E-04",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.00000000000000008180305391403130954586231382563710212707519531250000000000000000000000000000000000000E-05",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+15",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E+16",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.00000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899E+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.94065645841246544176568792868221372365059802614324764425585682500675507270208751865299836361635992380E-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.22507385850720138309023271733240406421921598046233183055332741688720443481391819585428315901251102056E-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.79769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878172E+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.92128092534324735694800832630917969539620089356654471286855530824555217396135496989384638556008934794E-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.31649386238937589277757927916008227952437675407260310299193574896997048240388423683493842304679570814E-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.41952533774863581102443892203987241316357074651137068311960710979581716958512768074722831939811783588E+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.74775899834672921808997733256651826554373116633871451866008532231158957673091733677699225529056928260E+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2.29712238054250656205113045871257781982421875000000000000000000000000000000000000000000000000000000000E+03",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1.33033166235618630582407585345247218026258346769237423553354528415180390400000000000000000000000000000E+72",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.52711458981876005725751618223370734858731849100464758851418639789742853873541092780451092756884357502E-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2.19853519780928709659197440000000000000000000000000000000000000000000000000000000000000000000000000000E+25",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'E', Some(101), true), expected)
  }
}

///|
test "string numeric original digits 'f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999000"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.000000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.000010"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.122381"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', None, false), expected)
  }
}

///|
test "string numeric original digits '#f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999000"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.000000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.000010"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.122381"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', None, true), expected)
  }
}

///|
test "string numeric original digits '.0f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2"),
    (0x400c000000000000UL.reinterpret_as_double(), "4"),
    (0x4005666666666666UL.reinterpret_as_double(), "3"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0"),
    (0x0010000000000000UL.reinterpret_as_double(), "0"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(0), false), expected)
  }
}

///|
test "string numeric original digits '#.0f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0."),
    (0x8000000000000000UL.reinterpret_as_double(), "-0."),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1."),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1."),
    (0x4004000000000000UL.reinterpret_as_double(), "2."),
    (0x400c000000000000UL.reinterpret_as_double(), "4."),
    (0x4005666666666666UL.reinterpret_as_double(), "3."),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1."),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12."),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100."),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10."),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0."),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0."),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000."),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000."),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0."),
    (0x0010000000000000UL.reinterpret_as_double(), "0."),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0."),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0."),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297."),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0."),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(0), true), expected)
  }
}

///|
test "string numeric original digits '.1f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100.0"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.0"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.0"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.0",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.0"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.0"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.0"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.0"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.0",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.0",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.0"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.0",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(1), false), expected)
  }
}

///|
test "string numeric original digits '#.1f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100.0"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.0"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.0"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.0",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.0"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.0"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.0"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.0"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.0",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.0",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.0"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.0",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(1), true), expected)
  }
}

///|
test "string numeric original digits '.2f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100.00"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.00"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.00"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.00"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(2), false), expected)
  }
}

///|
test "string numeric original digits '#.2f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100.00"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.00"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.00"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.00"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(2), true), expected)
  }
}

///|
test "string numeric original digits '.6f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999000"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.000000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.000010"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.122381"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(6), false), expected)
  }
}

///|
test "string numeric original digits '#.6f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999000"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.000000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.000010"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.122381"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(6), true), expected)
  }
}

///|
test "string numeric original digits '.17f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000000000000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000000000000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000000000000000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000000000000000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67499999999999982"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00499999999999989"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.33999999999999986"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.99899999999999523"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.99999999999999822"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010000000000000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00001000000000000"),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.00000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.00000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00000000000000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00000000000000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00000000000000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00000000000000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00000000000000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00000000000000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00000000000000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00000000000000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12238054250656205"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00000000000000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00000000000000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(17), false), expected)
  }
}

///|
test "string numeric original digits '#.17f'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000000000000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000000000000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000000000000000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000000000000000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67499999999999982"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00499999999999989"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.33999999999999986"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.99899999999999523"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.99999999999999822"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010000000000000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00001000000000000"),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.00000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.00000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00000000000000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00000000000000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00000000000000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00000000000000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00000000000000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00000000000000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00000000000000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00000000000000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12238054250656205"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00000000000000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00000000000000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(17), true), expected)
  }
}

///|
test "string numeric original digits '.101f'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.33999999999999985789145284797996282577514648437500000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.99899999999999522515281569212675094604492187500000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.99999999999999822364316059974953532218933105468750000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.00010000000000000000479217360238592959831294137984514236450195312500000000000000000000000000000000000",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "0.00001000000000000000081803053914031309545862313825637102127075195312500000000000000000000000000000000",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000131649386238937589278",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.12238054250656205113045871257781982421875000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(101), false), expected)
  }
}

///|
test "string numeric original digits '#.101f'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.33999999999999985789145284797996282577514648437500000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.99899999999999522515281569212675094604492187500000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.99999999999999822364316059974953532218933105468750000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.00010000000000000000479217360238592959831294137984514236450195312500000000000000000000000000000000000",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "0.00001000000000000000081803053914031309545862313825637102127075195312500000000000000000000000000000000",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000131649386238937589278",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.12238054250656205113045871257781982421875000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'f', Some(101), true), expected)
  }
}

///|
test "string numeric original digits 'F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999000"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.000000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.000010"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.122381"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', None, false), expected)
  }
}

///|
test "string numeric original digits '#F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999000"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.000000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.000010"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.122381"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', None, true), expected)
  }
}

///|
test "string numeric original digits '.0F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2"),
    (0x400c000000000000UL.reinterpret_as_double(), "4"),
    (0x4005666666666666UL.reinterpret_as_double(), "3"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0"),
    (0x0010000000000000UL.reinterpret_as_double(), "0"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(0), false), expected)
  }
}

///|
test "string numeric original digits '#.0F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0."),
    (0x8000000000000000UL.reinterpret_as_double(), "-0."),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1."),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1."),
    (0x4004000000000000UL.reinterpret_as_double(), "2."),
    (0x400c000000000000UL.reinterpret_as_double(), "4."),
    (0x4005666666666666UL.reinterpret_as_double(), "3."),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1."),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12."),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100."),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10."),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0."),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0."),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000."),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000."),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0."),
    (0x0010000000000000UL.reinterpret_as_double(), "0."),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0."),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0."),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297."),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0."),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(0), true), expected)
  }
}

///|
test "string numeric original digits '.1F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100.0"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.0"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.0"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.0",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.0"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.0"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.0"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.0"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.0",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.0",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.0"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.0",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(1), false), expected)
  }
}

///|
test "string numeric original digits '#.1F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100.0"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.0"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.0"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.0",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.0"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.0"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.0"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.0"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.0",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.0",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.0"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.0",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(1), true), expected)
  }
}

///|
test "string numeric original digits '.2F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100.00"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.00"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.00"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.00"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(2), false), expected)
  }
}

///|
test "string numeric original digits '#.2F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "100.00"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.00"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.00"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.00"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(2), true), expected)
  }
}

///|
test "string numeric original digits '.6F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999000"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.000000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.000010"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.122381"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(6), false), expected)
  }
}

///|
test "string numeric original digits '#.6F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.500000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.500000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675000"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005000"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999000"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.000000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.000010"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000.000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.122381"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(6), true), expected)
  }
}

///|
test "string numeric original digits '.17F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000000000000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000000000000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000000000000000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000000000000000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67499999999999982"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00499999999999989"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.33999999999999986"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.99899999999999523"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.99999999999999822"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010000000000000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00001000000000000"),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.00000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.00000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00000000000000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00000000000000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00000000000000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00000000000000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00000000000000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00000000000000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00000000000000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00000000000000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12238054250656205"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00000000000000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00000000000000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(17), false), expected)
  }
}

///|
test "string numeric original digits '#.17F'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000000000000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000000000000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000000000000000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000000000000000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67499999999999982"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00499999999999989"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.33999999999999986"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.99899999999999523"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.99999999999999822"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010000000000000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00001000000000000"),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.00000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.00000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00000000000000000",
    ),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00000000000000000"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00000000000000000"),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00000000000000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00000000000000000"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00000000000000000"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00000000000000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00000000000000000",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12238054250656205"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00000000000000000",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00000000000000000"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(17), true), expected)
  }
}

///|
test "string numeric original digits '.101F'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.33999999999999985789145284797996282577514648437500000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.99899999999999522515281569212675094604492187500000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.99999999999999822364316059974953532218933105468750000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.00010000000000000000479217360238592959831294137984514236450195312500000000000000000000000000000000000",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "0.00001000000000000000081803053914031309545862313825637102127075195312500000000000000000000000000000000",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000131649386238937589278",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.12238054250656205113045871257781982421875000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(101), false), expected)
  }
}

///|
test "string numeric original digits '#.101F'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.33999999999999985789145284797996282577514648437500000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.99899999999999522515281569212675094604492187500000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.99999999999999822364316059974953532218933105468750000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.00010000000000000000479217360238592959831294137984514236450195312500000000000000000000000000000000000",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "0.00001000000000000000081803053914031309545862313825637102127075195312500000000000000000000000000000000",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000131649386238937589278",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2419525337748635811024438922039872413163570746511370683119607109795817169585127680747228319398117835877412473247929945182476288245677258352137467501774226730017098737365335775855524480521570968695035920384.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "27477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826006402298644940810898426515923831932622790375913726969251583748902971822619224898617411211542318561624064.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.12238054250656205113045871257781982421875000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'F', Some(101), true), expected)
  }
}

///|
test "string numeric original digits 'g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', None, false), expected)
  }
}

///|
test "string numeric original digits '#g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67500"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00500"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3400"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.9990"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', None, true), expected)
  }
}

///|
test "string numeric original digits '.0g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2"),
    (0x400c000000000000UL.reinterpret_as_double(), "4"),
    (0x4005666666666666UL.reinterpret_as_double(), "3"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(0), false), expected)
  }
}

///|
test "string numeric original digits '#.0g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0."),
    (0x8000000000000000UL.reinterpret_as_double(), "-0."),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1."),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1."),
    (0x4004000000000000UL.reinterpret_as_double(), "2."),
    (0x400c000000000000UL.reinterpret_as_double(), "4."),
    (0x4005666666666666UL.reinterpret_as_double(), "3."),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1."),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(0), true), expected)
  }
}

///|
test "string numeric original digits '.1g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2"),
    (0x400c000000000000UL.reinterpret_as_double(), "4"),
    (0x4005666666666666UL.reinterpret_as_double(), "3"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(1), false), expected)
  }
}

///|
test "string numeric original digits '#.1g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0."),
    (0x8000000000000000UL.reinterpret_as_double(), "-0."),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1."),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1."),
    (0x4004000000000000UL.reinterpret_as_double(), "2."),
    (0x400c000000000000UL.reinterpret_as_double(), "4."),
    (0x4005666666666666UL.reinterpret_as_double(), "3."),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1."),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(1), true), expected)
  }
}

///|
test "string numeric original digits '.2g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(2), false), expected)
  }
}

///|
test "string numeric original digits '#.2g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12."),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.0e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10."),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.0e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(2), true), expected)
  }
}

///|
test "string numeric original digits '.6g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(6), false), expected)
  }
}

///|
test "string numeric original digits '#.6g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67500"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00500"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3400"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.9990"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(6), true), expected)
  }
}

///|
test "string numeric original digits '.17g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.6749999999999998"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0049999999999999"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.998999999999995"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.9999999999999982"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0000000000000001e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9406564584124654e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3164938623893759e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7477589983467292e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5271145898187601e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.1985351978092871e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(17), false), expected)
  }
}

///|
test "string numeric original digits '#.17g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0000000000000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0000000000000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0000000000000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0000000000000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5000000000000000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5000000000000000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.6749999999999998"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0049999999999999"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000000000000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.998999999999995"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.9999999999999982"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010000000000000000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0000000000000001e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000."),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0000000000000000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9406564584124654e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3164938623893759e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7477589983467292e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5271145898187601e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.1985351978092871e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(17), true), expected)
  }
}

///|
test "string numeric original digits '.101g'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.339999999999999857891452847979962825775146484375",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.998999999999995225152815692126750946044921875",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.9999999999999982236431605997495353221893310546875",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.000100000000000000004792173602385929598312941379845142364501953125",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.0000000000000000818030539140313095458623138256371021270751953125e-05",
    ),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.000000000000000010979063629440455417404923096773118463368106829031575854049114915371633289784946889e+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599238e-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.2250738585072013830902327173324040642192159804623318305533274168872044348139181958542831590125110206e-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.7976931348623157081452742373170435679807056752584499659891747680315726078002853876058955863276687817e+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.9212809253432473569480083263091796953962008935665447128685553082455521739613549698938463855600893479e-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.3164938623893758927775792791600822795243767540726031029919357489699704824038842368349384230467957081e-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.4195253377486358110244389220398724131635707465113706831196071097958171695851276807472283193981178359e+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.7477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826e+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.12238054250656205113045871257781982421875",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.527114589818760057257516182233707348587318491004647588514186397897428538735410927804510927568843575e-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(101), false), expected)
  }
}

///|
test "string numeric original digits '#.101g'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.6749999999999998223643160599749535322189331054687500000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.0049999999999998934185896359849721193313598632812500000000000000000000000000000000000000000000000000",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.339999999999999857891452847979962825775146484375000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.998999999999995225152815692126750946044921875000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.9999999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.00010000000000000000479217360238592959831294137984514236450195312500000000000000000000000000000000000000",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.0000000000000000818030539140313095458623138256371021270751953125000000000000000000000000000000000000e-05",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.0000000000000000109790636294404554174049230967731184633681068290315758540491149153716332897849468890e+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599238e-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.2250738585072013830902327173324040642192159804623318305533274168872044348139181958542831590125110206e-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.7976931348623157081452742373170435679807056752584499659891747680315726078002853876058955863276687817e+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.9212809253432473569480083263091796953962008935665447128685553082455521739613549698938463855600893479e-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.3164938623893758927775792791600822795243767540726031029919357489699704824038842368349384230467957081e-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.4195253377486358110244389220398724131635707465113706831196071097958171695851276807472283193981178359e+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.7477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826e+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.1223805425065620511304587125778198242187500000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0000000000000000000000000000",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.5271145898187600572575161822337073485873184910046475885141863978974285387354109278045109275688435750e-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'g', Some(101), true), expected)
  }
}

///|
test "string numeric original digits 'G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', None, false), expected)
  }
}

///|
test "string numeric original digits '#G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67500"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00500"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3400"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.9990"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', None, true), expected)
  }
}

///|
test "string numeric original digits '.0G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2"),
    (0x400c000000000000UL.reinterpret_as_double(), "4"),
    (0x4005666666666666UL.reinterpret_as_double(), "3"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(0), false), expected)
  }
}

///|
test "string numeric original digits '#.0G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0."),
    (0x8000000000000000UL.reinterpret_as_double(), "-0."),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1."),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1."),
    (0x4004000000000000UL.reinterpret_as_double(), "2."),
    (0x400c000000000000UL.reinterpret_as_double(), "4."),
    (0x4005666666666666UL.reinterpret_as_double(), "3."),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1."),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(0), true), expected)
  }
}

///|
test "string numeric original digits '.1G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2"),
    (0x400c000000000000UL.reinterpret_as_double(), "4"),
    (0x4005666666666666UL.reinterpret_as_double(), "3"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(1), false), expected)
  }
}

///|
test "string numeric original digits '#.1G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0."),
    (0x8000000000000000UL.reinterpret_as_double(), "-0."),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1."),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1."),
    (0x4004000000000000UL.reinterpret_as_double(), "2."),
    (0x400c000000000000UL.reinterpret_as_double(), "4."),
    (0x4005666666666666UL.reinterpret_as_double(), "3."),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1."),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.E+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.E+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(1), true), expected)
  }
}

///|
test "string numeric original digits '.2G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(2), false), expected)
  }
}

///|
test "string numeric original digits '#.2G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12."),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.0E+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10."),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.0E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3E+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(2), true), expected)
  }
}

///|
test "string numeric original digits '.6G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(6), false), expected)
  }
}

///|
test "string numeric original digits '#.6G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67500"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00500"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3400"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.9990"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000E+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000E+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(6), true), expected)
  }
}

///|
test "string numeric original digits '.17G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.6749999999999998"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0049999999999999"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.998999999999995"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.9999999999999982"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0000000000000001E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9406564584124654E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3164938623893759E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7477589983467292E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5271145898187601E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.1985351978092871E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(17), false), expected)
  }
}

///|
test "string numeric original digits '#.17G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0000000000000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0000000000000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0000000000000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0000000000000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5000000000000000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5000000000000000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.6749999999999998"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0049999999999999"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000000000000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.998999999999995"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.9999999999999982"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010000000000000000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0000000000000001E-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000."),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0000000000000000E+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9406564584124654E-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014E-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157E+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474E-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3164938623893759E-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358E+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7477589983467292E+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863E+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5271145898187601E-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.1985351978092871E+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(17), true), expected)
  }
}

///|
test "string numeric original digits '.101G'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.339999999999999857891452847979962825775146484375",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.998999999999995225152815692126750946044921875",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.9999999999999982236431605997495353221893310546875",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.000100000000000000004792173602385929598312941379845142364501953125",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.0000000000000000818030539140313095458623138256371021270751953125E-05",
    ),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.000000000000000010979063629440455417404923096773118463368106829031575854049114915371633289784946889E+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599238E-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.2250738585072013830902327173324040642192159804623318305533274168872044348139181958542831590125110206E-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.7976931348623157081452742373170435679807056752584499659891747680315726078002853876058955863276687817E+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.9212809253432473569480083263091796953962008935665447128685553082455521739613549698938463855600893479E-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.3164938623893758927775792791600822795243767540726031029919357489699704824038842368349384230467957081E-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.4195253377486358110244389220398724131635707465113706831196071097958171695851276807472283193981178359E+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.7477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826E+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.12238054250656205113045871257781982421875",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.527114589818760057257516182233707348587318491004647588514186397897428538735410927804510927568843575E-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(101), false), expected)
  }
}

///|
test "string numeric original digits '#.101G'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.6749999999999998223643160599749535322189331054687500000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.0049999999999998934185896359849721193313598632812500000000000000000000000000000000000000000000000000",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.339999999999999857891452847979962825775146484375000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.998999999999995225152815692126750946044921875000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.9999999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.00010000000000000000479217360238592959831294137984514236450195312500000000000000000000000000000000000000",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.0000000000000000818030539140313095458623138256371021270751953125000000000000000000000000000000000000E-05",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.0000000000000000109790636294404554174049230967731184633681068290315758540491149153716332897849468890E+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599238E-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.2250738585072013830902327173324040642192159804623318305533274168872044348139181958542831590125110206E-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.7976931348623157081452742373170435679807056752584499659891747680315726078002853876058955863276687817E+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "INF"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-INF"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "NAN"),
    (0xfff8000000000000UL.reinterpret_as_double(), "NAN"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.9212809253432473569480083263091796953962008935665447128685553082455521739613549698938463855600893479E-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.3164938623893758927775792791600822795243767540726031029919357489699704824038842368349384230467957081E-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.4195253377486358110244389220398724131635707465113706831196071097958171695851276807472283193981178359E+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.7477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826E+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.1223805425065620511304587125778198242187500000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0000000000000000000000000000",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.5271145898187600572575161822337073485873184910046475885141863978974285387354109278045109275688435750E-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'G', Some(101), true), expected)
  }
}

///|
test "string numeric original digits 'n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', None, false), expected)
  }
}

///|
test "string numeric original digits '#n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67500"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00500"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3400"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.9990"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', None, true), expected)
  }
}

///|
test "string numeric original digits '.0n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2"),
    (0x400c000000000000UL.reinterpret_as_double(), "4"),
    (0x4005666666666666UL.reinterpret_as_double(), "3"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(0), false), expected)
  }
}

///|
test "string numeric original digits '#.0n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0."),
    (0x8000000000000000UL.reinterpret_as_double(), "-0."),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1."),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1."),
    (0x4004000000000000UL.reinterpret_as_double(), "2."),
    (0x400c000000000000UL.reinterpret_as_double(), "4."),
    (0x4005666666666666UL.reinterpret_as_double(), "3."),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1."),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(0), true), expected)
  }
}

///|
test "string numeric original digits '.1n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2"),
    (0x400c000000000000UL.reinterpret_as_double(), "4"),
    (0x4005666666666666UL.reinterpret_as_double(), "3"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(1), false), expected)
  }
}

///|
test "string numeric original digits '#.1n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0."),
    (0x8000000000000000UL.reinterpret_as_double(), "-0."),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1."),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1."),
    (0x4004000000000000UL.reinterpret_as_double(), "2."),
    (0x400c000000000000UL.reinterpret_as_double(), "4."),
    (0x4005666666666666UL.reinterpret_as_double(), "3."),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1."),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1.e+01"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1.e+01"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "5.e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "2.e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "5.e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "3.e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-2.e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(1), true), expected)
  }
}

///|
test "string numeric original digits '.2n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(2), false), expected)
  }
}

///|
test "string numeric original digits '#.2n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.7"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12."),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "1.0e+02"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10."),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.0e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.0e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.8e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2.3e+03"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.2e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(2), true), expected)
  }
}

///|
test "string numeric original digits '.6n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.675"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.005"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.999"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(6), false), expected)
  }
}

///|
test "string numeric original digits '#.6n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.00000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.00000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.50000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.50000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.67500"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.00500"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.3400"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.9990"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "10.0000"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.000100000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.00000e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1.00000e+15"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1.00000e+16"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.00000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.94066e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.22507e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.79769e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.92128e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.31649e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.41953e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.74776e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.12"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.33033e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.52711e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.19854e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(6), true), expected)
  }
}

///|
test "string numeric original digits '.17n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.6749999999999998"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0049999999999999"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.34"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.998999999999995"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.9999999999999982"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0001"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0000000000000001e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9406564584124654e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3164938623893759e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7477589983467292e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5271145898187601e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.1985351978092871e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(17), false), expected)
  }
}

///|
test "string numeric original digits '#.17n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0000000000000000"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0000000000000000"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1.0000000000000000"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1.0000000000000000"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5000000000000000"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5000000000000000"),
    (0x4005666666666666UL.reinterpret_as_double(), "2.6749999999999998"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "1.0049999999999999"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "12.340000000000000"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "99.998999999999995"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "9.9999999999999982"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.00010000000000000000"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "1.0000000000000001e-05"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000.0"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000."),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "1.0000000000000000e+308"),
    (0x0000000000000001UL.reinterpret_as_double(), "4.9406564584124654e-324"),
    (0x0010000000000000UL.reinterpret_as_double(), "2.2250738585072014e-308"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "1.7976931348623157e+308"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "4.9212809253432474e-247"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-1.3164938623893759e-81"),
    (0x6a5ede4ab342011dUL.reinterpret_as_double(), "2.4195253377486358e+204"),
    (0x6a95e8f31e4e594eUL.reinterpret_as_double(), "2.7477589983467292e+205"),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "2297.1223805425066"),
    (0x4ee81817cd934fddUL.reinterpret_as_double(), "1.3303316623561863e+72"),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-1.5271145898187601e-229"),
    (0xc5322f9451a1d06fUL.reinterpret_as_double(), "-2.1985351978092871e+25"),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(17), true), expected)
  }
}

///|
test "string numeric original digits '.101n'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "1"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-1"),
    (0x4004000000000000UL.reinterpret_as_double(), "2.5"),
    (0x400c000000000000UL.reinterpret_as_double(), "3.5"),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.67499999999999982236431605997495353221893310546875",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.00499999999999989341858963598497211933135986328125",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.339999999999999857891452847979962825775146484375",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.998999999999995225152815692126750946044921875",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.9999999999999982236431605997495353221893310546875",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.000100000000000000004792173602385929598312941379845142364501953125",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.0000000000000000818030539140313095458623138256371021270751953125e-05",
    ),
    (0x430c6bf526340000UL.reinterpret_as_double(), "1000000000000000"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "10000000000000000"),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.000000000000000010979063629440455417404923096773118463368106829031575854049114915371633289784946889e+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599238e-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.2250738585072013830902327173324040642192159804623318305533274168872044348139181958542831590125110206e-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.7976931348623157081452742373170435679807056752584499659891747680315726078002853876058955863276687817e+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.9212809253432473569480083263091796953962008935665447128685553082455521739613549698938463855600893479e-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.3164938623893758927775792791600822795243767540726031029919357489699704824038842368349384230467957081e-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.4195253377486358110244389220398724131635707465113706831196071097958171695851276807472283193981178359e+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.7477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826e+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.12238054250656205113045871257781982421875",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.527114589818760057257516182233707348587318491004647588514186397897428538735410927804510927568843575e-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(101), false), expected)
  }
}

///|
test "string numeric original digits '#.101n'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "1.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-1.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "2.5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "3.5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "2.6749999999999998223643160599749535322189331054687500000000000000000000000000000000000000000000000000",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "1.0049999999999998934185896359849721193313598632812500000000000000000000000000000000000000000000000000",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "12.339999999999999857891452847979962825775146484375000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "99.998999999999995225152815692126750946044921875000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "9.9999999999999982236431605997495353221893310546875000000000000000000000000000000000000000000000000000",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.00010000000000000000479217360238592959831294137984514236450195312500000000000000000000000000000000000000",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "1.0000000000000000818030539140313095458623138256371021270751953125000000000000000000000000000000000000e-05",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "1000000000000000.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "10000000000000000.000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      "1.0000000000000000109790636294404554174049230967731184633681068290315758540491149153716332897849468890e+308",
    ),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599238e-324",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "2.2250738585072013830902327173324040642192159804623318305533274168872044348139181958542831590125110206e-308",
    ),
    (
      0x7fefffffffffffffUL.reinterpret_as_double(),
      "1.7976931348623157081452742373170435679807056752584499659891747680315726078002853876058955863276687817e+308",
    ),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "4.9212809253432473569480083263091796953962008935665447128685553082455521739613549698938463855600893479e-247",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-1.3164938623893758927775792791600822795243767540726031029919357489699704824038842368349384230467957081e-81",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "2.4195253377486358110244389220398724131635707465113706831196071097958171695851276807472283193981178359e+204",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2.7477589983467292180899773325665182655437311663387145186600853223115895767309173367769922552905692826e+205",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "2297.1223805425065620511304587125778198242187500000000000000000000000000000000000000000000000000000000",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "1330331662356186305824075853452472180262583467692374235533545284151803904.0000000000000000000000000000",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-1.5271145898187600572575161822337073485873184910046475885141863978974285387354109278045109275688435750e-229",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-21985351978092870965919744.000000000000000000000000000000000000000000000000000000000000000000000000000",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, 'n', Some(101), true), expected)
  }
}

///|
test "string numeric original digits '%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.000000%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.000000%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.000000%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.000000%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.500000%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.500000%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.000000%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.900000%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.000000%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.010000%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.001000%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.000000%"),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1000000000000000000.000000%",
    ),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.000000%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.000000%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.238054%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.000000%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.000000%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', None, false), expected)
  }
}

///|
test "string numeric original digits '#%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.000000%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.000000%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.000000%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.000000%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.500000%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.500000%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.000000%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.900000%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.000000%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.010000%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.001000%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.000000%"),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1000000000000000000.000000%",
    ),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.000000%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.000000%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.238054%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.000000%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.000000%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', None, true), expected)
  }
}

///|
test "string numeric original digits '.0%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350%"),
    (0x4005666666666666UL.reinterpret_as_double(), "268%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "10000%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000%"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1000000000000000000%"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(0), false), expected)
  }
}

///|
test "string numeric original digits '#.0%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.%"),
    (0x4005666666666666UL.reinterpret_as_double(), "268.%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "10000.%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.%"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1000000000000000000.%"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(0), true), expected)
  }
}

///|
test "string numeric original digits '.1%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.0%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.0%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.0%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.0%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.5%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.5%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.0%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.9%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.0%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.0%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.0%"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1000000000000000000.0%"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.0%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.0%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.0%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.0%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.0%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.0%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.2%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.0%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.0%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.0%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(1), false), expected)
  }
}

///|
test "string numeric original digits '#.1%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.0%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.0%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.0%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.0%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.0%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.0%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.5%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.5%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.0%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.9%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.0%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.0%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.0%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.0%"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1000000000000000000.0%"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.0%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.0%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.0%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.0%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.0%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.0%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.2%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.0%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.0%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.0%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(1), true), expected)
  }
}

///|
test "string numeric original digits '.2%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.00%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.00%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.00%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.00%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.50%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.50%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.00%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.90%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.00%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.01%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.00%"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1000000000000000000.00%"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.00%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.00%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.24%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.00%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.00%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(2), false), expected)
  }
}

///|
test "string numeric original digits '#.2%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.00%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.00%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.00%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.00%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.50%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.50%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.00%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.90%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.00%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.01%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.00%"),
    (0x4341c37937e08000UL.reinterpret_as_double(), "1000000000000000000.00%"),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.00%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.00%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.24%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.00%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.00%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(2), true), expected)
  }
}

///|
test "string numeric original digits '.6%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.000000%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.000000%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.000000%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.000000%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.500000%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.500000%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.000000%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.900000%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.000000%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.010000%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.001000%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.000000%"),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1000000000000000000.000000%",
    ),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.000000%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.000000%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.238054%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.000000%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.000000%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(6), false), expected)
  }
}

///|
test "string numeric original digits '#.6%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.000000%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.000000%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.000000%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.000000%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.000000%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.000000%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.500000%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.500000%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.000000%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.900000%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "1000.000000%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.010000%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.001000%"),
    (0x430c6bf526340000UL.reinterpret_as_double(), "100000000000000000.000000%"),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1000000000000000000.000000%",
    ),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.000000%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.000000%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.000000%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.000000%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.000000%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.000000%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.238054%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.000000%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.000000%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.000000%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(6), true), expected)
  }
}

///|
test "string numeric original digits '.17%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.00000000000000000%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.00000000000000000%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.00000000000000000%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.00000000000000000%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.50000000000000000%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.49999999999998579%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.00000000000000000%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.89999999999963620%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "999.99999999999977263%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.01000000000000000%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00100000000000000%"),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "100000000000000000.00000000000000000%",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1000000000000000000.00000000000000000%",
    ),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00000000000000000%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00000000000000000%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00000000000000000%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00000000000000000%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.00000000000000000%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.00000000000000000%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.23805425065802410%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.00000000000000000%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00000000000000000%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.00000000000000000%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(17), false), expected)
  }
}

///|
test "string numeric original digits '#.17%'" {
  let cases : Array[(Double, String)] = [
    (0x0000000000000000UL.reinterpret_as_double(), "0.00000000000000000%"),
    (0x8000000000000000UL.reinterpret_as_double(), "-0.00000000000000000%"),
    (0x3ff0000000000000UL.reinterpret_as_double(), "100.00000000000000000%"),
    (0xbff0000000000000UL.reinterpret_as_double(), "-100.00000000000000000%"),
    (0x4004000000000000UL.reinterpret_as_double(), "250.00000000000000000%"),
    (0x400c000000000000UL.reinterpret_as_double(), "350.00000000000000000%"),
    (0x4005666666666666UL.reinterpret_as_double(), "267.50000000000000000%"),
    (0x3ff0147ae147ae14UL.reinterpret_as_double(), "100.49999999999998579%"),
    (0x4028ae147ae147aeUL.reinterpret_as_double(), "1234.00000000000000000%"),
    (0x4058ffef9db22d0eUL.reinterpret_as_double(), "9999.89999999999963620%"),
    (0x4023ffffffffffffUL.reinterpret_as_double(), "999.99999999999977263%"),
    (0x3f1a36e2eb1c432dUL.reinterpret_as_double(), "0.01000000000000000%"),
    (0x3ee4f8b588e368f1UL.reinterpret_as_double(), "0.00100000000000000%"),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "100000000000000000.00000000000000000%",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1000000000000000000.00000000000000000%",
    ),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (0x0000000000000001UL.reinterpret_as_double(), "0.00000000000000000%"),
    (0x0010000000000000UL.reinterpret_as_double(), "0.00000000000000000%"),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0x0ccb87012c1420c4UL.reinterpret_as_double(), "0.00000000000000000%"),
    (0xaf23fb05fa09f143UL.reinterpret_as_double(), "-0.00000000000000000%"),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.00000000000000000%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.00000000000000000%",
    ),
    (0x40a1f23ea8a99777UL.reinterpret_as_double(), "229712.23805425065802410%"),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.00000000000000000%",
    ),
    (0x906da2cb2f99a940UL.reinterpret_as_double(), "-0.00000000000000000%"),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.00000000000000000%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(17), true), expected)
  }
}

///|
test "string numeric original digits '.101%'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "100.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-100.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "250.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "350.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "267.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "100.49999999999998578914528479799628257751464843750000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "1234.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "9999.89999999999963620211929082870483398437500000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "999.99999999999977262632455676794052124023437500000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.01000000000000000020816681711721685132943093776702880859375000000000000000000000000000000000000000000%",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "0.00100000000000000002081668171172168513294309377670288085937500000000000000000000000000000000000000000%",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "100000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1000000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000013164938623893759395943%",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "229712.23805425065802410244941711425781250000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(101), false), expected)
  }
}

///|
test "string numeric original digits '#.101%'" {
  let cases : Array[(Double, String)] = [
    (
      0x0000000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x8000000000000000UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x3ff0000000000000UL.reinterpret_as_double(),
      "100.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0xbff0000000000000UL.reinterpret_as_double(),
      "-100.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4004000000000000UL.reinterpret_as_double(),
      "250.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x400c000000000000UL.reinterpret_as_double(),
      "350.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4005666666666666UL.reinterpret_as_double(),
      "267.50000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x3ff0147ae147ae14UL.reinterpret_as_double(),
      "100.49999999999998578914528479799628257751464843750000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4028ae147ae147aeUL.reinterpret_as_double(),
      "1234.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4058ffef9db22d0eUL.reinterpret_as_double(),
      "9999.89999999999963620211929082870483398437500000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4023ffffffffffffUL.reinterpret_as_double(),
      "999.99999999999977262632455676794052124023437500000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      "0.01000000000000000020816681711721685132943093776702880859375000000000000000000000000000000000000000000%",
    ),
    (
      0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      "0.00100000000000000002081668171172168513294309377670288085937500000000000000000000000000000000000000000%",
    ),
    (
      0x430c6bf526340000UL.reinterpret_as_double(),
      "100000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4341c37937e08000UL.reinterpret_as_double(),
      "1000000000000000000.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (0x7fe1ccf385ebc8a0UL.reinterpret_as_double(), "inf%"),
    (
      0x0000000000000001UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x0010000000000000UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (0x7fefffffffffffffUL.reinterpret_as_double(), "inf%"),
    (0x7ff0000000000000UL.reinterpret_as_double(), "inf%"),
    (0xfff0000000000000UL.reinterpret_as_double(), "-inf%"),
    (0x7ff8000000000000UL.reinterpret_as_double(), "nan%"),
    (0xfff8000000000000UL.reinterpret_as_double(), "nan%"),
    (
      0x0ccb87012c1420c4UL.reinterpret_as_double(),
      "0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0xaf23fb05fa09f143UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000013164938623893759395943%",
    ),
    (
      0x6a5ede4ab342011dUL.reinterpret_as_double(),
      "241952533774863593355092035232343541378097226678286622468580237281866686775680174542502822002177811801862566780624390408156175042716768905910951812464975890965399941349901758926358458297009257736597370044416.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      "2747758998346729253734044657739918411177884335872240494388433035190964034380858882865079499108361364678084068281458141860485695136089500377034543227118306286507291450626980607641198255180691076754310789332992.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x40a1f23ea8a99777UL.reinterpret_as_double(),
      "229712.23805425065802410244941711425781250000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x4ee81817cd934fddUL.reinterpret_as_double(),
      "133033166235618639213422471501933268300468803679778745694093264553227845632.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0x906da2cb2f99a940UL.reinterpret_as_double(),
      "-0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
    (
      0xc5322f9451a1d06fUL.reinterpret_as_double(),
      "-2198535197809286976332890112.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000%",
    ),
  ]
  for (value, expected) in cases {
    assert_eq(named_format_float_digits(value, '%', Some(101), true), expected)
  }
}

///|
test "string numeric original large precision .1074f 0000000000000001" {
  assert_eq(
    named_format_float_digits(
      0x0000000000000001UL.reinterpret_as_double(),
      'f',
      Some(1074),
      false,
    ),
    "0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004940656458412465441765687928682213723650598026143247644255856825006755072702087518652998363616359923797965646954457177309266567103559397963987747960107818781263007131903114045278458171678489821036887186360569987307230500063874091535649843873124733972731696151400317153853980741262385655911710266585566867681870395603106249319452715914924553293054565444011274801297099995419319894090804165633245247571478690147267801593552386115501348035264934720193790268107107491703332226844753335720832431936092382893458368060106011506169809753078342277318329247904982524730776375927247874656084778203734469699533647017972677717585125660551199131504891101451037862738167250955837389733598993664809941164205702637090279242767544565229087538682506419718265533447265625",
  )
}

///|
test "string numeric original large precision .1075e 0000000000000001" {
  assert_eq(
    named_format_float_digits(
      0x0000000000000001UL.reinterpret_as_double(),
      'e',
      Some(1075),
      false,
    ),
    "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599237979656469544571773092665671035593979639877479601078187812630071319031140452784581716784898210368871863605699873072305000638740915356498438731247339727316961514003171538539807412623856559117102665855668676818703956031062493194527159149245532930545654440112748012970999954193198940908041656332452475714786901472678015935523861155013480352649347201937902681071074917033322268447533357208324319360923828934583680601060115061698097530783422773183292479049825247307763759272478746560847782037344696995336470179726777175851256605511991315048911014510378627381672509558373897335989936648099411642057026370902792427675445652290875386825064197182655334472656250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e-324",
  )
}

///|
test "string numeric original large precision #.1100g 0000000000000001" {
  assert_eq(
    named_format_float_digits(
      0x0000000000000001UL.reinterpret_as_double(),
      'g',
      Some(1100),
      true,
    ),
    "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599237979656469544571773092665671035593979639877479601078187812630071319031140452784581716784898210368871863605699873072305000638740915356498438731247339727316961514003171538539807412623856559117102665855668676818703956031062493194527159149245532930545654440112748012970999954193198940908041656332452475714786901472678015935523861155013480352649347201937902681071074917033322268447533357208324319360923828934583680601060115061698097530783422773183292479049825247307763759272478746560847782037344696995336470179726777175851256605511991315048911014510378627381672509558373897335989936648099411642057026370902792427675445652290875386825064197182655334472656250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e-324",
  )
}

///|
test "string numeric original large precision .1200f 7fefffffffffffff" {
  assert_eq(
    named_format_float_digits(
      0x7fefffffffffffffUL.reinterpret_as_double(),
      'f',
      Some(1200),
      false,
    ),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  )
}

///|
test "string numeric original large precision .1200g 7fefffffffffffff" {
  assert_eq(
    named_format_float_digits(
      0x7fefffffffffffffUL.reinterpret_as_double(),
      'g',
      Some(1200),
      false,
    ),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
}

///|
test "string numeric original large precision .1200g 0000000000000001" {
  assert_eq(
    named_format_float_digits(
      0x0000000000000001UL.reinterpret_as_double(),
      'g',
      Some(1200),
      false,
    ),
    "4.940656458412465441765687928682213723650598026143247644255856825006755072702087518652998363616359923797965646954457177309266567103559397963987747960107818781263007131903114045278458171678489821036887186360569987307230500063874091535649843873124733972731696151400317153853980741262385655911710266585566867681870395603106249319452715914924553293054565444011274801297099995419319894090804165633245247571478690147267801593552386115501348035264934720193790268107107491703332226844753335720832431936092382893458368060106011506169809753078342277318329247904982524730776375927247874656084778203734469699533647017972677717585125660551199131504891101451037862738167250955837389733598993664809941164205702637090279242767544565229087538682506419718265533447265625e-324",
  )
}

///|
test "string numeric original scalar origin PythonFloat" {
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x0000000000000000UL.reinterpret_as_double(),
      ),
    ),
    "0.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x0000000000000000UL.reinterpret_as_double(),
      ),
    ),
    "0.0",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x8000000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-0.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x8000000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-0.0",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x3ff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "1.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x3ff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "1.0",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0xbff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-1.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0xbff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-1.0",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x4004000000000000UL.reinterpret_as_double(),
      ),
    ),
    "2.5",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x4004000000000000UL.reinterpret_as_double(),
      ),
    ),
    "2.5",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x400c000000000000UL.reinterpret_as_double(),
      ),
    ),
    "3.5",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x400c000000000000UL.reinterpret_as_double(),
      ),
    ),
    "3.5",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x4005666666666666UL.reinterpret_as_double(),
      ),
    ),
    "2.675",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x4005666666666666UL.reinterpret_as_double(),
      ),
    ),
    "2.675",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x3ff0147ae147ae14UL.reinterpret_as_double(),
      ),
    ),
    "1.005",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x3ff0147ae147ae14UL.reinterpret_as_double(),
      ),
    ),
    "1.005",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x4028ae147ae147aeUL.reinterpret_as_double(),
      ),
    ),
    "12.34",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x4028ae147ae147aeUL.reinterpret_as_double(),
      ),
    ),
    "12.34",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x4058ffef9db22d0eUL.reinterpret_as_double(),
      ),
    ),
    "99.999",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x4058ffef9db22d0eUL.reinterpret_as_double(),
      ),
    ),
    "99.999",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x4023ffffffffffffUL.reinterpret_as_double(),
      ),
    ),
    "9.999999999999998",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x4023ffffffffffffUL.reinterpret_as_double(),
      ),
    ),
    "9.999999999999998",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      ),
    ),
    "0.0001",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      ),
    ),
    "0.0001",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      ),
    ),
    "1e-05",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      ),
    ),
    "1e-05",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x430c6bf526340000UL.reinterpret_as_double(),
      ),
    ),
    "1000000000000000.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x430c6bf526340000UL.reinterpret_as_double(),
      ),
    ),
    "1000000000000000.0",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x4341c37937e08000UL.reinterpret_as_double(),
      ),
    ),
    "1e+16",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x4341c37937e08000UL.reinterpret_as_double(),
      ),
    ),
    "1e+16",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      ),
    ),
    "1e+308",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      ),
    ),
    "1e+308",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x0000000000000001UL.reinterpret_as_double(),
      ),
    ),
    "5e-324",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x0000000000000001UL.reinterpret_as_double(),
      ),
    ),
    "5e-324",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x0010000000000000UL.reinterpret_as_double(),
      ),
    ),
    "2.2250738585072014e-308",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x0010000000000000UL.reinterpret_as_double(),
      ),
    ),
    "2.2250738585072014e-308",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x7fefffffffffffffUL.reinterpret_as_double(),
      ),
    ),
    "1.7976931348623157e+308",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x7fefffffffffffffUL.reinterpret_as_double(),
      ),
    ),
    "1.7976931348623157e+308",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x7ff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "inf",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x7ff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "inf",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0xfff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-inf",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0xfff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-inf",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x7ff8000000000000UL.reinterpret_as_double(),
      ),
    ),
    "nan",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x7ff8000000000000UL.reinterpret_as_double(),
      ),
    ),
    "nan",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0xfff8000000000000UL.reinterpret_as_double(),
      ),
    ),
    "nan",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0xfff8000000000000UL.reinterpret_as_double(),
      ),
    ),
    "nan",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x0ccb87012c1420c4UL.reinterpret_as_double(),
      ),
    ),
    "4.9212809253432474e-247",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x0ccb87012c1420c4UL.reinterpret_as_double(),
      ),
    ),
    "4.9212809253432474e-247",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0xaf23fb05fa09f143UL.reinterpret_as_double(),
      ),
    ),
    "-1.316493862389376e-81",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0xaf23fb05fa09f143UL.reinterpret_as_double(),
      ),
    ),
    "-1.316493862389376e-81",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x6a5ede4ab342011dUL.reinterpret_as_double(),
      ),
    ),
    "2.4195253377486358e+204",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x6a5ede4ab342011dUL.reinterpret_as_double(),
      ),
    ),
    "2.4195253377486358e+204",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      ),
    ),
    "2.747758998346729e+205",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      ),
    ),
    "2.747758998346729e+205",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x40a1f23ea8a99777UL.reinterpret_as_double(),
      ),
    ),
    "2297.1223805425066",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x40a1f23ea8a99777UL.reinterpret_as_double(),
      ),
    ),
    "2297.1223805425066",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x4ee81817cd934fddUL.reinterpret_as_double(),
      ),
    ),
    "1.3303316623561863e+72",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x4ee81817cd934fddUL.reinterpret_as_double(),
      ),
    ),
    "1.3303316623561863e+72",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0x906da2cb2f99a940UL.reinterpret_as_double(),
      ),
    ),
    "-1.52711458981876e-229",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0x906da2cb2f99a940UL.reinterpret_as_double(),
      ),
    ),
    "-1.52711458981876e-229",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::PythonFloat(
        0xc5322f9451a1d06fUL.reinterpret_as_double(),
      ),
    ),
    "-2.198535197809287e+25",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::PythonFloat(
        0xc5322f9451a1d06fUL.reinterpret_as_double(),
      ),
    ),
    "-2.198535197809287e+25",
  )
}

///|
test "string numeric original scalar origin NumpyFloat64" {
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x0000000000000000UL.reinterpret_as_double(),
      ),
    ),
    "0.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x0000000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(0.0)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x8000000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-0.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x8000000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(-0.0)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x3ff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "1.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x3ff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(1.0)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0xbff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-1.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0xbff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(-1.0)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x4004000000000000UL.reinterpret_as_double(),
      ),
    ),
    "2.5",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x4004000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(2.5)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x400c000000000000UL.reinterpret_as_double(),
      ),
    ),
    "3.5",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x400c000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(3.5)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x4005666666666666UL.reinterpret_as_double(),
      ),
    ),
    "2.675",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x4005666666666666UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(2.675)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x3ff0147ae147ae14UL.reinterpret_as_double(),
      ),
    ),
    "1.005",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x3ff0147ae147ae14UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(1.005)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x4028ae147ae147aeUL.reinterpret_as_double(),
      ),
    ),
    "12.34",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x4028ae147ae147aeUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(12.34)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x4058ffef9db22d0eUL.reinterpret_as_double(),
      ),
    ),
    "99.999",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x4058ffef9db22d0eUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(99.999)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x4023ffffffffffffUL.reinterpret_as_double(),
      ),
    ),
    "9.999999999999998",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x4023ffffffffffffUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(9.999999999999998)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      ),
    ),
    "0.0001",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x3f1a36e2eb1c432dUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(0.0001)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      ),
    ),
    "1e-05",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x3ee4f8b588e368f1UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(1e-05)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x430c6bf526340000UL.reinterpret_as_double(),
      ),
    ),
    "1000000000000000.0",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x430c6bf526340000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(1000000000000000.0)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x4341c37937e08000UL.reinterpret_as_double(),
      ),
    ),
    "1e+16",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x4341c37937e08000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(1e+16)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      ),
    ),
    "1e+308",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x7fe1ccf385ebc8a0UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(1e+308)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x0000000000000001UL.reinterpret_as_double(),
      ),
    ),
    "5e-324",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x0000000000000001UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(5e-324)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x0010000000000000UL.reinterpret_as_double(),
      ),
    ),
    "2.2250738585072014e-308",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x0010000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(2.2250738585072014e-308)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x7fefffffffffffffUL.reinterpret_as_double(),
      ),
    ),
    "1.7976931348623157e+308",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x7fefffffffffffffUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(1.7976931348623157e+308)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x7ff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "inf",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x7ff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(inf)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0xfff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "-inf",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0xfff0000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(-inf)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x7ff8000000000000UL.reinterpret_as_double(),
      ),
    ),
    "nan",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x7ff8000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(nan)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0xfff8000000000000UL.reinterpret_as_double(),
      ),
    ),
    "nan",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0xfff8000000000000UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(nan)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x0ccb87012c1420c4UL.reinterpret_as_double(),
      ),
    ),
    "4.9212809253432474e-247",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x0ccb87012c1420c4UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(4.9212809253432474e-247)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0xaf23fb05fa09f143UL.reinterpret_as_double(),
      ),
    ),
    "-1.316493862389376e-81",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0xaf23fb05fa09f143UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(-1.316493862389376e-81)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x6a5ede4ab342011dUL.reinterpret_as_double(),
      ),
    ),
    "2.4195253377486358e+204",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x6a5ede4ab342011dUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(2.4195253377486358e+204)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      ),
    ),
    "2.747758998346729e+205",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x6a95e8f31e4e594eUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(2.747758998346729e+205)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x40a1f23ea8a99777UL.reinterpret_as_double(),
      ),
    ),
    "2297.1223805425066",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x40a1f23ea8a99777UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(2297.1223805425066)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x4ee81817cd934fddUL.reinterpret_as_double(),
      ),
    ),
    "1.3303316623561863e+72",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x4ee81817cd934fddUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(1.3303316623561863e+72)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0x906da2cb2f99a940UL.reinterpret_as_double(),
      ),
    ),
    "-1.52711458981876e-229",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0x906da2cb2f99a940UL.reinterpret_as_double(),
      ),
    ),
    "np.float64(-1.52711458981876e-229)",
  )
  assert_eq(
    named_format_value_str(
      NamedFormatValue::NumpyFloat64(
        0xc5322f9451a1d06fUL.reinterpret_as_double(),
      ),
    ),
    "-2.198535197809287e+25",
  )
  assert_eq(
    named_format_value_repr(
      NamedFormatValue::NumpyFloat64(
        0xc5322f9451a1d06fUL.reinterpret_as_double(),
      ),
    ),
    "np.float64(-2.198535197809287e+25)",
  )
}

///|
test "string numeric original scalar origin NumpyInt64" {
  assert_eq(
    named_format_value_str(NamedFormatValue::NumpyInt64(-9223372036854775808L)),
    "-9223372036854775808",
  )
  assert_eq(
    named_format_value_repr(NamedFormatValue::NumpyInt64(-9223372036854775808L)),
    "np.int64(-9223372036854775808)",
  )
  assert_eq(named_format_value_str(NamedFormatValue::NumpyInt64(-1L)), "-1")
  assert_eq(
    named_format_value_repr(NamedFormatValue::NumpyInt64(-1L)),
    "np.int64(-1)",
  )
  assert_eq(named_format_value_str(NamedFormatValue::NumpyInt64(0L)), "0")
  assert_eq(
    named_format_value_repr(NamedFormatValue::NumpyInt64(0L)),
    "np.int64(0)",
  )
  assert_eq(named_format_value_str(NamedFormatValue::NumpyInt64(1L)), "1")
  assert_eq(
    named_format_value_repr(NamedFormatValue::NumpyInt64(1L)),
    "np.int64(1)",
  )
  assert_eq(
    named_format_value_str(NamedFormatValue::NumpyInt64(9007199254740993L)),
    "9007199254740993",
  )
  assert_eq(
    named_format_value_repr(NamedFormatValue::NumpyInt64(9007199254740993L)),
    "np.int64(9007199254740993)",
  )
  assert_eq(
    named_format_value_str(NamedFormatValue::NumpyInt64(9223372036854775807L)),
    "9223372036854775807",
  )
  assert_eq(
    named_format_value_repr(NamedFormatValue::NumpyInt64(9223372036854775807L)),
    "np.int64(9223372036854775807)",
  )
}

///|
test "string numeric original Int64 mask 1" {
  let owner = [
    -9223372036854775808L, 9007199254740993L, 0L, 9223372036854775807L,
  ]
  let view = TickValues::from_int64_array(owner).view(0, 1, 4)
  let selected = view.select_mask([true, true, false, true])
  assert_true(selected.is_int64())
  assert_eq(selected.length(), 3)
  assert_eq(selected.get_int64(0), -9223372036854775808L)
  assert_eq(selected.get_int64(1), 9007199254740993L)
  assert_eq(selected.get_int64(2), 9223372036854775807L)
  owner[0] = 2L
  assert_eq(selected.get_int64(0), -9223372036854775808L)
  assert_eq(selected.get_int64(1), 9007199254740993L)
  assert_eq(selected.get_int64(2), 9223372036854775807L)
}

///|
test "string numeric original Int64 mask 2" {
  let owner = [
    -9223372036854775808L, 9007199254740993L, 0L, 9223372036854775807L,
  ]
  let view = TickValues::from_int64_array(owner).view(3, -1, 4)
  let selected = view.select_mask([true, false, true, true])
  assert_true(selected.is_int64())
  assert_eq(selected.length(), 3)
  assert_eq(selected.get_int64(0), 9223372036854775807L)
  assert_eq(selected.get_int64(1), 9007199254740993L)
  assert_eq(selected.get_int64(2), -9223372036854775808L)
  owner[0] = 2L
  assert_eq(selected.get_int64(0), 9223372036854775807L)
  assert_eq(selected.get_int64(1), 9007199254740993L)
  assert_eq(selected.get_int64(2), -9223372036854775808L)
}

///|
test "string numeric original Int64 mask 3" {
  let owner = [
    -9223372036854775808L, 9007199254740993L, 0L, 9223372036854775807L,
  ]
  let view = TickValues::from_int64_array(owner).view(1, 2, 2)
  let selected = view.select_mask([true, true])
  assert_true(selected.is_int64())
  assert_eq(selected.length(), 2)
  assert_eq(selected.get_int64(0), 9007199254740993L)
  assert_eq(selected.get_int64(1), 9223372036854775807L)
  owner[0] = 2L
  assert_eq(selected.get_int64(0), 9007199254740993L)
  assert_eq(selected.get_int64(1), 9223372036854775807L)
}

///|
test "string numeric original Int64 mask 4" {
  let owner = [
    -9223372036854775808L, 9007199254740993L, 0L, 9223372036854775807L,
  ]
  let view = TickValues::from_int64_array(owner).view(0, 1, 4)
  let selected = view.select_mask([false, false, false, false])
  assert_true(selected.is_int64())
  assert_eq(selected.length(), 0)
  owner[0] = 2L
}
