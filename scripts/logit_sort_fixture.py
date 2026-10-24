"""Losslessly pack saved sort oracles for MoonBit's test-only :embed loader.

This module never sorts. The upstream JSON stays the independent oracle; every
packed record is decoded and checked against it before a file can be written.
The three vector encodings are literal uint64 words, constant-difference runs,
and exact repeated words (period <= 64). All preserve every original bit.
"""
from pathlib import Path
import base64
import json
import struct
import subprocess
import textwrap

ROOT = Path(__file__).resolve().parents[1]
MASK = (1 << 64) - 1
KINDS = ["Number", "NumpyFloat64", "Integer", "NumpyInt64", "Boolean", "NumpyBool"]


def u32(value):
    return struct.pack("<I", value)


def u64(value):
    return struct.pack("<Q", value & MASK)


def string(value):
    data = value.encode("ascii")
    return u32(len(data)) + data


def vector(values):
    """Pick the shortest exact representation, never infer expected values."""
    raw = bytes([0]) + b"".join(u64(v) for v in values)
    runs = []
    i = 0
    while i < len(values):
        j = min(i + 1, len(values) - 1)
        step = (values[j] - values[i]) & MASK
        while j + 1 < len(values) and (values[j + 1] - values[j]) & MASK == step:
            j += 1
        runs.append((values[i], step, j - i + 1))
        i = j + 1
    candidates = [raw, bytes([1]) + u32(len(runs)) + b"".join(
        u32(count) + u64(first) + u64(step) for first, step, count in runs)]
    for period in range(1, min(64, len(values)) + 1):
        if len(values) > period and all(value == values[i % period] for i, value in enumerate(values)):
            candidates.append(bytes([2]) + u32(period) + b"".join(u64(v) for v in values[:period]))
            break
    return u32(len(values)) + min(candidates, key=len)


def scalars(values):
    if isinstance(values, dict):
        assert values["encoding"] == "big-endian-uint64-base64"
        assert values["scalar_kind"] == "Number"
        words = [v for (v,) in struct.iter_unpack(">Q", base64.b64decode(values["data"], validate=True))]
        assert len(words) == values["length"]
        values = [{"kind": "Number", "bits": v} for v in words]
    return values


def scalar_array(values):
    if all(v["kind"] == "Number" for v in values):
        return bytes([1]) + vector([v["bits"] for v in values])
    output = bytearray(bytes([0]) + u32(len(values)))
    for value in values:
        kind = value["kind"]
        output.append(KINDS.index(kind))
        if kind in ["Number", "NumpyFloat64"]:
            output.extend(u64(value["bits"]))
        elif kind == "Integer":
            output.extend(string(value["value"]))
        elif kind == "NumpyInt64":
            output.extend(u64(int(value["value"])))
        else:
            output.append(int(value["value"]))
    return bytes(output)


class Reader:
    """Independent simple decoder used to reject lossy/incorrect packing."""
    def __init__(self, data):
        self.data = data
        self.position = 0

    def read(self, size):
        result = self.data[self.position:self.position + size]
        assert len(result) == size
        self.position += size
        return result

    def byte(self):
        return self.read(1)[0]

    def word(self):
        return struct.unpack("<I", self.read(4))[0]

    def bits(self):
        return struct.unpack("<Q", self.read(8))[0]

    def text(self):
        return self.read(self.word()).decode("ascii")

    def vector(self):
        length, mode = self.word(), self.byte()
        if mode == 0:
            values = [self.bits() for _ in range(length)]
        elif mode == 1:
            values = []
            for _ in range(self.word()):
                count, first, step = self.word(), self.bits(), self.bits()
                values.extend((first + step * i) & MASK for i in range(count))
        elif mode == 2:
            block = [self.bits() for _ in range(self.word())]
            values = [block[i % len(block)] for i in range(length)]
        else:
            raise ValueError("unknown vector encoding")
        assert len(values) == length
        return values

    def scalars(self):
        mode = self.byte()
        if mode == 1:
            return [{"kind": "Number", "bits": v} for v in self.vector()]
        assert mode == 0
        values = []
        for _ in range(self.word()):
            kind = KINDS[self.byte()]
            if kind in ["Number", "NumpyFloat64"]:
                value = {"bits": self.bits()}
            elif kind == "Integer":
                value = {"value": self.text()}
            elif kind == "NumpyInt64":
                bits = self.bits()
                value = {"value": str(bits if bits < (1 << 63) else bits - (1 << 64))}
            else:
                value = {"value": bool(self.byte())}
            values.append(dict(kind=kind, **value))
        return values


def packed_fixture(document, object_sort):
    records = []
    cases = document["cases"]
    for index, case in enumerate(cases):
        assert case["id"] == index
        record = bytearray(u32(index))
        if object_sort:
            values = scalars(case["values"])
            expected = scalars(case["expected"]) if case["expected"] is not None else None
            record.append(["quicksort", "heapsort"].index(case["kind"]))
            record.extend(string(case["error"] or ""))
            record.extend(scalar_array(values))
            if expected is not None:
                record.extend(scalar_array(expected))
            reader = Reader(record)
            assert reader.word() == index
            assert reader.byte() == ["quicksort", "heapsort"].index(case["kind"])
            assert reader.text() == (case["error"] or "")
            assert reader.scalars() == values
            if expected is not None:
                assert reader.scalars() == expected
        else:
            for field in ["pessimistic_bits", "sum_bits", "expected_order"]:
                record.extend(vector(case[field]))
            reader = Reader(record)
            assert reader.word() == index
            for field in ["pessimistic_bits", "sum_bits", "expected_order"]:
                assert reader.vector() == case[field]
        assert reader.position == len(record)
        records.append(bytes(record))
    magic = b"MPLTOB01" if object_sort else b"MPLTUP01"
    offset = 12 + 4 * (len(cases) + 1)
    offsets = [offset]
    for record in records:
        offset += len(record)
        offsets.append(offset)
    return magic + u32(len(cases)) + b"".join(u32(v) for v in offsets) + b"".join(records)


def grouped_tests(document, object_sort):
    name = "logit_object_sort" if object_sort else "logit_sort"
    title = "Logit NumPy object sort" if object_sort else "Logit fixed CPython tuple sort"
    total = len(document["cases"])
    prefix = f"// Generated by scripts/generate_{name}_reference.py; do not edit.\n"
    prefix += "// Inputs and complete expected outputs are in the packed saved-oracle fixture.\n"
    if object_sort:
        body = '''
///|
fn logit_object_sort_reference_case(id : Int) -> Unit raise {
  let reader = logit_reference_case(logit_object_sort_fixture, "MPLTOB01", TOTAL, id)
  let kind = reader.byte()
  assert_true(kind == 0 || kind == 1)
  let error = reader.text()
  let values = reader.scalars()
  let sort = fn() -> Array[ScalarNumber] raise {
    if kind == 0 { logit_object_sort(values) } else {
      logit_object_heapsort(values, 0, values.length())
      values
    }
  }
  if !error.is_empty() {
    let actual = try { ignore(sort()); "unexpected success" } catch {
      @core.DataError::InvalidTicks(message~) => message
      _ => "unexpected error"
    }
    assert_eq(actual, error, msg="object sort case " + id.to_string())
  } else {
    let expected = reader.scalars()
    let actual = sort()
    assert_eq(actual.length(), expected.length())
    for index in 0..<expected.length() {
      logit_reference_scalar(actual[index], expected[index])
    }
  }
  assert_eq(reader.position, reader.limit, msg="complete object fixture record")
}
'''
    else:
        body = '''
///|
fn logit_sort_reference_case(id : Int) -> Unit raise {
  let reader = logit_reference_case(logit_sort_fixture, "MPLTUP01", TOTAL, id)
  let pessimistic = reader.vector().map(value => value.reinterpret_as_double())
  let sums = reader.vector().map(value => value.reinterpret_as_double())
  let expected = reader.vector()
  let actual = logit_sort_indices(pessimistic, sums)
  assert_eq(actual.length(), expected.length(), msg="sort case " + id.to_string() + " length")
  for index in 0..<expected.length() {
    assert_eq(actual[index].to_uint64(), expected[index], msg="sort case " + id.to_string() + " element " + index.to_string())
  }
  assert_eq(reader.position, reader.limit, msg="complete tuple fixture record")
}
'''
    prefix += f"\n///|\nlet {name}_reference_data : Bytes = try! @base64.decode({name}_fixture, ignore_whitespace=true)\n"
    body = body.replace(name + "_fixture,", name + "_reference_data,")
    text = prefix + body.replace("TOTAL", str(total))
    for start in range(0, total, 32):
        text += f'\n///|\ntest "{title} group {start // 32}" {{\n'
        text += f'  for id in {start}..<{min(start + 32, total)} {{ {name}_reference_case(id) }}\n}}\n'
    return subprocess.run(["moonfmt", "-"], input=text, text=True,
                          stdout=subprocess.PIPE, check=True).stdout


def outputs(document, object_sort):
    name = "logit_object_sort" if object_sort else "logit_sort"
    assert len(document["cases"]) == document["metadata"]["cases"]
    assert (len(document["cases"]) + 31) // 32 == document["metadata"]["registered_groups"]
    return {
        ROOT / "testdata/packed" / (name + ".base64"): ("\n".join(textwrap.wrap(base64.b64encode(packed_fixture(document, object_sort)).decode("ascii"), 96)) + "\n").encode(),
        ROOT / "ticker" / (name + "_reference_wbtest.mbt"): grouped_tests(document, object_sort).encode(),
    }


def write_outputs(document, object_sort, check):
    for path, data in outputs(document, object_sort).items():
        if check:
            if not path.is_file() or path.read_bytes() != data:
                raise SystemExit("stale " + str(path.relative_to(ROOT)))
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data)
