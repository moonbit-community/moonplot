// Generated from complete pinned Percent/Axis/Secondary/Figure AST bodies.

///|
test "PercentFormatter original axis 0 unbound call reads axis first" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  let failed = try {
    ignore(f.call(-1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 1 unbound direct format_pct bypasses axis" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  assert_eq(f.format_pct(-1.0, 1.0), "-1.00%")
}

///|
test "PercentFormatter original axis 2 unbound empty batch never reads axis" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  assert_eq(f.format_ticks([]), [])
}

///|
test "PercentFormatter original axis 3 unbound nonempty batch fails after set_locs" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  let failed = try {
    ignore(f.format_ticks([1.0]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1.0)
}

///|
test "PercentFormatter original axis 4 dummy default exact view and label" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis(minpos=-1.0)
  assert_eq(f.call(-1.0), "−1.00%")
  let binding = f.axis().unwrap()
  assert_eq(binding.dummy_minpos(), Some(-1.0))
  match binding.view_interval() {
    @ticker.FormatterViewInterval::Integers(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view[0].to_string(), "0")
      assert_eq(view[1].to_string(), "1")
    }
    _ => fail("dummy defaults must retain Python integers")
  }
}

///|
test "PercentFormatter original axis 5 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 100.0]))
  assert_eq(f.call(-1.0), "−1%")
}

///|
test "PercentFormatter original axis 6 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 10.0]))
  assert_eq(f.call(-1.0), "−1.0%")
}

///|
test "PercentFormatter original axis 7 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 8 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([100.0, 0.0]))
  assert_eq(f.call(-1.0), "−1%")
}

///|
test "PercentFormatter original axis 9 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([2.0, 2.0]))
  assert_eq(f.call(-1.0), "−1%")
}

///|
test "PercentFormatter original axis 10 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0 / 0.0, 1.0]))
  let failed = try {
    ignore(f.call(-1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: cannot convert float NaN to integer")
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 11 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::Sequence([-1.0 / 0.0, 1.0 / 0.0]),
  )
  let failed = try {
    ignore(f.call(-1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 12 dummy create is no-op while bound" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis(minpos=-1.0)
  let old = f.axis()
  f.create_dummy_axis(minpos=99.0)
  assert_eq(f.axis(), old)
  assert_eq(f.axis().unwrap().dummy_minpos(), Some(-1.0))
}

///|
test "PercentFormatter original axis 13 copy retains old dummy and new dummy resets view" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.create_dummy_axis(minpos=-1.0)
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::Sequence([
      @double.neg_infinity, @double.infinity,
    ]),
  )
  let copied = f.copy()
  f.set_axis(None)
  f.create_dummy_axis(minpos=3.0)
  assert_true(copied.axis() != f.axis())
  assert_eq(copied.axis().unwrap().dummy_minpos(), Some(-1.0))
  assert_eq(f.axis().unwrap().dummy_minpos(), Some(3.0))
  match copied.axis().unwrap().view_interval() {
    @ticker.FormatterViewInterval::Sequence(view) =>
      assert_eq(view, [@double.neg_infinity, @double.infinity])
    _ => fail("copy must retain old interval object")
  }
  match f.axis().unwrap().view_interval() {
    @ticker.FormatterViewInterval::Integers(view) => {
      assert_eq(view[0].to_string(), "0")
      assert_eq(view[1].to_string(), "1")
    }
    _ => fail("new dummy must restore the integer default")
  }
}

///|
test "PercentFormatter original axis 14 unbound call reads axis first" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  let failed = try {
    ignore(f.call(-1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 15 unbound direct format_pct bypasses axis" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  assert_eq(f.format_pct(-1.0, 1.0), "-1.00%")
}

///|
test "PercentFormatter original axis 16 unbound empty batch never reads axis" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  assert_eq(f.format_ticks([]), [])
}

///|
test "PercentFormatter original axis 17 unbound nonempty batch fails after set_locs" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  let failed = try {
    ignore(f.format_ticks([1.0]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "AttributeError: 'NoneType' object has no attribute 'get_view_interval'",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(f.locations().length(), 1)
  assert_eq(f.locations().get(0), 1.0)
}

///|
test "PercentFormatter original axis 18 dummy default exact view and label" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis(minpos=-1.0)
  assert_eq(f.call(-1.0), "−1.00%")
  let binding = f.axis().unwrap()
  assert_eq(binding.dummy_minpos(), Some(-1.0))
  match binding.view_interval() {
    @ticker.FormatterViewInterval::Integers(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view[0].to_string(), "0")
      assert_eq(view[1].to_string(), "1")
    }
    _ => fail("dummy defaults must retain Python integers")
  }
}

///|
test "PercentFormatter original axis 19 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 100.0]))
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 20 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 10.0]))
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 21 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 22 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([100.0, 0.0]))
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 23 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([2.0, 2.0]))
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 24 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0 / 0.0, 1.0]))
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 25 dummy mutable range query" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::Sequence([-1.0 / 0.0, 1.0 / 0.0]),
  )
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 26 dummy create is no-op while bound" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis(minpos=-1.0)
  let old = f.axis()
  f.create_dummy_axis(minpos=99.0)
  assert_eq(f.axis(), old)
  assert_eq(f.axis().unwrap().dummy_minpos(), Some(-1.0))
}

///|
test "PercentFormatter original axis 27 copy retains old dummy and new dummy resets view" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  f.create_dummy_axis(minpos=-1.0)
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::Sequence([
      @double.neg_infinity, @double.infinity,
    ]),
  )
  let copied = f.copy()
  f.set_axis(None)
  f.create_dummy_axis(minpos=3.0)
  assert_true(copied.axis() != f.axis())
  assert_eq(copied.axis().unwrap().dummy_minpos(), Some(-1.0))
  assert_eq(f.axis().unwrap().dummy_minpos(), Some(3.0))
  match copied.axis().unwrap().view_interval() {
    @ticker.FormatterViewInterval::Sequence(view) =>
      assert_eq(view, [@double.neg_infinity, @double.infinity])
    _ => fail("copy must retain old interval object")
  }
  match f.axis().unwrap().view_interval() {
    @ticker.FormatterViewInterval::Integers(view) => {
      assert_eq(view[0].to_string(), "0")
      assert_eq(view[1].to_string(), "1")
    }
    _ => fail("new dummy must restore the integer default")
  }
}

///|
test "PercentFormatter original axis 28 batch reads changing view once per value" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  let count = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    count.val += 1
    let upper = if count.val == 1 {
      100.0
    } else if count.val == 2 {
      10.0
    } else {
      1.0
    }
    @ticker.FormatterViewInterval::Sequence([0.0, upper])
  })
  f.set_axis(Some(binding))
  assert_eq(f.format_ticks([1.0, 1.0, 1.0]), ["1%", "1.0%", "1.00%"])
  assert_eq(count.val, 3)
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(2), 1.0)
}

///|
test "PercentFormatter original axis 29 batch original locs retained" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  let count = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    count.val += 1
    let upper = if count.val == 1 {
      100.0
    } else if count.val == 2 {
      10.0
    } else {
      1.0
    }
    @ticker.FormatterViewInterval::Sequence([0.0, upper])
  })
  f.set_axis(Some(binding))
  assert_eq(f.format_ticks([1.0, 1.0, 1.0]), ["1%", "1.0%", "1.00%"])
  assert_eq(count.val, 3)
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(2), 1.0)
}

///|
test "PercentFormatter original axis 30 all inherited calls use view" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  f.set_axis(Some(binding))
  assert_eq(f.call(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 31 all inherited calls use view" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  f.set_axis(Some(binding))
  assert_eq(f.format_data(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 32 all inherited calls use view" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
  )
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  f.set_axis(Some(binding))
  assert_eq(f.format_data_short(-1.0), "−1.00%")
}

///|
test "PercentFormatter original axis 33 view failure precedes x zero division" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    raise @core.DataError::InvalidTicks(message="ValueError: poison view")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.call(1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: poison view")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(calls.val, 1)
}

///|
test "PercentFormatter original axis 34 view failure precedes x zero division" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
    xmax=@ticker.PercentXMax::Number(0.0),
  )
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    raise @core.DataError::InvalidTicks(message="ValueError: poison view")
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.call(1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: poison view")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(calls.val, 1)
}

///|
test "PercentFormatter original axis 35 view callback parameter mutation is visible same call" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    f.set_decimals(@ticker.PercentDecimals::Number(0.0))
    @ticker.FormatterViewInterval::Sequence([0.0, 1.0])
  })
  f.set_axis(Some(binding))
  assert_eq(f.call(1.0), "1%")
}

///|
test "PercentFormatter original axis 36 view callback changes rc before same-call fix_minus" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  let calls = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    calls.val += 1
    @config.set_unicode_minus(calls.val % 2 == 0)
    @ticker.FormatterViewInterval::Sequence([0.0, 1.0])
  })
  f.set_axis(Some(binding))
  assert_eq(f.format_ticks([-1.0, -1.0, -1.0]), ["-1.00%", "−1.00%", "-1.00%"])
  assert_eq(calls.val, 3)
}

///|
test "PercentFormatter original axis 37 actual generated Axis getter reads Bbox Float64" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.call(1.0), "1.00%")
  match axis.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 4.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 38 actual primary view change observed immediately" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axis.set_named_formatter(f.as_base_formatter())
  axes.set_x_limits(0.0, 100.0)
  assert_eq(f.call(1.0), "1%")
}

///|
test "PercentFormatter original axis 39 secondary uses own stored converted range" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 13.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 40 secondary parent changed before _set_lims keeps own range" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  axes.set_x_limits(0.0, 0.04)
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 13.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 41 secondary original _set_lims refreshes own range" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  axes.set_x_limits(0.0, 0.04)
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1.000%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 5.08)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 42 actual generated Axis getter reads Bbox Float64" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.call(1.0), "1.00%")
  match axis.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 4.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 43 actual primary view change observed immediately" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axis.set_named_formatter(f.as_base_formatter())
  axes.set_y_limits(0.0, 100.0)
  assert_eq(f.call(1.0), "1%")
}

///|
test "PercentFormatter original axis 44 secondary uses own stored converted range" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 13.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 45 secondary parent changed before _set_lims keeps own range" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  axes.set_y_limits(0.0, 0.04)
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 13.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 46 secondary original _set_lims refreshes own range" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  axes.set_y_limits(0.0, 0.04)
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1.000%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 5.08)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 47 shared last formatter setter owns both live reads" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(0.0, 1.0)
  b.set_limits(0.0, 100.0)
  a.bind_view_interval(() => (0.0, 1.0))
  b.bind_view_interval(() => (0.0, 100.0))
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  first.set_x_named_formatter(major.as_base_formatter())
  first.set_x_minor_named_formatter(minor.as_base_formatter())
  let old_major = major.copy()
  let old_minor = minor.copy()
  second.set_x_named_formatter(major.as_base_formatter())
  second.set_x_minor_named_formatter(minor.as_base_formatter())
  let external_major = major.copy()
  let external_minor = minor.copy()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1%", "1%"])
  assert_eq([old_major.call(1.0), old_minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq(major.axis(), Some(b.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(b.formatter_axis_binding()))
  assert_eq(external_major.axis(), external_minor.axis())
}

///|
test "PercentFormatter original axis 48 original shared deletion rebinds both installed" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(0.0, 1.0)
  b.set_limits(0.0, 100.0)
  a.bind_view_interval(() => (0.0, 1.0))
  b.bind_view_interval(() => (0.0, 100.0))
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  first.set_x_named_formatter(major.as_base_formatter())
  first.set_x_minor_named_formatter(minor.as_base_formatter())
  let old_major = major.copy()
  let old_minor = minor.copy()
  second.set_x_named_formatter(major.as_base_formatter())
  second.set_x_minor_named_formatter(minor.as_base_formatter())
  let external_major = major.copy()
  let external_minor = minor.copy()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1%", "1%"])
  assert_eq([old_major.call(1.0), old_minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq(major.axis(), Some(b.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(b.formatter_axis_binding()))
  second.remove()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq([external_major.call(1.0), external_minor.call(1.0)], ["1%", "1%"])
  assert_eq(major.axis(), Some(a.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(a.formatter_axis_binding()))
}

///|
test "PercentFormatter original axis 49 shared deletion live rebind vs external copies" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_x=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.x_axis()
  let b = second.x_axis()
  a.set_limits(0.0, 1.0)
  b.set_limits(0.0, 100.0)
  a.bind_view_interval(() => (0.0, 1.0))
  b.bind_view_interval(() => (0.0, 100.0))
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  first.set_x_named_formatter(major.as_base_formatter())
  first.set_x_minor_named_formatter(minor.as_base_formatter())
  let old_major = major.copy()
  let old_minor = minor.copy()
  second.set_x_named_formatter(major.as_base_formatter())
  second.set_x_minor_named_formatter(minor.as_base_formatter())
  let external_major = major.copy()
  let external_minor = minor.copy()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1%", "1%"])
  assert_eq([old_major.call(1.0), old_minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq(major.axis(), Some(b.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(b.formatter_axis_binding()))
  second.remove()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq([external_major.call(1.0), external_minor.call(1.0)], ["1%", "1%"])
  assert_eq(major.axis(), Some(a.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(a.formatter_axis_binding()))
}

///|
test "PercentFormatter original axis 50 shared last formatter setter owns both live reads" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(0.0, 1.0)
  b.set_limits(0.0, 100.0)
  a.bind_view_interval(() => (0.0, 1.0))
  b.bind_view_interval(() => (0.0, 100.0))
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  first.set_y_named_formatter(major.as_base_formatter())
  first.set_y_minor_named_formatter(minor.as_base_formatter())
  let old_major = major.copy()
  let old_minor = minor.copy()
  second.set_y_named_formatter(major.as_base_formatter())
  second.set_y_minor_named_formatter(minor.as_base_formatter())
  let external_major = major.copy()
  let external_minor = minor.copy()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1%", "1%"])
  assert_eq([old_major.call(1.0), old_minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq(major.axis(), Some(b.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(b.formatter_axis_binding()))
  assert_eq(external_major.axis(), external_minor.axis())
}

///|
test "PercentFormatter original axis 51 original shared deletion rebinds both installed" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(0.0, 1.0)
  b.set_limits(0.0, 100.0)
  a.bind_view_interval(() => (0.0, 1.0))
  b.bind_view_interval(() => (0.0, 100.0))
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  first.set_y_named_formatter(major.as_base_formatter())
  first.set_y_minor_named_formatter(minor.as_base_formatter())
  let old_major = major.copy()
  let old_minor = minor.copy()
  second.set_y_named_formatter(major.as_base_formatter())
  second.set_y_minor_named_formatter(minor.as_base_formatter())
  let external_major = major.copy()
  let external_minor = minor.copy()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1%", "1%"])
  assert_eq([old_major.call(1.0), old_minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq(major.axis(), Some(b.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(b.formatter_axis_binding()))
  second.remove()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq([external_major.call(1.0), external_minor.call(1.0)], ["1%", "1%"])
  assert_eq(major.axis(), Some(a.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(a.formatter_axis_binding()))
}

///|
test "PercentFormatter original axis 52 shared deletion live rebind vs external copies" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure()
  let panels = figure.subplots(1, 2, share_y=true)
  let first = panels[0]
  let second = panels[1]
  let a = first.y_axis()
  let b = second.y_axis()
  a.set_limits(0.0, 1.0)
  b.set_limits(0.0, 100.0)
  a.bind_view_interval(() => (0.0, 1.0))
  b.bind_view_interval(() => (0.0, 100.0))
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  first.set_y_named_formatter(major.as_base_formatter())
  first.set_y_minor_named_formatter(minor.as_base_formatter())
  let old_major = major.copy()
  let old_minor = minor.copy()
  second.set_y_named_formatter(major.as_base_formatter())
  second.set_y_minor_named_formatter(minor.as_base_formatter())
  let external_major = major.copy()
  let external_minor = minor.copy()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1%", "1%"])
  assert_eq([old_major.call(1.0), old_minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq(major.axis(), Some(b.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(b.formatter_axis_binding()))
  second.remove()
  assert_eq([major.call(1.0), minor.call(1.0)], ["1.00%", "1.00%"])
  assert_eq([external_major.call(1.0), external_minor.call(1.0)], ["1%", "1%"])
  assert_eq(major.axis(), Some(a.formatter_axis_binding()))
  assert_eq(minor.axis(), Some(a.formatter_axis_binding()))
}

///|
test "PercentFormatter original axis 53 view scalar origin controls second conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  f.create_dummy_axis()
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ZeroDivisionError: float division by zero")
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 54 view scalar origin controls second conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ZeroDivisionError: float division by zero")
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 55 view scalar origin controls second conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([0.0, 1.0]),
    ),
  )
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 56 view scalar origin controls second conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  axes.set_x_limits(0.0, 1.0)
  axis.set_named_formatter(f.as_base_formatter())
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 57 view scalar origin controls second conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
    xmax=@ticker.PercentXMax::Number(0.0),
  )
  f.create_dummy_axis()
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0])), ["inf%"])
}

///|
test "PercentFormatter original axis 58 view scalar origin controls second conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
    xmax=@ticker.PercentXMax::Number(0.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0])), ["inf%"])
}

///|
test "PercentFormatter original axis 59 view scalar origin controls second conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
    xmax=@ticker.PercentXMax::Number(0.0),
  )
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([0.0, 1.0]),
    ),
  )
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0])), ["inf%"])
}

///|
test "PercentFormatter original axis 60 view scalar origin controls second conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new(
    decimals=@ticker.PercentDecimals::Number(2.0),
    xmax=@ticker.PercentXMax::Number(0.0),
  )
  axes.set_x_limits(0.0, 1.0)
  axis.set_named_formatter(f.as_base_formatter())
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0])), ["inf%"])
}

///|
test "PercentFormatter original axis 61 NdArray Int64 view subtraction and abs retain wrap" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(100.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([
        -9223372036854775807L - 1L,
        9223372036854775807L,
      ]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0])), [
    "1.00%",
  ])
}

///|
test "PercentFormatter original axis 62 NdArray Int64 view subtraction and abs retain wrap" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(100.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([-9223372036854775807L - 1L, 0L]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0])), ["1%"])
}

///|
test "PercentFormatter original axis 63 NdArray Int64 view subtraction and abs retain wrap" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(100.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([
        9223372036854775807L,
        -9223372036854775807L - 1L,
      ]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0])), [
    "1.00%",
  ])
}

///|
test "PercentFormatter original axis 64 NdArray Int64 view subtraction and abs retain wrap" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([
        -9223372036854775807L - 1L,
        9223372036854775807L,
      ]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 65 NdArray Int64 view subtraction and abs retain wrap" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([-9223372036854775807L - 1L, 0L]),
    ),
  )
  f.set_axis(Some(binding))
  assert_eq(f.format_ticks_view(@ticker.TickValues::from_array([1.0])), ["inf%"])
}

///|
test "PercentFormatter original axis 66 NdArray Int64 view subtraction and abs retain wrap" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([
        9223372036854775807L,
        -9223372036854775807L - 1L,
      ]),
    ),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 67 complete Secondary constructor before first sync" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.call(1.0), "1.00%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 1.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 68 complete original apply_aspect syncs before delegate" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 13.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 69 complete Secondary remains stale after parent change" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  axes.set_x_limits(0.0, 0.04)
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 13.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 70 complete original draw syncs before super formats" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  axes.set_x_limits(0.0, 0.04)
  ignore(figure.to_svg_checked())
  assert_eq(f.call(1.0), "1.000%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 5.08)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 71 complete Secondary constructor before first sync" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.call(1.0), "1.00%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 1.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 72 complete original apply_aspect syncs before delegate" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 13.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 73 complete Secondary remains stale after parent change" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  axes.set_y_limits(0.0, 0.04)
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 13.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 74 complete original draw syncs before super formats" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  axes.set_y_limits(0.0, 0.04)
  ignore(figure.to_svg_checked())
  assert_eq(f.call(1.0), "1.000%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 5.0)
      assert_eq(view.get(1), 5.08)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 75 complete original Figure layout and Axes draw ordered callbacks" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  let secondary_percent = f
  secondary.set_locator(
    @ticker.FixedLocator::new([5.0, 7.0, 13.0]).as_locator(),
  )
  assert_eq(secondary_percent.call(1.0), "1.00%")
  let primary_percent = @ticker.PercentFormatter::new()
  primary_percent.set_axis(Some(axis.formatter_axis_binding()))
  let events : Array[String] = []
  let formatter = @ticker.FuncFormatter::new((_, pos) => {
    if pos == Some(0) {
      axes.set_x_limits(0.0, 0.04)
    }
    events.push(primary_percent.call(1.0) + "|" + secondary_percent.call(1.0))
    pos.unwrap().to_string()
  })
  axis.set_locator(@ticker.FixedLocator::new([0.0, 1.0, 2.0]).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([0.25, 0.5]).as_minor_locator(),
  )
  axis.set_named_formatter(formatter.as_base_formatter())
  axis.set_minor_named_formatter(
    @ticker.PercentFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(events, ["1.0000%|1.0%", "1.0000%|1.0%", "1.0000%|1.0%"])
  assert_eq(secondary_percent.call(1.0), "1.0%")
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_true(!svg.contains(">1<"))
  assert_true(!svg.contains(">2<"))
  secondary.apply_aspect()
  assert_eq(secondary_percent.call(1.0), "1.000%")
}

///|
test "PercentFormatter original axis 76 complete original Figure layout and Axes draw ordered callbacks" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  let secondary_percent = f
  secondary.set_locator(
    @ticker.FixedLocator::new([5.0, 7.0, 13.0]).as_locator(),
  )
  assert_eq(secondary_percent.call(1.0), "1.00%")
  let primary_percent = @ticker.PercentFormatter::new()
  primary_percent.set_axis(Some(axis.formatter_axis_binding()))
  let events : Array[String] = []
  let formatter = @ticker.FuncFormatter::new((_, pos) => {
    if pos == Some(0) {
      axes.set_y_limits(0.0, 0.04)
    }
    events.push(primary_percent.call(1.0) + "|" + secondary_percent.call(1.0))
    pos.unwrap().to_string()
  })
  axis.set_locator(@ticker.FixedLocator::new([0.0, 1.0, 2.0]).as_locator())
  axis.set_minor_locator(
    @ticker.FixedLocator::new([0.25, 0.5]).as_minor_locator(),
  )
  axis.set_named_formatter(formatter.as_base_formatter())
  axis.set_minor_named_formatter(
    @ticker.PercentFormatter::new().as_base_formatter(),
  )
  let svg = figure.to_svg_checked()
  assert_eq(events, ["1.0000%|1.0%", "1.0000%|1.0%", "1.0000%|1.0%"])
  assert_eq(secondary_percent.call(1.0), "1.0%")
  assert_eq(svg.split(">0<").count() - 1, 1)
  assert_true(!svg.contains(">1<"))
  assert_true(!svg.contains(">2<"))
  secondary.apply_aspect()
  assert_eq(secondary_percent.call(1.0), "1.000%")
}

///|
test "PercentFormatter original axis 77 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(_) { return 5.0 }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 4.75)
      assert_eq(view.get(1), 5.25)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 78 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(_) { return 0.0 }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), -0.05)
      assert_eq(view.get(1), 0.05)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 79 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(
    fn(_) { return 4.9406564584124654e-324 },
    fn(value) { return value },
  )
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), -0.05)
      assert_eq(view.get(1), 0.05)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 80 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(_) { return @double.max_value }, fn(
    value,
  ) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 1.7078084781191998e+308)
      assert_eq(view.get(1), 1.0 / 0.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 81 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(_) { return @double.not_a_number }, fn(
    value,
  ) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  let failed = try {
    ignore(secondary.apply_aspect())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: Axis limits cannot be NaN or Inf")
      true
    }
    _ => false
  }
  assert_true(failed)
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 1.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 82 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_xaxis(fn(_) { return @double.infinity }, fn(
    value,
  ) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  let failed = try {
    ignore(secondary.apply_aspect())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: Axis limits cannot be NaN or Inf")
      true
    }
    _ => false
  }
  assert_true(failed)
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 1.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 83 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_x_limits(0.0, @double.max_value)
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 }, fn(
    value,
  ) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  let failed = try {
    ignore(secondary.apply_aspect())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: Axis limits cannot be NaN or Inf")
      true
    }
    _ => false
  }
  assert_true(failed)
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 1.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 84 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(_) { return 5.0 }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 4.75)
      assert_eq(view.get(1), 5.25)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 85 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(_) { return 0.0 }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), -0.05)
      assert_eq(view.get(1), 0.05)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 86 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(
    fn(_) { return 4.9406564584124654e-324 },
    fn(value) { return value },
  )
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), -0.05)
      assert_eq(view.get(1), 0.05)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 87 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(_) { return @double.max_value }, fn(
    value,
  ) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 1.7078084781191998e+308)
      assert_eq(view.get(1), 1.0 / 0.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 88 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(_) { return @double.not_a_number }, fn(
    value,
  ) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  let failed = try {
    ignore(secondary.apply_aspect())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: Axis limits cannot be NaN or Inf")
      true
    }
    _ => false
  }
  assert_true(failed)
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 1.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 89 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  let secondary = axes.secondary_yaxis(fn(_) { return @double.infinity }, fn(
    value,
  ) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  let failed = try {
    ignore(secondary.apply_aspect())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: Axis limits cannot be NaN or Inf")
      true
    }
    _ => false
  }
  assert_true(failed)
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 1.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 90 secondary sync uses original _set_lim validation" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_y_limits(0.0, @double.max_value)
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 }, fn(
    value,
  ) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  let failed = try {
    ignore(secondary.apply_aspect())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: Axis limits cannot be NaN or Inf")
      true
    }
    _ => false
  }
  assert_true(failed)
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_eq(view.get(0), 0.0)
      assert_eq(view.get(1), 1.0)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 91 log-parent complete constructor autoscale default" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_x_limits(1.0, 100.0)
  axes.set_x_scale(@scale.log_scale())
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_true((view.get(0) / 0.8912509381337456 - 1.0).abs() <= 1.0e-12)
      assert_true((view.get(1) / 11.220184543019636 - 1.0).abs() <= 1.0e-12)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 92 log-parent original apply_aspect clamps functionlog limits" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_x_limits(1.0, 100.0)
  axes.set_x_scale(@scale.log_scale())
  let secondary = axes.secondary_xaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_true((view.get(0) / 1.0 - 1.0).abs() <= 1.0e-12)
      assert_true((view.get(1) / 100.0 - 1.0).abs() <= 1.0e-12)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 93 log-parent complete constructor autoscale default" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_x_limits(1.0, 100.0)
  axes.set_x_scale(@scale.log_scale())
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.call(1.0), "1%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_true((view.get(0) / 5.0 - 1.0).abs() <= 1.0e-12)
      assert_true((view.get(1) / 5.234401174884448e+50 - 1.0).abs() <= 1.0e-12)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 94 log-parent original apply_aspect clamps functionlog limits" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_x_limits(1.0, 100.0)
  axes.set_x_scale(@scale.log_scale())
  let secondary = axes.secondary_xaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_true((view.get(0) / 7.0 - 1.0).abs() <= 1.0e-12)
      assert_true((view.get(1) / 205.0 - 1.0).abs() <= 1.0e-12)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 95 log-parent complete constructor autoscale default" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_y_limits(1.0, 100.0)
  axes.set_y_scale(@scale.log_scale())
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.call(1.0), "1.0%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_true((view.get(0) / 0.8912509381337456 - 1.0).abs() <= 1.0e-12)
      assert_true((view.get(1) / 11.220184543019636 - 1.0).abs() <= 1.0e-12)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 96 log-parent original apply_aspect clamps functionlog limits" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_y_limits(1.0, 100.0)
  axes.set_y_scale(@scale.log_scale())
  let secondary = axes.secondary_yaxis(fn(value) { return value }, fn(value) {
    return value
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_true((view.get(0) / 1.0 - 1.0).abs() <= 1.0e-12)
      assert_true((view.get(1) / 100.0 - 1.0).abs() <= 1.0e-12)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 97 log-parent complete constructor autoscale default" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_y_limits(1.0, 100.0)
  axes.set_y_scale(@scale.log_scale())
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  assert_eq(f.call(1.0), "1%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_true((view.get(0) / 5.0 - 1.0).abs() <= 1.0e-12)
      assert_true((view.get(1) / 5.234401174884448e+50 - 1.0).abs() <= 1.0e-12)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 98 log-parent original apply_aspect clamps functionlog limits" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let f = @ticker.PercentFormatter::new()
  axes.set_y_limits(1.0, 100.0)
  axes.set_y_scale(@scale.log_scale())
  let secondary = axes.secondary_yaxis(fn(value) { return value * 2.0 + 5.0 }, fn(
    value,
  ) {
    return (value - 5.0) / 2.0
  })
  secondary.set_named_formatter(f.as_base_formatter())
  secondary.apply_aspect()
  assert_eq(f.call(1.0), "1%")
  match secondary.formatter_axis_binding().view_interval() {
    @ticker.FormatterViewInterval::NdArray(view) => {
      assert_eq(view.length(), 2)
      assert_true((view.get(0) / 7.0 - 1.0).abs() <= 1.0e-12)
      assert_true((view.get(1) / 205.0 - 1.0).abs() <= 1.0e-12)
    }
    _ => fail("expected the real axis ndarray view")
  }
}

///|
test "PercentFormatter original axis 99 original update_ticks Percent full batches precede visibility" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 2.0, 5.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.0, 1.0, 2.0, 3.0, 6.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(minor.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">0.00%<").count() - 1, 1)
  assert_eq(svg.split(">2.00%<").count() - 1, 1)
  assert_eq(svg.split(">1.00%<").count() - 1, 1)
  assert_eq(svg.split(">3.00%<").count() - 1, 1)
  assert_true(!svg.contains(">−1.00%<"))
  assert_true(!svg.contains(">5.00%<"))
  assert_true(!svg.contains(">−2.00%<"))
  assert_true(!svg.contains(">6.00%<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(major.locations().get(0), -1.0)
  assert_eq(major.locations().get(1), 0.0)
  assert_eq(major.locations().get(2), 2.0)
  assert_eq(major.locations().get(3), 5.0)
  assert_eq(minor.locations().length(), 4)
  assert_eq(minor.locations().get(0), -2.0)
  assert_eq(minor.locations().get(1), 1.0)
  assert_eq(minor.locations().get(2), 3.0)
  assert_eq(minor.locations().get(3), 6.0)
}

///|
test "PercentFormatter original axis 100 original update_ticks Percent full batches precede visibility" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 2.0, 5.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.0, 1.0, 2.0, 3.0, 6.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(minor.as_base_formatter())
  let poison = @ticker.FormatterAxisBinding::new()
  poison.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(
      message="ValueError: poison major range",
    )
  })
  major.set_axis(Some(poison))
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: poison major range")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(major.locations().length(), 4)
  assert_eq(major.locations().get(0), -1.0)
  assert_eq(major.locations().get(1), 0.0)
  assert_eq(major.locations().get(2), 2.0)
  assert_eq(major.locations().get(3), 5.0)
  assert_eq(minor.locations().length(), 0)
}

///|
test "PercentFormatter original axis 101 original update_ticks Percent full batches precede visibility" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.x_axis()
  ignore(axis)
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 2.0, 5.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.0, 1.0, 2.0, 3.0, 6.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(minor.as_base_formatter())
  let poison = @ticker.FormatterAxisBinding::new()
  poison.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(
      message="ValueError: poison minor range",
    )
  })
  minor.set_axis(Some(poison))
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: poison minor range")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(major.locations().length(), 4)
  assert_eq(major.locations().get(0), -1.0)
  assert_eq(major.locations().get(1), 0.0)
  assert_eq(major.locations().get(2), 2.0)
  assert_eq(major.locations().get(3), 5.0)
  assert_eq(minor.locations().length(), 4)
  assert_eq(minor.locations().get(0), -2.0)
  assert_eq(minor.locations().get(1), 1.0)
  assert_eq(minor.locations().get(2), 3.0)
  assert_eq(minor.locations().get(3), 6.0)
}

///|
test "PercentFormatter original axis 102 original update_ticks Percent full batches precede visibility" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 2.0, 5.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.0, 1.0, 2.0, 3.0, 6.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(minor.as_base_formatter())
  let svg = figure.to_svg_checked()
  assert_eq(svg.split(">0.00%<").count() - 1, 1)
  assert_eq(svg.split(">2.00%<").count() - 1, 1)
  assert_eq(svg.split(">1.00%<").count() - 1, 1)
  assert_eq(svg.split(">3.00%<").count() - 1, 1)
  assert_true(!svg.contains(">−1.00%<"))
  assert_true(!svg.contains(">5.00%<"))
  assert_true(!svg.contains(">−2.00%<"))
  assert_true(!svg.contains(">6.00%<"))
  assert_eq(major.locations().length(), 4)
  assert_eq(major.locations().get(0), -1.0)
  assert_eq(major.locations().get(1), 0.0)
  assert_eq(major.locations().get(2), 2.0)
  assert_eq(major.locations().get(3), 5.0)
  assert_eq(minor.locations().length(), 4)
  assert_eq(minor.locations().get(0), -2.0)
  assert_eq(minor.locations().get(1), 1.0)
  assert_eq(minor.locations().get(2), 3.0)
  assert_eq(minor.locations().get(3), 6.0)
}

///|
test "PercentFormatter original axis 103 original update_ticks Percent full batches precede visibility" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 2.0, 5.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.0, 1.0, 2.0, 3.0, 6.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(minor.as_base_formatter())
  let poison = @ticker.FormatterAxisBinding::new()
  poison.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(
      message="ValueError: poison major range",
    )
  })
  major.set_axis(Some(poison))
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: poison major range")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(major.locations().length(), 4)
  assert_eq(major.locations().get(0), -1.0)
  assert_eq(major.locations().get(1), 0.0)
  assert_eq(major.locations().get(2), 2.0)
  assert_eq(major.locations().get(3), 5.0)
  assert_eq(minor.locations().length(), 0)
}

///|
test "PercentFormatter original axis 104 original update_ticks Percent full batches precede visibility" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let figure = @scene.figure(width=300, height=180)
  let axes = figure.axes()
  axes.set_x_limits(0.0, 4.0)
  axes.set_y_limits(0.0, 4.0)
  axes.set_x_locator(@ticker.NullLocator::new().as_locator())
  axes.set_y_locator(@ticker.NullLocator::new().as_locator())
  let axis = axes.y_axis()
  ignore(axis)
  let major = @ticker.PercentFormatter::new()
  let minor = @ticker.PercentFormatter::new()
  axis.set_locator(
    @ticker.FixedLocator::new([-1.0, 0.0, 2.0, 5.0]).as_locator(),
  )
  axis.set_minor_locator(
    @ticker.FixedLocator::new([-2.0, 0.0, 1.0, 2.0, 3.0, 6.0]).as_minor_locator(),
  )
  axis.set_named_formatter(major.as_base_formatter())
  axis.set_minor_named_formatter(minor.as_base_formatter())
  let poison = @ticker.FormatterAxisBinding::new()
  poison.bind_view_interval(() => {
    raise @core.DataError::InvalidTicks(
      message="ValueError: poison minor range",
    )
  })
  minor.set_axis(Some(poison))
  let failed = try {
    ignore(figure.to_svg_checked())
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: poison minor range")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(major.locations().length(), 4)
  assert_eq(major.locations().get(0), -1.0)
  assert_eq(major.locations().get(1), 0.0)
  assert_eq(major.locations().get(2), 2.0)
  assert_eq(major.locations().get(3), 5.0)
  assert_eq(minor.locations().length(), 4)
  assert_eq(minor.locations().get(0), -2.0)
  assert_eq(minor.locations().get(1), 1.0)
  assert_eq(minor.locations().get(2), 3.0)
  assert_eq(minor.locations().get(3), 6.0)
}

///|
test "PercentFormatter original axis 105 raw integer zero xmax preserves dummy range origin" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.set_xmax(@ticker.PercentXMax::Integer(@bigint.BigInt::from_int(0)))
  f.create_dummy_axis()
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ZeroDivisionError: division by zero")
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 106 raw integer zero xmax preserves dummy range origin" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.set_xmax(@ticker.PercentXMax::Integer(@bigint.BigInt::from_int(0)))
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ZeroDivisionError: float division by zero")
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 107 raw integer zero xmax preserves dummy range origin" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.set_xmax(@ticker.PercentXMax::Integer(@bigint.BigInt::from_int(0)))
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([0.0, 1.0]),
    ),
  )
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 108 raw integer zero xmax preserves dummy range origin" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.set_xmax(@ticker.PercentXMax::Integer(@bigint.BigInt::from_int(0)))
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([0L, 1L]),
    ),
  )
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 109 raw integer zero xmax preserves dummy range origin" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.set_xmax(@ticker.PercentXMax::Boolean(false))
  f.create_dummy_axis()
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ZeroDivisionError: division by zero")
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 110 raw integer zero xmax preserves dummy range origin" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.set_xmax(@ticker.PercentXMax::Boolean(false))
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(@ticker.FormatterViewInterval::Sequence([0.0, 1.0]))
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ZeroDivisionError: float division by zero")
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 111 raw integer zero xmax preserves dummy range origin" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.set_xmax(@ticker.PercentXMax::Boolean(false))
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_array([0.0, 1.0]),
    ),
  )
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 112 raw integer zero xmax preserves dummy range origin" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  f.set_xmax(@ticker.PercentXMax::Boolean(false))
  f.create_dummy_axis()
  f
  .axis()
  .unwrap()
  .set_view_interval(
    @ticker.FormatterViewInterval::NdArray(
      @ticker.TickValues::from_int64_array([0L, 1L]),
    ),
  )
  let failed = try {
    ignore(f.format_ticks_view(@ticker.TickValues::from_array([1.0])))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "OverflowError: cannot convert float infinity to integer",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 113 later provider error preserves full batch locations" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new()
  let count = @ref.Ref(0)
  let binding = @ticker.FormatterAxisBinding::new()
  binding.bind_view_interval(() => {
    count.val += 1
    if count.val == 2 {
      raise @core.DataError::InvalidTicks(
        message="ValueError: second view fails",
      )
    }
    @ticker.FormatterViewInterval::Sequence([0.0, 1.0])
  })
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.format_ticks([1.0, 2.0, 3.0]))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: second view fails")
      true
    }
    _ => false
  }
  assert_true(failed)
  assert_eq(count.val, 2)
  assert_eq(f.locations().length(), 3)
  assert_eq(f.locations().get(2), 3.0)
}

///|
test "PercentFormatter original axis 114 view unpack precedes percent conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(@ticker.FormatterViewInterval::Sequence([]))
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.call(1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "ValueError: not enough values to unpack (expected 2, got 0)",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 115 view unpack precedes percent conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(@ticker.FormatterViewInterval::Sequence([1.0]))
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.call(1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(
        message, "ValueError: not enough values to unpack (expected 2, got 1)",
      )
      true
    }
    _ => false
  }
  assert_true(failed)
}

///|
test "PercentFormatter original axis 116 view unpack precedes percent conversion" {
  let saved_minus = @config.unicode_minus()
  defer @config.set_unicode_minus(saved_minus)
  let saved_tex = @config.text_usetex()
  defer @config.set_text_usetex(saved_tex)
  @config.set_unicode_minus(true)
  @config.set_text_usetex(false)
  let f = @ticker.PercentFormatter::new(xmax=@ticker.PercentXMax::Number(0.0))
  let binding = @ticker.FormatterAxisBinding::new()
  binding.set_view_interval(
    @ticker.FormatterViewInterval::Sequence([0.0, 1.0, 2.0]),
  )
  f.set_axis(Some(binding))
  let failed = try {
    ignore(f.call(1.0))
    false
  } catch {
    @core.DataError::InvalidTicks(message~) => {
      assert_eq(message, "ValueError: too many values to unpack (expected 2)")
      true
    }
    _ => false
  }
  assert_true(failed)
}
