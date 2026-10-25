///|
test "automatic Logit bars spanning both boundaries retain a finite viewport" {
  for horizontal in [false, true] {
    let fig = @mathplotlib.figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.grouped_bar(["A"], [[1.0]], horizontal~)
    ax.legend([])
    if horizontal {
      ax.set_x_scale(@mathplotlib.logit_scale())
    } else {
      ax.set_y_scale(@mathplotlib.logit_scale())
    }
    let frame = fig.to_drawing()
    assert_eq(frame.targets().length(), 1)
    assert_false(frame.svg().contains("NaN"))
    assert_false(frame.svg().contains("Infinity"))
    let point = frame.targets()[0].info.point
    assert_eq(
      frame.hit_test(point.screen_x, point.screen_y, radius=0.0),
      Some(point),
    )
    assert_eq(ax.data_minpos(horizontal~), 1.0)
    let axis = if horizontal { ax.x_axis() } else { ax.y_axis() }
    assert_eq(axis.get_minpos(), 1.0e-7)
  }
}

///|
test "automatic Logit signed bars handle endpoint-only ranges in either orientation" {
  for horizontal in [false, true] {
    for (baseline, value) in [(-1.0, 3.0), (2.0, -3.0)] {
      let fig = @mathplotlib.figure(width=400, height=200)
      let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
      ax.stacked_bar(["A"], [[value]], baseline~, horizontal~, labels=["Area"])
      ax.legend([])
      if horizontal {
        ax.set_x_scale(@mathplotlib.logit_scale())
      } else {
        ax.set_y_scale(@mathplotlib.logit_scale())
      }
      let frame = fig.to_drawing()
      assert_eq(frame.targets().length(), 1)
      assert_eq(frame.targets()[0].info.value, value)
      let point = frame.targets()[0].info.point
      assert_eq(frame.hit_test(point.screen_x, point.screen_y), Some(point))
      let view = if horizontal {
        ax.get_xlim_checked()
      } else {
        ax.get_ylim_checked()
      }
      assert_true(
        view.lower() > 0.0 && view.lower() < view.upper() && view.upper() < 1.0,
      )
      assert_false(frame.svg().contains("NaN"))
      assert_false(frame.svg().contains("Infinity"))
    }
  }
}

///|
test "Logit default minimum fallback preserves raw cache numeric scales and explicit overrides" {
  let fig = @mathplotlib.figure()
  let ax = fig.axes()
  ax.grouped_bar(["A"], [[1.0]])
  let axis = ax.y_axis()
  assert_eq(ax.data_minpos(horizontal=false), 1.0)
  assert_eq(axis.get_minpos(), 1.0)
  ax.set_y_scale(@mathplotlib.logit_scale())
  assert_eq(axis.get_minpos(), 1.0e-7)
  ax.set_y_scale(@mathplotlib.log_scale())
  assert_eq(axis.get_minpos(), 1.0)
  ax.set_y_scale(@mathplotlib.linear_scale())
  assert_eq(axis.get_minpos(), 1.0)
  ax.set_y_scale(@mathplotlib.logit_scale())
  axis.bind_minpos(() => 2.0)
  assert_eq(axis.get_minpos(), 2.0)
  axis.bind_minpos(() => {
    raise @mathplotlib.DataError::InvalidTicks(
      message="explicit minimum failed",
    )
  })
  try axis.get_minpos() catch {
    @mathplotlib.DataError::InvalidTicks(message~) =>
      assert_eq(message, "explicit minimum failed")
    _ => fail("expected the caller error")
  } noraise {
    _ => fail("explicit minimum must retain precedence")
  }
  assert_eq(ax.data_minpos(horizontal=false), 1.0)
}

///|
test "legacy ordinary bars no longer fail Logit automatic view construction at endpoint one" {
  for horizontal in [false, true] {
    let fig = @mathplotlib.figure(width=400, height=200)
    let ax = fig.axes()
    if horizontal {
      ax.barh([0.0], [1.0])
      ax.set_x_scale(@mathplotlib.logit_scale())
    } else {
      ax.bar([@mathplotlib.point(0.0, 1.0)])
      ax.set_y_scale(@mathplotlib.logit_scale())
    }
    let document = fig.to_svg_checked()
    let view = if horizontal {
      ax.get_xlim_checked()
    } else {
      ax.get_ylim_checked()
    }
    assert_true(
      view.lower() > 0.0 && view.lower() < view.upper() && view.upper() < 1.0,
    )
    assert_false(document.contains("NaN"))
    assert_false(document.contains("Infinity"))
  }
}
