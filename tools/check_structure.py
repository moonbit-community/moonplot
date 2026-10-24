#!/usr/bin/env python3
"""Check the small facade and report maintained versus generated source sizes."""

import argparse
import json
from pathlib import Path
import subprocess


ROOT = Path(__file__).resolve().parents[1]
ROOT_FILES = {
    ".gitattributes", ".gitignore", "AGENTS.md", "LICENSE", "README.md",
    "README.mbt.md", "api.mbt", "moon.mod", "moon.pkg", "pkg.generated.mbti",
}
MAX_MAINTAINED_LINES = 2000


def source_report():
    paths = subprocess.check_output(
        ["git", "ls-files", "-z", "--cached", "--others", "--exclude-standard"],
        cwd=ROOT,
    ).decode().split("\0")
    sources = []
    root_files = []
    errors = []
    for name in sorted(set(paths) - {""}):
        path = ROOT / name
        if not path.is_file():
            continue
        if "/" not in name:
            root_files.append(name)
            if name not in ROOT_FILES:
                errors.append(f"{name}: move implementation or tests out of the facade root")
        if path.suffix != ".mbt":
            continue
        text = path.read_text()
        is_test = path.name.endswith(("_test.mbt", "_wbtest.mbt"))
        generated = any(
            line.startswith("// Generated") for line in text.splitlines()[:6]
        ) or (is_test and "_reference_" in path.name)
        entry = {
            "path": name,
            "lines": len(text.splitlines()),
            "bytes": path.stat().st_size,
            "generated": generated,
            "test": is_test,
        }
        sources.append(entry)
        if not generated and entry["lines"] > MAX_MAINTAINED_LINES:
            errors.append(
                f"{name}: {entry['lines']} maintained lines exceed {MAX_MAINTAINED_LINES}; "
                "split complete blocks by responsibility"
            )
    return {"root_files": root_files, "sources": sources, "errors": errors}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json", action="store_true", help="print the full source inventory")
    args = parser.parse_args()
    report = source_report()
    if args.json:
        print(json.dumps(report, indent=2))
    else:
        maintained = [row for row in report["sources"] if not row["generated"]]
        generated = [row for row in report["sources"] if row["generated"]]
        print(f"Facade root: {len(report['root_files'])} tracked files")
        print(f"Maintained MoonBit sources: {len(maintained)}; generated sources: {len(generated)}")
        for row in sorted(maintained, key=lambda row: row["lines"], reverse=True)[:5]:
            print(f"  {row['lines']:4} lines  {row['path']}")
        for error in report["errors"]:
            print("ERROR: " + error)
        if not report["errors"]:
            print("Structure checks passed.")
    raise SystemExit(bool(report["errors"]))


if __name__ == "__main__":
    main()
