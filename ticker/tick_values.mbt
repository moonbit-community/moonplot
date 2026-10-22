///|
/// A mutable one-dimensional tick view over a shared Double buffer.
/// Locations and preset results retain their source buffer and stride.
pub struct TickValues {
  priv buffer : Array[Double]
  priv start : Int32
  priv stride : Int64
  priv length : Int32
}

///|
/// Borrow the current shape of an array without copying its values.
pub fn TickValues::from_array(values : Array[Double]) -> TickValues {
  tick_values_view(values, 0, 1, values.length())
}

///|
fn tick_values_view(
  buffer : Array[Double],
  start : Int32,
  stride : Int32,
  length : Int32,
) -> TickValues {
  { buffer, start, stride: Int64::from_int(stride), length, }
}

///|
pub fn TickValues::length(self : TickValues) -> Int32 {
  self.length
}

///|
fn TickValues::buffer_index(
  self : TickValues,
  index : Int32,
) -> Int32 raise @core.DataError {
  let index = if index < 0 { self.length + index } else { index }
  if index < 0 || index >= self.length {
    raise @core.DataError::InvalidTicks(
      message="tick view index is out of bounds",
    )
  }
  let position = Int64::from_int(self.start) +
    Int64::from_int(index) * self.stride
  if position < 0L || position >= Int64::from_int(self.buffer.length()) {
    raise @core.DataError::InvalidTicks(
      message="tick view buffer shape has changed",
    )
  }
  position.to_int()
}

///|
/// Borrow a strided portion of this view, retaining its original buffer.
/// A negative start counts from the end; a negative stride reverses direction.
pub fn TickValues::view(
  self : TickValues,
  start : Int32,
  stride : Int32,
  length : Int32,
) -> TickValues raise @core.DataError {
  if length < 0 {
    raise @core.DataError::InvalidTicks(
      message="tick view length must be nonnegative",
    )
  }
  if length == 0 {
    return tick_values_view(self.buffer, 0, 1, 0)
  }
  let start = if start < 0 { self.length + start } else { start }
  let end = Int64::from_int(start) +
    Int64::from_int(stride) * Int64::from_int(length - 1)
  if start < 0 ||
    start >= self.length ||
    end < 0L ||
    end >= Int64::from_int(self.length) {
    raise @core.DataError::InvalidTicks(
      message="tick view extends beyond its parent",
    )
  }
  let buffer_start = self.buffer_index(start)
  ignore(self.buffer_index(end.to_int()))
  let buffer_stride = if length == 1 {
    0L
  } else {
    self.stride * Int64::from_int(stride)
  }
  { buffer: self.buffer, start: buffer_start, stride: buffer_stride, length, }
}

///|
/// Read an element, with negative indices counted from the view's end.
pub fn TickValues::get(
  self : TickValues,
  index : Int32,
) -> Double raise @core.DataError {
  self.buffer[self.buffer_index(index)]
}

///|
pub fn TickValues::set(
  self : TickValues,
  index : Int32,
  value : Double,
) -> Unit raise @core.DataError {
  self.buffer[self.buffer_index(index)] = value
}

///|
/// Materialize an independent array containing every view element.
pub fn TickValues::to_array(
  self : TickValues,
) -> Array[Double] raise @core.DataError {
  let result = Array(capacity=self.length)
  for index in 0..<self.length {
    result.push(self.get(index))
  }
  result
}

///|
/// Copy the view values into an independent contiguous buffer.
pub fn TickValues::copy(self : TickValues) -> TickValues raise @core.DataError {
  TickValues::from_array(self.to_array())
}

///|
fn TickValues::eager_prefix(
  self : TickValues,
) -> Array[Double] raise @core.DataError {
  let length = Int32::min(self.length, 100000)
  let result = Array(capacity=length)
  for index in 0..<length {
    result.push(self.get(index))
  }
  result
}
