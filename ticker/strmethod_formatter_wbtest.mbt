///|
test "StrMethod resource boundary preserves earlier Python type errors" {
  let value = NamedFormatValue::PythonFloat(1.0)
  let unknown = try {
    ignore(format_method_checked("{x:2147483648q}", value, None))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    unknown, "ValueError: Unknown format code 'q' for object of type 'float'",
  )
  let none = try {
    ignore(format_method_checked("{pos:2147483648f}", value, None))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    none, "TypeError: unsupported format string passed to NoneType.__format__",
  )
  let resource = try {
    ignore(format_method_checked("{x:2147483648f}", value, None))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    resource, "ResourceError: formatted text exceeds String addressability",
  )
}

///|
test "StrMethod astral fill uses String addressability rather than a small width cap" {
  let result = try {
    ignore(
      format_method_checked("{x:🐍>1073741825.0f}", PythonFloat(1.0), None),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ResourceError: formatted text exceeds String addressability",
  )
}

///|
test "StrMethod excluded reflection does not silently become literal text" {
  let result = try {
    ignore(format_method_checked("{x.__format__}", PythonFloat(1.0), None))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "Unsupported: dynamic attribute '__format__' on float")
}

///|
test "StrMethod legacy convenience and checked named policies remain distinct" {
  let legacy = str_method_formatter("{x:05d}-{value}")
  assert_eq(legacy.format_value(3.0), "00003-3")
  let named = StrMethodFormatter::new("{x:05d}-{value}")
  let result = try {
    ignore(named.call(3.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'd' for object of type 'float'",
  )
}

///|
test "StrMethod reserves literal prefix and final positive sign before huge precision" {
  for format in ["x{x:.2147483645f}", "{x:+.2147483645f}"] {
    let result = try {
      ignore(format_method_checked(format, PythonFloat(1.0), None))
      "unexpected success"
    } catch {
      @core.DataError::InvalidTicks(message~) => message
      _ => "unexpected error"
    }
    assert_eq(
      result, "ResourceError: formatted text exceeds String addressability",
    )
  }
}

///|
test "StrMethod preflights grouping separators before precision and zero-fill allocation" {
  for
    (format, value, position) in [
      ("{x:+,.2147483641f}", 1234.0, None),
      ("xxx{pos:02147483644,d}", 1.0, Some(1)),
    ] {
    let result = try {
      ignore(format_method_checked(format, PythonFloat(value), position))
      "unexpected success"
    } catch {
      @core.DataError::InvalidTicks(message~) => message
      _ => "unexpected error"
    }
    assert_eq(
      result, "ResourceError: formatted text exceeds String addressability",
    )
  }
}
