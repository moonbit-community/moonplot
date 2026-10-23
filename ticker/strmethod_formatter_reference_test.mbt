// Generated from complete original StrMethodFormatter, string.Formatter and real builtin formatting.

///|
test "StrMethod original 0 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(-1234.5678, pos=3),
    "−1234.5678",
  )
}

///|
test "StrMethod original 1 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:<14.2f}").call(-1234.5678, pos=3),
    "−1234.57      ",
  )
}

///|
test "StrMethod original 2 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:>14.2f}").call(-1234.5678, pos=3),
    "      −1234.57",
  )
}

///|
test "StrMethod original 3 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^14.2f}").call(-1234.5678, pos=3),
    "   −1234.57   ",
  )
}

///|
test "StrMethod original 4 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:=14.2f}").call(-1234.5678, pos=3),
    "−      1234.57",
  )
}

///|
test "StrMethod original 5 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*<14.2f}").call(-1234.5678, pos=3),
    "−1234.57******",
  )
}

///|
test "StrMethod original 6 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*>14.2f}").call(-1234.5678, pos=3),
    "******−1234.57",
  )
}

///|
test "StrMethod original 7 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^14.2f}").call(-1234.5678, pos=3),
    "***−1234.57***",
  )
}

///|
test "StrMethod original 8 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*=14.2f}").call(-1234.5678, pos=3),
    "−******1234.57",
  )
}

///|
test "StrMethod original 9 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:−>14.2f}").call(-1234.5678, pos=3),
    "−−−−−−−1234.57",
  )
}

///|
test "StrMethod original 10 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^14.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍−1234.57🐍🐍🐍",
  )
}

///|
test "StrMethod original 11 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0>14.2f}").call(-1234.5678, pos=3),
    "000000−1234.57",
  )
}

///|
test "StrMethod original 12 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:014.2f}").call(-1234.5678, pos=3),
    "−0000001234.57",
  )
}

///|
test "StrMethod original 13 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:<014.2f}").call(-1234.5678, pos=3),
    "−1234.57000000",
  )
}

///|
test "StrMethod original 14 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:>014.2f}").call(-1234.5678, pos=3),
    "000000−1234.57",
  )
}

///|
test "StrMethod original 15 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^014.2f}").call(-1234.5678, pos=3),
    "000−1234.57000",
  )
}

///|
test "StrMethod original 16 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:=014.2f}").call(-1234.5678, pos=3),
    "−0000001234.57",
  )
}

///|
test "StrMethod original 17 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+.2f}").call(-1234.5678, pos=3),
    "−1234.57",
  )
}

///|
test "StrMethod original 18 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: .2f}").call(-1234.5678, pos=3),
    "−1234.57",
  )
}

///|
test "StrMethod original 19 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:-.2f}").call(-1234.5678, pos=3),
    "−1234.57",
  )
}

///|
test "StrMethod original 20 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.2f}").call(-1234.5678, pos=3),
    "−1234.57",
  )
}

///|
test "StrMethod original 21 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.2f}").call(-1234.5678, pos=3),
    "−1234.57",
  )
}

///|
test "StrMethod original 22 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(-1234.5678, pos=3),
    "−1235.",
  )
}

///|
test "StrMethod original 23 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(-1234.5678, pos=3),
    "−1.e+03",
  )
}

///|
test "StrMethod original 24 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.5g}").call(-1234.5678, pos=3),
    "−1234.6",
  )
}

///|
test "StrMethod original 25 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(-1234.5678, pos=3),
    "−1,234.57",
  )
}

///|
test "StrMethod original 26 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_.2f}").call(-1234.5678, pos=3),
    "−1_234.57",
  )
}

///|
test "StrMethod original 27 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0=+16,.2f}").call(-1234.5678, pos=3),
    "−0,000,001,234.57",
  )
}

///|
test "StrMethod original 28 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0=+16_.2f}").call(-1234.5678, pos=3),
    "−0_000_001_234.57",
  )
}

///|
test "StrMethod original 29 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,}").call(-1234.5678, pos=3),
    "−1,234.5678",
  )
}

///|
test "StrMethod original 30 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3e}").call(-1234.5678, pos=3),
    "−1.235e+03",
  )
}

///|
test "StrMethod original 31 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3E}").call(-1234.5678, pos=3),
    "−1.235E+03",
  )
}

///|
test "StrMethod original 32 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3f}").call(-1234.5678, pos=3),
    "−1234.568",
  )
}

///|
test "StrMethod original 33 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3F}").call(-1234.5678, pos=3),
    "−1234.568",
  )
}

///|
test "StrMethod original 34 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3g}").call(-1234.5678, pos=3),
    "−1.23e+03",
  )
}

///|
test "StrMethod original 35 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3G}").call(-1234.5678, pos=3),
    "−1.23E+03",
  )
}

///|
test "StrMethod original 36 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(-1234.5678, pos=3),
    "−1234.57",
  )
}

///|
test "StrMethod original 37 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.4n}").call(-1234.5678, pos=3),
    "−1235",
  )
}

///|
test "StrMethod original 38 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2%}").call(-1234.5678, pos=3),
    "−123456.78%",
  )
}

///|
test "StrMethod original 39 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:020.2%}").call(-1234.5678, pos=3),
    "−000000000123456.78%",
  )
}

///|
test "StrMethod original 40 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(-1234.5678, pos=3),
    "−123456.780000%",
  )
}

///|
test "StrMethod original 41 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 42 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:b}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'b' for object of type 'float'",
  )
}

///|
test "StrMethod original 43 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:c}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'float'",
  )
}

///|
test "StrMethod original 44 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:d}").call(-1234.5678, pos=3))
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
test "StrMethod original 45 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:o}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'o' for object of type 'float'",
  )
}

///|
test "StrMethod original 46 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:x}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'x' for object of type 'float'",
  )
}

///|
test "StrMethod original 47 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:X}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'X' for object of type 'float'",
  )
}

///|
test "StrMethod original 48 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:a}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'a' for object of type 'float'",
  )
}

///|
test "StrMethod original 49 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:q}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'q' for object of type 'float'",
  )
}

///|
test "StrMethod original 50 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:N}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'N' for object of type 'float'",
  )
}

///|
test "StrMethod original 51 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:D}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'D' for object of type 'float'",
  )
}

///|
test "StrMethod original 52 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:P}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'P' for object of type 'float'",
  )
}

///|
test "StrMethod original 53 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.f}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 54 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:..2f}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 55 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:+-f}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '+-f' for object of type 'float'",
  )
}

///|
test "StrMethod original 56 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,_.2f}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify both ',' and '_'.")
}

///|
test "StrMethod original 57 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,n}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'n'.")
}

///|
test "StrMethod original 58 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:_n}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify '_' with 'n'.")
}

///|
test "StrMethod original 59 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z}").call(-1234.5678, pos=3),
    "−1234.5678",
  )
}

///|
test "StrMethod original 60 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:zz.2f}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'zz.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 61 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:(f}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '(f' for object of type 'float'",
  )
}

///|
test "StrMethod original 62 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:10.2ff}").call(-1234.5678, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '10.2ff' for object of type 'float'",
  )
}

///|
test "StrMethod original 63 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:z.2d}").call(-1234.5678, pos=3))
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
test "StrMethod original 64 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:z.2q}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'q' for object of type 'float'",
  )
}

///|
test "StrMethod original 65 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:+.2c}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'float'",
  )
}

///|
test "StrMethod original 66 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:+#c}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'float'",
  )
}

///|
test "StrMethod original 67 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:+,.2s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 's'.")
}

///|
test "StrMethod original 68 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:=+,d}").call(-1234.5678, pos=3))
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
test "StrMethod original 69 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:+z#=4s}").call(-1234.5678, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '+z#=4s' for object of type 'float'",
  )
}

///|
test "StrMethod original 70 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,q}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'q'.")
}

///|
test "StrMethod original 71 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:_q}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify '_' with 'q'.")
}

///|
test "StrMethod original 72 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,d}").call(-1234.5678, pos=3))
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
test "StrMethod original 73 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:_d}").call(-1234.5678, pos=3))
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
test "StrMethod original 74 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,x}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'x'.")
}

///|
test "StrMethod original 75 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:_x}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'x' for object of type 'float'",
  )
}

///|
test "StrMethod original 76 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,.2c}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 77 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:z,.2d}").call(-1234.5678, pos=3))
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
test "StrMethod original 78 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:+z.2c}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'float'",
  )
}

///|
test "StrMethod original 79 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,.2s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 's'.")
}

///|
test "StrMethod original 80 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:+s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 81 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:+.2s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 82 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:=+s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 83 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:#+s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '#+s' for object of type 'float'",
  )
}

///|
test "StrMethod original 84 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:z=s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 85 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:10.٢f}").call(-1234.5678, pos=3),
    "  −1234.57",
  )
}

///|
test "StrMethod original 86 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:٣.٢f}").call(-1234.5678, pos=3),
    "−1234.57",
  )
}

///|
test "StrMethod original 87 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:１２.２f}").call(-1234.5678, pos=3),
    "    −1234.57",
  )
}

///|
test "StrMethod original 88 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:².2f}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '².2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 89 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:1_2.2f}").call(-1234.5678, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '1_2.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 90 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.2147483648f}").call(
        -1234.5678,
        pos=3,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: precision too big")
}

///|
test "StrMethod original 91 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:1000000000000000000000000000f}").call(
        -1234.5678,
        pos=3,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Too many decimal digits in format string")
}

///|
test "StrMethod original 92 float mini language" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.1000000000000000000000000000f}").call(
        -1234.5678,
        pos=3,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Too many decimal digits in format string")
}

///|
test "StrMethod original 93 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: <018.2f}").call(-1234.5678, pos=3),
    "−1234.57          ",
  )
}

///|
test "StrMethod original 94 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: <018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57         ",
  )
}

///|
test "StrMethod original 95 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: <018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57         ",
  )
}

///|
test "StrMethod original 96 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: <+018.2f}").call(-1234.5678, pos=3),
    "−1234.57          ",
  )
}

///|
test "StrMethod original 97 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: <+018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57         ",
  )
}

///|
test "StrMethod original 98 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: <+018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57         ",
  )
}

///|
test "StrMethod original 99 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: < 018.2f}").call(-1234.5678, pos=3),
    "−1234.57          ",
  )
}

///|
test "StrMethod original 100 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: < 018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57         ",
  )
}

///|
test "StrMethod original 101 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: < 018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57         ",
  )
}

///|
test "StrMethod original 102 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0<018.2f}").call(-1234.5678, pos=3),
    "−1234.570000000000",
  )
}

///|
test "StrMethod original 103 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0<018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57000000000",
  )
}

///|
test "StrMethod original 104 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0<018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57000000000",
  )
}

///|
test "StrMethod original 105 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0<+018.2f}").call(-1234.5678, pos=3),
    "−1234.570000000000",
  )
}

///|
test "StrMethod original 106 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0<+018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57000000000",
  )
}

///|
test "StrMethod original 107 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0<+018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57000000000",
  )
}

///|
test "StrMethod original 108 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0< 018.2f}").call(-1234.5678, pos=3),
    "−1234.570000000000",
  )
}

///|
test "StrMethod original 109 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0< 018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57000000000",
  )
}

///|
test "StrMethod original 110 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0< 018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57000000000",
  )
}

///|
test "StrMethod original 111 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*<018.2f}").call(-1234.5678, pos=3),
    "−1234.57**********",
  )
}

///|
test "StrMethod original 112 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*<018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57*********",
  )
}

///|
test "StrMethod original 113 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*<018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57*********",
  )
}

///|
test "StrMethod original 114 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*<+018.2f}").call(-1234.5678, pos=3),
    "−1234.57**********",
  )
}

///|
test "StrMethod original 115 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*<+018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57*********",
  )
}

///|
test "StrMethod original 116 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*<+018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57*********",
  )
}

///|
test "StrMethod original 117 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*< 018.2f}").call(-1234.5678, pos=3),
    "−1234.57**********",
  )
}

///|
test "StrMethod original 118 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*< 018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57*********",
  )
}

///|
test "StrMethod original 119 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*< 018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57*********",
  )
}

///|
test "StrMethod original 120 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍<018.2f}").call(-1234.5678, pos=3),
    "−1234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 121 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍<018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 122 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍<018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 123 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍<+018.2f}").call(-1234.5678, pos=3),
    "−1234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 124 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍<+018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 125 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍<+018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 126 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍< 018.2f}").call(-1234.5678, pos=3),
    "−1234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 127 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍< 018,.2f}").call(-1234.5678, pos=3),
    "−1,234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 128 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍< 018_.2f}").call(-1234.5678, pos=3),
    "−1_234.57🐍🐍🐍🐍🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 129 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: >018.2f}").call(-1234.5678, pos=3),
    "          −1234.57",
  )
}

///|
test "StrMethod original 130 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: >018,.2f}").call(-1234.5678, pos=3),
    "         −1,234.57",
  )
}

///|
test "StrMethod original 131 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: >018_.2f}").call(-1234.5678, pos=3),
    "         −1_234.57",
  )
}

///|
test "StrMethod original 132 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: >+018.2f}").call(-1234.5678, pos=3),
    "          −1234.57",
  )
}

///|
test "StrMethod original 133 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: >+018,.2f}").call(-1234.5678, pos=3),
    "         −1,234.57",
  )
}

///|
test "StrMethod original 134 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: >+018_.2f}").call(-1234.5678, pos=3),
    "         −1_234.57",
  )
}

///|
test "StrMethod original 135 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: > 018.2f}").call(-1234.5678, pos=3),
    "          −1234.57",
  )
}

///|
test "StrMethod original 136 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: > 018,.2f}").call(-1234.5678, pos=3),
    "         −1,234.57",
  )
}

///|
test "StrMethod original 137 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: > 018_.2f}").call(-1234.5678, pos=3),
    "         −1_234.57",
  )
}

///|
test "StrMethod original 138 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0>018.2f}").call(-1234.5678, pos=3),
    "0000000000−1234.57",
  )
}

///|
test "StrMethod original 139 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0>018,.2f}").call(-1234.5678, pos=3),
    "000000000−1,234.57",
  )
}

///|
test "StrMethod original 140 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0>018_.2f}").call(-1234.5678, pos=3),
    "000000000−1_234.57",
  )
}

///|
test "StrMethod original 141 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0>+018.2f}").call(-1234.5678, pos=3),
    "0000000000−1234.57",
  )
}

///|
test "StrMethod original 142 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0>+018,.2f}").call(-1234.5678, pos=3),
    "000000000−1,234.57",
  )
}

///|
test "StrMethod original 143 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0>+018_.2f}").call(-1234.5678, pos=3),
    "000000000−1_234.57",
  )
}

///|
test "StrMethod original 144 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0> 018.2f}").call(-1234.5678, pos=3),
    "0000000000−1234.57",
  )
}

///|
test "StrMethod original 145 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0> 018,.2f}").call(-1234.5678, pos=3),
    "000000000−1,234.57",
  )
}

///|
test "StrMethod original 146 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0> 018_.2f}").call(-1234.5678, pos=3),
    "000000000−1_234.57",
  )
}

///|
test "StrMethod original 147 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*>018.2f}").call(-1234.5678, pos=3),
    "**********−1234.57",
  )
}

///|
test "StrMethod original 148 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*>018,.2f}").call(-1234.5678, pos=3),
    "*********−1,234.57",
  )
}

///|
test "StrMethod original 149 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*>018_.2f}").call(-1234.5678, pos=3),
    "*********−1_234.57",
  )
}

///|
test "StrMethod original 150 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*>+018.2f}").call(-1234.5678, pos=3),
    "**********−1234.57",
  )
}

///|
test "StrMethod original 151 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*>+018,.2f}").call(-1234.5678, pos=3),
    "*********−1,234.57",
  )
}

///|
test "StrMethod original 152 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*>+018_.2f}").call(-1234.5678, pos=3),
    "*********−1_234.57",
  )
}

///|
test "StrMethod original 153 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*> 018.2f}").call(-1234.5678, pos=3),
    "**********−1234.57",
  )
}

///|
test "StrMethod original 154 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*> 018,.2f}").call(-1234.5678, pos=3),
    "*********−1,234.57",
  )
}

///|
test "StrMethod original 155 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*> 018_.2f}").call(-1234.5678, pos=3),
    "*********−1_234.57",
  )
}

///|
test "StrMethod original 156 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍>018.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍−1234.57",
  )
}

///|
test "StrMethod original 157 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍>018,.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍−1,234.57",
  )
}

///|
test "StrMethod original 158 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍>018_.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍−1_234.57",
  )
}

///|
test "StrMethod original 159 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍>+018.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍−1234.57",
  )
}

///|
test "StrMethod original 160 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍>+018,.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍−1,234.57",
  )
}

///|
test "StrMethod original 161 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍>+018_.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍−1_234.57",
  )
}

///|
test "StrMethod original 162 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍> 018.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍−1234.57",
  )
}

///|
test "StrMethod original 163 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍> 018,.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍−1,234.57",
  )
}

///|
test "StrMethod original 164 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍> 018_.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍🐍🐍🐍🐍−1_234.57",
  )
}

///|
test "StrMethod original 165 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^018.2f}").call(-1234.5678, pos=3),
    "     −1234.57     ",
  )
}

///|
test "StrMethod original 166 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^018,.2f}").call(-1234.5678, pos=3),
    "    −1,234.57     ",
  )
}

///|
test "StrMethod original 167 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^018_.2f}").call(-1234.5678, pos=3),
    "    −1_234.57     ",
  )
}

///|
test "StrMethod original 168 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^+018.2f}").call(-1234.5678, pos=3),
    "     −1234.57     ",
  )
}

///|
test "StrMethod original 169 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^+018,.2f}").call(-1234.5678, pos=3),
    "    −1,234.57     ",
  )
}

///|
test "StrMethod original 170 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^+018_.2f}").call(-1234.5678, pos=3),
    "    −1_234.57     ",
  )
}

///|
test "StrMethod original 171 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^ 018.2f}").call(-1234.5678, pos=3),
    "     −1234.57     ",
  )
}

///|
test "StrMethod original 172 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^ 018,.2f}").call(-1234.5678, pos=3),
    "    −1,234.57     ",
  )
}

///|
test "StrMethod original 173 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: ^ 018_.2f}").call(-1234.5678, pos=3),
    "    −1_234.57     ",
  )
}

///|
test "StrMethod original 174 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^018.2f}").call(-1234.5678, pos=3),
    "00000−1234.5700000",
  )
}

///|
test "StrMethod original 175 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^018,.2f}").call(-1234.5678, pos=3),
    "0000−1,234.5700000",
  )
}

///|
test "StrMethod original 176 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^018_.2f}").call(-1234.5678, pos=3),
    "0000−1_234.5700000",
  )
}

///|
test "StrMethod original 177 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^+018.2f}").call(-1234.5678, pos=3),
    "00000−1234.5700000",
  )
}

///|
test "StrMethod original 178 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^+018,.2f}").call(-1234.5678, pos=3),
    "0000−1,234.5700000",
  )
}

///|
test "StrMethod original 179 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^+018_.2f}").call(-1234.5678, pos=3),
    "0000−1_234.5700000",
  )
}

///|
test "StrMethod original 180 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^ 018.2f}").call(-1234.5678, pos=3),
    "00000−1234.5700000",
  )
}

///|
test "StrMethod original 181 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^ 018,.2f}").call(-1234.5678, pos=3),
    "0000−1,234.5700000",
  )
}

///|
test "StrMethod original 182 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0^ 018_.2f}").call(-1234.5678, pos=3),
    "0000−1_234.5700000",
  )
}

///|
test "StrMethod original 183 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^018.2f}").call(-1234.5678, pos=3),
    "*****−1234.57*****",
  )
}

///|
test "StrMethod original 184 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^018,.2f}").call(-1234.5678, pos=3),
    "****−1,234.57*****",
  )
}

///|
test "StrMethod original 185 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^018_.2f}").call(-1234.5678, pos=3),
    "****−1_234.57*****",
  )
}

///|
test "StrMethod original 186 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^+018.2f}").call(-1234.5678, pos=3),
    "*****−1234.57*****",
  )
}

///|
test "StrMethod original 187 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^+018,.2f}").call(-1234.5678, pos=3),
    "****−1,234.57*****",
  )
}

///|
test "StrMethod original 188 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^+018_.2f}").call(-1234.5678, pos=3),
    "****−1_234.57*****",
  )
}

///|
test "StrMethod original 189 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^ 018.2f}").call(-1234.5678, pos=3),
    "*****−1234.57*****",
  )
}

///|
test "StrMethod original 190 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^ 018,.2f}").call(-1234.5678, pos=3),
    "****−1,234.57*****",
  )
}

///|
test "StrMethod original 191 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*^ 018_.2f}").call(-1234.5678, pos=3),
    "****−1_234.57*****",
  )
}

///|
test "StrMethod original 192 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^018.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍−1234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 193 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^018,.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍−1,234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 194 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^018_.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍−1_234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 195 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^+018.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍−1234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 196 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^+018,.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍−1,234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 197 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^+018_.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍−1_234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 198 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^ 018.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍🐍−1234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 199 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^ 018,.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍−1,234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 200 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^ 018_.2f}").call(-1234.5678, pos=3),
    "🐍🐍🐍🐍−1_234.57🐍🐍🐍🐍🐍",
  )
}

///|
test "StrMethod original 201 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: =018.2f}").call(-1234.5678, pos=3),
    "−          1234.57",
  )
}

///|
test "StrMethod original 202 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: =018,.2f}").call(-1234.5678, pos=3),
    "−         1,234.57",
  )
}

///|
test "StrMethod original 203 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: =018_.2f}").call(-1234.5678, pos=3),
    "−         1_234.57",
  )
}

///|
test "StrMethod original 204 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: =+018.2f}").call(-1234.5678, pos=3),
    "−          1234.57",
  )
}

///|
test "StrMethod original 205 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: =+018,.2f}").call(-1234.5678, pos=3),
    "−         1,234.57",
  )
}

///|
test "StrMethod original 206 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: =+018_.2f}").call(-1234.5678, pos=3),
    "−         1_234.57",
  )
}

///|
test "StrMethod original 207 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: = 018.2f}").call(-1234.5678, pos=3),
    "−          1234.57",
  )
}

///|
test "StrMethod original 208 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: = 018,.2f}").call(-1234.5678, pos=3),
    "−         1,234.57",
  )
}

///|
test "StrMethod original 209 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x: = 018_.2f}").call(-1234.5678, pos=3),
    "−         1_234.57",
  )
}

///|
test "StrMethod original 210 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0=018.2f}").call(-1234.5678, pos=3),
    "−00000000001234.57",
  )
}

///|
test "StrMethod original 211 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0=018,.2f}").call(-1234.5678, pos=3),
    "−00,000,001,234.57",
  )
}

///|
test "StrMethod original 212 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0=018_.2f}").call(-1234.5678, pos=3),
    "−00_000_001_234.57",
  )
}

///|
test "StrMethod original 213 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0=+018.2f}").call(-1234.5678, pos=3),
    "−00000000001234.57",
  )
}

///|
test "StrMethod original 214 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0=+018,.2f}").call(-1234.5678, pos=3),
    "−00,000,001,234.57",
  )
}

///|
test "StrMethod original 215 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0=+018_.2f}").call(-1234.5678, pos=3),
    "−00_000_001_234.57",
  )
}

///|
test "StrMethod original 216 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0= 018.2f}").call(-1234.5678, pos=3),
    "−00000000001234.57",
  )
}

///|
test "StrMethod original 217 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0= 018,.2f}").call(-1234.5678, pos=3),
    "−00,000,001,234.57",
  )
}

///|
test "StrMethod original 218 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:0= 018_.2f}").call(-1234.5678, pos=3),
    "−00_000_001_234.57",
  )
}

///|
test "StrMethod original 219 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*=018.2f}").call(-1234.5678, pos=3),
    "−**********1234.57",
  )
}

///|
test "StrMethod original 220 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*=018,.2f}").call(-1234.5678, pos=3),
    "−*********1,234.57",
  )
}

///|
test "StrMethod original 221 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*=018_.2f}").call(-1234.5678, pos=3),
    "−*********1_234.57",
  )
}

///|
test "StrMethod original 222 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*=+018.2f}").call(-1234.5678, pos=3),
    "−**********1234.57",
  )
}

///|
test "StrMethod original 223 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*=+018,.2f}").call(-1234.5678, pos=3),
    "−*********1,234.57",
  )
}

///|
test "StrMethod original 224 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*=+018_.2f}").call(-1234.5678, pos=3),
    "−*********1_234.57",
  )
}

///|
test "StrMethod original 225 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*= 018.2f}").call(-1234.5678, pos=3),
    "−**********1234.57",
  )
}

///|
test "StrMethod original 226 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*= 018,.2f}").call(-1234.5678, pos=3),
    "−*********1,234.57",
  )
}

///|
test "StrMethod original 227 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:*= 018_.2f}").call(-1234.5678, pos=3),
    "−*********1_234.57",
  )
}

///|
test "StrMethod original 228 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍=018.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍1234.57",
  )
}

///|
test "StrMethod original 229 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍=018,.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍1,234.57",
  )
}

///|
test "StrMethod original 230 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍=018_.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍1_234.57",
  )
}

///|
test "StrMethod original 231 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍=+018.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍1234.57",
  )
}

///|
test "StrMethod original 232 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍=+018,.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍1,234.57",
  )
}

///|
test "StrMethod original 233 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍=+018_.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍1_234.57",
  )
}

///|
test "StrMethod original 234 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍= 018.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍🐍1234.57",
  )
}

///|
test "StrMethod original 235 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍= 018,.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍1,234.57",
  )
}

///|
test "StrMethod original 236 alignment sign zero grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍= 018_.2f}").call(-1234.5678, pos=3),
    "−🐍🐍🐍🐍🐍🐍🐍🐍🐍1_234.57",
  )
}

///|
test "StrMethod original 237 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:}").call(-0.0, pos=3), "−0.0")
}

///|
test "StrMethod original 238 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(-0.0, pos=3),
    "−0e+00",
  )
}

///|
test "StrMethod original 239 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(-0.0, pos=3),
    "−0e+00",
  )
}

///|
test "StrMethod original 240 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(-0.0, pos=3),
    "−0.0",
  )
}

///|
test "StrMethod original 241 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(-0.0, pos=3),
    "−0.0",
  )
}

///|
test "StrMethod original 242 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:g}").call(-0.0, pos=3), "−0")
}

///|
test "StrMethod original 243 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(-0.0, pos=3),
    "−0",
  )
}

///|
test "StrMethod original 244 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(-0.0, pos=3),
    "−0",
  )
}

///|
test "StrMethod original 245 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:n}").call(-0.0, pos=3), "−0")
}

///|
test "StrMethod original 246 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:G}").call(-0.0, pos=3), "−0")
}

///|
test "StrMethod original 247 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(-0.0, pos=3),
    "−0.000000e+00",
  )
}

///|
test "StrMethod original 248 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(-0.0, pos=3),
    "−0.000000E+00",
  )
}

///|
test "StrMethod original 249 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(-0.0, pos=3),
    "−0.000000",
  )
}

///|
test "StrMethod original 250 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(-0.0, pos=3),
    "−0.000000",
  )
}

///|
test "StrMethod original 251 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(-0.0, pos=3),
    "−0.000000%",
  )
}

///|
test "StrMethod original 252 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(-0.0, pos=3),
    "+0",
  )
}

///|
test "StrMethod original 253 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(-0.0, pos=3),
    "0.0",
  )
}

///|
test "StrMethod original 254 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(-0.0, pos=3),
    "−0.",
  )
}

///|
test "StrMethod original 255 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(-0.0, pos=3),
    "−0.e+00",
  )
}

///|
test "StrMethod original 256 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(-0.0, pos=3),
    "−0.",
  )
}

///|
test "StrMethod original 257 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(-0.0, pos=3),
    "−0.00",
  )
}

///|
test "StrMethod original 258 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 259 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 260 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 261 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 262 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 263 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 264 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 265 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 266 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(-1.0e-05, pos=3),
    "−1e−05",
  )
}

///|
test "StrMethod original 267 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(-1.0e-05, pos=3),
    "−1E−05",
  )
}

///|
test "StrMethod original 268 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(-1.0e-05, pos=3),
    "−1.000000e−05",
  )
}

///|
test "StrMethod original 269 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(-1.0e-05, pos=3),
    "−1.000000E−05",
  )
}

///|
test "StrMethod original 270 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(-1.0e-05, pos=3),
    "−0.000010",
  )
}

///|
test "StrMethod original 271 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(-1.0e-05, pos=3),
    "−0.000010",
  )
}

///|
test "StrMethod original 272 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(-1.0e-05, pos=3),
    "−0.001000%",
  )
}

///|
test "StrMethod original 273 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(-1.0e-05, pos=3),
    "+0",
  )
}

///|
test "StrMethod original 274 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(-1.0e-05, pos=3),
    "0.0",
  )
}

///|
test "StrMethod original 275 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(-1.0e-05, pos=3),
    "−0.",
  )
}

///|
test "StrMethod original 276 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(-1.0e-05, pos=3),
    "−1.e−05",
  )
}

///|
test "StrMethod original 277 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(-1.0e-05, pos=3),
    "−1.e−05",
  )
}

///|
test "StrMethod original 278 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(-1.0e-05, pos=3),
    "−0.00",
  )
}

///|
test "StrMethod original 279 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:}").call(0.0, pos=3), "0.0")
}

///|
test "StrMethod original 280 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0}").call(0.0, pos=3), "0e+00")
}

///|
test "StrMethod original 281 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1}").call(0.0, pos=3), "0e+00")
}

///|
test "StrMethod original 282 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.2}").call(0.0, pos=3), "0.0")
}

///|
test "StrMethod original 283 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.3}").call(0.0, pos=3), "0.0")
}

///|
test "StrMethod original 284 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:g}").call(0.0, pos=3), "0")
}

///|
test "StrMethod original 285 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0g}").call(0.0, pos=3), "0")
}

///|
test "StrMethod original 286 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1g}").call(0.0, pos=3), "0")
}

///|
test "StrMethod original 287 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:n}").call(0.0, pos=3), "0")
}

///|
test "StrMethod original 288 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:G}").call(0.0, pos=3), "0")
}

///|
test "StrMethod original 289 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(0.0, pos=3),
    "0.000000e+00",
  )
}

///|
test "StrMethod original 290 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(0.0, pos=3),
    "0.000000E+00",
  )
}

///|
test "StrMethod original 291 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(0.0, pos=3),
    "0.000000",
  )
}

///|
test "StrMethod original 292 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(0.0, pos=3),
    "0.000000",
  )
}

///|
test "StrMethod original 293 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(0.0, pos=3),
    "0.000000%",
  )
}

///|
test "StrMethod original 294 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:+z.0f}").call(0.0, pos=3), "+0")
}

///|
test "StrMethod original 295 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:z.1f}").call(0.0, pos=3), "0.0")
}

///|
test "StrMethod original 296 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:#.0f}").call(0.0, pos=3), "0.")
}

///|
test "StrMethod original 297 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(0.0, pos=3),
    "0.e+00",
  )
}

///|
test "StrMethod original 298 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:#.0g}").call(0.0, pos=3), "0.")
}

///|
test "StrMethod original 299 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(0.0, pos=3),
    "0.00",
  )
}

///|
test "StrMethod original 300 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:}").call(1.0, pos=3), "1.0")
}

///|
test "StrMethod original 301 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0}").call(1.0, pos=3), "1e+00")
}

///|
test "StrMethod original 302 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1}").call(1.0, pos=3), "1e+00")
}

///|
test "StrMethod original 303 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.2}").call(1.0, pos=3), "1.0")
}

///|
test "StrMethod original 304 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.3}").call(1.0, pos=3), "1.0")
}

///|
test "StrMethod original 305 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:g}").call(1.0, pos=3), "1")
}

///|
test "StrMethod original 306 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0g}").call(1.0, pos=3), "1")
}

///|
test "StrMethod original 307 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1g}").call(1.0, pos=3), "1")
}

///|
test "StrMethod original 308 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:n}").call(1.0, pos=3), "1")
}

///|
test "StrMethod original 309 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:G}").call(1.0, pos=3), "1")
}

///|
test "StrMethod original 310 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(1.0, pos=3),
    "1.000000e+00",
  )
}

///|
test "StrMethod original 311 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(1.0, pos=3),
    "1.000000E+00",
  )
}

///|
test "StrMethod original 312 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(1.0, pos=3),
    "1.000000",
  )
}

///|
test "StrMethod original 313 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(1.0, pos=3),
    "1.000000",
  )
}

///|
test "StrMethod original 314 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(1.0, pos=3),
    "100.000000%",
  )
}

///|
test "StrMethod original 315 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:+z.0f}").call(1.0, pos=3), "+1")
}

///|
test "StrMethod original 316 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:z.1f}").call(1.0, pos=3), "1.0")
}

///|
test "StrMethod original 317 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:#.0f}").call(1.0, pos=3), "1.")
}

///|
test "StrMethod original 318 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(1.0, pos=3),
    "1.e+00",
  )
}

///|
test "StrMethod original 319 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:#.0g}").call(1.0, pos=3), "1.")
}

///|
test "StrMethod original 320 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(1.0, pos=3),
    "1.00",
  )
}

///|
test "StrMethod original 321 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:}").call(2.675, pos=3), "2.675")
}

///|
test "StrMethod original 322 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(2.675, pos=3),
    "3e+00",
  )
}

///|
test "StrMethod original 323 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(2.675, pos=3),
    "3e+00",
  )
}

///|
test "StrMethod original 324 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.2}").call(2.675, pos=3), "2.7")
}

///|
test "StrMethod original 325 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(2.675, pos=3),
    "2.67",
  )
}

///|
test "StrMethod original 326 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(2.675, pos=3),
    "2.675",
  )
}

///|
test "StrMethod original 327 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0g}").call(2.675, pos=3), "3")
}

///|
test "StrMethod original 328 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1g}").call(2.675, pos=3), "3")
}

///|
test "StrMethod original 329 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(2.675, pos=3),
    "2.675",
  )
}

///|
test "StrMethod original 330 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(2.675, pos=3),
    "2.675",
  )
}

///|
test "StrMethod original 331 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(2.675, pos=3),
    "2.675000e+00",
  )
}

///|
test "StrMethod original 332 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(2.675, pos=3),
    "2.675000E+00",
  )
}

///|
test "StrMethod original 333 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(2.675, pos=3),
    "2.675000",
  )
}

///|
test "StrMethod original 334 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(2.675, pos=3),
    "2.675000",
  )
}

///|
test "StrMethod original 335 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(2.675, pos=3),
    "267.500000%",
  )
}

///|
test "StrMethod original 336 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(2.675, pos=3),
    "+3",
  )
}

///|
test "StrMethod original 337 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(2.675, pos=3),
    "2.7",
  )
}

///|
test "StrMethod original 338 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(2.675, pos=3),
    "3.",
  )
}

///|
test "StrMethod original 339 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(2.675, pos=3),
    "3.e+00",
  )
}

///|
test "StrMethod original 340 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(2.675, pos=3),
    "3.",
  )
}

///|
test "StrMethod original 341 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(2.675, pos=3),
    "2.67",
  )
}

///|
test "StrMethod original 342 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:}").call(1.005, pos=3), "1.005")
}

///|
test "StrMethod original 343 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(1.005, pos=3),
    "1e+00",
  )
}

///|
test "StrMethod original 344 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(1.005, pos=3),
    "1e+00",
  )
}

///|
test "StrMethod original 345 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.2}").call(1.005, pos=3), "1.0")
}

///|
test "StrMethod original 346 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.3}").call(1.005, pos=3), "1.0")
}

///|
test "StrMethod original 347 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(1.005, pos=3),
    "1.005",
  )
}

///|
test "StrMethod original 348 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0g}").call(1.005, pos=3), "1")
}

///|
test "StrMethod original 349 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1g}").call(1.005, pos=3), "1")
}

///|
test "StrMethod original 350 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(1.005, pos=3),
    "1.005",
  )
}

///|
test "StrMethod original 351 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(1.005, pos=3),
    "1.005",
  )
}

///|
test "StrMethod original 352 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(1.005, pos=3),
    "1.005000e+00",
  )
}

///|
test "StrMethod original 353 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(1.005, pos=3),
    "1.005000E+00",
  )
}

///|
test "StrMethod original 354 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(1.005, pos=3),
    "1.005000",
  )
}

///|
test "StrMethod original 355 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(1.005, pos=3),
    "1.005000",
  )
}

///|
test "StrMethod original 356 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(1.005, pos=3),
    "100.500000%",
  )
}

///|
test "StrMethod original 357 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(1.005, pos=3),
    "+1",
  )
}

///|
test "StrMethod original 358 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(1.005, pos=3),
    "1.0",
  )
}

///|
test "StrMethod original 359 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(1.005, pos=3),
    "1.",
  )
}

///|
test "StrMethod original 360 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(1.005, pos=3),
    "1.e+00",
  )
}

///|
test "StrMethod original 361 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(1.005, pos=3),
    "1.",
  )
}

///|
test "StrMethod original 362 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(1.005, pos=3),
    "1.00",
  )
}

///|
test "StrMethod original 363 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:}").call(2.5, pos=3), "2.5")
}

///|
test "StrMethod original 364 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0}").call(2.5, pos=3), "2e+00")
}

///|
test "StrMethod original 365 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1}").call(2.5, pos=3), "2e+00")
}

///|
test "StrMethod original 366 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.2}").call(2.5, pos=3), "2.5")
}

///|
test "StrMethod original 367 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.3}").call(2.5, pos=3), "2.5")
}

///|
test "StrMethod original 368 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:g}").call(2.5, pos=3), "2.5")
}

///|
test "StrMethod original 369 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0g}").call(2.5, pos=3), "2")
}

///|
test "StrMethod original 370 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1g}").call(2.5, pos=3), "2")
}

///|
test "StrMethod original 371 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:n}").call(2.5, pos=3), "2.5")
}

///|
test "StrMethod original 372 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:G}").call(2.5, pos=3), "2.5")
}

///|
test "StrMethod original 373 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(2.5, pos=3),
    "2.500000e+00",
  )
}

///|
test "StrMethod original 374 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(2.5, pos=3),
    "2.500000E+00",
  )
}

///|
test "StrMethod original 375 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(2.5, pos=3),
    "2.500000",
  )
}

///|
test "StrMethod original 376 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(2.5, pos=3),
    "2.500000",
  )
}

///|
test "StrMethod original 377 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(2.5, pos=3),
    "250.000000%",
  )
}

///|
test "StrMethod original 378 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:+z.0f}").call(2.5, pos=3), "+2")
}

///|
test "StrMethod original 379 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:z.1f}").call(2.5, pos=3), "2.5")
}

///|
test "StrMethod original 380 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:#.0f}").call(2.5, pos=3), "2.")
}

///|
test "StrMethod original 381 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(2.5, pos=3),
    "2.e+00",
  )
}

///|
test "StrMethod original 382 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:#.0g}").call(2.5, pos=3), "2.")
}

///|
test "StrMethod original 383 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(2.5, pos=3),
    "2.50",
  )
}

///|
test "StrMethod original 384 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:}").call(3.5, pos=3), "3.5")
}

///|
test "StrMethod original 385 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0}").call(3.5, pos=3), "4e+00")
}

///|
test "StrMethod original 386 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1}").call(3.5, pos=3), "4e+00")
}

///|
test "StrMethod original 387 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.2}").call(3.5, pos=3), "3.5")
}

///|
test "StrMethod original 388 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.3}").call(3.5, pos=3), "3.5")
}

///|
test "StrMethod original 389 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:g}").call(3.5, pos=3), "3.5")
}

///|
test "StrMethod original 390 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.0g}").call(3.5, pos=3), "4")
}

///|
test "StrMethod original 391 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:.1g}").call(3.5, pos=3), "4")
}

///|
test "StrMethod original 392 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:n}").call(3.5, pos=3), "3.5")
}

///|
test "StrMethod original 393 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:G}").call(3.5, pos=3), "3.5")
}

///|
test "StrMethod original 394 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(3.5, pos=3),
    "3.500000e+00",
  )
}

///|
test "StrMethod original 395 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(3.5, pos=3),
    "3.500000E+00",
  )
}

///|
test "StrMethod original 396 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(3.5, pos=3),
    "3.500000",
  )
}

///|
test "StrMethod original 397 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(3.5, pos=3),
    "3.500000",
  )
}

///|
test "StrMethod original 398 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(3.5, pos=3),
    "350.000000%",
  )
}

///|
test "StrMethod original 399 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:+z.0f}").call(3.5, pos=3), "+4")
}

///|
test "StrMethod original 400 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:z.1f}").call(3.5, pos=3), "3.5")
}

///|
test "StrMethod original 401 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:#.0f}").call(3.5, pos=3), "4.")
}

///|
test "StrMethod original 402 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(3.5, pos=3),
    "4.e+00",
  )
}

///|
test "StrMethod original 403 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x:#.0g}").call(3.5, pos=3), "4.")
}

///|
test "StrMethod original 404 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(3.5, pos=3),
    "3.50",
  )
}

///|
test "StrMethod original 405 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 406 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 407 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 408 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 409 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 410 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 411 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 412 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 413 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(1.0e-05, pos=3),
    "1e−05",
  )
}

///|
test "StrMethod original 414 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(1.0e-05, pos=3),
    "1E−05",
  )
}

///|
test "StrMethod original 415 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(1.0e-05, pos=3),
    "1.000000e−05",
  )
}

///|
test "StrMethod original 416 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(1.0e-05, pos=3),
    "1.000000E−05",
  )
}

///|
test "StrMethod original 417 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(1.0e-05, pos=3),
    "0.000010",
  )
}

///|
test "StrMethod original 418 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(1.0e-05, pos=3),
    "0.000010",
  )
}

///|
test "StrMethod original 419 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(1.0e-05, pos=3),
    "0.001000%",
  )
}

///|
test "StrMethod original 420 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(1.0e-05, pos=3),
    "+0",
  )
}

///|
test "StrMethod original 421 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(1.0e-05, pos=3),
    "0.0",
  )
}

///|
test "StrMethod original 422 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(1.0e-05, pos=3),
    "0.",
  )
}

///|
test "StrMethod original 423 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(1.0e-05, pos=3),
    "1.e−05",
  )
}

///|
test "StrMethod original 424 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(1.0e-05, pos=3),
    "1.e−05",
  )
}

///|
test "StrMethod original 425 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(1.0e-05, pos=3),
    "0.00",
  )
}

///|
test "StrMethod original 426 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 427 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 428 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 429 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 430 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 431 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 432 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 433 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 434 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 435 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 436 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(0.0001, pos=3),
    "1.000000e−04",
  )
}

///|
test "StrMethod original 437 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(0.0001, pos=3),
    "1.000000E−04",
  )
}

///|
test "StrMethod original 438 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(0.0001, pos=3),
    "0.000100",
  )
}

///|
test "StrMethod original 439 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(0.0001, pos=3),
    "0.000100",
  )
}

///|
test "StrMethod original 440 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(0.0001, pos=3),
    "0.010000%",
  )
}

///|
test "StrMethod original 441 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(0.0001, pos=3),
    "+0",
  )
}

///|
test "StrMethod original 442 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(0.0001, pos=3),
    "0.0",
  )
}

///|
test "StrMethod original 443 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(0.0001, pos=3),
    "0.",
  )
}

///|
test "StrMethod original 444 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(0.0001, pos=3),
    "1.e−04",
  )
}

///|
test "StrMethod original 445 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(0.0001, pos=3),
    "0.0001",
  )
}

///|
test "StrMethod original 446 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(0.0001, pos=3),
    "0.00",
  )
}

///|
test "StrMethod original 447 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(1000000000000000.0, pos=3),
    "1000000000000000.0",
  )
}

///|
test "StrMethod original 448 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(1000000000000000.0, pos=3),
    "1e+15",
  )
}

///|
test "StrMethod original 449 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(1000000000000000.0, pos=3),
    "1e+15",
  )
}

///|
test "StrMethod original 450 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(1000000000000000.0, pos=3),
    "1e+15",
  )
}

///|
test "StrMethod original 451 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(1000000000000000.0, pos=3),
    "1e+15",
  )
}

///|
test "StrMethod original 452 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(1000000000000000.0, pos=3),
    "1e+15",
  )
}

///|
test "StrMethod original 453 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(1000000000000000.0, pos=3),
    "1e+15",
  )
}

///|
test "StrMethod original 454 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(1000000000000000.0, pos=3),
    "1e+15",
  )
}

///|
test "StrMethod original 455 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(1000000000000000.0, pos=3),
    "1e+15",
  )
}

///|
test "StrMethod original 456 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(1000000000000000.0, pos=3),
    "1E+15",
  )
}

///|
test "StrMethod original 457 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(1000000000000000.0, pos=3),
    "1.000000e+15",
  )
}

///|
test "StrMethod original 458 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(1000000000000000.0, pos=3),
    "1.000000E+15",
  )
}

///|
test "StrMethod original 459 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(1000000000000000.0, pos=3),
    "1000000000000000.000000",
  )
}

///|
test "StrMethod original 460 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(1000000000000000.0, pos=3),
    "1000000000000000.000000",
  )
}

///|
test "StrMethod original 461 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(1000000000000000.0, pos=3),
    "100000000000000000.000000%",
  )
}

///|
test "StrMethod original 462 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(1000000000000000.0, pos=3),
    "+1000000000000000",
  )
}

///|
test "StrMethod original 463 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(1000000000000000.0, pos=3),
    "1000000000000000.0",
  )
}

///|
test "StrMethod original 464 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(1000000000000000.0, pos=3),
    "1000000000000000.",
  )
}

///|
test "StrMethod original 465 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(1000000000000000.0, pos=3),
    "1.e+15",
  )
}

///|
test "StrMethod original 466 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(1000000000000000.0, pos=3),
    "1.e+15",
  )
}

///|
test "StrMethod original 467 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(1000000000000000.0, pos=3),
    "1,000,000,000,000,000.00",
  )
}

///|
test "StrMethod original 468 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 469 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 470 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 471 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 472 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 473 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 474 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 475 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 476 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(1.0e+16, pos=3),
    "1e+16",
  )
}

///|
test "StrMethod original 477 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(1.0e+16, pos=3),
    "1E+16",
  )
}

///|
test "StrMethod original 478 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(1.0e+16, pos=3),
    "1.000000e+16",
  )
}

///|
test "StrMethod original 479 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(1.0e+16, pos=3),
    "1.000000E+16",
  )
}

///|
test "StrMethod original 480 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(1.0e+16, pos=3),
    "10000000000000000.000000",
  )
}

///|
test "StrMethod original 481 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(1.0e+16, pos=3),
    "10000000000000000.000000",
  )
}

///|
test "StrMethod original 482 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(1.0e+16, pos=3),
    "1000000000000000000.000000%",
  )
}

///|
test "StrMethod original 483 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(1.0e+16, pos=3),
    "+10000000000000000",
  )
}

///|
test "StrMethod original 484 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(1.0e+16, pos=3),
    "10000000000000000.0",
  )
}

///|
test "StrMethod original 485 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(1.0e+16, pos=3),
    "10000000000000000.",
  )
}

///|
test "StrMethod original 486 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(1.0e+16, pos=3),
    "1.e+16",
  )
}

///|
test "StrMethod original 487 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(1.0e+16, pos=3),
    "1.e+16",
  )
}

///|
test "StrMethod original 488 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(1.0e+16, pos=3),
    "10,000,000,000,000,000.00",
  )
}

///|
test "StrMethod original 489 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(1.2345678901234567, pos=3),
    "1.2345678901234567",
  )
}

///|
test "StrMethod original 490 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(1.2345678901234567, pos=3),
    "1e+00",
  )
}

///|
test "StrMethod original 491 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(1.2345678901234567, pos=3),
    "1e+00",
  )
}

///|
test "StrMethod original 492 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(1.2345678901234567, pos=3),
    "1.2",
  )
}

///|
test "StrMethod original 493 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(1.2345678901234567, pos=3),
    "1.23",
  )
}

///|
test "StrMethod original 494 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(1.2345678901234567, pos=3),
    "1.23457",
  )
}

///|
test "StrMethod original 495 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(1.2345678901234567, pos=3),
    "1",
  )
}

///|
test "StrMethod original 496 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(1.2345678901234567, pos=3),
    "1",
  )
}

///|
test "StrMethod original 497 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(1.2345678901234567, pos=3),
    "1.23457",
  )
}

///|
test "StrMethod original 498 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(1.2345678901234567, pos=3),
    "1.23457",
  )
}

///|
test "StrMethod original 499 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(1.2345678901234567, pos=3),
    "1.234568e+00",
  )
}

///|
test "StrMethod original 500 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(1.2345678901234567, pos=3),
    "1.234568E+00",
  )
}

///|
test "StrMethod original 501 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(1.2345678901234567, pos=3),
    "1.234568",
  )
}

///|
test "StrMethod original 502 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(1.2345678901234567, pos=3),
    "1.234568",
  )
}

///|
test "StrMethod original 503 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(1.2345678901234567, pos=3),
    "123.456789%",
  )
}

///|
test "StrMethod original 504 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(1.2345678901234567, pos=3),
    "+1",
  )
}

///|
test "StrMethod original 505 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(1.2345678901234567, pos=3),
    "1.2",
  )
}

///|
test "StrMethod original 506 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(1.2345678901234567, pos=3),
    "1.",
  )
}

///|
test "StrMethod original 507 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(1.2345678901234567, pos=3),
    "1.e+00",
  )
}

///|
test "StrMethod original 508 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(1.2345678901234567, pos=3),
    "1.",
  )
}

///|
test "StrMethod original 509 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(1.2345678901234567, pos=3),
    "1.23",
  )
}

///|
test "StrMethod original 510 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 511 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 512 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 513 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 514 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 515 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 516 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 517 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 518 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 519 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(1.0 / 0.0, pos=3),
    "INF",
  )
}

///|
test "StrMethod original 520 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 521 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(1.0 / 0.0, pos=3),
    "INF",
  )
}

///|
test "StrMethod original 522 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 523 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(1.0 / 0.0, pos=3),
    "INF",
  )
}

///|
test "StrMethod original 524 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(1.0 / 0.0, pos=3),
    "inf%",
  )
}

///|
test "StrMethod original 525 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(1.0 / 0.0, pos=3),
    "+inf",
  )
}

///|
test "StrMethod original 526 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 527 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 528 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 529 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 530 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(1.0 / 0.0, pos=3),
    "inf",
  )
}

///|
test "StrMethod original 531 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 532 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 533 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 534 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 535 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 536 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 537 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 538 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 539 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 540 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(-1.0 / 0.0, pos=3),
    "−INF",
  )
}

///|
test "StrMethod original 541 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 542 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(-1.0 / 0.0, pos=3),
    "−INF",
  )
}

///|
test "StrMethod original 543 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 544 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(-1.0 / 0.0, pos=3),
    "−INF",
  )
}

///|
test "StrMethod original 545 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(-1.0 / 0.0, pos=3),
    "−inf%",
  )
}

///|
test "StrMethod original 546 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 547 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 548 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 549 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 550 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 551 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(-1.0 / 0.0, pos=3),
    "−inf",
  )
}

///|
test "StrMethod original 552 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 553 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 554 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 555 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 556 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 557 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 558 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 559 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 560 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 561 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(0.0 / 0.0, pos=3),
    "NAN",
  )
}

///|
test "StrMethod original 562 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 563 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(0.0 / 0.0, pos=3),
    "NAN",
  )
}

///|
test "StrMethod original 564 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 565 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(0.0 / 0.0, pos=3),
    "NAN",
  )
}

///|
test "StrMethod original 566 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(0.0 / 0.0, pos=3),
    "nan%",
  )
}

///|
test "StrMethod original 567 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(0.0 / 0.0, pos=3),
    "+nan",
  )
}

///|
test "StrMethod original 568 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 569 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 570 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 571 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 572 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 573 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 574 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 575 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 576 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 577 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 578 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 579 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 580 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 581 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 582 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(0.0 / 0.0, pos=3),
    "NAN",
  )
}

///|
test "StrMethod original 583 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 584 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(0.0 / 0.0, pos=3),
    "NAN",
  )
}

///|
test "StrMethod original 585 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 586 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(0.0 / 0.0, pos=3),
    "NAN",
  )
}

///|
test "StrMethod original 587 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(0.0 / 0.0, pos=3),
    "nan%",
  )
}

///|
test "StrMethod original 588 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(0.0 / 0.0, pos=3),
    "+nan",
  )
}

///|
test "StrMethod original 589 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 590 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 591 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 592 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 593 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(0.0 / 0.0, pos=3),
    "nan",
  )
}

///|
test "StrMethod original 594 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 595 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 596 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 597 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 598 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 599 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 600 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 601 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 602 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(1.0e+308, pos=3),
    "1e+308",
  )
}

///|
test "StrMethod original 603 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(1.0e+308, pos=3),
    "1E+308",
  )
}

///|
test "StrMethod original 604 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(1.0e+308, pos=3),
    "1.000000e+308",
  )
}

///|
test "StrMethod original 605 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(1.0e+308, pos=3),
    "1.000000E+308",
  )
}

///|
test "StrMethod original 606 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(1.0e+308, pos=3),
    "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
  )
}

///|
test "StrMethod original 607 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(1.0e+308, pos=3),
    "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.000000",
  )
}

///|
test "StrMethod original 608 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(1.0e+308, pos=3),
    "inf%",
  )
}

///|
test "StrMethod original 609 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(1.0e+308, pos=3),
    "+100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336",
  )
}

///|
test "StrMethod original 610 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(1.0e+308, pos=3),
    "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.0",
  )
}

///|
test "StrMethod original 611 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(1.0e+308, pos=3),
    "100000000000000001097906362944045541740492309677311846336810682903157585404911491537163328978494688899061249669721172515611590283743140088328307009198146046031271664502933027185697489699588559043338384466165001178426897626212945177628091195786707458122783970171784415105291802893207873272974885715430223118336.",
  )
}

///|
test "StrMethod original 612 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(1.0e+308, pos=3),
    "1.e+308",
  )
}

///|
test "StrMethod original 613 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(1.0e+308, pos=3),
    "1.e+308",
  )
}

///|
test "StrMethod original 614 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(1.0e+308, pos=3),
    "100,000,000,000,000,001,097,906,362,944,045,541,740,492,309,677,311,846,336,810,682,903,157,585,404,911,491,537,163,328,978,494,688,899,061,249,669,721,172,515,611,590,283,743,140,088,328,307,009,198,146,046,031,271,664,502,933,027,185,697,489,699,588,559,043,338,384,466,165,001,178,426,897,626,212,945,177,628,091,195,786,707,458,122,783,970,171,784,415,105,291,802,893,207,873,272,974,885,715,430,223,118,336.00",
  )
}

///|
test "StrMethod original 615 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(1.7976931348623157e+308, pos=3),
    "1.7976931348623157e+308",
  )
}

///|
test "StrMethod original 616 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "2e+308",
  )
}

///|
test "StrMethod original 617 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "2e+308",
  )
}

///|
test "StrMethod original 618 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "1.8e+308",
  )
}

///|
test "StrMethod original 619 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "1.8e+308",
  )
}

///|
test "StrMethod original 620 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "1.79769e+308",
  )
}

///|
test "StrMethod original 621 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "2e+308",
  )
}

///|
test "StrMethod original 622 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "2e+308",
  )
}

///|
test "StrMethod original 623 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "1.79769e+308",
  )
}

///|
test "StrMethod original 624 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "1.79769E+308",
  )
}

///|
test "StrMethod original 625 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "1.797693e+308",
  )
}

///|
test "StrMethod original 626 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "1.797693E+308",
  )
}

///|
test "StrMethod original 627 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  )
}

///|
test "StrMethod original 628 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  )
}

///|
test "StrMethod original 629 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "inf%",
  )
}

///|
test "StrMethod original 630 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "+179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
}

///|
test "StrMethod original 631 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0",
  )
}

///|
test "StrMethod original 632 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.",
  )
}

///|
test "StrMethod original 633 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "2.e+308",
  )
}

///|
test "StrMethod original 634 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "2.e+308",
  )
}

///|
test "StrMethod original 635 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(
      1.7976931348623157e+308,
      pos=3,
    ),
    "179,769,313,486,231,570,814,527,423,731,704,356,798,070,567,525,844,996,598,917,476,803,157,260,780,028,538,760,589,558,632,766,878,171,540,458,953,514,382,464,234,321,326,889,464,182,768,467,546,703,537,516,986,049,910,576,551,282,076,245,490,090,389,328,944,075,868,508,455,133,942,304,583,236,903,222,948,165,808,559,332,123,348,274,797,826,204,144,723,168,738,177,180,919,299,881,250,404,026,184,124,858,368.00",
  )
}

///|
test "StrMethod original 636 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(5.0e-324, pos=3),
    "5e−324",
  )
}

///|
test "StrMethod original 637 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(5.0e-324, pos=3),
    "5e−324",
  )
}

///|
test "StrMethod original 638 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(5.0e-324, pos=3),
    "5e−324",
  )
}

///|
test "StrMethod original 639 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(5.0e-324, pos=3),
    "4.9e−324",
  )
}

///|
test "StrMethod original 640 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(5.0e-324, pos=3),
    "4.94e−324",
  )
}

///|
test "StrMethod original 641 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(5.0e-324, pos=3),
    "4.94066e−324",
  )
}

///|
test "StrMethod original 642 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(5.0e-324, pos=3),
    "5e−324",
  )
}

///|
test "StrMethod original 643 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(5.0e-324, pos=3),
    "5e−324",
  )
}

///|
test "StrMethod original 644 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(5.0e-324, pos=3),
    "4.94066e−324",
  )
}

///|
test "StrMethod original 645 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(5.0e-324, pos=3),
    "4.94066E−324",
  )
}

///|
test "StrMethod original 646 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(5.0e-324, pos=3),
    "4.940656e−324",
  )
}

///|
test "StrMethod original 647 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(5.0e-324, pos=3),
    "4.940656E−324",
  )
}

///|
test "StrMethod original 648 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(5.0e-324, pos=3),
    "0.000000",
  )
}

///|
test "StrMethod original 649 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(5.0e-324, pos=3),
    "0.000000",
  )
}

///|
test "StrMethod original 650 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(5.0e-324, pos=3),
    "0.000000%",
  )
}

///|
test "StrMethod original 651 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(5.0e-324, pos=3),
    "+0",
  )
}

///|
test "StrMethod original 652 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(5.0e-324, pos=3),
    "0.0",
  )
}

///|
test "StrMethod original 653 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(5.0e-324, pos=3),
    "0.",
  )
}

///|
test "StrMethod original 654 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(5.0e-324, pos=3),
    "5.e−324",
  )
}

///|
test "StrMethod original 655 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(5.0e-324, pos=3),
    "5.e−324",
  )
}

///|
test "StrMethod original 656 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(5.0e-324, pos=3),
    "0.00",
  )
}

///|
test "StrMethod original 657 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(2.2250738585072014e-308, pos=3),
    "2.2250738585072014e−308",
  )
}

///|
test "StrMethod original 658 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2e−308",
  )
}

///|
test "StrMethod original 659 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2e−308",
  )
}

///|
test "StrMethod original 660 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.2e−308",
  )
}

///|
test "StrMethod original 661 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.23e−308",
  )
}

///|
test "StrMethod original 662 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.22507e−308",
  )
}

///|
test "StrMethod original 663 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0g}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2e−308",
  )
}

///|
test "StrMethod original 664 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1g}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2e−308",
  )
}

///|
test "StrMethod original 665 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.22507e−308",
  )
}

///|
test "StrMethod original 666 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:G}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.22507E−308",
  )
}

///|
test "StrMethod original 667 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.225074e−308",
  )
}

///|
test "StrMethod original 668 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:E}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.225074E−308",
  )
}

///|
test "StrMethod original 669 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:f}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "0.000000",
  )
}

///|
test "StrMethod original 670 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:F}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "0.000000",
  )
}

///|
test "StrMethod original 671 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:%}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "0.000000%",
  )
}

///|
test "StrMethod original 672 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+z.0f}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "+0",
  )
}

///|
test "StrMethod original 673 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.1f}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "0.0",
  )
}

///|
test "StrMethod original 674 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0f}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "0.",
  )
}

///|
test "StrMethod original 675 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0e}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.e−308",
  )
}

///|
test "StrMethod original 676 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.0g}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "2.e−308",
  )
}

///|
test "StrMethod original 677 binary64 rounding zero extremes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,.2f}").call(
      2.2250738585072014e-308,
      pos=3,
    ),
    "0.00",
  )
}

///|
test "StrMethod original 678 valid beyond legacy width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.101f}").call(1.25, pos=3),
    "1.25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 679 valid beyond legacy width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.150g}").call(1.25, pos=3),
    "1.25",
  )
}

///|
test "StrMethod original 680 valid beyond legacy width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:1001.2f}").call(1.25, pos=3),
    "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     1.25",
  )
}

///|
test "StrMethod original 681 valid beyond legacy width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:-^1001.2f}").call(1.25, pos=3),
    "−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−1.25−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−",
  )
}

///|
test "StrMethod original 682 valid beyond legacy width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1100f}").call(1.25, pos=3),
    "1.25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 683 valid beyond legacy width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.1100e}").call(1.25, pos=3),
    "1.25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e+00",
  )
}

///|
test "StrMethod original 684 valid beyond legacy width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#.1100g}").call(1.25, pos=3),
    "1.2500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 685 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 686 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 687 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:c}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 688 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 689 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 690 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 691 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 692 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:,d}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 693 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:_d}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 694 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:08d}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 695 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:+08d}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 696 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:z}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 697 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:z.2f}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 698 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.2f}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 699 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 700 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 701 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:s}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 702 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:10}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 703 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:>10}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 704 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:0=10}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 705 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.2}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 706 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:+#c}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 707 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:#c}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 708 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:z.2d}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 709 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:,.2c}").call(-1234.5678))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 710 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678, pos=-2147483648),
    "−2147483648",
  )
}

///|
test "StrMethod original 711 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678, pos=-2147483648),
    "−10000000000000000000000000000000",
  )
}

///|
test "StrMethod original 712 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:c}").call(
        -1234.5678,
        pos=-2147483648,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 713 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678, pos=-2147483648),
    "−20000000000",
  )
}

///|
test "StrMethod original 714 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678, pos=-2147483648),
    "−80000000",
  )
}

///|
test "StrMethod original 715 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678, pos=-2147483648),
    "−80000000",
  )
}

///|
test "StrMethod original 716 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678, pos=-2147483648),
    "−2147483648",
  )
}

///|
test "StrMethod original 717 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:,d}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2,147,483,648",
  )
}

///|
test "StrMethod original 718 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:_d}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2_147_483_648",
  )
}

///|
test "StrMethod original 719 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:08d}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2147483648",
  )
}

///|
test "StrMethod original 720 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:+08d}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2147483648",
  )
}

///|
test "StrMethod original 721 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z}").call(
        -1234.5678,
        pos=-2147483648,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 722 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:z.2f}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2147483648.00",
  )
}

///|
test "StrMethod original 723 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:.2f}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2147483648.00",
  )
}

///|
test "StrMethod original 724 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678, pos=-2147483648),
    "−2.147484e+09",
  )
}

///|
test "StrMethod original 725 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678, pos=-2147483648),
    "−214748364800.000000%",
  )
}

///|
test "StrMethod original 726 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:s}").call(
        -1234.5678,
        pos=-2147483648,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'int'",
  )
}

///|
test "StrMethod original 727 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:10}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2147483648",
  )
}

///|
test "StrMethod original 728 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:>10}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2147483648",
  )
}

///|
test "StrMethod original 729 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:0=10}").call(
      -1234.5678,
      pos=-2147483648,
    ),
    "−2147483648",
  )
}

///|
test "StrMethod original 730 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:.2}").call(
        -1234.5678,
        pos=-2147483648,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 731 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:+#c}").call(
        -1234.5678,
        pos=-2147483648,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Sign not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 732 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:#c}").call(
        -1234.5678,
        pos=-2147483648,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 733 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z.2d}").call(
        -1234.5678,
        pos=-2147483648,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 734 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:,.2c}").call(
        -1234.5678,
        pos=-2147483648,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 735 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 736 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678, pos=-3),
    "−11",
  )
}

///|
test "StrMethod original 737 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:c}").call(-1234.5678, pos=-3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 738 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 739 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 740 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 741 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 742 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:,d}").call(-1234.5678, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 743 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:_d}").call(-1234.5678, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 744 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:08d}").call(-1234.5678, pos=-3),
    "−0000003",
  )
}

///|
test "StrMethod original 745 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:+08d}").call(-1234.5678, pos=-3),
    "−0000003",
  )
}

///|
test "StrMethod original 746 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:z}").call(-1234.5678, pos=-3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 747 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:z.2f}").call(-1234.5678, pos=-3),
    "−3.00",
  )
}

///|
test "StrMethod original 748 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:.2f}").call(-1234.5678, pos=-3),
    "−3.00",
  )
}

///|
test "StrMethod original 749 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678, pos=-3),
    "−3.000000e+00",
  )
}

///|
test "StrMethod original 750 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678, pos=-3),
    "−300.000000%",
  )
}

///|
test "StrMethod original 751 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:s}").call(-1234.5678, pos=-3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'int'",
  )
}

///|
test "StrMethod original 752 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:10}").call(-1234.5678, pos=-3),
    "        −3",
  )
}

///|
test "StrMethod original 753 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:>10}").call(-1234.5678, pos=-3),
    "        −3",
  )
}

///|
test "StrMethod original 754 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:0=10}").call(-1234.5678, pos=-3),
    "−000000003",
  )
}

///|
test "StrMethod original 755 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.2}").call(-1234.5678, pos=-3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 756 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:+#c}").call(-1234.5678, pos=-3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Sign not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 757 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:#c}").call(-1234.5678, pos=-3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 758 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z.2d}").call(-1234.5678, pos=-3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 759 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:,.2c}").call(-1234.5678, pos=-3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 760 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678, pos=0),
    "0",
  )
}

///|
test "StrMethod original 761 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678, pos=0),
    "0",
  )
}

///|
test "StrMethod original 762 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:c}").call(-1234.5678, pos=0),
    "\u0000",
  )
}

///|
test "StrMethod original 763 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678, pos=0),
    "0",
  )
}

///|
test "StrMethod original 764 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678, pos=0),
    "0",
  )
}

///|
test "StrMethod original 765 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678, pos=0),
    "0",
  )
}

///|
test "StrMethod original 766 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678, pos=0),
    "0",
  )
}

///|
test "StrMethod original 767 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:,d}").call(-1234.5678, pos=0),
    "0",
  )
}

///|
test "StrMethod original 768 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:_d}").call(-1234.5678, pos=0),
    "0",
  )
}

///|
test "StrMethod original 769 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:08d}").call(-1234.5678, pos=0),
    "00000000",
  )
}

///|
test "StrMethod original 770 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:+08d}").call(-1234.5678, pos=0),
    "+0000000",
  )
}

///|
test "StrMethod original 771 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:z}").call(-1234.5678, pos=0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 772 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:z.2f}").call(-1234.5678, pos=0),
    "0.00",
  )
}

///|
test "StrMethod original 773 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:.2f}").call(-1234.5678, pos=0),
    "0.00",
  )
}

///|
test "StrMethod original 774 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678, pos=0),
    "0.000000e+00",
  )
}

///|
test "StrMethod original 775 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678, pos=0),
    "0.000000%",
  )
}

///|
test "StrMethod original 776 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:s}").call(-1234.5678, pos=0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'int'",
  )
}

///|
test "StrMethod original 777 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:10}").call(-1234.5678, pos=0),
    "         0",
  )
}

///|
test "StrMethod original 778 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:>10}").call(-1234.5678, pos=0),
    "         0",
  )
}

///|
test "StrMethod original 779 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:0=10}").call(-1234.5678, pos=0),
    "0000000000",
  )
}

///|
test "StrMethod original 780 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.2}").call(-1234.5678, pos=0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 781 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:+#c}").call(-1234.5678, pos=0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Sign not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 782 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:#c}").call(-1234.5678, pos=0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 783 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z.2d}").call(-1234.5678, pos=0),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 784 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:,.2c}").call(-1234.5678, pos=0),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 785 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678, pos=3),
    "3",
  )
}

///|
test "StrMethod original 786 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678, pos=3),
    "11",
  )
}

///|
test "StrMethod original 787 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:c}").call(-1234.5678, pos=3),
    "\u0003",
  )
}

///|
test "StrMethod original 788 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678, pos=3),
    "3",
  )
}

///|
test "StrMethod original 789 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678, pos=3),
    "3",
  )
}

///|
test "StrMethod original 790 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678, pos=3),
    "3",
  )
}

///|
test "StrMethod original 791 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678, pos=3),
    "3",
  )
}

///|
test "StrMethod original 792 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:,d}").call(-1234.5678, pos=3),
    "3",
  )
}

///|
test "StrMethod original 793 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:_d}").call(-1234.5678, pos=3),
    "3",
  )
}

///|
test "StrMethod original 794 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:08d}").call(-1234.5678, pos=3),
    "00000003",
  )
}

///|
test "StrMethod original 795 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:+08d}").call(-1234.5678, pos=3),
    "+0000003",
  )
}

///|
test "StrMethod original 796 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:z}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 797 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:z.2f}").call(-1234.5678, pos=3),
    "3.00",
  )
}

///|
test "StrMethod original 798 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:.2f}").call(-1234.5678, pos=3),
    "3.00",
  )
}

///|
test "StrMethod original 799 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678, pos=3),
    "3.000000e+00",
  )
}

///|
test "StrMethod original 800 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678, pos=3),
    "300.000000%",
  )
}

///|
test "StrMethod original 801 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:s}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'int'",
  )
}

///|
test "StrMethod original 802 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:10}").call(-1234.5678, pos=3),
    "         3",
  )
}

///|
test "StrMethod original 803 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:>10}").call(-1234.5678, pos=3),
    "         3",
  )
}

///|
test "StrMethod original 804 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:0=10}").call(-1234.5678, pos=3),
    "0000000003",
  )
}

///|
test "StrMethod original 805 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.2}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 806 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:+#c}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Sign not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 807 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:#c}").call(-1234.5678, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 808 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z.2d}").call(-1234.5678, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 809 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:,.2c}").call(-1234.5678, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 810 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678, pos=45),
    "45",
  )
}

///|
test "StrMethod original 811 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678, pos=45),
    "101101",
  )
}

///|
test "StrMethod original 812 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:c}").call(-1234.5678, pos=45),
    "−",
  )
}

///|
test "StrMethod original 813 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678, pos=45),
    "55",
  )
}

///|
test "StrMethod original 814 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678, pos=45),
    "2d",
  )
}

///|
test "StrMethod original 815 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678, pos=45),
    "2D",
  )
}

///|
test "StrMethod original 816 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678, pos=45),
    "45",
  )
}

///|
test "StrMethod original 817 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:,d}").call(-1234.5678, pos=45),
    "45",
  )
}

///|
test "StrMethod original 818 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:_d}").call(-1234.5678, pos=45),
    "45",
  )
}

///|
test "StrMethod original 819 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:08d}").call(-1234.5678, pos=45),
    "00000045",
  )
}

///|
test "StrMethod original 820 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:+08d}").call(-1234.5678, pos=45),
    "+0000045",
  )
}

///|
test "StrMethod original 821 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:z}").call(-1234.5678, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 822 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:z.2f}").call(-1234.5678, pos=45),
    "45.00",
  )
}

///|
test "StrMethod original 823 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:.2f}").call(-1234.5678, pos=45),
    "45.00",
  )
}

///|
test "StrMethod original 824 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678, pos=45),
    "4.500000e+01",
  )
}

///|
test "StrMethod original 825 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678, pos=45),
    "4500.000000%",
  )
}

///|
test "StrMethod original 826 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:s}").call(-1234.5678, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'int'",
  )
}

///|
test "StrMethod original 827 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:10}").call(-1234.5678, pos=45),
    "        45",
  )
}

///|
test "StrMethod original 828 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:>10}").call(-1234.5678, pos=45),
    "        45",
  )
}

///|
test "StrMethod original 829 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:0=10}").call(-1234.5678, pos=45),
    "0000000045",
  )
}

///|
test "StrMethod original 830 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.2}").call(-1234.5678, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 831 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:+#c}").call(-1234.5678, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Sign not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 832 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:#c}").call(-1234.5678, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 833 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z.2d}").call(-1234.5678, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 834 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:,.2c}").call(-1234.5678, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 835 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678, pos=128512),
    "128512",
  )
}

///|
test "StrMethod original 836 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678, pos=128512),
    "11111011000000000",
  )
}

///|
test "StrMethod original 837 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:c}").call(-1234.5678, pos=128512),
    "😀",
  )
}

///|
test "StrMethod original 838 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678, pos=128512),
    "373000",
  )
}

///|
test "StrMethod original 839 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678, pos=128512),
    "1f600",
  )
}

///|
test "StrMethod original 840 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678, pos=128512),
    "1F600",
  )
}

///|
test "StrMethod original 841 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678, pos=128512),
    "128512",
  )
}

///|
test "StrMethod original 842 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:,d}").call(-1234.5678, pos=128512),
    "128,512",
  )
}

///|
test "StrMethod original 843 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:_d}").call(-1234.5678, pos=128512),
    "128_512",
  )
}

///|
test "StrMethod original 844 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:08d}").call(-1234.5678, pos=128512),
    "00128512",
  )
}

///|
test "StrMethod original 845 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:+08d}").call(-1234.5678, pos=128512),
    "+0128512",
  )
}

///|
test "StrMethod original 846 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z}").call(-1234.5678, pos=128512),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 847 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:z.2f}").call(-1234.5678, pos=128512),
    "128512.00",
  )
}

///|
test "StrMethod original 848 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:.2f}").call(-1234.5678, pos=128512),
    "128512.00",
  )
}

///|
test "StrMethod original 849 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678, pos=128512),
    "1.285120e+05",
  )
}

///|
test "StrMethod original 850 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678, pos=128512),
    "12851200.000000%",
  )
}

///|
test "StrMethod original 851 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:s}").call(-1234.5678, pos=128512),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'int'",
  )
}

///|
test "StrMethod original 852 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:10}").call(-1234.5678, pos=128512),
    "    128512",
  )
}

///|
test "StrMethod original 853 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:>10}").call(-1234.5678, pos=128512),
    "    128512",
  )
}

///|
test "StrMethod original 854 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:0=10}").call(-1234.5678, pos=128512),
    "0000128512",
  )
}

///|
test "StrMethod original 855 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:.2}").call(-1234.5678, pos=128512),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 856 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:+#c}").call(-1234.5678, pos=128512),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Sign not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 857 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:#c}").call(-1234.5678, pos=128512),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 858 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z.2d}").call(-1234.5678, pos=128512),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 859 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:,.2c}").call(-1234.5678, pos=128512),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 860 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678, pos=1114112),
    "1114112",
  )
}

///|
test "StrMethod original 861 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678, pos=1114112),
    "100010000000000000000",
  )
}

///|
test "StrMethod original 862 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:c}").call(-1234.5678, pos=1114112),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 863 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678, pos=1114112),
    "4200000",
  )
}

///|
test "StrMethod original 864 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678, pos=1114112),
    "110000",
  )
}

///|
test "StrMethod original 865 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678, pos=1114112),
    "110000",
  )
}

///|
test "StrMethod original 866 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678, pos=1114112),
    "1114112",
  )
}

///|
test "StrMethod original 867 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:,d}").call(-1234.5678, pos=1114112),
    "1,114,112",
  )
}

///|
test "StrMethod original 868 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:_d}").call(-1234.5678, pos=1114112),
    "1_114_112",
  )
}

///|
test "StrMethod original 869 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:08d}").call(-1234.5678, pos=1114112),
    "01114112",
  )
}

///|
test "StrMethod original 870 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:+08d}").call(-1234.5678, pos=1114112),
    "+1114112",
  )
}

///|
test "StrMethod original 871 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z}").call(-1234.5678, pos=1114112),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 872 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:z.2f}").call(-1234.5678, pos=1114112),
    "1114112.00",
  )
}

///|
test "StrMethod original 873 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:.2f}").call(-1234.5678, pos=1114112),
    "1114112.00",
  )
}

///|
test "StrMethod original 874 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678, pos=1114112),
    "1.114112e+06",
  )
}

///|
test "StrMethod original 875 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678, pos=1114112),
    "111411200.000000%",
  )
}

///|
test "StrMethod original 876 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:s}").call(-1234.5678, pos=1114112),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'int'",
  )
}

///|
test "StrMethod original 877 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:10}").call(-1234.5678, pos=1114112),
    "   1114112",
  )
}

///|
test "StrMethod original 878 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:>10}").call(-1234.5678, pos=1114112),
    "   1114112",
  )
}

///|
test "StrMethod original 879 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:0=10}").call(-1234.5678, pos=1114112),
    "0001114112",
  )
}

///|
test "StrMethod original 880 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:.2}").call(-1234.5678, pos=1114112),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 881 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:+#c}").call(-1234.5678, pos=1114112),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Sign not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 882 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:#c}").call(-1234.5678, pos=1114112),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 883 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z.2d}").call(
        -1234.5678,
        pos=1114112,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 884 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:,.2c}").call(
        -1234.5678,
        pos=1114112,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 885 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:d}").call(-1234.5678, pos=2147483647),
    "2147483647",
  )
}

///|
test "StrMethod original 886 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:b}").call(-1234.5678, pos=2147483647),
    "1111111111111111111111111111111",
  )
}

///|
test "StrMethod original 887 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:c}").call(
        -1234.5678,
        pos=2147483647,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 888 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:o}").call(-1234.5678, pos=2147483647),
    "17777777777",
  )
}

///|
test "StrMethod original 889 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:x}").call(-1234.5678, pos=2147483647),
    "7fffffff",
  )
}

///|
test "StrMethod original 890 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:X}").call(-1234.5678, pos=2147483647),
    "7FFFFFFF",
  )
}

///|
test "StrMethod original 891 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:n}").call(-1234.5678, pos=2147483647),
    "2147483647",
  )
}

///|
test "StrMethod original 892 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:,d}").call(-1234.5678, pos=2147483647),
    "2,147,483,647",
  )
}

///|
test "StrMethod original 893 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:_d}").call(-1234.5678, pos=2147483647),
    "2_147_483_647",
  )
}

///|
test "StrMethod original 894 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:08d}").call(
      -1234.5678,
      pos=2147483647,
    ),
    "2147483647",
  )
}

///|
test "StrMethod original 895 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:+08d}").call(
      -1234.5678,
      pos=2147483647,
    ),
    "+2147483647",
  )
}

///|
test "StrMethod original 896 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z}").call(
        -1234.5678,
        pos=2147483647,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 897 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:z.2f}").call(
      -1234.5678,
      pos=2147483647,
    ),
    "2147483647.00",
  )
}

///|
test "StrMethod original 898 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:.2f}").call(
      -1234.5678,
      pos=2147483647,
    ),
    "2147483647.00",
  )
}

///|
test "StrMethod original 899 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:e}").call(-1234.5678, pos=2147483647),
    "2.147484e+09",
  )
}

///|
test "StrMethod original 900 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:%}").call(-1234.5678, pos=2147483647),
    "214748364700.000000%",
  )
}

///|
test "StrMethod original 901 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:s}").call(
        -1234.5678,
        pos=2147483647,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'int'",
  )
}

///|
test "StrMethod original 902 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:10}").call(-1234.5678, pos=2147483647),
    "2147483647",
  )
}

///|
test "StrMethod original 903 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:>10}").call(
      -1234.5678,
      pos=2147483647,
    ),
    "2147483647",
  )
}

///|
test "StrMethod original 904 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:0=10}").call(
      -1234.5678,
      pos=2147483647,
    ),
    "2147483647",
  )
}

///|
test "StrMethod original 905 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:.2}").call(
        -1234.5678,
        pos=2147483647,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 906 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:+#c}").call(
        -1234.5678,
        pos=2147483647,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Sign not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 907 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:#c}").call(
        -1234.5678,
        pos=2147483647,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed with integer format specifier 'c'",
  )
}

///|
test "StrMethod original 908 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:z.2d}").call(
        -1234.5678,
        pos=2147483647,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 909 optional exact int position" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{pos:,.2c}").call(
        -1234.5678,
        pos=2147483647,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 'c'.")
}

///|
test "StrMethod original 910 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 911 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos:}").call(-12.5), "None")
}

///|
test "StrMethod original 912 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.3}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 913 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.3}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 914 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.3s}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 915 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.3s}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 916 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:010}").call(-12.5, pos=3),
    "−0000012.5",
  )
}

///|
test "StrMethod original 917 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:010}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 918 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:>010}").call(-12.5, pos=3),
    "00000−12.5",
  )
}

///|
test "StrMethod original 919 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:>010}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 920 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:=10}").call(-12.5, pos=3),
    "−     12.5",
  )
}

///|
test "StrMethod original 921 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:=10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 922 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+10}").call(-12.5, pos=3),
    "     −12.5",
  )
}

///|
test "StrMethod original 923 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:+10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 924 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 925 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:z}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 926 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 927 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:#}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 928 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 929 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:,}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 930 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:10.2s}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 931 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:10.2s}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 932 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^10}").call(-12.5, pos=3),
    "🐍🐍−12.5🐍🐍🐍",
  )
}

///|
test "StrMethod original 933 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:🐍^10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 934 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:s}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 935 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:s}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 936 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:e}").call(-12.5, pos=3),
    "−1.250000e+01",
  )
}

///|
test "StrMethod original 937 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:e}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 938 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:c}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'float'",
  )
}

///|
test "StrMethod original 939 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:c}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 940 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:-^12}").call(-12.5, pos=3),
    "−−−−12.5−−−−",
  )
}

///|
test "StrMethod original 941 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:-^12}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 942 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:->12}").call(-12.5, pos=3),
    "−−−−−−−−12.5",
  )
}

///|
test "StrMethod original 943 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:->12}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 944 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.101s}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 's' for object of type 'float'",
  )
}

///|
test "StrMethod original 945 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:.101s}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 946 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 947 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!s:}").call(-12.5), "None")
}

///|
test "StrMethod original 948 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:.3}").call(-12.5, pos=3),
    "−12",
  )
}

///|
test "StrMethod original 949 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!s:.3}").call(-12.5), "Non")
}

///|
test "StrMethod original 950 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:.3s}").call(-12.5, pos=3),
    "−12",
  )
}

///|
test "StrMethod original 951 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!s:.3s}").call(-12.5), "Non")
}

///|
test "StrMethod original 952 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:010}").call(-12.5, pos=3),
    "−12.500000",
  )
}

///|
test "StrMethod original 953 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:010}").call(-12.5),
    "None000000",
  )
}

///|
test "StrMethod original 954 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:>010}").call(-12.5, pos=3),
    "00000−12.5",
  )
}

///|
test "StrMethod original 955 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:>010}").call(-12.5),
    "000000None",
  )
}

///|
test "StrMethod original 956 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:=10}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: '=' alignment not allowed in string format specifier",
  )
}

///|
test "StrMethod original 957 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!s:=10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: '=' alignment not allowed in string format specifier",
  )
}

///|
test "StrMethod original 958 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:+10}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Sign not allowed in string format specifier")
}

///|
test "StrMethod original 959 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!s:+10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Sign not allowed in string format specifier")
}

///|
test "StrMethod original 960 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:z}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 961 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!s:z}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 962 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:#}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 963 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!s:#}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 964 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:,}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 's'.")
}

///|
test "StrMethod original 965 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!s:,}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 's'.")
}

///|
test "StrMethod original 966 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:10.2s}").call(-12.5, pos=3),
    "−1        ",
  )
}

///|
test "StrMethod original 967 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:10.2s}").call(-12.5),
    "No        ",
  )
}

///|
test "StrMethod original 968 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:🐍^10}").call(-12.5, pos=3),
    "🐍🐍−12.5🐍🐍🐍",
  )
}

///|
test "StrMethod original 969 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:🐍^10}").call(-12.5),
    "🐍🐍🐍None🐍🐍🐍",
  )
}

///|
test "StrMethod original 970 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:s}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 971 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!s:s}").call(-12.5), "None")
}

///|
test "StrMethod original 972 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:e}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'e' for object of type 'str'",
  )
}

///|
test "StrMethod original 973 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!s:e}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'e' for object of type 'str'",
  )
}

///|
test "StrMethod original 974 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:c}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'str'",
  )
}

///|
test "StrMethod original 975 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!s:c}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'str'",
  )
}

///|
test "StrMethod original 976 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:-^12}").call(-12.5, pos=3),
    "−−−−12.5−−−−",
  )
}

///|
test "StrMethod original 977 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:-^12}").call(-12.5),
    "−−−−None−−−−",
  )
}

///|
test "StrMethod original 978 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:->12}").call(-12.5, pos=3),
    "−−−−−−−−12.5",
  )
}

///|
test "StrMethod original 979 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:->12}").call(-12.5),
    "−−−−−−−−None",
  )
}

///|
test "StrMethod original 980 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:.101s}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 981 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:.101s}").call(-12.5),
    "None",
  )
}

///|
test "StrMethod original 982 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 983 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!r:}").call(-12.5), "None")
}

///|
test "StrMethod original 984 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:.3}").call(-12.5, pos=3),
    "−12",
  )
}

///|
test "StrMethod original 985 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!r:.3}").call(-12.5), "Non")
}

///|
test "StrMethod original 986 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:.3s}").call(-12.5, pos=3),
    "−12",
  )
}

///|
test "StrMethod original 987 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!r:.3s}").call(-12.5), "Non")
}

///|
test "StrMethod original 988 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:010}").call(-12.5, pos=3),
    "−12.500000",
  )
}

///|
test "StrMethod original 989 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!r:010}").call(-12.5),
    "None000000",
  )
}

///|
test "StrMethod original 990 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:>010}").call(-12.5, pos=3),
    "00000−12.5",
  )
}

///|
test "StrMethod original 991 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!r:>010}").call(-12.5),
    "000000None",
  )
}

///|
test "StrMethod original 992 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r:=10}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: '=' alignment not allowed in string format specifier",
  )
}

///|
test "StrMethod original 993 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!r:=10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: '=' alignment not allowed in string format specifier",
  )
}

///|
test "StrMethod original 994 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r:+10}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Sign not allowed in string format specifier")
}

///|
test "StrMethod original 995 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!r:+10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Sign not allowed in string format specifier")
}

///|
test "StrMethod original 996 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r:z}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 997 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!r:z}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 998 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r:#}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 999 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!r:#}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 1000 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r:,}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 's'.")
}

///|
test "StrMethod original 1001 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!r:,}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 's'.")
}

///|
test "StrMethod original 1002 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:10.2s}").call(-12.5, pos=3),
    "−1        ",
  )
}

///|
test "StrMethod original 1003 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!r:10.2s}").call(-12.5),
    "No        ",
  )
}

///|
test "StrMethod original 1004 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:🐍^10}").call(-12.5, pos=3),
    "🐍🐍−12.5🐍🐍🐍",
  )
}

///|
test "StrMethod original 1005 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!r:🐍^10}").call(-12.5),
    "🐍🐍🐍None🐍🐍🐍",
  )
}

///|
test "StrMethod original 1006 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:s}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 1007 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!r:s}").call(-12.5), "None")
}

///|
test "StrMethod original 1008 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r:e}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'e' for object of type 'str'",
  )
}

///|
test "StrMethod original 1009 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!r:e}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'e' for object of type 'str'",
  )
}

///|
test "StrMethod original 1010 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r:c}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'str'",
  )
}

///|
test "StrMethod original 1011 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!r:c}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'str'",
  )
}

///|
test "StrMethod original 1012 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^12}").call(-12.5, pos=3),
    "−−−−12.5−−−−",
  )
}

///|
test "StrMethod original 1013 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!r:-^12}").call(-12.5),
    "−−−−None−−−−",
  )
}

///|
test "StrMethod original 1014 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:->12}").call(-12.5, pos=3),
    "−−−−−−−−12.5",
  )
}

///|
test "StrMethod original 1015 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!r:->12}").call(-12.5),
    "−−−−−−−−None",
  )
}

///|
test "StrMethod original 1016 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:.101s}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 1017 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!r:.101s}").call(-12.5),
    "None",
  )
}

///|
test "StrMethod original 1018 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 1019 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!a:}").call(-12.5), "None")
}

///|
test "StrMethod original 1020 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:.3}").call(-12.5, pos=3),
    "−12",
  )
}

///|
test "StrMethod original 1021 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!a:.3}").call(-12.5), "Non")
}

///|
test "StrMethod original 1022 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:.3s}").call(-12.5, pos=3),
    "−12",
  )
}

///|
test "StrMethod original 1023 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!a:.3s}").call(-12.5), "Non")
}

///|
test "StrMethod original 1024 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:010}").call(-12.5, pos=3),
    "−12.500000",
  )
}

///|
test "StrMethod original 1025 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!a:010}").call(-12.5),
    "None000000",
  )
}

///|
test "StrMethod original 1026 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:>010}").call(-12.5, pos=3),
    "00000−12.5",
  )
}

///|
test "StrMethod original 1027 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!a:>010}").call(-12.5),
    "000000None",
  )
}

///|
test "StrMethod original 1028 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!a:=10}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: '=' alignment not allowed in string format specifier",
  )
}

///|
test "StrMethod original 1029 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!a:=10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: '=' alignment not allowed in string format specifier",
  )
}

///|
test "StrMethod original 1030 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!a:+10}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Sign not allowed in string format specifier")
}

///|
test "StrMethod original 1031 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!a:+10}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Sign not allowed in string format specifier")
}

///|
test "StrMethod original 1032 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!a:z}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 1033 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!a:z}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 1034 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!a:#}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 1035 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!a:#}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Alternate form (#) not allowed in string format specifier",
  )
}

///|
test "StrMethod original 1036 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!a:,}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 's'.")
}

///|
test "StrMethod original 1037 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!a:,}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with 's'.")
}

///|
test "StrMethod original 1038 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:10.2s}").call(-12.5, pos=3),
    "−1        ",
  )
}

///|
test "StrMethod original 1039 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!a:10.2s}").call(-12.5),
    "No        ",
  )
}

///|
test "StrMethod original 1040 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:🐍^10}").call(-12.5, pos=3),
    "🐍🐍−12.5🐍🐍🐍",
  )
}

///|
test "StrMethod original 1041 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!a:🐍^10}").call(-12.5),
    "🐍🐍🐍None🐍🐍🐍",
  )
}

///|
test "StrMethod original 1042 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:s}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 1043 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{pos!a:s}").call(-12.5), "None")
}

///|
test "StrMethod original 1044 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!a:e}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'e' for object of type 'str'",
  )
}

///|
test "StrMethod original 1045 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!a:e}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'e' for object of type 'str'",
  )
}

///|
test "StrMethod original 1046 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!a:c}").call(-12.5, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'str'",
  )
}

///|
test "StrMethod original 1047 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos!a:c}").call(-12.5))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'c' for object of type 'str'",
  )
}

///|
test "StrMethod original 1048 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:-^12}").call(-12.5, pos=3),
    "−−−−12.5−−−−",
  )
}

///|
test "StrMethod original 1049 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!a:-^12}").call(-12.5),
    "−−−−None−−−−",
  )
}

///|
test "StrMethod original 1050 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:->12}").call(-12.5, pos=3),
    "−−−−−−−−12.5",
  )
}

///|
test "StrMethod original 1051 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!a:->12}").call(-12.5),
    "−−−−−−−−None",
  )
}

///|
test "StrMethod original 1052 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:.101s}").call(-12.5, pos=3),
    "−12.5",
  )
}

///|
test "StrMethod original 1053 converted strings and None" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!a:.101s}").call(-12.5),
    "None",
  )
}

///|
test "StrMethod original 1054 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("").call(-1.2), "")
}

///|
test "StrMethod original 1055 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("literal {{x}} {{pos}} {{{x}}}").call(-1.2),
    "literal {x} {pos} {−1.2}",
  )
}

///|
test "StrMethod original 1056 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{{{x}}}").call(-1.2), "{−1.2}")
}

///|
test "StrMethod original 1057 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{{{{x}}}}").call(-1.2), "{{x}}")
}

///|
test "StrMethod original 1058 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "IndexError: tuple index out of range")
}

///|
test "StrMethod original 1059 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{0}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "IndexError: tuple index out of range")
}

///|
test "StrMethod original 1060 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{1}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "IndexError: tuple index out of range")
}

///|
test "StrMethod original 1061 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{value}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'value'")
}

///|
test "StrMethod original 1062 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1063 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{X}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'X'")
}

///|
test "StrMethod original 1064 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1065 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: unmatched '{' in format spec")
}

///|
test "StrMethod original 1066 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!ss}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: expected ':' after conversion specifier")
}

///|
test "StrMethod original 1067 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r!s}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: expected ':' after conversion specifier")
}

///|
test "StrMethod original 1068 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: expected '}' before end of string")
}

///|
test "StrMethod original 1069 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("x}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Single '}' encountered in format string")
}

///|
test "StrMethod original 1070 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{{").call(-1.2), "{")
}

///|
test "StrMethod original 1071 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("}}").call(-1.2), "}")
}

///|
test "StrMethod original 1072 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Single '{' encountered in format string")
}

///|
test "StrMethod original 1073 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Single '}' encountered in format string")
}

///|
test "StrMethod original 1074 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x}}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Single '}' encountered in format string")
}

///|
test "StrMethod original 1075 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{{x}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Single '}' encountered in format string")
}

///|
test "StrMethod original 1076 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: unmatched '{' in format spec")
}

///|
test "StrMethod original 1077 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: unmatched '{' in format spec")
}

///|
test "StrMethod original 1078 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x[0]}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: 'float' object is not subscriptable")
}

///|
test "StrMethod original 1079 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x[-1]}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: 'float' object is not subscriptable")
}

///|
test "StrMethod original 1080 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos[0]}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: 'NoneType' object is not subscriptable")
}

///|
test "StrMethod original 1081 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x.}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Empty attribute in format string")
}

///|
test "StrMethod original 1082 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x[]}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Empty attribute in format string")
}

///|
test "StrMethod original 1083 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x..real}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Empty attribute in format string")
}

///|
test "StrMethod original 1084 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x.real[0]}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: 'float' object is not subscriptable")
}

///|
test "StrMethod original 1085 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x.__class__.__name__[99]}").call(-1.2),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "IndexError: string index out of range")
}

///|
test "StrMethod original 1086 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x.__class__.__name__[real]}").call(-1.2),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: string indices must be integers, not 'str'")
}

///|
test "StrMethod original 1087 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x.__class__.__name__[-1]}").call(-1.2),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: string indices must be integers, not 'str'")
}

///|
test "StrMethod original 1088 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[١]}").call(-1.2),
    "l",
  )
}

///|
test "StrMethod original 1089 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{١}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "IndexError: tuple index out of range")
}

///|
test "StrMethod original 1090 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{²}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: '²'")
}

///|
test "StrMethod original 1091 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{<10.2f}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: unmatched '{' in format spec")
}

///|
test "StrMethod original 1092 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:}}>10.2f}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Single '}' encountered in format string")
}

///|
test "StrMethod original 1093 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{^10.2f}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: unmatched '{' in format spec")
}

///|
test "StrMethod original 1094 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: unmatched '{' in format spec")
}

///|
test "StrMethod original 1095 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: end of string while looking for conversion specifier",
  )
}

///|
test "StrMethod original 1096 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x[}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: expected '}' before end of string")
}

///|
test "StrMethod original 1097 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x{}}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: unexpected '{' in field name")
}

///|
test "StrMethod original 1098 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!r blah}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: expected ':' after conversion specifier")
}

///|
test "StrMethod original 1099 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x[0]foo}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: 'float' object is not subscriptable")
}

///|
test "StrMethod original 1100 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x[0}").call(-1.2))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: expected '}' before end of string")
}

///|
test "StrMethod original 1101 field parser and indexing" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]x}").call(-1.2),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Only '.' or '[' may follow ']' in format field specifier",
  )
}

///|
test "StrMethod original 1102 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1103 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1104 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}.2f}").call(8.0, pos=3),
    "8.00",
  )
}

///|
test "StrMethod original 1105 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}.2f}").call(8.0, pos=3),
    "8.00",
  )
}

///|
test "StrMethod original 1106 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}.2f}").call(8.0, pos=-8),
    "    8.00",
  )
}

///|
test "StrMethod original 1107 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}.2f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '−8.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1108 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}.2f}").call(8.0, pos=45),
    "                                         8.00",
  )
}

///|
test "StrMethod original 1109 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}.2f}").call(8.0, pos=45),
    "                                         8.00",
  )
}

///|
test "StrMethod original 1110 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.{pos}f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1111 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.{pos}f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1112 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.{pos}f}").call(8.0, pos=3),
    "8.000",
  )
}

///|
test "StrMethod original 1113 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.{pos}f}").call(8.0, pos=3),
    "8.000",
  )
}

///|
test "StrMethod original 1114 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.{pos}f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1115 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.{pos}f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1116 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.{pos}f}").call(8.0, pos=45),
    "8.000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 1117 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.{pos}f}").call(8.0, pos=45),
    "8.000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 1118 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}g}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'Noneg' for object of type 'float'",
  )
}

///|
test "StrMethod original 1119 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}g}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'Noneg' for object of type 'float'",
  )
}

///|
test "StrMethod original 1120 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}g}").call(8.0, pos=3),
    "  8",
  )
}

///|
test "StrMethod original 1121 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}g}").call(8.0, pos=3),
    "  8",
  )
}

///|
test "StrMethod original 1122 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}g}").call(8.0, pos=-8),
    "       8",
  )
}

///|
test "StrMethod original 1123 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}g}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '−8g' for object of type 'float'",
  )
}

///|
test "StrMethod original 1124 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}g}").call(8.0, pos=45),
    "                                            8",
  )
}

///|
test "StrMethod original 1125 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}g}").call(8.0, pos=45),
    "                                            8",
  )
}

///|
test "StrMethod original 1126 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}>12.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None>12.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1127 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}>12.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None>12.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1128 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}>12.2f}").call(8.0, pos=3),
    "333333338.00",
  )
}

///|
test "StrMethod original 1129 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}>12.2f}").call(8.0, pos=3),
    "333333338.00",
  )
}

///|
test "StrMethod original 1130 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}>12.2f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '-8>12.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1131 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}>12.2f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '−8>12.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1132 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}>12.2f}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '45>12.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1133 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}>12.2f}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '45>12.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1134 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None' for object of type 'float'",
  )
}

///|
test "StrMethod original 1135 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None' for object of type 'float'",
  )
}

///|
test "StrMethod original 1136 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}}").call(8.0, pos=3),
    "8.0",
  )
}

///|
test "StrMethod original 1137 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}}").call(8.0, pos=3),
    "8.0",
  )
}

///|
test "StrMethod original 1138 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}}").call(8.0, pos=-8),
    "     8.0",
  )
}

///|
test "StrMethod original 1139 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '−8' for object of type 'float'",
  )
}

///|
test "StrMethod original 1140 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}}").call(8.0, pos=45),
    "                                          8.0",
  )
}

///|
test "StrMethod original 1141 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos}}").call(8.0, pos=45),
    "                                          8.0",
  )
}

///|
test "StrMethod original 1142 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:{x}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 1143 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:{x}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 1144 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:{x}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1145 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:{x}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1146 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:{x}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1147 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:{x}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1148 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:{x}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1149 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:{x}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1150 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.{pos!s}f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1151 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.{pos!s}f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1152 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.{pos!s}f}").call(8.0, pos=3),
    "8.000",
  )
}

///|
test "StrMethod original 1153 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.{pos!s}f}").call(8.0, pos=3),
    "8.000",
  )
}

///|
test "StrMethod original 1154 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.{pos!s}f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1155 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:.{pos!s}f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1156 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.{pos!s}f}").call(8.0, pos=45),
    "8.000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 1157 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.{pos!s}f}").call(8.0, pos=45),
    "8.000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 1158 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{pos}}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1159 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{pos}}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1160 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{pos}}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1161 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{pos}}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1162 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{pos}}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1163 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{pos}}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1164 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{pos}}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1165 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{pos}}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1166 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{x}}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1167 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{x}}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1168 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{x}}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1169 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{x}}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1170 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{x}}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1171 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{x}}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1172 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{x}}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1173 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{x}}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Max string recursion exceeded")
}

///|
test "StrMethod original 1174 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!r}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None' for object of type 'float'",
  )
}

///|
test "StrMethod original 1175 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!r}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None' for object of type 'float'",
  )
}

///|
test "StrMethod original 1176 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos!r}}").call(8.0, pos=3),
    "8.0",
  )
}

///|
test "StrMethod original 1177 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos!r}}").call(8.0, pos=3),
    "8.0",
  )
}

///|
test "StrMethod original 1178 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos!r}}").call(8.0, pos=-8),
    "     8.0",
  )
}

///|
test "StrMethod original 1179 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!r}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '−8' for object of type 'float'",
  )
}

///|
test "StrMethod original 1180 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos!r}}").call(8.0, pos=45),
    "                                          8.0",
  )
}

///|
test "StrMethod original 1181 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos!r}}").call(8.0, pos=45),
    "                                          8.0",
  )
}

///|
test "StrMethod original 1182 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{x:.0f}.2f}").call(8.0),
    "    8.00",
  )
}

///|
test "StrMethod original 1183 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{x:.0f}.2f}").call(8.0),
    "    8.00",
  )
}

///|
test "StrMethod original 1184 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{x:.0f}.2f}").call(8.0, pos=3),
    "    8.00",
  )
}

///|
test "StrMethod original 1185 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{x:.0f}.2f}").call(8.0, pos=3),
    "    8.00",
  )
}

///|
test "StrMethod original 1186 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{x:.0f}.2f}").call(8.0, pos=-8),
    "    8.00",
  )
}

///|
test "StrMethod original 1187 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{x:.0f}.2f}").call(8.0, pos=-8),
    "    8.00",
  )
}

///|
test "StrMethod original 1188 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{x:.0f}.2f}").call(8.0, pos=45),
    "    8.00",
  )
}

///|
test "StrMethod original 1189 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{x:.0f}.2f}").call(8.0, pos=45),
    "    8.00",
  )
}

///|
test "StrMethod original 1190 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{x:.1f}.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '8.0.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1191 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{x:.1f}.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '8.0.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1192 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{x:.1f}.2f}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '8.0.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1193 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{x:.1f}.2f}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '8.0.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1194 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{x:.1f}.2f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '8.0.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1195 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{x:.1f}.2f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '8.0.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1196 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{x:.1f}.2f}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '8.0.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1197 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{x:.1f}.2f}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '8.0.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1198 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:02d}.1f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 1199 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:02d}.1f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 1200 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:02d}.1f}").call(8.0, pos=3),
    "8.0",
  )
}

///|
test "StrMethod original 1201 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:02d}.1f}").call(8.0, pos=3),
    "8.0",
  )
}

///|
test "StrMethod original 1202 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:02d}.1f}").call(8.0, pos=-8),
    "     8.0",
  )
}

///|
test "StrMethod original 1203 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:02d}.1f}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '−8.1f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1204 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:02d}.1f}").call(8.0, pos=45),
    "                                          8.0",
  )
}

///|
test "StrMethod original 1205 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:02d}.1f}").call(8.0, pos=45),
    "                                          8.0",
  )
}

///|
test "StrMethod original 1206 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{}}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '{}' for object of type 'float'",
  )
}

///|
test "StrMethod original 1207 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{}}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '{}' for object of type 'float'",
  )
}

///|
test "StrMethod original 1208 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{}}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '{}' for object of type 'float'",
  )
}

///|
test "StrMethod original 1209 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{}}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '{}' for object of type 'float'",
  )
}

///|
test "StrMethod original 1210 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{}}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '{}' for object of type 'float'",
  )
}

///|
test "StrMethod original 1211 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{}}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '{}' for object of type 'float'",
  )
}

///|
test "StrMethod original 1212 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{}}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '{}' for object of type 'float'",
  )
}

///|
test "StrMethod original 1213 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{{}}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '{}' for object of type 'float'",
  )
}

///|
test "StrMethod original 1214 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:{pos}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None' for object of type 'str'",
  )
}

///|
test "StrMethod original 1215 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:{pos}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None' for object of type 'str'",
  )
}

///|
test "StrMethod original 1216 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:{pos}}").call(8.0, pos=3),
    "8.0",
  )
}

///|
test "StrMethod original 1217 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:{pos}}").call(8.0, pos=3),
    "8.0",
  )
}

///|
test "StrMethod original 1218 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:{pos}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Sign not allowed in string format specifier")
}

///|
test "StrMethod original 1219 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:{pos}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '−8' for object of type 'str'",
  )
}

///|
test "StrMethod original 1220 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:{pos}}").call(8.0, pos=45),
    "8.0                                          ",
  )
}

///|
test "StrMethod original 1221 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:{pos}}").call(8.0, pos=45),
    "8.0                                          ",
  )
}

///|
test "StrMethod original 1222 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing} {x!q}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1223 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing} {x!q}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1224 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing} {x!q}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1225 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing} {x!q}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1226 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing} {x!q}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1227 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing} {x!q}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1228 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing} {x!q}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1229 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing} {x!q}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1230 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q} {missing}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1231 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q} {missing}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1232 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q} {missing}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1233 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q} {missing}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1234 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q} {missing}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1235 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q} {missing}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1236 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q} {missing}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1237 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q} {missing}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1238 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q:{missing}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1239 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q:{missing}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1240 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q:{missing}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1241 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q:{missing}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1242 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q:{missing}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1243 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q:{missing}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1244 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q:{missing}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1245 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!q:{missing}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1246 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{missing}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1247 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{missing}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1248 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{missing}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1249 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{missing}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1250 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{missing}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1251 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{missing}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1252 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{missing}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1253 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{missing}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1254 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:bad}{missing}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'bad' for object of type 'float'",
  )
}

///|
test "StrMethod original 1255 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:bad}{missing}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'bad' for object of type 'float'",
  )
}

///|
test "StrMethod original 1256 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:bad}{missing}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'bad' for object of type 'float'",
  )
}

///|
test "StrMethod original 1257 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:bad}{missing}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'bad' for object of type 'float'",
  )
}

///|
test "StrMethod original 1258 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:bad}{missing}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'bad' for object of type 'float'",
  )
}

///|
test "StrMethod original 1259 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:bad}{missing}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'bad' for object of type 'float'",
  )
}

///|
test "StrMethod original 1260 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:bad}{missing}").call(8.0, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'bad' for object of type 'float'",
  )
}

///|
test "StrMethod original 1261 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:bad}{missing}").call(8.0, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'bad' for object of type 'float'",
  )
}

///|
test "StrMethod original 1262 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing}{x:bad}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1263 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing}{x:bad}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1264 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing}{x:bad}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1265 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{missing}{x:bad}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1266 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{missing}{x:bad}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1267 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{missing}{x:bad}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1268 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{missing}{x:bad}").call(8.0, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1269 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{missing}{x:bad}").call(8.0, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1270 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:.{pos}f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1271 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:.{pos}f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1272 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:.{pos}f}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'f' for object of type 'str'",
  )
}

///|
test "StrMethod original 1273 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:.{pos}f}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'f' for object of type 'str'",
  )
}

///|
test "StrMethod original 1274 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:.{pos}f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1275 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:.{pos}f}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Format specifier missing precision")
}

///|
test "StrMethod original 1276 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:.{pos}f}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'f' for object of type 'str'",
  )
}

///|
test "StrMethod original 1277 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:.{pos}f}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code 'f' for object of type 'str'",
  )
}

///|
test "StrMethod original 1278 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!q}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1279 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!q}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1280 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!q}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1281 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!q}}").call(8.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1282 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!q}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1283 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!q}}").call(8.0, pos=-8))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1284 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!q}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1285 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!q}}").call(8.0, pos=45))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Unknown conversion specifier q")
}

///|
test "StrMethod original 1286 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{missing}}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1287 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:{missing}}}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1288 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:{missing}}}").call(8.0, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1289 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:{missing}}}").call(8.0, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1290 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:{missing}}}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1291 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:{missing}}}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1292 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:{missing}}}").call(8.0, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1293 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:{missing}}}").call(8.0, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: 'missing'")
}

///|
test "StrMethod original 1294 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!r}>10.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None>10.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1295 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos!r}>10.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'None>10.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1296 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos!r}>10.2f}").call(8.0, pos=3),
    "3333338.00",
  )
}

///|
test "StrMethod original 1297 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos!r}>10.2f}").call(8.0, pos=3),
    "3333338.00",
  )
}

///|
test "StrMethod original 1298 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos!r}>10.2f}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '-8>10.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1299 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos!r}>10.2f}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '−8>10.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1300 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos!r}>10.2f}").call(8.0, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '45>10.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1301 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos!r}>10.2f}").call(8.0, pos=45),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '45>10.2f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1302 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:c}^12.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 1303 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:{pos:c}^12.2f}").call(8.0))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "TypeError: unsupported format string passed to NoneType.__format__",
  )
}

///|
test "StrMethod original 1304 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:c}^12.2f}").call(8.0, pos=3),
    "\u0003\u0003\u0003\u00038.00\u0003\u0003\u0003\u0003",
  )
}

///|
test "StrMethod original 1305 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:c}^12.2f}").call(8.0, pos=3),
    "\u0003\u0003\u0003\u00038.00\u0003\u0003\u0003\u0003",
  )
}

///|
test "StrMethod original 1306 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:c}^12.2f}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 1307 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:{pos:c}^12.2f}").call(8.0, pos=-8),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 1308 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:c}^12.2f}").call(8.0, pos=45),
    "----8.00----",
  )
}

///|
test "StrMethod original 1309 nested recursive order unicode" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:{pos:c}^12.2f}").call(8.0, pos=45),
    "−−−−8.00−−−−",
  )
}

///|
test "StrMethod original 1310 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x.real}").call(-1.25), "−1.25")
}

///|
test "StrMethod original 1311 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!s}").call(-1.25),
    "−1.25",
  )
}

///|
test "StrMethod original 1312 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").call(-1.25),
    "−1.25",
  )
}

///|
test "StrMethod original 1313 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!a}").call(-1.25),
    "−1.25",
  )
}

///|
test "StrMethod original 1314 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real}").call(-1.25, pos=-3),
    "−1.25",
  )
}

///|
test "StrMethod original 1315 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!s}").call(-1.25, pos=-3),
    "−1.25",
  )
}

///|
test "StrMethod original 1316 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").call(-1.25, pos=-3),
    "−1.25",
  )
}

///|
test "StrMethod original 1317 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!a}").call(-1.25, pos=-3),
    "−1.25",
  )
}

///|
test "StrMethod original 1318 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real}").call(-1.25, pos=45),
    "−1.25",
  )
}

///|
test "StrMethod original 1319 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!s}").call(-1.25, pos=45),
    "−1.25",
  )
}

///|
test "StrMethod original 1320 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").call(-1.25, pos=45),
    "−1.25",
  )
}

///|
test "StrMethod original 1321 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!a}").call(-1.25, pos=45),
    "−1.25",
  )
}

///|
test "StrMethod original 1322 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x.imag}").call(-1.25), "0.0")
}

///|
test "StrMethod original 1323 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x.imag!s}").call(-1.25), "0.0")
}

///|
test "StrMethod original 1324 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x.imag!r}").call(-1.25), "0.0")
}

///|
test "StrMethod original 1325 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(@ticker.StrMethodFormatter::new("{x.imag!a}").call(-1.25), "0.0")
}

///|
test "StrMethod original 1326 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag}").call(-1.25, pos=-3),
    "0.0",
  )
}

///|
test "StrMethod original 1327 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!s}").call(-1.25, pos=-3),
    "0.0",
  )
}

///|
test "StrMethod original 1328 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").call(-1.25, pos=-3),
    "0.0",
  )
}

///|
test "StrMethod original 1329 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!a}").call(-1.25, pos=-3),
    "0.0",
  )
}

///|
test "StrMethod original 1330 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag}").call(-1.25, pos=45),
    "0.0",
  )
}

///|
test "StrMethod original 1331 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!s}").call(-1.25, pos=45),
    "0.0",
  )
}

///|
test "StrMethod original 1332 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").call(-1.25, pos=45),
    "0.0",
  )
}

///|
test "StrMethod original 1333 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!a}").call(-1.25, pos=45),
    "0.0",
  )
}

///|
test "StrMethod original 1334 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__}").call(-1.25),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1335 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!s}").call(-1.25),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1336 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!r}").call(-1.25),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1337 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!a}").call(-1.25),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1338 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__}").call(-1.25, pos=-3),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1339 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!s}").call(-1.25, pos=-3),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1340 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!r}").call(-1.25, pos=-3),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1341 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!a}").call(-1.25, pos=-3),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1342 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__}").call(-1.25, pos=45),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1343 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!s}").call(-1.25, pos=45),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1344 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!r}").call(-1.25, pos=45),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1345 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__!a}").call(-1.25, pos=45),
    "<class 'float'>",
  )
}

///|
test "StrMethod original 1346 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").call(-1.25),
    "float",
  )
}

///|
test "StrMethod original 1347 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!s}").call(-1.25),
    "float",
  )
}

///|
test "StrMethod original 1348 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!r}").call(-1.25),
    "'float'",
  )
}

///|
test "StrMethod original 1349 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!a}").call(-1.25),
    "'float'",
  )
}

///|
test "StrMethod original 1350 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").call(
      -1.25,
      pos=-3,
    ),
    "float",
  )
}

///|
test "StrMethod original 1351 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!s}").call(
      -1.25,
      pos=-3,
    ),
    "float",
  )
}

///|
test "StrMethod original 1352 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!r}").call(
      -1.25,
      pos=-3,
    ),
    "'float'",
  )
}

///|
test "StrMethod original 1353 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!a}").call(
      -1.25,
      pos=-3,
    ),
    "'float'",
  )
}

///|
test "StrMethod original 1354 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").call(
      -1.25,
      pos=45,
    ),
    "float",
  )
}

///|
test "StrMethod original 1355 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!s}").call(
      -1.25,
      pos=45,
    ),
    "float",
  )
}

///|
test "StrMethod original 1356 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!r}").call(
      -1.25,
      pos=45,
    ),
    "'float'",
  )
}

///|
test "StrMethod original 1357 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__!a}").call(
      -1.25,
      pos=45,
    ),
    "'float'",
  )
}

///|
test "StrMethod original 1358 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").call(-1.25),
    "f",
  )
}

///|
test "StrMethod original 1359 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!s}").call(-1.25),
    "f",
  )
}

///|
test "StrMethod original 1360 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!r}").call(-1.25),
    "'f'",
  )
}

///|
test "StrMethod original 1361 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!a}").call(-1.25),
    "'f'",
  )
}

///|
test "StrMethod original 1362 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").call(
      -1.25,
      pos=-3,
    ),
    "f",
  )
}

///|
test "StrMethod original 1363 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!s}").call(
      -1.25,
      pos=-3,
    ),
    "f",
  )
}

///|
test "StrMethod original 1364 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!r}").call(
      -1.25,
      pos=-3,
    ),
    "'f'",
  )
}

///|
test "StrMethod original 1365 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!a}").call(
      -1.25,
      pos=-3,
    ),
    "'f'",
  )
}

///|
test "StrMethod original 1366 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").call(
      -1.25,
      pos=45,
    ),
    "f",
  )
}

///|
test "StrMethod original 1367 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!s}").call(
      -1.25,
      pos=45,
    ),
    "f",
  )
}

///|
test "StrMethod original 1368 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!r}").call(
      -1.25,
      pos=45,
    ),
    "'f'",
  )
}

///|
test "StrMethod original 1369 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]!a}").call(
      -1.25,
      pos=45,
    ),
    "'f'",
  )
}

///|
test "StrMethod original 1370 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.real}").call(-1.25, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 1371 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.real!s}").call(-1.25, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 1372 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.real!r}").call(-1.25, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 1373 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.real!a}").call(-1.25, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 1374 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.real}").call(-1.25, pos=45),
    "45",
  )
}

///|
test "StrMethod original 1375 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.real!s}").call(-1.25, pos=45),
    "45",
  )
}

///|
test "StrMethod original 1376 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.real!r}").call(-1.25, pos=45),
    "45",
  )
}

///|
test "StrMethod original 1377 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.real!a}").call(-1.25, pos=45),
    "45",
  )
}

///|
test "StrMethod original 1378 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.imag}").call(-1.25, pos=-3),
    "0",
  )
}

///|
test "StrMethod original 1379 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.imag!s}").call(-1.25, pos=-3),
    "0",
  )
}

///|
test "StrMethod original 1380 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.imag!r}").call(-1.25, pos=-3),
    "0",
  )
}

///|
test "StrMethod original 1381 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.imag!a}").call(-1.25, pos=-3),
    "0",
  )
}

///|
test "StrMethod original 1382 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.imag}").call(-1.25, pos=45),
    "0",
  )
}

///|
test "StrMethod original 1383 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.imag!s}").call(-1.25, pos=45),
    "0",
  )
}

///|
test "StrMethod original 1384 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.imag!r}").call(-1.25, pos=45),
    "0",
  )
}

///|
test "StrMethod original 1385 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.imag!a}").call(-1.25, pos=45),
    "0",
  )
}

///|
test "StrMethod original 1386 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.numerator}").call(-1.25, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 1387 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.numerator!s}").call(-1.25, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 1388 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.numerator!r}").call(-1.25, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 1389 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.numerator!a}").call(-1.25, pos=-3),
    "−3",
  )
}

///|
test "StrMethod original 1390 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.numerator}").call(-1.25, pos=45),
    "45",
  )
}

///|
test "StrMethod original 1391 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.numerator!s}").call(-1.25, pos=45),
    "45",
  )
}

///|
test "StrMethod original 1392 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.numerator!r}").call(-1.25, pos=45),
    "45",
  )
}

///|
test "StrMethod original 1393 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.numerator!a}").call(-1.25, pos=45),
    "45",
  )
}

///|
test "StrMethod original 1394 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.denominator}").call(-1.25, pos=-3),
    "1",
  )
}

///|
test "StrMethod original 1395 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.denominator!s}").call(-1.25, pos=-3),
    "1",
  )
}

///|
test "StrMethod original 1396 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.denominator!r}").call(-1.25, pos=-3),
    "1",
  )
}

///|
test "StrMethod original 1397 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.denominator!a}").call(-1.25, pos=-3),
    "1",
  )
}

///|
test "StrMethod original 1398 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.denominator}").call(-1.25, pos=45),
    "1",
  )
}

///|
test "StrMethod original 1399 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.denominator!s}").call(-1.25, pos=45),
    "1",
  )
}

///|
test "StrMethod original 1400 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.denominator!r}").call(-1.25, pos=45),
    "1",
  )
}

///|
test "StrMethod original 1401 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.denominator!a}").call(-1.25, pos=45),
    "1",
  )
}

///|
test "StrMethod original 1402 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__}").call(-1.25),
    "<class 'NoneType'>",
  )
}

///|
test "StrMethod original 1403 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!s}").call(-1.25),
    "<class 'NoneType'>",
  )
}

///|
test "StrMethod original 1404 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!r}").call(-1.25),
    "<class 'NoneType'>",
  )
}

///|
test "StrMethod original 1405 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!a}").call(-1.25),
    "<class 'NoneType'>",
  )
}

///|
test "StrMethod original 1406 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__}").call(-1.25, pos=-3),
    "<class 'int'>",
  )
}

///|
test "StrMethod original 1407 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!s}").call(-1.25, pos=-3),
    "<class 'int'>",
  )
}

///|
test "StrMethod original 1408 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!r}").call(-1.25, pos=-3),
    "<class 'int'>",
  )
}

///|
test "StrMethod original 1409 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!a}").call(-1.25, pos=-3),
    "<class 'int'>",
  )
}

///|
test "StrMethod original 1410 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__}").call(-1.25, pos=45),
    "<class 'int'>",
  )
}

///|
test "StrMethod original 1411 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!s}").call(-1.25, pos=45),
    "<class 'int'>",
  )
}

///|
test "StrMethod original 1412 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!r}").call(-1.25, pos=45),
    "<class 'int'>",
  )
}

///|
test "StrMethod original 1413 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__!a}").call(-1.25, pos=45),
    "<class 'int'>",
  )
}

///|
test "StrMethod original 1414 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__}").call(-1.25),
    "NoneType",
  )
}

///|
test "StrMethod original 1415 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!s}").call(-1.25),
    "NoneType",
  )
}

///|
test "StrMethod original 1416 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!r}").call(-1.25),
    "'NoneType'",
  )
}

///|
test "StrMethod original 1417 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!a}").call(-1.25),
    "'NoneType'",
  )
}

///|
test "StrMethod original 1418 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__}").call(
      -1.25,
      pos=-3,
    ),
    "int",
  )
}

///|
test "StrMethod original 1419 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!s}").call(
      -1.25,
      pos=-3,
    ),
    "int",
  )
}

///|
test "StrMethod original 1420 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!r}").call(
      -1.25,
      pos=-3,
    ),
    "'int'",
  )
}

///|
test "StrMethod original 1421 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!a}").call(
      -1.25,
      pos=-3,
    ),
    "'int'",
  )
}

///|
test "StrMethod original 1422 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__}").call(
      -1.25,
      pos=45,
    ),
    "int",
  )
}

///|
test "StrMethod original 1423 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!s}").call(
      -1.25,
      pos=45,
    ),
    "int",
  )
}

///|
test "StrMethod original 1424 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!r}").call(
      -1.25,
      pos=45,
    ),
    "'int'",
  )
}

///|
test "StrMethod original 1425 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__!a}").call(
      -1.25,
      pos=45,
    ),
    "'int'",
  )
}

///|
test "StrMethod original 1426 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]}").call(-1.25),
    "N",
  )
}

///|
test "StrMethod original 1427 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!s}").call(-1.25),
    "N",
  )
}

///|
test "StrMethod original 1428 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!r}").call(-1.25),
    "'N'",
  )
}

///|
test "StrMethod original 1429 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!a}").call(-1.25),
    "'N'",
  )
}

///|
test "StrMethod original 1430 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]}").call(
      -1.25,
      pos=-3,
    ),
    "i",
  )
}

///|
test "StrMethod original 1431 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!s}").call(
      -1.25,
      pos=-3,
    ),
    "i",
  )
}

///|
test "StrMethod original 1432 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!r}").call(
      -1.25,
      pos=-3,
    ),
    "'i'",
  )
}

///|
test "StrMethod original 1433 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!a}").call(
      -1.25,
      pos=-3,
    ),
    "'i'",
  )
}

///|
test "StrMethod original 1434 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]}").call(
      -1.25,
      pos=45,
    ),
    "i",
  )
}

///|
test "StrMethod original 1435 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!s}").call(
      -1.25,
      pos=45,
    ),
    "i",
  )
}

///|
test "StrMethod original 1436 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!r}").call(
      -1.25,
      pos=45,
    ),
    "'i'",
  )
}

///|
test "StrMethod original 1437 stable scalar attribute chains" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos.__class__.__name__[0]!a}").call(
      -1.25,
      pos=45,
    ),
    "'i'",
  )
}

///|
test "StrMethod original 1438 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "−1.25",
  )
}

///|
test "StrMethod original 1439 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "−1.25",
  )
}

///|
test "StrMethod original 1440 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "np.float64(−1.25)",
  )
}

///|
test "StrMethod original 1441 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "np.float64(−1.25)",
  )
}

///|
test "StrMethod original 1442 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
        @ticker.TickValues::from_array([-1.25]),
      )[0],
    )
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
test "StrMethod original 1443 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^30}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "−−−−−−np.float64(−1.25)−−−−−−−",
  )
}

///|
test "StrMethod original 1444 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "np.float64(−1.25)",
  )
}

///|
test "StrMethod original 1445 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "np.float64(0.0)",
  )
}

///|
test "StrMethod original 1446 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "float64",
  )
}

///|
test "StrMethod original 1447 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2f}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "−1.25",
  )
}

///|
test "StrMethod original 1448 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+020,.2f}").format_ticks_view(
      @ticker.TickValues::from_array([-1.25]),
    )[0],
    "−0,000,000,000,001.25",
  )
}

///|
test "StrMethod original 1449 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "−0.0",
  )
}

///|
test "StrMethod original 1450 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "−0.0",
  )
}

///|
test "StrMethod original 1451 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "np.float64(−0.0)",
  )
}

///|
test "StrMethod original 1452 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "np.float64(−0.0)",
  )
}

///|
test "StrMethod original 1453 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
        @ticker.TickValues::from_array([-0.0]),
      )[0],
    )
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
test "StrMethod original 1454 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^30}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "−−−−−−−np.float64(−0.0)−−−−−−−",
  )
}

///|
test "StrMethod original 1455 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "np.float64(−0.0)",
  )
}

///|
test "StrMethod original 1456 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "np.float64(0.0)",
  )
}

///|
test "StrMethod original 1457 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "float64",
  )
}

///|
test "StrMethod original 1458 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2f}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "−0.00",
  )
}

///|
test "StrMethod original 1459 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+020,.2f}").format_ticks_view(
      @ticker.TickValues::from_array([-0.0]),
    )[0],
    "−0,000,000,000,000.00",
  )
}

///|
test "StrMethod original 1460 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "nan",
  )
}

///|
test "StrMethod original 1461 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "nan",
  )
}

///|
test "StrMethod original 1462 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "np.float64(nan)",
  )
}

///|
test "StrMethod original 1463 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "np.float64(nan)",
  )
}

///|
test "StrMethod original 1464 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
        @ticker.TickValues::from_array([0.0 / 0.0]),
      )[0],
    )
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
test "StrMethod original 1465 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^30}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "−−−−−−−np.float64(nan)−−−−−−−−",
  )
}

///|
test "StrMethod original 1466 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "np.float64(nan)",
  )
}

///|
test "StrMethod original 1467 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "np.float64(0.0)",
  )
}

///|
test "StrMethod original 1468 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "float64",
  )
}

///|
test "StrMethod original 1469 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2f}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "nan",
  )
}

///|
test "StrMethod original 1470 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+020,.2f}").format_ticks_view(
      @ticker.TickValues::from_array([0.0 / 0.0]),
    )[0],
    "+0000000000000000nan",
  )
}

///|
test "StrMethod original 1471 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "inf",
  )
}

///|
test "StrMethod original 1472 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "inf",
  )
}

///|
test "StrMethod original 1473 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "np.float64(inf)",
  )
}

///|
test "StrMethod original 1474 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "np.float64(inf)",
  )
}

///|
test "StrMethod original 1475 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
        @ticker.TickValues::from_array([1.0 / 0.0]),
      )[0],
    )
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
test "StrMethod original 1476 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^30}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "−−−−−−−np.float64(inf)−−−−−−−−",
  )
}

///|
test "StrMethod original 1477 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "np.float64(inf)",
  )
}

///|
test "StrMethod original 1478 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "np.float64(0.0)",
  )
}

///|
test "StrMethod original 1479 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "float64",
  )
}

///|
test "StrMethod original 1480 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2f}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "inf",
  )
}

///|
test "StrMethod original 1481 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+020,.2f}").format_ticks_view(
      @ticker.TickValues::from_array([1.0 / 0.0]),
    )[0],
    "+0000000000000000inf",
  )
}

///|
test "StrMethod original 1482 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "−inf",
  )
}

///|
test "StrMethod original 1483 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "−inf",
  )
}

///|
test "StrMethod original 1484 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "np.float64(−inf)",
  )
}

///|
test "StrMethod original 1485 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "np.float64(−inf)",
  )
}

///|
test "StrMethod original 1486 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
        @ticker.TickValues::from_array([-1.0 / 0.0]),
      )[0],
    )
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
test "StrMethod original 1487 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^30}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "−−−−−−−np.float64(−inf)−−−−−−−",
  )
}

///|
test "StrMethod original 1488 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "np.float64(−inf)",
  )
}

///|
test "StrMethod original 1489 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "np.float64(0.0)",
  )
}

///|
test "StrMethod original 1490 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "float64",
  )
}

///|
test "StrMethod original 1491 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2f}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "−inf",
  )
}

///|
test "StrMethod original 1492 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+020,.2f}").format_ticks_view(
      @ticker.TickValues::from_array([-1.0 / 0.0]),
    )[0],
    "−0000000000000000inf",
  )
}

///|
test "StrMethod original 1493 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "1e−05",
  )
}

///|
test "StrMethod original 1494 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "1e−05",
  )
}

///|
test "StrMethod original 1495 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "np.float64(1e−05)",
  )
}

///|
test "StrMethod original 1496 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "np.float64(1e−05)",
  )
}

///|
test "StrMethod original 1497 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
        @ticker.TickValues::from_array([1.0e-05]),
      )[0],
    )
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
test "StrMethod original 1498 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^30}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "−−−−−−np.float64(1e−05)−−−−−−−",
  )
}

///|
test "StrMethod original 1499 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "np.float64(1e−05)",
  )
}

///|
test "StrMethod original 1500 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "np.float64(0.0)",
  )
}

///|
test "StrMethod original 1501 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "float64",
  )
}

///|
test "StrMethod original 1502 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2f}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "0.00",
  )
}

///|
test "StrMethod original 1503 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+020,.2f}").format_ticks_view(
      @ticker.TickValues::from_array([1.0e-05]),
    )[0],
    "+0,000,000,000,000.00",
  )
}

///|
test "StrMethod original 1504 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "1.0",
  )
}

///|
test "StrMethod original 1505 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "1.0",
  )
}

///|
test "StrMethod original 1506 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "np.float64(1.0)",
  )
}

///|
test "StrMethod original 1507 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "np.float64(1.0)",
  )
}

///|
test "StrMethod original 1508 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
        @ticker.TickValues::from_array([1.0]),
      )[0],
    )
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
test "StrMethod original 1509 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^30}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "−−−−−−−np.float64(1.0)−−−−−−−−",
  )
}

///|
test "StrMethod original 1510 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "np.float64(1.0)",
  )
}

///|
test "StrMethod original 1511 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "np.float64(0.0)",
  )
}

///|
test "StrMethod original 1512 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "float64",
  )
}

///|
test "StrMethod original 1513 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2f}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "1.00",
  )
}

///|
test "StrMethod original 1514 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+020,.2f}").format_ticks_view(
      @ticker.TickValues::from_array([1.0]),
    )[0],
    "+0,000,000,000,001.00",
  )
}

///|
test "StrMethod original 1515 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "5e−324",
  )
}

///|
test "StrMethod original 1516 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "5e−324",
  )
}

///|
test "StrMethod original 1517 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "np.float64(5e−324)",
  )
}

///|
test "StrMethod original 1518 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "np.float64(5e−324)",
  )
}

///|
test "StrMethod original 1519 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
        @ticker.TickValues::from_array([5.0e-324]),
      )[0],
    )
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
test "StrMethod original 1520 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-^30}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "−−−−−−np.float64(5e−324)−−−−−−",
  )
}

///|
test "StrMethod original 1521 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "np.float64(5e−324)",
  )
}

///|
test "StrMethod original 1522 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "np.float64(0.0)",
  )
}

///|
test "StrMethod original 1523 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "float64",
  )
}

///|
test "StrMethod original 1524 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2f}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "0.00",
  )
}

///|
test "StrMethod original 1525 actual Float64 ndarray scalar" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+020,.2f}").format_ticks_view(
      @ticker.TickValues::from_array([5.0e-324]),
    )[0],
    "+0,000,000,000,000.00",
  )
}

///|
test "StrMethod original 1526 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9223372036854775808",
  )
}

///|
test "StrMethod original 1527 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9223372036854775808",
  )
}

///|
test "StrMethod original 1528 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−1000000000000000000000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 1529 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−1000000000000000000000",
  )
}

///|
test "StrMethod original 1530 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−8000000000000000",
  )
}

///|
test "StrMethod original 1531 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−8000000000000000",
  )
}

///|
test "StrMethod original 1532 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9223372036854775808",
  )
}

///|
test "StrMethod original 1533 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−0b1000000000000000000000000000000000000000000000000000000000000000",
  )
}

///|
test "StrMethod original 1534 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−0o1000000000000000000000",
  )
}

///|
test "StrMethod original 1535 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−0x8000000000000000",
  )
}

///|
test "StrMethod original 1536 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−0X8000000000000000",
  )
}

///|
test "StrMethod original 1537 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9_223_372_036_854_775_808",
  )
}

///|
test "StrMethod original 1538 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9,223,372,036,854,775,808",
  )
}

///|
test "StrMethod original 1539 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−8000_0000_0000_0000",
  )
}

///|
test "StrMethod original 1540 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−1000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000",
  )
}

///|
test "StrMethod original 1541 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:020,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9,223,372,036,854,775,808",
  )
}

///|
test "StrMethod original 1542 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+#024_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−0x0_8000_0000_0000_0000",
  )
}

///|
test "StrMethod original 1543 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^#30_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−0b1000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000",
  )
}

///|
test "StrMethod original 1544 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:c}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-9223372036854775808L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 1545 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9223372036854775808",
  )
}

///|
test "StrMethod original 1546 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2e}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9.22e+18",
  )
}

///|
test "StrMethod original 1547 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9.22337e+18",
  )
}

///|
test "StrMethod original 1548 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:z}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-9223372036854775808L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1549 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.2f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9223372036854775808.00",
  )
}

///|
test "StrMethod original 1550 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.2d}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-9223372036854775808L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1551 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "−9223372036854775808",
  )
}

///|
test "StrMethod original 1552 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "np.int64(−9223372036854775808)",
  )
}

///|
test "StrMethod original 1553 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "np.int64(−9223372036854775808)",
  )
}

///|
test "StrMethod original 1554 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "np.int64(−9223372036854775808)",
  )
}

///|
test "StrMethod original 1555 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1556 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.numerator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "np.int64(−9223372036854775808)",
  )
}

///|
test "StrMethod original 1557 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.denominator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1558 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9223372036854775808L]),
    )[0],
    "i",
  )
}

///|
test "StrMethod original 1559 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9007199254740993",
  )
}

///|
test "StrMethod original 1560 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9007199254740993",
  )
}

///|
test "StrMethod original 1561 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−100000000000000000000000000000000000000000000000000001",
  )
}

///|
test "StrMethod original 1562 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−400000000000000001",
  )
}

///|
test "StrMethod original 1563 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−20000000000001",
  )
}

///|
test "StrMethod original 1564 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−20000000000001",
  )
}

///|
test "StrMethod original 1565 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9007199254740993",
  )
}

///|
test "StrMethod original 1566 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−0b100000000000000000000000000000000000000000000000000001",
  )
}

///|
test "StrMethod original 1567 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−0o400000000000000001",
  )
}

///|
test "StrMethod original 1568 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−0x20000000000001",
  )
}

///|
test "StrMethod original 1569 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−0X20000000000001",
  )
}

///|
test "StrMethod original 1570 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9_007_199_254_740_993",
  )
}

///|
test "StrMethod original 1571 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9,007,199,254,740,993",
  )
}

///|
test "StrMethod original 1572 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−20_0000_0000_0001",
  )
}

///|
test "StrMethod original 1573 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−10_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001",
  )
}

///|
test "StrMethod original 1574 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:020,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9,007,199,254,740,993",
  )
}

///|
test "StrMethod original 1575 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+#024_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−0x0_0020_0000_0000_0001",
  )
}

///|
test "StrMethod original 1576 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^#30_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−0b10_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001",
  )
}

///|
test "StrMethod original 1577 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:c}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-9007199254740993L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 1578 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9007199254740992",
  )
}

///|
test "StrMethod original 1579 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2e}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9.01e+15",
  )
}

///|
test "StrMethod original 1580 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9.0072e+15",
  )
}

///|
test "StrMethod original 1581 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:z}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-9007199254740993L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1582 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.2f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9007199254740992.00",
  )
}

///|
test "StrMethod original 1583 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.2d}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-9007199254740993L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1584 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "−9007199254740993",
  )
}

///|
test "StrMethod original 1585 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "np.int64(−9007199254740993)",
  )
}

///|
test "StrMethod original 1586 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "np.int64(−9007199254740993)",
  )
}

///|
test "StrMethod original 1587 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "np.int64(−9007199254740993)",
  )
}

///|
test "StrMethod original 1588 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1589 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.numerator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "np.int64(−9007199254740993)",
  )
}

///|
test "StrMethod original 1590 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.denominator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1591 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-9007199254740993L]),
    )[0],
    "i",
  )
}

///|
test "StrMethod original 1592 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1593 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1594 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1595 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1596 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1597 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1598 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1599 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−0b1",
  )
}

///|
test "StrMethod original 1600 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−0o1",
  )
}

///|
test "StrMethod original 1601 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−0x1",
  )
}

///|
test "StrMethod original 1602 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−0X1",
  )
}

///|
test "StrMethod original 1603 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1604 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1605 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1606 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1607 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:020,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−000,000,000,000,001",
  )
}

///|
test "StrMethod original 1608 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+#024_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−0x0_0000_0000_0000_0001",
  )
}

///|
test "StrMethod original 1609 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^#30_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "             −0b1             ",
  )
}

///|
test "StrMethod original 1610 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:c}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-1L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 1611 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1612 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2e}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1.00e+00",
  )
}

///|
test "StrMethod original 1613 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1614 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:z}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-1L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1615 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.2f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1.00",
  )
}

///|
test "StrMethod original 1616 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.2d}").format_ticks_view(
        @ticker.TickValues::from_int64_array([-1L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1617 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "−1",
  )
}

///|
test "StrMethod original 1618 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "np.int64(−1)",
  )
}

///|
test "StrMethod original 1619 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "np.int64(−1)",
  )
}

///|
test "StrMethod original 1620 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "np.int64(−1)",
  )
}

///|
test "StrMethod original 1621 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1622 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.numerator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "np.int64(−1)",
  )
}

///|
test "StrMethod original 1623 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.denominator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1624 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").format_ticks_view(
      @ticker.TickValues::from_int64_array([-1L]),
    )[0],
    "i",
  )
}

///|
test "StrMethod original 1625 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1626 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1627 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1628 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1629 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1630 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1631 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1632 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0b0",
  )
}

///|
test "StrMethod original 1633 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0o0",
  )
}

///|
test "StrMethod original 1634 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0x0",
  )
}

///|
test "StrMethod original 1635 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0X0",
  )
}

///|
test "StrMethod original 1636 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1637 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1638 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1639 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1640 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:020,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0,000,000,000,000,000",
  )
}

///|
test "StrMethod original 1641 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+#024_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "+0x0_0000_0000_0000_0000",
  )
}

///|
test "StrMethod original 1642 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^#30_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "             0b0              ",
  )
}

///|
test "StrMethod original 1643 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:c}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "\u0000",
  )
}

///|
test "StrMethod original 1644 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1645 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2e}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0.00e+00",
  )
}

///|
test "StrMethod original 1646 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1647 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:z}").format_ticks_view(
        @ticker.TickValues::from_int64_array([0L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1648 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.2f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0.00",
  )
}

///|
test "StrMethod original 1649 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.2d}").format_ticks_view(
        @ticker.TickValues::from_int64_array([0L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1650 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "0",
  )
}

///|
test "StrMethod original 1651 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1652 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1653 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1654 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1655 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.numerator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1656 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.denominator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1657 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").format_ticks_view(
      @ticker.TickValues::from_int64_array([0L]),
    )[0],
    "i",
  )
}

///|
test "StrMethod original 1658 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1659 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1660 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1661 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1662 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1663 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1664 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1665 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "0b1",
  )
}

///|
test "StrMethod original 1666 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "0o1",
  )
}

///|
test "StrMethod original 1667 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "0x1",
  )
}

///|
test "StrMethod original 1668 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "0X1",
  )
}

///|
test "StrMethod original 1669 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1670 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1671 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1672 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1673 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:020,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "0,000,000,000,000,001",
  )
}

///|
test "StrMethod original 1674 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+#024_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "+0x0_0000_0000_0000_0001",
  )
}

///|
test "StrMethod original 1675 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^#30_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "             0b1              ",
  )
}

///|
test "StrMethod original 1676 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:c}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "\u0001",
  )
}

///|
test "StrMethod original 1677 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1678 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2e}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1.00e+00",
  )
}

///|
test "StrMethod original 1679 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1680 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:z}").format_ticks_view(
        @ticker.TickValues::from_int64_array([1L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1681 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.2f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1.00",
  )
}

///|
test "StrMethod original 1682 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.2d}").format_ticks_view(
        @ticker.TickValues::from_int64_array([1L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1683 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1684 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "np.int64(1)",
  )
}

///|
test "StrMethod original 1685 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "np.int64(1)",
  )
}

///|
test "StrMethod original 1686 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "np.int64(1)",
  )
}

///|
test "StrMethod original 1687 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1688 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.numerator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "np.int64(1)",
  )
}

///|
test "StrMethod original 1689 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.denominator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1690 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").format_ticks_view(
      @ticker.TickValues::from_int64_array([1L]),
    )[0],
    "i",
  )
}

///|
test "StrMethod original 1691 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9007199254740993",
  )
}

///|
test "StrMethod original 1692 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9007199254740993",
  )
}

///|
test "StrMethod original 1693 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "100000000000000000000000000000000000000000000000000001",
  )
}

///|
test "StrMethod original 1694 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "400000000000000001",
  )
}

///|
test "StrMethod original 1695 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "20000000000001",
  )
}

///|
test "StrMethod original 1696 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "20000000000001",
  )
}

///|
test "StrMethod original 1697 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9007199254740993",
  )
}

///|
test "StrMethod original 1698 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "0b100000000000000000000000000000000000000000000000000001",
  )
}

///|
test "StrMethod original 1699 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "0o400000000000000001",
  )
}

///|
test "StrMethod original 1700 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "0x20000000000001",
  )
}

///|
test "StrMethod original 1701 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "0X20000000000001",
  )
}

///|
test "StrMethod original 1702 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9_007_199_254_740_993",
  )
}

///|
test "StrMethod original 1703 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9,007,199,254,740,993",
  )
}

///|
test "StrMethod original 1704 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "20_0000_0000_0001",
  )
}

///|
test "StrMethod original 1705 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "10_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001",
  )
}

///|
test "StrMethod original 1706 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:020,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9,007,199,254,740,993",
  )
}

///|
test "StrMethod original 1707 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+#024_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "+0x0_0020_0000_0000_0001",
  )
}

///|
test "StrMethod original 1708 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^#30_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "0b10_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0001",
  )
}

///|
test "StrMethod original 1709 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:c}").format_ticks_view(
        @ticker.TickValues::from_int64_array([9007199254740993L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 1710 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9007199254740992",
  )
}

///|
test "StrMethod original 1711 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2e}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9.01e+15",
  )
}

///|
test "StrMethod original 1712 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9.0072e+15",
  )
}

///|
test "StrMethod original 1713 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:z}").format_ticks_view(
        @ticker.TickValues::from_int64_array([9007199254740993L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1714 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.2f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9007199254740992.00",
  )
}

///|
test "StrMethod original 1715 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.2d}").format_ticks_view(
        @ticker.TickValues::from_int64_array([9007199254740993L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1716 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "9007199254740993",
  )
}

///|
test "StrMethod original 1717 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "np.int64(9007199254740993)",
  )
}

///|
test "StrMethod original 1718 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "np.int64(9007199254740993)",
  )
}

///|
test "StrMethod original 1719 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "np.int64(9007199254740993)",
  )
}

///|
test "StrMethod original 1720 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1721 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.numerator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "np.int64(9007199254740993)",
  )
}

///|
test "StrMethod original 1722 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.denominator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1723 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9007199254740993L]),
    )[0],
    "i",
  )
}

///|
test "StrMethod original 1724 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9223372036854775807",
  )
}

///|
test "StrMethod original 1725 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9223372036854775807",
  )
}

///|
test "StrMethod original 1726 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "111111111111111111111111111111111111111111111111111111111111111",
  )
}

///|
test "StrMethod original 1727 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "777777777777777777777",
  )
}

///|
test "StrMethod original 1728 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "7fffffffffffffff",
  )
}

///|
test "StrMethod original 1729 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "7FFFFFFFFFFFFFFF",
  )
}

///|
test "StrMethod original 1730 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:n}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9223372036854775807",
  )
}

///|
test "StrMethod original 1731 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "0b111111111111111111111111111111111111111111111111111111111111111",
  )
}

///|
test "StrMethod original 1732 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#o}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "0o777777777777777777777",
  )
}

///|
test "StrMethod original 1733 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "0x7fffffffffffffff",
  )
}

///|
test "StrMethod original 1734 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:#X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "0X7FFFFFFFFFFFFFFF",
  )
}

///|
test "StrMethod original 1735 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9_223_372_036_854_775_807",
  )
}

///|
test "StrMethod original 1736 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9,223,372,036,854,775,807",
  )
}

///|
test "StrMethod original 1737 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "7fff_ffff_ffff_ffff",
  )
}

///|
test "StrMethod original 1738 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111",
  )
}

///|
test "StrMethod original 1739 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:020,d}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9,223,372,036,854,775,807",
  )
}

///|
test "StrMethod original 1740 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:+#024_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "+0x0_7fff_ffff_ffff_ffff",
  )
}

///|
test "StrMethod original 1741 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:^#30_b}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "0b111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111",
  )
}

///|
test "StrMethod original 1742 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:c}").format_ticks_view(
        @ticker.TickValues::from_int64_array([9223372036854775807L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "OverflowError: %c arg not in range(0x110000)")
}

///|
test "StrMethod original 1743 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.0f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9223372036854775808",
  )
}

///|
test "StrMethod original 1744 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:.2e}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9.22e+18",
  )
}

///|
test "StrMethod original 1745 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:g}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9.22337e+18",
  )
}

///|
test "StrMethod original 1746 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:z}").format_ticks_view(
        @ticker.TickValues::from_int64_array([9223372036854775807L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Negative zero coercion (z) not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1747 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:z.2f}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9223372036854775808.00",
  )
}

///|
test "StrMethod original 1748 exact Int64 ndarray numeric domain" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:.2d}").format_ticks_view(
        @ticker.TickValues::from_int64_array([9223372036854775807L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Precision not allowed in integer format specifier",
  )
}

///|
test "StrMethod original 1749 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "9223372036854775807",
  )
}

///|
test "StrMethod original 1750 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "np.int64(9223372036854775807)",
  )
}

///|
test "StrMethod original 1751 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "np.int64(9223372036854775807)",
  )
}

///|
test "StrMethod original 1752 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.real!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "np.int64(9223372036854775807)",
  )
}

///|
test "StrMethod original 1753 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.imag!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "np.int64(0)",
  )
}

///|
test "StrMethod original 1754 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.numerator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "np.int64(9223372036854775807)",
  )
}

///|
test "StrMethod original 1755 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.denominator!r}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "1",
  )
}

///|
test "StrMethod original 1756 exact Int64 ndarray conversion attributes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[0]}").format_ticks_view(
      @ticker.TickValues::from_int64_array([9223372036854775807L]),
    )[0],
    "i",
  )
}

///|
test "StrMethod original 1757 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:8.2f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1758 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[1]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1759 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:٨.٢f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1760 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[١]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1761 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:۸.۲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1762 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[۱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1763 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:߈.߂f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1764 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[߁]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1765 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:८.२f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1766 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[१]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1767 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:৮.২f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1768 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[১]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1769 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:੮.੨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1770 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[੧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1771 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:૮.૨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1772 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[૧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1773 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:୮.୨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1774 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[୧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1775 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:௮.௨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1776 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[௧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1777 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:౮.౨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1778 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[౧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1779 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:೮.೨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1780 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[೧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1781 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:൮.൨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1782 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[൧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1783 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:෮.෨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1784 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[෧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1785 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:๘.๒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1786 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[๑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1787 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:໘.໒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1788 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[໑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1789 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:༨.༢f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1790 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[༡]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1791 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:၈.၂f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1792 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[၁]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1793 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:႘.႒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1794 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[႑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1795 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:៨.២f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1796 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[១]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1797 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᠘.᠒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1798 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᠑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1799 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᥎.᥈f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1800 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᥇]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1801 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᧘.᧒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1802 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᧑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1803 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᪈.᪂f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1804 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᪁]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1805 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᪘.᪒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1806 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᪑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1807 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᭘.᭒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1808 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᭑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1809 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᮸.᮲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1810 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᮱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1811 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᱈.᱂f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1812 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᱁]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1813 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:᱘.᱒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1814 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[᱑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1815 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:꘨.꘢f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1816 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[꘡]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1817 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:꣘.꣒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1818 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[꣑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1819 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:꤈.꤂f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1820 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[꤁]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1821 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:꧘.꧒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1822 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[꧑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1823 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:꧸.꧲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1824 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[꧱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1825 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:꩘.꩒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1826 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[꩑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1827 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:꯸.꯲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1828 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[꯱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1829 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:８.２f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1830 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[１]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1831 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𐒨.𐒢f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1832 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𐒡]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1833 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𐴸.𐴲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1834 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𐴱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1835 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑁮.𑁨f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1836 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑁧]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1837 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑃸.𑃲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1838 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑃱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1839 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑄾.𑄸f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1840 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑄷]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1841 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑇘.𑇒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1842 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑇑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1843 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑋸.𑋲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1844 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑋱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1845 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑑘.𑑒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1846 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑑑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1847 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑓘.𑓒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1848 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑓑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1849 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑙘.𑙒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1850 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑙑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1851 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑛈.𑛂f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1852 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑛁]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1853 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑜸.𑜲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1854 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑜱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1855 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑣨.𑣢f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1856 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑣡]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1857 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑥘.𑥒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1858 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑥑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1859 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑱘.𑱒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1860 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑱑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1861 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑵘.𑵒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1862 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑵑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1863 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑶨.𑶢f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1864 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑶡]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1865 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𑽘.𑽒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1866 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𑽑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1867 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𖩨.𖩢f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1868 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𖩡]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1869 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𖫈.𖫂f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1870 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𖫁]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1871 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𖭘.𖭒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1872 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𖭑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1873 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𝟖.𝟐f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1874 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𝟏]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1875 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𝟠.𝟚f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1876 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𝟙]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1877 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𝟪.𝟤f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1878 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𝟣]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1879 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𝟴.𝟮f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1880 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𝟭]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1881 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𝟾.𝟸f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1882 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𝟷]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1883 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𞅈.𞅂f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1884 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𞅁]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1885 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𞋸.𞋲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1886 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𞋱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1887 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𞓸.𞓲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1888 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𞓱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1889 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:𞥘.𞥒f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1890 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[𞥑]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1891 Unicode15 Nd width precision" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🯸.🯲f}").call(1.25, pos=3),
    "    1.25",
  )
}

///|
test "StrMethod original 1892 Unicode15 Nd string index" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x.__class__.__name__[🯱]}").call(
      1.25,
      pos=3,
    ),
    "l",
  )
}

///|
test "StrMethod original 1893 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("- literal {x} - {pos}").call(-12.0, pos=45),
    "- literal -12.0 - 45",
  )
}

///|
test "StrMethod original 1894 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("- literal {x} - {pos}").call(-12.0, pos=45),
    "- literal −12.0 - 45",
  )
}

///|
test "StrMethod original 1895 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{{-x}}:{x}").call(-12.0, pos=45),
    "{-x}:-12.0",
  )
}

///|
test "StrMethod original 1896 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{{-x}}:{x}").call(-12.0, pos=45),
    "{-x}:−12.0",
  )
}

///|
test "StrMethod original 1897 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:-^12}").call(-12.0, pos=45),
    "----12.0----",
  )
}

///|
test "StrMethod original 1898 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!s:-^12}").call(-12.0, pos=45),
    "−−−−12.0−−−−",
  )
}

///|
test "StrMethod original 1899 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-<12}").call(-12.0, pos=45),
    "-12.0-------",
  )
}

///|
test "StrMethod original 1900 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!r:-<12}").call(-12.0, pos=45),
    "−12.0−−−−−−−",
  )
}

///|
test "StrMethod original 1901 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:->12}").call(-12.0, pos=45),
    "--------12.0",
  )
}

///|
test "StrMethod original 1902 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x!a:->12}").call(-12.0, pos=45),
    "−−−−−−−−12.0",
  )
}

///|
test "StrMethod original 1903 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:-^12}").call(-12.0, pos=45),
    "-----45-----",
  )
}

///|
test "StrMethod original 1904 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos!s:-^12}").call(-12.0, pos=45),
    "−−−−−45−−−−−",
  )
}

///|
test "StrMethod original 1905 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:-^12.2f}").call(-12.0, pos=45),
    "----12.00---",
  )
}

///|
test "StrMethod original 1906 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:-^12.2f}").call(-12.0, pos=45),
    "−−−−12.00−−−",
  )
}

///|
test "StrMethod original 1907 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^12.2f}").call(-12.0, pos=45),
    "🐍🐍🐍-12.00🐍🐍🐍",
  )
}

///|
test "StrMethod original 1908 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:🐍^12.2f}").call(-12.0, pos=45),
    "🐍🐍🐍−12.00🐍🐍🐍",
  )
}

///|
test "StrMethod original 1909 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(false)
  assert_eq(@ticker.StrMethodFormatter::new("{pos:c}").call(-12.0, pos=45), "-")
}

///|
test "StrMethod original 1910 minus only in completed fields" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{pos:c}").call(-12.0, pos=45),
    "−",
  )
}

///|
test "StrMethod original 1911 native decimal-prefix overflow order" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{999999999999999999999999999999x}").call(
        1.25,
        pos=3,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Too many decimal digits in format string")
}

///|
test "StrMethod original 1912 native decimal-prefix overflow order" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new(
        "{x.__class__.__name__[999999999999999999999999999999x]}",
      ).call(1.25, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Too many decimal digits in format string")
}

///|
test "StrMethod original 1913 native decimal-prefix overflow order" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{999999999999999999999999999999²}").call(
        1.25,
        pos=3,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Too many decimal digits in format string")
}

///|
test "StrMethod original 1914 native decimal-prefix overflow order" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new(
        "{x.__class__.__name__[999999999999999999999999999999²]}",
      ).call(1.25, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Too many decimal digits in format string")
}

///|
test "StrMethod original 1915 native decimal-prefix overflow order" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{1x}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: '1x'")
}

///|
test "StrMethod original 1916 native decimal-prefix overflow order" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x.__class__.__name__[1x]}").call(
        1.25,
        pos=3,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: string indices must be integers, not 'str'")
}

///|
test "StrMethod original 1917 native decimal-prefix overflow order" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{1²}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: '1²'")
}

///|
test "StrMethod original 1918 native decimal-prefix overflow order" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x.__class__.__name__[1²]}").call(
        1.25,
        pos=3,
      ),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "TypeError: string indices must be integers, not 'str'")
}

///|
test "StrMethod original 1919 fixed Python Unicode15 printable error repr" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:͸f}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '͸f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1920 fixed Python Unicode15 printable error repr" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:Ᲊf}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier 'Ᲊf' for object of type 'float'",
  )
}

///|
test "StrMethod original 1921 fixed Python Unicode15 printable error repr" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:🫩f}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier '🫩f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1922 hex letter grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_x}").format_ticks_view(
      @ticker.TickValues::from_int64_array([11259375L]),
    )[0],
    "ab_cdef",
  )
}

///|
test "StrMethod original 1923 hex letter grouping" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_X}").format_ticks_view(
      @ticker.TickValues::from_int64_array([11259375L]),
    )[0],
    "AB_CDEF",
  )
}

///|
test "StrMethod original 1924 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:\u0000}").call(1.25, pos=3),
    "1.25",
  )
}

///|
test "StrMethod original 1925 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:\u0000}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x0' for object of type 'int'",
  )
}

///|
test "StrMethod original 1926 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:\u0000}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x0' for object of type 'str'",
  )
}

///|
test "StrMethod original 1927 Int64 explicit type and native error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:\u0000}").format_ticks_view(
        @ticker.TickValues::from_int64_array([3L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x0' for object of type 'int'",
  )
}

///|
test "StrMethod original 1928 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:\n}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\xa' for object of type 'float'",
  )
}

///|
test "StrMethod original 1929 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:\n}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\xa' for object of type 'int'",
  )
}

///|
test "StrMethod original 1930 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:\n}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\xa' for object of type 'str'",
  )
}

///|
test "StrMethod original 1931 Int64 explicit type and native error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:\n}").format_ticks_view(
        @ticker.TickValues::from_int64_array([3L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\xa' for object of type 'int'",
  )
}

///|
test "StrMethod original 1932 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:\t}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x9' for object of type 'float'",
  )
}

///|
test "StrMethod original 1933 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:\t}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x9' for object of type 'int'",
  )
}

///|
test "StrMethod original 1934 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:\t}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x9' for object of type 'str'",
  )
}

///|
test "StrMethod original 1935 Int64 explicit type and native error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:\t}").format_ticks_view(
        @ticker.TickValues::from_int64_array([3L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x9' for object of type 'int'",
  )
}

///|
test "StrMethod original 1936 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:é}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\xe9' for object of type 'float'",
  )
}

///|
test "StrMethod original 1937 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:é}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\xe9' for object of type 'int'",
  )
}

///|
test "StrMethod original 1938 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:é}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\xe9' for object of type 'str'",
  )
}

///|
test "StrMethod original 1939 Int64 explicit type and native error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:é}").format_ticks_view(
        @ticker.TickValues::from_int64_array([3L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\xe9' for object of type 'int'",
  )
}

///|
test "StrMethod original 1940 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:🐍}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x1f40d' for object of type 'float'",
  )
}

///|
test "StrMethod original 1941 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:🐍}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x1f40d' for object of type 'int'",
  )
}

///|
test "StrMethod original 1942 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:🐍}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x1f40d' for object of type 'str'",
  )
}

///|
test "StrMethod original 1943 Int64 explicit type and native error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:🐍}").format_ticks_view(
        @ticker.TickValues::from_int64_array([3L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x1f40d' for object of type 'int'",
  )
}

///|
test "StrMethod original 1944 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:\u001f}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x1f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1945 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:\u001f}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x1f' for object of type 'int'",
  )
}

///|
test "StrMethod original 1946 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:\u001f}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x1f' for object of type 'str'",
  )
}

///|
test "StrMethod original 1947 Int64 explicit type and native error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:\u001f}").format_ticks_view(
        @ticker.TickValues::from_int64_array([3L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x1f' for object of type 'int'",
  )
}

///|
test "StrMethod original 1948 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '' for object of type 'float'",
  )
}

///|
test "StrMethod original 1949 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '' for object of type 'int'",
  )
}

///|
test "StrMethod original 1950 explicit type and native error code escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '' for object of type 'str'",
  )
}

///|
test "StrMethod original 1951 Int64 explicit type and native error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:}").format_ticks_view(
        @ticker.TickValues::from_int64_array([3L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '' for object of type 'int'",
  )
}

///|
test "StrMethod original 1952 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,é}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with '\\xe9'.")
}

///|
test "StrMethod original 1953 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:,é}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with '\\xe9'.")
}

///|
test "StrMethod original 1954 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:,é}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with '\\xe9'.")
}

///|
test "StrMethod original 1955 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:,\n}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with '\\xa'.")
}

///|
test "StrMethod original 1956 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:,\n}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with '\\xa'.")
}

///|
test "StrMethod original 1957 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:,\n}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify ',' with '\\xa'.")
}

///|
test "StrMethod original 1958 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:_🐍}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify '_' with '\\x1f40d'.")
}

///|
test "StrMethod original 1959 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:_🐍}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify '_' with '\\x1f40d'.")
}

///|
test "StrMethod original 1960 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:_🐍}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "ValueError: Cannot specify '_' with '\\x1f40d'.")
}

///|
test "StrMethod original 1961 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:,\u0000}").call(1.25, pos=3),
    "1.25",
  )
}

///|
test "StrMethod original 1962 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:,\u0000}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x0' for object of type 'int'",
  )
}

///|
test "StrMethod original 1963 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:,\u0000}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x0' for object of type 'str'",
  )
}

///|
test "StrMethod original 1964 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  assert_eq(
    @ticker.StrMethodFormatter::new("{x:_\u0000}").call(1.25, pos=3),
    "1.25",
  )
}

///|
test "StrMethod original 1965 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:_\u0000}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x0' for object of type 'int'",
  )
}

///|
test "StrMethod original 1966 native grouping code error escapes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:_\u0000}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Unknown format code '\\x0' for object of type 'str'",
  )
}

///|
test "StrMethod original 1967 unknown field uses real Python repr" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{͸}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: '\\u0378'")
}

///|
test "StrMethod original 1968 unknown field uses real Python repr" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{Ᲊ}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: '\\u1c89'")
}

///|
test "StrMethod original 1969 unknown field uses real Python repr" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{🫩}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "KeyError: '\\U0001fae9'")
}

///|
test "StrMethod original 1970 invalid specification uses raw single quotes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x:'f}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier ''f' for object of type 'float'",
  )
}

///|
test "StrMethod original 1971 invalid specification uses raw single quotes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:'f}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier ''f' for object of type 'int'",
  )
}

///|
test "StrMethod original 1972 invalid specification uses raw single quotes" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x!s:'f}").call(1.25, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "ValueError: Invalid format specifier ''f' for object of type 'str'",
  )
}

///|
test "StrMethod explicit boundary 1" {
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x.foo}").call(1.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "Unsupported: dynamic attribute 'foo' on float")
}

///|
test "StrMethod explicit boundary 2" {
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{x.__doc__}").call(1.0, pos=3))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "Unsupported: dynamic attribute '__doc__' on float")
}

///|
test "StrMethod explicit boundary 3" {
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x.as_integer_ratio}").call(1.0, pos=3),
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "Unsupported: dynamic attribute 'as_integer_ratio' on float",
  )
}

///|
test "StrMethod explicit boundary 4" {
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x.dtype}").format_ticks_view(
        @ticker.TickValues::from_array([1.0]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(result, "Unsupported: dynamic attribute 'dtype' on float64")
}

///|
test "StrMethod explicit boundary 5" {
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:c}").call(1.0, pos=55296))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "Unsupported: unpaired surrogate output cannot be represented portably",
  )
}

///|
test "StrMethod explicit boundary 6" {
  let result = try {
    ignore(@ticker.StrMethodFormatter::new("{pos:c}").call(1.0, pos=57343))
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "Unsupported: unpaired surrogate output cannot be represented portably",
  )
}

///|
test "StrMethod explicit boundary 7" {
  let result = try {
    ignore(
      @ticker.StrMethodFormatter::new("{x:c}").format_ticks_view(
        @ticker.TickValues::from_int64_array([55296L]),
      )[0],
    )
    "unexpected success"
  } catch {
    @core.DataError::InvalidTicks(message~) => message
    _ => "unexpected error"
  }
  assert_eq(
    result, "Unsupported: unpaired surrogate output cannot be represented portably",
  )
}

///|
test "StrMethod actual retained ndarray view 1" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let view = @ticker.TickValues::from_array([1.0, -0.0, 2.675, 0.0 / 0.0]).view(
    3, -1, 4,
  )
  let formatter = @ticker.StrMethodFormatter::new("{x!r}={pos}")
  assert_eq(formatter.format_ticks_view(view), [
    "np.float64(nan)=0", "np.float64(2.675)=1", "np.float64(−0.0)=2", "np.float64(1.0)=3",
  ])
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(view, retained))
    _ => fail("missing view")
  }
}

///|
test "StrMethod actual retained ndarray view 2" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let view = @ticker.TickValues::from_int64_array([
    9007199254740993L, -9223372036854775808L, 0L,
  ]).view(2, -1, 3)
  let formatter = @ticker.StrMethodFormatter::new("{x!r}={pos}")
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(0)=0", "np.int64(−9223372036854775808)=1", "np.int64(9007199254740993)=2",
  ])
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(view, retained))
    _ => fail("missing view")
  }
}

///|
test "StrMethod actual retained ndarray view 3" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let view = @ticker.TickValues::from_int64_array([9007199254740993L]).view(
    0, 0, 4,
  )
  let formatter = @ticker.StrMethodFormatter::new("{x!r}={pos}")
  assert_eq(formatter.format_ticks_view(view), [
    "np.int64(9007199254740993)=0", "np.int64(9007199254740993)=1", "np.int64(9007199254740993)=2",
    "np.int64(9007199254740993)=3",
  ])
  match formatter.locations() {
    NdArray(retained) => assert_true(physical_equal(view, retained))
    _ => fail("missing view")
  }
}

///|
test "StrMethod actual full125001 Int64 transport" {
  let saved = @config.unicode_minus()
  defer @config.set_unicode_minus(saved)
  @config.set_unicode_minus(true)
  let values = @ticker.TickValues::from_int64_array(
    Array::make(125001, 9007199254740993L),
  )
  let formatter = @ticker.StrMethodFormatter::new("{x!r}={pos}")
  let labels = formatter.format_ticks_view(values)
  assert_eq(labels.length(), 125001)
  assert_eq([labels[0], labels[99999], labels[100000], labels[125000]], [
    "np.int64(9007199254740993)=0", "np.int64(9007199254740993)=99999", "np.int64(9007199254740993)=100000",
    "np.int64(9007199254740993)=125000",
  ])
  assert_eq(formatter.locations().length(), 125001)
}
