#!/usr/bin/env python3
"""Generate core interfaces and retain compiler interfaces for JS-only packages."""

from pathlib import Path
import shutil
import subprocess


ROOT = Path(__file__).resolve().parents[1]


def main():
    subprocess.run(["moon", "info", "--target", "all"], cwd=ROOT, check=True)
    # With a Wasm preferred target, current Moon reports JS-only differences
    # but leaves their canonical files untouched. Retain the exact compiler
    # output rather than manually editing generated signatures.
    for manifest in sorted((ROOT / "rabbita").rglob("moon.pkg")):
        package = manifest.parent.relative_to(ROOT)
        compiled = ROOT / "_build/js/debug/check" / package / (package.name + ".mbti")
        if not compiled.is_file():
            raise RuntimeError(f"Missing generated JS interface: {compiled}")
        shutil.copyfile(compiled, manifest.parent / "pkg.generated.mbti")
    subprocess.run(["moon", "fmt"], cwd=ROOT, check=True)


if __name__ == "__main__":
    main()
