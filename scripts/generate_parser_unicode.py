"""Generate exact CPython Unicode 15 lexer predicates, without a runtime dependency."""
from pathlib import Path
import argparse
import hashlib
import json
import subprocess
import sys
import unicodedata

ROOT = Path(__file__).resolve().parents[1]


def ranges(predicate):
    output = []
    start = None
    for value in range(0x110000):
        selected = predicate(chr(value))
        if selected and start is None: start = value
        if not selected and start is not None:
            output.append((start, value - 1)); start = None
    if start is not None: output.append((start, 0x10ffff))
    return output


def generate():
    if unicodedata.unidata_version != '15.0.0': raise ValueError('requires pinned CPython Unicode 15.0.0')
    properties = dict(word=ranges(str.isalpha), digit=ranges(str.isdigit), space=ranges(str.isspace),
                      decimal=ranges(lambda ch: unicodedata.category(ch) == 'Nd'))
    for first, last in properties['decimal']:
        for value in range(first, last + 1):
            assert unicodedata.decimal(chr(value)) == (value - first) % 10
    code = '// Generated Unicode 15.0.0 classification for the dateutil-compatible lexer.\n'
    for name, values in properties.items():
        code += '\n///|\nlet parser_' + name + '_ranges : Array[(Int32, Int32)] = [' + ', '.join('(%s, %s)' % pair for pair in values) + ']\n'
    code += '''
///|
fn parser_unicode_index(char : Char, ranges : Array[(Int32, Int32)]) -> Int32? {
  let value = char.to_int()
  let mut lower = 0
  let mut upper = ranges.length()
  while lower < upper {
    let middle = (lower + upper) / 2
    let (first, last) = ranges[middle]
    if value < first { upper = middle }
    else if value > last { lower = middle + 1 }
    else { return Some(middle) }
  }
  None
}

///|
fn parser_is_word(char : Char) -> Bool { parser_unicode_index(char, parser_word_ranges) is Some(_) }

///|
fn parser_is_digit(char : Char) -> Bool { parser_unicode_index(char, parser_digit_ranges) is Some(_) }

///|
fn parser_is_space(char : Char) -> Bool { parser_unicode_index(char, parser_space_ranges) is Some(_) }

///|
fn parser_decimal_digit(char : Char) -> Int32? {
  parser_unicode_index(char, parser_decimal_ranges).map(index => (char.to_int() - parser_decimal_ranges[index].0) % 10)
}
'''
    code = subprocess.run(['moonfmt', '-'], input=code, text=True, stdout=subprocess.PIPE, check=True).stdout
    manifest = dict(unicode_version=unicodedata.unidata_version, python=sys.version.split()[0],
                    properties={name: dict(range_count=len(values), scalar_count=sum(last-first+1 for first,last in values)) for name,values in properties.items()},
                    generated_sha256=hashlib.sha256(code.encode()).hexdigest(),
                    note='CPython str.isalpha/isdigit/isspace and Unicode Nd; no runtime Python dependency.')
    return {ROOT/'ticker/date/parser_unicode.mbt': code,
            ROOT/'testdata/parser_unicode_reference.json': json.dumps(manifest, indent=2)+'\n'}


def main():
    parser = argparse.ArgumentParser(description=__doc__);parser.add_argument('--check', action='store_true');args=parser.parse_args()
    for path, value in generate().items():
        if args.check:
            if path.read_text()!=value:raise SystemExit('reference differs: '+str(path.relative_to(ROOT)))
        else:path.write_text(value)
    print(('Verified' if args.check else 'Generated')+' parser Unicode predicates')


if __name__=='__main__':main()
