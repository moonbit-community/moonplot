///|
test "tripcolor true face paint uses actual order and a masked original face passes through earlier Area" {
  for face_last in [false, true] {
    let fig = figure(width=400, height=300)
    let ax = fig.add_axes(0.0, 0.0, 1.0, 1.0)
    ax.set_x_limits(0.0, 2.0)
    ax.set_y_limits(0.0, 2.0)
    for pass in 0..<2 {
      if (pass == 1) == face_last {
        ax.tripcolor(
          [0.0, 2.0, 2.0, 0.0, 1.0],
          [0.0, 0.0, 2.0, 2.0, 1.0],
          [[0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4]],
          [10.0, 20.0, 30.0, 40.0],
          mask=[false, true, false, false],
          label="Faces",
        )
      } else {
        ax.fill_between([0.0, 2.0], [0.0, 0.0], [2.0, 2.0], label="Area")
      }
    }
    let frame = fig.to_drawing()
    for mode in [@drawing.HitMode::Nearest, XNearest] {
      let facepoint = frame.hit_test(200.0, 255.0, radius=0.0, mode~).unwrap()
      assert_eq(
        frame.hit_info(facepoint).unwrap().kind,
        if face_last {
          Tripcolor
        } else {
          Area
        },
      )
      let maskedpoint = frame.hit_test(340.0, 150.0, radius=0.0, mode~).unwrap()
      assert_eq(frame.hit_info(maskedpoint).unwrap().kind, Area)
    }
  }
}
