"""Independent complete-class anchors for Base/Scalar/Eng virtual dispatch."""
import argparse
import json
import sys
import warnings
from pathlib import Path

import numpy as np

from formatter_reference_source import load_eng_formatter

ROOT = Path(__file__).resolve().parents[1]


def observe(path):
    ns = load_eng_formatter(path)
    Eng = ns['EngFormatter']
    ns['mpl'].rcParams['axes.unicode_minus'] = True
    f = Eng(unit='unit-hyphen-', places=2, usetex=False, useMathText=False)
    rows = {'empty': [f(-1234.5), f.format_data(-1234.5),
                      f.format_data_short(np.int64(9007199254740993))]}
    f.create_dummy_axis()
    f.axis.set_view_interval(0, 10000)
    rows['view_batch'] = f.format_ticks(np.array([0, 1000, 2000], dtype=np.int64))
    f.set_useOffset(1000000)
    f.set_locs([1000000, 1000002, 1000004])
    rows['cached'] = [f(1000000), f(1000002), f.get_offset()]
    f.places = 2.0
    rows['cached_after_bad_places'] = f(1000002)
    try:
        f.format_data(1000002)
    except Exception as error:
        rows['bad_places'] = [type(error).__name__, str(error)]
    f.set_locs([])
    rows['empty_offset'] = f.get_offset()
    f = Eng(unit='Hz', usetex=False, useMathText=False)
    f.create_dummy_axis()
    f.axis.set_view_interval(0, 10000)
    rows['float_batch'] = f.format_ticks([float(-2**63)])
    with warnings.catch_warnings(record=True) as caught:
        warnings.simplefilter('always')
        try:
            f.format_ticks(np.array([-2**63], dtype=np.int64))
        except Exception as error:
            rows['integer_view_error'] = [type(error).__name__, str(error)]
    rows['integer_view_warnings'] = [str(w.message) for w in caught]
    return dict(source_hashes=ns['source_hashes'], python=sys.version.split()[0],
                numpy=np.__version__, scope=__doc__, observations=rows,
                registered_test_count=3)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('ticker', type=Path)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    target = ROOT / 'testdata/eng_dispatch_reference.json'
    result = json.dumps(observe(args.ticker), ensure_ascii=False, indent=2) + '\n'
    if args.check:
        if target.read_text() != result:
            raise SystemExit('engineering dispatch reference differs')
    else:
        target.write_text(result)
    print('engineering dispatch: 3 registered tests; complete-class observations verified')


if __name__ == '__main__':
    main()
