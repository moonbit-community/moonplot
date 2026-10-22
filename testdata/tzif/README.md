# IANA TZif test fixtures

These public-domain zone files are compiled from IANA **2026e** data using
`zic (tzcode) 2026e -b fat`. They are test inputs, not a production database.
The checked-in binary files and generated `*_test.mbt` Bytes literals permit
all four targets to run without filesystem or network access. `manifest.json`
records each zone file's SHA-256. The generated literals also contain small
synthetic v2 files for leap-table rejection, offset validation, rule-only
zones, empty footers and transitions outside the supported calendar.

Pinned sources:

- [tzdata2026e.tar.gz](https://data.iana.org/time-zones/releases/tzdata2026e.tar.gz)
  SHA-256 `b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652`
- [tzcode2026e.tar.gz](https://data.iana.org/time-zones/releases/tzcode2026e.tar.gz)
  SHA-256 `cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54`

To regenerate, extract both archives into one directory, compile `zic`, then
run from this repository root (replace `/path/to/iana-2026e` below):

```sh
make -C /path/to/iana-2026e zic
/path/to/iana-2026e/zic -b fat -d /path/to/iana-2026e/zoneinfo \
  /path/to/iana-2026e/northamerica /path/to/iana-2026e/europe \
  /path/to/iana-2026e/australasia
python3 scripts/generate_tzif_fixtures.py /path/to/iana-2026e/zoneinfo
```

The fixtures cover America/New_York (v2, historical seconds and US DST),
Europe/Paris (PMT +00:09:21), Australia/Lord_Howe (half-hour DST and southern
seasons), and America/Nuuk (v3 signed transition hours). Golden civil values
were also cross-checked with Python `zoneinfo.ZoneInfo.from_file` on these
same bytes. Tests assert exact values, transition boundaries, gaps/folds,
far-future rules, recurrence, auto ticks and scene/pyplot SVG labels.
