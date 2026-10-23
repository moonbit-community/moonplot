// Complete pinned original class AST and actual CPython percent operator.

///|
test "FormatStr original scalar 0 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("plain")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%%")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 3 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%%%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "%1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 4 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g%%")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25%")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 5 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%% %g %%")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "% 1.25 %")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 6 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %g")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 7 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 8 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 9 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%q %g")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 10 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 11 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %*f")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 12 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %(x)f")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 13 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %(x)")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 14 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %5%")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 15 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 16 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%(")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 17 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 18 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)f")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 19 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 20 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%()s")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 21 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%((x))f")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 22 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 23 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 24 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%*q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 25 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.*q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 26 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%5%")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 27 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#%")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 28 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%1.2%")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 4"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 29 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 30 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 31 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.-2f")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '-' (0x2d) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 32 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%lf")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 33 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%hf")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 34 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%Lf")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 35 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%llf")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 36 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%hhf")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'h' (0x68) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 37 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%zf")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'z' (0x7a) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 38 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%5.2lf")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 39 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 40 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 41 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 42 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 43 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 44 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 45 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 46 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %o format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 47 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 48 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %X format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 49 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%b")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'b' (0x62) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 50 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%n")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'n' (0x6e) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 51 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%010s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "      1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 52 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 53 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 54 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 10s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "      1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 55 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.3s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 56 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 57 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-010.3a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 58 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%05.3d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00001")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 59 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 60 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 61 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+ #12.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 62 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%10.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "         1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 63 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 64 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 65 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("😀%q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 66 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%😀")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 67 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%é")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xe9) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 68 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%\n")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 69 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%\u{0000}")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 70 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 71 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%00")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 72 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%5")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 73 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 74 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.2")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 75 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%l")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 76 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %.2147483648q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 77 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%9223372036854775807q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 20"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 78 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%9223372036854775808q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 79 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.2147483647q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 12"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 80 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.2147483648q")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 81 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%2147483648x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 82 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%2147483648c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 83 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new(
    "%999999999999999999999999999f",
  )
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 84 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new(
    "%.999999999999999999999999999f",
  )
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.25, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 85 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), [""])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 86 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("plain")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["plain"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 87 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["%"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 88 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%%%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["%1.25"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 89 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g%%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.25%"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 90 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%% %g %%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["% 1.25 %"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 91 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 92 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 93 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 94 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%q %g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 95 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 96 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 97 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %(x)f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 98 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %(x)")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 99 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %5%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 100 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 101 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%(")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format key"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 102 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 103 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 104 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 105 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%()s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 106 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%((x))f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 107 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 108 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 109 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%*q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 110 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 111 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%5%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 112 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 113 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%1.2%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 4"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 114 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 115 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 116 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.-2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '-' (0x2d) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 117 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%lf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.250000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 118 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%hf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.250000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 119 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%Lf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.250000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 120 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%llf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 121 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%hhf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'h' (0x68) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 122 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%zf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'z' (0x7a) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 123 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%5.2lf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), [" 1.25"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 124 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.25"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 125 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1.25)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 126 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1.25)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 127 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 128 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 129 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 130 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 131 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %o format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 132 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 133 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %X format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 134 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%b")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'b' (0x62) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 135 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%n")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'n' (0x6e) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 136 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%010s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["      1.25"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 137 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.25"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 138 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.25"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 139 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% 10s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["      1.25"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 140 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.3s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.2"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 141 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), [""])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 142 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%-010.3a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["np.       "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 143 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%05.3d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["00001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 144 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 145 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["+1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 146 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+ #12.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["+1.         "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 147 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%10.0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["         1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 148 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1.e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 149 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_eq(formatter.format_ticks_view(values), ["1."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 150 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("😀%q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 151 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%😀")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 152 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%é")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xe9) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 153 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%\n")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 154 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%\u{0000}")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 155 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%0")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 156 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%00")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 157 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%5")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 158 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 159 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.2")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 160 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%l")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 161 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %.2147483648q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 162 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%9223372036854775807q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 20"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 163 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%9223372036854775808q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 164 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.2147483647q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 12"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 165 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%.2147483648q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 166 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%2147483648x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 167 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%2147483648c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 168 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new(
    "%999999999999999999999999999f",
  )
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 169 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new(
    "%.999999999999999999999999999f",
  )
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.25])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 170 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), [""])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 171 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("plain")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["plain"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 172 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["%"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 173 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%%%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["%65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 174 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g%%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65%"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 175 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%% %g %%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["% 65 %"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 176 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 177 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 178 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 179 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%q %g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 180 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 181 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 182 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %(x)f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 183 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %(x)")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 184 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %5%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 185 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 186 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%(")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format key"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 187 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 188 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 189 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%(x)q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 190 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%()s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 191 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%((x))f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 192 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 193 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 194 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 195 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 196 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%5%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 197 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 198 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%1.2%")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 4"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 199 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 200 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 201 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.-2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '-' (0x2d) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 202 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%lf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 203 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%hf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 204 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%Lf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 205 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%llf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 206 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%hhf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'h' (0x68) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 207 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%zf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'z' (0x7a) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 208 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%5.2lf")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 209 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 210 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(65)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 211 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(65)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 212 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["A"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 213 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 214 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 215 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 216 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["101"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 217 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["41"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 218 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["41"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 219 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%b")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'b' (0x62) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 220 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%n")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'n' (0x6e) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 221 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%010s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["        65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 222 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 223 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 224 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("% 10s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["        65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 225 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.3s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 226 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), [""])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 227 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-010.3a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["np.       "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 228 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%05.3d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["00065"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 229 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 230 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["+65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 231 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+ #12.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["+6.e+01     "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 232 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%10.0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["        65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 233 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["6.e+01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 234 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["6.e+01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 235 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("😀%q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 236 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%😀")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 237 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%é")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xe9) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 238 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%\n")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 239 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%\u{0000}")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 240 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%0")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 241 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%00")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 242 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%5")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 243 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 244 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.2")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 245 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%l")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 246 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %.2147483648q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 247 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%9223372036854775807q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 20"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 248 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%9223372036854775808q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 249 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.2147483647q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 12"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 250 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.2147483648q")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 251 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new(
    "%999999999999999999999999999f",
  )
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 252 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new(
    "%.999999999999999999999999999f",
  )
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 253 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 254 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 255 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 256 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 257 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 258 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 259 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 260 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 261 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 262 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 263 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 264 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 265 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 266 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 267 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "+000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 268 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), " 0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 269 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0, pos=-7), "0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 270 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 271 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 272 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 273 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 274 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 275 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 276 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 277 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 278 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 279 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 280 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 281 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 282 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 283 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 284 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 285 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 286 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 287 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 288 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 289 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 290 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 291 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 292 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 293 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 294 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 295 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 296 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 297 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 298 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 299 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 300 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 301 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 302 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 303 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 304 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 305 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 306 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 307 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 308 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 309 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 310 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 311 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 312 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 313 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 314 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 315 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 316 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 317 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 318 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 319 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 320 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 321 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 322 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 323 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 324 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 325 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 326 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 327 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 328 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 329 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 330 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 331 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 332 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 333 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 334 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-1.0 / 0.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 335 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 336 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 337 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.0 / 0.0, pos=-7), "-inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 338 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "4.94066e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 339 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 340 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "4.940656e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 341 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "4.94066E-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 342 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 343 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "4.940656E-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 344 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "5e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 345 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "5e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 346 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "5e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 347 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 348 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 349 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 350 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(5.0e-324, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 351 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(5.0e-324, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 352 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "+000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 353 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), " 0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 354 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(5.0e-324, pos=-7), "5.e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 355 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-4.94066e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 356 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 357 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-4.940656e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 358 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-4.94066E-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 359 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 360 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-4.940656E-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 361 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-5e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 362 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-5e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 363 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-5e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 364 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 365 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 366 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 367 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-5.0e-324, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 368 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-5.0e-324, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 369 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 370 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 371 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-5.0e-324, pos=-7), "-5.e-324")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 372 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.7976931348623157e+308, pos=-7), "1.79769e+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 373 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 374 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.7976931348623157e+308, pos=-7), "1.797693e+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 375 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.7976931348623157e+308, pos=-7), "1.79769E+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 376 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 377 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.7976931348623157e+308, pos=-7), "1.797693E+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 378 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "1.7976931348623157e+308",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 379 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "1.7976931348623157e+308",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 380 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "1.7976931348623157e+308",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 381 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 382 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 383 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 384 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.7976931348623157e+308, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 385 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.7976931348623157e+308, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 386 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "+179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 387 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    " 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 388 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.7976931348623157e+308, pos=-7), "2.e+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 389 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.7976931348623157e+308, pos=-7), "-1.79769e+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 390 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 391 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.7976931348623157e+308, pos=-7), "-1.797693e+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 392 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.7976931348623157e+308, pos=-7), "-1.79769E+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 393 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 394 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.7976931348623157e+308, pos=-7), "-1.797693E+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 395 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-1.7976931348623157e+308",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 396 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-1.7976931348623157e+308",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 397 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-1.7976931348623157e+308",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 398 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 399 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 400 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 401 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-1.7976931348623157e+308, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 402 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-1.7976931348623157e+308, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 403 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 404 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(-1.7976931348623157e+308, pos=-7),
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 405 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-1.7976931348623157e+308, pos=-7), "-2.e+308")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 406 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 407 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 408 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 409 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 410 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 411 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 412 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 413 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 414 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2.675")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 415 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 416 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 417 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 418 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(2.675, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 419 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(2.675, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 420 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "+000002.67")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 421 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), " 3")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 422 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.675, pos=-7), "3.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 423 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 424 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 425 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 426 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 427 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 428 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 429 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 430 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 431 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.005")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 432 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 433 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 434 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 435 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.005, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 436 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.005, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 437 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "+000001.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 438 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 439 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.005, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 440 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 441 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.500000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 442 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.500000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 443 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 444 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.500000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 445 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.500000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 446 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 447 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 448 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 449 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 450 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 451 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 452 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(2.5, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 453 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(2.5, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 454 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "+000002.50")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 455 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), " 2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 456 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(2.5, pos=-7), "2.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 457 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 458 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.500000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 459 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.500000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 460 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 461 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.500000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 462 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.500000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 463 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 464 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 465 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 466 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 467 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 468 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "3")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 469 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(3.5, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 470 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(3.5, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 471 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "+000003.50")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 472 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), " 4")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 473 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(3.5, pos=-7), "4.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 474 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 475 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0.500000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 476 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-5.000000e-01")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 477 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 478 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0.500000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 479 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-5.000000E-01")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 480 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 481 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 482 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 483 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 484 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 485 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 486 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.5, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 487 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.5, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 488 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-000000.50")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 489 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 490 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.5, pos=-7), "-0.5")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 491 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-0.999")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 492 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-0.999000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 493 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-9.990000e-01")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 494 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-0.999")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 495 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-0.999000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 496 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-9.990000E-01")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 497 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-0.999")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 498 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-0.999")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 499 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-0.999")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 500 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 501 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 502 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 503 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.999, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 504 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(-0.999, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 505 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-000001.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 506 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 507 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.999, pos=-7), "-1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 508 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "1e-05")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 509 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "0.000010")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 510 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "1.000000e-05")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 511 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "1E-05")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 512 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "0.000010")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 513 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "1.000000E-05")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 514 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "1e-05")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 515 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "1e-05")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 516 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "1e-05")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 517 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 518 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 519 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 520 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0e-05, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 521 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0e-05, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 522 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "+000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 523 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), " 0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 524 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e-05, pos=-7), "1.e-05")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 525 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0.0001")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 526 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0.000100")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 527 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "1.000000e-04")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 528 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0.0001")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 529 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0.000100")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 530 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "1.000000E-04")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 531 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0.0001")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 532 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0.0001")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 533 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0.0001")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 534 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 535 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 536 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 537 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0001, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 538 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.0001, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 539 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "+000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 540 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), " 0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 541 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0001, pos=-7), "0.0001")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 542 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1e+15")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 543 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1000000000000000.0, pos=-7),
    "1000000000000000.000000",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 544 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1.000000e+15")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 545 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1E+15")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 546 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1000000000000000.0, pos=-7),
    "1000000000000000.000000",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 547 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1.000000E+15")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 548 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1000000000000000.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 549 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1000000000000000.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 550 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1000000000000000.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 551 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 552 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 553 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 554 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1000000000000000.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 555 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1000000000000000.0, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 556 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "+1000000000000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 557 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), " 1000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 558 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1000000000000000.0, pos=-7), "1.e+15")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 559 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "1e+16")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 560 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "10000000000000000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 561 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "1.000000e+16")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 562 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "1E+16")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 563 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "10000000000000000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 564 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "1.000000E+16")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 565 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "1e+16")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 566 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "1e+16")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 567 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "1e+16")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 568 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "10000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 569 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "10000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 570 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "10000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 571 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0e+16, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 572 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0e+16, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 573 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "+10000000000000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 574 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), " 10000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 575 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+16, pos=-7), "1.e+16")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 576 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "1e+20")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 577 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "100000000000000000000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 578 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "1.000000e+20")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 579 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "1E+20")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 580 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "100000000000000000000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 581 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "1.000000E+20")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 582 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "1e+20")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 583 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "1e+20")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 584 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "1e+20")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 585 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "100000000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 586 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "100000000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 587 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "100000000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 588 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0e+20, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 589 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0e+20, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 590 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "+100000000000000000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 591 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), " 100000000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 592 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0e+20, pos=-7), "1.e+20")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 593 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 594 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "1.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 595 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "1.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 596 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 597 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "1.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 598 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "1.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 599 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "0.9999999999999999")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 600 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "0.9999999999999999")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 601 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "0.9999999999999999")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 602 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 603 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 604 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 605 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.9999999999999999, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 606 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(0.9999999999999999, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 607 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "+000001.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 608 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 609 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.9999999999999999, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 610 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 611 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 612 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 613 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 614 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 615 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 616 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1.0000000000000002")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 617 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1.0000000000000002")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 618 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1.0000000000000002")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 619 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 620 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 621 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 622 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0000000000000002, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %x format: an integer is required, not float"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 623 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.call(1.0000000000000002, pos=-7))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 624 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "+000001.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 625 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 626 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0000000000000002, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 627 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 628 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 629 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0.000000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 630 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 631 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 632 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0.000000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 633 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0.0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 634 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(0.0)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 635 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(0.0)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 636 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 637 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 638 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 639 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 640 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 641 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["+000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 642 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), [" 0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 643 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0])
  assert_eq(formatter.format_ticks_view(values), ["0."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 644 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 645 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 646 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0.000000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 647 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 648 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 649 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0.000000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 650 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0.0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 651 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-0.0)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 652 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-0.0)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 653 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 654 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 655 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 656 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 657 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 658 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 659 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 660 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.0])
  assert_eq(formatter.format_ticks_view(values), ["-0."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 661 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["nan"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 662 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["nan"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 663 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["nan"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 664 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["NAN"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 665 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["NAN"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 666 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["NAN"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 667 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["nan"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 668 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(nan)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 669 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(nan)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 670 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 671 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 672 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 673 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 674 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 675 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["+000000nan"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 676 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), [" nan"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 677 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["nan"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 678 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 679 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 680 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 681 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["INF"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 682 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["INF"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 683 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["INF"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 684 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 685 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(inf)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 686 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(inf)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 687 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 688 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 689 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 690 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 691 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 692 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["+000000inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 693 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), [" inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 694 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 695 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 696 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 697 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 698 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-INF"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 699 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-INF"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 700 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-INF"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 701 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 702 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-inf)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 703 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-inf)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 704 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 705 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 706 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: cannot convert float infinity to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 707 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 708 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 709 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-000000inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 710 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 711 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["-inf"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 712 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["4.94066e-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 713 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 714 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["4.940656e-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 715 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["4.94066E-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 716 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 717 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["4.940656E-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 718 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["5e-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 719 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(5e-324)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 720 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(5e-324)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 721 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 722 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 723 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 724 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 725 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 726 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["+000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 727 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), [" 0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 728 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["5.e-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 729 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-4.94066e-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 730 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 731 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-4.940656e-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 732 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-4.94066E-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 733 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 734 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-4.940656E-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 735 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-5e-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 736 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-5e-324)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 737 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-5e-324)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 738 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 739 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 740 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 741 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 742 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 743 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 744 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 745 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-5.0e-324])
  assert_eq(formatter.format_ticks_view(values), ["-5.e-324"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 746 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["1.79769e+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 747 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 748 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["1.797693e+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 749 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["1.79769E+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 750 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 751 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["1.797693E+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 752 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["1.7976931348623157e+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 753 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(1.7976931348623157e+308)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 754 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(1.7976931348623157e+308)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 755 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 756 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 757 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 758 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 759 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 760 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "+179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 761 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    " 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 762 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["2.e+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 763 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["-1.79769e+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 764 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 765 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["-1.797693e+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 766 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["-1.79769E+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 767 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 768 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["-1.797693E+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 769 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["-1.7976931348623157e+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 770 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(-1.7976931348623157e+308)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 771 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(-1.7976931348623157e+308)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 772 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 773 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 774 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 775 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 776 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 777 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.00",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 778 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), [
    "-179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 779 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-1.7976931348623157e+308])
  assert_eq(formatter.format_ticks_view(values), ["-2.e+308"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 780 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2.675"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 781 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2.675000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 782 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2.675000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 783 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2.675"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 784 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2.675000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 785 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2.675000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 786 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2.675"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 787 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(2.675)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 788 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(2.675)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 789 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 790 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 791 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["2"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 792 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 793 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 794 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["+000002.67"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 795 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), [" 3"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 796 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.675])
  assert_eq(formatter.format_ticks_view(values), ["3."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 797 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1.005"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 798 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1.005000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 799 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1.005000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 800 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1.005"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 801 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1.005000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 802 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1.005000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 803 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1.005"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 804 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1.005)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 805 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1.005)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 806 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 807 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 808 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 809 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 810 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 811 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["+000001.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 812 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), [" 1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 813 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.005])
  assert_eq(formatter.format_ticks_view(values), ["1."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 814 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 815 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2.500000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 816 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2.500000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 817 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 818 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2.500000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 819 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2.500000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 820 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 821 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(2.5)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 822 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(2.5)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 823 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 824 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 825 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 826 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 827 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 828 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["+000002.50"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 829 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), [" 2"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 830 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([2.5])
  assert_eq(formatter.format_ticks_view(values), ["2."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 831 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 832 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3.500000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 833 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3.500000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 834 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 835 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3.500000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 836 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3.500000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 837 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 838 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(3.5)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 839 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(3.5)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 840 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 841 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 842 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["3"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 843 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 844 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 845 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["+000003.50"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 846 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), [" 4"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 847 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([3.5])
  assert_eq(formatter.format_ticks_view(values), ["4."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 848 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-0.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 849 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-0.500000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 850 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-5.000000e-01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 851 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-0.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 852 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-0.500000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 853 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-5.000000E-01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 854 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-0.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 855 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-0.5)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 856 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-0.5)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 857 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 858 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 859 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 860 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 861 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 862 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-000000.50"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 863 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 864 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.5])
  assert_eq(formatter.format_ticks_view(values), ["-0.5"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 865 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-0.999"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 866 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-0.999000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 867 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-9.990000e-01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 868 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-0.999"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 869 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-0.999000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 870 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-9.990000E-01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 871 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-0.999"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 872 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-0.999)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 873 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(-0.999)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 874 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 875 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 876 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 877 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 878 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 879 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-000001.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 880 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 881 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([-0.999])
  assert_eq(formatter.format_ticks_view(values), ["-1."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 882 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["1e-05"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 883 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["0.000010"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 884 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["1.000000e-05"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 885 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["1E-05"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 886 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["0.000010"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 887 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["1.000000E-05"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 888 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["1e-05"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 889 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1e-05)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 890 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1e-05)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 891 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 892 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 893 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 894 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 895 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 896 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["+000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 897 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), [" 0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 898 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e-05])
  assert_eq(formatter.format_ticks_view(values), ["1.e-05"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 899 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0.0001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 900 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0.000100"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 901 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["1.000000e-04"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 902 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0.0001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 903 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0.000100"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 904 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["1.000000E-04"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 905 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0.0001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 906 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(0.0001)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 907 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(0.0001)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 908 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 909 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 910 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 911 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 912 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 913 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["+000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 914 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), [" 0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 915 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.0001])
  assert_eq(formatter.format_ticks_view(values), ["0.0001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 916 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1e+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 917 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1000000000000000.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 918 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1.000000e+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 919 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1E+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 920 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1000000000000000.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 921 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1.000000E+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 922 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1000000000000000.0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 923 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(1000000000000000.0)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 924 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(1000000000000000.0)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 925 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 926 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 927 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 928 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 929 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 930 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["+1000000000000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 931 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), [" 1000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 932 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1000000000000000.0])
  assert_eq(formatter.format_ticks_view(values), ["1.e+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 933 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["1e+16"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 934 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["10000000000000000.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 935 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["1.000000e+16"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 936 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["1E+16"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 937 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["10000000000000000.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 938 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["1.000000E+16"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 939 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["1e+16"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 940 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1e+16)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 941 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1e+16)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 942 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["10000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 943 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["10000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 944 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["10000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 945 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 946 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 947 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["+10000000000000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 948 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), [" 10000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 949 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+16])
  assert_eq(formatter.format_ticks_view(values), ["1.e+16"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 950 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["1e+20"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 951 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), [
    "100000000000000000000.000000",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 952 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["1.000000e+20"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 953 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["1E+20"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 954 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), [
    "100000000000000000000.000000",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 955 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["1.000000E+20"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 956 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["1e+20"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 957 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1e+20)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 958 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["np.float64(1e+20)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 959 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["100000000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 960 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["100000000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 961 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["100000000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 962 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 963 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 964 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["+100000000000000000000.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 965 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), [" 100000000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 966 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0e+20])
  assert_eq(formatter.format_ticks_view(values), ["1.e+20"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 967 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 968 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["1.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 969 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["1.000000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 970 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 971 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["1.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 972 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["1.000000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 973 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["0.9999999999999999"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 974 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(0.9999999999999999)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 975 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(0.9999999999999999)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 976 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 977 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 978 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 979 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 980 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 981 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["+000001.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 982 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), [" 1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 983 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([0.9999999999999999])
  assert_eq(formatter.format_ticks_view(values), ["1."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 984 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 985 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 986 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1.000000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 987 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 988 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 989 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1.000000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 990 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1.0000000000000002"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 991 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(1.0000000000000002)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 992 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(1.0000000000000002)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 993 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 994 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 995 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 996 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.float64"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 997 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 998 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+010.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["+000001.00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 999 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), [" 1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 1000 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0000000000000002])
  assert_eq(formatter.format_ticks_view(values), ["1."])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 1001 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1002 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1003 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1004 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1005 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1006 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1007 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1008 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1009 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1010 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1011 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1012 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1013 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1014 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1015 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1016 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1017 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1018 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1019 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1020 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1021 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   1.250e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1022 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1023 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1024 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1025 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1026 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1027 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1028 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1029 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1030 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1031 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1032 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1033 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1034 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1035 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1036 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1037 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1038 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1039 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1040 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1041 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1042 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1043 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1044 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1045 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "  +1.250e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1046 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1047 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1048 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1049 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1050 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1051 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1052 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1053 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1054 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1055 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1056 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1057 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1058 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1059 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1060 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1061 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1062 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1063 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1064 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1065 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1066 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1067 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1068 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1069 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   1.250e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1070 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1071 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1072 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1073 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1074 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1075 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1076 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1077 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1078 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1079 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1080 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1081 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1082 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1083 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1084 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1085 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1086 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1087 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1088 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1089 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1090 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1091 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1092 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1093 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "0001.250e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1094 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-000.000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1095 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1096 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1097 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1098 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1099 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1100 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1101 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1102 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1103 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1104 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1105 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1106 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1107 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1108 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1109 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1110 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1111 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1112 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1113 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1114 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1115 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1116 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1117 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   1.250e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1118 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1119 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1120 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1121 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1122 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1123 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1124 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1125 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1126 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1127 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1128 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1129 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1130 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1131 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1132 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1133 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1134 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1135 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1136 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1137 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1138 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1139 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1140 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1141 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250e+00   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1142 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000e+00  ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1143 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1144 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1145 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1146 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1147 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1148 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1149 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1150 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1151 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1152 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1153 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1154 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1155 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1156 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1157 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1158 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1159 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1160 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1161 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1162 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1163 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1164 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1165 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+001.250e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1166 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-000.000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1167 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1168 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1169 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1170 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1171 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1172 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1173 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1174 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1175 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1176 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1177 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1178 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1179 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1180 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1181 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1182 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1183 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1184 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1185 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1186 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1187 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1188 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1189 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250e+00   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1190 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000e+00  ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1191 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1192 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1193 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1194 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1195 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1196 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1197 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1198 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1199 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1200 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1201 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1202 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1203 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1204 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1205 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1206 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1207 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1208 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1209 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1210 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1211 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1212 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1213 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "0001.250e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1214 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-000.000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1215 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1216 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1217 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1218 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1219 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1220 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1221 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1222 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1223 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1224 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1225 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1226 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1227 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1228 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1229 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1230 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1231 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1232 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1233 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1234 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1235 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1236 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1237 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "  +1.250e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1238 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1239 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1240 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1241 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1242 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1243 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1244 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1245 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1246 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1247 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1248 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1249 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1250 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1251 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1252 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1253 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1254 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1255 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1256 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1257 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1258 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000e+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1259 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1260 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1261 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250e+00  ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1262 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000e+00  ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1263 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1264 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1265 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1266 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1267 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1268 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1269 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1270 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1271 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1272 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1273 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1274 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1275 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1276 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1277 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1278 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1279 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1280 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1281 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1282 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1283 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1284 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1285 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   1.250E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1286 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1287 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1288 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1289 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1290 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1291 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1292 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1293 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1294 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1295 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1296 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1297 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1298 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1299 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1300 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1301 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1302 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1303 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1304 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1305 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1306 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1307 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1308 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1309 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "  +1.250E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1310 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1311 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1312 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1313 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1314 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1315 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1316 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1317 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1318 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1319 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1320 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1321 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1322 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1323 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1324 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1325 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1326 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1327 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1328 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1329 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1330 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1331 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1332 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1333 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   1.250E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1334 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1335 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1336 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1337 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1338 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1339 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1340 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1341 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1342 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1343 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1344 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1345 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1346 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1347 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1348 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1349 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1350 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1351 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1352 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1353 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1354 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1355 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1356 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1357 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "0001.250E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1358 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-000.000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1359 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1360 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1361 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1362 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1363 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1364 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1365 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1366 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1367 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1368 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1369 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1370 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1371 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1372 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1373 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1374 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1375 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1376 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1377 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1378 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1379 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1380 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1381 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   1.250E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1382 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1383 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1384 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1385 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1386 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1387 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1388 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1389 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1390 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1391 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1392 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1393 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1394 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1395 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1396 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1397 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1398 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1399 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1400 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1401 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1402 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1403 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1404 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1405 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250E+00   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1406 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000E+00  ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1407 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1408 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1409 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1410 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1411 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1412 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1413 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1414 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1415 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1416 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1417 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1418 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1419 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1420 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1421 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1422 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1423 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1424 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1425 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1426 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1427 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1428 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1429 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+001.250E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1430 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-000.000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1431 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1432 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1433 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1434 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1435 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1436 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1437 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1438 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1439 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1440 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1441 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1442 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1443 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1444 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1445 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1446 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1447 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1448 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1449 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1450 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1451 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1452 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1453 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250E+00   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1454 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000E+00  ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1455 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1456 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1457 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1458 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1459 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1460 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1461 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1462 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1463 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1464 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1465 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1466 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1467 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1468 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1469 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1470 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1471 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1472 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1473 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1474 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1475 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1476 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1477 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "0001.250E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1478 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-000.000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1479 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1480 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1481 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1482 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1483 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1484 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1485 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1486 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1487 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1488 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1489 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1490 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1491 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1492 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1493 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1494 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1495 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1496 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1497 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1498 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1499 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1500 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1501 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "  +1.250E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1502 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "  -0.000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1503 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1504 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1505 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1506 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1507 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1508 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1509 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1510 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1511 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1512 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1513 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1514 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1515 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1516 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1517 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1518 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1519 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1520 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1521 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1522 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000E+00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1523 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1524 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1525 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250E+00  ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1526 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000E+00  ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1527 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1528 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3E")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1529 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1530 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1531 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1532 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1533 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "    1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1534 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1535 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1536 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1537 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1538 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1539 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1540 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1541 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1542 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1543 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1544 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1545 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1546 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1547 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1548 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1549 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1550 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1551 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1552 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1553 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1554 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1555 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1556 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1557 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   +1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1558 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1559 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1560 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1561 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1562 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1563 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1564 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1565 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1566 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1567 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1568 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1569 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1570 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1571 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1572 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1573 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "      +1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1574 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1575 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1576 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1577 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1578 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1579 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1580 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1581 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "    1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1582 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1583 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1584 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1585 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1586 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1587 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1588 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1589 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1590 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1591 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1592 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1593 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1594 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1595 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1596 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1597 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1598 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1599 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1600 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1601 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1602 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1603 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1604 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1605 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00001.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1606 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1607 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1608 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1609 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1610 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1611 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1612 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1613 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1614 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1615 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1616 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1617 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1618 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1619 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1620 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1621 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00000001.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1622 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000000.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1623 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1624 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1625 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1626 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1627 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1628 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1629 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "    1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1630 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1631 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1632 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1633 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1634 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1635 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1636 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1637 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1638 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1639 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1640 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1641 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1642 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1643 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1644 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1645 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1646 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1647 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1648 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1649 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1650 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1651 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1652 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1653 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000    ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1654 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1655 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1656 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1657 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1658 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1659 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1660 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1661 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1662 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1663 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1664 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1665 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1666 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1667 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1668 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1669 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1670 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000      ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1671 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1672 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1673 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1674 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1675 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1676 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1677 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+0001.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1678 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1679 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1680 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1681 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1682 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1683 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1684 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1685 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1686 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1687 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1688 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1689 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1690 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1691 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1692 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1693 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+0000001.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1694 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000000.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1695 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1696 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1697 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1698 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1699 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1700 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1701 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000    ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1702 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1703 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1704 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1705 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1706 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1707 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1708 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1709 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1710 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1711 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1712 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1713 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1714 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1715 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1716 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1717 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1718 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000      ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1719 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1720 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1721 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1722 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1723 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1724 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1725 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00001.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1726 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1727 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1728 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1729 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1730 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1731 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1732 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1733 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1734 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1735 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1736 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1737 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1738 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1739 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1740 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1741 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00000001.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1742 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000000.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1743 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1744 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1745 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1746 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1747 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1748 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1749 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   +1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1750 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1751 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1752 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1753 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1754 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1755 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1756 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1757 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1758 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1759 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1760 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1761 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1762 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1763 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1764 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1765 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "      +1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1766 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1767 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1768 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1769 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1770 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1771 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1772 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1773 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1774 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1775 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1776 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1777 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1778 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1779 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1780 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1781 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1782 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1783 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1784 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1785 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1786 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1787 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1788 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1789 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250      ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1790 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000      ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1791 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1792 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1793 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1794 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1795 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1796 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1797 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "    1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1798 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1799 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1800 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1801 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1802 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1803 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1804 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1805 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1806 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1807 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1808 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1809 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1810 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1811 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1812 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1813 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1814 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1815 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1816 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1817 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1818 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1819 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1820 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1821 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   +1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1822 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1823 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1824 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1825 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1826 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1827 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1828 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1829 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1830 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1831 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1832 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1833 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1834 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1835 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1836 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1837 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "      +1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1838 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1839 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1840 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1841 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1842 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1843 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1844 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1845 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "    1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1846 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1847 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1848 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1849 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1850 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1851 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1852 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1853 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1854 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1855 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1856 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1857 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1858 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1859 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1860 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1861 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1862 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1863 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1864 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1865 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1866 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1867 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1868 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1869 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00001.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1870 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1871 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1872 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1873 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1874 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1875 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1876 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1877 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1878 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1879 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1880 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1881 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1882 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1883 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1884 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1885 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00000001.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1886 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000000.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1887 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1888 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1889 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1890 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1891 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1892 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1893 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "    1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1894 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1895 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1896 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1897 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1898 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1899 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1900 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1901 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1902 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1903 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1904 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1905 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1906 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1907 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1908 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1909 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1910 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1911 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1912 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1913 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1914 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1915 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1916 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1917 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000    ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1918 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1919 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1920 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1921 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1922 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1923 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1924 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1925 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1926 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1927 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1928 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1929 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1930 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1931 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1932 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1933 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1934 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000      ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1935 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1936 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1937 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1938 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1939 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1940 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1941 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+0001.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1942 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1943 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1944 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1945 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1946 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1947 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1948 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1949 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1950 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1951 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1952 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1953 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1954 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1955 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1956 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1957 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+0000001.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1958 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000000.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1959 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1960 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1961 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1962 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1963 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1964 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1965 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000    ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1966 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1967 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1968 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1969 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1970 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1971 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1972 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1973 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1974 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1975 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1976 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1977 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1978 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1979 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1980 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1981 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1982 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000      ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1983 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1984 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1985 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1986 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1987 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1988 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1989 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00001.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1990 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1991 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1992 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1993 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1994 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1995 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1996 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1997 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1998 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 1999 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2000 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2001 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2002 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2003 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2004 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2005 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "00000001.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2006 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0000000.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2007 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2008 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2009 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2010 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2011 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2012 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2013 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "   +1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2014 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "   -0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2015 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2016 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2017 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2018 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2019 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2020 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2021 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2022 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2023 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2024 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2025 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2026 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2027 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2028 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2029 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "      +1.250")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2030 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "      -0.000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2031 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2032 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2033 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2034 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2035 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2036 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2037 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250000   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2038 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000000   ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2039 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2040 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2041 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2042 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2043 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2044 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2045 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2046 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2047 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2048 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2049 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2050 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2051 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2052 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2053 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.250      ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2054 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.000      ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2055 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2056 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3F")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2057 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2058 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2059 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2060 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2061 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2062 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2063 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2064 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2065 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2066 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2067 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2068 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2069 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2070 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2071 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2072 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2073 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2074 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2075 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2076 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2077 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2078 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2079 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2080 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2081 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2082 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2083 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2084 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2085 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       +1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2086 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2087 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2088 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2089 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2090 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2091 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2092 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2093 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2094 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2095 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2096 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2097 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2098 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2099 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2100 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2101 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       +1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2102 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2103 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2104 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2105 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2106 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2107 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2108 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2109 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2110 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2111 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2112 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2113 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2114 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2115 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2116 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2117 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2118 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2119 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2120 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2121 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2122 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2123 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2124 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2125 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2126 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2127 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2128 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2129 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2130 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2131 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2132 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2133 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "000000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2134 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2135 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2136 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2137 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2138 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2139 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2140 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2141 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2142 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2143 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2144 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2145 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2146 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2147 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2148 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2149 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "000000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2150 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2151 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2152 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2153 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2154 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2155 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2156 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2157 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "     1.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2158 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "    -0.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2159 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2160 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2161 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2162 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2163 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2164 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2165 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2166 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2167 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2168 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2169 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2500000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2170 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2171 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2172 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2173 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2174 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "       -0.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2175 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2176 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2177 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2178 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2179 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2180 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2181 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2182 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0          ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2183 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2184 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2185 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2186 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2187 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2188 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2189 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2190 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2191 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2192 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2193 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2194 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2195 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2196 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2197 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2198 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0          ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2199 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2200 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2201 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2202 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2203 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2204 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2205 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+00000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2206 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2207 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2208 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2209 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2210 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2211 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2212 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2213 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2214 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2215 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2216 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2217 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2218 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2219 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2220 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2221 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+00000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2222 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2223 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2224 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2225 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2226 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2227 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2228 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2229 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2230 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0          ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2231 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2232 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2233 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2234 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2235 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2236 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2237 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2238 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2239 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2240 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2241 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2242 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2243 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2244 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2245 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2246 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0          ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2247 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2248 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2249 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2250 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2251 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2252 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2253 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "000001.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2254 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2255 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2256 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2257 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2258 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2259 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2260 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2261 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2262 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2263 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2264 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2265 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2500000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2266 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2267 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2268 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2269 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "000000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2270 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2271 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2272 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2273 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2274 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2275 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2276 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2277 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       +1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2278 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2279 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2280 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2281 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2282 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2283 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2284 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2285 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2286 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2287 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2288 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2289 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2290 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2291 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2292 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2293 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       +1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2294 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2295 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2296 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2297 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2298 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2299 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2300 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2301 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000    ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2302 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000    ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2303 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2304 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2305 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2306 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2307 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2308 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2309 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2310 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2311 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2312 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2313 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2500000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2314 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2315 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2316 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2317 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2318 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2319 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+nan        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2320 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+inf        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2321 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2322 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2323 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2324 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2325 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2326 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2327 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2328 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2329 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2330 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2331 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2332 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2333 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2334 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2335 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2336 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2337 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2338 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2339 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2340 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2341 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2342 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2343 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2344 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2345 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2346 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2347 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2348 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2349 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       +1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2350 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2351 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2352 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2353 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2354 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2355 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2356 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2357 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2358 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2359 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2360 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2361 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2362 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2363 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2364 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2365 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       +1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2366 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2367 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2368 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2369 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2370 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2371 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2372 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2373 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2374 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2375 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2376 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2377 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2378 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2379 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2380 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2381 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2382 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2383 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2384 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2385 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), " 1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2386 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2387 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), " NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2388 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% .17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), " INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2389 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2390 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2391 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2392 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% 12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2393 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2394 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2395 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2396 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2397 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "000000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2398 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2399 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2400 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2401 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2402 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2403 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2404 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2405 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2406 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2407 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2408 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2409 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2410 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2411 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2412 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2413 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "000000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2414 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2415 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2416 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2417 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2418 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2419 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2420 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2421 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "     1.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2422 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "    -0.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2423 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2424 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2425 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2426 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2427 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2428 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2429 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2430 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2431 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2432 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2433 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2500000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2434 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2435 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2436 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2437 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "        1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2438 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "       -0.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2439 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "         NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2440 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "         INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2441 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2442 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2443 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2444 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2445 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2446 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0          ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2447 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2448 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2449 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2450 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2451 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2452 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2453 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2454 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2455 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2456 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2457 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2458 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2459 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2460 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2461 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2462 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0          ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2463 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2464 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2465 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2466 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2467 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2468 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2469 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+00000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2470 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2471 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2472 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2473 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2474 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2475 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2476 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2477 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2478 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2479 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2480 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2481 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2482 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2483 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2484 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2485 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+00000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2486 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2487 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+00000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2488 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+00000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2489 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2490 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2491 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2492 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2493 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2494 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0          ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2495 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2496 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2497 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2498 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2499 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2500 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2501 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2502 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2503 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2504 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2505 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2506 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2507 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2508 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2509 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2510 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0          ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2511 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2512 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%-012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF         ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2513 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2514 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2515 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2516 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2517 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "000001.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2518 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2519 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2520 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2521 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2522 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2523 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2524 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2525 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2526 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2527 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2528 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2529 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.2500000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2530 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2531 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2532 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#0.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2533 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "000000001.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2534 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-00000000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2535 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "000000000NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2536 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#012.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "000000000INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2537 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2538 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2539 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2540 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2541 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       +1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2542 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2543 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2544 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2545 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2546 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2547 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2548 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2549 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2550 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2551 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2552 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2553 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2554 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2555 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2556 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +.17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2557 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "       +1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2558 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "          -0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2559 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "        +NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2560 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("% +12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "        +INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2561 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2562 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2563 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2564 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2565 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25000    ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2566 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00000    ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2567 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2568 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2569 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2570 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2571 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2572 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .0G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2573 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2574 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2575 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2576 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .1G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2577 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.2500000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2578 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.0000000000000000")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2579 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2580 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# .17G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2581 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "+1.25       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2582 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(-0.0, pos=-7), "-0.00       ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2583 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(0.0 / 0.0, pos=-7), "+NAN        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2584 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%0-+# 12.3G")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.0 / 0.0, pos=-7), "+INF        ")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2585 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2586 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(0)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2587 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(0)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2588 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2589 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2590 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2591 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2592 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2593 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2594 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["\u{0000}"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2595 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0.000000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2596 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0.000000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2597 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2598 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2599 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2600 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2601 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0x000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2602 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["       \u{0000}"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2603 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0o0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2604 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0x0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2605 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0X0"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2606 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["+0x00000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2607 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0o000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2608 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["00000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2609 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0x0     "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2610 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["0x000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2611 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2612 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2613 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2614 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(-1)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2615 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(-1)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2616 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2617 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2618 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2619 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2620 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2621 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2622 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2623 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1.000000e+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2624 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1.000000E+00"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2625 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2626 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2627 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2628 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2629 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-0x00001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2630 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2631 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-0o1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2632 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-0x1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2633 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-0X1"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2634 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-0x00001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2635 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-0o00001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2636 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-00001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2637 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-0x1    "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2638 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_eq(formatter.format_ticks_view(values), ["-0x00001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2639 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2640 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2641 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2642 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(42)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2643 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(42)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2644 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2645 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2646 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2647 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["52"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2648 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["2a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2649 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["2A"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2650 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["*"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2651 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["4.200000e+01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2652 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["4.200000E+01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2653 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["42.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2654 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["42.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2655 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2656 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2657 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["0x00002a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2658 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["       *"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2659 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["0o52"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2660 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["0x2a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2661 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["0X2A"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2662 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["+0x0002a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2663 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["0o000052"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2664 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["0002a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2665 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["0x2a    "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2666 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_eq(formatter.format_ticks_view(values), ["0x00002a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2667 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2668 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([42L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2669 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2670 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(-42)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2671 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(-42)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2672 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2673 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2674 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2675 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-52"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2676 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-2a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2677 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-2A"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2678 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2679 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-4.200000e+01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2680 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-4.200000E+01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2681 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-42.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2682 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-42.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2683 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2684 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-42"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2685 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0x0002a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2686 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2687 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0o52"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2688 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0x2a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2689 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0X2A"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2690 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0x0002a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2691 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0o00052"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2692 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0002a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2693 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0x2a   "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2694 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_eq(formatter.format_ticks_view(values), ["-0x0002a"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2695 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2696 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-42L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2697 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2698 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(65)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2699 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(65)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2700 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2701 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2702 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2703 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["101"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2704 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["41"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2705 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["41"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2706 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["A"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2707 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["6.500000e+01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2708 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["6.500000E+01"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2709 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2710 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2711 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2712 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["65"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2713 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["0x000041"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2714 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["       A"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2715 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["0o101"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2716 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["0x41"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2717 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["0X41"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2718 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["+0x00041"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2719 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["0o000101"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2720 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["00041"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2721 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["0x41    "])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2722 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_eq(formatter.format_ticks_view(values), ["0x000041"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2723 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2724 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([65L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2725 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9007199254740993"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2726 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(9007199254740993)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2727 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["np.int64(9007199254740993)"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2728 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9007199254740993"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2729 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9007199254740993"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2730 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9007199254740993"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2731 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["400000000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2732 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2733 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2734 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2735 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9.007199e+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2736 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9.007199E+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2737 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9007199254740992.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2738 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9007199254740992.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2739 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9.0072e+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2740 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["9.0072E+15"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2741 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["0x20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2742 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2743 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["0o400000000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2744 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["0x20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2745 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["0X20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2746 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["+0x20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2747 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["0o400000000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2748 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2749 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["0x20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2750 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["0x20000000000001"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2751 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2752 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9007199254740993L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2753 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9223372036854775808"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2754 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), [
    "np.int64(-9223372036854775808)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2755 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), [
    "np.int64(-9223372036854775808)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2756 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9223372036854775808"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2757 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9223372036854775808"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2758 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9223372036854775808"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2759 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-1000000000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2760 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2761 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2762 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2763 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9.223372e+18"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2764 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9.223372E+18"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2765 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9223372036854775808.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2766 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9223372036854775808.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2767 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9.22337e+18"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2768 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-9.22337E+18"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2769 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-0x8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2770 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2771 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-0o1000000000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2772 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-0x8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2773 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-0X8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2774 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-0x8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2775 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-0o1000000000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2776 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2777 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-0x8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2778 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_eq(formatter.format_ticks_view(values), ["-0x8000000000000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2779 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2780 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-9223372036854775808L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2781 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9223372036854775807"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2782 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), [
    "np.int64(9223372036854775807)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2783 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), [
    "np.int64(9223372036854775807)",
  ])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2784 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9223372036854775807"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2785 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%i")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9223372036854775807"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2786 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%u")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9223372036854775807"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2787 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["777777777777777777777"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2788 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["7fffffffffffffff"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2789 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["7FFFFFFFFFFFFFFF"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2790 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2791 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%e")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9.223372e+18"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2792 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%E")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9.223372E+18"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2793 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9223372036854775808.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2794 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%F")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9223372036854775808.000000"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2795 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9.22337e+18"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2796 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%G")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["9.22337E+18"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2797 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["0x7fffffffffffffff"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2798 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2799 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["0o777777777777777777777"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2800 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["0x7fffffffffffffff"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2801 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#.0X")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["0X7FFFFFFFFFFFFFFF"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2802 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["+0x7fffffffffffffff"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2803 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08o")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["0o777777777777777777777"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2804 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["7fffffffffffffff"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2805 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%-#08x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["0x7fffffffffffffff"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2806 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#08.5x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_eq(formatter.format_ticks_view(values), ["0x7fffffffffffffff"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2807 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2808 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.*f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([9223372036854775807L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2809 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2810 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%05c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2811 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2812 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([-1L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2813 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["\u{0000}"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2814 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%05c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["    \u{0000}"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2815 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["\u{0000}"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2816 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L])
  assert_eq(formatter.format_ticks_view(values), ["\u{0000}"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2817 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([55296L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "Unsupported: percent character is an unpaired Unicode surrogate"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2818 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%05c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([55296L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "Unsupported: percent character is an unpaired Unicode surrogate"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2819 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([55296L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "Unsupported: percent character is an unpaired Unicode surrogate"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2820 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([55296L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "Unsupported: percent character is an unpaired Unicode surrogate"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2821 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([57343L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "Unsupported: percent character is an unpaired Unicode surrogate"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2822 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%05c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([57343L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "Unsupported: percent character is an unpaired Unicode surrogate"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2823 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([57343L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "Unsupported: percent character is an unpaired Unicode surrogate"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2824 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([57343L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "Unsupported: percent character is an unpaired Unicode surrogate"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2825 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([128512L])
  assert_eq(formatter.format_ticks_view(values), ["😀"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2826 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%05c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([128512L])
  assert_eq(formatter.format_ticks_view(values), ["    😀"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2827 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([128512L])
  assert_eq(formatter.format_ticks_view(values), ["😀"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2828 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([128512L])
  assert_eq(formatter.format_ticks_view(values), ["😀"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2829 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([1114111L])
  assert_eq(formatter.format_ticks_view(values), ["􏿿"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2830 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%05c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([1114111L])
  assert_eq(formatter.format_ticks_view(values), ["    􏿿"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2831 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([1114111L])
  assert_eq(formatter.format_ticks_view(values), ["􏿿"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2832 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([1114111L])
  assert_eq(formatter.format_ticks_view(values), ["􏿿"])
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2833 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([1114112L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2834 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%05c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([1114112L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2835 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%.0c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([1114112L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2836 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%+c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([1114112L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 1)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2837 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.101f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.25, pos=-7),
    "1.25000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2838 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%1001g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.25, pos=-7),
    "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     1.25",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2839 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1001g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.call(1.25, pos=-7), "1.25")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2840 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1074f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(5.0e-324, pos=-7),
    "0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004940656458412465441765687928682213723650598026143247644255856825006755072702087518652998363616359923797965646954457177309266567103559397963987747960107818781263007131903114045278458171678489821036887186360569987307230500063874091535649843873124733972731696151400317153853980741262385655911710266585566867681870395603106249319452715914924553293054565444011274801297099995419319894090804165633245247571478690147267801593552386115501348035264934720193790268107107491703332226844753335720832431936092382893458368060106011506169809753078342277318329247904982524730776375927247874656084778203734469699533647017972677717585125660551199131504891101451037862738167250955837389733598993664809941164205702637090279242767544565229087538682506419718265533447265625",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2841 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%#.1100g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(5.0e-324, pos=-7),
    "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599237979656469544571773092665671035593979639877479601078187812630071319031140452784581716784898210368871863605699873072305000638740915356498438731247339727316961514003171538539807412623856559117102665855668676818703956031062493194527159149245532930545654440112748012970999954193198940908041656332452475714786901472678015935523861155013480352649347201937902681071074917033322268447533357208324319360923828934583680601060115061698097530783422773183292479049825247307763759272478746560847782037344696995336470179726777175851256605511991315048911014510378627381672509558373897335989936648099411642057026370902792427675445652290875386825064197182655334472656250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e-324",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2842 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1075e")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(5.0e-324, pos=-7),
    "4.9406564584124654417656879286822137236505980261432476442558568250067550727020875186529983636163599237979656469544571773092665671035593979639877479601078187812630071319031140452784581716784898210368871863605699873072305000638740915356498438731247339727316961514003171538539807412623856559117102665855668676818703956031062493194527159149245532930545654440112748012970999954193198940908041656332452475714786901472678015935523861155013480352649347201937902681071074917033322268447533357208324319360923828934583680601060115061698097530783422773183292479049825247307763759272478746560847782037344696995336470179726777175851256605511991315048911014510378627381672509558373897335989936648099411642057026370902792427675445652290875386825064197182655334472656250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e-324",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2843 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1200f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2844 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1200g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(1.7976931348623157e+308, pos=-7),
    "179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2845 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%.1200g")
  formatter.set_locs([91.0, 92.0])
  assert_eq(
    formatter.call(5.0e-324, pos=-7),
    "4.940656458412465441765687928682213723650598026143247644255856825006755072702087518652998363616359923797965646954457177309266567103559397963987747960107818781263007131903114045278458171678489821036887186360569987307230500063874091535649843873124733972731696151400317153853980741262385655911710266585566867681870395603106249319452715914924553293054565444011274801297099995419319894090804165633245247571478690147267801593552386115501348035264934720193790268107107491703332226844753335720832431936092382893458368060106011506169809753078342277318329247904982524730776375927247874656084778203734469699533647017972677717585125660551199131504891101451037862738167250955837389733598993664809941164205702637090279242767544565229087538682506419718265533447265625e-324",
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2846 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2847 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2848 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_ticks([1.0, -0.0, 0.0 / 0.0]), [
    "1.0", "-0.0", "nan",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::Sequence(_))
}

///|
test "FormatStr original scalar 2849 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%s")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0, -0.0, 0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), ["1.0", "-0.0", "nan"])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2850 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2851 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2852 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_ticks([1.0, -0.0, 0.0 / 0.0]), [
    "1.0", "-0.0", "nan",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::Sequence(_))
}

///|
test "FormatStr original scalar 2853 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0, -0.0, 0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(1.0)", "np.float64(-0.0)", "np.float64(nan)",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2854 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2855 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "-0.0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2856 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_ticks([1.0, -0.0, 0.0 / 0.0]), [
    "1.0", "-0.0", "nan",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::Sequence(_))
}

///|
test "FormatStr original scalar 2857 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%a")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0, -0.0, 0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), [
    "np.float64(1.0)", "np.float64(-0.0)", "np.float64(nan)",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2858 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+08.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "-0000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2859 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+08.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "-0000.00")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2860 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%+08.2f")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_ticks([1.0, -0.0, 0.0 / 0.0]), [
    "+0001.00", "-0000.00", "+0000nan",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::Sequence(_))
}

///|
test "FormatStr original scalar 2861 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%+08.2f")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0, -0.0, 0.0 / 0.0])
  assert_eq(formatter.format_ticks_view(values), [
    "+0001.00", "-0000.00", "+0000nan",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2862 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %g")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2863 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %g")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_data_short(-0.0))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2864 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%g %g")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks([1.0, -0.0, 0.0 / 0.0]))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::Sequence(_))
}

///|
test "FormatStr original scalar 2865 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%g %g")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0, -0.0, 0.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2866 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data(-0.0), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2867 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_eq(formatter.format_data_short(-0.0), "0")
  assert_eq(formatter.locations().length(), 2)
}

///|
test "FormatStr original scalar 2868 PythonFloat" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  assert_true(
    try {
      ignore(formatter.format_ticks([1.0, -0.0, 0.0 / 0.0]))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::Sequence(_))
}

///|
test "FormatStr original scalar 2869 NumpyFloat64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_array([1.0, -0.0, 0.0 / 0.0])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: cannot convert float NaN to integer"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2870 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%r")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L, 65L, 9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), [
    "np.int64(0)", "np.int64(65)", "np.int64(9007199254740993)",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2871 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%d")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L, 65L, 9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), ["0", "65", "9007199254740993"])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2872 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%#x")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L, 65L, 9007199254740993L])
  assert_eq(formatter.format_ticks_view(values), [
    "0x0", "0x41", "0x20000000000001",
  ])
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}

///|
test "FormatStr original scalar 2873 NumpyInt64" {
  let formatter = @ticker.FormatStrFormatter::new("%c")
  formatter.set_locs([91.0, 92.0])
  let values = @ticker.TickValues::from_int64_array([0L, 65L, 9007199254740993L])
  assert_true(
    try {
      ignore(formatter.format_ticks_view(values))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
  assert_eq(formatter.locations().length(), 3)
  assert_true(formatter.locations() is @ticker.FormatterLocations::NdArray(_))
}
