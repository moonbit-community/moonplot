///|
/// Immutable filled screen geometry with the SVG nonzero or even-odd rule.
/// Input and inspection arrays are independent; Drawing can safely share this
/// opaque value. Validation and bounds are cached once at construction.
pub struct FilledRegion {
  priv rings : Array[Array[(Double, Double)]]
  priv even_odd : Bool
  priv valid : Bool
  priv filled_rings : Array[Bool]
  priv bounds : (Double, Double, Double, Double)
} derive(Eq, Debug)

///|
pub extend FilledRegion with Eq::{equal, not_equal}

///|
pub extend FilledRegion with @debug.Debug::{to_repr}

///|
pub fn filled_region(
  rings : Array[Array[(Double, Double)]],
  even_odd~ : Bool = false,
) -> FilledRegion {
  let copied = rings.map(ring => ring.copy())
  let mut valid = true
  let mut area = false
  let filled_rings = []
  let mut xmin = 1.0 / 0.0
  let mut xmax = -1.0 / 0.0
  let mut ymin = 1.0 / 0.0
  let mut ymax = -1.0 / 0.0
  for ring in copied {
    if ring.length() < 3 {
      filled_rings.push(false)
      continue
    }
    let first = ring[0]
    let mut second = first
    for p in ring {
      if !finite(p.0) || !finite(p.1) {
        valid = false
      }
      xmin = xmin.min(p.0)
      xmax = xmax.max(p.0)
      ymin = ymin.min(p.1)
      ymax = ymax.max(p.1)
      if second == first && p != first {
        second = p
      }
    }
    // Signed area may cancel for a real self-crossing fill. Reject only an
    // entirely collinear ring, not a bow tie or opposite-oriented components.
    let mut ring_area = false
    for p in ring {
      if quad_cross(first, second, p) != 0.0 {
        ring_area = true
      }
    }
    filled_rings.push(ring_area)
    area = area || ring_area
  }
  let bounds = (xmin, ymin, xmax - xmin, ymax - ymin)
  valid = valid && area && valid_rect(bounds)
  { rings: copied, even_odd, valid, filled_rings, bounds, }
}

///|
pub fn FilledRegion::rings(
  self : FilledRegion,
) -> Array[Array[(Double, Double)]] {
  self.rings.map(ring => ring.copy())
}

///|
pub fn FilledRegion::even_odd(self : FilledRegion) -> Bool {
  self.even_odd
}

///|
fn FilledRegion::contains(self : FilledRegion, x : Double, y : Double) -> Bool {
  if !self.valid || !rect_contains(self.bounds, x, y) {
    return false
  }
  let mut winding = 0
  let mut parity = false
  for ring_index, ring in self.rings {
    if !self.filled_rings[ring_index] {
      continue
    }
    for i, a in ring {
      let b = ring[(i + 1) % ring.length()]
      let cross = quad_cross(a, b, (x, y))
      if cross == 0.0 &&
        x >= a.0.min(b.0) &&
        x <= a.0.max(b.0) &&
        y >= a.1.min(b.1) &&
        y <= a.1.max(b.1) {
        return true
      }
      if a.1 <= y && b.1 > y && cross > 0.0 {
        parity = !parity
        winding += 1
      } else if a.1 > y && b.1 <= y && cross < 0.0 {
        parity = !parity
        winding -= 1
      }
    }
  }
  if self.even_odd {
    parity
  } else {
    winding != 0
  }
}
