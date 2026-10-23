# LogFormatter family: Axis reference

D33 integration is accepted with the complete four-target project suite and
all four new source checks passing. This focused reference
covers explicitly installed LogFormatter, LogFormatterExponent,
LogFormatterMathtext and LogFormatterSciNotation. It preserves original Axis
behavior without claiming the complete implicit default formatter lifecycle,
dynamic Python runtime or GUI/Text/TeX rendering.

## Context and cache lifecycle

LogFormatter's `set_locs` ignores its argument and does not assign retained
locations. None, an empty array and a nonempty view still prepare labels from
the axis context. A batch enumerates its supplied values independently of that
retained locations field. This differs from Scalar/Eng preparation: empty
Log batches refresh eligibility. NullLocator skips the entire group before the
formatter batch, so its cache remains unchanged.

Preparation first examines the initial minor threshold. Positive or negative
infinity clears sublabel filtering and returns without any axis access. With
an explicit non-None object linthresh, preparation reads only the view. Otherwise
it first attempts the transform's linthresh attribute, catches AttributeError
only around that attempt, and then reads the view outside that catch. A view
AttributeError or another probe error propagates. Failures preserve any older
cache until a source branch actually replaces it.

`FormatterAxisBinding::bind_transform_linthresh` provides the optional live
attribute, `clear_transform_linthresh` removes it, and `transform_linthresh`
returns None if absent. This public probe does not swallow errors; the Log
preparation stage owns the original AttributeError fallback. Primary Axis
bindings read the current Scale's symlog threshold on each probe. They do not
capture the scale at construction. Secondary and dummy bindings have no such
attribute. A secondary's function transform does not inherit a parent's
symlog linthresh, including when its own view crosses zero.

Changing the view, transform, axis binding, base or threshold options alone does
not update cached sublabels. Direct calls keep that cache until the next
preparation. Copies share the current cache object and context references;
preparation replaces only the receiver's cache. The reference compares logical
set membership and size, rather than inventing an ordering for the source set.

## Direct, batch and draw order

Base LogFormatter and Exponent read a view only after zero, label-only and
cached-coefficient gates allow the value. Mathtext and SciNotation direct calls
do not read an axis. All four short methods use native `%-12g` with trailing
whitespace removed; they require neither a view nor Scalar's physical cursor
provider. Offset is inherited Formatter's constant empty string.

`format_data` temporarily disables label-only mode with the complete original
context manager and restores it after success or error. It still obeys cached
sublabel filtering. Original `cbook.strip_math` supplies the plain result; it
is not replaced with a general math renderer or ad-hoc literal fallback.

The actual Axis pipeline formats every raw major value before querying and
formatting minor values, then selects visible ticks. An offscreen NaN can fail
the major formatter before any minor callback. Locations are not assigned just
because a batch was invoked. Source errors carry their original class and
message through the checked Core path.

Complete Axis.draw still asks the current major formatter for offset when
locators are Null. The four Log kinds return empty without context, but the
general live offset ordering matters when a minor callback replaces the major
formatter with a FuncFormatter carrying a new offset. The new handle's text
must be read after both batches. The existing named render chain supplies that
ordering and shared-axis ownership.

Shared setters retain one live axis identity. A second setter does not clear
the formatter cache; its next preparation uses that axis's local view. Original
Figure removal rebinds the installed formatter to the first remaining sibling.
A detached copy retains the removed owner's view and its own cache binding.
The source reference covers both x and y for all four classes.

## Evidence, grouping and reproduction

The generator uses the complete original four classes, real Formatter/API and
deprecation helpers, original `_is_close_to_int`, `_nonsingular`,
`cbook._setattr_cm` and `strip_math`. It executes original Axis formatter
installation, `_update_ticks`, Axis.draw, Bbox interval getters, real scale
transforms, SecondaryAxis `_set_scale`/`_set_lims`, Grouper and Figure removal.
Known units, Text storage, renderer calls and label-layout sinks are explicit.
No Moon formatter implementation generates expected labels or lifecycle order.

There are 200 original observations: 174 successes, 18 ValueErrors and
8 AttributeErrors. These include 40 actual primary/secondary transform profiles,
32 complete draw profiles, 16 shared/removal stages and 12 live-threshold/cache
stages. Each case keeps its own cleanup and id. Seven registered groups of at
most 32 cases retain all assertions while avoiding the Wasm test-initializer
local-variable limit. Two additional hand tests check public probe behavior
and actual primary/secondary/dummy binding. Shared default locations modified
by a fixture are restored even if its assertions fail.

Using the fixed Python interpreter, generate and then check:

```text
scripts/generate_log_formatter_axis_reference.py TICKER [--check]
```

Matplotlib is pinned at commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`. `ticker.py` SHA256 is
`49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad`.
JSON contains all four ClassDef hashes and the other exact dependency hashes.
Runtime is fixed CPython 3.12.14 / NumPy 2.3.5 Darwin arm64. Independent numeric
source/mathematical profiles and any differing labels are recorded by the
separate numeric references; these Axis expectations are not edited to match
the port. No new runtime Python/NumPy dependency is introduced.

The optional transform attribute does not expose arbitrary Python reflection
or custom exception subclasses. Raw dynamic scalar containers, multidimensional
locations, full scale-default installation and complete GUI/font/TeX lifecycle
remain separate documented domains. No data/minpos/tickspace/projection or
generic full-transform provider is invented for this family.
