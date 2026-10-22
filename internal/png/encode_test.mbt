///|
test "PNG encoder writes an RGBA image with dimensions and data URI" {
  let encoded = @png.encode_rgba(2, 1, b"\xff\x00\x00\x80\x00\xff\x00\x00")
  assert_eq(encoded[0], b'\x89')
  assert_eq(encoded[1], b'P')
  assert_eq(encoded[2], b'N')
  assert_eq(encoded[3], b'G')
  assert_eq(encoded[24], b'\x08')
  assert_eq(encoded[25], b'\x06')
  assert_eq(encoded[16], b'\x00')
  assert_eq(encoded[17], b'\x00')
  assert_eq(encoded[18], b'\x00')
  assert_eq(encoded[19], b'\x02')
  let uri = @png.rgba_data_uri(2, 1, b"\xff\x00\x00\x80\x00\xff\x00\x00")
  assert_true(uri.has_prefix("data:image/png;base64,"))
  assert_true(uri.has_suffix("="))
  assert_eq(try! @base64.decode(uri[22:]), encoded)
  let single = @png.rgba_data_uri(1, 1, b"\xff\x00\x00\xff")
  assert_true(single.has_suffix("=="))
  assert_eq(
    try! @base64.decode(single[22:]),
    @png.encode_rgba(1, 1, b"\xff\x00\x00\xff"),
  )
}

///|
test "PNG encoder rejects invalid dimensions and pixel counts" {
  try @png.encode_rgba(0, 1, b"") catch {
    @png.EncodeError::InvalidDimensions => ()
    _ => fail("expected an invalid dimension error")
  } noraise {
    _ => fail("expected an invalid dimension error")
  }
  try @png.encode_rgba(1, 1, b"\x00") catch {
    @png.EncodeError::InvalidPixelCount => ()
    _ => fail("expected an invalid pixel count error")
  } noraise {
    _ => fail("expected an invalid pixel count error")
  }
}
