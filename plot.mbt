///|
/// Convenience function for a line plot rendered as SVG.
pub fn plot_svg(
  xs : Array[Double],
  ys : Array[Double],
) -> String raise DataError {
  let result = figure()
  result.plot(xs, ys)
  result.to_svg()
}
