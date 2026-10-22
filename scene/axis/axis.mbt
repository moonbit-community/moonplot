///|
/// Locations supported for axis tick labels.
pub(all) enum TickPosition {
  Top
  Bottom
  Left
  Right
  Both
}

///|
/// A coordinate axis with limits, tick formatting, and presentation settings.
pub struct Axis {
  priv mut data_interval_provider : (() -> (Double, Double))?
  priv mut tick_length_provider : (() -> Double)?
  priv mut numeric_view_provider : (() -> (Double, Double) raise @core.DataError)?
  priv mut tick_layout_length : Double?
  priv mut tick_layout_view : (Double, Double)?
  priv mut tick_layout_active : Bool
  priv mut tick_horizontal : Bool
  priv mut tick_label_size : Double?
  mut limits : @core.Limits?
  mut auto_view : @core.Limits?
  mut inverted : Bool
  mut label : String?
  mut tick_count : Int32
  priv mut tick_count_configured : Bool
  priv mut automatic_date_locator : @date.AutoDateLocator?
  priv mut date_converter : @date.DateConverter?
  mut locator : @ticker.Locator?
  mut minor_locator : @ticker.MinorLocator?
  mut fixed_ticks : Array[Double]?
  mut fixed_labels : Array[String]?
  mut category : @category.CategoryAxis?
  mut date_format : String?
  mut date_offset_minutes : Int32
  mut date_timezone : @date.DateTimeZone?
  priv mut date_timezone_is_default : Bool
  mut date_locator : @date.DateLocator?
  priv mut date_formatter : @date.DateFormatter?
  priv mut date_formatter_default : Bool
  priv mut minor_date_locator : @date.DateLocator?
  priv mut minor_date_formatter : @date.DateFormatter?
  priv mut remove_minor_overlap : Bool
  mut formatter : @ticker.Formatter?
  mut scale : @scale.Scale
  mut tick_position : TickPosition?
  mut grid_visible : Bool
  mut grid_color : String
  mut grid_width : Double
  mut minor_grid_visible : Bool
  mut minor_grid_color : String
  mut minor_grid_width : Double
}

///|
/// Construct an automatic axis.
pub fn axis() -> Axis {
  {
    data_interval_provider: None,
    tick_length_provider: None,
    numeric_view_provider: None,
    tick_layout_length: None,
    tick_layout_view: None,
    tick_layout_active: false,
    tick_horizontal: true,
    tick_label_size: None,
    limits: None,
    auto_view: None,
    inverted: false,
    label: None,
    tick_count: 6,
    tick_count_configured: false,
    automatic_date_locator: None,
    date_converter: None,
    locator: None,
    minor_locator: None,
    fixed_ticks: None,
    fixed_labels: None,
    category: None,
    date_format: None,
    date_offset_minutes: 0,
    date_timezone: None,
    date_timezone_is_default: true,
    date_locator: None,
    date_formatter: None,
    date_formatter_default: false,
    minor_date_locator: None,
    minor_date_formatter: None,
    remove_minor_overlap: true,
    formatter: None,
    scale: @scale.linear_scale(),
    tick_position: None,
    grid_visible: @config.grid_visible(),
    grid_color: @config.grid_color(),
    grid_width: @config.grid_linewidth(),
    minor_grid_visible: false,
    minor_grid_color: @config.grid_color(),
    minor_grid_width: @config.grid_linewidth() / 2.0,
  }
}

///|
/// Set explicit limits while preserving their direction.
pub fn Axis::set_limits(
  self : Axis,
  lower : Double,
  upper : Double,
) -> Unit raise @core.DataError {
  let limits = @core.limits(lower, upper)
  if !limits.is_finite() {
    raise @core.DataError::NonFiniteLimit(axis="axis")
  }
  if self.scale.is_log() && (lower <= 0.0 || upper <= 0.0) {
    raise @core.DataError::InvalidTicks(
      message="log scale limits must be positive",
    )
  }
  self.limits = Some(limits)
  self.auto_view = None
  self.inverted = lower > upper
}

///|
/// Clear explicit limits and return to automatic range computation,
/// preserving the axis direction.
pub fn Axis::clear_limits(self : Axis) -> Unit {
  self.limits = None
  self.auto_view = None
}

///|
/// Restore this axis to its initial automatic state.
pub fn Axis::clear(self : Axis) -> Unit {
  self.tick_label_size = None
  self.limits = None
  self.auto_view = None
  self.inverted = false
  self.label = None
  self.tick_count = 6
  self.tick_count_configured = false
  self.automatic_date_locator = None
  self.date_converter = None
  self.locator = None
  self.minor_locator = None
  self.fixed_ticks = None
  self.fixed_labels = None
  self.category = None
  self.date_format = None
  self.date_offset_minutes = 0
  self.date_timezone = None
  self.date_timezone_is_default = true
  self.date_locator = None
  self.date_formatter = None
  self.date_formatter_default = false
  self.minor_date_locator = None
  self.minor_date_formatter = None
  self.remove_minor_overlap = true
  self.formatter = None
  self.scale = @scale.linear_scale()
  self.tick_position = None
  self.grid_visible = @config.grid_visible()
  self.grid_color = @config.grid_color()
  self.grid_width = @config.grid_linewidth()
  self.minor_grid_visible = false
  self.minor_grid_color = @config.grid_color()
  self.minor_grid_width = @config.grid_linewidth() / 2.0
}

///|
/// Set the coordinate scale for this axis.
pub fn Axis::set_scale(
  self : Axis,
  value : @scale.Scale,
) -> Unit raise @core.DataError {
  if value.is_nonlinear() && self.date_format is Some(_) {
    raise @core.DataError::InvalidTicks(
      message="date axis cannot be combined with a non-linear scale",
    )
  }
  if value.is_log() {
    match self.category {
      Some(_) =>
        raise @core.DataError::InvalidTicks(
          message="log scale cannot be combined with category data",
        )
      None => ()
    }
    match self.limits {
      Some(limits) =>
        if limits.lower() <= 0.0 || limits.upper() <= 0.0 {
          raise @core.DataError::InvalidTicks(
            message="log scale limits must be positive",
          )
        }
      None => ()
    }
    match self.fixed_ticks {
      Some(values) =>
        for tick in values {
          if tick <= 0.0 {
            raise @core.DataError::InvalidTicks(
              message="log scale tick positions must be positive",
            )
          }
        }
      None => ()
    }
    match self.locator {
      Some(@ticker.Locator::Linear(..) | @ticker.Locator::MaxN(..)) =>
        raise @core.DataError::InvalidTicks(
          message="linear locator cannot be used with log scale",
        )
      Some(@ticker.Locator::Fixed(values)) =>
        for tick in values {
          if tick <= 0.0 {
            raise @core.DataError::InvalidTicks(
              message="log scale locator values must be positive",
            )
          }
        }
      _ => ()
    }
    match self.minor_locator {
      Some(@ticker.MinorLocator::Auto(..)) =>
        raise @core.DataError::InvalidTicks(
          message="automatic minor locator cannot be used with log scale",
        )
      Some(@ticker.MinorLocator::Fixed(values)) =>
        for tick in values {
          if tick <= 0.0 {
            raise @core.DataError::InvalidTicks(
              message="log scale minor locator values must be positive",
            )
          }
        }
      _ => ()
    }
  }
  self.scale = value
  self.request_autoscale()
}

///|
/// Return the configured coordinate scale.
pub fn Axis::scale(self : Axis) -> @scale.Scale {
  self.scale
}

///|
/// Return explicit limits, if any.
pub fn Axis::limits(self : Axis) -> @core.Limits? {
  self.limits
}

///|
/// Set the axis label.
pub fn Axis::set_label(self : Axis, label : String) -> Unit {
  self.label = Some(label)
}

///|
/// Return the optional axis label.
pub fn Axis::label(self : Axis) -> String? {
  self.label
}

///|
/// Set the side on which this axis's tick labels are rendered.
///
/// The renderer interprets `Top`/`Bottom` for an x axis and
/// `Left`/`Right` for a y axis. `Both` renders labels on both sides.
pub fn Axis::set_tick_position(self : Axis, position : TickPosition) -> Unit {
  self.tick_position = Some(position)
}

///|
/// Return the explicitly configured tick label side, if any.
pub fn Axis::tick_position(self : Axis) -> TickPosition? {
  self.tick_position
}

///|
/// Restore the renderer's default tick label side.
pub fn Axis::clear_tick_position(self : Axis) -> Unit {
  self.tick_position = None
}

///|
/// Configure major grid lines for this axis.
///
/// Grid lines are disabled by default, matching Matplotlib's
/// `axes.grid=False`. The renderer consumes the style without changing tick
/// positions or labels.
pub fn Axis::set_grid(
  self : Axis,
  visible : Bool,
  color : String,
  linewidth : Double,
) -> Unit raise @core.DataError {
  if linewidth.is_nan() || linewidth.is_inf() || linewidth <= 0.0 {
    raise @core.DataError::InvalidTicks(
      message="grid linewidth must be finite and positive",
    )
  }
  if color.length() == 0 {
    raise @core.DataError::InvalidTicks(message="grid color must not be empty")
  }
  self.grid_visible = visible
  self.grid_color = color
  self.grid_width = linewidth
}

///|
/// Return whether major grid lines are enabled for this axis.
pub fn Axis::grid_visible(self : Axis) -> Bool {
  self.grid_visible
}

///|
/// Return the major grid line color.
pub fn Axis::grid_color(self : Axis) -> String {
  self.grid_color
}

///|
/// Return the major grid line width.
pub fn Axis::grid_width(self : Axis) -> Double {
  self.grid_width
}

///|
/// Configure minor grid lines independently from major grids.
pub fn Axis::set_minor_grid(
  self : Axis,
  visible : Bool,
  color : String,
  linewidth : Double,
) -> Unit raise @core.DataError {
  if linewidth.is_nan() || linewidth.is_inf() || linewidth <= 0.0 {
    raise @core.DataError::InvalidTicks(
      message="minor grid linewidth must be finite and positive",
    )
  }
  if color.length() == 0 {
    raise @core.DataError::InvalidTicks(
      message="minor grid color must not be empty",
    )
  }
  self.minor_grid_visible = visible
  self.minor_grid_color = color
  self.minor_grid_width = linewidth
}

///|
/// Return whether minor grid lines are enabled.
pub fn Axis::minor_grid_visible(self : Axis) -> Bool {
  self.minor_grid_visible
}

///|
/// Return the minor grid line color.
pub fn Axis::minor_grid_color(self : Axis) -> String {
  self.minor_grid_color
}

///|
/// Return the minor grid line width.
pub fn Axis::minor_grid_width(self : Axis) -> Double {
  self.minor_grid_width
}

///|
/// Set the desired number of linear ticks.
pub fn Axis::set_tick_count(self : Axis, count : Int32) -> Unit {
  self.tick_count = if count < 2 { 2 } else { count }
  self.tick_count_configured = true
  self.automatic_date_locator = self.automatic_date_locator.map(value => {
    try! value.with_maxticks(@date.All(self.tick_count))
  })
}

///|
/// Return the desired number of ticks.
pub fn Axis::tick_count(self : Axis) -> Int32 {
  self.tick_count
}

///|
/// Set a numeric locator for automatic major ticks.
pub fn Axis::set_locator(
  self : Axis,
  locator : @ticker.Locator,
) -> Unit raise @core.DataError {
  if self.category is Some(_) {
    raise @core.DataError::InvalidTicks(
      message="numeric locator cannot be combined with category data",
    )
  }
  match (self.scale, locator) {
    (@scale.Scale::Log, @ticker.Locator::Linear(..) | @ticker.Locator::MaxN(..)) =>
      raise @core.DataError::InvalidTicks(
        message="linear locator cannot be used with log scale",
      )
    (@scale.Scale::Log, @ticker.Locator::Fixed(values)) =>
      for value in values {
        if value <= 0.0 {
          raise @core.DataError::InvalidTicks(
            message="log scale locator values must be positive",
          )
        }
      }
    _ => ()
  }
  self.locator = Some(locator.copy())
  self.bind_locator_data()
  self.date_locator = None
  self.fixed_ticks = None
  self.fixed_labels = None
}

///|
/// Return the configured numeric locator, if any.
pub fn Axis::locator(self : Axis) -> @ticker.Locator? {
  match self.locator {
    Some(value) => Some(value.copy())
    None => None
  }
}

///|
/// Clear the numeric locator and return to scale defaults.
pub fn Axis::clear_locator(self : Axis) -> Unit {
  self.locator = None
  self.fixed_ticks = None
  self.fixed_labels = None
}

///|
/// Set a minor locator used between major tick positions.
pub fn Axis::set_minor_locator(
  self : Axis,
  locator : @ticker.MinorLocator,
) -> Unit raise @core.DataError {
  if self.category is Some(_) {
    raise @core.DataError::InvalidTicks(
      message="minor locator cannot be combined with category data",
    )
  }
  match (self.scale, locator) {
    (@scale.Scale::Log, @ticker.MinorLocator::Auto(..)) =>
      raise @core.DataError::InvalidTicks(
        message="automatic minor locator cannot be used with log scale",
      )
    (@scale.Scale::Log, @ticker.MinorLocator::Fixed(values)) =>
      for value in values {
        if value <= 0.0 {
          raise @core.DataError::InvalidTicks(
            message="log scale minor locator values must be positive",
          )
        }
      }
    _ => ()
  }
  self.minor_locator = Some(locator.copy())
  self.bind_locator_data(minor=true)
  self.minor_date_locator = None
}

///|
/// Return the configured minor locator, if any.
pub fn Axis::minor_locator(self : Axis) -> @ticker.MinorLocator? {
  match self.minor_locator {
    Some(value) => Some(value.copy())
    None => None
  }
}

///|
/// Clear the minor locator.
pub fn Axis::clear_minor_locator(self : Axis) -> Unit {
  self.minor_locator = None
  self.minor_date_locator = None
}

///|
/// Set fixed tick positions, replacing automatic linear ticks.
pub fn Axis::set_ticks(
  self : Axis,
  values : Array[Double],
) -> Unit raise @core.DataError {
  for value in values {
    if value.is_nan() || value.is_inf() {
      raise @core.DataError::InvalidTicks(
        message="tick positions must be finite",
      )
    }
    if self.scale.is_log() && value <= 0.0 {
      raise @core.DataError::InvalidTicks(
        message="log scale tick positions must be positive",
      )
    }
  }
  self.fixed_ticks = Some(values.copy())
  self.fixed_labels = None
  self.locator = None
  self.category = None
  self.date_locator = None
}

///|
/// Configure this axis to format numeric day values as dates.
///
/// An empty format selects a range-dependent format at render time. The
/// numeric values remain Matplotlib day ordinals, so existing plot methods
/// can be used after converting dates with `DateTime::to_ordinal`.
pub fn Axis::set_date_format(
  self : Axis,
  format : String,
) -> Unit raise @core.DataError {
  self.configure_date_format(format)
}

///|
fn Axis::configure_date_format(
  self : Axis,
  format : String,
  unit? : @date.DateTimeZone,
) -> Unit raise @core.DataError {
  if self.scale.is_nonlinear() {
    raise @core.DataError::InvalidTicks(
      message="date axis cannot be combined with a non-linear scale",
    )
  }
  match self.category {
    Some(_) =>
      raise @core.DataError::InvalidTicks(
        message="date axis cannot be combined with category data",
      )
    None => ()
  }
  let converter = self.date_converter.unwrap_or(@date.default_date_converter())
  let unit = match unit {
    Some(_) => unit
    None if !self.date_timezone_is_default =>
      Some(self.explicit_date_timezone())
    None => None
  }
  let info = self.checked_date_axisinfo(converter, unit?)
  let automatic = if self.automatic_date_locator is None {
    Some(self.make_default_date_locator(info))
  } else {
    self.automatic_date_locator
  }
  self.date_format = Some(format)
  self.date_converter = Some(converter)
  self.automatic_date_locator = automatic
  if self.date_timezone_is_default &&
    (self.date_timezone is None || format != "") {
    self.date_timezone = info.major_locator().timezone()
    self.date_offset_minutes = info.major_locator().offset_minutes()
  }
  self.date_formatter_default = format == ""
  self.date_formatter = if format == "" {
    Some(info.major_formatter())
  } else {
    None
  }
  self.sync_default_date_formatter()
  self.category = None
  self.formatter = None
}

///|
/// Configure automatic date formatting for this axis.
pub fn Axis::set_date(self : Axis) -> Unit raise @core.DataError {
  self.set_date_format("")
}

///|
/// Set the fixed UTC offset for date tick positions and labels.
///
/// ```mbt check
/// test {
///   let axis = @axis.axis()
///   try! axis.set_date_offset(345)
///   assert_eq(axis.date_offset_minutes(), 345)
/// }
/// ```
pub fn Axis::set_date_offset(
  self : Axis,
  offset_minutes : Int32,
) -> Unit raise @core.DataError {
  if offset_minutes <= -1440 || offset_minutes >= 1440 {
    raise @core.DataError::InvalidTicks(
      message="date offset must be in -1439..1439 minutes",
    )
  }
  if self.date_format is None {
    self.configure_date_format(
      "",
      unit=try! @date.fixed_timezone(offset_minutes),
    )
  }
  self.date_timezone = None
  self.date_timezone_is_default = false
  match self.date_locator {
    Some(locator) =>
      self.date_locator = Some(try! locator.with_offset(offset_minutes))
    None => ()
  }
  self.date_offset_minutes = offset_minutes
  self.automatic_date_locator = self.automatic_date_locator.map(value => {
    try! value.with_offset(offset_minutes)
  })
  self.date_formatter = self.date_formatter.map(formatter => {
    try! formatter.with_offset(offset_minutes)
  })
  self.minor_date_locator = self.minor_date_locator.map(locator => {
    try! locator.with_offset(offset_minutes)
  })
  self.minor_date_formatter = self.minor_date_formatter.map(formatter => {
    try! formatter.with_offset(offset_minutes)
  })
}

///|
/// Return the fixed UTC offset used for date tick positions and labels.
pub fn Axis::date_offset_minutes(self : Axis) -> Int32 {
  self.date_offset_minutes
}

///|
/// Set an explicit transition-aware timezone for date labels.
///
/// Calendar tick positions and label conversion follow the configured UTC
/// transitions. Spring gaps are skipped and fall folds can emit both instants.
pub fn Axis::set_date_timezone(
  self : Axis,
  timezone : @date.DateTimeZone,
) -> Unit raise @core.DataError {
  if self.date_format is None {
    self.configure_date_format("", unit=timezone)
  }
  let offset_minutes = timezone.initial_offset_minutes()
  match self.date_locator {
    Some(locator) => self.date_locator = Some(locator.with_timezone(timezone))
    None => ()
  }
  self.date_offset_minutes = offset_minutes
  self.date_timezone = Some(timezone)
  self.date_timezone_is_default = false
  self.automatic_date_locator = self.automatic_date_locator.map(value => {
    value.with_timezone(timezone)
  })
  self.date_formatter = self.date_formatter.map(formatter => {
    formatter.with_timezone(timezone)
  })
  self.minor_date_locator = self.minor_date_locator.map(locator => {
    locator.with_timezone(timezone)
  })
  self.minor_date_formatter = self.minor_date_formatter.map(formatter => {
    formatter.with_timezone(timezone)
  })
}

///|
/// Return the transition-aware timezone used for date labels, if configured.
pub fn Axis::date_timezone(self : Axis) -> @date.DateTimeZone? {
  self.date_timezone
}

///|
/// Use an explicit calendar locator while retaining automatic date labels.
pub fn Axis::set_date_locator(
  self : Axis,
  locator : @date.DateLocator,
) -> Unit raise @core.DataError {
  if self.scale.is_nonlinear() {
    raise @core.DataError::InvalidTicks(
      message="date axis cannot be combined with a non-linear scale",
    )
  }
  match self.date_format {
    Some(_) => ()
    None => self.set_date()
  }
  let effective_locator = if self.date_timezone_is_default {
    locator.copy()
  } else {
    match self.date_timezone {
      Some(timezone) => locator.with_timezone(timezone)
      None => locator.copy()
    }
  }
  self.date_locator = Some(effective_locator)
  self.date_offset_minutes = effective_locator.offset_minutes()
  if self.date_timezone_is_default && effective_locator.timezone() is None {
    // Preserve the legacy explicit fixed-offset locator extension. Ordinary
    // constructors now carry a captured zone, so their labels remain dynamic.
    self.date_timezone = None
    self.date_timezone_is_default = false
  }
  self.sync_default_date_formatter()
  self.locator = None
  self.minor_locator = None
  self.fixed_ticks = None
  self.fixed_labels = None
  self.category = None
  self.formatter = None
}

///|
/// Clear date formatting and return to numeric tick labels.
pub fn Axis::clear_date(self : Axis) -> Unit {
  self.date_format = None
  self.date_formatter = None
  self.automatic_date_locator = None
  self.date_converter = None
  self.date_formatter_default = false
  self.minor_date_locator = None
  self.minor_date_formatter = None
  self.date_timezone = None
  self.date_timezone_is_default = true
  self.date_locator = None
  self.date_offset_minutes = 0
}

///|
/// Return the explicit date format, if date mode is enabled.
pub fn Axis::date_format(self : Axis) -> String? {
  self.date_format
}

///|
/// Return the explicit date locator, if configured.
pub fn Axis::date_locator(self : Axis) -> @date.DateLocator? {
  self.date_locator.map(value => value.copy())
}

///|
/// Configure the numeric formatter used for this axis's tick labels.
pub fn Axis::set_formatter(
  self : Axis,
  formatter : @ticker.Formatter,
) -> Unit raise @core.DataError {
  if self.date_format is Some(_) || self.category is Some(_) {
    raise @core.DataError::InvalidTicks(
      message="numeric formatter cannot be combined with date or category data",
    )
  }
  self.formatter = Some(formatter.copy())
}

///|
/// Return the configured numeric formatter, if any.
pub fn Axis::formatter(self : Axis) -> @ticker.Formatter? {
  match self.formatter {
    Some(value) => Some(value.copy())
    None => None
  }
}

///|
/// Return the shared text selected by the numeric or date formatter, if any.
pub fn Axis::formatter_offset_label(
  self : Axis,
  values : Array[Double],
) -> String {
  self.formatter_offset_label_with_view(values, self.limits)
}

///|
/// Return the numeric or date formatter's offset label for an explicit viewport.
///
/// Renderers should pass the viewport they used to generate the ticks.  When
/// it is omitted, an explicitly configured axis limit is used and otherwise
/// the formatter falls back to the supplied tick extent.
pub fn Axis::formatter_offset_label_with_view(
  self : Axis,
  values : Array[Double],
  view : @core.Limits?,
) -> String {
  // Explicit labels own their text, and category axes have no shared offset.
  if self.fixed_labels is Some(_) || self.category is Some(_) {
    return ""
  }
  if self.date_format is Some(_) {
    return match self.date_formatter {
      Some(formatter) => {
        let (ticks, inverted, _) = self.date_formatter_values(values, view)
        formatter
        .with_locator_unit(self.date_formatter_unit(values, view, false))
        .offset_label(ticks, inverted~)
      }
      None => ""
    }
  }
  let effective_view = match view {
    Some(_) => view
    None => self.limits
  }
  match self.formatter {
    Some(value) => value.offset_label_with_view(values, effective_view)
    None => ""
  }
}

///|
/// Clear the numeric formatter and restore scale-based labels.
pub fn Axis::clear_formatter(self : Axis) -> Unit {
  self.formatter = None
}

///|
/// Clear fixed tick positions and labels.
pub fn Axis::clear_ticks(self : Axis) -> Unit {
  self.fixed_ticks = None
  self.fixed_labels = None
}

///|
/// Configure an axis with an ordered set of string categories.
pub fn Axis::set_categories(
  self : Axis,
  labels : Array[String],
) -> Unit raise @core.DataError {
  if self.scale.is_nonlinear() {
    raise @core.DataError::InvalidTicks(
      message="category data cannot be combined with a non-linear scale",
    )
  }
  match self.date_format {
    Some(_) =>
      raise @core.DataError::InvalidTicks(
        message="category data cannot be combined with date axis",
      )
    None => ()
  }
  let converter = @category.category().with_labels(labels)
  self.category = Some(converter)
  self.locator = None
  self.minor_locator = None
  self.fixed_ticks = None
  self.fixed_labels = None
  self.date_locator = None
  self.formatter = None
}

///|
/// Clear category conversion and return to numeric tick generation.
pub fn Axis::clear_categories(self : Axis) -> Unit {
  self.category = None
}

///|
/// Return category labels in first-seen order, if configured.
pub fn Axis::categories(self : Axis) -> Array[String]? {
  match self.category {
    Some(converter) => Some(converter.labels())
    None => None
  }
}

///|
/// Convert string values and retain their categories on this axis.
pub fn Axis::category_positions(
  self : Axis,
  values : Array[String],
) -> Array[Double] raise @core.DataError {
  if self.scale.is_nonlinear() {
    raise @core.DataError::InvalidTicks(
      message="category data cannot be combined with a non-linear scale",
    )
  }
  match self.date_format {
    Some(_) =>
      raise @core.DataError::InvalidTicks(
        message="category data cannot be combined with date axis",
      )
    None => ()
  }
  let converter = match self.category {
    Some(value) => value
    None => @category.category()
  }
  let (positions, next) = converter.encode(values)
  self.category = Some(next)
  self.locator = None
  self.minor_locator = None
  self.fixed_ticks = None
  self.fixed_labels = None
  self.date_locator = None
  self.formatter = None
  positions
}

///|
/// Set labels for the currently fixed tick positions.
pub fn Axis::set_tick_labels(
  self : Axis,
  labels : Array[String],
) -> Unit raise @core.DataError {
  match self.fixed_ticks {
    Some(values) =>
      if values.length() != labels.length() {
        raise @core.DataError::InvalidTicks(
          message="tick labels must match tick positions",
        )
      } else {
        self.fixed_labels = Some(labels.copy())
      }
    None =>
      raise @core.DataError::InvalidTicks(
        message="set tick positions before tick labels",
      )
  }
}

///|
/// Return fixed tick positions, if configured.
pub fn Axis::ticks(self : Axis) -> Array[Double]? {
  match self.fixed_ticks {
    Some(values) => Some(values.copy())
    None => None
  }
}

///|
/// Format labels for a concrete tick list.
pub fn Axis::tick_labels(self : Axis, values : Array[Double]) -> Array[String] {
  self.tick_labels_with_view(values, self.limits)
}

///|
/// Format labels for a concrete tick list and viewport.
pub fn Axis::tick_labels_with_view(
  self : Axis,
  values : Array[Double],
  view : @core.Limits?,
) -> Array[String] {
  match self.fixed_labels {
    Some(labels) => labels.copy()
    None =>
      match self.category {
        Some(converter) => converter.tick_labels()
        None => {
          let result = Array(capacity=values.length())
          match self.date_format {
            Some(format) => {
              if self.date_formatter is Some(formatter) {
                let (ticks, inverted, reversed) = self.date_formatter_values(
                  values, view,
                )
                let labels = formatter
                  .with_locator_unit(
                    self.date_formatter_unit(values, view, false),
                  )
                  .format_values(ticks, inverted~)
                return if reversed { labels.rev() } else { labels }
              }
              let timezone = self.date_timezone
              let labels = match timezone {
                Some(timezone) =>
                  @date.format_date_ticks(
                    values,
                    format~,
                    offset_minutes=self.date_offset_minutes,
                    timezone~,
                  )
                None =>
                  @date.format_date_ticks(
                    values,
                    format~,
                    offset_minutes=self.date_offset_minutes,
                  )
              }
              for label in labels {
                result.push(label)
              }
            }
            None =>
              match self.formatter {
                Some(formatter) => {
                  let effective_view = match view {
                    Some(_) => view
                    None => self.limits
                  }
                  let labels = formatter.format_values_with_view(
                    values, effective_view,
                  )
                  for label in labels {
                    result.push(label)
                  }
                }
                None =>
                  for value in values {
                    result.push(self.scale.format_tick(value))
                  }
              }
          }
          result
        }
      }
  }
}

///|
/// Generate ticks for explicit or supplied automatic limits.
pub fn Axis::tick_values(
  self : Axis,
  automatic : @core.Limits,
) -> Array[Double] {
  if self.fixed_ticks is None &&
    self.category is None &&
    self.locator
    is Some(
      @ticker.Locator::Index(_)
      | @ticker.Locator::NamedMaxN(_)
      | @ticker.Locator::NamedAuto(_)
    ) {
    return self.tick_values_checked(automatic) catch { _ => [] }
  }
  match self.fixed_ticks {
    Some(values) => values.copy()
    None =>
      match self.category {
        Some(converter) => converter.tick_positions()
        None => {
          let limits = match self.limits {
            Some(value) => value
            None => automatic
          }
          let limits = self.date_nonsingular_bounds(
            limits.lower(),
            limits.upper(),
          )
          match self.date_format {
            Some(_) =>
              match self.date_locator {
                Some(locator) =>
                  locator.tick_values(limits.lower(), limits.upper())
                None => {
                  if self.locator is Some(locator) {
                    return locator.tick_values(limits.lower(), limits.upper())
                  }
                  if self.automatic_date_locator is Some(locator) {
                    return locator.tick_values(limits.lower(), limits.upper()) catch {
                      _ => []
                    }
                  }
                  let timezone = self.date_timezone
                  @date.date_tick_values(
                    limits.lower(),
                    limits.upper(),
                    count=self.tick_count,
                    offset_minutes=self.date_offset_minutes,
                    timezone?,
                  )
                }
              }
            None =>
              match self.locator {
                Some(locator) =>
                  locator.tick_values(limits.lower(), limits.upper())
                None => self.scale.tick_values(limits, count=self.tick_count)
              }
          }
        }
      }
  }
}

///|
/// Generate minor ticks from the configured minor locator.
pub fn Axis::minor_tick_values(
  self : Axis,
  automatic : @core.Limits,
) -> Array[Double] {
  if self.category is None &&
    self.minor_date_locator is None &&
    self.minor_locator
    is Some(
      @ticker.MinorLocator::NamedLinear(_)
      | @ticker.MinorLocator::Index(_)
      | @ticker.MinorLocator::NamedFixed(_)
      | @ticker.MinorLocator::NamedMaxN(_)
      | @ticker.MinorLocator::NamedAuto(_)
    ) {
    return self.minor_tick_values_checked(automatic) catch { _ => [] }
  }
  if self.minor_date_locator is Some(locator) {
    let limits = self.limits.unwrap_or(automatic)
    let limits = self.date_nonsingular_bounds(limits.lower(), limits.upper())
    let ticks = locator.tick_values(limits.lower(), limits.upper())
    return self.filter_date_minor_ticks(
      ticks,
      self.tick_values(automatic),
      limits,
    )
  }
  match self.minor_locator {
    None => []
    Some(locator) => {
      let limits = match self.limits {
        Some(value) => value
        None => automatic
      }
      let major = self.tick_values(automatic)
      if self.date_format is Some(_) {
        let ticks = match locator {
          @ticker.MinorLocator::Fixed(_) =>
            locator.tick_values([], limits.lower(), limits.upper())
          _ => locator.tick_values(major, limits.lower(), limits.upper())
        }
        self.filter_date_minor_ticks(ticks, major, limits)
      } else {
        locator.tick_values(major, limits.lower(), limits.upper())
      }
    }
  }
}
