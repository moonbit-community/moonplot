///|
fn discrete_control_axes() -> (Figure, Axes) raise {
  let fig = figure(width=400, height=200)
  let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
  ax.set_x_limits(-1.0, 6.0)
  ax.set_y_limits(-1.0, 6.0)
  ax.state.val.frame_visible = false
  ax.legend([])
  (fig, ax)
}

///|
test "discrete plots retain exact pre-interaction SVG documents" {
  let docs : Array[String] = []
  for mode in ["pre", "post", "mid"] {
    for values in [[1.0, 3.0, 2.0], [1.0, 0.0 / 0.0, 2.0]] {
      let (fig, ax) = discrete_control_axes()
      ax.step([0.0, 2.0, 5.0], values, where_=mode, color="#123456")
      docs.push(fig.to_svg_checked())
    }
  }
  for orientation in ["vertical", "horizontal"] {
    for fill in [false, true] {
      let (fig, ax) = discrete_control_axes()
      ax.stairs(
        [1.0, -0.5, 3.0],
        edges=[0.0, 1.0, 3.0, 5.0],
        orientation~,
        baseline=0.5,
        fill~,
        color="#abcdef",
      )
      docs.push(fig.to_svg_checked())
    }
  }
  for horizontal in [false, true] {
    for complementary in [false, true] {
      let (fig, ax) = discrete_control_axes()
      ignore(
        ax.ecdf(
          [3.0, 1.0, 1.0, 2.0],
          weights=[1.0, 2.0, 1.0, 1.0],
          horizontal~,
          complementary~,
          compress=true,
          color="#fedcba",
        ),
      )
      docs.push(fig.to_svg_checked())
    }
  }
  inspect(
    docs.join("\n"),
    content=(
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="57.14285714285714,142.85714285714286 57.14285714285714,85.71428571428571 171.42857142857142,85.71428571428571 171.42857142857142,114.28571428571428 342.85714285714283,114.28571428571428"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="57.14285714285714,142.85714285714286"/><polyline fill="none" stroke="#123456" stroke-width="2" points="171.42857142857142,114.28571428571428 342.85714285714283,114.28571428571428"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="57.14285714285714,142.85714285714286 171.42857142857142,142.85714285714286 171.42857142857142,85.71428571428571 342.85714285714283,85.71428571428571 342.85714285714283,114.28571428571428"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="57.14285714285714,142.85714285714286 171.42857142857142,142.85714285714286"/><polyline fill="none" stroke="#123456" stroke-width="2" points="342.85714285714283,114.28571428571428"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="57.14285714285714,142.85714285714286 114.28571428571428,142.85714285714286 114.28571428571428,85.71428571428571 257.14285714285717,85.71428571428571 257.14285714285717,114.28571428571428 342.85714285714283,114.28571428571428"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="57.14285714285714,142.85714285714286 114.28571428571428,142.85714285714286"/><polyline fill="none" stroke="#123456" stroke-width="2" points="257.14285714285717,114.28571428571428 342.85714285714283,114.28571428571428"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#abcdef" stroke-width="2" points="57.14285714285714,142.85714285714286 114.28571428571428,142.85714285714286 114.28571428571428,185.71428571428572 228.57142857142856,185.71428571428572 228.57142857142856,85.71428571428571 342.85714285714283,85.71428571428571"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polygon points="57.14285714285714,157.14285714285714 57.14285714285714,142.85714285714286 114.28571428571428,142.85714285714286 114.28571428571428,185.71428571428572 228.57142857142856,185.71428571428572 228.57142857142856,85.71428571428571 342.85714285714283,85.71428571428571 342.85714285714283,157.14285714285714" fill="#abcdef" stroke="#abcdef" stroke-width="0"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#abcdef" stroke-width="2" points="114.28571428571428,171.42857142857142 114.28571428571428,142.85714285714286 28.57142857142857,142.85714285714286 28.57142857142857,85.71428571428571 228.57142857142856,85.71428571428571 228.57142857142856,28.57142857142857"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polygon points="85.71428571428571,171.42857142857142 114.28571428571428,171.42857142857142 114.28571428571428,142.85714285714286 28.57142857142857,142.85714285714286 28.57142857142857,85.71428571428571 228.57142857142856,85.71428571428571 228.57142857142856,28.57142857142857 85.71428571428571,28.57142857142857" fill="#abcdef" stroke="#abcdef" stroke-width="0"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#fedcba" stroke-width="2" points="114.28571428571428,171.42857142857142 114.28571428571428,154.2857142857143 171.42857142857142,154.2857142857143 171.42857142857142,148.57142857142858 228.57142857142856,148.57142857142858 228.57142857142856,142.85714285714286"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#fedcba" stroke-width="2" points="114.28571428571428,142.85714285714286 114.28571428571428,160 171.42857142857142,160 171.42857142857142,165.7142857142857 228.57142857142856,165.7142857142857 228.57142857142856,171.42857142857142"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#fedcba" stroke-width="2" points="57.14285714285714,142.85714285714286 91.42857142857143,142.85714285714286 91.42857142857143,114.28571428571428 102.85714285714288,114.28571428571428 102.85714285714288,85.71428571428571 114.28571428571428,85.71428571428571"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#fedcba" stroke-width="2" points="114.28571428571428,142.85714285714286 80,142.85714285714286 80,114.28571428571428 68.57142857142857,114.28571428571428 68.57142857142857,85.71428571428571 57.14285714285714,85.71428571428571"/></svg>
    ),
  )
}
