///|
fn image_filter_close(first : Double, second : Double) -> Bool {
  Double::abs(first - second) < 1.0e-9
}

///|
test "bilinear filtering keeps transparent source RGB premultiplied" {
  let source = [
    [
      try! @colors.rgba(1.0, 0.0, 0.0),
      try! @colors.rgba(0.0, 0.0, 1.0, alpha=0.0),
    ],
  ]
  let pixel = filtered_pixel(
    source,
    0,
    1,
    1,
    4,
    @render.ImageInterpolation::Bilinear,
  )
  assert_true(image_filter_close(pixel.red(), 1.0))
  assert_true(image_filter_close(pixel.green(), 0.0))
  assert_true(image_filter_close(pixel.blue(), 0.0))
  assert_true(image_filter_close(pixel.alpha(), 0.75))
}

///|
test "auto resolves to Hanning outside nearest upscale cases" {
  assert_true(
    resolve_interpolation(@render.ImageInterpolation::Auto, 3, 3, 2, 2)
    is @render.ImageInterpolation::Hanning,
  )
  assert_true(
    resolve_interpolation(@render.ImageInterpolation::Antialiased, 8, 8, 2, 2)
    is @render.ImageInterpolation::Nearest,
  )
}
