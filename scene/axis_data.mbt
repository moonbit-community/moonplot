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
}
