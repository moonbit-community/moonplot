///|
fn valid_point(point : HitPoint) -> Bool {
  finite(point.screen_x) &&
  finite(point.screen_y) &&
  finite(point.data_x) &&
  finite(point.data_y)
}

///|
fn valid_info(info : HitInfo) -> Bool {
  valid_point(info.point) &&
  finite(info.value) &&
  (match info.interval {
    Some((start, end)) => finite(start) && finite(end)
    None => true
  }) &&
  (match info.fraction {
    Some(value) => finite(value)
    None => true
  }) &&
  (match info.cell {
    Some(cell) =>
      cell.row >= 0 &&
      cell.column >= 0 &&
      finite(cell.x_range.0) &&
      finite(cell.x_range.1) &&
      finite(cell.y_range.0) &&
      finite(cell.y_range.1) &&
      cell.x_range.0 != cell.x_range.1 &&
      cell.y_range.0 != cell.y_range.1
    None => true
  })
}

///|
fn valid_rect(rect : (Double, Double, Double, Double)) -> Bool {
  let (left, top, width, height) = rect
  finite(left) &&
  finite(top) &&
  finite(width) &&
  finite(height) &&
  width > 0.0 &&
  height > 0.0 &&
  finite(left + width) &&
  finite(top + height)
}

///|
fn rect_contains(
  rect : (Double, Double, Double, Double),
  x : Double,
  y : Double,
) -> Bool {
  let (left, top, width, height) = rect
  valid_rect(rect) &&
  x >= left &&
  y >= top &&
  x <= left + width &&
  y <= top + height
}

///|
// An overlay belongs to its panel; it must not mask another overlapping axes.
fn Drawing::excluded(
  self : Drawing,
  panel_index : Int32,
  x : Double,
  y : Double,
) -> Bool {
  for (panel, rectangle) in self.exclusions {
    if panel == panel_index && rect_contains(rectangle, x, y) {
      return true
    }
  }
  false
}

///|
fn valid_shape(shape : HitShape) -> Bool {
  match shape {
    Point => true
    Rectangle(left, top, width, height) =>
      valid_rect((left, top, width, height))
    Sector(cx, cy, radius, start, sweep) =>
      finite(cx) &&
      finite(cy) &&
      finite(radius) &&
      radius > 0.0 &&
      finite(start) &&
      finite(sweep) &&
      sweep > 0.0
    AnnularSector(cx, cy, inner, outer, start, sweep) =>
      finite(cx) &&
      finite(cy) &&
      finite(inner) &&
      finite(outer) &&
      inner >= 0.0 &&
      outer > inner &&
      finite(start) &&
      finite(sweep) &&
      sweep > 0.0
  }
}

///|
fn degrees_normalized(angle : Double) -> Double {
  let wrapped = angle % 360.0
  if wrapped < 0.0 {
    wrapped + 360.0
  } else {
    wrapped
  }
}

///|
fn shape_contains(shape : HitShape, x : Double, y : Double) -> Bool {
  match shape {
    Point => false
    Rectangle(left, top, width, height) =>
      rect_contains((left, top, width, height), x, y)
    Sector(cx, cy, radius, start, sweep) => {
      let dx = x - cx
      let dy = cy - y
      if !finite(dx) || !finite(dy) || hit_distance(dx, dy) > radius {
        return false
      }
      // The center belongs to every positive sweep and no angle is needed.
      if (dx == 0.0 && dy == 0.0) || sweep >= 360.0 {
        return true
      }
      let angle = @math.atan2(dy, dx) * 180.0 / @math.PI
      degrees_normalized(degrees_normalized(angle) - degrees_normalized(start)) <=
      sweep
    }
    AnnularSector(cx, cy, inner, outer, start, sweep) => {
      let dx = x - cx
      let dy = cy - y
      let distance = hit_distance(dx, dy)
      if !finite(dx) || !finite(dy) || distance < inner || distance > outer {
        return false
      }
      if (dx == 0.0 && dy == 0.0) || sweep >= 360.0 {
        return true
      }
      let angle = @math.atan2(dy, dx) * 180.0 / @math.PI
      let offset = degrees_normalized(
        degrees_normalized(angle) - degrees_normalized(start),
      )
      // atan2 and the degree conversion can put an exact edge a few rounding
      // steps outside its interval, wrapping a tiny negative offset to 360.
      // Bound this allowance by four binary64 epsilons over one revolution
      // (about 3.2e-13 degrees), rather than a visible angular hit radius.
      let roundoff = 4.0 * 360.0 * 2.220446049250313e-16
      offset <= sweep + roundoff || 360.0 - offset <= roundoff
    }
  }
}

///|
fn Drawing::target_hit(
  self : Drawing,
  x : Double,
  y : Double,
  radius : Double,
  scale : Double,
  mode : HitMode,
) -> HitPoint? {
  if self.targets.is_empty() {
    return self.nearest(x, y, radius, scale)
  }
  if self.width <= 0 ||
    self.height <= 0 ||
    !finite(x) ||
    !finite(y) ||
    x < 0.0 ||
    y < 0.0 ||
    x > self.width.to_double() ||
    y > self.height.to_double() ||
    !finite(radius) ||
    radius < 0.0 ||
    !finite(scale) ||
    scale <= 0.0 {
    return None
  }
  // Areas have priority over point anchors; the last painted area wins.
  for index = self.targets.length() - 1; index >= 0; index = index - 1 {
    let target = self.targets[index]
    if valid_info(target.info) &&
      !self.excluded(target.info.point.panel_index, x, y) &&
      valid_shape(target.shape) &&
      rect_contains(target.bounds, x, y) &&
      shape_contains(target.shape, x, y) {
      return Some(target.info.point)
    }
  }
  let mut best : HitPoint? = None
  let mut best_distance = radius
  for target in self.targets {
    if self.excluded(target.info.point.panel_index, x, y) ||
      target.shape != Point ||
      (mode == XNearest && target.info.kind == Line) ||
      !valid_info(target.info) ||
      !rect_contains(target.bounds, x, y) ||
      !rect_contains(
        target.bounds,
        target.info.point.screen_x,
        target.info.point.screen_y,
      ) {
      continue
    }
    let point = target.info.point
    let dx = (point.screen_x - x) * scale
    let dy = (point.screen_y - y) * scale
    if !finite(dx) || !finite(dy) {
      continue
    }
    let distance = hit_distance(dx, dy)
    if distance <= best_distance && (best is None || distance < best_distance) {
      best = Some(point)
      best_distance = distance
    }
  }
  if best is Some(_) || mode == Nearest {
    return best
  }
  let mut best_dx = 0.0
  let mut best_dy = 0.0
  for target in self.targets {
    if self.excluded(target.info.point.panel_index, x, y) ||
      target.info.kind != Line ||
      target.shape != Point ||
      !valid_info(target.info) ||
      !rect_contains(target.bounds, x, y) ||
      !rect_contains(
        target.bounds,
        target.info.point.screen_x,
        target.info.point.screen_y,
      ) {
      continue
    }
    let point = target.info.point
    let dx = (point.screen_x - x).abs()
    let dy = (point.screen_y - y).abs()
    if !finite(dx) || !finite(dy) {
      continue
    }
    if best is None || dx < best_dx || (dx == best_dx && dy < best_dy) {
      best = Some(point)
      best_dx = dx
      best_dy = dy
    }
  }
  best
}
