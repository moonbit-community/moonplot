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
    Scalar(state) =>
      scalar_named_call(formatter, state, ScalarNumber::Number(value), position)
    Percent(state) =>
      percent_formatter_call(
        formatter,
        state,
        NamedFormatValue::PythonFloat(value),
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
  self.set_locs_checked(values)
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
  self.set_locs_view_checked(values)
  let length = values.length()
  let labels : Array[String] = []
  for index in 0..<length {
    // Named string and percentage classes observe the NumPy scalar type.
    // The D28 Func callback retains its existing Double value contract.
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
      Scalar(state) => {
        let value = if values.is_int64() {
          ScalarNumber::NumpyInt64(values.get_int64(index))
        } else {
          ScalarNumber::NumpyFloat64(values.get(index))
        }
        scalar_named_call(self, state, value, Some(index))
      }
      Percent(state) => {
        let value = if values.is_int64() {
          NamedFormatValue::NumpyInt64(values.get_int64(index))
        } else {
          NamedFormatValue::NumpyFloat64(values.get(index))
        }
        percent_formatter_call(self, state, value)
      }
      _ => formatter_named_call(self, values.get(index), Some(index))
    }
    labels.push(label)
  }
  labels
}

///|
fn percent_formatter_call(
  formatter : BaseFormatter,
  state : PercentFormatterState,
  value : NamedFormatValue,
) -> String raise @core.DataError {
  let view = match formatter.axis {
    None =>
      return named_format_error(
        "AttributeError", "'NoneType' object has no attribute 'get_view_interval'",
      )
    Some(axis) => axis.view_interval()
  }
  let length = view.length()
  if length < 2 {
    return named_format_error(
      "ValueError",
      "not enough values to unpack (expected 2, got " + length.to_string() + ")",
    )
  }
  if length > 2 {
    return named_format_error(
      "ValueError", "too many values to unpack (expected 2)",
    )
  }
  let range = match view {
    Sequence(values) =>
      PercentDisplayRange::Scalar(
        NamedFormatValue::PythonFloat(Double::abs(values[1] - values[0])),
      )
    Integers(values) => {
      let difference = values[1] - values[0]
      PercentDisplayRange::PythonInteger(
        if difference < @bigint.BigInt::from_int(0) {
          difference.neg()
        } else {
          difference
        },
      )
    }
    NdArray(values) =>
      if values.is_int64() {
        let difference = values.get_int64(1).reinterpret_as_uint64() -
          values.get_int64(0).reinterpret_as_uint64()
        let signed = difference.reinterpret_as_int64()
        let magnitude = if signed < 0L {
          (0UL - difference).reinterpret_as_int64()
        } else {
          signed
        }
        PercentDisplayRange::Scalar(NamedFormatValue::NumpyInt64(magnitude))
      } else {
        PercentDisplayRange::Scalar(
          NamedFormatValue::NumpyFloat64(
            Double::abs(values.get(1) - values.get(0)),
          ),
        )
      }
  }
  BaseFormatter::fix_minus(percent_format_pct_with_range(state, value, range))
}

///|
pub fn BaseFormatter::format_data(
  self : BaseFormatter,
  value : Double,
) -> String raise @core.DataError {
  match self.kind {
    Scalar(state) =>
      scalar_named_format_data(state, ScalarNumber::Number(value))
    _ => formatter_named_call(self, value, None)
  }
}

///|
pub fn BaseFormatter::format_data_short(
  self : BaseFormatter,
  value : Double,
) -> String raise @core.DataError {
  match self.kind {
    Scalar(state) =>
      scalar_named_short(self, state, ScalarNumber::Number(value))
    _ => self.format_data(value)
  }
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
