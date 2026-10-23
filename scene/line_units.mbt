///|
/// Original coordinate kind is independent of the Axis's current converter.
priv enum LineOriginalCoordinate {
  Numeric(Array[Double])
  Category(Array[String])
  Date(Array[@date.RRuleDateTime])
}

///|
/// The points buffer is the exact buffer retained by the attached Line artist.
priv struct LineOriginal {
  points : Array[@core.Point]
  x : LineOriginalCoordinate
  y : LineOriginalCoordinate
}

///|
fn LineOriginalCoordinate::copy(
  self : LineOriginalCoordinate,
) -> LineOriginalCoordinate {
  match self {
    Numeric(values) => Numeric(values.copy())
    Category(values) => Category(values.copy())
    Date(values) => Date(values.copy())
  }
}

///|
fn LineOriginalCoordinate::convert(
  self : LineOriginalCoordinate,
  axis : @axis.Axis,
) -> Array[Double] raise @core.DataError {
  match self {
    Numeric(values) => values
    Category(values) => axis.convert_category_units(values)
    Date(values) => axis.convert_date_units(values)
  }
}

///|
fn Axes::attach_line_with_originals(
  self : Axes,
  points : Array[@core.Point],
  x_original : LineOriginalCoordinate,
  y_original : LineOriginalCoordinate,
  color~ : String = "",
  label~ : String = "",
) -> Unit {
  let attached = copy_points(points)
  let original : LineOriginal = {
    points: attached,
    x: x_original.copy(),
    y: y_original.copy(),
  }
  let resolved_color = self.resolve_color(color)
  self.state.val.line_originals.push(original)
  self.push_artist(Artist::Line(attached, @core.style(resolved_color)))
  self.add_auto_legend(label, resolved_color, LegendKind::Line)
}

///|
/// A forced Line recache converts x then y before replacing either coordinate.
/// Conversion-side mutations and already committed preceding Lines survive errors.
fn Axes::recache_line_units(self : Axes) -> Unit raise @core.DataError {
  let state = self.state.val
  for artist in state.artists {
    guard artist is Artist::Line(points, _) else { continue }
    for original in state.line_originals {
      if !physical_equal(points, original.points) {
        continue
      }
      let xs = original.x.convert(state.x_axis)
      let ys = original.y.convert(state.y_axis)
      let length = if xs.length() == ys.length() {
        xs.length()
      } else if xs.length() == 1 {
        ys.length()
      } else if ys.length() == 1 {
        xs.length()
      } else {
        raise @core.DataError::InvalidTicks(
          message="shape mismatch: objects cannot be broadcast to a single shape.  Mismatch is between arg 0 with shape (\{xs.length()},) and arg 1 with shape (\{ys.length()},).",
        )
      }
      let replacement = Array::makei(length, index => {
        @core.point(
          xs[if xs.length() == 1 { 0 } else { index }],
          ys[if ys.length() == 1 { 0 } else { index }],
        )
      })
      points.clear()
      for point in replacement {
        points.push(point)
      }
      break
    }
  }
}

///|
/// Contour rewriting can remove or split display buffers; retain only exact
/// attached identities, without guessing originals from replacement geometry.
fn Axes::prune_line_originals(self : Axes) -> Unit {
  let artists = self.state.val.artists
  self.state.val.line_originals.retain(original => {
    artists.any(artist => {
      match artist {
        Artist::Line(points, _) => physical_equal(points, original.points)
        _ => false
      }
    })
  })
}
