///|
fn to_render_artist(artist : Artist) -> @render.Artist {
  match artist {
    Artist::Line(points, style) => @render.Artist::Line(points, style)
    Artist::Scatter(points, style) => @render.Artist::Scatter(points, style)
    Artist::PathCollection(collection) =>
      @render.Artist::PathCollection(collection.points(), collection.styles())
    Artist::Bar(points, style) => @render.Artist::Bar(points, style)
    Artist::BarH(points, style) => @render.Artist::BarH(points, style)
    Artist::FillBetween(upper, lower, style) =>
      @render.Artist::FillBetween(upper, lower, style)
    Artist::Polygon(points, style) => @render.Artist::Polygon(points, style)
    Artist::CompoundPolygon(polygons, style) =>
      @render.Artist::CompoundPolygon(polygons, style)
    Artist::GouraudTriangle(points, colors) =>
      @render.Artist::GouraudTriangle(points, colors)
    Artist::HLine(value, style) => @render.Artist::HLine(value, style)
    Artist::VLine(value, style) => @render.Artist::VLine(value, style)
    Artist::AxLine(point, direction, style) =>
      @render.Artist::AxLine(point, direction, style)
    Artist::HSpan(lower, upper, style) =>
      @render.Artist::HSpan(lower, upper, style)
    Artist::VSpan(lower, upper, style) =>
      @render.Artist::VSpan(lower, upper, style)
    Artist::Text(x, y, value, style) => @render.Artist::Text(x, y, value, style)
    Artist::Annotation(value) =>
      @render.Artist::Annotation(
        @render.annotation(
          value.x,
          value.y,
          value.text_x,
          value.text_y,
          value.value,
          value.xycoords,
          value.textcoords,
          value.connector,
          value.arrow,
          value.arrowcolor,
          value.linewidth,
          value.head_length,
          value.head_width,
          value.style,
        ),
      )
    Artist::ErrorBar(points, yerr, xerr, style) =>
      @render.Artist::ErrorBar(points, yerr, xerr, style)
    Artist::Image(data, vmin, vmax, cmap) =>
      @render.Artist::Image(data, vmin, vmax, cmap)
    Artist::ImageNorm(data, norm, cmap, origin, extent, alpha, interpolation) =>
      @render.Artist::ImageNorm(
        data,
        norm,
        cmap,
        match origin {
          ImageOrigin::Upper => @render.ImageOrigin::Upper
          ImageOrigin::Lower => @render.ImageOrigin::Lower
        },
        extent,
        alpha,
        match interpolation {
          ImageInterpolation::Nearest => @render.ImageInterpolation::Nearest
          ImageInterpolation::NoInterpolation =>
            @render.ImageInterpolation::NoInterpolation
          ImageInterpolation::Bilinear => @render.ImageInterpolation::Bilinear
          ImageInterpolation::Bicubic => @render.ImageInterpolation::Bicubic
          ImageInterpolation::Spline16 => @render.ImageInterpolation::Spline16
          ImageInterpolation::Spline36 => @render.ImageInterpolation::Spline36
          ImageInterpolation::Hanning => @render.ImageInterpolation::Hanning
          ImageInterpolation::Hamming => @render.ImageInterpolation::Hamming
          ImageInterpolation::Hermite => @render.ImageInterpolation::Hermite
          ImageInterpolation::Kaiser => @render.ImageInterpolation::Kaiser
          ImageInterpolation::Quadric => @render.ImageInterpolation::Quadric
          ImageInterpolation::Catrom => @render.ImageInterpolation::Catrom
          ImageInterpolation::Gaussian => @render.ImageInterpolation::Gaussian
          ImageInterpolation::Bessel => @render.ImageInterpolation::Bessel
          ImageInterpolation::Mitchell => @render.ImageInterpolation::Mitchell
          ImageInterpolation::Sinc => @render.ImageInterpolation::Sinc
          ImageInterpolation::Lanczos => @render.ImageInterpolation::Lanczos
          ImageInterpolation::Blackman => @render.ImageInterpolation::Blackman
          ImageInterpolation::Auto => @render.ImageInterpolation::Auto
          ImageInterpolation::Antialiased =>
            @render.ImageInterpolation::Antialiased
        },
      )
    Artist::ColorImage(data, origin, extent, alpha, interpolation) =>
      @render.Artist::ColorImage(
        data,
        match origin {
          ImageOrigin::Upper => @render.ImageOrigin::Upper
          ImageOrigin::Lower => @render.ImageOrigin::Lower
        },
        extent,
        alpha,
        match interpolation {
          ImageInterpolation::Nearest => @render.ImageInterpolation::Nearest
          ImageInterpolation::NoInterpolation =>
            @render.ImageInterpolation::NoInterpolation
          ImageInterpolation::Bilinear => @render.ImageInterpolation::Bilinear
          ImageInterpolation::Bicubic => @render.ImageInterpolation::Bicubic
          ImageInterpolation::Spline16 => @render.ImageInterpolation::Spline16
          ImageInterpolation::Spline36 => @render.ImageInterpolation::Spline36
          ImageInterpolation::Hanning => @render.ImageInterpolation::Hanning
          ImageInterpolation::Hamming => @render.ImageInterpolation::Hamming
          ImageInterpolation::Hermite => @render.ImageInterpolation::Hermite
          ImageInterpolation::Kaiser => @render.ImageInterpolation::Kaiser
          ImageInterpolation::Quadric => @render.ImageInterpolation::Quadric
          ImageInterpolation::Catrom => @render.ImageInterpolation::Catrom
          ImageInterpolation::Gaussian => @render.ImageInterpolation::Gaussian
          ImageInterpolation::Bessel => @render.ImageInterpolation::Bessel
          ImageInterpolation::Mitchell => @render.ImageInterpolation::Mitchell
          ImageInterpolation::Sinc => @render.ImageInterpolation::Sinc
          ImageInterpolation::Lanczos => @render.ImageInterpolation::Lanczos
          ImageInterpolation::Blackman => @render.ImageInterpolation::Blackman
          ImageInterpolation::Auto => @render.ImageInterpolation::Auto
          ImageInterpolation::Antialiased =>
            @render.ImageInterpolation::Antialiased
        },
      )
    Artist::Table(table) => {
      let cells = Array(capacity=table.cells().length())
      for cell in table.cells() {
        cells.push(
          @render.table_cell(
            cell.row(),
            cell.column(),
            cell.text(),
            cell.facecolor(),
            cell.edgecolor(),
            cell.align(),
            cell.visible_edges(),
          ),
        )
      }
      @render.Artist::Table(
        @render.table(
          cells,
          table.rows(),
          table.columns(),
          table.x(),
          table.y(),
          table.width(),
          table.height(),
          table.column_widths(),
        ),
      )
    }
    Artist::Pie(values, labels, colors, start_angle) =>
      @render.Artist::Pie(values, labels, colors, start_angle)
    Artist::BoxPlot(stats, horizontal, style) =>
      @render.Artist::BoxPlot(stats, horizontal, style)
    Artist::Quiver(points, vectors, style) =>
      @render.Artist::Quiver(points, vectors, style)
    Artist::Violin(
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
      @render.Artist::Violin(
        stats.map(stat => {
          @render.violin_stats(
            stat.coords(),
            stat.vals(),
            stat.mean(),
            stat.median(),
            stat.min(),
            stat.max(),
            stat.quantiles(),
          )
        }),
        positions,
        widths,
        horizontal,
        match side {
          ViolinSide::Both => @render.ViolinSide::Both
          ViolinSide::Low => @render.ViolinSide::Low
          ViolinSide::High => @render.ViolinSide::High
        },
        showmeans,
        showextrema,
        showmedians,
        body_style,
        line_style,
        opacity,
      )
  }
}

///|
fn to_render_legend_kind(kind : LegendKind) -> @render.LegendKind {
  match kind {
    LegendKind::Line => @render.LegendKind::Line
    LegendKind::Marker => @render.LegendKind::Marker
    LegendKind::Patch => @render.LegendKind::Patch
  }
}

///|
fn to_render_legend(entry : LegendEntry) -> @render.LegendEntry {
  @render.legend_entry(
    entry.label(),
    entry.color(),
    to_render_legend_kind(entry.kind()),
  )
}

///|
fn to_render_secondary_axis(axis : SecondaryAxis) -> @render.SecondaryAxis {
  let location = match axis.location() {
    SecondaryAxisLocation::Top => @render.SecondaryLocation::Top
    SecondaryAxisLocation::Bottom => @render.SecondaryLocation::Bottom
    SecondaryAxisLocation::Left => @render.SecondaryLocation::Left
    SecondaryAxisLocation::Right => @render.SecondaryLocation::Right
  }
  @render.secondary_axis(
    location,
    axis.forward(),
    axis.inverse(),
    axis.label(),
    axis.tick_count(),
    axis.ticks(),
    axis.locator(),
    axis.formatter(),
    tick_label_size=axis.tick_label_size(),
    minor_locator=axis.minor_locator(),
    minor_ticks_provider=Some(() => axis.minor_tick_values_checked()),
  )
}

///|
fn to_render_spine(spine : Spine) -> @render.Spine {
  let side = match spine.side() {
    SpineSide::Left => @render.SpineSide::Left
    SpineSide::Right => @render.SpineSide::Right
    SpineSide::Bottom => @render.SpineSide::Bottom
    SpineSide::Top => @render.SpineSide::Top
  }
  let position = match spine.position() {
    SpinePosition::Axes => @render.SpinePosition::Axes
    SpinePosition::Data(value) => @render.SpinePosition::Data(value)
    SpinePosition::Outward(value) => @render.SpinePosition::Outward(value)
  }
  @render.spine(
    side,
    spine.visible(),
    spine.color(),
    spine.linewidth(),
    position,
    spine.bounds(),
  )
}

///|
fn Figure::to_render_figure(
  self : Figure,
  extra? : @ref.Ref[AxesData],
) -> @render.Figure {
  let states = self.axes.copy()
  if extra is Some(state) {
    states.push(state)
  }
  let panels = Array(capacity=states.length())
  for state_ref in states {
    let state = state_ref.val
    let artists = Array(capacity=state.artists.length())
    for artist in state.artists {
      artists.push(to_render_artist(artist))
    }
    let source_legend = state.legend_entries()
    let legend = Array(capacity=source_legend.length())
    for entry in source_legend {
      legend.push(to_render_legend(entry))
    }
    let secondary_x = Array(capacity=state.secondary_x.length())
    for axis in state.secondary_x {
      secondary_x.push(to_render_secondary_axis(axis))
    }
    let secondary_y = Array(capacity=state.secondary_y.length())
    for axis in state.secondary_y {
      secondary_y.push(to_render_secondary_axis(axis))
    }
    let spines = Array(capacity=state.spines.length())
    for index in 0..<state.spines.length() {
      let side = match index {
        0 => SpineSide::Left
        1 => SpineSide::Right
        2 => SpineSide::Bottom
        _ => SpineSide::Top
      }
      let handle = { axes: { figure: self, state: state_ref, }, side, }
      spines.push(to_render_spine(handle))
    }
    let axes = { figure: self, state: state_ref, }
    let rect = axes.rect()
    let aspect = state.data_aspect
    let box_aspect = state.box_aspect
    panels.push(
      @render.panel_with_sharing(
        rect,
        artists,
        state.title,
        legend,
        state.explicit_bounds,
        state.x_axis,
        state.y_axis,
        state.share_x_group,
        state.share_y_group,
        false,
        secondary_x,
        secondary_y,
        show_x_tick_labels=state.show_x_tick_labels,
        show_y_tick_labels=state.show_y_tick_labels,
        frame_visible=state.frame_visible,
        x_margin=state.x_margin,
        y_margin=state.y_margin,
        spines~,
        aspect?,
        anchor=try! state.anchor.coordinates(),
        adjustable=state.adjustable,
        box_aspect?,
      ),
    )
  }
  let subfigures = []
  for data_ref in self.subfigures {
    append_render_subfigures(self, data_ref, subfigures)
  }
  @render.figure_with_subfigures(
    self.width,
    self.height,
    self.margin,
    panels,
    self.colorbars,
    subfigures,
    self.title,
  )
}

///|
/// Flatten a nested SubFigure tree into absolute display rectangles for the
/// backend-neutral render model. SubplotSpec keeps the parent geometry chain,
/// so every descendant can resolve its current rectangle independently.
fn append_render_subfigures(
  figure : Figure,
  data_ref : @ref.Ref[SubFigureData],
  result : Array[@render.SubFigure],
) -> Unit {
  let data = data_ref.val
  result.push(@render.subfigure(figure.subplot_rect(data.spec), data.title))
  for child in data.subfigures {
    append_render_subfigures(figure, child, result)
  }
}

///|
/// Render a figure with the default SVG backend.
pub fn Figure::to_svg(self : Figure) -> String {
  try! self.to_svg_checked()
}

///|
/// Render SVG, reporting aspect-resolution failures through DataError.
/// Datalim views are resolved for all panels before any are committed.
/// The non-throwing to_svg() convenience aborts if this checked call fails.
///
/// ```mbt check
/// test {
///   let fig = @scene.figure(width=400, height=200)
///   let ax = try! fig.add_axes(0.0, 0.0, 1.0, 1.0)
///   try! ax.plot([0.0, 1.0], [0.0, 1.0])
///   try! ax.set_xlim(0.0, 1.0)
///   try! ax.set_ylim(0.0, 1.0)
///   try! ax.set_aspect(1.0, adjustable="datalim")
///   let svg = try! fig.to_svg_checked()
///   assert_true(svg.contains("points=\"100,200 300,0\""))
/// }
/// ```
pub fn Figure::to_svg_checked(self : Figure) -> String raise @core.DataError {
  self.apply_position_aspects()
  let (document, positions) = @svg.render_with_positions_checked(
    self.to_render_figure(),
  )
  for index, (left, top, width, height) in positions {
    self.axes[index].val.active_position = Some(
      @gridspec.rect(left, top, width, height),
    )
  }
  document
}
