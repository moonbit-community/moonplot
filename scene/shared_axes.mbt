///|
fn share_group_for_cell(
  mode : @gridspec.ShareMode,
  row : Int32,
  column : Int32,
) -> Int32? {
  match mode {
    @gridspec.ShareMode::None => None
    @gridspec.ShareMode::All => Some(0)
    @gridspec.ShareMode::Row => Some(row)
    @gridspec.ShareMode::Column => Some(column)
  }
}

///|
/// Create axes panels according to a GridSpec's sharing constraints.
pub fn Figure::subplots_with_grid(
  self : Figure,
  grid : @gridspec.GridSpec,
) -> Array[Axes] raise @gridspec.LayoutError {
  self.axes.clear()
  self.axes_selection.clear()
  self.colorbars.clear()
  let result = Array(capacity=grid.rows() * grid.columns())
  for row in 0..<grid.rows() {
    for column in 0..<grid.columns() {
      let spec = grid.cell_spec(row, column)
      let cell = self.subplot_rect(spec)
      let state = @ref.new({
        artists: [],
        x_axis: @axis.axis(),
        y_axis: @axis.axis(),
        title: None,
        explicit_bounds: None,
        legend: [],
        auto_legend: [],
        explicit_legend: false,
        containers: [],
        rect: Some(cell),
        position_override: None,
        active_position: None,
        subplot_spec: Some(spec),
        share_x_group: share_group_for_cell(grid.share_x_mode(), row, column),
        share_y_group: share_group_for_cell(grid.share_y_mode(), row, column),
        share_x_order: 0,
        share_y_order: 0,
        show_x_tick_labels: match grid.share_x_mode() {
          @gridspec.ShareMode::All | @gridspec.ShareMode::Column =>
            row == grid.rows() - 1
          @gridspec.ShareMode::None | @gridspec.ShareMode::Row => true
        },
        show_y_tick_labels: match grid.share_y_mode() {
          @gridspec.ShareMode::All | @gridspec.ShareMode::Row => column == 0
          @gridspec.ShareMode::None | @gridspec.ShareMode::Column => true
        },
        frame_visible: true,
        spines: default_spines(),
        x_margin: @config.x_margin(),
        y_margin: @config.y_margin(),
        color_cycle: default_color_cycle(),
        color_cycle_index: 0,
        data_aspect: None,
        anchor: Anchor::Named("C"),
        adjustable: "box",
        box_aspect: None,
        secondary_x: [],
        secondary_y: [],
      })
      self.axes.push(state)
      self.axes_selection.push(state)
      result.push({ figure: self, state, })
    }
  }
  initialize_shared_axis_order(result)
  result
}

///|
// Grouper registers the second subplot before its first shared partner.
// Retain these initial ranks after removals instead of reordering survivors.
fn initialize_shared_axis_order(axes : Array[Axes]) -> Unit {
  for horizontal in [true, false] {
    for axis in axes {
      let states = if horizontal {
        axis.x_group_states()
      } else {
        axis.y_group_states()
      }
      for index, state in states {
        let rank = if states.length() > 1 && index < 2 {
          1 - index
        } else {
          index
        }
        if horizontal {
          state.val.share_x_order = rank
        } else {
          state.val.share_y_order = rank
        }
      }
    }
  }
}

///|
/// Create axes panels arranged in row-major order.
///
/// The boolean sharing arguments preserve the original convenience API and
/// correspond to the `All` or `None` GridSpec modes. Use
/// `subplots_with_grid` for row- or column-level sharing.
pub fn Figure::subplots(
  self : Figure,
  rows : Int32,
  columns : Int32,
  hspace? : Double,
  vspace? : Double,
  share_x~ : Bool = false,
  share_y~ : Bool = false,
  width_ratios~ : Array[Double] = [],
  height_ratios~ : Array[Double] = [],
) -> Array[Axes] raise @gridspec.LayoutError {
  let grid = self.grid_spec(
    rows,
    columns,
    hspace?,
    vspace?,
    width_ratios~,
    height_ratios~,
  )
  let configured = grid.with_shared_axes(
    if share_x {
      @gridspec.ShareMode::All
    } else {
      @gridspec.ShareMode::None
    },
    if share_y {
      @gridspec.ShareMode::All
    } else {
      @gridspec.ShareMode::None
    },
  )
  self.subplots_with_grid(configured)
}

///|
/// Show or hide x tick labels on this panel without changing shared ticks.
pub fn Axes::set_x_tick_labels_visible(self : Axes, visible : Bool) -> Unit {
  self.state.val.show_x_tick_labels = visible
}

///|
/// Show or hide y tick labels on this panel without changing shared ticks.
pub fn Axes::set_y_tick_labels_visible(self : Axes, visible : Bool) -> Unit {
  self.state.val.show_y_tick_labels = visible
}

///|
/// Return whether this handle still belongs to its figure's axes list.
/// Replacing a figure's subplot grid detaches its previous handles.
/// Removing a panel also detaches all handles that refer to it.
///
/// ```mbt check
/// test {
///   let fig = @scene.figure()
///   let old = fig.axes()
///   assert_true(old.is_attached())
///   let panels = try! fig.subplots(1, 2)
///   assert_true(!old.is_attached())
///   assert_true(panels[0].is_attached())
/// }
/// ```
pub fn Axes::is_attached(self : Axes) -> Bool {
  for state in self.figure.axes {
    if physical_equal(state, self.state) {
      return true
    }
  }
  false
}

///|
fn Axes::x_group_states(self : Axes) -> Array[@ref.Ref[AxesData]] {
  if !self.is_attached() {
    return [self.state]
  }
  let result = Array(capacity=self.figure.axes.length())
  match self.state.val.share_x_group {
    Some(group) =>
      for state in self.figure.axes {
        if state.val.share_x_group == Some(group) {
          result.push(state)
        }
      }
    None => result.push(self.state)
  }
  result
}

///|
fn Axes::y_group_states(self : Axes) -> Array[@ref.Ref[AxesData]] {
  if !self.is_attached() {
    return [self.state]
  }
  let result = Array(capacity=self.figure.axes.length())
  match self.state.val.share_y_group {
    Some(group) =>
      for state in self.figure.axes {
        if state.val.share_y_group == Some(group) {
          result.push(state)
        }
      }
    None => result.push(self.state)
  }
  result
}
