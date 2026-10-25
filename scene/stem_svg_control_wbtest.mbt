///|
test "stem preserves exact SVG documents captured before semantic interaction" {
  let documents = []
  for orientation in ["vertical", "horizontal"] {
    for bottom in [0.0, 1.0] {
      for heads in [[4.0, -1.0, 6.0], [4.0, 0.0 / 0.0, 6.0]] {
        let fig = figure(width=400, height=200)
        let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
        ax.set_x_limits(-2.0, 8.0)
        ax.set_y_limits(-2.0, 8.0)
        ax.state.val.frame_visible = false
        ax.legend([])
        ax.stem(
          heads,
          locs=[1.0, 3.0, 6.0],
          bottom~,
          orientation~,
          color="#123456",
        )
        documents.push(fig.to_svg_checked())
      }
    }
    let fig = figure(width=400, height=200)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(-2.0, 8.0)
    ax.set_y_limits(-2.0, 8.0)
    ax.state.val.frame_visible = false
    ax.legend([])
    ax.stem([], orientation~, color="#123456")
    documents.push(fig.to_svg_checked())
  }
  inspect(
    documents.join("\n"),
    content=(
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,160 120,80"/><polyline fill="none" stroke="#123456" stroke-width="2" points="200,160 200,180"/><polyline fill="none" stroke="#123456" stroke-width="2" points="320,160 320,40"/><line x1="0" y1="160" x2="400" y2="160" stroke="#123456" stroke-width="2"/><circle cx="120" cy="80" r="3.5" fill="#123456"/><circle cx="200" cy="180" r="3.5" fill="#123456"/><circle cx="320" cy="40" r="3.5" fill="#123456"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,160 120,80"/><polyline fill="none" stroke="#123456" stroke-width="2" points="200,160"/><polyline fill="none" stroke="#123456" stroke-width="2" points="320,160 320,40"/><line x1="0" y1="160" x2="400" y2="160" stroke="#123456" stroke-width="2"/><circle cx="120" cy="80" r="3.5" fill="#123456"/><circle cx="320" cy="40" r="3.5" fill="#123456"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,140 120,80"/><polyline fill="none" stroke="#123456" stroke-width="2" points="200,140 200,180"/><polyline fill="none" stroke="#123456" stroke-width="2" points="320,140 320,40"/><line x1="0" y1="140" x2="400" y2="140" stroke="#123456" stroke-width="2"/><circle cx="120" cy="80" r="3.5" fill="#123456"/><circle cx="200" cy="180" r="3.5" fill="#123456"/><circle cx="320" cy="40" r="3.5" fill="#123456"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,140 120,80"/><polyline fill="none" stroke="#123456" stroke-width="2" points="200,140"/><polyline fill="none" stroke="#123456" stroke-width="2" points="320,140 320,40"/><line x1="0" y1="140" x2="400" y2="140" stroke="#123456" stroke-width="2"/><circle cx="120" cy="80" r="3.5" fill="#123456"/><circle cx="320" cy="40" r="3.5" fill="#123456"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><line x1="0" y1="160" x2="400" y2="160" stroke="#123456" stroke-width="2"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="80,140 240,140"/><polyline fill="none" stroke="#123456" stroke-width="2" points="80,100 40,100"/><polyline fill="none" stroke="#123456" stroke-width="2" points="80,40 320,40"/><line x1="80" y1="0" x2="80" y2="200" stroke="#123456" stroke-width="2"/><circle cx="240" cy="140" r="3.5" fill="#123456"/><circle cx="40" cy="100" r="3.5" fill="#123456"/><circle cx="320" cy="40" r="3.5" fill="#123456"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="80,140 240,140"/><polyline fill="none" stroke="#123456" stroke-width="2" points="80,100"/><polyline fill="none" stroke="#123456" stroke-width="2" points="80,40 320,40"/><line x1="80" y1="0" x2="80" y2="200" stroke="#123456" stroke-width="2"/><circle cx="240" cy="140" r="3.5" fill="#123456"/><circle cx="320" cy="40" r="3.5" fill="#123456"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,140 240,140"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,100 40,100"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,40 320,40"/><line x1="120" y1="0" x2="120" y2="200" stroke="#123456" stroke-width="2"/><circle cx="240" cy="140" r="3.5" fill="#123456"/><circle cx="40" cy="100" r="3.5" fill="#123456"/><circle cx="320" cy="40" r="3.5" fill="#123456"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,140 240,140"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,100"/><polyline fill="none" stroke="#123456" stroke-width="2" points="120,40 320,40"/><line x1="120" y1="0" x2="120" y2="200" stroke="#123456" stroke-width="2"/><circle cx="240" cy="140" r="3.5" fill="#123456"/><circle cx="320" cy="40" r="3.5" fill="#123456"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><line x1="80" y1="0" x2="80" y2="200" stroke="#123456" stroke-width="2"/></svg>
    ),
  )
}
