///|
// Image bounds update each coordinate separately: an invalid endpoint on a
// logarithmic x-axis must not discard valid y endpoints (or vice versa).
fn include_image_extent(
  scale : Scale,
  extent : (Double, Double, Double, Double),
) -> Scale {
  let (left, right, bottom, top) = extent
  let mut result = scale
  for value in [left, right] {
    if scale.x_axis_scale.is_valid(value) {
      result = {
        ..result,
        xmin: Double::min(result.xmin, value),
        xmax: Double::max(result.xmax, value),
      }
    }
  }
  for value in [bottom, top] {
    if scale.y_axis_scale.is_valid(value) {
      result = {
        ..result,
        ymin: Double::min(result.ymin, value),
        ymax: Double::max(result.ymax, value),
      }
    }
  }
  result
}

///|
fn image_sticky_edges(
  figure : @render.Figure,
  target_index : Int32,
  horizontal : Bool,
) -> Array[Double] {
  let target = figure.panels()[target_index]
  let target_group = if horizontal {
    target.share_x_group()
  } else {
    target.share_y_group()
  }
  let result = []
  for index, panel in figure.panels() {
    let group = if horizontal {
      panel.share_x_group()
    } else {
      panel.share_y_group()
    }
    if same_group(target_group, group, target_index, index) {
      for artist in panel.artists() {
        match artist_image_extent(artist) {
          Some((left, right, bottom, top)) => {
            result.push(if horizontal { left } else { bottom })
            result.push(if horizontal { right } else { top })
          }
          None => ()
        }
      }
    }
  }
  result
}

///|
// Clamp only margins crossing an outer sticky value. An image inside a wider
// data range must not suppress that range's padding. Keep the upstream
// relative tolerance so tiny data ranges behave like ordinary-sized ranges.
fn clamp_sticky_bounds(
  lower : Double,
  upper : Double,
  padded_lower : Double,
  padded_upper : Double,
  axis_scale : @ticker_scale.Scale,
  stickies : Array[Double],
) -> (Double, Double) {
  let tolerance = 1.0e-5 * Double::abs(upper - lower)
  let mut lower_sticky : Double? = None
  let mut upper_sticky : Double? = None
  for value in stickies {
    if axis_scale.is_valid(value) {
      if value < lower + tolerance {
        lower_sticky = Some(
          match lower_sticky {
            Some(previous) => Double::max(previous, value)
            None => value
          },
        )
      }
      if value >= upper - tolerance {
        upper_sticky = Some(
          match upper_sticky {
            Some(previous) => Double::min(previous, value)
            None => value
          },
        )
      }
    }
  }
  (
    match lower_sticky {
      Some(value) => Double::max(padded_lower, value)
      None => padded_lower
    },
    match upper_sticky {
      Some(value) => Double::min(padded_upper, value)
      None => padded_upper
    },
  )
}
