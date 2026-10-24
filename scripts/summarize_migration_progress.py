"""Independently validate and summarize the pinned migration API audit."""
from collections import Counter
import argparse
import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
UPSTREAM = ROOT / 'testdata/upstream_api_inventory.json'
MAPPING = ROOT / 'testdata/port_api_mapping.json'
OUTPUT = ROOT / 'testdata/migration_progress_summary.json'
SCORES = {0, .25, .5, .75, 1}


def unique(rows):
    result = {row['id']: row for row in rows}
    assert len(result) == len(rows), 'duplicate audit unit'
    return result


def total(rows):
    rows = list(rows)
    for row in rows:
        assert row['score_lower'] in SCORES and row['score_upper'] in SCORES
        assert 0 <= row['score_lower'] <= row['score_upper'] <= 1
        assert row['hard_verified'] == (row['score_lower'] == 1)
    lower_quarters = sum(round(row['score_lower'] * 4) for row in rows)
    upper_quarters = sum(round(row['score_upper'] * 4) for row in rows)
    return {
        'denominator': len(rows),
        'positive_units': sum(row['score_lower'] > 0 for row in rows),
        'full_contract_units': sum(row['score_lower'] == 1 for row in rows),
        'score_histogram': dict(sorted(Counter(str(row['score_lower']) for row in rows).items())),
        'equivalents_lower': lower_quarters / 4,
        'equivalents_upper': upper_quarters / 4,
        'percent_lower': 25 * lower_quarters / len(rows) if rows else None,
        'percent_upper': 25 * upper_quarters / len(rows) if rows else None,
        'positive_attachment_percent': 100 * sum(row['score_lower'] > 0 for row in rows) / len(rows) if rows else None,
    }


def build():
    upstream = json.loads(UPSTREAM.read_text())
    mapping = json.loads(MAPPING.read_text())
    source = unique(upstream['items'])
    units = unique(mapping['upstream_units'])
    assert source.keys() == units.keys(), 'mapping does not match final inventory'
    rc_source = unique(upstream['rc_keys'])
    rc = unique(mapping['rc_keys'])
    assert rc.keys() == rc_source.keys(), 'configuration scope mismatch'
    for key, row in units.items():
        assert (row['group'], row['scope']) == (source[key]['group'], source[key]['scope'])
    runtime = [row for row in units.values() if source[row['id']]['scope'] == 'runtime']
    public_rc = [row for row in rc.values() if rc_source[row['id']]['scope'] == 'public']
    primary = runtime + public_rc
    groups = {}
    for group, label in upstream['groups'].items():
        selected = [row for row in runtime if row['group'] == group]
        if group == 'pyplot_config_style':
            selected += public_rc
        groups[group] = {'label': label, **total(selected)}
    assert sum(row['denominator'] for row in groups.values()) == len(primary)
    assert sum(row['equivalents_lower'] for row in groups.values()) == total(primary)['equivalents_lower']
    excluded_core = {'other_backends_interaction', 'projections_toolkits'}
    core = [row for row in runtime if row['group'] not in excluded_core] + public_rc
    witnessed = [row for row in runtime if source[row['id']]['public_evidence'] != 'conventional_public_spelling'] + public_rc
    extended = list(units.values()) + public_rc
    attributes = [row for row in upstream['attributes'] if row['scope'] == 'runtime']
    lower = total(primary)['equivalents_lower']
    ambiguity = [row['id'] for row in primary if row['score_lower'] != row['score_upper']]
    history = mapping.get('historical_presence')
    history_summary = None
    if history:
        assert set(history['current_api_ids']) == {key for key, row in units.items() if row['score_upper'] > 0}
        assert set(history['current_rc_ids']) == {key for key, row in rc.items() if row['score_upper'] > 0}
        runtime_ids = {row['id'] for row in runtime}
        public_rc_ids = {row['id'] for row in public_rc}
        old_api = set(history['historical_api_ids']) & runtime_ids
        current_api = set(history['current_api_ids']) & runtime_ids
        old_rc = set(history['historical_rc_ids']) & public_rc_ids
        current_rc = set(history['current_rc_ids']) & public_rc_ids
        old_ids, current_ids = old_api | old_rc, current_api | current_rc
        history_summary = {
            'ref': history['ref'],
            'comparison_contract': history['comparison_contract'],
            'runtime_api': {'historical': len(old_api), 'current': len(current_api)},
            'public_rc': {'historical': len(old_rc), 'current': len(current_rc)},
            'primary_scope': {
                'denominator': len(primary),
                'historical_positive_units': len(old_ids),
                'current_positive_units': len(current_ids),
                'historical_presence_percent': 100 * len(old_ids) / len(primary),
                'current_presence_percent': 100 * len(current_ids) / len(primary),
                'presence_percentage_point_change': 100 * (len(current_ids) - len(old_ids)) / len(primary),
                'added_ids': sorted(current_ids - old_ids),
                'removed_ids': sorted(old_ids - current_ids),
            },
        }
    return {
        'date': '2026-10-24',
        'metric': 'Equal-weight canonical public API/configuration migration-equivalent index',
        'input_files': [
            {'path': str(path.relative_to(ROOT)), 'sha256': hashlib.sha256(path.read_bytes()).hexdigest()}
            for path in [UPSTREAM, MAPPING]
        ],
        'upstream_commit': upstream['upstream']['commit'],
        'port_baseline': mapping.get('port_baseline', mapping.get('port_head')),
        'primary_runtime_api_plus_public_rc': total(primary),
        'runtime_api_only': total(runtime),
        'public_rc_only': total(public_rc),
        'groups': groups,
        'scope_sensitivity': {
            'only_stub_or_documentation_witness_plus_public_rc': total(witnessed),
            'include_development_api_plus_public_rc': total(extended),
            'static_2d_svg_public_api_plus_rc_including_text_font': total(core),
            'additional_runtime_attribute_units': len(attributes),
            'attributes_zero_credit_denominator_sensitivity_percent': 100 * lower / (len(primary) + len(attributes)),
            'attribute_note': 'Fields are separately inventoried, not individually graded. This variant adds them without extra credit; it is a denominator sensitivity, not a verified estimate of field support.',
        },
        'grading_sensitivity': {
            'ambiguous_unit_ids': ambiguity,
            'all_partial_items_one_quarter_lower_percent': 100 * sum(max(0, row['score_lower'] - .25) if 0 < row['score_lower'] < 1 else row['score_lower'] for row in primary) / len(primary),
            'note': 'One-grade-down sensitivity tests grading policy. It is not a statistical confidence interval or a change to the published rubric.',
        },
        'history_presence_only': history_summary,
        'interpretation': 'Breadth and disclosed readiness under this API rubric; not engineering-hours completion, pixel fidelity, all valid Python executions, test coverage, or Moon source-line coverage.',
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    value = json.dumps(build(), indent=2, ensure_ascii=False) + '\n'
    if args.check:
        assert OUTPUT.read_text() == value, 'migration summary differs'
    else:
        OUTPUT.write_text(value)
    print(json.dumps(json.loads(value)['primary_runtime_api_plus_public_rc'], ensure_ascii=False))


if __name__ == '__main__':
    main()
