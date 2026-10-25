///|
// Eight original public fixtures from the read-only c9-compatible baseline.
fn barbs_control_figure(case : Int32) -> Figure raise {
  let f = figure(width=400, height=240)
  let a = f.add_axes(0.0, 0.0, 1.0, 1.0)
  a.legend([])
  a.set_x_limits(0.0, 8.0)
  a.set_y_limits(0.0, 6.0)
  if case == 0 {
    a.barbs(
      [1.0, 3.0, 5.0],
      [1.0, 2.0, 3.0],
      [2.0, 0.0, -1.0],
      [1.0, 0.0, 1.0],
      color="#1248AB",
      barb_length=0.75,
      linewidth=1.5,
      label="basic",
    )
  } else if case == 1 {
    a.set_x_limits(-10.0, 70.0)
    a.set_y_limits(-5.0, 10.0)
    a.barbs_with_options(
      [0.0, 2.0, 4.0],
      [0.0, 1.0, 3.0],
      [55.0, 25.0, 0.0],
      [0.0, 0.0, 0.0],
      color="#1248AB",
      barb_length=5.0,
      label="advanced",
    )
  } else if case == 2 {
    a.set_x_limits(0.0, 20.0)
    a.set_y_limits(0.0, 20.0)
    a.barbs_with_options(
      [10.0],
      [10.0],
      [-12.0],
      [-5.0],
      color="#1248AB",
      barb_length=1.5,
      pivot="middle",
      flip=true,
      fill_empty=false,
    )
  } else if case == 3 {
    a.barbs_with_options(
      [1.0, 4.0],
      [1.0, 3.0],
      [1.0, 0.0],
      [0.0, 0.0],
      color="#1248AB",
      linewidth=0.0,
      barb_length=2.0,
    )
  } else if case == 4 {
    a.set_x_scale(@scale.log_scale())
    a.set_x_limits(1.0, 5.0)
    a.set_y_limits(0.0, 4.0)
    a.barbs([0.0], [1.0], [4.0], [0.0], color="#1248AB")
  } else if case == 5 {
    a.set_x_limits(0.0, 4.0)
    a.set_y_limits(0.0, 4.0)
    a.barbs([-2.0], [1.0], [10.0], [0.0], color="#1248AB")
  } else if case == 6 {
    a.set_x_scale(@scale.symlog_scale())
    a.set_y_scale(@scale.symlog_scale())
    a.set_x_limits(-1.0e308, 1.0e308)
    a.set_y_limits(-1.0e308, 1.0e308)
    for axis in [a.x_axis(), a.y_axis()] {
      axis.set_locator(@ticker.NullLocator::new().as_locator())
      axis.set_minor_locator(@ticker.NullLocator::new().as_minor_locator())
    }
    a.barbs([-8.0e307], [-8.0e307], [1.7e308], [1.7e308], color="#1248AB")
  } else {
    a.barbs(
      [1.0, 3.0],
      [1.0, 2.0],
      [1.0e-200, 0.0],
      [0.0, 0.0],
      color="#1248AB",
    )
  }
  f
}

///|
#cfg(target="native")
test "barbs retain eight exact pre-interaction Native SVG documents" {
  let documents = []
  for case in 0..<8 {
    documents.push(barbs_control_figure(case).to_svg_checked())
  }
  inspect(
    documents.join("\n"),
    content=(
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="240" viewBox="0 0 400 240"><rect width="100%" height="100%" fill="white"/><text x="0" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">0</text><text x="50" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">1</text><text x="100" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">2</text><text x="150" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">3</text><text x="200" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">4</text><text x="250" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">5</text><text x="300" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">6</text><text x="350" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">7</text><text x="400" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">8</text><text x="-8" y="243" text-anchor="end" font-family="sans-serif" font-size="10">0</text><text x="-8" y="203" text-anchor="end" font-family="sans-serif" font-size="10">1</text><text x="-8" y="163" text-anchor="end" font-family="sans-serif" font-size="10">2</text><text x="-8" y="123" text-anchor="end" font-family="sans-serif" font-size="10">3</text><text x="-8" y="83" text-anchor="end" font-family="sans-serif" font-size="10">4</text><text x="-8" y="43" text-anchor="end" font-family="sans-serif" font-size="10">5</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">6</text><line x1="0" y1="240" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="240" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="240" x2="400" y2="240" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><polyline fill="none" stroke="#1248AB" stroke-width="1.5" points="50,200 150,160"/><polyline fill="none" stroke="#1248AB" stroke-width="1.5" points="125,170 108.22949016875158,143.1671842700025"/><polyline fill="none" stroke="#1248AB" stroke-width="1.5" points="100,180 116.77050983124842,206.83281572999746"/><polyline fill="none" stroke="#1248AB" stroke-width="1.5" points="75,190 58.229490168751575,163.16718427000254"/><polyline fill="none" stroke="#1248AB" stroke-width="1.5" points="250,120 200,80"/><polyline fill="none" stroke="#1248AB" stroke-width="1.5" points="212.5,90 195,104"/><polyline fill="none" stroke="#1248AB" stroke-width="1.5" points="225,100 242.49999999999997,86"/><polyline fill="none" stroke="#1248AB" stroke-width="1.5" points="237.5,110 220.00000000000003,124.00000000000001"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="240" viewBox="0 0 400 240"><rect width="100%" height="100%" fill="white"/><text x="0" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">−10</text><text x="50" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">0</text><text x="100" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">10</text><text x="150" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">20</text><text x="200" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">30</text><text x="250" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">40</text><text x="300" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">50</text><text x="350" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">60</text><text x="400" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">70</text><text x="-8" y="227" text-anchor="end" font-family="sans-serif" font-size="10">−4</text><text x="-8" y="195" text-anchor="end" font-family="sans-serif" font-size="10">−2</text><text x="-8" y="163" text-anchor="end" font-family="sans-serif" font-size="10">0</text><text x="-8" y="131" text-anchor="end" font-family="sans-serif" font-size="10">2</text><text x="-8" y="99" text-anchor="end" font-family="sans-serif" font-size="10">4</text><text x="-8" y="67" text-anchor="end" font-family="sans-serif" font-size="10">6</text><text x="-8" y="35" text-anchor="end" font-family="sans-serif" font-size="10">8</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">10</text><line x1="0" y1="240" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="240" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="240" x2="400" y2="240" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="50,160 325,160"/><polygon points="322.5,160 300,160 322.5,80" fill="#1248AB" stroke="#1248AB" stroke-width="1"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="302.5,160 302.5,120"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="60,144 185,144"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="185,144 185,64"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="162.5,144 162.5,64"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="140,144 140,104"/><circle cx="70" cy="112" r="1.5" fill="#1248AB"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="240" viewBox="0 0 400 240"><rect width="100%" height="100%" fill="white"/><text x="0" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">0.0</text><text x="50" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">2.5</text><text x="100" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">5.0</text><text x="150" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">7.5</text><text x="200" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">10.0</text><text x="250" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">12.5</text><text x="300" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">15.0</text><text x="350" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">17.5</text><text x="400" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">20.0</text><text x="-8" y="243" text-anchor="end" font-family="sans-serif" font-size="10">0.0</text><text x="-8" y="213" text-anchor="end" font-family="sans-serif" font-size="10">2.5</text><text x="-8" y="183" text-anchor="end" font-family="sans-serif" font-size="10">5.0</text><text x="-8" y="153" text-anchor="end" font-family="sans-serif" font-size="10">7.5</text><text x="-8" y="123" text-anchor="end" font-family="sans-serif" font-size="10">10.0</text><text x="-8" y="93" text-anchor="end" font-family="sans-serif" font-size="10">12.5</text><text x="-8" y="63" text-anchor="end" font-family="sans-serif" font-size="10">15.0</text><text x="-8" y="33" text-anchor="end" font-family="sans-serif" font-size="10">17.5</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">20.0</text><line x1="0" y1="240" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="240" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="240" x2="400" y2="240" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="320,90 80,150"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="80,150 68.46153846153847,133.3846153846154"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="104.92307692307692,143.76923076923077 99.15384615384616,135.46153846153845"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="240" viewBox="0 0 400 240"><rect width="100%" height="100%" fill="white"/><text x="0" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">0</text><text x="50" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">1</text><text x="100" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">2</text><text x="150" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">3</text><text x="200" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">4</text><text x="250" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">5</text><text x="300" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">6</text><text x="350" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">7</text><text x="400" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">8</text><text x="-8" y="243" text-anchor="end" font-family="sans-serif" font-size="10">0</text><text x="-8" y="203" text-anchor="end" font-family="sans-serif" font-size="10">1</text><text x="-8" y="163" text-anchor="end" font-family="sans-serif" font-size="10">2</text><text x="-8" y="123" text-anchor="end" font-family="sans-serif" font-size="10">3</text><text x="-8" y="83" text-anchor="end" font-family="sans-serif" font-size="10">4</text><text x="-8" y="43" text-anchor="end" font-family="sans-serif" font-size="10">5</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">6</text><line x1="0" y1="240" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="240" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="240" x2="400" y2="240" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><circle cx="100" cy="200" r="0.6" fill="#1248AB"/><circle cx="200" cy="120" r="0.6" fill="#1248AB"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="240" viewBox="0 0 400 240"><rect width="100%" height="100%" fill="white"/><text x="172.2706232293572" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">$\mathdefault{2\times10^{0}}$</text><text x="273.0424777943941" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">$\mathdefault{3\times10^{0}}$</text><text x="344.5412464587144" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">$\mathdefault{4\times10^{0}}$</text><text x="0" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">$\mathdefault{10^{0}}$</text><text x="-8" y="243" text-anchor="end" font-family="sans-serif" font-size="10">0.0</text><text x="-8" y="213" text-anchor="end" font-family="sans-serif" font-size="10">0.5</text><text x="-8" y="183" text-anchor="end" font-family="sans-serif" font-size="10">1.0</text><text x="-8" y="153" text-anchor="end" font-family="sans-serif" font-size="10">1.5</text><text x="-8" y="123" text-anchor="end" font-family="sans-serif" font-size="10">2.0</text><text x="-8" y="93" text-anchor="end" font-family="sans-serif" font-size="10">2.5</text><text x="-8" y="63" text-anchor="end" font-family="sans-serif" font-size="10">3.0</text><text x="-8" y="33" text-anchor="end" font-family="sans-serif" font-size="10">3.5</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">4.0</text><line x1="0" y1="240" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="240" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="240" x2="400" y2="240" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="344.5412464587144,180"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="273.0424777943941,180 273.0424777943941,165"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="172.2706232293572,180 172.2706232293572,195"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="0,180 0,165"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="240" viewBox="0 0 400 240"><rect width="100%" height="100%" fill="white"/><text x="0" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">0.0</text><text x="50" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">0.5</text><text x="100" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">1.0</text><text x="150" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">1.5</text><text x="200" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">2.0</text><text x="250" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">2.5</text><text x="300" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">3.0</text><text x="350" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">3.5</text><text x="400" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">4.0</text><text x="-8" y="243" text-anchor="end" font-family="sans-serif" font-size="10">0.0</text><text x="-8" y="213" text-anchor="end" font-family="sans-serif" font-size="10">0.5</text><text x="-8" y="183" text-anchor="end" font-family="sans-serif" font-size="10">1.0</text><text x="-8" y="153" text-anchor="end" font-family="sans-serif" font-size="10">1.5</text><text x="-8" y="123" text-anchor="end" font-family="sans-serif" font-size="10">2.0</text><text x="-8" y="93" text-anchor="end" font-family="sans-serif" font-size="10">2.5</text><text x="-8" y="63" text-anchor="end" font-family="sans-serif" font-size="10">3.0</text><text x="-8" y="33" text-anchor="end" font-family="sans-serif" font-size="10">3.5</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">4.0</text><line x1="0" y1="240" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="240" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="240" x2="400" y2="240" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="-200,180 800,180"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="550,180 550,165"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="300,180 300,195"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="50,180 50,165"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="240" viewBox="0 0 400 240"><rect width="100%" height="100%" fill="white"/><line x1="0" y1="240" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="240" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="240" x2="400" y2="240" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><polyline fill="none" stroke="#1248AB" stroke-width="1" points="0.06270238081040705,239.9623785715138 399.9703941470133,0.017763511792066422"/></svg>
      #|<svg xmlns="http://www.w3.org/2000/svg" width="400" height="240" viewBox="0 0 400 240"><rect width="100%" height="100%" fill="white"/><text x="0" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">0</text><text x="50" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">1</text><text x="100" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">2</text><text x="150" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">3</text><text x="200" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">4</text><text x="250" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">5</text><text x="300" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">6</text><text x="350" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">7</text><text x="400" y="258" text-anchor="middle" font-family="sans-serif" font-size="10">8</text><text x="-8" y="243" text-anchor="end" font-family="sans-serif" font-size="10">0</text><text x="-8" y="203" text-anchor="end" font-family="sans-serif" font-size="10">1</text><text x="-8" y="163" text-anchor="end" font-family="sans-serif" font-size="10">2</text><text x="-8" y="123" text-anchor="end" font-family="sans-serif" font-size="10">3</text><text x="-8" y="83" text-anchor="end" font-family="sans-serif" font-size="10">4</text><text x="-8" y="43" text-anchor="end" font-family="sans-serif" font-size="10">5</text><text x="-8" y="3" text-anchor="end" font-family="sans-serif" font-size="10">6</text><line x1="0" y1="240" x2="0" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="400" y1="240" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="240" x2="400" y2="240" stroke="#374151" stroke-width="1.2"/><line x1="0" y1="0" x2="400" y2="0" stroke="#374151" stroke-width="1.2"/></svg>
    ),
  )
}
