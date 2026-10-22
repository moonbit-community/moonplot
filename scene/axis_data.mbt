///|
fn Axes::bind_axis_data(self : Axes, horizontal : Bool) -> Unit {
  let state = self.state
  let provider = fn() {
    let current = state.val
    let artists = current.artists.map(to_render_artist)
    let values = @svg.artist_data_interval(artists, horizontal)
    (values.lower(), values.upper())
  }
  let axis = if horizontal { state.val.x_axis } else { state.val.y_axis }
  axis.bind_data_interval(provider)
  let figure = self.figure
  axis.bind_minpos(() => {
    @svg.artist_minpos(state.val.artists.map(to_render_artist), horizontal)
  })
  axis.bind_shared_minpos(() => {
    let group = if horizontal {
      state.val.share_x_group
    } else {
      state.val.share_y_group
    }
    let attached = figure.axes.any(candidate => physical_equal(candidate, state))
    if !attached || group is None {
      return [axis.get_minpos()]
    }
    let siblings = figure.axes.filter(candidate => {
      (if horizontal {
        candidate.val.share_x_group
      } else {
        candidate.val.share_y_group
      }) ==
      group
    })
    siblings.sort_by((left, right) => {
      let first = if horizontal {
        left.val.share_x_order
      } else {
        left.val.share_y_order
      }
      let second = if horizontal {
        right.val.share_x_order
      } else {
        right.val.share_y_order
      }
      first.compare(second)
    })
    siblings.map(candidate => {
      let sibling_axis = if horizontal {
        candidate.val.x_axis
      } else {
        candidate.val.y_axis
      }
      sibling_axis.get_minpos()
    })
  })
  axis.bind_tick_geometry(
    fn() {
      let axes : Axes = { figure, state, }
      let rect = state.val.active_position.unwrap_or_else(fn() {
        axes.original_position_rect()
      })
      if horizontal {
        rect.width()
      } else {
        rect.height()
      }
    },
    horizontal,
  )
  axis.bind_view_interval(fn() raise @core.DataError {
    for index, candidate in figure.axes {
      if physical_equal(candidate, state) {
        if @svg.panel_view(figure.to_render_figure(), index) is Some((_, x, y)) {
          let limits = if horizontal { x } else { y }
          return (limits.lower(), limits.upper())
        }
      }
    }
    if @svg.panel_view(
        figure.to_render_figure(extra=state),
        figure.axes.length(),
      )
      is Some((_, x, y)) {
      let limits = if horizontal { x } else { y }
      return (limits.lower(), limits.upper())
    }
    let limits = axis.current_view_limits().unwrap_or(@core.limits(0.0, 1.0))
    (limits.lower(), limits.upper())
  })
}
