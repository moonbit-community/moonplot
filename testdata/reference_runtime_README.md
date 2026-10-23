# Reference NumPy binary identity

Reference fixtures use CPython 3.12.14 and NumPy 2.3.5 on Darwin arm64. Some
older references pinned the app-bundled, signed NumPy core by its entire SHA256:
`44fdecc68c23ac6dd5825dc124c801086f7f68dc15ab008ed584ed6a47be6305`.
On 2026-10-23 the installed bundle instead contained
`b11f1ef3534cc6bb0a9c8141206350b27cadf48632c34acfcfc97ca6e700363e`.
The old signed file was unavailable locally. It was not reconstructed or silently
substituted, and the shared runtime was not modified.

The current core was compared byte-for-byte with NumPy's official
[macOS14 arm64 wheel](https://files.pythonhosted.org/packages/5b/e1/1ee06e70eb2136797abe847d386e7c0e830b67ad1d43f364dd04fa50d338/numpy-2.3.5-cp312-cp312-macosx_14_0_arm64.whl),
listed by [PyPI's 2.3.5 metadata](https://pypi.org/pypi/numpy/2.3.5/json).

| Artifact | SHA256 |
| --- | --- |
| Official wheel | `612a95a17655e213502f60cfb9bf9408efdc9eb1d5f50535cc6eb365d11b42b5` |
| Official `_multiarray_umath.cpython-312-darwin.so` | `96ce8cda1e4f1a3107e5c945b68bcd970c3de09019fc19beda4cc0319609de09` |
| Current signed core | `b11f1ef3534cc6bb0a9c8141206350b27cadf48632c34acfcfc97ca6e700363e` |

The official core has 3450392 bytes, the installed signed core 3466496 bytes.
Both code signatures start at byte3423488. Before that offset the only changed
bytes are1721,1722,1736,1737,2228,2229 (zero-based): `__LINKEDIT` segment sizes
and `LC_CODE_SIGNATURE` size fields. All executable and data bytes are identical.
Omitting those six size bytes and the signature yields SHA256
`78469d555f2f51398c743812ca4f42d93f5908f4493f4ba4c83b22a0958c6654`
for both. `codesign -dvv` identifies the current signature as OpenAI OpCo, LLC,
timestamp2026-10-22. This is evidence for packaging/signing differences from the
official wheel; the unavailable old44 file was not part of that byte comparison.

`generate_null_axis_reference.py` now accepts exactly the original44 and verified
currentb11 hashes; unknown files still fail. Its JSON records the actual binary
used. Regeneration changed only that runtime metadata field: all original source
inputs, values, errors, warnings and events compared equal to the previous JSON.
The D34 Logit Axis reference also regenerated and checked with identical JSON.
The two AutoMinor owner fixtures restore their source fixture's unchanged major
provider after a real scale reset; no expected tick values were weakened.

This does not certify arbitrary NumPy builds, refresh unrelated mathematical
profiles, or claim that every historic generator now accepts the new bundle.
Other strict guards remain authoritative for their own recorded fixtures.
