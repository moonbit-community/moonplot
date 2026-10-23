// Actual native CPython percent operator: ScalarNumber extra domains.

///|
fn scalar_native_percent_case_0() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_1() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_2() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_3() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_4() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_5() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_6() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_7() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_8() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_9() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_10() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_11() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_12() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_13() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_14() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_15() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_16() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_17() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_18() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_19() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_20() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_21() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_22() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_23() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_24() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_25() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_26() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%c",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "\u{0000}",
  )
}

///|
fn scalar_native_percent_case_27() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%c",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "\u{0000}",
  )
}

///|
fn scalar_native_percent_case_28() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "+0000000",
  )
}

///|
fn scalar_native_percent_case_29() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "+0000000",
  )
}

///|
fn scalar_native_percent_case_30() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0x000000",
  )
}

///|
fn scalar_native_percent_case_31() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0x000000",
  )
}

///|
fn scalar_native_percent_case_32() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0x000000",
  )
}

///|
fn scalar_native_percent_case_33() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0x000000",
  )
}

///|
fn scalar_native_percent_case_34() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0         ",
  )
}

///|
fn scalar_native_percent_case_35() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0         ",
  )
}

///|
fn scalar_native_percent_case_36() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_37() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_38() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "+0",
  )
}

///|
fn scalar_native_percent_case_39() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "+0",
  )
}

///|
fn scalar_native_percent_case_40() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "        0.00",
  )
}

///|
fn scalar_native_percent_case_41() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "        0.00",
  )
}

///|
fn scalar_native_percent_case_42() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0.e+00",
  )
}

///|
fn scalar_native_percent_case_43() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0.e+00",
  )
}

///|
fn scalar_native_percent_case_44() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_45() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_46() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_47() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_48() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_49() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_50() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_51() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_52() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_53() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_54() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_55() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_56() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_57() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_58() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_59() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_60() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_61() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_62() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_63() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_64() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_65() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_66() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_67() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_68() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_69() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_70() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_71() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_72() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_73() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_74() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_75() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_76() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_77() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_78() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_79() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_80() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_81() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_82() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_83() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_84() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_85() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_86() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_87() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_88() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_89() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_90() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_91() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_92() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_93() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_94() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_95() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_96() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=false,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_97() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("0")),
      tuple=true,
    ),
    "0",
  )
}

///|
fn scalar_native_percent_case_98() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_99() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_100() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_101() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_102() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_103() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_104() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_105() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_106() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_107() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_108() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_109() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_110() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_111() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_112() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_113() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_114() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_115() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_116() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_117() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_118() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-52",
  )
}

///|
fn scalar_native_percent_case_119() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-52",
  )
}

///|
fn scalar_native_percent_case_120() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-2a",
  )
}

///|
fn scalar_native_percent_case_121() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-2a",
  )
}

///|
fn scalar_native_percent_case_122() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-2A",
  )
}

///|
fn scalar_native_percent_case_123() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-2A",
  )
}

///|
fn scalar_native_percent_case_124() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%c",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_125() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%c",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_126() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-0000042",
  )
}

///|
fn scalar_native_percent_case_127() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-0000042",
  )
}

///|
fn scalar_native_percent_case_128() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-0x0002a",
  )
}

///|
fn scalar_native_percent_case_129() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-0x0002a",
  )
}

///|
fn scalar_native_percent_case_130() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-0x0002a",
  )
}

///|
fn scalar_native_percent_case_131() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-0x0002a",
  )
}

///|
fn scalar_native_percent_case_132() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42       ",
  )
}

///|
fn scalar_native_percent_case_133() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42       ",
  )
}

///|
fn scalar_native_percent_case_134() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-",
  )
}

///|
fn scalar_native_percent_case_135() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-",
  )
}

///|
fn scalar_native_percent_case_136() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_137() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_138() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "      -42.00",
  )
}

///|
fn scalar_native_percent_case_139() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "      -42.00",
  )
}

///|
fn scalar_native_percent_case_140() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-4.e+01",
  )
}

///|
fn scalar_native_percent_case_141() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-4.e+01",
  )
}

///|
fn scalar_native_percent_case_142() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_143() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_144() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_145() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_146() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_147() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_148() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_149() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_150() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_151() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_152() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_153() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_154() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_155() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_156() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_157() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_158() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_159() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_160() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_161() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_162() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_163() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_164() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_165() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_166() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_167() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_168() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_169() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_170() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_171() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_172() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_173() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_174() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_175() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_176() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_177() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_178() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_179() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_180() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_181() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_182() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_183() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_184() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_185() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_186() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_187() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_188() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_189() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_190() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_191() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_192() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_193() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_194() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=false,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_195() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("-42")),
      tuple=true,
    ),
    "-42",
  )
}

///|
fn scalar_native_percent_case_196() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_197() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_198() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_199() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_200() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_201() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_202() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_203() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_204() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_205() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_206() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_207() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_208() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_209() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_210() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_211() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_212() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_213() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_214() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_215() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_216() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "101",
  )
}

///|
fn scalar_native_percent_case_217() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "101",
  )
}

///|
fn scalar_native_percent_case_218() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "41",
  )
}

///|
fn scalar_native_percent_case_219() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "41",
  )
}

///|
fn scalar_native_percent_case_220() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "41",
  )
}

///|
fn scalar_native_percent_case_221() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "41",
  )
}

///|
fn scalar_native_percent_case_222() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%c",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "A",
  )
}

///|
fn scalar_native_percent_case_223() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%c",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "A",
  )
}

///|
fn scalar_native_percent_case_224() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "+0000065",
  )
}

///|
fn scalar_native_percent_case_225() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "+0000065",
  )
}

///|
fn scalar_native_percent_case_226() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "0x000041",
  )
}

///|
fn scalar_native_percent_case_227() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "0x000041",
  )
}

///|
fn scalar_native_percent_case_228() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "0x000041",
  )
}

///|
fn scalar_native_percent_case_229() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "0x000041",
  )
}

///|
fn scalar_native_percent_case_230() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65        ",
  )
}

///|
fn scalar_native_percent_case_231() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65        ",
  )
}

///|
fn scalar_native_percent_case_232() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "6",
  )
}

///|
fn scalar_native_percent_case_233() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "6",
  )
}

///|
fn scalar_native_percent_case_234() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "+65",
  )
}

///|
fn scalar_native_percent_case_235() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "+65",
  )
}

///|
fn scalar_native_percent_case_236() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "       65.00",
  )
}

///|
fn scalar_native_percent_case_237() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "       65.00",
  )
}

///|
fn scalar_native_percent_case_238() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "6.e+01",
  )
}

///|
fn scalar_native_percent_case_239() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "6.e+01",
  )
}

///|
fn scalar_native_percent_case_240() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_241() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_242() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_243() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_244() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_245() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_246() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_247() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_248() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_249() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_250() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_251() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_252() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_253() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_254() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_255() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_256() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_257() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_258() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_259() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_260() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_261() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_262() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_263() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_264() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_265() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_266() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_267() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_268() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_269() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_270() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_271() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_272() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_273() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_274() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_275() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_276() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_277() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_278() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_279() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_280() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_281() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_282() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_283() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_284() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_285() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_286() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_287() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_288() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_289() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_290() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_291() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_292() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=false,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_293() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(@bigint.BigInt::from_string("65")),
      tuple=true,
    ),
    "65",
  )
}

///|
fn scalar_native_percent_case_294() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_295() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_296() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_297() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_298() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_299() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_300() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1.26765e+30",
  )
}

///|
fn scalar_native_percent_case_301() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1.26765e+30",
  )
}

///|
fn scalar_native_percent_case_302() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_303() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_304() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_305() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_306() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_307() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_308() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_309() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_310() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_311() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_312() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_313() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_314() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "2000000000000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_315() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "2000000000000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_316() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_317() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_318() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_319() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_320() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%c",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_321() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%c",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_322() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "+1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_323() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "+1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_324() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "0x10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_325() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "0x10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_326() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "0x10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_327() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "0x10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_328() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_329() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_330() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1",
  )
}

///|
fn scalar_native_percent_case_331() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1",
  )
}

///|
fn scalar_native_percent_case_332() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "+1.27e+30",
  )
}

///|
fn scalar_native_percent_case_333() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "+1.27e+30",
  )
}

///|
fn scalar_native_percent_case_334() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376.00",
  )
}

///|
fn scalar_native_percent_case_335() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376.00",
  )
}

///|
fn scalar_native_percent_case_336() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1.e+30",
  )
}

///|
fn scalar_native_percent_case_337() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1.e+30",
  )
}

///|
fn scalar_native_percent_case_338() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_339() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_340() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_341() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_342() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_343() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_344() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_345() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_346() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_347() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_348() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_349() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_350() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_351() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_352() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_353() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_354() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_355() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_356() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_357() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_358() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_359() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_360() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_361() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_362() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_363() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_364() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_365() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_366() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_367() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_368() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_369() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_370() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_371() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_372() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_373() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_374() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_375() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_376() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_377() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_378() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_379() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_380() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_381() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_382() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_383() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_384() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_385() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_386() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_387() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_388() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_389() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_390() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_391() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_392() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_393() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_394() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_395() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_396() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_397() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_398() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1.26765e+30",
  )
}

///|
fn scalar_native_percent_case_399() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%g",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1.26765e+30",
  )
}

///|
fn scalar_native_percent_case_400() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_401() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%s",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_402() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_403() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%r",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_404() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_405() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%a",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_406() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_407() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_408() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_409() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%i",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_410() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_411() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%u",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_412() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-2000000000000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_413() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%o",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-2000000000000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_414() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_415() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_416() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_417() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%X",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_418() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%c",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_419() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%c",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: %c arg not in range(0x110000)"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_420() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_421() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+08d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_422() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-0x10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_423() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-0x10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_424() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-0x10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_425() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#08.5x",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-0x10000000000000000000000000",
  )
}

///|
fn scalar_native_percent_case_426() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_427() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-10s",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_428() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-",
  )
}

///|
fn scalar_native_percent_case_429() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.1r",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-",
  )
}

///|
fn scalar_native_percent_case_430() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1.27e+30",
  )
}

///|
fn scalar_native_percent_case_431() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%+.3g",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1.27e+30",
  )
}

///|
fn scalar_native_percent_case_432() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376.00",
  )
}

///|
fn scalar_native_percent_case_433() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%12.2f",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376.00",
  )
}

///|
fn scalar_native_percent_case_434() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1.e+30",
  )
}

///|
fn scalar_native_percent_case_435() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%#.0e",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1.e+30",
  )
}

///|
fn scalar_native_percent_case_436() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_437() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_438() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_439() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_440() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_441() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_442() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_443() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_444() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_445() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_446() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_447() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_448() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_449() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_450() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_451() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_452() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_453() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_454() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_455() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_456() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_457() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_458() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_459() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "OverflowError: Python int too large to convert to C ssize_t"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_460() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_461() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_462() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_463() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_464() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_465() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_466() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_467() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_468() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_469() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_470() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_471() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%l",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_472() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_473() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_474() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_475() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_476() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_477() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_478() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_479() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_480() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_481() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_482() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_483() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_484() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_485() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::Integer(
            @bigint.BigInt::from_string("-1267650600228229401496703205376"),
          ),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_486() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_487() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%.f",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_488() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=false,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_489() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "%-.0d",
      ScalarNumber::Integer(
        @bigint.BigInt::from_string("-1267650600228229401496703205376"),
      ),
      tuple=true,
    ),
    "-1267650600228229401496703205376",
  )
}

///|
fn scalar_native_percent_case_490() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_491() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_492() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_493() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Boolean(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_494() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%%", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_495() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%%", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_496() -> Unit raise {
  assert_eq(
    scalar_percent_format("%g", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_497() -> Unit raise {
  assert_eq(
    scalar_percent_format("%g", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_498() -> Unit raise {
  assert_eq(
    scalar_percent_format("%s", ScalarNumber::Boolean(false), tuple=false),
    "False",
  )
}

///|
fn scalar_native_percent_case_499() -> Unit raise {
  assert_eq(
    scalar_percent_format("%s", ScalarNumber::Boolean(false), tuple=true),
    "False",
  )
}

///|
fn scalar_native_percent_case_500() -> Unit raise {
  assert_eq(
    scalar_percent_format("%r", ScalarNumber::Boolean(false), tuple=false),
    "False",
  )
}

///|
fn scalar_native_percent_case_501() -> Unit raise {
  assert_eq(
    scalar_percent_format("%r", ScalarNumber::Boolean(false), tuple=true),
    "False",
  )
}

///|
fn scalar_native_percent_case_502() -> Unit raise {
  assert_eq(
    scalar_percent_format("%a", ScalarNumber::Boolean(false), tuple=false),
    "False",
  )
}

///|
fn scalar_native_percent_case_503() -> Unit raise {
  assert_eq(
    scalar_percent_format("%a", ScalarNumber::Boolean(false), tuple=true),
    "False",
  )
}

///|
fn scalar_native_percent_case_504() -> Unit raise {
  assert_eq(
    scalar_percent_format("%d", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_505() -> Unit raise {
  assert_eq(
    scalar_percent_format("%d", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_506() -> Unit raise {
  assert_eq(
    scalar_percent_format("%i", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_507() -> Unit raise {
  assert_eq(
    scalar_percent_format("%i", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_508() -> Unit raise {
  assert_eq(
    scalar_percent_format("%u", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_509() -> Unit raise {
  assert_eq(
    scalar_percent_format("%u", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_510() -> Unit raise {
  assert_eq(
    scalar_percent_format("%o", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_511() -> Unit raise {
  assert_eq(
    scalar_percent_format("%o", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_512() -> Unit raise {
  assert_eq(
    scalar_percent_format("%x", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_513() -> Unit raise {
  assert_eq(
    scalar_percent_format("%x", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_514() -> Unit raise {
  assert_eq(
    scalar_percent_format("%X", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_515() -> Unit raise {
  assert_eq(
    scalar_percent_format("%X", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_516() -> Unit raise {
  assert_eq(
    scalar_percent_format("%c", ScalarNumber::Boolean(false), tuple=false),
    "\u{0000}",
  )
}

///|
fn scalar_native_percent_case_517() -> Unit raise {
  assert_eq(
    scalar_percent_format("%c", ScalarNumber::Boolean(false), tuple=true),
    "\u{0000}",
  )
}

///|
fn scalar_native_percent_case_518() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+08d", ScalarNumber::Boolean(false), tuple=false),
    "+0000000",
  )
}

///|
fn scalar_native_percent_case_519() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+08d", ScalarNumber::Boolean(false), tuple=true),
    "+0000000",
  )
}

///|
fn scalar_native_percent_case_520() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#08x", ScalarNumber::Boolean(false), tuple=false),
    "0x000000",
  )
}

///|
fn scalar_native_percent_case_521() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#08x", ScalarNumber::Boolean(false), tuple=true),
    "0x000000",
  )
}

///|
fn scalar_native_percent_case_522() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#08.5x", ScalarNumber::Boolean(false), tuple=false),
    "0x000000",
  )
}

///|
fn scalar_native_percent_case_523() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#08.5x", ScalarNumber::Boolean(false), tuple=true),
    "0x000000",
  )
}

///|
fn scalar_native_percent_case_524() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-10s", ScalarNumber::Boolean(false), tuple=false),
    "False     ",
  )
}

///|
fn scalar_native_percent_case_525() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-10s", ScalarNumber::Boolean(false), tuple=true),
    "False     ",
  )
}

///|
fn scalar_native_percent_case_526() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.1r", ScalarNumber::Boolean(false), tuple=false),
    "F",
  )
}

///|
fn scalar_native_percent_case_527() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.1r", ScalarNumber::Boolean(false), tuple=true),
    "F",
  )
}

///|
fn scalar_native_percent_case_528() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+.3g", ScalarNumber::Boolean(false), tuple=false),
    "+0",
  )
}

///|
fn scalar_native_percent_case_529() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+.3g", ScalarNumber::Boolean(false), tuple=true),
    "+0",
  )
}

///|
fn scalar_native_percent_case_530() -> Unit raise {
  assert_eq(
    scalar_percent_format("%12.2f", ScalarNumber::Boolean(false), tuple=false),
    "        0.00",
  )
}

///|
fn scalar_native_percent_case_531() -> Unit raise {
  assert_eq(
    scalar_percent_format("%12.2f", ScalarNumber::Boolean(false), tuple=true),
    "        0.00",
  )
}

///|
fn scalar_native_percent_case_532() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#.0e", ScalarNumber::Boolean(false), tuple=false),
    "0.e+00",
  )
}

///|
fn scalar_native_percent_case_533() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#.0e", ScalarNumber::Boolean(false), tuple=true),
    "0.e+00",
  )
}

///|
fn scalar_native_percent_case_534() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_535() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_536() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_537() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_538() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(x)", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_539() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(x)", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_540() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_541() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(x)f", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_542() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_543() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Boolean(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_544() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_545() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_546() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*q", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_547() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*q", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_548() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*f", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_549() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*f", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_550() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_551() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_552() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*q", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_553() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*q", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_554() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*f", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_555() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*f", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_556() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_557() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*.*f", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_558() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_559() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%g %q", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_560() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_561() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Boolean(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_562() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_563() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Boolean(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_564() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_565() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%q %g", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_566() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%5%", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_567() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%5%", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_568() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%l", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_569() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%l", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_570() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%llf", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_571() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%llf", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_572() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_573() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Boolean(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_574() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_575() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Boolean(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_576() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_577() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%😀", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_578() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_579() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Boolean(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_580() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Boolean(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_581() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Boolean(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_582() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%\n", ScalarNumber::Boolean(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_583() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%\n", ScalarNumber::Boolean(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_584() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.f", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_585() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.f", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_586() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-.0d", ScalarNumber::Boolean(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_587() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-.0d", ScalarNumber::Boolean(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_588() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_589() -> Unit raise {
  assert_true(
    try {
      ignore(scalar_percent_format("", ScalarNumber::Boolean(true), tuple=true))
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_590() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Boolean(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_591() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::Boolean(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_592() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%%", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_593() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%%", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_594() -> Unit raise {
  assert_eq(
    scalar_percent_format("%g", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_595() -> Unit raise {
  assert_eq(
    scalar_percent_format("%g", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_596() -> Unit raise {
  assert_eq(
    scalar_percent_format("%s", ScalarNumber::Boolean(true), tuple=false),
    "True",
  )
}

///|
fn scalar_native_percent_case_597() -> Unit raise {
  assert_eq(
    scalar_percent_format("%s", ScalarNumber::Boolean(true), tuple=true),
    "True",
  )
}

///|
fn scalar_native_percent_case_598() -> Unit raise {
  assert_eq(
    scalar_percent_format("%r", ScalarNumber::Boolean(true), tuple=false),
    "True",
  )
}

///|
fn scalar_native_percent_case_599() -> Unit raise {
  assert_eq(
    scalar_percent_format("%r", ScalarNumber::Boolean(true), tuple=true),
    "True",
  )
}

///|
fn scalar_native_percent_case_600() -> Unit raise {
  assert_eq(
    scalar_percent_format("%a", ScalarNumber::Boolean(true), tuple=false),
    "True",
  )
}

///|
fn scalar_native_percent_case_601() -> Unit raise {
  assert_eq(
    scalar_percent_format("%a", ScalarNumber::Boolean(true), tuple=true),
    "True",
  )
}

///|
fn scalar_native_percent_case_602() -> Unit raise {
  assert_eq(
    scalar_percent_format("%d", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_603() -> Unit raise {
  assert_eq(
    scalar_percent_format("%d", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_604() -> Unit raise {
  assert_eq(
    scalar_percent_format("%i", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_605() -> Unit raise {
  assert_eq(
    scalar_percent_format("%i", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_606() -> Unit raise {
  assert_eq(
    scalar_percent_format("%u", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_607() -> Unit raise {
  assert_eq(
    scalar_percent_format("%u", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_608() -> Unit raise {
  assert_eq(
    scalar_percent_format("%o", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_609() -> Unit raise {
  assert_eq(
    scalar_percent_format("%o", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_610() -> Unit raise {
  assert_eq(
    scalar_percent_format("%x", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_611() -> Unit raise {
  assert_eq(
    scalar_percent_format("%x", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_612() -> Unit raise {
  assert_eq(
    scalar_percent_format("%X", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_613() -> Unit raise {
  assert_eq(
    scalar_percent_format("%X", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_614() -> Unit raise {
  assert_eq(
    scalar_percent_format("%c", ScalarNumber::Boolean(true), tuple=false),
    "\u{0001}",
  )
}

///|
fn scalar_native_percent_case_615() -> Unit raise {
  assert_eq(
    scalar_percent_format("%c", ScalarNumber::Boolean(true), tuple=true),
    "\u{0001}",
  )
}

///|
fn scalar_native_percent_case_616() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+08d", ScalarNumber::Boolean(true), tuple=false),
    "+0000001",
  )
}

///|
fn scalar_native_percent_case_617() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+08d", ScalarNumber::Boolean(true), tuple=true),
    "+0000001",
  )
}

///|
fn scalar_native_percent_case_618() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#08x", ScalarNumber::Boolean(true), tuple=false),
    "0x000001",
  )
}

///|
fn scalar_native_percent_case_619() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#08x", ScalarNumber::Boolean(true), tuple=true),
    "0x000001",
  )
}

///|
fn scalar_native_percent_case_620() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#08.5x", ScalarNumber::Boolean(true), tuple=false),
    "0x000001",
  )
}

///|
fn scalar_native_percent_case_621() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#08.5x", ScalarNumber::Boolean(true), tuple=true),
    "0x000001",
  )
}

///|
fn scalar_native_percent_case_622() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-10s", ScalarNumber::Boolean(true), tuple=false),
    "True      ",
  )
}

///|
fn scalar_native_percent_case_623() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-10s", ScalarNumber::Boolean(true), tuple=true),
    "True      ",
  )
}

///|
fn scalar_native_percent_case_624() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.1r", ScalarNumber::Boolean(true), tuple=false),
    "T",
  )
}

///|
fn scalar_native_percent_case_625() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.1r", ScalarNumber::Boolean(true), tuple=true),
    "T",
  )
}

///|
fn scalar_native_percent_case_626() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+.3g", ScalarNumber::Boolean(true), tuple=false),
    "+1",
  )
}

///|
fn scalar_native_percent_case_627() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+.3g", ScalarNumber::Boolean(true), tuple=true),
    "+1",
  )
}

///|
fn scalar_native_percent_case_628() -> Unit raise {
  assert_eq(
    scalar_percent_format("%12.2f", ScalarNumber::Boolean(true), tuple=false),
    "        1.00",
  )
}

///|
fn scalar_native_percent_case_629() -> Unit raise {
  assert_eq(
    scalar_percent_format("%12.2f", ScalarNumber::Boolean(true), tuple=true),
    "        1.00",
  )
}

///|
fn scalar_native_percent_case_630() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#.0e", ScalarNumber::Boolean(true), tuple=false),
    "1.e+00",
  )
}

///|
fn scalar_native_percent_case_631() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#.0e", ScalarNumber::Boolean(true), tuple=true),
    "1.e+00",
  )
}

///|
fn scalar_native_percent_case_632() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_633() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_634() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_635() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_636() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(x)", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_637() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(x)", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_638() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(x)f", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_639() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(x)f", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_640() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Boolean(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_641() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::Boolean(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_642() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_643() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_644() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*q", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_645() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*q", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_646() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*f", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_647() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*f", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_648() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_649() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_650() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*q", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_651() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*q", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_652() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*f", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_653() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*f", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_654() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*.*f", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_655() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*.*f", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_656() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%g %q", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_657() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%g %q", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_658() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::Boolean(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_659() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%g %*f", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_660() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Boolean(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_661() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::Boolean(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_662() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%q %g", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_663() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%q %g", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_664() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%5%", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_665() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%5%", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_666() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%l", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_667() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%l", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_668() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%llf", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_669() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%llf", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_670() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Boolean(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_671() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::Boolean(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_672() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Boolean(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_673() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::Boolean(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_674() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%😀", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_675() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%😀", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_676() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::Boolean(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_677() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("😀%q", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_678() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Boolean(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_679() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::Boolean(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_680() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%\n", ScalarNumber::Boolean(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_681() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%\n", ScalarNumber::Boolean(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_682() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.f", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_683() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.f", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_684() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-.0d", ScalarNumber::Boolean(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_685() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-.0d", ScalarNumber::Boolean(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_686() -> Unit raise {
  assert_eq(
    scalar_percent_format("", ScalarNumber::NumpyBool(false), tuple=false),
    "",
  )
}

///|
fn scalar_native_percent_case_687() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_688() -> Unit raise {
  assert_eq(
    scalar_percent_format(
      "literal",
      ScalarNumber::NumpyBool(false),
      tuple=false,
    ),
    "literal",
  )
}

///|
fn scalar_native_percent_case_689() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_690() -> Unit raise {
  assert_eq(
    scalar_percent_format("%%", ScalarNumber::NumpyBool(false), tuple=false),
    "%",
  )
}

///|
fn scalar_native_percent_case_691() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%%", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_692() -> Unit raise {
  assert_eq(
    scalar_percent_format("%g", ScalarNumber::NumpyBool(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_693() -> Unit raise {
  assert_eq(
    scalar_percent_format("%g", ScalarNumber::NumpyBool(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_694() -> Unit raise {
  assert_eq(
    scalar_percent_format("%s", ScalarNumber::NumpyBool(false), tuple=false),
    "False",
  )
}

///|
fn scalar_native_percent_case_695() -> Unit raise {
  assert_eq(
    scalar_percent_format("%s", ScalarNumber::NumpyBool(false), tuple=true),
    "False",
  )
}

///|
fn scalar_native_percent_case_696() -> Unit raise {
  assert_eq(
    scalar_percent_format("%r", ScalarNumber::NumpyBool(false), tuple=false),
    "np.False_",
  )
}

///|
fn scalar_native_percent_case_697() -> Unit raise {
  assert_eq(
    scalar_percent_format("%r", ScalarNumber::NumpyBool(false), tuple=true),
    "np.False_",
  )
}

///|
fn scalar_native_percent_case_698() -> Unit raise {
  assert_eq(
    scalar_percent_format("%a", ScalarNumber::NumpyBool(false), tuple=false),
    "np.False_",
  )
}

///|
fn scalar_native_percent_case_699() -> Unit raise {
  assert_eq(
    scalar_percent_format("%a", ScalarNumber::NumpyBool(false), tuple=true),
    "np.False_",
  )
}

///|
fn scalar_native_percent_case_700() -> Unit raise {
  assert_eq(
    scalar_percent_format("%d", ScalarNumber::NumpyBool(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_701() -> Unit raise {
  assert_eq(
    scalar_percent_format("%d", ScalarNumber::NumpyBool(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_702() -> Unit raise {
  assert_eq(
    scalar_percent_format("%i", ScalarNumber::NumpyBool(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_703() -> Unit raise {
  assert_eq(
    scalar_percent_format("%i", ScalarNumber::NumpyBool(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_704() -> Unit raise {
  assert_eq(
    scalar_percent_format("%u", ScalarNumber::NumpyBool(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_705() -> Unit raise {
  assert_eq(
    scalar_percent_format("%u", ScalarNumber::NumpyBool(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_706() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%o", ScalarNumber::NumpyBool(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %o format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_707() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%o", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %o format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_708() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%x", ScalarNumber::NumpyBool(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_709() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%x", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_710() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%X", ScalarNumber::NumpyBool(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %X format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_711() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%X", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %X format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_712() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%c", ScalarNumber::NumpyBool(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_713() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%c", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_714() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+08d", ScalarNumber::NumpyBool(false), tuple=false),
    "+0000000",
  )
}

///|
fn scalar_native_percent_case_715() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+08d", ScalarNumber::NumpyBool(false), tuple=true),
    "+0000000",
  )
}

///|
fn scalar_native_percent_case_716() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%#08x",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_717() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%#08x",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_718() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%#08.5x",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_719() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%#08.5x",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_720() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-10s", ScalarNumber::NumpyBool(false), tuple=false),
    "False     ",
  )
}

///|
fn scalar_native_percent_case_721() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-10s", ScalarNumber::NumpyBool(false), tuple=true),
    "False     ",
  )
}

///|
fn scalar_native_percent_case_722() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.1r", ScalarNumber::NumpyBool(false), tuple=false),
    "n",
  )
}

///|
fn scalar_native_percent_case_723() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.1r", ScalarNumber::NumpyBool(false), tuple=true),
    "n",
  )
}

///|
fn scalar_native_percent_case_724() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+.3g", ScalarNumber::NumpyBool(false), tuple=false),
    "+0",
  )
}

///|
fn scalar_native_percent_case_725() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+.3g", ScalarNumber::NumpyBool(false), tuple=true),
    "+0",
  )
}

///|
fn scalar_native_percent_case_726() -> Unit raise {
  assert_eq(
    scalar_percent_format("%12.2f", ScalarNumber::NumpyBool(false), tuple=false),
    "        0.00",
  )
}

///|
fn scalar_native_percent_case_727() -> Unit raise {
  assert_eq(
    scalar_percent_format("%12.2f", ScalarNumber::NumpyBool(false), tuple=true),
    "        0.00",
  )
}

///|
fn scalar_native_percent_case_728() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#.0e", ScalarNumber::NumpyBool(false), tuple=false),
    "0.e+00",
  )
}

///|
fn scalar_native_percent_case_729() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#.0e", ScalarNumber::NumpyBool(false), tuple=true),
    "0.e+00",
  )
}

///|
fn scalar_native_percent_case_730() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%", ScalarNumber::NumpyBool(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_731() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_732() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(", ScalarNumber::NumpyBool(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format key"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_733() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_734() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_735() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_736() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_737() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_738() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_739() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_740() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*", ScalarNumber::NumpyBool(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_741() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_742() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*q",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_743() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*q", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_744() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*f",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_745() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*f", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_746() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_747() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_748() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_749() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_750() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_751() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_752() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_753() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_754() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_755() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_756() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_757() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_758() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_759() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_760() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_761() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_762() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%5%",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_763() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%5%", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_764() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%l", ScalarNumber::NumpyBool(false), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_765() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%l", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_766() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_767() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_768() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_769() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_770() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_771() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_772() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_773() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_774() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_775() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_776() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_777() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::NumpyBool(false),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_778() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\n",
          ScalarNumber::NumpyBool(false),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_779() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%\n", ScalarNumber::NumpyBool(false), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_780() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.f", ScalarNumber::NumpyBool(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_781() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.f", ScalarNumber::NumpyBool(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_782() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-.0d", ScalarNumber::NumpyBool(false), tuple=false),
    "0",
  )
}

///|
fn scalar_native_percent_case_783() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-.0d", ScalarNumber::NumpyBool(false), tuple=true),
    "0",
  )
}

///|
fn scalar_native_percent_case_784() -> Unit raise {
  assert_eq(
    scalar_percent_format("", ScalarNumber::NumpyBool(true), tuple=false),
    "",
  )
}

///|
fn scalar_native_percent_case_785() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_786() -> Unit raise {
  assert_eq(
    scalar_percent_format("literal", ScalarNumber::NumpyBool(true), tuple=false),
    "literal",
  )
}

///|
fn scalar_native_percent_case_787() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "literal",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_788() -> Unit raise {
  assert_eq(
    scalar_percent_format("%%", ScalarNumber::NumpyBool(true), tuple=false),
    "%",
  )
}

///|
fn scalar_native_percent_case_789() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%%", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: not all arguments converted during string formatting"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_790() -> Unit raise {
  assert_eq(
    scalar_percent_format("%g", ScalarNumber::NumpyBool(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_791() -> Unit raise {
  assert_eq(
    scalar_percent_format("%g", ScalarNumber::NumpyBool(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_792() -> Unit raise {
  assert_eq(
    scalar_percent_format("%s", ScalarNumber::NumpyBool(true), tuple=false),
    "True",
  )
}

///|
fn scalar_native_percent_case_793() -> Unit raise {
  assert_eq(
    scalar_percent_format("%s", ScalarNumber::NumpyBool(true), tuple=true),
    "True",
  )
}

///|
fn scalar_native_percent_case_794() -> Unit raise {
  assert_eq(
    scalar_percent_format("%r", ScalarNumber::NumpyBool(true), tuple=false),
    "np.True_",
  )
}

///|
fn scalar_native_percent_case_795() -> Unit raise {
  assert_eq(
    scalar_percent_format("%r", ScalarNumber::NumpyBool(true), tuple=true),
    "np.True_",
  )
}

///|
fn scalar_native_percent_case_796() -> Unit raise {
  assert_eq(
    scalar_percent_format("%a", ScalarNumber::NumpyBool(true), tuple=false),
    "np.True_",
  )
}

///|
fn scalar_native_percent_case_797() -> Unit raise {
  assert_eq(
    scalar_percent_format("%a", ScalarNumber::NumpyBool(true), tuple=true),
    "np.True_",
  )
}

///|
fn scalar_native_percent_case_798() -> Unit raise {
  assert_eq(
    scalar_percent_format("%d", ScalarNumber::NumpyBool(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_799() -> Unit raise {
  assert_eq(
    scalar_percent_format("%d", ScalarNumber::NumpyBool(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_800() -> Unit raise {
  assert_eq(
    scalar_percent_format("%i", ScalarNumber::NumpyBool(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_801() -> Unit raise {
  assert_eq(
    scalar_percent_format("%i", ScalarNumber::NumpyBool(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_802() -> Unit raise {
  assert_eq(
    scalar_percent_format("%u", ScalarNumber::NumpyBool(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_803() -> Unit raise {
  assert_eq(
    scalar_percent_format("%u", ScalarNumber::NumpyBool(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_804() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%o", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %o format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_805() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%o", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %o format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_806() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%x", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_807() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%x", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_808() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%X", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %X format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_809() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%X", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %X format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_810() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%c", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_811() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%c", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: %c requires int or char"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_812() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+08d", ScalarNumber::NumpyBool(true), tuple=false),
    "+0000001",
  )
}

///|
fn scalar_native_percent_case_813() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+08d", ScalarNumber::NumpyBool(true), tuple=true),
    "+0000001",
  )
}

///|
fn scalar_native_percent_case_814() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%#08x",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_815() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%#08x",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_816() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%#08.5x",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_817() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%#08.5x",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "TypeError: %x format: an integer is required, not numpy.bool"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_818() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-10s", ScalarNumber::NumpyBool(true), tuple=false),
    "True      ",
  )
}

///|
fn scalar_native_percent_case_819() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-10s", ScalarNumber::NumpyBool(true), tuple=true),
    "True      ",
  )
}

///|
fn scalar_native_percent_case_820() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.1r", ScalarNumber::NumpyBool(true), tuple=false),
    "n",
  )
}

///|
fn scalar_native_percent_case_821() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.1r", ScalarNumber::NumpyBool(true), tuple=true),
    "n",
  )
}

///|
fn scalar_native_percent_case_822() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+.3g", ScalarNumber::NumpyBool(true), tuple=false),
    "+1",
  )
}

///|
fn scalar_native_percent_case_823() -> Unit raise {
  assert_eq(
    scalar_percent_format("%+.3g", ScalarNumber::NumpyBool(true), tuple=true),
    "+1",
  )
}

///|
fn scalar_native_percent_case_824() -> Unit raise {
  assert_eq(
    scalar_percent_format("%12.2f", ScalarNumber::NumpyBool(true), tuple=false),
    "        1.00",
  )
}

///|
fn scalar_native_percent_case_825() -> Unit raise {
  assert_eq(
    scalar_percent_format("%12.2f", ScalarNumber::NumpyBool(true), tuple=true),
    "        1.00",
  )
}

///|
fn scalar_native_percent_case_826() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#.0e", ScalarNumber::NumpyBool(true), tuple=false),
    "1.e+00",
  )
}

///|
fn scalar_native_percent_case_827() -> Unit raise {
  assert_eq(
    scalar_percent_format("%#.0e", ScalarNumber::NumpyBool(true), tuple=true),
    "1.e+00",
  )
}

///|
fn scalar_native_percent_case_828() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_829() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_830() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format key"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_831() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_832() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_833() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%(x)", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_834() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_835() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%(x)f",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_836() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_837() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%((x))q",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_838() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_839() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_840() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*q", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_841() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*q", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_842() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*f", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_843() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%*f", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_844() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_845() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_846() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*q",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_847() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*q", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_848() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%.*f",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_849() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%.*f", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_850() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_851() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%*.*f",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: * wants int"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_852() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_853() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %q",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_854() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_855() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %*f",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: not enough arguments for format string"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_856() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "IndexError: invalid index to scalar variable."
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_857() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %(x)q",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "TypeError: format requires a mapping"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_858() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_859() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%q %g",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_860() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%5%", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_861() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%5%", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '%' (0x25) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_862() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%l", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_863() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%l", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: incomplete format"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_864() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%llf",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_865() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%llf", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'l' (0x6c) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_866() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_867() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%g %.2147483648q",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: precision too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_868() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_869() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%9999999999999999999999q",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message == "ValueError: width too big"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_870() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_871() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%😀",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x1f600) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_872() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_873() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "😀%q",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character 'q' (0x71) at index 2"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_874() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::NumpyBool(true),
          tuple=false,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_875() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format(
          "%\u{0000}",
          ScalarNumber::NumpyBool(true),
          tuple=true,
        ),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0x0) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_876() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%\n", ScalarNumber::NumpyBool(true), tuple=false),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_877() -> Unit raise {
  assert_true(
    try {
      ignore(
        scalar_percent_format("%\n", ScalarNumber::NumpyBool(true), tuple=true),
      )
      false
    } catch {
      @core.DataError::InvalidTicks(message~) =>
        message ==
        "ValueError: unsupported format character '?' (0xa) at index 1"
      _ => false
    },
  )
}

///|
fn scalar_native_percent_case_878() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.f", ScalarNumber::NumpyBool(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_879() -> Unit raise {
  assert_eq(
    scalar_percent_format("%.f", ScalarNumber::NumpyBool(true), tuple=true),
    "1",
  )
}

///|
fn scalar_native_percent_case_880() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-.0d", ScalarNumber::NumpyBool(true), tuple=false),
    "1",
  )
}

///|
fn scalar_native_percent_case_881() -> Unit raise {
  assert_eq(
    scalar_percent_format("%-.0d", ScalarNumber::NumpyBool(true), tuple=true),
    "1",
  )
}

///|
test "Scalar native percent cases 0..32" {
  scalar_native_percent_case_0()
  scalar_native_percent_case_1()
  scalar_native_percent_case_2()
  scalar_native_percent_case_3()
  scalar_native_percent_case_4()
  scalar_native_percent_case_5()
  scalar_native_percent_case_6()
  scalar_native_percent_case_7()
  scalar_native_percent_case_8()
  scalar_native_percent_case_9()
  scalar_native_percent_case_10()
  scalar_native_percent_case_11()
  scalar_native_percent_case_12()
  scalar_native_percent_case_13()
  scalar_native_percent_case_14()
  scalar_native_percent_case_15()
  scalar_native_percent_case_16()
  scalar_native_percent_case_17()
  scalar_native_percent_case_18()
  scalar_native_percent_case_19()
  scalar_native_percent_case_20()
  scalar_native_percent_case_21()
  scalar_native_percent_case_22()
  scalar_native_percent_case_23()
  scalar_native_percent_case_24()
  scalar_native_percent_case_25()
  scalar_native_percent_case_26()
  scalar_native_percent_case_27()
  scalar_native_percent_case_28()
  scalar_native_percent_case_29()
  scalar_native_percent_case_30()
  scalar_native_percent_case_31()
}

///|
test "Scalar native percent cases 32..64" {
  scalar_native_percent_case_32()
  scalar_native_percent_case_33()
  scalar_native_percent_case_34()
  scalar_native_percent_case_35()
  scalar_native_percent_case_36()
  scalar_native_percent_case_37()
  scalar_native_percent_case_38()
  scalar_native_percent_case_39()
  scalar_native_percent_case_40()
  scalar_native_percent_case_41()
  scalar_native_percent_case_42()
  scalar_native_percent_case_43()
  scalar_native_percent_case_44()
  scalar_native_percent_case_45()
  scalar_native_percent_case_46()
  scalar_native_percent_case_47()
  scalar_native_percent_case_48()
  scalar_native_percent_case_49()
  scalar_native_percent_case_50()
  scalar_native_percent_case_51()
  scalar_native_percent_case_52()
  scalar_native_percent_case_53()
  scalar_native_percent_case_54()
  scalar_native_percent_case_55()
  scalar_native_percent_case_56()
  scalar_native_percent_case_57()
  scalar_native_percent_case_58()
  scalar_native_percent_case_59()
  scalar_native_percent_case_60()
  scalar_native_percent_case_61()
  scalar_native_percent_case_62()
  scalar_native_percent_case_63()
}

///|
test "Scalar native percent cases 64..96" {
  scalar_native_percent_case_64()
  scalar_native_percent_case_65()
  scalar_native_percent_case_66()
  scalar_native_percent_case_67()
  scalar_native_percent_case_68()
  scalar_native_percent_case_69()
  scalar_native_percent_case_70()
  scalar_native_percent_case_71()
  scalar_native_percent_case_72()
  scalar_native_percent_case_73()
  scalar_native_percent_case_74()
  scalar_native_percent_case_75()
  scalar_native_percent_case_76()
  scalar_native_percent_case_77()
  scalar_native_percent_case_78()
  scalar_native_percent_case_79()
  scalar_native_percent_case_80()
  scalar_native_percent_case_81()
  scalar_native_percent_case_82()
  scalar_native_percent_case_83()
  scalar_native_percent_case_84()
  scalar_native_percent_case_85()
  scalar_native_percent_case_86()
  scalar_native_percent_case_87()
  scalar_native_percent_case_88()
  scalar_native_percent_case_89()
  scalar_native_percent_case_90()
  scalar_native_percent_case_91()
  scalar_native_percent_case_92()
  scalar_native_percent_case_93()
  scalar_native_percent_case_94()
  scalar_native_percent_case_95()
}

///|
test "Scalar native percent cases 96..128" {
  scalar_native_percent_case_96()
  scalar_native_percent_case_97()
  scalar_native_percent_case_98()
  scalar_native_percent_case_99()
  scalar_native_percent_case_100()
  scalar_native_percent_case_101()
  scalar_native_percent_case_102()
  scalar_native_percent_case_103()
  scalar_native_percent_case_104()
  scalar_native_percent_case_105()
  scalar_native_percent_case_106()
  scalar_native_percent_case_107()
  scalar_native_percent_case_108()
  scalar_native_percent_case_109()
  scalar_native_percent_case_110()
  scalar_native_percent_case_111()
  scalar_native_percent_case_112()
  scalar_native_percent_case_113()
  scalar_native_percent_case_114()
  scalar_native_percent_case_115()
  scalar_native_percent_case_116()
  scalar_native_percent_case_117()
  scalar_native_percent_case_118()
  scalar_native_percent_case_119()
  scalar_native_percent_case_120()
  scalar_native_percent_case_121()
  scalar_native_percent_case_122()
  scalar_native_percent_case_123()
  scalar_native_percent_case_124()
  scalar_native_percent_case_125()
  scalar_native_percent_case_126()
  scalar_native_percent_case_127()
}

///|
test "Scalar native percent cases 128..160" {
  scalar_native_percent_case_128()
  scalar_native_percent_case_129()
  scalar_native_percent_case_130()
  scalar_native_percent_case_131()
  scalar_native_percent_case_132()
  scalar_native_percent_case_133()
  scalar_native_percent_case_134()
  scalar_native_percent_case_135()
  scalar_native_percent_case_136()
  scalar_native_percent_case_137()
  scalar_native_percent_case_138()
  scalar_native_percent_case_139()
  scalar_native_percent_case_140()
  scalar_native_percent_case_141()
  scalar_native_percent_case_142()
  scalar_native_percent_case_143()
  scalar_native_percent_case_144()
  scalar_native_percent_case_145()
  scalar_native_percent_case_146()
  scalar_native_percent_case_147()
  scalar_native_percent_case_148()
  scalar_native_percent_case_149()
  scalar_native_percent_case_150()
  scalar_native_percent_case_151()
  scalar_native_percent_case_152()
  scalar_native_percent_case_153()
  scalar_native_percent_case_154()
  scalar_native_percent_case_155()
  scalar_native_percent_case_156()
  scalar_native_percent_case_157()
  scalar_native_percent_case_158()
  scalar_native_percent_case_159()
}

///|
test "Scalar native percent cases 160..192" {
  scalar_native_percent_case_160()
  scalar_native_percent_case_161()
  scalar_native_percent_case_162()
  scalar_native_percent_case_163()
  scalar_native_percent_case_164()
  scalar_native_percent_case_165()
  scalar_native_percent_case_166()
  scalar_native_percent_case_167()
  scalar_native_percent_case_168()
  scalar_native_percent_case_169()
  scalar_native_percent_case_170()
  scalar_native_percent_case_171()
  scalar_native_percent_case_172()
  scalar_native_percent_case_173()
  scalar_native_percent_case_174()
  scalar_native_percent_case_175()
  scalar_native_percent_case_176()
  scalar_native_percent_case_177()
  scalar_native_percent_case_178()
  scalar_native_percent_case_179()
  scalar_native_percent_case_180()
  scalar_native_percent_case_181()
  scalar_native_percent_case_182()
  scalar_native_percent_case_183()
  scalar_native_percent_case_184()
  scalar_native_percent_case_185()
  scalar_native_percent_case_186()
  scalar_native_percent_case_187()
  scalar_native_percent_case_188()
  scalar_native_percent_case_189()
  scalar_native_percent_case_190()
  scalar_native_percent_case_191()
}

///|
test "Scalar native percent cases 192..224" {
  scalar_native_percent_case_192()
  scalar_native_percent_case_193()
  scalar_native_percent_case_194()
  scalar_native_percent_case_195()
  scalar_native_percent_case_196()
  scalar_native_percent_case_197()
  scalar_native_percent_case_198()
  scalar_native_percent_case_199()
  scalar_native_percent_case_200()
  scalar_native_percent_case_201()
  scalar_native_percent_case_202()
  scalar_native_percent_case_203()
  scalar_native_percent_case_204()
  scalar_native_percent_case_205()
  scalar_native_percent_case_206()
  scalar_native_percent_case_207()
  scalar_native_percent_case_208()
  scalar_native_percent_case_209()
  scalar_native_percent_case_210()
  scalar_native_percent_case_211()
  scalar_native_percent_case_212()
  scalar_native_percent_case_213()
  scalar_native_percent_case_214()
  scalar_native_percent_case_215()
  scalar_native_percent_case_216()
  scalar_native_percent_case_217()
  scalar_native_percent_case_218()
  scalar_native_percent_case_219()
  scalar_native_percent_case_220()
  scalar_native_percent_case_221()
  scalar_native_percent_case_222()
  scalar_native_percent_case_223()
}

///|
test "Scalar native percent cases 224..256" {
  scalar_native_percent_case_224()
  scalar_native_percent_case_225()
  scalar_native_percent_case_226()
  scalar_native_percent_case_227()
  scalar_native_percent_case_228()
  scalar_native_percent_case_229()
  scalar_native_percent_case_230()
  scalar_native_percent_case_231()
  scalar_native_percent_case_232()
  scalar_native_percent_case_233()
  scalar_native_percent_case_234()
  scalar_native_percent_case_235()
  scalar_native_percent_case_236()
  scalar_native_percent_case_237()
  scalar_native_percent_case_238()
  scalar_native_percent_case_239()
  scalar_native_percent_case_240()
  scalar_native_percent_case_241()
  scalar_native_percent_case_242()
  scalar_native_percent_case_243()
  scalar_native_percent_case_244()
  scalar_native_percent_case_245()
  scalar_native_percent_case_246()
  scalar_native_percent_case_247()
  scalar_native_percent_case_248()
  scalar_native_percent_case_249()
  scalar_native_percent_case_250()
  scalar_native_percent_case_251()
  scalar_native_percent_case_252()
  scalar_native_percent_case_253()
  scalar_native_percent_case_254()
  scalar_native_percent_case_255()
}

///|
test "Scalar native percent cases 256..288" {
  scalar_native_percent_case_256()
  scalar_native_percent_case_257()
  scalar_native_percent_case_258()
  scalar_native_percent_case_259()
  scalar_native_percent_case_260()
  scalar_native_percent_case_261()
  scalar_native_percent_case_262()
  scalar_native_percent_case_263()
  scalar_native_percent_case_264()
  scalar_native_percent_case_265()
  scalar_native_percent_case_266()
  scalar_native_percent_case_267()
  scalar_native_percent_case_268()
  scalar_native_percent_case_269()
  scalar_native_percent_case_270()
  scalar_native_percent_case_271()
  scalar_native_percent_case_272()
  scalar_native_percent_case_273()
  scalar_native_percent_case_274()
  scalar_native_percent_case_275()
  scalar_native_percent_case_276()
  scalar_native_percent_case_277()
  scalar_native_percent_case_278()
  scalar_native_percent_case_279()
  scalar_native_percent_case_280()
  scalar_native_percent_case_281()
  scalar_native_percent_case_282()
  scalar_native_percent_case_283()
  scalar_native_percent_case_284()
  scalar_native_percent_case_285()
  scalar_native_percent_case_286()
  scalar_native_percent_case_287()
}

///|
test "Scalar native percent cases 288..320" {
  scalar_native_percent_case_288()
  scalar_native_percent_case_289()
  scalar_native_percent_case_290()
  scalar_native_percent_case_291()
  scalar_native_percent_case_292()
  scalar_native_percent_case_293()
  scalar_native_percent_case_294()
  scalar_native_percent_case_295()
  scalar_native_percent_case_296()
  scalar_native_percent_case_297()
  scalar_native_percent_case_298()
  scalar_native_percent_case_299()
  scalar_native_percent_case_300()
  scalar_native_percent_case_301()
  scalar_native_percent_case_302()
  scalar_native_percent_case_303()
  scalar_native_percent_case_304()
  scalar_native_percent_case_305()
  scalar_native_percent_case_306()
  scalar_native_percent_case_307()
  scalar_native_percent_case_308()
  scalar_native_percent_case_309()
  scalar_native_percent_case_310()
  scalar_native_percent_case_311()
  scalar_native_percent_case_312()
  scalar_native_percent_case_313()
  scalar_native_percent_case_314()
  scalar_native_percent_case_315()
  scalar_native_percent_case_316()
  scalar_native_percent_case_317()
  scalar_native_percent_case_318()
  scalar_native_percent_case_319()
}

///|
test "Scalar native percent cases 320..352" {
  scalar_native_percent_case_320()
  scalar_native_percent_case_321()
  scalar_native_percent_case_322()
  scalar_native_percent_case_323()
  scalar_native_percent_case_324()
  scalar_native_percent_case_325()
  scalar_native_percent_case_326()
  scalar_native_percent_case_327()
  scalar_native_percent_case_328()
  scalar_native_percent_case_329()
  scalar_native_percent_case_330()
  scalar_native_percent_case_331()
  scalar_native_percent_case_332()
  scalar_native_percent_case_333()
  scalar_native_percent_case_334()
  scalar_native_percent_case_335()
  scalar_native_percent_case_336()
  scalar_native_percent_case_337()
  scalar_native_percent_case_338()
  scalar_native_percent_case_339()
  scalar_native_percent_case_340()
  scalar_native_percent_case_341()
  scalar_native_percent_case_342()
  scalar_native_percent_case_343()
  scalar_native_percent_case_344()
  scalar_native_percent_case_345()
  scalar_native_percent_case_346()
  scalar_native_percent_case_347()
  scalar_native_percent_case_348()
  scalar_native_percent_case_349()
  scalar_native_percent_case_350()
  scalar_native_percent_case_351()
}

///|
test "Scalar native percent cases 352..384" {
  scalar_native_percent_case_352()
  scalar_native_percent_case_353()
  scalar_native_percent_case_354()
  scalar_native_percent_case_355()
  scalar_native_percent_case_356()
  scalar_native_percent_case_357()
  scalar_native_percent_case_358()
  scalar_native_percent_case_359()
  scalar_native_percent_case_360()
  scalar_native_percent_case_361()
  scalar_native_percent_case_362()
  scalar_native_percent_case_363()
  scalar_native_percent_case_364()
  scalar_native_percent_case_365()
  scalar_native_percent_case_366()
  scalar_native_percent_case_367()
  scalar_native_percent_case_368()
  scalar_native_percent_case_369()
  scalar_native_percent_case_370()
  scalar_native_percent_case_371()
  scalar_native_percent_case_372()
  scalar_native_percent_case_373()
  scalar_native_percent_case_374()
  scalar_native_percent_case_375()
  scalar_native_percent_case_376()
  scalar_native_percent_case_377()
  scalar_native_percent_case_378()
  scalar_native_percent_case_379()
  scalar_native_percent_case_380()
  scalar_native_percent_case_381()
  scalar_native_percent_case_382()
  scalar_native_percent_case_383()
}

///|
test "Scalar native percent cases 384..416" {
  scalar_native_percent_case_384()
  scalar_native_percent_case_385()
  scalar_native_percent_case_386()
  scalar_native_percent_case_387()
  scalar_native_percent_case_388()
  scalar_native_percent_case_389()
  scalar_native_percent_case_390()
  scalar_native_percent_case_391()
  scalar_native_percent_case_392()
  scalar_native_percent_case_393()
  scalar_native_percent_case_394()
  scalar_native_percent_case_395()
  scalar_native_percent_case_396()
  scalar_native_percent_case_397()
  scalar_native_percent_case_398()
  scalar_native_percent_case_399()
  scalar_native_percent_case_400()
  scalar_native_percent_case_401()
  scalar_native_percent_case_402()
  scalar_native_percent_case_403()
  scalar_native_percent_case_404()
  scalar_native_percent_case_405()
  scalar_native_percent_case_406()
  scalar_native_percent_case_407()
  scalar_native_percent_case_408()
  scalar_native_percent_case_409()
  scalar_native_percent_case_410()
  scalar_native_percent_case_411()
  scalar_native_percent_case_412()
  scalar_native_percent_case_413()
  scalar_native_percent_case_414()
  scalar_native_percent_case_415()
}

///|
test "Scalar native percent cases 416..448" {
  scalar_native_percent_case_416()
  scalar_native_percent_case_417()
  scalar_native_percent_case_418()
  scalar_native_percent_case_419()
  scalar_native_percent_case_420()
  scalar_native_percent_case_421()
  scalar_native_percent_case_422()
  scalar_native_percent_case_423()
  scalar_native_percent_case_424()
  scalar_native_percent_case_425()
  scalar_native_percent_case_426()
  scalar_native_percent_case_427()
  scalar_native_percent_case_428()
  scalar_native_percent_case_429()
  scalar_native_percent_case_430()
  scalar_native_percent_case_431()
  scalar_native_percent_case_432()
  scalar_native_percent_case_433()
  scalar_native_percent_case_434()
  scalar_native_percent_case_435()
  scalar_native_percent_case_436()
  scalar_native_percent_case_437()
  scalar_native_percent_case_438()
  scalar_native_percent_case_439()
  scalar_native_percent_case_440()
  scalar_native_percent_case_441()
  scalar_native_percent_case_442()
  scalar_native_percent_case_443()
  scalar_native_percent_case_444()
  scalar_native_percent_case_445()
  scalar_native_percent_case_446()
  scalar_native_percent_case_447()
}

///|
test "Scalar native percent cases 448..480" {
  scalar_native_percent_case_448()
  scalar_native_percent_case_449()
  scalar_native_percent_case_450()
  scalar_native_percent_case_451()
  scalar_native_percent_case_452()
  scalar_native_percent_case_453()
  scalar_native_percent_case_454()
  scalar_native_percent_case_455()
  scalar_native_percent_case_456()
  scalar_native_percent_case_457()
  scalar_native_percent_case_458()
  scalar_native_percent_case_459()
  scalar_native_percent_case_460()
  scalar_native_percent_case_461()
  scalar_native_percent_case_462()
  scalar_native_percent_case_463()
  scalar_native_percent_case_464()
  scalar_native_percent_case_465()
  scalar_native_percent_case_466()
  scalar_native_percent_case_467()
  scalar_native_percent_case_468()
  scalar_native_percent_case_469()
  scalar_native_percent_case_470()
  scalar_native_percent_case_471()
  scalar_native_percent_case_472()
  scalar_native_percent_case_473()
  scalar_native_percent_case_474()
  scalar_native_percent_case_475()
  scalar_native_percent_case_476()
  scalar_native_percent_case_477()
  scalar_native_percent_case_478()
  scalar_native_percent_case_479()
}

///|
test "Scalar native percent cases 480..512" {
  scalar_native_percent_case_480()
  scalar_native_percent_case_481()
  scalar_native_percent_case_482()
  scalar_native_percent_case_483()
  scalar_native_percent_case_484()
  scalar_native_percent_case_485()
  scalar_native_percent_case_486()
  scalar_native_percent_case_487()
  scalar_native_percent_case_488()
  scalar_native_percent_case_489()
  scalar_native_percent_case_490()
  scalar_native_percent_case_491()
  scalar_native_percent_case_492()
  scalar_native_percent_case_493()
  scalar_native_percent_case_494()
  scalar_native_percent_case_495()
  scalar_native_percent_case_496()
  scalar_native_percent_case_497()
  scalar_native_percent_case_498()
  scalar_native_percent_case_499()
  scalar_native_percent_case_500()
  scalar_native_percent_case_501()
  scalar_native_percent_case_502()
  scalar_native_percent_case_503()
  scalar_native_percent_case_504()
  scalar_native_percent_case_505()
  scalar_native_percent_case_506()
  scalar_native_percent_case_507()
  scalar_native_percent_case_508()
  scalar_native_percent_case_509()
  scalar_native_percent_case_510()
  scalar_native_percent_case_511()
}

///|
test "Scalar native percent cases 512..544" {
  scalar_native_percent_case_512()
  scalar_native_percent_case_513()
  scalar_native_percent_case_514()
  scalar_native_percent_case_515()
  scalar_native_percent_case_516()
  scalar_native_percent_case_517()
  scalar_native_percent_case_518()
  scalar_native_percent_case_519()
  scalar_native_percent_case_520()
  scalar_native_percent_case_521()
  scalar_native_percent_case_522()
  scalar_native_percent_case_523()
  scalar_native_percent_case_524()
  scalar_native_percent_case_525()
  scalar_native_percent_case_526()
  scalar_native_percent_case_527()
  scalar_native_percent_case_528()
  scalar_native_percent_case_529()
  scalar_native_percent_case_530()
  scalar_native_percent_case_531()
  scalar_native_percent_case_532()
  scalar_native_percent_case_533()
  scalar_native_percent_case_534()
  scalar_native_percent_case_535()
  scalar_native_percent_case_536()
  scalar_native_percent_case_537()
  scalar_native_percent_case_538()
  scalar_native_percent_case_539()
  scalar_native_percent_case_540()
  scalar_native_percent_case_541()
  scalar_native_percent_case_542()
  scalar_native_percent_case_543()
}

///|
test "Scalar native percent cases 544..576" {
  scalar_native_percent_case_544()
  scalar_native_percent_case_545()
  scalar_native_percent_case_546()
  scalar_native_percent_case_547()
  scalar_native_percent_case_548()
  scalar_native_percent_case_549()
  scalar_native_percent_case_550()
  scalar_native_percent_case_551()
  scalar_native_percent_case_552()
  scalar_native_percent_case_553()
  scalar_native_percent_case_554()
  scalar_native_percent_case_555()
  scalar_native_percent_case_556()
  scalar_native_percent_case_557()
  scalar_native_percent_case_558()
  scalar_native_percent_case_559()
  scalar_native_percent_case_560()
  scalar_native_percent_case_561()
  scalar_native_percent_case_562()
  scalar_native_percent_case_563()
  scalar_native_percent_case_564()
  scalar_native_percent_case_565()
  scalar_native_percent_case_566()
  scalar_native_percent_case_567()
  scalar_native_percent_case_568()
  scalar_native_percent_case_569()
  scalar_native_percent_case_570()
  scalar_native_percent_case_571()
  scalar_native_percent_case_572()
  scalar_native_percent_case_573()
  scalar_native_percent_case_574()
  scalar_native_percent_case_575()
}

///|
test "Scalar native percent cases 576..608" {
  scalar_native_percent_case_576()
  scalar_native_percent_case_577()
  scalar_native_percent_case_578()
  scalar_native_percent_case_579()
  scalar_native_percent_case_580()
  scalar_native_percent_case_581()
  scalar_native_percent_case_582()
  scalar_native_percent_case_583()
  scalar_native_percent_case_584()
  scalar_native_percent_case_585()
  scalar_native_percent_case_586()
  scalar_native_percent_case_587()
  scalar_native_percent_case_588()
  scalar_native_percent_case_589()
  scalar_native_percent_case_590()
  scalar_native_percent_case_591()
  scalar_native_percent_case_592()
  scalar_native_percent_case_593()
  scalar_native_percent_case_594()
  scalar_native_percent_case_595()
  scalar_native_percent_case_596()
  scalar_native_percent_case_597()
  scalar_native_percent_case_598()
  scalar_native_percent_case_599()
  scalar_native_percent_case_600()
  scalar_native_percent_case_601()
  scalar_native_percent_case_602()
  scalar_native_percent_case_603()
  scalar_native_percent_case_604()
  scalar_native_percent_case_605()
  scalar_native_percent_case_606()
  scalar_native_percent_case_607()
}

///|
test "Scalar native percent cases 608..640" {
  scalar_native_percent_case_608()
  scalar_native_percent_case_609()
  scalar_native_percent_case_610()
  scalar_native_percent_case_611()
  scalar_native_percent_case_612()
  scalar_native_percent_case_613()
  scalar_native_percent_case_614()
  scalar_native_percent_case_615()
  scalar_native_percent_case_616()
  scalar_native_percent_case_617()
  scalar_native_percent_case_618()
  scalar_native_percent_case_619()
  scalar_native_percent_case_620()
  scalar_native_percent_case_621()
  scalar_native_percent_case_622()
  scalar_native_percent_case_623()
  scalar_native_percent_case_624()
  scalar_native_percent_case_625()
  scalar_native_percent_case_626()
  scalar_native_percent_case_627()
  scalar_native_percent_case_628()
  scalar_native_percent_case_629()
  scalar_native_percent_case_630()
  scalar_native_percent_case_631()
  scalar_native_percent_case_632()
  scalar_native_percent_case_633()
  scalar_native_percent_case_634()
  scalar_native_percent_case_635()
  scalar_native_percent_case_636()
  scalar_native_percent_case_637()
  scalar_native_percent_case_638()
  scalar_native_percent_case_639()
}

///|
test "Scalar native percent cases 640..672" {
  scalar_native_percent_case_640()
  scalar_native_percent_case_641()
  scalar_native_percent_case_642()
  scalar_native_percent_case_643()
  scalar_native_percent_case_644()
  scalar_native_percent_case_645()
  scalar_native_percent_case_646()
  scalar_native_percent_case_647()
  scalar_native_percent_case_648()
  scalar_native_percent_case_649()
  scalar_native_percent_case_650()
  scalar_native_percent_case_651()
  scalar_native_percent_case_652()
  scalar_native_percent_case_653()
  scalar_native_percent_case_654()
  scalar_native_percent_case_655()
  scalar_native_percent_case_656()
  scalar_native_percent_case_657()
  scalar_native_percent_case_658()
  scalar_native_percent_case_659()
  scalar_native_percent_case_660()
  scalar_native_percent_case_661()
  scalar_native_percent_case_662()
  scalar_native_percent_case_663()
  scalar_native_percent_case_664()
  scalar_native_percent_case_665()
  scalar_native_percent_case_666()
  scalar_native_percent_case_667()
  scalar_native_percent_case_668()
  scalar_native_percent_case_669()
  scalar_native_percent_case_670()
  scalar_native_percent_case_671()
}

///|
test "Scalar native percent cases 672..704" {
  scalar_native_percent_case_672()
  scalar_native_percent_case_673()
  scalar_native_percent_case_674()
  scalar_native_percent_case_675()
  scalar_native_percent_case_676()
  scalar_native_percent_case_677()
  scalar_native_percent_case_678()
  scalar_native_percent_case_679()
  scalar_native_percent_case_680()
  scalar_native_percent_case_681()
  scalar_native_percent_case_682()
  scalar_native_percent_case_683()
  scalar_native_percent_case_684()
  scalar_native_percent_case_685()
  scalar_native_percent_case_686()
  scalar_native_percent_case_687()
  scalar_native_percent_case_688()
  scalar_native_percent_case_689()
  scalar_native_percent_case_690()
  scalar_native_percent_case_691()
  scalar_native_percent_case_692()
  scalar_native_percent_case_693()
  scalar_native_percent_case_694()
  scalar_native_percent_case_695()
  scalar_native_percent_case_696()
  scalar_native_percent_case_697()
  scalar_native_percent_case_698()
  scalar_native_percent_case_699()
  scalar_native_percent_case_700()
  scalar_native_percent_case_701()
  scalar_native_percent_case_702()
  scalar_native_percent_case_703()
}

///|
test "Scalar native percent cases 704..736" {
  scalar_native_percent_case_704()
  scalar_native_percent_case_705()
  scalar_native_percent_case_706()
  scalar_native_percent_case_707()
  scalar_native_percent_case_708()
  scalar_native_percent_case_709()
  scalar_native_percent_case_710()
  scalar_native_percent_case_711()
  scalar_native_percent_case_712()
  scalar_native_percent_case_713()
  scalar_native_percent_case_714()
  scalar_native_percent_case_715()
  scalar_native_percent_case_716()
  scalar_native_percent_case_717()
  scalar_native_percent_case_718()
  scalar_native_percent_case_719()
  scalar_native_percent_case_720()
  scalar_native_percent_case_721()
  scalar_native_percent_case_722()
  scalar_native_percent_case_723()
  scalar_native_percent_case_724()
  scalar_native_percent_case_725()
  scalar_native_percent_case_726()
  scalar_native_percent_case_727()
  scalar_native_percent_case_728()
  scalar_native_percent_case_729()
  scalar_native_percent_case_730()
  scalar_native_percent_case_731()
  scalar_native_percent_case_732()
  scalar_native_percent_case_733()
  scalar_native_percent_case_734()
  scalar_native_percent_case_735()
}

///|
test "Scalar native percent cases 736..768" {
  scalar_native_percent_case_736()
  scalar_native_percent_case_737()
  scalar_native_percent_case_738()
  scalar_native_percent_case_739()
  scalar_native_percent_case_740()
  scalar_native_percent_case_741()
  scalar_native_percent_case_742()
  scalar_native_percent_case_743()
  scalar_native_percent_case_744()
  scalar_native_percent_case_745()
  scalar_native_percent_case_746()
  scalar_native_percent_case_747()
  scalar_native_percent_case_748()
  scalar_native_percent_case_749()
  scalar_native_percent_case_750()
  scalar_native_percent_case_751()
  scalar_native_percent_case_752()
  scalar_native_percent_case_753()
  scalar_native_percent_case_754()
  scalar_native_percent_case_755()
  scalar_native_percent_case_756()
  scalar_native_percent_case_757()
  scalar_native_percent_case_758()
  scalar_native_percent_case_759()
  scalar_native_percent_case_760()
  scalar_native_percent_case_761()
  scalar_native_percent_case_762()
  scalar_native_percent_case_763()
  scalar_native_percent_case_764()
  scalar_native_percent_case_765()
  scalar_native_percent_case_766()
  scalar_native_percent_case_767()
}

///|
test "Scalar native percent cases 768..800" {
  scalar_native_percent_case_768()
  scalar_native_percent_case_769()
  scalar_native_percent_case_770()
  scalar_native_percent_case_771()
  scalar_native_percent_case_772()
  scalar_native_percent_case_773()
  scalar_native_percent_case_774()
  scalar_native_percent_case_775()
  scalar_native_percent_case_776()
  scalar_native_percent_case_777()
  scalar_native_percent_case_778()
  scalar_native_percent_case_779()
  scalar_native_percent_case_780()
  scalar_native_percent_case_781()
  scalar_native_percent_case_782()
  scalar_native_percent_case_783()
  scalar_native_percent_case_784()
  scalar_native_percent_case_785()
  scalar_native_percent_case_786()
  scalar_native_percent_case_787()
  scalar_native_percent_case_788()
  scalar_native_percent_case_789()
  scalar_native_percent_case_790()
  scalar_native_percent_case_791()
  scalar_native_percent_case_792()
  scalar_native_percent_case_793()
  scalar_native_percent_case_794()
  scalar_native_percent_case_795()
  scalar_native_percent_case_796()
  scalar_native_percent_case_797()
  scalar_native_percent_case_798()
  scalar_native_percent_case_799()
}

///|
test "Scalar native percent cases 800..832" {
  scalar_native_percent_case_800()
  scalar_native_percent_case_801()
  scalar_native_percent_case_802()
  scalar_native_percent_case_803()
  scalar_native_percent_case_804()
  scalar_native_percent_case_805()
  scalar_native_percent_case_806()
  scalar_native_percent_case_807()
  scalar_native_percent_case_808()
  scalar_native_percent_case_809()
  scalar_native_percent_case_810()
  scalar_native_percent_case_811()
  scalar_native_percent_case_812()
  scalar_native_percent_case_813()
  scalar_native_percent_case_814()
  scalar_native_percent_case_815()
  scalar_native_percent_case_816()
  scalar_native_percent_case_817()
  scalar_native_percent_case_818()
  scalar_native_percent_case_819()
  scalar_native_percent_case_820()
  scalar_native_percent_case_821()
  scalar_native_percent_case_822()
  scalar_native_percent_case_823()
  scalar_native_percent_case_824()
  scalar_native_percent_case_825()
  scalar_native_percent_case_826()
  scalar_native_percent_case_827()
  scalar_native_percent_case_828()
  scalar_native_percent_case_829()
  scalar_native_percent_case_830()
  scalar_native_percent_case_831()
}

///|
test "Scalar native percent cases 832..864" {
  scalar_native_percent_case_832()
  scalar_native_percent_case_833()
  scalar_native_percent_case_834()
  scalar_native_percent_case_835()
  scalar_native_percent_case_836()
  scalar_native_percent_case_837()
  scalar_native_percent_case_838()
  scalar_native_percent_case_839()
  scalar_native_percent_case_840()
  scalar_native_percent_case_841()
  scalar_native_percent_case_842()
  scalar_native_percent_case_843()
  scalar_native_percent_case_844()
  scalar_native_percent_case_845()
  scalar_native_percent_case_846()
  scalar_native_percent_case_847()
  scalar_native_percent_case_848()
  scalar_native_percent_case_849()
  scalar_native_percent_case_850()
  scalar_native_percent_case_851()
  scalar_native_percent_case_852()
  scalar_native_percent_case_853()
  scalar_native_percent_case_854()
  scalar_native_percent_case_855()
  scalar_native_percent_case_856()
  scalar_native_percent_case_857()
  scalar_native_percent_case_858()
  scalar_native_percent_case_859()
  scalar_native_percent_case_860()
  scalar_native_percent_case_861()
  scalar_native_percent_case_862()
  scalar_native_percent_case_863()
}

///|
test "Scalar native percent cases 864..882" {
  scalar_native_percent_case_864()
  scalar_native_percent_case_865()
  scalar_native_percent_case_866()
  scalar_native_percent_case_867()
  scalar_native_percent_case_868()
  scalar_native_percent_case_869()
  scalar_native_percent_case_870()
  scalar_native_percent_case_871()
  scalar_native_percent_case_872()
  scalar_native_percent_case_873()
  scalar_native_percent_case_874()
  scalar_native_percent_case_875()
  scalar_native_percent_case_876()
  scalar_native_percent_case_877()
  scalar_native_percent_case_878()
  scalar_native_percent_case_879()
  scalar_native_percent_case_880()
  scalar_native_percent_case_881()
}
