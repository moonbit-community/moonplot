///|
fn source_numeric_limits(axis : @axis.Axis) -> Bool {
  axis.has_named_log_locator() ||
  axis.has_named_logit_locator() ||
  axis.scale().is_logit()
}

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
      let x = if source_numeric_limits(panel.x_axis()) {
        artist_data_interval(panel.artists(), true)
      } else {
        @core.limits(data.xmin, data.xmax)
      }
      let y = if source_numeric_limits(panel.y_axis()) {
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
// Renderer data providers are lower-priority fallbacks. Scene's cached data and
// explicitly bound providers, including failures, remain authoritative.
fn bind_render_data_minima(figure : @render.Figure) -> Unit {
  for index, panel in figure.panels() {
    for horizontal in [true, false] {
      let axis = if horizontal { panel.x_axis() } else { panel.y_axis() }
      axis.bind_render_autoscale_minpos(() => {
        let target_group = if horizontal {
          panel.share_x_group()
        } else {
          panel.share_y_group()
        }
        let values : Array[Double] = []
        for other_index, other in figure.panels() {
          let group = if horizontal {
            other.share_x_group()
          } else {
            other.share_y_group()
          }
          if same_group(target_group, group, index, other_index) {
            // autoscale_view reads raw dataLim minima, independently from
            // Axis.get_minpos used by locator NS and the final _set_lim.
            values.push(artist_minpos(other.artists(), horizontal))
          }
        }
        values
      })
      axis.bind_render_minpos(
        () => artist_minpos(panel.artists(), horizontal),
        () => {
          let target_group = if horizontal {
            panel.share_x_group()
          } else {
            panel.share_y_group()
          }
          let values : Array[Double] = []
          for other_index, other in figure.panels() {
            let group = if horizontal {
              other.share_x_group()
            } else {
              other.share_y_group()
            }
            if same_group(target_group, group, index, other_index) {
              let peer = if horizontal {
                other.x_axis()
              } else {
                other.y_axis()
              }
              values.push(peer.get_minpos())
            }
          }
          values
        },
      )
    }
  }
}

///|
fn ir_group_axes(
  figure : @render.Figure,
  target_index : Int32,
  horizontal : Bool,
) -> Array[@axis.Axis] {
  let target = figure.panels()[target_index]
  let target_group = if horizontal {
    target.share_x_group()
  } else {
    target.share_y_group()
  }
  let result : Array[@axis.Axis] = []
  for index, panel in figure.panels() {
    let group = if horizontal {
      panel.share_x_group()
    } else {
      panel.share_y_group()
    }
    if same_group(target_group, group, target_index, index) {
      result.push(if horizontal { panel.x_axis() } else { panel.y_axis() })
    }
  }
  result
}

///|
fn ir_group_data_endpoints(
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
  let result : Array[Double] = []
  for index, panel in figure.panels() {
    let group = if horizontal {
      panel.share_x_group()
    } else {
      panel.share_y_group()
    }
    if same_group(target_group, group, target_index, index) {
      // Raw artist data never incorporates explicit_bounds or stored views.
      let data = artist_data_interval(panel.artists(), horizontal)
      result.push(data.lower())
      result.push(data.upper())
    }
  }
  result
}

///|
fn numeric_axis_view(
  figure : @render.Figure,
  target_index : Int32,
  horizontal : Bool,
) -> @core.Limits raise @core.DataError {
  let target = figure.panels()[target_index]
  let axis = if horizontal { target.x_axis() } else { target.y_axis() }
  if !axis.has_autoscale_view_provider() && axis.limits() is None {
    if target.explicit_bounds() is Some(bounds) {
      // The standalone IR override is a viewport, never raw artist data.
      axis.set_limits(
        if horizontal {
          bounds.xmin()
        } else {
          bounds.ymin()
        },
        if horizontal {
          bounds.xmax()
        } else {
          bounds.ymax()
        },
      )
    }
  }
  axis.resolve_autoscale_view()
  if axis.has_autoscale_view_provider() {
    // The owning Scene resolver includes retained detached shared members.
    // Its own stored Bbox is not a projection of the first IR group limit.
    return axis.stored_view_limits()
  }
  let peers = ir_group_axes(figure, target_index, horizontal)
  let pending = peers.any(peer => peer.autoscale_stale()) ||
    axis.current_view_limits() is None
  if pending {
    // Match _unstale_viewLim: requests are consumed before the checked work.
    for peer in peers {
      peer.clear_autoscale_request()
    }
    if axis.autoscale_on() {
      let data = ir_group_data_endpoints(figure, target_index, horizontal)
      let margin = if horizontal {
        target.x_margin()
      } else {
        target.y_margin()
      }
      let candidate = axis.autoscale_bounds_checked(
        data,
        margin~,
        stickies=grouped_artist_sticky_edges(figure, target_index, horizontal),
        tight=false,
      )
      if candidate is Some(bounds) {
        // Source set_bound reads old bounds even when both new ones exist,
        // then reads the view again to preserve its current direction.
        ignore(axis.lifecycle_view_interval_checked())
        let (first, last) = axis.lifecycle_view_interval_checked()
        let (low, high) = if bounds.upper() < bounds.lower() {
          (bounds.upper(), bounds.lower())
        } else {
          (bounds.lower(), bounds.upper())
        }
        let (lower, upper) = if first > last {
          (high, low)
        } else {
          (low, high)
        }
        let view = axis.set_bound_limits_checked(lower, upper)
        for peer in peers {
          if !physical_equal(peer, axis) {
            ignore(peer.set_bound_limits_checked(view.lower(), view.upper()))
          }
        }
      }
    }
  }
  axis.stored_view_limits()
}

///|
// Date/category and explicit legacy helper profiles retain their old view
// selection. New numeric autoscaling never enters this finite normalizer.
fn legacy_axis_view(
  figure : @render.Figure,
  target_index : Int32,
  horizontal : Bool,
) -> @core.Limits raise @core.DataError {
  let target = figure.panels()[target_index]
  let axis = if horizontal { target.x_axis() } else { target.y_axis() }
  let raw = grouped_raw_scale(figure, target_index)
  let data = if horizontal {
    @core.limits(raw.xmin, raw.xmax)
  } else {
    @core.limits(raw.ymin, raw.ymax)
  }
  let date = axis.date_nonsingular_bounds(data.lower(), data.upper())
  let date = axis.numeric_nonsingular_bounds_checked(date.lower(), date.upper())
  let normalized = normalize_auto_scale(
    {
      xmin: if horizontal {
        date.lower()
      } else {
        0.0
      },
      xmax: if horizontal {
        date.upper()
      } else {
        1.0
      },
      ymin: if horizontal {
        0.0
      } else {
        date.lower()
      },
      ymax: if horizontal {
        1.0
      } else {
        date.upper()
      },
      x_axis_scale: if horizontal {
        axis.scale()
      } else {
        @ticker_scale.Linear
      },
      y_axis_scale: if horizontal {
        @ticker_scale.Linear
      } else {
        axis.scale()
      },
    },
    if horizontal {
      target.x_margin()
    } else {
      0.0
    },
    if horizontal {
      0.0
    } else {
      target.y_margin()
    },
    if horizontal {
      image_sticky_edges(figure, target_index, true)
    } else {
      []
    },
    if horizontal {
      []
    } else {
      image_sticky_edges(figure, target_index, false)
    },
  )
  match group_limit(figure, target_index, horizontal) {
    Some(limits) => axis.date_nonsingular_bounds(limits.lower(), limits.upper())
    None =>
      axis.view_limits_checked(
        if horizontal {
          @core.limits(normalized.xmin, normalized.xmax)
        } else {
          @core.limits(normalized.ymin, normalized.ymax)
        },
      )
  }
}

///|
fn compute_scale(
  figure : @render.Figure,
  target_index : Int32,
) -> Scale raise @core.DataError {
  let target = figure.panels()[target_index]
  bind_render_data_minima(figure)
  let x_axis = target.x_axis()
  let y_axis = target.y_axis()
  let x_view = if x_axis.uses_numeric_autoscale() {
    numeric_axis_view(figure, target_index, true)
  } else {
    legacy_axis_view(figure, target_index, true)
  }
  let y_view = if y_axis.uses_numeric_autoscale() {
    numeric_axis_view(figure, target_index, false)
  } else {
    legacy_axis_view(figure, target_index, false)
  }
  {
    xmin: x_view.lower(),
    xmax: x_view.upper(),
    ymin: y_view.lower(),
    ymax: y_view.upper(),
    x_axis_scale: x_axis.scale(),
    y_axis_scale: y_axis.scale(),
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
