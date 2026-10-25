///|
fn discrete_kind(kind : HitKind) -> Bool {
  kind == Step || kind == Stairs || kind == Ecdf
}

///|
// Real source Points are registered only on the artist's actual stroke.
// Fractional meet-viewport inversion may move an exact endpoint a few binary64
// rounding steps into its adjacent riser. This bound is numerical roundoff in
// SVG coordinates, independent of the caller's CSS hover radius.
fn discrete_source_roundoff(target : HitTarget, x : Double, y : Double) -> Bool {
  if !discrete_kind(target.info.kind) || target.shape != Point {
    return false
  }
  let point = target.info.point
  let factor = 4.0 * 2.220446049250313e-16
  let tx = factor *
    x.abs().max(point.screen_x.abs()).max(target.bounds.2.abs()).max(1.0)
  let ty = factor *
    y.abs().max(point.screen_y.abs()).max(target.bounds.3.abs()).max(1.0)
  (point.screen_x - x).abs() <= tx && (point.screen_y - y).abs() <= ty
}

///|
// Later paths resolve transition ties. At a real source endpoint of the same
// artist, a source Point retains its original sample/return slot.
fn proximity_tie_later(candidate : HitTarget, previous : HitTarget?) -> Bool {
  guard previous is Some(old) else { return true }
  if old.info.kind == Violin || candidate.info.kind == Violin {
    return true
  }
  if !discrete_kind(old.info.kind) && !discrete_kind(candidate.info.kind) {
    return false
  }
  let a = old.info.point
  let b = candidate.info.point
  if a.panel_index == b.panel_index &&
    a.artist_index == b.artist_index &&
    discrete_kind(old.info.kind) &&
    discrete_kind(candidate.info.kind) {
    if old.shape == Point && candidate.shape != Point {
      return false
    }
    if candidate.shape == Point && old.shape != Point {
      return true
    }
  }
  true
}
