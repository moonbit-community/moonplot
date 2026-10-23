///|
/// Retained numeric locations distinguish a live list from a fixed-shape view.
pub(all) enum FormatterLocations {
  Sequence(Array[Double])
  NdArray(TickValues)
}

///|
pub fn FormatterLocations::length(self : FormatterLocations) -> Int32 {
  match self {
    Sequence(values) => values.length()
    NdArray(values) => values.length()
  }
}

///|
pub fn FormatterLocations::get(
  self : FormatterLocations,
  index : Int32,
) -> Double raise @core.DataError {
  match self {
    Sequence(values) => {
      let index = if index < 0 {
        Int64::from_int(values.length()) + Int64::from_int(index)
      } else {
        Int64::from_int(index)
      }
      if index < 0L || index >= Int64::from_int(values.length()) {
        raise @core.DataError::InvalidTicks(
          message="formatter location index is out of bounds",
        )
      }
      values[index.to_int()]
    }
    NdArray(values) => values.get(index)
  }
}

///|
/// Stable typed axis identity; dummy metadata does not expose a dynamic Axis.
pub struct FormatterAxisBinding {
  priv minpos : Double?
} derive(Debug)

///|
pub extend FormatterAxisBinding with @debug.Debug::{to_repr}

///|
pub impl Eq for FormatterAxisBinding with fn equal(self, other) {
  physical_equal(self, other)
}

///|
pub extend FormatterAxisBinding with Eq::{equal, not_equal}

///|
pub fn FormatterAxisBinding::new() -> FormatterAxisBinding {
  { minpos: None, }
}

///|
pub fn FormatterAxisBinding::is_dummy(self : FormatterAxisBinding) -> Bool {
  self.minpos is Some(_)
}

///|
pub fn FormatterAxisBinding::dummy_minpos(
  self : FormatterAxisBinding,
) -> Double? {
  self.minpos
}

///|
priv struct FixedFormatterState {
  mut seq : Array[String]
  mut offset : String
}

///|
priv struct FuncFormatterState {
  mut callback : (Double, Int32?) -> String raise @core.DataError
  mut offset : String
}

///|
priv struct StringFormatterState {
  mut fmt : String
}

///|
priv enum FormatterKind {
  Abstract
  Null
  Fixed(FixedFormatterState)
  Func(FuncFormatterState)
  FormatStr(StringFormatterState)
  StrMethod(StringFormatterState)
}

///|
/// A live formatter object. Copies share buffers and retain independent slots.
pub struct BaseFormatter {
  priv kind : FormatterKind
  priv mut locations : FormatterLocations
  priv mut axis : FormatterAxisBinding?
}

///|
let formatter_default_locations : Array[Double] = []

///|
fn named_formatter_with_kind(kind : FormatterKind) -> BaseFormatter {
  {
    kind,
    locations: FormatterLocations::Sequence(formatter_default_locations),
    axis: None,
  }
}

///|
/// Construct the base object; its formatting primitive remains unimplemented.
pub fn BaseFormatter::new() -> BaseFormatter {
  named_formatter_with_kind(FormatterKind::Abstract)
}

///|
pub fn BaseFormatter::locations(self : BaseFormatter) -> FormatterLocations {
  self.locations
}

///|
/// Borrow a numeric list with its live mutable length.
pub fn BaseFormatter::set_locs(
  self : BaseFormatter,
  locations : Array[Double],
) -> Unit {
  self.locations = FormatterLocations::Sequence(locations)
}

///|
/// Retain a numeric view and its original shape, dtype, buffer, and stride.
pub fn BaseFormatter::set_locs_view(
  self : BaseFormatter,
  locations : TickValues,
) -> Unit {
  self.locations = FormatterLocations::NdArray(locations)
}

///|
pub fn BaseFormatter::axis(self : BaseFormatter) -> FormatterAxisBinding? {
  self.axis
}

///|
pub fn BaseFormatter::set_axis(
  self : BaseFormatter,
  axis : FormatterAxisBinding?,
) -> Unit {
  self.axis = axis
}

///|
/// Allocate a dummy identity only while unbound, retaining arbitrary minpos.
pub fn BaseFormatter::create_dummy_axis(
  self : BaseFormatter,
  minpos~ : Double = 0.0,
) -> Unit {
  if self.axis is None {
    self.axis = Some({ minpos: Some(minpos), })
  }
}

///|
pub fn BaseFormatter::get_offset(self : BaseFormatter) -> String {
  match self.kind {
    Abstract | Null | FormatStr(_) | StrMethod(_) => ""
    Fixed(state) => state.offset
    Func(state) => state.offset
  }
}

///|
pub fn BaseFormatter::copy(self : BaseFormatter) -> BaseFormatter {
  let kind = match self.kind {
    Abstract => FormatterKind::Abstract
    Null => FormatterKind::Null
    Fixed(state) =>
      FormatterKind::Fixed({ seq: state.seq, offset: state.offset, })
    Func(state) =>
      FormatterKind::Func({ callback: state.callback, offset: state.offset, })
    FormatStr(state) => FormatterKind::FormatStr({ fmt: state.fmt, })
    StrMethod(state) => FormatterKind::StrMethod({ fmt: state.fmt, })
  }
  { kind, locations: self.locations, axis: self.axis, }
}
