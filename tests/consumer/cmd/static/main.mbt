///|
/// This executable imports only the public facade, without browser packages.
fn main raise {
  let figure = @plot.figure(width=600, height=360)
  figure.set_title("MoonPlot from a release archive")
  figure.set_x_label("Sample")
  figure.set_y_label("Value")
  figure.plot([1.0, 2.0, 3.0], [2.0, 5.0, 4.0])
  let drawing = figure.to_drawing()
  assert_eq(drawing.points().length(), 3)
  assert_eq(drawing.svg(), figure.to_svg())
  println(drawing.svg())
}
