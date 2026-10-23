# Explicit scale default parameters

This reference runs the complete original Matplotlib v3.11.2 LinearScale,
LogScale, SymmetricalLogScale, AsinhScale and LogitScale constructors/default
installers, necessary complete transform bases, and actual named ticker classes.
It uses the fixed CPython 3.12.14 / NumPy 2.3.5 runtime. Expected objects and
values are obtained from original source bodies, never from port constructors.

The scope is explicit installation for the five existing typed geometries.
It does not claim full named mutable scale classes, general log bases/subs,
function scales, constructor/clear/unit/secondary lifecycle or a renderer.
Existing geometry values remain the inputs: for example, the current SymLog
factory's default threshold1 is not replaced by Python SymLogScale's default2.
The original scale receives explicit matching geometry parameters in each case.

Pinned source hashes:

- scale.py: `4800482469b280454eb6e7a48f866ae7b146b27d1395644ffc09df0e91c9d7c1`
- ticker.py: `49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`
- transforms.py: `109bd2c25aa8395cd25c11a94a3ac78a6f0c6da3db04500f486cc3967a6be0e8`
- artist.py: `c55a81d86db60ab7b22fcd6e70401aa84558de5d1ba6e40a16c60f6f1f03be7a`

The shared Python loader `load_scale_defaults(ticker_path)` in
`generate_scale_defaults_reference.py` builds one actual ticker-class namespace
with real deprecation descriptors and RcParams validators. B/C lifecycle
references can reuse it without replacing source classes or installing another
class identity. Accepted earlier formatter-loader branches remain untouched.

Reproduce from the repository root:

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_scale_defaults_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_scale_defaults_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/ticker.py --check
```

The JSON contains 145 original-source observations and 112 generated
cases registered in four groups of at most 32. It includes 24 controlled setter
failure observations preserve exact source ordering/partial state; these are
diagnostic evidence and do not invent public user-setter callbacks in the port.
The controlled Asinh set sink executes original Artist._update_props in kwargs
order, rather than simulating a full Artist/Axis or alias normalization.

Cases cover both directions and independent minor-visible rc flags, classic
mode, Scalar constructor capture, exact fresh locator/formatter classes and
parameters, repeated installation and old versus newly captured rc state.
Asinh includes finite widths, NaN and positive infinity allowed by its existing
typed geometry. No new raw scale-parameter domain is inferred from these cases.

The installer preserves source operation order:

- Linear: major locator, major formatter, minor formatter, visibility decision,
  minor locator.
- Log, SymLog and Logit: major locator, major formatter, minor locator, minor
  formatter.
- Asinh: construct the three kwargs objects first, install major locator,
  minor locator, minor formatter, then construct/install major formatter.

The installer does not mark source default flags. Its caller does that only
after complete success, preserving the integrated lifecycle's partial states.
Lifecycle/default-flag and shared-Axes checks are separate references.

`AsinhSubsTuple` adds an immutable Double numeric tuple carrier. Construction
copies the owner; values() exports a copy; equality is handle identity. The
base-ten default uses one shared tuple handle with values 2,5, matching the
original auto tuple's sharing/immutability in the chosen numeric projection.
Its values are represented by Double, while original default tuple entries are
Python integers; outer arithmetic with source Float64 points is retained.
This does not expose Python's mutable auto_tick_multipliers class dictionary.
Cases cover constructor isolation, exported-array isolation, shallow locator
copy identity, empty set_params reset, and actual original tuple tick_values
results without tolerance. Existing Asinh Sequence/NdArray/Text/Number paths
and old generated fixtures were not rewritten.

Generation and `--check` passed. Five changed/new production files were
formatted using stdin-only moonfmt; formatting does not establish parsing or
type correctness. Root completed project compilation, interface review and four-target acceptance.
The initial full-suite fixture corrections and final coverage are documented in
[the integrated guide](scale_defaults_README.md).
