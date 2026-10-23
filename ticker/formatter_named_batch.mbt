///|
fn formatter_named_call(
  formatter : BaseFormatter,
  value : Double,
  position : Int32?,
) -> String raise @core.DataError {
  match formatter.kind {
    Abstract =>
      raise @core.DataError::InvalidTicks(message="Derived must override")
    Null => ""
    Fixed(state) =>
      match position {
        None => ""
        Some(position) => {
          let labels = state.seq
          if position >= labels.length() {
            ""
          } else {
            let index = if position < 0 {
              Int64::from_int(labels.length()) + Int64::from_int(position)
            } else {
              Int64::from_int(position)
            }
            if index < 0L {
              raise @core.DataError::InvalidTicks(
                message="fixed formatter sequence index is out of range",
              )
            }
            labels[index.to_int()]
          }
        }
      }
    Func(state) => (state.callback)(value, position)
    FormatStr(state) =>
      format_percent_checked(state.fmt, NamedFormatValue::PythonFloat(value))
    StrMethod(state) =>
      format_method_checked(
        state.fmt,
        NamedFormatValue::PythonFloat(value),
        position,
      )
  }
}

///|
/// Format a single value with its optional position, retaining current context.
pub fn BaseFormatter::call(
  self : BaseFormatter,
  value : Double,
  pos? : Int32,
) -> String raise @core.DataError {
  formatter_named_call(self, value, pos)
}

///|
/// Store the original array, then enumerate its live values and live length.
pub fn BaseFormatter::format_ticks(
  self : BaseFormatter,
  values : Array[Double],
) -> Array[String] raise @core.DataError {
  self.set_locs(values)
  let labels : Array[String] = []
  let mut index = 0
  while index < values.length() {
    labels.push(formatter_named_call(self, values[index], Some(index)))
    index += 1
  }
  labels
}

///|
/// Store a fixed-shape view while reading each selected element live.
pub fn BaseFormatter::format_ticks_view(
  self : BaseFormatter,
  values : TickValues,
) -> Array[String] raise @core.DataError {
  self.set_locs_view(values)
  let length = values.length()
  let labels : Array[String] = []
  for index in 0..<length {
    // Only the new string classes observe NumPy scalar type. The D28 Func
    // callback deliberately retains its existing Double value contract.
    let label = match self.kind {
      FormatStr(state) => {
        let value = if values.is_int64() {
          NamedFormatValue::NumpyInt64(values.get_int64(index))
        } else {
          NamedFormatValue::NumpyFloat64(values.get(index))
        }
        format_percent_checked(state.fmt, value)
      }
      StrMethod(state) => {
        let value = if values.is_int64() {
          NamedFormatValue::NumpyInt64(values.get_int64(index))
        } else {
          NamedFormatValue::NumpyFloat64(values.get(index))
        }
        format_method_checked(state.fmt, value, Some(index))
      }
      _ => formatter_named_call(self, values.get(index), Some(index))
    }
    labels.push(label)
  }
  labels
}

///|
pub fn BaseFormatter::format_data(
  self : BaseFormatter,
  value : Double,
) -> String raise @core.DataError {
  formatter_named_call(self, value, None)
}

///|
pub fn BaseFormatter::format_data_short(
  self : BaseFormatter,
  value : Double,
) -> String raise @core.DataError {
  self.format_data(value)
}

///|
/// Replace every ASCII hyphen when the current Unicode-minus default is enabled.
pub fn BaseFormatter::fix_minus(value : String) -> String {
  if @config.unicode_minus() {
    value.replace_all(old="-", new="−")
  } else {
    value
  }
}

///|
pub fn NullFormatter::call(
  self : NullFormatter,
  value : Double,
  pos? : Int32,
) -> String raise @core.DataError {
  formatter_named_call(self.base, value, pos)
}

///|
pub fn NullFormatter::format_ticks(
  self : NullFormatter,
  values : Array[Double],
) -> Array[String] raise @core.DataError {
  self.base.format_ticks(values)
}

///|
pub fn NullFormatter::format_ticks_view(
  self : NullFormatter,
  values : TickValues,
) -> Array[String] raise @core.DataError {
  self.base.format_ticks_view(values)
}

///|
pub fn NullFormatter::format_data(
  self : NullFormatter,
  value : Double,
) -> String raise @core.DataError {
  self.base.format_data(value)
}

///|
pub fn NullFormatter::format_data_short(
  self : NullFormatter,
  value : Double,
) -> String raise @core.DataError {
  self.base.format_data_short(value)
}

///|
pub fn FixedFormatter::call(
  self : FixedFormatter,
  value : Double,
  pos? : Int32,
) -> String raise @core.DataError {
  formatter_named_call(self.base, value, pos)
}

///|
pub fn FixedFormatter::format_ticks(
  self : FixedFormatter,
  values : Array[Double],
) -> Array[String] raise @core.DataError {
  self.base.format_ticks(values)
}

///|
pub fn FixedFormatter::format_ticks_view(
  self : FixedFormatter,
  values : TickValues,
) -> Array[String] raise @core.DataError {
  self.base.format_ticks_view(values)
}

///|
pub fn FixedFormatter::format_data(
  self : FixedFormatter,
  value : Double,
) -> String raise @core.DataError {
  self.base.format_data(value)
}

///|
pub fn FixedFormatter::format_data_short(
  self : FixedFormatter,
  value : Double,
) -> String raise @core.DataError {
  self.base.format_data_short(value)
}

///|
pub fn FuncFormatter::call(
  self : FuncFormatter,
  value : Double,
  pos? : Int32,
) -> String raise @core.DataError {
  formatter_named_call(self.base, value, pos)
}

///|
pub fn FuncFormatter::format_ticks(
  self : FuncFormatter,
  values : Array[Double],
) -> Array[String] raise @core.DataError {
  self.base.format_ticks(values)
}

///|
pub fn FuncFormatter::format_ticks_view(
  self : FuncFormatter,
  values : TickValues,
) -> Array[String] raise @core.DataError {
  self.base.format_ticks_view(values)
}

///|
pub fn FuncFormatter::format_data(
  self : FuncFormatter,
  value : Double,
) -> String raise @core.DataError {
  self.base.format_data(value)
}

///|
pub fn FuncFormatter::format_data_short(
  self : FuncFormatter,
  value : Double,
) -> String raise @core.DataError {
  self.base.format_data_short(value)
}
