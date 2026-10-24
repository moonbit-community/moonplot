///|
fn render_panel(
  writer : @xml.Writer,
  figure : @render.Figure,
  panel : @render.Panel,
  scale : Scale,
  panel_index : Int32,
  position : (Double, Double, Double, Double),
  capture~ : DrawingCapture? = None,
) -> Unit raise @core.DataError {
  let (left, top, plot_width, plot_height) = position
  // Earlier panels can change the limits of a shared axis in this frame.
  let (xmin, xmax) = panel.x_axis().view_interval_checked()
  let (ymin, ymax) = panel.y_axis().view_interval_checked()
  let scale : Scale = {
    xmin,
    xmax,
    ymin,
    ymax,
    x_axis_scale: scale.x_axis_scale,
    y_axis_scale: scale.y_axis_scale,
  }
  // The default child-axes zorder precedes the primary Axis artists. Evaluate
  // live secondary batches now; their XML can still follow the plot artists.
  let secondary_scale = scale
  let secondary_order = ordered_secondary_axes(panel)
  let secondary_x_bundles : Array[SecondaryTickBundle?] = Array::make(
    panel.secondary_x().length(),
    None,
  )
  let secondary_y_bundles : Array[SecondaryTickBundle?] = Array::make(
    panel.secondary_y().length(),
    None,
  )
  let mut owned_child_prepared = false
  for (horizontal, index, axis, _) in secondary_order {
    let prepared = if axis.prepare_draw() {
      owned_child_prepared = true
      // The original superclass draw evaluates its locator and calls the
      // child's aspect after the old-context map and parent-name reset.
      ignore(axis.positioned_aspect(left, top, plot_width, plot_height))
      let (lower, upper) = if horizontal {
        (scale.xmin, scale.xmax)
      } else {
        (scale.ymin, scale.ymax)
      }
      Some(secondary_axis_bundle(axis, [], lower, upper))
    } else {
      None
    }
    if horizontal {
      secondary_x_bundles[index] = prepared
    } else {
      secondary_y_bundles[index] = prepared
    }
  }
  // Child callbacks update the source parent's live transData before its
  // primary axes and data artists draw. Never redo finished child bundles.
  let scale = if owned_child_prepared {
    let (xmin, xmax) = panel.x_axis().view_interval_checked()
    let (ymin, ymax) = panel.y_axis().view_interval_checked()
    {
      xmin,
      xmax,
      ymin,
      ymax,
      x_axis_scale: panel.x_axis().scale(),
      y_axis_scale: panel.y_axis().scale(),
    }
  } else {
    scale
  }
  let x_bundle = numeric_axis_bundle(
    panel.x_axis(),
    @core.limits(scale.xmin, scale.xmax),
  )
  let (xmin, xmax) = panel.x_axis().view_interval_checked()
  let y_bundle = numeric_axis_bundle(
    panel.y_axis(),
    @core.limits(scale.ymin, scale.ymax),
  )
  let (ymin, ymax) = panel.y_axis().view_interval_checked()
  let scale : Scale = {
    xmin,
    xmax,
    ymin,
    ymax,
    x_axis_scale: scale.x_axis_scale,
    y_axis_scale: scale.y_axis_scale,
  }
  let x_ticks = x_bundle.major
  let y_ticks = y_bundle.major
  let x_minor_ticks = x_bundle.minor
  let y_minor_ticks = y_bundle.minor
  let x_labels = x_bundle.major_labels
  let y_labels = y_bundle.major_labels
  let x_minor_labels = x_bundle.minor_labels
  let y_minor_labels = y_bundle.minor_labels
  let x_offset_label = x_bundle.offset
  let y_offset_label = y_bundle.offset
  if panel.frame_visible() {
    append_grid(
      writer,
      scale,
      left,
      top,
      plot_width,
      plot_height,
      x_ticks,
      y_ticks,
      x_minor_ticks,
      y_minor_ticks,
      x_labels,
      y_labels,
      x_minor_labels,
      y_minor_labels,
      x_offset_label,
      y_offset_label,
      panel.x_axis().tick_position(),
      panel.y_axis().tick_position(),
      panel.show_x_tick_labels(),
      panel.show_y_tick_labels(),
      panel.x_axis().grid_visible(),
      panel.x_axis().grid_color(),
      panel.x_axis().grid_width(),
      panel.y_axis().grid_visible(),
      panel.y_axis().grid_color(),
      panel.y_axis().grid_width(),
      panel.x_axis().minor_grid_visible(),
      panel.x_axis().minor_grid_color(),
      panel.x_axis().minor_grid_width(),
      panel.y_axis().minor_grid_visible(),
      panel.y_axis().minor_grid_color(),
      panel.y_axis().minor_grid_width(),
      panel.x_axis().tick_label_size(),
      panel.y_axis().tick_label_size(),
    )
    append_axes(
      writer,
      scale,
      left,
      top,
      plot_width,
      plot_height,
      panel.spines(),
    )
  }
  for artist_index, artist in panel.artists() {
    let metadata = panel.hit_metadata(artist_index)
    match artist {
      @render.Artist::Line(points, style) =>
        match panel.prepare_line(points) {
          Some(context) => {
            append_line_context(
              writer, scale, left, top, plot_width, plot_height, context,
            )
            if capture is Some(hits) &&
              context.first_style().width() > 0.0 &&
              context.first_style().line_stroke().linestyle() != "None" {
              let points = match context.hit_points() {
                Some(points) => points
                None => context.points()
              }
              collect_drawing_points(
                hits,
                panel_index,
                artist_index,
                points,
                scale,
                position,
                panel,
                metadata,
                @drawing.HitKind::Line,
              )
            }
          }
          None => {
            append_line_artist(
              writer, scale, left, top, plot_width, plot_height, points, style,
            )
            if capture is Some(hits) &&
              style.width() > 0.0 &&
              style.line_stroke().linestyle() != "None" {
              collect_drawing_points(
                hits,
                panel_index,
                artist_index,
                points,
                scale,
                position,
                panel,
                metadata,
                @drawing.HitKind::Line,
              )
            }
          }
        }
      @render.Artist::Scatter(points, style) => {
        append_scatter(
          writer, scale, left, top, plot_width, plot_height, points, style,
        )
        if capture is Some(hits) {
          collect_drawing_points(
            hits,
            panel_index,
            artist_index,
            points,
            scale,
            position,
            panel,
            metadata,
            @drawing.HitKind::Scatter,
          )
        }
      }
      @render.Artist::PathCollection(points, styles) => {
        append_path_collection(
          writer, scale, left, top, plot_width, plot_height, points, styles,
        )
        if capture is Some(hits) {
          collect_drawing_points(
            hits,
            panel_index,
            artist_index,
            points,
            scale,
            position,
            panel,
            metadata,
            @drawing.HitKind::Scatter,
            count=Int32::min(points.length(), styles.length()),
          )
        }
      }
      @render.Artist::Bar(points, style) =>
        append_bars(
          writer,
          scale,
          left,
          top,
          plot_width,
          plot_height,
          points,
          style,
          on_bar=capture.map(hits => {
            rectangle => {
              collect_drawing_bar(
                hits, panel_index, artist_index, rectangle, panel, metadata, position,
                false,
              )
            }
          }),
        )
      @render.Artist::BarH(points, style) =>
        append_barh(
          writer,
          scale,
          left,
          top,
          plot_width,
          plot_height,
          points,
          style,
          on_bar=capture.map(hits => {
            rectangle => {
              collect_drawing_bar(
                hits, panel_index, artist_index, rectangle, panel, metadata, position,
                true,
              )
            }
          }),
        )
      @render.Artist::FillBetween(upper, lower, style) =>
        append_fill_between(
          writer, scale, left, top, plot_width, plot_height, upper, lower, style,
        )
      @render.Artist::Polygon(points, style) =>
        append_polygon(
          writer, scale, left, top, plot_width, plot_height, points, style,
        )
      @render.Artist::CompoundPolygon(polygons, style) =>
        append_compound_polygon(
          writer, scale, left, top, plot_width, plot_height, polygons, style,
        )
      @render.Artist::GouraudTriangle(points, colors) =>
        append_gouraud_triangle(
          writer,
          scale,
          left,
          top,
          plot_width,
          plot_height,
          points,
          colors,
          "gouraud-\{panel_index}-\{artist_index}",
        )
      @render.Artist::HLine(value, style) =>
        append_reference_line(
          writer, scale, left, top, plot_width, plot_height, value, true, style,
        )
      @render.Artist::VLine(value, style) =>
        append_reference_line(
          writer, scale, left, top, plot_width, plot_height, value, false, style,
        )
      @render.Artist::AxLine(point, direction, style) =>
        append_axline(
          writer, scale, left, top, plot_width, plot_height, point, direction, style,
        )
      @render.Artist::HSpan(lower, upper, style) =>
        append_span(
          writer, scale, left, top, plot_width, plot_height, lower, upper, true,
          style,
        )
      @render.Artist::VSpan(lower, upper, style) =>
        append_span(
          writer, scale, left, top, plot_width, plot_height, lower, upper, false,
          style,
        )
      @render.Artist::Text(x, y, value, style) =>
        append_artist_text(
          writer,
          map_x(scale, left, plot_width, x),
          map_y(scale, top, plot_height, y),
          value,
          style,
        )
      @render.Artist::Annotation(value) =>
        append_annotation(
          writer, figure, scale, left, top, plot_width, plot_height, value,
        )
      @render.Artist::ErrorBar(points, yerr, xerr, style) =>
        append_errorbar(
          writer, scale, left, top, plot_width, plot_height, points, yerr, xerr,
          style,
        )
      @render.Artist::Image(data, vmin, vmax, cmap) => {
        let norm = match (vmin, vmax) {
          (Some(lower), Some(upper)) =>
            @colors.linear_color_norm(
              try! @colors.normalize(vmin=lower, vmax=upper),
            )
          (Some(lower), None) =>
            @colors.linear_color_norm(try! @colors.normalize(vmin=lower))
          (None, Some(upper)) =>
            @colors.linear_color_norm(try! @colors.normalize(vmax=upper))
          (None, None) => @colors.linear_color_norm(try! @colors.normalize())
        }
        append_image(
          writer,
          scale,
          left,
          top,
          plot_width,
          plot_height,
          data,
          norm,
          cmap,
          @render.ImageOrigin::Upper,
          None,
          1.0,
          @render.ImageInterpolation::Nearest,
        )
      }
      @render.Artist::ImageNorm(
        data,
        norm,
        cmap,
        origin,
        extent,
        alpha,
        interpolation
      ) =>
        append_image(
          writer, scale, left, top, plot_width, plot_height, data, norm, cmap, origin,
          extent, alpha, interpolation,
        )
      @render.Artist::ColorImage(data, origin, extent, alpha, interpolation) =>
        append_color_image(
          writer, scale, left, top, plot_width, plot_height, data, origin, extent,
          alpha, interpolation,
        )
      @render.Artist::Table(table) =>
        append_table(writer, left, top, plot_width, plot_height, table)
      @render.Artist::Pie(values, labels, colors, start_angle) =>
        append_pie(
          writer,
          left,
          top,
          plot_width,
          plot_height,
          values,
          labels,
          colors,
          start_angle,
          on_slice=capture.map(hits => {
            (index, cx, cy, radius, start, sweep, fraction) => {
              collect_drawing_pie(
                hits,
                panel_index,
                artist_index,
                index,
                values[index],
                labels,
                metadata.series(),
                cx,
                cy,
                radius,
                start,
                sweep,
                fraction,
                position,
              )
            }
          }),
        )
      @render.Artist::BoxPlot(stats, horizontal, style) =>
        append_boxplot(
          writer, scale, left, top, plot_width, plot_height, stats, horizontal, style,
        )
      @render.Artist::Quiver(points, vectors, style) =>
        append_quiver(
          writer, scale, left, top, plot_width, plot_height, points, vectors, style,
        )
      @render.Artist::Violin(
        stats,
        positions,
        widths,
        horizontal,
        side,
        showmeans,
        showextrema,
        showmedians,
        body_style,
        line_style,
        opacity
      ) =>
        append_violin(
          writer, scale, left, top, plot_width, plot_height, stats, positions, widths,
          horizontal, side, showmeans, showextrema, showmedians, body_style, line_style,
          opacity,
        )
    }
  }
  if panel.frame_visible() {
    for (horizontal, index, axis, _) in secondary_order {
      if horizontal {
        append_secondary_x_axis(
          writer,
          secondary_scale,
          left,
          top,
          plot_width,
          plot_height,
          x_ticks,
          axis,
          prepared=secondary_x_bundles[index],
        )
      } else {
        append_secondary_y_axis(
          writer,
          secondary_scale,
          left,
          top,
          plot_width,
          plot_height,
          y_ticks,
          axis,
          prepared=secondary_y_bundles[index],
        )
      }
    }
  }
  append_legend(
    writer,
    left,
    top,
    plot_width,
    plot_height,
    panel.legend(),
    panel.legend_position(),
  )
  match panel.title() {
    Some(value) =>
      append_text(
        writer,
        left + plot_width / 2.0,
        top - 18.0,
        value,
        "middle",
        15,
      )
    None => ()
  }
  if panel.frame_visible() {
    match panel.x_axis().label() {
      Some(value) =>
        append_text(
          writer,
          left + plot_width / 2.0,
          top + plot_height + 38.0,
          value,
          "middle",
          13,
        )
      None => ()
    }
    match panel.y_axis().label() {
      Some(value) =>
        append_text(
          writer,
          left - 40.0,
          top + plot_height / 2.0,
          value,
          "middle",
          13,
        )
      None => ()
    }
  }
}
