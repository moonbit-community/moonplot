///|
test "violin default tooltip identifies estimated density and complete range without inventing quantile probabilities" {
  let point = @drawing.hit_point(0, 0, 1, 1.0, 2.0, 50.0, 50.0)
  let make = (part : @drawing.ViolinPart) => {
    @drawing.hit_info(
      point,
      Violin,
      value=2.0,
      violin=Some(
        @drawing.violin_info(
          0,
          position=1.0,
          mean=2.5,
          median=2.0,
          minimum=1.0,
          maximum=4.0,
          part~,
        ),
      ),
    )
  }
  assert_eq(tooltip_kind(Violin), "violin")
  assert_eq(tooltip_rows(make(Body(1, 2.0, 0.5))), [
    ("Group", "1"),
    ("Mean", "2.5"),
    ("Median", "2"),
    ("Range", "1 – 4"),
    ("KDE coordinate", "2"),
    ("Density", "0.5"),
  ])
  assert_eq(tooltip_rows(make(Range)), [
    ("Group", "1"),
    ("Mean", "2.5"),
    ("Median", "2"),
    ("Range", "1 – 4"),
  ])
  assert_eq(tooltip_rows(make(Quantile(1, 2.0)))[4], ("Quantile", "2"))
  assert_eq(tooltip_rows(@drawing.hit_info(point, Violin, value=2.0)), [
    ("Value", "2"),
  ])
}

///|
test "real coincident violin summary hit passes the final selected typed part to the DOM callback" {
  let fig = @plot.figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(0.0, 2.0)
  ax.set_y_limits(0.0, 10.0)
  ax.legend([])
  ignore(
    ax.violinplot(
      [[2.0, 2.0, 2.0]],
      points=5,
      showmeans=true,
      showmedians=true,
      quantiles=[[0.25, 0.75]],
    ),
  )
  let frame = fig.to_drawing()
  let point = frame.hit_test(200.0, 160.0, radius=0.0).unwrap()
  let received : @ref.Ref[@drawing.HitInfo?] = @ref.Ref(None)
  ignore(
    view(frame, id="violin", hovered=point, on_event=_ => @rabbita.none, tooltip=info => {
      received.val = Some(info)
      @html.b("估计密度与摘要")
    }),
  )
  assert_eq(
    received.val.unwrap().violin.unwrap().part,
    @drawing.ViolinPart::Quantile(1, 2.0),
  )
  assert_eq(received.val.unwrap(), frame.hit_info(point).unwrap())
}
