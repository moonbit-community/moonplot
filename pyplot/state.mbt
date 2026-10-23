///|
let current_figure : @ref.Ref[@scene.Figure?] = @ref.new(None)

///|
fn require_figure() -> @scene.Figure {
  match current_figure.val {
    Some(figure) => figure
    None => {
      let figure = @scene.figure()
      current_figure.val = Some(figure)
      figure
    }
  }
}

///|
fn require_axes() -> @scene.Axes {
  require_figure().gca()
}

///|
/// Create and select the current figure.
pub fn figure(width~ : Int32 = 640, height~ : Int32 = 480) -> @scene.Figure {
  let figure = @scene.figure(width~, height~)
  current_figure.val = Some(figure)
  figure
}

///|
/// Return the current figure, creating a default one when needed.
pub fn gcf() -> @scene.Figure {
  require_figure()
}

///|
/// Return the current axes, creating a default one when needed.
pub fn gca() -> @scene.Axes {
  require_axes()
}

///|
/// Add and select an axes panel in the current figure.
/// With no coordinates, create a 1-by-1 subplot using the figure's subplot
/// bounds. Supplying any coordinate creates a fixed manual rectangle instead;
/// omitted coordinates then use (0.125, 0.11, 0.775, 0.77).
///
/// ```mbt check
/// test {
///   let fig = @pyplot.figure(width=400, height=300)
///   let panel = try! @pyplot.axes(left=0.1, bottom=0.2, width=0.5, height=0.4)
///   @pyplot.title("inset")
///   assert_eq(panel.title(), Some("inset"))
///   assert_eq(fig.axes_list().length(), 1)
///   @pyplot.close()
/// }
/// ```
pub fn axes(
  left? : Double,
  bottom? : Double,
  width? : Double,
  height? : Double,
) -> @scene.Axes raise @gridspec.LayoutError {
  let figure = require_figure()
  let axes = match (left, bottom, width, height) {
    (None, None, None, None) =>
      figure.add_subplot(@gridspec.gridspec(1, 1).cell_spec(0, 0))
    _ =>
      figure.add_axes(
        left.unwrap_or(0.125),
        bottom.unwrap_or(0.11),
        width.unwrap_or(0.775),
        height.unwrap_or(0.77),
      )
  }
  axes
}

///|
/// Select an attached axes panel and its owning figure for subsequent calls.
/// Selection preserves the figure's axes creation and drawing order. A
/// detached handle raises InvalidReference and leaves the selection intact.
///
/// ```mbt check
/// test {
///   let first = @pyplot.figure(width=400, height=300)
///   let panel = first.axes()
///   ignore(@pyplot.figure())
///   try! @pyplot.sca(panel)
///   @pyplot.title("selected")
///   assert_eq(panel.title(), Some("selected"))
///   assert_eq(@pyplot.gcf().width(), 400)
///   @pyplot.close()
/// }
/// ```
pub fn sca(axes : @scene.Axes) -> Unit raise @core.DataError {
  ignore(axes.figure().sca(axes))
  current_figure.val = Some(axes.figure())
}

///|
/// Remove an axes panel, defaulting to the current panel.
/// An explicit panel is removed from its own Figure without switching the
/// current Figure. Detached handles raise InvalidReference.
///
/// ```mbt check
/// test {
///   let fig = @pyplot.figure()
///   let ax = @pyplot.gca()
///   try! @pyplot.delaxes()
///   assert_eq(fig.axes_list().length(), 0)
///   assert_true(!ax.is_attached())
///   assert_true(@pyplot.gca().is_attached())
///   @pyplot.close()
/// }
/// ```
pub fn delaxes(ax? : @scene.Axes) -> Unit raise @core.DataError {
  ax.unwrap_or_else(() => require_axes()).remove()
}

///|
/// Clear the current figure while retaining its size.
pub fn clf() -> Unit {
  let old = require_figure()
  current_figure.val = Some(
    @scene.figure(width=old.width(), height=old.height()),
  )
}

///|
/// Clear the current axes while retaining its figure and subplot position.
pub fn cla() -> Unit {
  require_axes().clear()
}

///|
/// Clear the current figure.
pub fn clear() -> Unit {
  clf()
}

///|
/// Restore global plotting defaults for subsequently created axes.
pub fn rcdefaults() -> Unit {
  @config.reset()
}

///|
/// Replace the property color cycle for subsequently created axes.
pub fn set_prop_cycle(colors : Array[String]) -> Unit raise @core.DataError {
  @config.set_color_cycle(colors)
}

///|
/// Close the current figure.
pub fn close() -> Unit {
  current_figure.val = None
}

///|
/// Add a line plot to the current figure.
pub fn plot(
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().plot(xs, ys, color~, label~)
}

///|
/// Add a line whose x coordinates are string categories to the current axes.
pub fn plot_category(
  categories : Array[String],
  values : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().plot_category(categories, values, color~, label~)
}

///|
/// Add a line whose y coordinates are string categories to the current axes.
pub fn plot_category_y(
  values : Array[Double],
  categories : Array[String],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().plot_category_y(values, categories, color~, label~)
}

///|
/// Add a line with optional symmetric x/y error bars to the current figure.
pub fn errorbar(
  xs : Array[Double],
  ys : Array[Double],
  yerr~ : Array[Double] = [],
  xerr~ : Array[Double] = [],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().errorbar(xs, ys, yerr~, xerr~, color~, label~)
}

///|
/// Compute and draw a histogram on the current figure.
pub fn hist(
  values : Array[Double],
  bins~ : Int32 = 10,
  color~ : String = "",
  label~ : String = "",
) -> @scene.Histogram raise @core.DataError {
  require_axes().hist(values, bins~, color~, label~)
}

///|
/// Draw a pie chart on the current axes.
pub fn pie(
  values : Array[Double],
  labels~ : Array[String] = [],
  colors~ : Array[String] = [],
  start_angle~ : Double = 0.0,
) -> Array[Double] raise @core.DataError {
  require_axes().pie(values, labels~, colors~, start_angle~)
}

///|
/// Draw box-and-whisker plots on the current axes.
pub fn boxplot(
  data : Array[Array[Double]],
  horizontal~ : Bool = false,
  color~ : String = "",
  label~ : String = "",
) -> Array[@boxplot.BoxStats] raise @core.DataError {
  require_axes().boxplot(data, horizontal~, color~, label~)
}

///|
/// Draw a vector field on the current axes.
pub fn quiver(
  xs : Array[Double],
  ys : Array[Double],
  us : Array[Double],
  vs : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().quiver(xs, ys, us, vs, color~, label~)
}

///|
/// Draw one data-coordinate arrow on the current axes.
pub fn arrow(
  x : Double,
  y : Double,
  dx : Double,
  dy : Double,
  color~ : String = "",
  linewidth~ : Double = 1.0,
  head_length~ : Double = 0.15,
  head_width~ : Double = 0.10,
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().arrow(
    x,
    y,
    dx,
    dy,
    color~,
    linewidth~,
    head_length~,
    head_width~,
    label~,
  )
}

///|
/// Add text at a data point, optionally connected by an arrow.
pub fn annotate(
  value : String,
  x : Double,
  y : Double,
  offset_x~ : Double = 0.0,
  offset_y~ : Double = 0.0,
  arrow~ : Bool = false,
  color~ : String = "#111827",
  arrowcolor~ : String = "",
  linewidth~ : Double = 1.0,
  head_length~ : Double = 0.15,
  head_width~ : Double = 0.10,
  fontsize~ : Int32 = 12,
  xycoords~ : String = "data",
  textcoords~ : String = "data",
  connector~ : String = "straight",
) -> Unit raise @core.DataError {
  require_axes().annotate(
    value,
    x,
    y,
    offset_x~,
    offset_y~,
    arrow~,
    color~,
    arrowcolor~,
    linewidth~,
    head_length~,
    head_width~,
    fontsize~,
    xycoords~,
    textcoords~,
    connector~,
  )
}

///|
/// Draw scalar values as filled quadrilaterals on the current axes.
pub fn pcolor(
  data : Array[Array[Double]],
  x~ : Array[Double] = [],
  y~ : Array[Double] = [],
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  antialiased~ : Bool = true,
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().pcolor(data, x~, y~, vmin~, vmax~, cmap~, antialiased~)
    (Some(vmin), None) =>
      require_axes().pcolor(data, x~, y~, vmin~, cmap~, antialiased~)
    (None, Some(vmax)) =>
      require_axes().pcolor(data, x~, y~, vmax~, cmap~, antialiased~)
    (None, None) => require_axes().pcolor(data, x~, y~, cmap~, antialiased~)
  }
}

///|
/// Draw a rectangular scalar mesh on the current axes.
pub fn pcolormesh(
  data : Array[Array[Double]],
  x~ : Array[Double] = [],
  y~ : Array[Double] = [],
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  antialiased~ : Bool = false,
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().pcolormesh(data, x~, y~, vmin~, vmax~, cmap~, antialiased~)
    (Some(vmin), None) =>
      require_axes().pcolormesh(data, x~, y~, vmin~, cmap~, antialiased~)
    (None, Some(vmax)) =>
      require_axes().pcolormesh(data, x~, y~, vmax~, cmap~, antialiased~)
    (None, None) => require_axes().pcolormesh(data, x~, y~, cmap~, antialiased~)
  }
}

///|
/// Draw a scalar mesh on a two-dimensional coordinate grid.
pub fn pcolor_grid(
  data : Array[Array[Double]],
  x : Array[Array[Double]],
  y : Array[Array[Double]],
  shading~ : String = "auto",
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  antialiased~ : Bool = true,
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().pcolor_grid(
        data,
        x,
        y,
        shading~,
        vmin~,
        vmax~,
        cmap~,
        antialiased~,
      )
    (Some(vmin), None) =>
      require_axes().pcolor_grid(
        data,
        x,
        y,
        shading~,
        vmin~,
        cmap~,
        antialiased~,
      )
    (None, Some(vmax)) =>
      require_axes().pcolor_grid(
        data,
        x,
        y,
        shading~,
        vmax~,
        cmap~,
        antialiased~,
      )
    (None, None) =>
      require_axes().pcolor_grid(data, x, y, shading~, cmap~, antialiased~)
  }
}

///|
/// Draw a fast scalar mesh on a two-dimensional coordinate grid.
pub fn pcolormesh_grid(
  data : Array[Array[Double]],
  x : Array[Array[Double]],
  y : Array[Array[Double]],
  shading~ : String = "auto",
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  antialiased~ : Bool = false,
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().pcolormesh_grid(
        data,
        x,
        y,
        shading~,
        vmin~,
        vmax~,
        cmap~,
        antialiased~,
      )
    (Some(vmin), None) =>
      require_axes().pcolormesh_grid(
        data,
        x,
        y,
        shading~,
        vmin~,
        cmap~,
        antialiased~,
      )
    (None, Some(vmax)) =>
      require_axes().pcolormesh_grid(
        data,
        x,
        y,
        shading~,
        vmax~,
        cmap~,
        antialiased~,
      )
    (None, None) =>
      require_axes().pcolormesh_grid(data, x, y, shading~, cmap~, antialiased~)
  }
}

///|
/// Draw a masked scalar mesh on a two-dimensional coordinate grid.
pub fn pcolor_grid_masked(
  data : @core.MaskedMatrix,
  x : @core.MaskedMatrix,
  y : @core.MaskedMatrix,
  shading~ : String = "auto",
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  antialiased~ : Bool = true,
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().pcolor_grid_masked(
        data,
        x,
        y,
        shading~,
        vmin~,
        vmax~,
        cmap~,
        antialiased~,
      )
    (Some(vmin), None) =>
      require_axes().pcolor_grid_masked(
        data,
        x,
        y,
        shading~,
        vmin~,
        cmap~,
        antialiased~,
      )
    (None, Some(vmax)) =>
      require_axes().pcolor_grid_masked(
        data,
        x,
        y,
        shading~,
        vmax~,
        cmap~,
        antialiased~,
      )
    (None, None) =>
      require_axes().pcolor_grid_masked(
        data,
        x,
        y,
        shading~,
        cmap~,
        antialiased~,
      )
  }
}

///|
/// Draw a fast masked scalar mesh on a two-dimensional coordinate grid.
pub fn pcolormesh_grid_masked(
  data : @core.MaskedMatrix,
  x : @core.MaskedMatrix,
  y : @core.MaskedMatrix,
  shading~ : String = "auto",
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  antialiased~ : Bool = false,
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().pcolormesh_grid_masked(
        data,
        x,
        y,
        shading~,
        vmin~,
        vmax~,
        cmap~,
        antialiased~,
      )
    (Some(vmin), None) =>
      require_axes().pcolormesh_grid_masked(
        data,
        x,
        y,
        shading~,
        vmin~,
        cmap~,
        antialiased~,
      )
    (None, Some(vmax)) =>
      require_axes().pcolormesh_grid_masked(
        data,
        x,
        y,
        shading~,
        vmax~,
        cmap~,
        antialiased~,
      )
    (None, None) =>
      require_axes().pcolormesh_grid_masked(
        data,
        x,
        y,
        shading~,
        cmap~,
        antialiased~,
      )
  }
}

///|
/// Draw a scalar mesh with explicit normalization and named colormap.
pub fn pcolor_with_norm(
  data : Array[Array[Double]],
  norm : @colors.ColorNorm,
  cmap~ : String = "viridis",
  x~ : Array[Double] = [],
  y~ : Array[Double] = [],
  antialiased~ : Bool = true,
) -> Unit raise @core.DataError {
  require_axes().pcolor_with_norm(data, norm, cmap~, x~, y~, antialiased~)
}

///|
/// Draw a fast scalar mesh with explicit normalization and named colormap.
pub fn pcolormesh_with_norm(
  data : Array[Array[Double]],
  norm : @colors.ColorNorm,
  cmap~ : String = "viridis",
  x~ : Array[Double] = [],
  y~ : Array[Double] = [],
  antialiased~ : Bool = false,
) -> Unit raise @core.DataError {
  require_axes().pcolormesh_with_norm(data, norm, cmap~, x~, y~, antialiased~)
}

///|
/// Draw a scalar mesh with an explicit normalization and colormap object.
pub fn pcolor_with_norm_and_colormap(
  data : Array[Array[Double]],
  norm : @colors.ColorNorm,
  cmap : @colors.ColorMap,
  x~ : Array[Double] = [],
  y~ : Array[Double] = [],
  antialiased~ : Bool = true,
) -> Unit raise @core.DataError {
  require_axes().pcolor_with_norm_and_colormap(
    data,
    norm,
    cmap,
    x~,
    y~,
    antialiased~,
  )
}

///|
/// Draw a rectangular scalar mesh with an explicit normalization and colormap.
pub fn pcolormesh_with_norm_and_colormap(
  data : Array[Array[Double]],
  norm : @colors.ColorNorm,
  cmap : @colors.ColorMap,
  x~ : Array[Double] = [],
  y~ : Array[Double] = [],
  antialiased~ : Bool = false,
) -> Unit raise @core.DataError {
  require_axes().pcolormesh_with_norm_and_colormap(
    data,
    norm,
    cmap,
    x~,
    y~,
    antialiased~,
  )
}

///|
/// Add a step plot to the current axes.
pub fn step(
  xs : Array[Double],
  ys : Array[Double],
  where_~ : String = "pre",
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().step(xs, ys, where_~, color~, label~)
}

///|
/// Fill the area between two x series at y positions on the current axes.
pub fn fill_betweenx(
  ys : Array[Double],
  left : Array[Double],
  right~ : Array[Double] = [],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().fill_betweenx(ys, left, right~, color~, label~)
}

///|
/// Draw a stepwise constant function on the current axes.
pub fn stairs(
  values : Array[Double],
  edges~ : Array[Double] = [],
  orientation~ : String = "vertical",
  baseline~ : Double = 0.0,
  fill~ : Bool = false,
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().stairs(
    values,
    edges~,
    orientation~,
    baseline~,
    fill~,
    color~,
    label~,
  )
}

///|
/// Draw stems from a baseline on the current axes.
pub fn stem(
  heads : Array[Double],
  locs~ : Array[Double] = [],
  bottom~ : Double = 0.0,
  orientation~ : String = "vertical",
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().stem(heads, locs~, bottom~, orientation~, color~, label~)
}

///|
/// Draw parallel event markers on the current axes.
pub fn eventplot(
  positions : Array[Array[Double]],
  orientation~ : String = "horizontal",
  lineoffsets~ : Array[Double] = [],
  linelengths~ : Array[Double] = [],
  linewidth~ : Double = 1.0,
  color~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().eventplot(
    positions,
    orientation~,
    lineoffsets~,
    linelengths~,
    linewidth~,
    color~,
  )
}

///|
/// Fill a closed polygon on the current axes.
pub fn fill(
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().fill(xs, ys, color~, label~)
}

///|
/// Draw horizontal broken bars on the current axes.
pub fn broken_barh(
  xranges : Array[(Double, Double)],
  yrange : (Double, Double),
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().broken_barh(xranges, yrange, color~, label~)
}

///|
/// Compute and draw a two-dimensional histogram on the current axes.
pub fn hist2d(
  xs : Array[Double],
  ys : Array[Double],
  bins_x~ : Int32 = 10,
  bins_y~ : Int32 = 10,
  cmap~ : String = "viridis",
) -> Unit raise @core.DataError {
  require_axes().hist2d(xs, ys, bins_x~, bins_y~, cmap~)
}

///|
/// Draw a vector key arrow and label on the current axes.
pub fn quiverkey(
  x : Double,
  y : Double,
  value : Double,
  label : String,
  color~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().quiverkey(x, y, value, label, color~)
}

///|
/// Return the effective legend entries for the current axes.
pub fn get_legend_handles_labels() -> Array[@scene.LegendEntry] {
  require_axes().get_legend_handles_labels()
}

///|
/// Draw basic wind barbs for paired vectors on the current axes.
pub fn barbs(
  xs : Array[Double],
  ys : Array[Double],
  us : Array[Double],
  vs : Array[Double],
  color~ : String = "",
  linewidth~ : Double = 1.0,
  barb_length~ : Double = 0.25,
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().barbs(xs, ys, us, vs, color~, linewidth~, barb_length~, label~)
}

///|
/// Draw wind barbs with Matplotlib-style increments and pivot options.
pub fn barbs_with_options(
  xs : Array[Double],
  ys : Array[Double],
  us : Array[Double],
  vs : Array[Double],
  color~ : String = "",
  linewidth~ : Double = 1.0,
  barb_length~ : Double = 0.25,
  label~ : String = "",
  half_increment~ : Double = 5.0,
  full_increment~ : Double = 10.0,
  flag_increment~ : Double = 50.0,
  rounding~ : Bool = true,
  flip~ : Bool = false,
  fill_empty~ : Bool = true,
  pivot~ : String = "tail",
) -> Unit raise @core.DataError {
  require_axes().barbs_with_options(
    xs,
    ys,
    us,
    vs,
    color~,
    linewidth~,
    barb_length~,
    label~,
    half_increment~,
    full_increment~,
    flag_increment~,
    rounding~,
    flip~,
    fill_empty~,
    pivot~,
  )
}

///|
/// Draw Gaussian kernel-density violins on the current axes.
pub fn violinplot(
  data : Array[Array[Double]],
  positions~ : Array[Double] = [],
  width~ : Double = 0.5,
  widths~ : Array[Double] = [],
  horizontal~ : Bool = false,
  side~ : @scene.ViolinSide = @scene.ViolinSide::Both,
  showmeans~ : Bool = false,
  showextrema~ : Bool = true,
  showmedians~ : Bool = false,
  quantiles~ : Array[Array[Double]] = [],
  points~ : Int32 = 100,
  bandwidth~ : @scene.ViolinBandwidth = @scene.ViolinBandwidth::Scott,
  color~ : String = "",
  facecolor~ : String = "",
  linecolor~ : String = "",
  label~ : String = "",
) -> Array[@scene.ViolinStats] raise @core.DataError {
  require_axes().violinplot(
    data,
    positions~,
    width~,
    widths~,
    horizontal~,
    side~,
    showmeans~,
    showextrema~,
    showmedians~,
    quantiles~,
    points~,
    bandwidth~,
    color~,
    facecolor~,
    linecolor~,
    label~,
  )
}

///|
/// Draw streamlines for a regular vector field on the current axes.
pub fn streamplot(
  xs : Array[Double],
  ys : Array[Double],
  us : Array[Array[Double]],
  vs : Array[Array[Double]],
  density~ : Double = 1.0,
  density_x~ : Double = -1.0,
  density_y~ : Double = -1.0,
  color~ : String = "",
  linewidth~ : Double = 1.0,
  max_steps~ : Int32 = 200,
  minlength~ : Double = 0.1,
  start_points~ : Array[@core.Point] = [],
  maxlength~ : Double = 4.0,
  integration_direction~ : String = "both",
  broken_streamlines~ : Bool = true,
  integration_max_step_scale~ : Double = 1.0,
  integration_max_error_scale~ : Double = 1.0,
  arrows~ : Bool = true,
  arrow_size~ : Double = 1.0,
  num_arrows~ : Int32 = 1,
  arrowstyle~ : String = "-|>",
  label~ : String = "",
) -> @scene.StreamplotSet raise @core.DataError {
  require_axes().streamplot(
    xs,
    ys,
    us,
    vs,
    density~,
    density_x~,
    density_y~,
    color~,
    linewidth~,
    max_steps~,
    minlength~,
    start_points~,
    maxlength~,
    integration_direction~,
    broken_streamlines~,
    integration_max_step_scale~,
    integration_max_error_scale~,
    arrows~,
    arrow_size~,
    num_arrows~,
    arrowstyle~,
    label~,
  )
}

///|
/// Draw streamlines with grid-valued linewidth and color controls.
pub fn streamplot_with_style_grids(
  xs : Array[Double],
  ys : Array[Double],
  us : Array[Array[Double]],
  vs : Array[Array[Double]],
  linewidths~ : Array[Array[Double]] = [],
  color_values~ : Array[Array[Double]] = [],
  density~ : Double = 1.0,
  density_x~ : Double = -1.0,
  density_y~ : Double = -1.0,
  color~ : String = "",
  linewidth~ : Double = 1.0,
  cmap~ : String = "viridis",
  vmin? : Double,
  vmax? : Double,
  max_steps~ : Int32 = 200,
  minlength~ : Double = 0.1,
  start_points~ : Array[@core.Point] = [],
  maxlength~ : Double = 4.0,
  integration_direction~ : String = "both",
  broken_streamlines~ : Bool = true,
  integration_max_step_scale~ : Double = 1.0,
  integration_max_error_scale~ : Double = 1.0,
  arrows~ : Bool = true,
  arrow_size~ : Double = 1.0,
  num_arrows~ : Int32 = 1,
  arrowstyle~ : String = "-|>",
  label~ : String = "",
) -> @scene.StreamplotSet raise @core.DataError {
  match (vmin, vmax) {
    (Some(lower), Some(upper)) =>
      require_axes().streamplot_with_style_grids(
        xs,
        ys,
        us,
        vs,
        linewidths~,
        color_values~,
        density~,
        density_x~,
        density_y~,
        color~,
        linewidth~,
        cmap~,
        vmin=lower,
        vmax=upper,
        max_steps~,
        minlength~,
        start_points~,
        maxlength~,
        integration_direction~,
        broken_streamlines~,
        integration_max_step_scale~,
        integration_max_error_scale~,
        arrows~,
        arrow_size~,
        num_arrows~,
        arrowstyle~,
        label~,
      )
    (Some(lower), None) =>
      require_axes().streamplot_with_style_grids(
        xs,
        ys,
        us,
        vs,
        linewidths~,
        color_values~,
        density~,
        density_x~,
        density_y~,
        color~,
        linewidth~,
        cmap~,
        vmin=lower,
        max_steps~,
        minlength~,
        start_points~,
        maxlength~,
        integration_direction~,
        broken_streamlines~,
        integration_max_step_scale~,
        integration_max_error_scale~,
        arrows~,
        arrow_size~,
        num_arrows~,
        arrowstyle~,
        label~,
      )
    (None, Some(upper)) =>
      require_axes().streamplot_with_style_grids(
        xs,
        ys,
        us,
        vs,
        linewidths~,
        color_values~,
        density~,
        density_x~,
        density_y~,
        color~,
        linewidth~,
        cmap~,
        vmax=upper,
        max_steps~,
        minlength~,
        start_points~,
        maxlength~,
        integration_direction~,
        broken_streamlines~,
        integration_max_step_scale~,
        integration_max_error_scale~,
        arrows~,
        arrow_size~,
        num_arrows~,
        arrowstyle~,
        label~,
      )
    (None, None) =>
      require_axes().streamplot_with_style_grids(
        xs,
        ys,
        us,
        vs,
        linewidths~,
        color_values~,
        density~,
        density_x~,
        density_y~,
        color~,
        linewidth~,
        cmap~,
        max_steps~,
        minlength~,
        start_points~,
        maxlength~,
        integration_direction~,
        broken_streamlines~,
        integration_max_step_scale~,
        integration_max_error_scale~,
        arrows~,
        arrow_size~,
        num_arrows~,
        arrowstyle~,
        label~,
      )
  }
}

///|
/// Draw streamlines from meshgrid-style two-dimensional coordinates.
pub fn streamplot_mesh(
  x_grid : Array[Array[Double]],
  y_grid : Array[Array[Double]],
  us : Array[Array[Double]],
  vs : Array[Array[Double]],
  density~ : Double = 1.0,
  density_x~ : Double = -1.0,
  density_y~ : Double = -1.0,
  color~ : String = "",
  linewidth~ : Double = 1.0,
  max_steps~ : Int32 = 200,
  minlength~ : Double = 0.1,
  start_points~ : Array[@core.Point] = [],
  maxlength~ : Double = 4.0,
  integration_direction~ : String = "both",
  broken_streamlines~ : Bool = true,
  integration_max_step_scale~ : Double = 1.0,
  integration_max_error_scale~ : Double = 1.0,
  arrows~ : Bool = true,
  arrow_size~ : Double = 1.0,
  num_arrows~ : Int32 = 1,
  arrowstyle~ : String = "-|>",
  label~ : String = "",
) -> @scene.StreamplotSet raise @core.DataError {
  require_axes().streamplot_mesh(
    x_grid,
    y_grid,
    us,
    vs,
    density~,
    density_x~,
    density_y~,
    color~,
    linewidth~,
    max_steps~,
    minlength~,
    start_points~,
    maxlength~,
    integration_direction~,
    broken_streamlines~,
    integration_max_step_scale~,
    integration_max_error_scale~,
    arrows~,
    arrow_size~,
    num_arrows~,
    arrowstyle~,
    label~,
  )
}

///|
/// Add contour lines to the current axes.
pub fn contour(
  data : Array[Array[Double]],
  x~ : Array[Double] = [],
  y~ : Array[Double] = [],
  levels~ : Array[Double] = [],
  nlevels~ : Int32 = 7,
  color~ : String = "",
  linewidth~ : Double = 1.0,
  label~ : String = "",
  corner_mask~ : Bool = true,
  locator? : @ticker.Locator,
  colors~ : Array[String] = [],
  linewidths~ : Array[Double] = [],
) -> @scene.ContourSet raise @core.DataError {
  require_axes().contour(
    data,
    x~,
    y~,
    levels~,
    nlevels~,
    color~,
    linewidth~,
    label~,
    corner_mask~,
    locator~,
    colors~,
    linewidths~,
  )
}

///|
/// Add filled contour bands to the current axes.
pub fn contourf(
  data : Array[Array[Double]],
  x~ : Array[Double] = [],
  y~ : Array[Double] = [],
  levels~ : Array[Double] = [],
  nlevels~ : Int32 = 7,
  colors~ : Array[String] = [],
  cmap~ : String = "viridis",
  label~ : String = "",
  extend_mode~ : String = "neither",
  corner_mask~ : Bool = true,
  locator? : @ticker.Locator,
) -> @scene.ContourSet raise @core.DataError {
  require_axes().contourf(
    data,
    x~,
    y~,
    levels~,
    nlevels~,
    colors~,
    cmap~,
    label~,
    extend_mode~,
    corner_mask~,
    locator~,
  )
}

///|
/// Label representative segments in a contour set on the current axes.
pub fn clabel(
  contours : @scene.ContourSet,
  inline~ : Bool = true,
  fontsize~ : Int32 = 10,
  color~ : String = "#111827",
) -> Unit raise @core.DataError {
  require_axes().clabel(contours, inline~, fontsize~, color~)
}

///|
/// Plot and return an autocorrelation sequence on the current axes.
/// `detrend` receives an owned copy of the samples and must preserve its
/// length; `@scene.detrend_mean` and `@scene.detrend_linear` cover common
/// cases.
pub fn acorr(
  values : Array[Double],
  normed~ : Bool = true,
  usevlines~ : Bool = true,
  maxlags~ : Int32 = 10,
  color~ : String = "",
  label~ : String = "",
  detrend~ : (Array[Double]) -> Array[Double] = @scene.detrend_none,
) -> @scene.Correlation raise @core.DataError {
  require_axes().acorr(
    values,
    normed~,
    usevlines~,
    maxlags~,
    color~,
    label~,
    detrend~,
  )
}

///|
/// Plot and return a cross-correlation sequence on the current axes.
/// The detrending function is applied independently to both input sequences.
pub fn xcorr(
  first : Array[Double],
  second : Array[Double],
  normed~ : Bool = true,
  usevlines~ : Bool = true,
  maxlags~ : Int32 = 10,
  color~ : String = "",
  label~ : String = "",
  detrend~ : (Array[Double]) -> Array[Double] = @scene.detrend_none,
) -> @scene.Correlation raise @core.DataError {
  require_axes().xcorr(
    first,
    second,
    normed~,
    usevlines~,
    maxlags~,
    color~,
    label~,
    detrend~,
  )
}

///|
/// Plot and return an empirical cumulative distribution function.
pub fn ecdf(
  values : Array[Double],
  weights~ : Array[Double] = [],
  complementary~ : Bool = false,
  horizontal~ : Bool = false,
  compress~ : Bool = false,
  color~ : String = "",
  label~ : String = "",
) -> @scene.Ecdf raise @core.DataError {
  require_axes().ecdf(
    values,
    weights~,
    complementary~,
    horizontal~,
    compress~,
    color~,
    label~,
  )
}

///|
/// Bin points into regular hexagons on the current axes.
pub fn hexbin(
  xs : Array[Double],
  ys : Array[Double],
  values~ : Array[Double] = [],
  gridsize~ : Int32 = 20,
  mincnt~ : Int32 = 0,
  cmap~ : String = "viridis",
  vmin? : Double,
  vmax? : Double,
  color~ : String = "",
  label~ : String = "",
  reduce~ : String = "mean",
  edgecolor~ : String = "",
  linewidth~ : Double = 0.0,
  bins~ : String = "linear",
  extent~ : Array[Double] = [],
  marginals~ : Bool = false,
  reduce_fn? : @scene.HexbinReducer,
) -> @scene.Hexbin raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().hexbin(
        xs,
        ys,
        values~,
        gridsize~,
        mincnt~,
        cmap~,
        vmin~,
        vmax~,
        color~,
        label~,
        reduce~,
        edgecolor~,
        linewidth~,
        bins~,
        extent~,
        marginals~,
        reduce_fn~,
      )
    (Some(vmin), None) =>
      require_axes().hexbin(
        xs,
        ys,
        values~,
        gridsize~,
        mincnt~,
        cmap~,
        vmin~,
        color~,
        label~,
        reduce~,
        edgecolor~,
        linewidth~,
        bins~,
        extent~,
        marginals~,
        reduce_fn~,
      )
    (None, Some(vmax)) =>
      require_axes().hexbin(
        xs,
        ys,
        values~,
        gridsize~,
        mincnt~,
        cmap~,
        vmax~,
        color~,
        label~,
        reduce~,
        edgecolor~,
        linewidth~,
        bins~,
        extent~,
        marginals~,
        reduce_fn~,
      )
    (None, None) =>
      require_axes().hexbin(
        xs,
        ys,
        values~,
        gridsize~,
        mincnt~,
        cmap~,
        color~,
        label~,
        reduce~,
        edgecolor~,
        linewidth~,
        bins~,
        extent~,
        marginals~,
        reduce_fn~,
      )
  }
}

///|
/// Plot the sparsity pattern of a rectangular matrix on the current axes.
pub fn spy(
  data : Array[Array[Double]],
  precision~ : Double = 0.0,
  color~ : String = "",
  label~ : String = "",
  markersize~ : Double = 3.5,
  origin~ : String = "upper",
  aspect~ : String = "equal",
  marker~ : String = "o",
) -> Unit raise @core.DataError {
  require_axes().spy(
    data,
    precision~,
    color~,
    label~,
    markersize~,
    origin~,
    aspect~,
    marker~,
  )
}

///|
/// Build a validated triangular mesh for reuse by multiple plot calls.
pub fn triangulation(
  xs : Array[Double],
  ys : Array[Double],
  triangles~ : Array[Array[Int32]] = [],
  mask~ : Array[Bool] = [],
) -> @scene.Triangulation raise @core.DataError {
  @scene.triangulation(xs, ys, triangles~, mask~)
}

///|
/// Return a point-to-triangle finder for a triangulation.
pub fn get_trifinder(mesh : @scene.Triangulation) -> @scene.TriFinder {
  mesh.get_trifinder()
}

///|
/// Draw triangle edges from vertices and optional index triples.
pub fn triplot(
  xs : Array[Double],
  ys : Array[Double],
  triangles : Array[Array[Int32]],
  color~ : String = "",
  linewidth~ : Double = 1.0,
  label~ : String = "",
  mask~ : Array[Bool] = [],
) -> Unit raise @core.DataError {
  require_axes().triplot(xs, ys, triangles, color~, linewidth~, label~, mask~)
}

///|
/// Draw the unique visible edges of a reusable triangular mesh.
pub fn triplot_triangulation(
  mesh : @scene.Triangulation,
  color~ : String = "",
  linewidth~ : Double = 1.0,
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().triplot_triangulation(mesh, color~, linewidth~, label~)
}

///|
/// Fill triangle faces using the mean of their vertex scalar values.
pub fn tripcolor(
  xs : Array[Double],
  ys : Array[Double],
  triangles : Array[Array[Int32]],
  values : Array[Double],
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  label~ : String = "",
  mask~ : Array[Bool] = [],
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().tripcolor(
        xs,
        ys,
        triangles,
        values,
        vmin~,
        vmax~,
        cmap~,
        label~,
        mask~,
      )
    (Some(vmin), None) =>
      require_axes().tripcolor(
        xs,
        ys,
        triangles,
        values,
        vmin~,
        cmap~,
        label~,
        mask~,
      )
    (None, Some(vmax)) =>
      require_axes().tripcolor(
        xs,
        ys,
        triangles,
        values,
        vmax~,
        cmap~,
        label~,
        mask~,
      )
    (None, None) =>
      require_axes().tripcolor(xs, ys, triangles, values, cmap~, label~, mask~)
  }
}

///|
/// Fill the faces of a reusable triangular mesh using vertex or face values.
pub fn tripcolor_triangulation(
  mesh : @scene.Triangulation,
  values : Array[Double],
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  label~ : String = "",
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().tripcolor_triangulation(
        mesh,
        values,
        vmin~,
        vmax~,
        cmap~,
        label~,
      )
    (Some(vmin), None) =>
      require_axes().tripcolor_triangulation(mesh, values, vmin~, cmap~, label~)
    (None, Some(vmax)) =>
      require_axes().tripcolor_triangulation(mesh, values, vmax~, cmap~, label~)
    (None, None) =>
      require_axes().tripcolor_triangulation(mesh, values, cmap~, label~)
  }
}

///|
/// Draw contour lines over a validated triangular mesh.
pub fn tricontour(
  xs : Array[Double],
  ys : Array[Double],
  triangles : Array[Array[Int32]],
  values : Array[Double],
  levels~ : Array[Double] = [],
  nlevels~ : Int32 = 7,
  color~ : String = "",
  linewidth~ : Double = 1.0,
  label~ : String = "",
  mask~ : Array[Bool] = [],
  locator? : @ticker.Locator,
  colors~ : Array[String] = [],
  linewidths~ : Array[Double] = [],
) -> @scene.ContourSet raise @core.DataError {
  require_axes().tricontour(
    xs,
    ys,
    triangles,
    values,
    levels~,
    nlevels~,
    color~,
    linewidth~,
    label~,
    mask~,
    locator~,
    colors~,
    linewidths~,
  )
}

///|
/// Draw contour lines from a reusable triangular mesh.
pub fn tricontour_triangulation(
  mesh : @scene.Triangulation,
  values : Array[Double],
  levels~ : Array[Double] = [],
  nlevels~ : Int32 = 7,
  color~ : String = "",
  linewidth~ : Double = 1.0,
  label~ : String = "",
  locator? : @ticker.Locator,
  colors~ : Array[String] = [],
  linewidths~ : Array[Double] = [],
) -> @scene.ContourSet raise @core.DataError {
  require_axes().tricontour_triangulation(
    mesh,
    values,
    levels~,
    nlevels~,
    color~,
    linewidth~,
    label~,
    locator~,
    colors~,
    linewidths~,
  )
}

///|
/// Draw filled contour bands over a validated triangular mesh.
pub fn tricontourf(
  xs : Array[Double],
  ys : Array[Double],
  triangles : Array[Array[Int32]],
  values : Array[Double],
  levels~ : Array[Double] = [],
  nlevels~ : Int32 = 7,
  colors~ : Array[String] = [],
  cmap~ : String = "viridis",
  label~ : String = "",
  extend_mode~ : String = "neither",
  mask~ : Array[Bool] = [],
  locator? : @ticker.Locator,
) -> @scene.ContourSet raise @core.DataError {
  require_axes().tricontourf(
    xs,
    ys,
    triangles,
    values,
    levels~,
    nlevels~,
    colors~,
    cmap~,
    label~,
    extend_mode~,
    mask~,
    locator~,
  )
}

///|
/// Draw filled contour bands from a reusable triangular mesh.
pub fn tricontourf_triangulation(
  mesh : @scene.Triangulation,
  values : Array[Double],
  levels~ : Array[Double] = [],
  nlevels~ : Int32 = 7,
  colors~ : Array[String] = [],
  cmap~ : String = "viridis",
  label~ : String = "",
  extend_mode~ : String = "neither",
  locator? : @ticker.Locator,
) -> @scene.ContourSet raise @core.DataError {
  require_axes().tricontourf_triangulation(
    mesh,
    values,
    levels~,
    nlevels~,
    colors~,
    cmap~,
    label~,
    extend_mode~,
    locator~,
  )
}

///|
/// Add a scalar image to the current figure.
pub fn imshow(
  data : Array[Array[Double]],
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "gray",
  origin~ : String = "upper",
  extent~ : Array[Double] = [],
  aspect~ : String = "equal",
  alpha~ : Double = 1.0,
  interpolation~ : String = "nearest",
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().imshow(
        data,
        vmin~,
        vmax~,
        cmap~,
        origin~,
        extent~,
        aspect~,
        alpha~,
        interpolation~,
      )
    (Some(vmin), None) =>
      require_axes().imshow(
        data,
        vmin~,
        cmap~,
        origin~,
        extent~,
        aspect~,
        alpha~,
        interpolation~,
      )
    (None, Some(vmax)) =>
      require_axes().imshow(
        data,
        vmax~,
        cmap~,
        origin~,
        extent~,
        aspect~,
        alpha~,
        interpolation~,
      )
    (None, None) =>
      require_axes().imshow(
        data,
        cmap~,
        origin~,
        extent~,
        aspect~,
        alpha~,
        interpolation~,
      )
  }
}

///|
/// Add a scalar image using a custom or builtin colormap object.
pub fn imshow_with_colormap(
  data : Array[Array[Double]],
  cmap : @colors.ColorMap,
  vmin? : Double,
  vmax? : Double,
  origin~ : String = "upper",
  extent~ : Array[Double] = [],
  aspect~ : String = "equal",
  alpha~ : Double = 1.0,
  interpolation~ : String = "nearest",
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().imshow_with_colormap(
        data,
        cmap,
        vmin~,
        vmax~,
        origin~,
        extent~,
        aspect~,
        alpha~,
        interpolation~,
      )
    (Some(vmin), None) =>
      require_axes().imshow_with_colormap(
        data,
        cmap,
        vmin~,
        origin~,
        extent~,
        aspect~,
        alpha~,
        interpolation~,
      )
    (None, Some(vmax)) =>
      require_axes().imshow_with_colormap(
        data,
        cmap,
        vmax~,
        origin~,
        extent~,
        aspect~,
        alpha~,
        interpolation~,
      )
    (None, None) =>
      require_axes().imshow_with_colormap(
        data,
        cmap,
        origin~,
        extent~,
        aspect~,
        alpha~,
        interpolation~,
      )
  }
}

///|
/// Add a scalar image with an explicit linear or logarithmic normalization.
pub fn imshow_with_norm(
  data : Array[Array[Double]],
  norm : @colors.ColorNorm,
  cmap~ : String = "gray",
  origin~ : String = "upper",
  extent~ : Array[Double] = [],
  aspect~ : String = "equal",
  alpha~ : Double = 1.0,
  interpolation~ : String = "nearest",
) -> Unit raise @core.DataError {
  require_axes().imshow_with_norm(
    data,
    norm,
    cmap~,
    origin~,
    extent~,
    aspect~,
    alpha~,
    interpolation~,
  )
}

///|
/// Add a scalar image with explicit normalization and colormap objects.
pub fn imshow_with_norm_and_colormap(
  data : Array[Array[Double]],
  norm : @colors.ColorNorm,
  cmap : @colors.ColorMap,
  origin~ : String = "upper",
  extent~ : Array[Double] = [],
  aspect~ : String = "equal",
  alpha~ : Double = 1.0,
  interpolation~ : String = "nearest",
) -> Unit raise @core.DataError {
  require_axes().imshow_with_norm_and_colormap(
    data,
    norm,
    cmap,
    origin~,
    extent~,
    aspect~,
    alpha~,
    interpolation~,
  )
}

///|
/// Add a labeled table to the current axes.
pub fn table(
  cell_text~ : Array[Array[String]] = [],
  cell_colours~ : Array[Array[String]] = [],
  cell_loc~ : String = "right",
  col_widths~ : Array[Double] = [],
  row_labels~ : Array[String] = [],
  row_colours~ : Array[String] = [],
  row_loc~ : String = "left",
  col_labels~ : Array[String] = [],
  col_colours~ : Array[String] = [],
  col_loc~ : String = "center",
  loc~ : String = "bottom",
  bbox~ : Array[Double] = [],
  edges~ : String = "closed",
) -> @scene.Table raise @core.DataError {
  require_axes().table(
    cell_text~,
    cell_colours~,
    cell_loc~,
    col_widths~,
    row_labels~,
    row_colours~,
    row_loc~,
    col_labels~,
    col_colours~,
    col_loc~,
    loc~,
    bbox~,
    edges~,
  )
}

///|
/// Display a two-dimensional matrix with zero-based index ticks.
pub fn matshow(
  data : Array[Array[Double]],
  vmin? : Double,
  vmax? : Double,
  cmap~ : String = "viridis",
  interpolation~ : String = "nearest",
) -> Unit raise @core.DataError {
  match (vmin, vmax) {
    (Some(vmin), Some(vmax)) =>
      require_axes().matshow(data, vmin~, vmax~, cmap~, interpolation~)
    (Some(vmin), None) =>
      require_axes().matshow(data, vmin~, cmap~, interpolation~)
    (None, Some(vmax)) =>
      require_axes().matshow(data, vmax~, cmap~, interpolation~)
    (None, None) => require_axes().matshow(data, cmap~, interpolation~)
  }
}

///|
/// Add a colorbar for an explicit scalar normalization to the current figure.
pub fn colorbar(
  norm : @colors.ColorNorm,
  cmap~ : String = "viridis",
  orientation~ : @colorbar.Orientation = @colorbar.Orientation::Vertical,
) -> @colorbar.Colorbar raise @core.DataError {
  let color_map = match @colors.find_colormap(cmap) {
    Some(value) => value
    None =>
      raise @core.DataError::InvalidImage(message="unknown colormap: \{cmap}")
  }
  require_figure().colorbar(norm, color_map, orientation~)
}

///|
/// Add scatter points to the current figure.
pub fn scatter(
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  let points = @core.series(xs, ys).points()
  require_axes().scatter(points, color~, label~)
}

///|
/// Add per-point marker colors and sizes to the current axes.
pub fn scatter_collection(
  xs : Array[Double],
  ys : Array[Double],
  colors~ : Array[String] = [],
  sizes~ : Array[Double] = [],
  label~ : String = "",
) -> @scene.PathCollection raise @core.DataError {
  let points = @core.series(xs, ys).points()
  require_axes().scatter_collection(points, colors~, sizes~, label~)
}

///|
/// Add scatter points whose x coordinates are string categories.
pub fn scatter_category(
  categories : Array[String],
  values : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().scatter_category(categories, values, color~, label~)
}

///|
/// Add scatter points whose y coordinates are string categories.
pub fn scatter_category_y(
  values : Array[Double],
  categories : Array[String],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().scatter_category_y(values, categories, color~, label~)
}

///|
/// Add bars to the current figure.
pub fn bar(
  xs : Array[Double],
  heights : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  let points = @core.series(xs, heights).points()
  require_axes().bar(points, color~, label~)
}

///|
/// Add bars whose x coordinates are string categories.
pub fn bar_category(
  categories : Array[String],
  values : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().bar_category(categories, values, color~, label~)
}

///|
/// Add horizontal bars whose y coordinates are string categories.
pub fn bar_category_y(
  values : Array[Double],
  categories : Array[String],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().bar_category_y(values, categories, color~, label~)
}

///|
/// Add horizontal bars to the current figure.
pub fn barh(
  ys : Array[Double],
  widths : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().barh(ys, widths, color~, label~)
}

///|
/// Draw horizontal line segments on the current axes.
pub fn hlines(
  ys : Array[Double],
  xmin : Double,
  xmax : Double,
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().hlines(ys, xmin, xmax, color~, label~)
}

///|
/// Draw vertical line segments on the current axes.
pub fn vlines(
  xs : Array[Double],
  ymin : Double,
  ymax : Double,
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().vlines(xs, ymin, ymax, color~, label~)
}

///|
/// Fill a horizontal span on the current axes.
pub fn axhspan(
  ymin : Double,
  ymax : Double,
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().axhspan(ymin, ymax, color~, label~)
}

///|
/// Fill a vertical span on the current axes.
pub fn axvspan(
  xmin : Double,
  xmax : Double,
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().axvspan(xmin, xmax, color~, label~)
}

///|
/// Fill the area between two y series on the current figure.
pub fn fill_between(
  xs : Array[Double],
  lower : Array[Double],
  upper : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().fill_between(xs, lower, upper, color~, label~)
}

///|
/// Set the current figure title.
pub fn title(value : String) -> Unit {
  require_axes().set_title(value)
}

///|
/// Set the current x-axis label.
pub fn xlabel(value : String) -> Unit {
  require_axes().set_x_label(value)
}

///|
/// Set the current y-axis label.
pub fn ylabel(value : String) -> Unit {
  require_axes().set_y_label(value)
}

///|
/// Toggle common axes display modes.
///
/// Supported modes are `"on"`, `"off"`, `"equal"`, `"auto"`, and
/// `"tight"`.
/// equal restores automatic ranges and uses datalim adjustment; it rejects
/// panels sharing both x and y before resetting their view.
pub fn axis(mode~ : String = "on") -> Unit raise @core.DataError {
  match mode {
    "on" => require_axes().set_axis_on()
    "off" => require_axes().set_axis_off()
    "equal" => {
      require_axes().set_aspect(1.0, adjustable="datalim")
      try! require_axes().autoscale()
    }
    "auto" => {
      require_axes().set_aspect_auto()
      try! require_axes().autoscale()
    }
    "tight" => try! require_axes().autoscale(tight=true)
    _ =>
      raise @core.DataError::InvalidTicks(
        message="axis mode must be 'on', 'off', 'equal', 'auto', or 'tight'",
      )
  }
}

///|
/// Hide the current axes decorations.
pub fn axis_off() -> Unit {
  require_axes().set_axis_off()
}

///|
/// Show the current axes decorations.
pub fn axis_on() -> Unit {
  require_axes().set_axis_on()
}

///|
/// Configure major or minor grid lines on the current axes.
pub fn grid(
  visible~ : Bool = true,
  which~ : String = "both",
  color~ : String = "#e5e7eb",
  linewidth~ : Double = 1.0,
  axis~ : String = "both",
) -> Unit raise @core.DataError {
  require_axes().grid(visible~, which~, color~, linewidth~, axis~)
}

///|
/// Set explicit legend entries on the current axes.
pub fn legend(entries : Array[@scene.LegendEntry]) -> Unit {
  require_axes().set_legend(entries)
}

///|
/// Set x-axis limits on the current figure.
pub fn xlim(lower : Double, upper : Double) -> Unit raise @core.DataError {
  require_axes().set_x_limits(lower, upper)
}

///|
/// Set y-axis limits on the current figure.
pub fn ylim(lower : Double, upper : Double) -> Unit raise @core.DataError {
  require_axes().set_y_limits(lower, upper)
}

///|
/// Return the automatic `(x, y)` margins around the current axes data.
pub fn margins() -> (Double, Double) {
  require_axes().margins()
}

///|
/// Set both automatic margins around the current axes data.
pub fn set_margins(x : Double, y : Double) -> Unit raise @core.DataError {
  require_axes().set_margins(x, y)
}

///|
/// Set the automatic x-axis margin on the current axes.
pub fn set_xmargin(value : Double) -> Unit raise @core.DataError {
  require_axes().set_x_margin(value)
}

///|
/// Set the automatic y-axis margin on the current axes.
pub fn set_ymargin(value : Double) -> Unit raise @core.DataError {
  require_axes().set_y_margin(value)
}

///|
/// Toggle automatic view updates on the current axes and schedule selected views.
/// enable=None retains the switches and requests both coordinates.
pub fn autoscale(
  axis~ : String = "both",
  enable~ : Bool? = Some(true),
  tight? : Bool,
) -> Unit raise @core.DataError {
  require_axes().autoscale(axis~, enable~, tight?)
}

///|
/// Recompute selected automatic views without enabling their autoscale switches.
pub fn autoscale_view(
  tight? : Bool,
  scalex~ : Bool = true,
  scaley~ : Bool = true,
  axis~ : String = "both",
) -> Unit raise @core.DataError {
  require_axes().autoscale_view(tight?, scalex~, scaley~, axis~)
}

///|
/// Set the current x-axis scale.
pub fn xscale(value : @scale.Scale) -> Unit raise @core.DataError {
  require_axes().set_x_scale(value)
}

///|
/// Set the current y-axis scale.
pub fn yscale(value : @scale.Scale) -> Unit raise @core.DataError {
  require_axes().set_y_scale(value)
}

///|
/// Add a logarithmic x/y plot to the current axes.
pub fn loglog(
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().loglog(xs, ys, color~, label~)
}

///|
/// Add a plot with logarithmic x coordinates to the current axes.
pub fn semilogx(
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().semilogx(xs, ys, color~, label~)
}

///|
/// Add a plot with logarithmic y coordinates to the current axes.
pub fn semilogy(
  xs : Array[Double],
  ys : Array[Double],
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().semilogy(xs, ys, color~, label~)
}

///|
/// Set fixed x-axis ticks and optional labels on the current axes.
pub fn xticks(
  values : Array[Double],
  labels~ : Array[String] = [],
) -> Unit raise @core.DataError {
  let axes = require_axes()
  axes.set_x_ticks(values)
  if labels.length() > 0 {
    axes.set_x_tick_labels(labels)
  }
}

///|
/// Set fixed y-axis ticks and optional labels on the current axes.
pub fn yticks(
  values : Array[Double],
  labels~ : Array[String] = [],
) -> Unit raise @core.DataError {
  let axes = require_axes()
  axes.set_y_ticks(values)
  if labels.length() > 0 {
    axes.set_y_tick_labels(labels)
  }
}

///|
/// Configure a numeric major locator on the current x axis.
pub fn xaxis_locator(locator : @ticker.Locator) -> Unit raise @core.DataError {
  require_axes().set_x_locator(locator)
}

///|
/// Configure a numeric major locator on the current y axis.
pub fn yaxis_locator(locator : @ticker.Locator) -> Unit raise @core.DataError {
  require_axes().set_y_locator(locator)
}

///|
/// Configure a numeric formatter on the current x axis.
pub fn xaxis_formatter(
  formatter : @ticker.Formatter,
) -> Unit raise @core.DataError {
  require_axes().set_x_formatter(formatter)
}

///|
/// Configure a numeric formatter on the current y axis.
pub fn yaxis_formatter(
  formatter : @ticker.Formatter,
) -> Unit raise @core.DataError {
  require_axes().set_y_formatter(formatter)
}

///|
/// Configure a minor locator on the current x axis.
pub fn xaxis_minor_locator(
  locator : @ticker.MinorLocator,
) -> Unit raise @core.DataError {
  require_axes().set_x_minor_locator(locator)
}

///|
/// Configure a minor locator on the current y axis.
pub fn yaxis_minor_locator(
  locator : @ticker.MinorLocator,
) -> Unit raise @core.DataError {
  require_axes().set_y_minor_locator(locator)
}

///|
/// Add a secondary x axis derived from the primary x coordinate.
pub fn secondary_xaxis(
  forward : (Double) -> Double,
  inverse : (Double) -> Double,
  location~ : @scene.SecondaryAxisLocation = @scene.SecondaryAxisLocation::Top,
) -> @scene.SecondaryAxis raise @core.DataError {
  require_axes().secondary_xaxis(forward, inverse, location~)
}

///|
/// Add a secondary y axis derived from the primary y coordinate.
pub fn secondary_yaxis(
  forward : (Double) -> Double,
  inverse : (Double) -> Double,
  location~ : @scene.SecondaryAxisLocation = @scene.SecondaryAxisLocation::Right,
) -> @scene.SecondaryAxis raise @core.DataError {
  require_axes().secondary_yaxis(forward, inverse, location~)
}

///|
/// Draw a horizontal reference line on the current figure.
pub fn axhline(
  value : Double,
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().axhline(value, color~, label~)
}

///|
/// Draw a vertical reference line on the current figure.
pub fn axvline(
  value : Double,
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  require_axes().axvline(value, color~, label~)
}

///|
/// Draw an infinitely long line through one or two data points.
pub fn axline(
  xy1 : @core.Point,
  xy2? : @core.Point,
  slope? : Double,
  color~ : String = "",
  label~ : String = "",
) -> Unit raise @core.DataError {
  match (xy2, slope) {
    (Some(xy2), Some(slope)) =>
      require_axes().axline(xy1, xy2~, slope~, color~, label~)
    (Some(xy2), None) => require_axes().axline(xy1, xy2~, color~, label~)
    (None, Some(slope)) => require_axes().axline(xy1, slope~, color~, label~)
    (None, None) => require_axes().axline(xy1, color~, label~)
  }
}

///|
/// Add text at a data coordinate on the current figure.
pub fn text(
  x : Double,
  y : Double,
  value : String,
  color~ : String = "#111827",
) -> Unit raise @core.DataError {
  require_axes().text(x, y, value, color~)
}

///|
/// Return the current figure as SVG.
pub fn render_svg() -> String {
  require_figure().to_svg()
}

///|
/// Alias for render_svg while file backends are being added.
pub fn savefig_svg() -> String {
  render_svg()
}
