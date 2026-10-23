"""Freeze Python 3.12 Unicode printability used by str/repr error messages.

Moon core's character predicate intentionally has a different Unicode profile.
The actual fixed Python str.isprintable operation supplies this Unicode15 table.
"""
from pathlib import Path
import argparse
import hashlib
import json
import sys
import unicodedata

from generate_auto_date_reference import formatted

ROOT = Path(__file__).resolve().parents[1]


def generate():
    if sys.version_info[:3] != (3, 12, 14) or unicodedata.unidata_version != '15.0.0':
        raise ValueError('fixed CPython3.12.14 / Unicode15.0.0 required')
    classification = bytes(chr(code).isprintable() for code in range(0x110000))
    excluded = []
    start = None
    for code in range(0x110001):
        printable = code == 0x110000 or bool(classification[code])
        if not printable and start is None:
            start = code
        elif printable and start is not None:
            excluded.append((start, code - 1))
            start = None
    code = '// Generated from fixed CPython3.12.14 str.isprintable, Unicode15.0.0.\n'
    code += '///|\nlet named_format_unprintable_ranges : Array[(Int32, Int32)] = [\n'
    for lower, upper in excluded:
        code += f'  (0x{lower:x}, 0x{upper:x}),\n'
    code += ']\n\n///|\nfn named_format_python_printable(character : Char) -> Bool {\n'
    code += '''  let value = character.to_int()
  let mut lower = 0
  let mut upper = named_format_unprintable_ranges.length()
  while lower < upper {
    let middle = lower + (upper - lower) / 2
    let (start, end) = named_format_unprintable_ranges[middle]
    if value < start { upper = middle }
    else if value > end { lower = middle + 1 }
    else { return false }
  }
  true
}
'''
    payload = dict(python=sys.version.split()[0], unicode=unicodedata.unidata_version,
                   operation='Actual fixed CPython str.isprintable for every code point 0..0x10ffff',
                   classification_sha256=hashlib.sha256(classification).hexdigest(),
                   codepoint_count=len(classification), nonprintable_ranges=excluded,
                   scope='Private Python repr and invalid-spec quoting. Unicode scalar characters only; unpaired surrogate output remains a separately recorded typed boundary. C method-source references independently assert actual original error messages at assigned/unassigned/version boundaries.')
    return json.dumps(payload, indent=2) + '\n', formatted(code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    outputs = generate()
    for target, content in zip(['testdata/formatter_unicode_reference.json', 'ticker/formatter_unicode_printable.mbt'], outputs):
        path = ROOT / target
        if args.check:
            if not path.exists() or path.read_text() != content:
                raise SystemExit('reference differs: ' + target)
        else:
            path.write_text(content)
    payload = json.loads(outputs[0])
    print('Python repr Unicode:', payload['codepoint_count'], 'code points,', len(payload['nonprintable_ranges']), 'nonprintable ranges')


if __name__ == '__main__':
    main()
