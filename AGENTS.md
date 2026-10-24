# Project Agents.md Guide

This is a [MoonBit](https://docs.moonbitlang.com) project.

## Work continuity

- At session start and after context compaction, read `docs/MIGRATION_STATUS.md`
  first. It is the execution checkpoint; `docs/MIGRATION_PLAN.md` describes scope
  and `docs/CAPABILITIES.md` describes current capabilities and acceptance.
  `docs/COMPATIBILITY.md` remains the detailed historical API reference.
- Resume the first unfinished task in the active slice. Read only the source
  and upstream sections needed for that task; do not restart the project survey
  or reconsider decisions already recorded as settled.
- After a meaningful implementation step or verification, update the checklist,
  exact next action, changed files, test results, and any live tool session IDs.
  Before compaction or handoff, leave these details current on disk.
- Keep implementation status separate from verification status. Mark a slice
  complete only after its acceptance checks pass. Repeat checks only when
  relevant changes or unresolved failures invalidate the recorded result.
- Preserve user decisions recorded in the checkpoint, including reasonable
  reuse of existing code. The user authorized local Git commits on 2026-10-23;
  commit coherent, verified steps as work progresses.

You can browse and install extra skills here:
<https://github.com/moonbitlang/skills>

## Project Structure

- MoonBit packages are organized per directory; each directory contains a
  `moon.pkg` file listing its dependencies. Each package has its files and
  blackbox test files (ending in `_test.mbt`) and whitebox test files (ending in
  `_wbtest.mbt`).

- In the toplevel directory, there is a `moon.mod` file listing module
  metadata.

- Keep the root package as a facade in `api.mbt`. Consumer tests belong in
  `tests/api`; process-global configuration tests use separate packages under
  `tests/integration`. Implementation and whitebox tests remain in their owning
  package. See `docs/ARCHITECTURE.md` for the source map.

- Split maintained MoonBit files by responsibility before they exceed 2,000
  lines. Move complete `///|` blocks without exposing private helpers merely to
  cross a file boundary. Generated resources and reference fixtures keep their
  provenance and regeneration commands. Run `python3 tools/check_structure.py`.

## Coding convention

- MoonBit code is organized in block style, each block is separated by `///|`,
  the order of each block is irrelevant. In some refactorings, you can process
  block by block independently.

- Try to keep deprecated blocks in file called `deprecated.mbt` in each
  directory.

## Tooling

- `moon fmt` is used to format your code properly.

- `moon ide` provides project navigation helpers like `peek-def`, `outline`, and
  `find-references`. See $moonbit-agent-guide for details.

- `moon info` is used to update the generated interface of the package, each
  package has a generated interface file `.mbti`, it is a brief formal
  description of the package. If nothing in `.mbti` changes, this means your
  change does not bring the visible changes to the external package users, it is
  typically a safe refactoring.

- In the last step, run `moon info && moon fmt` to update the interface and
  format the code. Check the diffs of `.mbti` file to see if the changes are
  expected.

- Run `moon test` to check tests pass. MoonBit supports snapshot testing; when
  changes affect outputs, run `moon test --update` to refresh snapshots.

- Prefer `assert_eq` or `assert_true(pattern is Pattern(...))` for results that
  are stable or very unlikely to change. For snapshot tests that record
  structured debugging output, derive `Debug` and use `debug_inspect`, rather
  than deriving `Show` for debugging. For solid, well-defined results (e.g.
  scientific computations), prefer assertion tests. You can use
  `moon coverage analyze > uncovered.log` to see which parts of your code are
  not covered by tests.
