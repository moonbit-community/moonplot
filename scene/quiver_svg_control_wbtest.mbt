///|
// Frozen from the read-only M9 packet before new production semantics.
// Native packet20060, formal0.9 quiver builder/painter identical SHA.
fn quiver_control_figure(case : Int32) -> Figure raise {
  let f = figure(width=400, height=200)
  let a = f.add_axes(0.0, 0.0, 1.0, 1.0)
  a.legend([])
  if case < 2 {
    a.set_x_limits(
      if case == 0 {
        -4.0
      } else {
        6.0
      },
      if case == 0 {
        6.0
      } else {
        -4.0
      },
    )
    a.set_y_limits(
      if case == 0 {
        -3.0
      } else {
        7.0
      },
      if case == 0 {
        7.0
      } else {
        -3.0
      },
    )
    a.quiver(
      [-2.0, 1.0, 3.0, 4.0],
      [0.0, -1.0, 2.0, 3.0],
      [3.0, -2.0, 0.0, -1.0],
      [2.0, 1.0, 0.0, -2.0],
      color="#123456",
      label="vectors",
    )
  } else if case == 2 {
    a.set_x_scale(@scale.log_scale())
    a.set_y_scale(@scale.log_scale())
    a.set_x_limits(1.0, 100.0)
    a.set_y_limits(1.0, 100.0)
    a.quiver(
      [1.0, 10.0, 50.0],
      [1.0, 10.0, 10.0],
      [3.0, -11.0, 0.0],
      [8.0, 0.0, 0.0],
      color="#123456",
    )
  } else if case == 3 {
    a.set_x_limits(-1.0, 1.0)
    a.set_y_limits(-1.0, 1.0)
    a.quiver([-2.0], [0.0], [4.0], [0.0], color="#123456")
  } else if case == 4 {
    a.set_x_limits(0.0, 4.0)
    a.set_y_limits(0.0, 4.0)
    a.quiver([4.01], [2.0], [0.0], [0.5], color="#123456")
  } else {
    a.set_x_limits(-1.0, 2.0)
    a.set_y_limits(-1.0, 2.0)
    a.quiver(
      [1.0e308, 0.0],
      [0.0, 0.0],
      [1.0e308, 1.0],
      [0.0, 1.0],
      color="#123456",
    )
  }
  f
}

///|
test "quiver retains six exact pre-interaction SVG documents" {
  let documents = []
  for i in 0..<6 {
    documents.push(quiver_control_figure(i).to_svg_checked())
  }
  inspect(
    documents.join("\n"),
    content=(
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><text x="0" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−4</text><text x="80" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−2</text><text x="160" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0</text><text x="240" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">2</text><text x="320" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">4</text><text x="400" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">6</text><text x="-8" y="183" text-anchor="end" font-family="sans-serif" font-size="10">−2</text><text x="-8" y="143" text-anchor="end" font-family="sans-serif" font-size="10">0</text><text x="-8" y="103" text-anchor="end" font-family="sans-serif" font-size="10">2</text><text x="-8" y="63" text-anchor="end" font-family="sans-serif" font-size="10">4</text><text x="-8" y="23" text-anchor="end" font-family="sans-serif" font-size="10">6</text><line x1="0" y1="200" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="200" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="200" x2="400" y2="200" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="80" y1="140" x2="200" y2="100" stroke="#123456" stroke-width="1.5"/><line x1="200" y1="100" x2="195.49558707631746" y2="105.3581959849339" stroke="#123456" stroke-width="1.5"/><line x1="200" y1="100" x2="193.18155207009363" y2="98.4160909662624" stroke="#123456" stroke-width="1.5"/><line x1="200" y1="160" x2="120" y2="140" stroke="#123456" stroke-width="1.5"/><line x1="120" y1="140" x2="126.67688381523254" y2="137.89780530923375" stroke="#123456" stroke-width="1.5"/><line x1="120" y1="140" x2="124.90209998249165" y2="144.9969406401973" stroke="#123456" stroke-width="1.5"/><line x1="320" y1="80" x2="280" y2="120" stroke="#123456" stroke-width="1.5"/><line x1="280" y1="120" x2="281.6326113066174" y2="113.193049117152" stroke="#123456" stroke-width="1.5"/><line x1="280" y1="120" x2="286.806950882848" y2="118.36738869338264" stroke="#123456" stroke-width="1.5"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><text x="400" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−4</text><text x="320" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−2</text><text x="240" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0</text><text x="160" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">2</text><text x="80" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">4</text><text x="0" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">6</text><text x="-8" y="23" text-anchor="end" font-family="sans-serif" font-size="10">−2</text><text x="-8" y="63" text-anchor="end" font-family="sans-serif" font-size="10">0</text><text x="-8" y="103" text-anchor="end" font-family="sans-serif" font-size="10">2</text><text x="-8" y="143" text-anchor="end" font-family="sans-serif" font-size="10">4</text><text x="-8" y="183" text-anchor="end" font-family="sans-serif" font-size="10">6</text><line x1="0" y1="200" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="200" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="200" x2="400" y2="200" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="320" y1="60" x2="200" y2="100" stroke="#123456" stroke-width="1.5"/><line x1="200" y1="100" x2="204.50441292368254" y2="94.6418040150661" stroke="#123456" stroke-width="1.5"/><line x1="200" y1="100" x2="206.81844792990637" y2="101.5839090337376" stroke="#123456" stroke-width="1.5"/><line x1="200" y1="40" x2="280" y2="60" stroke="#123456" stroke-width="1.5"/><line x1="280" y1="60" x2="273.32311618476746" y2="62.102194690766254" stroke="#123456" stroke-width="1.5"/><line x1="280" y1="60" x2="275.0979000175084" y2="55.003059359802705" stroke="#123456" stroke-width="1.5"/><line x1="80" y1="120" x2="120" y2="80" stroke="#123456" stroke-width="1.5"/><line x1="120" y1="80" x2="118.36738869338264" y2="86.806950882848" stroke="#123456" stroke-width="1.5"/><line x1="120" y1="80" x2="113.193049117152" y2="81.63261130661736" stroke="#123456" stroke-width="1.5"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><text x="0" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">$\mathdefault{10^{0}}$</text><text x="200" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">$\mathdefault{10^{1}}$</text><text x="400" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">$\mathdefault{10^{2}}$</text><text x="-8" y="203" text-anchor="end" font-family="sans-serif" font-size="10">$\mathdefault{10^{0}}$</text><text x="-8" y="103" text-anchor="end" font-family="sans-serif" font-size="10">$\mathdefault{10^{1}}$</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">$\mathdefault{10^{2}}$</text><line x1="0" y1="200" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="200" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="200" x2="400" y2="200" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="200" x2="120.41199826559247" y2="104.57574905606752" stroke="#123456" stroke-width="1.5"/><line x1="120.41199826559247" y1="104.57574905606752" x2="118.00739505909186" y2="111.14978004316265" stroke="#123456" stroke-width="1.5"/><line x1="120.41199826559247" y1="104.57574905606752" x2="113.46245477658516" y2="105.41470393828477" stroke="#123456" stroke-width="1.5"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><text x="0" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−1.00</text><text x="50" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−0.75</text><text x="100" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−0.50</text><text x="150" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−0.25</text><text x="200" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0.00</text><text x="250" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0.25</text><text x="300" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0.50</text><text x="350" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0.75</text><text x="400" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">1.00</text><text x="-8" y="203" text-anchor="end" font-family="sans-serif" font-size="10">−1.00</text><text x="-8" y="178" text-anchor="end" font-family="sans-serif" font-size="10">−0.75</text><text x="-8" y="153" text-anchor="end" font-family="sans-serif" font-size="10">−0.50</text><text x="-8" y="128" text-anchor="end" font-family="sans-serif" font-size="10">−0.25</text><text x="-8" y="103" text-anchor="end" font-family="sans-serif" font-size="10">0.00</text><text x="-8" y="78" text-anchor="end" font-family="sans-serif" font-size="10">0.25</text><text x="-8" y="53" text-anchor="end" font-family="sans-serif" font-size="10">0.50</text><text x="-8" y="28" text-anchor="end" font-family="sans-serif" font-size="10">0.75</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">1.00</text><line x1="0" y1="200" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="200" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="200" x2="400" y2="200" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="-200" y1="100" x2="600" y2="100" stroke="#123456" stroke-width="1.5"/><line x1="600" y1="100" x2="594.0323283455834" y2="103.65881060251462" stroke="#123456" stroke-width="1.5"/><line x1="600" y1="100" x2="594.0323283455834" y2="96.34118939748538" stroke="#123456" stroke-width="1.5"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><text x="0" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0.0</text><text x="50" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0.5</text><text x="100" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">1.0</text><text x="150" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">1.5</text><text x="200" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">2.0</text><text x="250" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">2.5</text><text x="300" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">3.0</text><text x="350" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">3.5</text><text x="400" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">4.0</text><text x="-8" y="203" text-anchor="end" font-family="sans-serif" font-size="10">0.0</text><text x="-8" y="178" text-anchor="end" font-family="sans-serif" font-size="10">0.5</text><text x="-8" y="153" text-anchor="end" font-family="sans-serif" font-size="10">1.0</text><text x="-8" y="128" text-anchor="end" font-family="sans-serif" font-size="10">1.5</text><text x="-8" y="103" text-anchor="end" font-family="sans-serif" font-size="10">2.0</text><text x="-8" y="78" text-anchor="end" font-family="sans-serif" font-size="10">2.5</text><text x="-8" y="53" text-anchor="end" font-family="sans-serif" font-size="10">3.0</text><text x="-8" y="28" text-anchor="end" font-family="sans-serif" font-size="10">3.5</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">4.0</text><line x1="0" y1="200" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="200" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="200" x2="400" y2="200" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="401" y1="100" x2="401" y2="75" stroke="#123456" stroke-width="1.5"/><line x1="401" y1="75" x2="404.6588106025146" y2="80.96767165441653" stroke="#123456" stroke-width="1.5"/><line x1="401" y1="75" x2="397.3411893974854" y2="80.96767165441653" stroke="#123456" stroke-width="1.5"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200" viewBox="0 0 400 200"><rect width="100%" height="100%" fill="white"/><text x="0" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−1.0</text><text x="66.66666666666666" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">−0.5</text><text x="133.33333333333331" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0.0</text><text x="200" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">0.5</text><text x="266.66666666666663" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">1.0</text><text x="333.33333333333337" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">1.5</text><text x="400" y="218" text-anchor="middle" font-family="sans-serif" font-size="10">2.0</text><text x="-8" y="203" text-anchor="end" font-family="sans-serif" font-size="10">−1.0</text><text x="-8" y="169.66666666666669" text-anchor="end" font-family="sans-serif" font-size="10">−0.5</text><text x="-8" y="136.33333333333331" text-anchor="end" font-family="sans-serif" font-size="10">0.0</text><text x="-8" y="103" text-anchor="end" font-family="sans-serif" font-size="10">0.5</text><text x="-8" y="69.66666666666666" text-anchor="end" font-family="sans-serif" font-size="10">1.0</text><text x="-8" y="36.33333333333333" text-anchor="end" font-family="sans-serif" font-size="10">1.5</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">2.0</text><line x1="0" y1="200" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="200" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="200" x2="400" y2="200" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="133.33333333333331" y1="133.33333333333331" x2="266.66666666666663" y2="66.66666666666666" stroke="#123456" stroke-width="1.5"/><line x1="266.66666666666663" y1="66.66666666666666" x2="262.96528871680096" y2="72.60803025360931" stroke="#123456" stroke-width="1.5"/><line x1="266.66666666666663" y1="66.66666666666666" x2="259.6927490271931" y2="66.06295087439361" stroke="#123456" stroke-width="1.5"/></svg>
    ),
  )
}
