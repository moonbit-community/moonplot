///|
/// Public core values are re-exported from the facade package.
pub using @core {
  type Bounds,
  type DataError,
  type Limits,
  type MaskedArray,
  type MaskedMatrix,
  type MaskError,
  type Point,
  type Series,
  type Style,
  bounds,
  bounds_from_points,
  limits,
  masked_array,
  masked_matrix,
  point,
  series,
  style,
}

///|
/// Typed RGB and RGBA values used by colored image inputs.
pub using @colors {type Rgb, type Rgba, rgb, rgba}

///|
/// The object-style figure API is owned by the scene package.
pub using @scene {
  type Artist,
  type Axes,
  type Figure,
  type SubFigure,
  type Histogram,
  type ContourSet,
  type ViolinBandwidth,
  type ViolinSide,
  type ViolinStats,
  type SecondaryAxis,
  type SecondaryAxisLocation,
  type StreamplotSet,
  figure,
}

///|
/// Axis configuration is exposed as a separate value object.
pub using @axis {type Axis, axis}

///|
/// Ordered string-to-position category conversion.
pub using @category {type CategoryAxis, category}

///|
/// Linear, logarithmic, Asinh and Logit coordinate scales.
pub using @scale {type Scale, linear_scale, log_scale, asinh_scale, logit_scale}

///|
/// Numeric tick formatters and the main Matplotlib-style formatter helpers.
pub using @ticker {
  type Formatter,
  scalar_formatter,
  fixed_formatter,
  index_formatter,
  format_str_formatter,
  str_method_formatter,
  eng_formatter,
  percent_formatter,
  log_formatter,
  null_formatter,
  func_formatter,
}

///|
/// Regular subplot grid layout values.
pub using @gridspec {type GridSpec, type LayoutError, type Rect, gridspec}
