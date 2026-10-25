///|
fn endpoint_bar_logit_figure(
  horizontal : Bool,
) -> (@render.Figure, @axis.Axis) raise {
  let values = @axis.axis(horizontal~)
  values.set_scale(@ticker_scale.logit_scale())
  let categories = @axis.axis(horizontal=!horizontal)
  categories.set_limits(-0.5, 0.5)
  let figure = @render.figure(
    400,
    200,
    0,
    [
      @render.panel_with_sharing(
        None,
        [
          @render.Artist::BarSegments(
            [@core.bar_segment(0.0, 1.0, width=0.6)],
            horizontal,
            @core.style("red"),
          ),
        ],
        None,
        [],
        None,
        if horizontal {
          values
        } else {
          categories
        },
        if horizontal {
          categories
        } else {
          values
        },
        None,
        None,
        false,
        [],
        [],
      ),
    ],
    [],
    None,
  )
  (figure, values)
}

///|
test "standalone render figures use a finite probability minimum for full Logit bar areas" {
  for horizontal in [false, true] {
    let (figure, axis) = endpoint_bar_logit_figure(horizontal)
    let (frame, _) = render_drawing_with_positions_checked(figure)
    assert_eq(frame.targets().length(), 1)
    assert_eq(axis.get_minpos(), 1.0e-7)
    assert_eq(frame.targets()[0].info.value, 1.0)
    let point = frame.targets()[0].info.point
    assert_eq(frame.hit_test(point.screen_x, point.screen_y), Some(point))
    assert_eq(artist_minpos(figure.panels()[0].artists(), horizontal), 1.0)
    assert_false(frame.svg().contains("NaN"))
    assert_false(frame.svg().contains("Infinity"))
  }
}

///|
test "render probability minimum fallback retains explicit owning-axis values and checked errors" {
  let (figure, axis) = endpoint_bar_logit_figure(false)
  bind_render_data_minima(figure)
  assert_eq(axis.get_minpos(), 1.0e-7)
  axis.bind_minpos(() => 2.0)
  bind_render_data_minima(figure)
  assert_eq(axis.get_minpos(), 2.0)
  axis.bind_minpos(() => {
    raise @core.DataError::InvalidTicks(message="explicit render minimum")
  })
  bind_render_data_minima(figure)
  try axis.get_minpos() catch {
    @core.DataError::InvalidTicks(message~) =>
      assert_eq(message, "explicit render minimum")
    _ => fail("expected caller's minimum error")
  } noraise {
    _ => fail("explicit error must retain precedence")
  }
}
