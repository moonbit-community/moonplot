///|
fn verify_polar_bars_consumer() -> Unit raise {
  let pi = 3.141592653589793
  let figure = @plot.figure(width=400, height=240)
  let polar = figure.add_polar_axes(0.12, 0.18, 0.76, 0.64)
  polar.set_title("Rose sectors")
  polar.legend([])
  polar.set_radius_max(1.0)
  let theta = [0.0, pi / 2.0, pi, 3.0 * pi / 2.0, 7.0 * pi]
  let radius = [1.0, 0.75, 0.5, 2.0, 0.0]
  polar.bar(theta, radius, width=pi / 4.0, label="Original petals")
  let frame = figure.to_drawing()
  assert_eq(frame.svg(), figure.to_svg_checked())
  assert_eq(frame.targets().length(), 4)
  guard frame.polar_circle(0) is Some((cx, cy, disk_radius)) else {
    fail("A public polar bar frame must preserve its actual circle")
  }
  assert_true((disk_radius - 43.8).abs() < 1.0e-10)
  for mode in [@plot.HitMode::Nearest, XNearest] {
    for i in 0..<4 {
      let target = frame.targets()[i]
      let info = target.info
      assert_eq(info.kind, @plot.HitKind::PolarBar)
      assert_eq(info.point.point_index, i)
      assert_eq(info.point.artist_index, 0)
      assert_eq(info.point.panel_index, 0)
      assert_eq(info.point.data_x, theta[i])
      assert_eq(info.point.data_y, radius[i])
      assert_eq(info.value, radius[i])
      assert_eq(info.series, "Original petals")
      assert_eq(info.interval, None)
      assert_eq(info.fraction, None)
      let visible_radius = disk_radius * radius[i].min(1.0)
      // Query a face interior well away from both the origin and its outer edge.
      let (x, y) = match i {
        0 => (cx + visible_radius * 0.7, cy)
        1 => (cx, cy - visible_radius * 0.7)
        2 => (cx - visible_radius * 0.7, cy)
        _ => (cx, cy + visible_radius * 0.7)
      }
      guard frame.hit_test(x, y, radius=0.0, mode~) is Some(hit) else {
        fail("Every painted sector must hit away from its tooltip anchor")
      }
      assert_eq(hit.point_index, i)
      assert_eq(frame.hit_info(hit), Some(info))
    }
    // A bounding-square corner and an unpainted angle must not become bars.
    assert_eq(
      frame.hit_test(
        cx + disk_radius * 0.9,
        cy + disk_radius * 0.9,
        radius=10000.0,
        mode~,
      ),
      None,
    )
    assert_eq(
      frame.hit_test(
        cx + disk_radius * 0.6,
        cy - disk_radius * 0.6,
        radius=10000.0,
        mode~,
      ),
      None,
    )
  }
  let before = frame.svg()
  let invalid_width = try? polar.bar([0.0], [1.0], width=0.0)
  assert_true(invalid_width is Err(_))
  let invalid_lengths = try? polar.bar([0.0], [], width=pi / 4.0)
  assert_true(invalid_lengths is Err(_))
  assert_eq(figure.to_svg_checked(), before)
  guard figure.axes_list()[0].artists()[0] is @plot.Artist::Bar(points, _) else {
    fail("Polar bars retain original points in the existing Bar artist")
  }
  assert_eq(points.length(), 5)
  theta[0] = 123.0
  radius[0] = 456.0
  assert_eq(figure.to_svg_checked(), before)
  let original = frame.targets()
  polar.clear()
  polar.bar([pi / 4.0], [0.6], width=pi / 12.0, label="After clear")
  let cleared = figure.to_drawing()
  assert_eq(cleared.targets().length(), 1)
  assert_eq(cleared.targets()[0].info.series, "After clear")
  assert_eq(cleared.targets()[0].info.point.point_index, 0)
  assert_eq(frame.targets(), original)
  // A true full-circle bar exposes the original clipped value at any angle.
  let full = @plot.figure(width=400, height=240)
  let disk = full.add_polar_axes(0.12, 0.18, 0.76, 0.64)
  disk.legend([])
  disk.set_radius_max(1.0)
  disk.set_theta_offset(pi / 2.0)
  disk.set_direction(@plot.PolarDirection::Clockwise)
  disk.bar([1.0e300], [2.0], width=2.0 * pi, label="Whole disk")
  let full_frame = full.to_drawing()
  assert_eq(full_frame.svg(), full.to_svg_checked())
  assert_eq(full_frame.targets().length(), 1)
  guard full_frame.polar_circle(0) is Some((x, y, r)) else {
    fail("The whole disk needs a real circle")
  }
  for mode in [@plot.HitMode::Nearest, XNearest] {
    for
      (px, py) in [
        (x + 0.8 * r, y),
        (x - 0.8 * r, y),
        (x, y - 0.8 * r),
        (x, y + 0.8 * r),
      ] {
      guard full_frame.hit_test(px, py, radius=0.0, mode~) is Some(hit) else {
        fail("The full-circle bar must fill all four directions")
      }
      assert_eq(hit.data_x, 1.0e300)
      assert_eq(hit.data_y, 2.0)
      assert_eq(full_frame.hit_info(hit).unwrap().value, 2.0)
    }
    assert_eq(
      full_frame.hit_test(x + r * 1.001, y, radius=10000.0, mode~),
      None,
    )
  }
}
