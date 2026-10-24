// Test-only decoder for the lossless saved-oracle fixtures in testdata/packed.
// The upstream JSON remains authoritative; scripts/logit_sort_fixture.py checks
// each encoded record against every original input and expected output value.

///|
struct LogitReferenceReader {
  data : Bytes
  mut position : Int32
  limit : Int32
}

///|
fn LogitReferenceReader::byte(self : LogitReferenceReader) -> Byte {
  guard self.position < self.limit else { abort("truncated sort fixture") }
  let value = self.data[self.position]
  self.position += 1
  value
}

///|
fn LogitReferenceReader::word(self : LogitReferenceReader) -> Int32 {
  let first = self.byte().to_int()
  let second = self.byte().to_int()
  let third = self.byte().to_int()
  let fourth = self.byte().to_int()
  guard fourth < 128 else { abort("sort fixture size exceeds Int range") }
  first + (second << 8) + (third << 16) + (fourth << 24)
}

///|
fn LogitReferenceReader::bits(self : LogitReferenceReader) -> UInt64 {
  let mut result = 0UL
  for index in 0..<8 {
    result = result | (self.byte().to_uint64() << (index * 8))
  }
  result
}

///|
fn LogitReferenceReader::text(self : LogitReferenceReader) -> String {
  let length = self.word()
  let result = StringBuilder()
  for _ in 0..<length {
    let value = self.byte()
    guard value.to_int() < 128 else { abort("non-ASCII sort fixture string") }
    result.write_char(value.to_char())
  }
  result.to_string()
}

///|
fn LogitReferenceReader::vector(self : LogitReferenceReader) -> Array[UInt64] {
  let length = self.word()
  let mode = self.byte().to_int()
  let values : Array[UInt64] = []
  match mode {
    0 =>
      for _ in 0..<length {
        values.push(self.bits())
      }
    1 => {
      let runs = self.word()
      for _ in 0..<runs {
        let count = self.word()
        let first = self.bits()
        let step = self.bits()
        guard count > 0 && count <= length - values.length() else {
          abort("invalid sort fixture run length")
        }
        for index in 0..<count {
          // UInt64 modular addition reconstructs original words, including NaN
          // payloads and the sign of zero; it does not sort or compare values.
          values.push(first + step * index.to_uint64())
        }
      }
    }
    2 => {
      let period = self.word()
      guard period > 0 && period <= 64 && period <= length else {
        abort("invalid sort fixture repeated block")
      }
      let block = Array::makei(period, _ => self.bits())
      for index in 0..<length {
        values.push(block[index % period])
      }
    }
    _ => abort("unknown sort fixture vector encoding")
  }
  guard values.length() == length else {
    abort("incomplete sort fixture vector")
  }
  values
}

///|
fn LogitReferenceReader::scalars(
  self : LogitReferenceReader,
) -> Array[ScalarNumber] {
  let mode = self.byte().to_int()
  if mode == 1 {
    return self
      .vector()
      .map(value => ScalarNumber::Number(value.reinterpret_as_double()))
  }
  guard mode == 0 else { abort("unknown sort fixture scalar encoding") }
  let length = self.word()
  Array::makei(length, _ => {
    match self.byte().to_int() {
      0 => ScalarNumber::Number(self.bits().reinterpret_as_double())
      1 => ScalarNumber::NumpyFloat64(self.bits().reinterpret_as_double())
      2 => ScalarNumber::Integer(@bigint.BigInt::from_string(self.text()))
      3 => ScalarNumber::NumpyInt64(self.bits().reinterpret_as_int64())
      4 => ScalarNumber::Boolean(self.byte() == 1)
      5 => ScalarNumber::NumpyBool(self.byte() == 1)
      _ => abort("unknown sort fixture scalar origin")
    }
  })
}

///|
fn logit_reference_case(
  data : Bytes,
  magic : String,
  cases : Int32,
  id : Int32,
) -> LogitReferenceReader raise {
  let header = { data, position: 0, limit: data.length(), }
  let actual_magic = String::from_array(
    Array::makei(8, _ => header.byte().to_char()),
  )
  assert_eq(actual_magic, magic)
  assert_eq(header.word(), cases)
  assert_true(id >= 0 && id < cases)
  header.position = 12 + id * 4
  let start = header.word()
  let end = header.word()
  assert_true(
    start >= 12 + (cases + 1) * 4 && start <= end && end <= data.length(),
  )
  let reader = { data, position: start, limit: end, }
  assert_eq(reader.word(), id)
  reader
}

///|
fn logit_reference_scalar(
  actual : ScalarNumber,
  expected : ScalarNumber,
) -> Unit raise {
  match (actual, expected) {
    (Number(a), Number(b)) | (NumpyFloat64(a), NumpyFloat64(b)) =>
      assert_eq(a.reinterpret_as_uint64(), b.reinterpret_as_uint64())
    (Integer(a), Integer(b)) => assert_eq(a.to_string(), b.to_string())
    (NumpyInt64(a), NumpyInt64(b)) => assert_eq(a, b)
    (Boolean(a), Boolean(b)) | (NumpyBool(a), NumpyBool(b)) => assert_eq(a, b)
    _ => abort("object-sort scalar origin mismatch")
  }
}
