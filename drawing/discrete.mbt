///|
fn discrete_kind(kind : HitKind) -> Bool {
  kind == Step || kind == Stairs || kind == Ecdf
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
