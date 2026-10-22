///|
fn finite_or(value : Double, fallback : Double) -> Double {
  if value.is_nan() || value.is_inf() {
    fallback
  } else {
    value
  }
}

///|
fn include_point(scale : Scale, p : @core.Point) -> Scale {
  if p.is_missing() ||
    !scale.x_axis_scale.is_valid(p.x()) ||
    !scale.y_axis_scale.is_valid(p.y()) {
    scale
  } else {
    {
      xmin: Double::min(scale.xmin, p.x()),
      xmax: Double::max(scale.xmax, p.x()),
      ymin: Double::min(scale.ymin, p.y()),
      ymax: Double::max(scale.ymax, p.y()),
      x_axis_scale: scale.x_axis_scale,
      y_axis_scale: scale.y_axis_scale,
    }
  }
}

///|
// Blended reference artists contribute only their data-coordinate dimension.
fn include_data_coordinate(
  scale : Scale,
  value : Double,
  horizontal : Bool,
) -> Scale {
  let axis_scale = if horizontal {
    scale.x_axis_scale
  } else {
    scale.y_axis_scale
  }
  if !axis_scale.is_valid(value) {
    return scale
  }
  if horizontal {
    {
      ..scale,
      xmin: Double::min(scale.xmin, value),
      xmax: Double::max(scale.xmax, value),
    }
  } else {
    {
      ..scale,
      ymin: Double::min(scale.ymin, value),
      ymax: Double::max(scale.ymax, value),
    }
  }
}

///|
fn include_artist(scale : Scale, artist : @render.Artist) -> Scale {
  match artist {
    @render.Artist::Line(points, _) =>
      points.fold(init=scale, (current, p) => include_point(current, p))
    @render.Artist::Scatter(points, _) =>
      points.fold(init=scale, (current, p) => include_point(current, p))
    @render.Artist::PathCollection(points, _) =>
      points.fold(init=scale, (current, p) => include_point(current, p))
    @render.Artist::Bar(points, _) =>
      points.fold(init=scale, (current, p) => {
        let next = include_point(current, p)
        include_point(next, @core.point(p.x(), 0.0))
      })
    @render.Artist::BarH(points, _) =>
      points.fold(init=scale, (current, p) => {
        let next = include_point(current, p)
        include_point(next, @core.point(0.0, p.y()))
      })
    @render.Artist::FillBetween(upper, lower, _) => {
      let upper_scale = upper.fold(init=scale, (current, p) => {
        include_point(current, p)
      })
      lower.fold(init=upper_scale, (current, p) => include_point(current, p))
    }
    @render.Artist::Polygon(points, _) =>
      points.fold(init=scale, (current, p) => include_point(current, p))
    @render.Artist::CompoundPolygon(polygons, _) => {
      let mut result = scale
      for polygon in polygons {
        result = polygon.fold(init=result, (current, p) => {
          include_point(current, p)
        })
      }
      result
    }
    @render.Artist::GouraudTriangle(points, _) =>
      points.fold(init=scale, (current, p) => include_point(current, p))
    @render.Artist::HLine(value, _) =>
      include_data_coordinate(scale, value, false)
    @render.Artist::VLine(value, _) =>
      include_data_coordinate(scale, value, true)
    @render.Artist::AxLine(point, _, _) => include_point(scale, point)
    @render.Artist::HSpan(lower, upper, _) =>
      include_data_coordinate(
        include_data_coordinate(scale, lower, false),
        upper,
        false,
      )
    @render.Artist::VSpan(lower, upper, _) =>
      include_data_coordinate(
        include_data_coordinate(scale, lower, true),
        upper,
        true,
      )
    @render.Artist::Text(_, _, _, _) => scale
    @render.Artist::Annotation(_) => scale
    @render.Artist::ErrorBar(points, yerr, xerr, _) => {
      let mut result = scale
      for i in 0..<points.length() {
        let p = points[i]
        if p.is_finite() {
          result = include_point(result, p)
          let y_error = if yerr.length() == 0 { 0.0 } else { yerr[i] }
          let x_error = if xerr.length() == 0 { 0.0 } else { xerr[i] }
          result = include_point(result, @core.point(p.x(), p.y() - y_error))
          result = include_point(result, @core.point(p.x(), p.y() + y_error))
          result = include_point(result, @core.point(p.x() - x_error, p.y()))
          result = include_point(result, @core.point(p.x() + x_error, p.y()))
        }
      }
      result
    }
    @render.Artist::Image(_, _, _, _)
    | @render.Artist::ImageNorm(_, _, _, _, _, _, _)
    | @render.Artist::ColorImage(_, _, _, _, _) =>
      match artist_image_extent(artist) {
        Some(bounds) => include_image_extent(scale, bounds)
        None => scale
      }
    @render.Artist::Table(_) => scale
    @render.Artist::Pie(_, _, _, _) => scale
    @render.Artist::BoxPlot(stats, horizontal, _) => {
      let mut result = scale
      for index, stat in stats {
        let position = Double::from_int(index + 1)
        if horizontal {
          result = include_point(
            result,
            @core.point(stat.lower_whisker(), position),
          )
          result = include_point(
            result,
            @core.point(stat.upper_whisker(), position),
          )
          for coordinate in [stat.q1(), stat.q3(), stat.median()] {
            result = include_point(
              result,
              @core.point(coordinate, position - 0.3),
            )
            result = include_point(
              result,
              @core.point(coordinate, position + 0.3),
            )
          }
          for flier in stat.fliers() {
            result = include_point(result, @core.point(flier, position))
          }
        } else {
          result = include_point(
            result,
            @core.point(position, stat.lower_whisker()),
          )
          result = include_point(
            result,
            @core.point(position, stat.upper_whisker()),
          )
          for coordinate in [stat.q1(), stat.q3(), stat.median()] {
            result = include_point(
              result,
              @core.point(position - 0.3, coordinate),
            )
            result = include_point(
              result,
              @core.point(position + 0.3, coordinate),
            )
          }
          for flier in stat.fliers() {
            result = include_point(result, @core.point(position, flier))
          }
        }
      }
      result
    }
    @render.Artist::Quiver(points, vectors, _) => {
      let mut result = scale
      let count = Int32::min(points.length(), vectors.length())
      for index in 0..<count {
        let point = points[index]
        let vector = vectors[index]
        result = include_point(result, point)
        result = include_point(
          result,
          @core.point(point.x() + vector.x(), point.y() + vector.y()),
        )
      }
      result
    }
    @render.Artist::Violin(
      stats,
      positions,
      widths,
      horizontal,
      _,
      _,
      _,
      _,
      _,
      _,
      _
    ) => {
      let mut result = scale
      let count = Int32::min(
        stats.length(),
        Int32::min(positions.length(), widths.length()),
      )
      for index in 0..<count {
        let stat = stats[index]
        let position = positions[index]
        let half_width = widths[index] / 2.0
        let coords = stat.coords()
        for coordinate in coords {
          if horizontal {
            result = include_point(
              result,
              @core.point(coordinate, position - half_width),
            )
            result = include_point(
              result,
              @core.point(coordinate, position + half_width),
            )
          } else {
            result = include_point(
              result,
              @core.point(position - half_width, coordinate),
            )
            result = include_point(
              result,
              @core.point(position + half_width, coordinate),
            )
          }
        }
      }
      result
    }
  }
}

///|
fn normalize_axis_bounds(
  lower : Double,
  upper : Double,
  axis_scale : @ticker_scale.Scale,
  margin : Double,
  stickies : Array[Double],
) -> (Double, Double) {
  let transformed_lower = axis_scale.transform(lower)
  let transformed_upper = axis_scale.transform(upper)
  let padding = finite_or((transformed_upper - transformed_lower) * margin, 0.0)
  let (padded_lower, padded_upper) = (
    axis_scale.inverse(transformed_lower - padding),
    axis_scale.inverse(transformed_upper + padding),
  )
  clamp_sticky_bounds(
    lower, upper, padded_lower, padded_upper, axis_scale, stickies,
  )
}

///|
fn normalize_auto_scale(
  scale : Scale,
  x_margin : Double,
  y_margin : Double,
  x_stickies : Array[Double],
  y_stickies : Array[Double],
) -> Scale {
  let mut xmin = finite_or(
    scale.xmin,
    if scale.x_axis_scale.is_log() {
      1.0
    } else {
      0.0
    },
  )
  let mut xmax = finite_or(
    scale.xmax,
    if scale.x_axis_scale.is_log() {
      10.0
    } else {
      1.0
    },
  )
  let mut ymin = finite_or(
    scale.ymin,
    if scale.y_axis_scale.is_log() {
      1.0
    } else {
      0.0
    },
  )
  let mut ymax = finite_or(
    scale.ymax,
    if scale.y_axis_scale.is_log() {
      10.0
    } else {
      1.0
    },
  )
  if scale.x_axis_scale.is_log() {
    if xmin <= 0.0 {
      xmin = 1.0
    }
    if xmax <= 0.0 {
      xmax = 10.0
    }
  }
  if scale.y_axis_scale.is_log() {
    if ymin <= 0.0 {
      ymin = 1.0
    }
    if ymax <= 0.0 {
      ymax = 10.0
    }
  }
  if xmin > xmax {
    if scale.x_axis_scale.is_log() {
      xmin = 1.0
      xmax = 10.0
    } else {
      xmin = 0.0
      xmax = 1.0
    }
  }
  if ymin > ymax {
    if scale.y_axis_scale.is_log() {
      ymin = 1.0
      ymax = 10.0
    } else {
      ymin = 0.0
      ymax = 1.0
    }
  }
  if xmin == xmax {
    if scale.x_axis_scale.is_log() {
      xmin = xmin / 2.0
      xmax = xmax * 2.0
    } else {
      xmin = xmin - 0.5
      xmax = xmax + 0.5
    }
  }
  if ymin == ymax {
    if scale.y_axis_scale.is_log() {
      ymin = ymin / 2.0
      ymax = ymax * 2.0
    } else {
      ymin = ymin - 0.5
      ymax = ymax + 0.5
    }
  }
  let (normalized_xmin, normalized_xmax) = normalize_axis_bounds(
    xmin,
    xmax,
    scale.x_axis_scale,
    x_margin,
    x_stickies,
  )
  let (normalized_ymin, normalized_ymax) = normalize_axis_bounds(
    ymin,
    ymax,
    scale.y_axis_scale,
    y_margin,
    y_stickies,
  )
  {
    xmin: normalized_xmin,
    xmax: normalized_xmax,
    ymin: normalized_ymin,
    ymax: normalized_ymax,
    x_axis_scale: scale.x_axis_scale,
    y_axis_scale: scale.y_axis_scale,
  }
}

///|
fn artist_data_scale(panel : @render.Panel) -> Scale {
  artists_data_scale(
    panel.artists(),
    panel.x_axis().scale(),
    panel.y_axis().scale(),
  )
}

///|
fn artists_data_scale(
  artists : Array[@render.Artist],
  x_axis_scale : @ticker_scale.Scale,
  y_axis_scale : @ticker_scale.Scale,
) -> Scale {
  let initial : Scale = {
    xmin: 1.0 / 0.0,
    xmax: -1.0 / 0.0,
    ymin: 1.0 / 0.0,
    ymax: -1.0 / 0.0,
    x_axis_scale,
    y_axis_scale,
  }
  artists.fold(init=initial, (current, artist) => {
    include_artist(current, artist)
  })
}

///|
/// Local finite artist data bounds, independent of scale validity and view limits.
pub fn artist_data_interval(
  artists : Array[@render.Artist],
  horizontal : Bool,
) -> @core.Limits {
  let data = artists_data_scale(
    artists,
    @ticker_scale.Linear,
    @ticker_scale.Linear,
  )
  if horizontal {
    @core.limits(data.xmin, data.xmax)
  } else {
    @core.limits(data.ymin, data.ymax)
  }
}

///|
fn raw_scale(panel : @render.Panel) -> Scale {
  let x_axis_scale = panel.x_axis().scale()
  let y_axis_scale = panel.y_axis().scale()
  let base = match panel.explicit_bounds() {
    Some(limits) =>
      {
        xmin: limits.xmin(),
        xmax: limits.xmax(),
        ymin: limits.ymin(),
        ymax: limits.ymax(),
        x_axis_scale,
        y_axis_scale,
      }
    None => {
      let data = artist_data_scale(panel)
      let x = if panel.x_axis().has_named_log_locator() {
        artist_data_interval(panel.artists(), true)
      } else {
        @core.limits(data.xmin, data.xmax)
      }
      let y = if panel.y_axis().has_named_log_locator() {
        artist_data_interval(panel.artists(), false)
      } else {
        @core.limits(data.ymin, data.ymax)
      }
      {
        ..data,
        xmin: x.lower(),
        xmax: x.upper(),
        ymin: y.lower(),
        ymax: y.upper(),
      }
    }
  }
  let with_x = match panel.x_axis().limits() {
    Some(limits) => { ..base, xmin: limits.lower(), xmax: limits.upper(), }
    None => base
  }
  match panel.y_axis().limits() {
    Some(limits) => { ..with_x, ymin: limits.lower(), ymax: limits.upper(), }
    None => with_x
  }
}

///|
fn same_group(
  target : Int32?,
  candidate : Int32?,
  target_index : Int32,
  candidate_index : Int32,
) -> Bool {
  match target {
    Some(group) =>
      match candidate {
        Some(other) => group == other
        None => false
      }
    None => target_index == candidate_index
  }
}

///|
fn group_limit(
  figure : @render.Figure,
  target_index : Int32,
  horizontal : Bool,
) -> @core.Limits? {
  let target = figure.panels()[target_index]
  let target_group = if horizontal {
    target.share_x_group()
  } else {
    target.share_y_group()
  }
  let mut result : @core.Limits? = None
  for index, panel in figure.panels() {
    let candidate_group = if horizontal {
      panel.share_x_group()
    } else {
      panel.share_y_group()
    }
    if same_group(target_group, candidate_group, target_index, index) {
      let limit = if horizontal {
        panel.x_axis().limits()
      } else {
        panel.y_axis().limits()
      }
      match (result, limit) {
        (None, Some(value)) => result = Some(value)
        _ => ()
      }
    }
  }
  result
}

///|
fn grouped_raw_scale(figure : @render.Figure, target_index : Int32) -> Scale {
  let target = figure.panels()[target_index]
  let mut result = raw_scale(target)
  for index, panel in figure.panels() {
    if index == target_index {
      continue
    }
    let include_x = same_group(
      target.share_x_group(),
      panel.share_x_group(),
      target_index,
      index,
    )
    let include_y = same_group(
      target.share_y_group(),
      panel.share_y_group(),
      target_index,
      index,
    )
    if include_x || include_y {
      let candidate = raw_scale(panel)
      result = {
        ..result,
        xmin: if include_x {
          Double::min(result.xmin, candidate.xmin)
        } else {
          result.xmin
        },
        xmax: if include_x {
          Double::max(result.xmax, candidate.xmax)
        } else {
          result.xmax
        },
        ymin: if include_y {
          Double::min(result.ymin, candidate.ymin)
        } else {
          result.ymin
        },
        ymax: if include_y {
          Double::max(result.ymax, candidate.ymax)
        } else {
          result.ymax
        },
      }
    }
  }
  result
}

///|
fn compute_scale(
  figure : @render.Figure,
  target_index : Int32,
) -> Scale raise @core.DataError {
  let target = figure.panels()[target_index]
  let raw = grouped_raw_scale(figure, target_index)
  let x_axis = target.x_axis()
  let y_axis = target.y_axis()
  let x_log = x_axis.has_named_log_locator()
  let y_log = y_axis.has_named_log_locator()
  let x_active = x_log &&
    group_limit(figure, target_index, true) is None &&
    x_axis.current_view_limits() is None
  let y_active = y_log &&
    group_limit(figure, target_index, false) is None &&
    y_axis.current_view_limits() is None
  let date_x = if x_log {
    @core.limits(raw.xmin, raw.xmax)
  } else {
    x_axis.date_nonsingular_bounds(raw.xmin, raw.xmax)
  }
  let date_y = if y_log {
    @core.limits(raw.ymin, raw.ymax)
  } else {
    y_axis.date_nonsingular_bounds(raw.ymin, raw.ymax)
  }
  let date_x = if x_log && !x_active {
    date_x
  } else {
    x_axis.numeric_nonsingular_bounds_checked(date_x.lower(), date_x.upper())
  }
  let date_y = if y_log && !y_active {
    date_y
  } else {
    y_axis.numeric_nonsingular_bounds_checked(date_y.lower(), date_y.upper())
  }
  let date_x = if x_active {
    log_scale_limit_checked(x_axis, date_x)
  } else {
    date_x
  }
  let date_y = if y_active {
    log_scale_limit_checked(y_axis, date_y)
  } else {
    date_y
  }
  let normalized = normalize_auto_scale(
    {
      ..raw,
      xmin: date_x.lower(),
      xmax: date_x.upper(),
      ymin: date_y.lower(),
      ymax: date_y.upper(),
    },
    target.x_margin(),
    target.y_margin(),
    image_sticky_edges(figure, target_index, true),
    image_sticky_edges(figure, target_index, false),
  )
  let normalized = if x_active {
    let (lower, upper) = normalize_axis_bounds(
      date_x.lower(),
      date_x.upper(),
      raw.x_axis_scale,
      target.x_margin(),
      image_sticky_edges(figure, target_index, true),
    )
    { ..normalized, xmin: lower, xmax: upper, }
  } else {
    normalized
  }
  let normalized = if y_active {
    let (lower, upper) = normalize_axis_bounds(
      date_y.lower(),
      date_y.upper(),
      raw.y_axis_scale,
      target.y_margin(),
      image_sticky_edges(figure, target_index, false),
    )
    { ..normalized, ymin: lower, ymax: upper, }
  } else {
    normalized
  }
  let x_view = match group_limit(figure, target_index, true) {
    Some(limits) =>
      target.x_axis().date_nonsingular_bounds(limits.lower(), limits.upper())
    None =>
      target
      .x_axis()
      .view_limits_checked(@core.limits(normalized.xmin, normalized.xmax))
  }
  let y_view = match group_limit(figure, target_index, false) {
    Some(limits) =>
      target.y_axis().date_nonsingular_bounds(limits.lower(), limits.upper())
    None =>
      target
      .y_axis()
      .view_limits_checked(@core.limits(normalized.ymin, normalized.ymax))
  }
  let x_view = if x_active {
    finalize_log_view_checked(x_axis, x_view)
  } else {
    x_view
  }
  let y_view = if y_active {
    finalize_log_view_checked(y_axis, y_view)
  } else {
    y_view
  }
  if (x_log && !x_view.is_finite()) || (y_log && !y_view.is_finite()) {
    raise @core.DataError::NonFiniteLimit(axis="log view")
  }
  {
    ..normalized,
    xmin: x_view.lower(),
    xmax: x_view.upper(),
    ymin: y_view.lower(),
    ymax: y_view.upper(),
  }
}

///|
fn compute_scales(
  figure : @render.Figure,
) -> Array[Scale] raise @core.DataError {
  let result = Array(capacity=figure.panels().length())
  for index in 0..<figure.panels().length() {
    result.push(resolve_panel_scale(figure, index))
  }
  result
}

///|
// Autoscale separately reads the shared axes' minpos after locator.nonsingular.
fn log_scale_limit_checked(
  axis : @axis.Axis,
  limits : @core.Limits,
) -> @core.Limits raise @core.DataError {
  let values = axis.shared_minpos_checked()
  if values.is_empty() {
    raise @core.DataError::InvalidTicks(
      message="shared log axis has no minimum positive data",
    )
  }
  let mut minpos = values[0]
  for value in values {
    if value < minpos {
      minpos = value
    }
  }
  if minpos.is_nan() || minpos.is_inf() {
    minpos = 1.0e-300
  }
  if axis.scale().is_log() {
    @core.limits(
      if limits.lower() <= 0.0 {
        minpos
      } else {
        limits.lower()
      },
      if limits.upper() <= 0.0 {
        minpos
      } else {
        limits.upper()
      },
    )
  } else {
    limits
  }
}

///|
// Match the locator/scale work performed by Axis._set_lim after set_bound.
fn finalize_log_view_checked(
  axis : @axis.Axis,
  limits : @core.Limits,
) -> @core.Limits raise @core.DataError {
  if !limits.is_finite() {
    raise @core.DataError::NonFiniteLimit(axis="log view")
  }
  let descending = limits.lower() > limits.upper()
  let bounds = axis.numeric_nonsingular_bounds_checked(
    limits.lower(),
    limits.upper(),
  )
  let mut minpos = axis.get_minpos()
  if minpos.is_nan() || minpos.is_inf() {
    minpos = 1.0e-300
  }
  let lower = if axis.scale().is_log() && bounds.lower() <= 0.0 {
    minpos
  } else {
    bounds.lower()
  }
  let upper = if axis.scale().is_log() && bounds.upper() <= 0.0 {
    minpos
  } else {
    bounds.upper()
  }
  let (lower, upper) = if upper < lower {
    (upper, lower)
  } else {
    (lower, upper)
  }
  if descending {
    @core.limits(upper, lower)
  } else {
    @core.limits(lower, upper)
  }
}
