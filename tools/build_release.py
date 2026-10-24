#!/usr/bin/env python3
"""Package the unified module, verify an external consumer, and assemble a source release."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import xml.etree.ElementTree as ET
import zipfile


ROOT = Path(__file__).resolve().parents[1]


def run(command, cwd, log):
    with log.open("w") as output:
        result = subprocess.run(command, cwd=cwd, stdout=output, stderr=subprocess.STDOUT)
    if result.returncode:
        raise RuntimeError(f"{command!r} failed; see {log}")


def run_static(target, workspace, output):
    with (output / f"consumer-static-{target}.log").open("w") as log:
        result = subprocess.run(["moon", "run", "example/cmd/static", "--target", target],
                                cwd=workspace, stdout=subprocess.PIPE, stderr=log)
    if result.returncode:
        raise RuntimeError(f"Static consumer failed for {target}; see consumer-static-{target}.log")
    root = ET.fromstring(result.stdout)
    if root.tag != "{http://www.w3.org/2000/svg}svg":
        raise RuntimeError(f"Static consumer did not produce SVG for {target}")
    (output / f"consumer-static-{target}.svg").write_bytes(result.stdout)


def module_version(path):
    return re.search(r'^version = "([^"]+)"', path.read_text(), re.M)[1]


def inspect_archive(path, required, core):
    with zipfile.ZipFile(path) as archive:
        names = archive.namelist()
        for name in names:
            parts = Path(name).parts
            if name.startswith("/") or ".." in parts:
                raise RuntimeError(f"Unsafe archive path: {name}")
            if any(part in {".git", ".moonagent", ".mooncakes", "_build", "target", "__pycache__"} for part in parts):
                raise RuntimeError(f"Development cache in archive: {name}")
            if name.endswith(("_test.mbt", "_wbtest.mbt", "moon.work")):
                raise RuntimeError(f"Test/workspace in library archive: {name}")
            if core and parts[0] in {"adapters", "tests", "scripts", "tools"}:
                raise RuntimeError(f"Development tree in core archive: {name}")
            if core and parts[0] == "testdata" and not name.startswith("testdata/packed/"):
                raise RuntimeError(f"Large reference data in archive: {name}")
        missing = set(required) - set(names)
        if missing:
            raise RuntimeError(f"Missing release files: {sorted(missing)}")
        return {
            "file": path.name,
            "bytes": path.stat().st_size,
            "uncompressed_bytes": sum(row.file_size for row in archive.infolist()),
            "files": len(names),
            "sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
        }


def bundle_readme(version):
    return f"""# MoonPlot {version}

This source release contains the actual Lampese/mathplotlib module package and a
consumer application. Static plotting and the JS-only rabbita subpackage are
published together. For registry installation use:

```sh
moon add Lampese/mathplotlib@{version}
```

Install the MoonBit toolchain and a C compiler for native execution. From this
directory (not an existing project), run:

```sh
moon run example/cmd/static --target native > chart.svg
moon build example/cmd/app --target js
python3 -m http.server 8765 --bind 127.0.0.1
```

Open http://127.0.0.1:8765/example/ . Hover or click points, toggle the series,
and update the data. Stop the server with Ctrl+C. No Python runtime is used by
the plotting library; Python only serves the browser example.

The explicit root moon.work links library/ and example/. The
library package has no hidden monorepo workspace. Copy the library directory into
your own workspace and list the module explicitly to integrate the source release;
example/moon.mod and example/cmd/app/moon.pkg show the versioned dependencies
and imports. Load library/rabbita/moonplot.css from your application's asset pipeline.

The rabbita subpackage supports only JS. Static core packages support all four
targets; installing the module also resolves its Rabbita dependencies. Native, wasm, wasm-gc and JS static consumers are tested.
The browser app is tested with Google Chrome and public Rabbita APIs.

See https://github.com/moonbit-community/moonplot/blob/v{version}/docs/TOOLTIPS.md
for acceptance, supported interactions and limits. Apache-2.0; additional notices
are in library/docs/THIRD_PARTY_NOTICES.md and library/docs/licenses/.
"""


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=ROOT / ".moonagent/checkpoints/release")
    parser.add_argument("--allow-dirty", action="store_true", help="Development rehearsal only; never upload these artifacts")
    args = parser.parse_args()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    # Never package an output directory back into the repository's own archive.
    if output.is_relative_to(ROOT) and output.relative_to(ROOT).parts[0] not in {".moonagent", "_build"}:
        raise RuntimeError("Use an ignored .moonagent/_build output directory, or one outside the repository")
    dirty = bool(subprocess.check_output(["git", "status", "--porcelain"], cwd=ROOT))
    source_commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
    if dirty and not args.allow_dirty:
        raise RuntimeError("Commit the release sources first (or rehearse with --allow-dirty)")
    version = module_version(ROOT / "moon.mod")
    module_name = re.search(r'^name = "([^"]+)"', (ROOT / "moon.mod").read_text(), re.M)[1]
    if module_name != "Lampese/mathplotlib":
        raise RuntimeError("Unexpected publication module name")
    artifacts = output / "artifacts"
    artifacts.mkdir(exist_ok=True)
    filename = module_name.replace("/", "-") + f"-{version}.zip"
    target = output / "module-build"
    print(f"Packaging {module_name} {version}", flush=True)
    run(["moon", "package", "--target-dir", str(target)], ROOT, output / "module-package.log")
    destination = artifacts / filename
    shutil.copyfile(target / "publish" / filename, destination)
    packages = [inspect_archive(destination, [
        "moon.mod", "README.mbt.md", "LICENSE", "api.mbt", "ticker/moon.pkg",
        "testdata/packed/logit_object_sort.base64", "testdata/packed/logit_sort.base64",
        "docs/THIRD_PARTY_NOTICES.md", "docs/licenses/LICENSE-MATPLOTLIB",
        "rabbita/moon.pkg", "rabbita/README.md", "rabbita/moonplot.css",
        "rabbita/view.mbt", "rabbita/svg_resources.mbt",
    ], core=True)]

    with tempfile.TemporaryDirectory(prefix=f"moonplot-v{version}-consumer-") as temporary:
        workspace = Path(temporary) / f"moonplot-v{version}"
        workspace.mkdir()
        with zipfile.ZipFile(destination) as archive:
            archive.extractall(workspace / "library")
        shutil.copytree(ROOT / "tests/consumer", workspace / "example", ignore=shutil.ignore_patterns(
            "_build", ".mooncakes", "__pycache__", "moon.work", "*.pyc",
        ))
        (workspace / "moon.work").write_text('members = [ "library", "example" ]\n')
        (workspace / "README.md").write_text(bundle_readme(version))
        shutil.copyfile(ROOT / "LICENSE", workspace / "LICENSE")
        # Freeze source inventory before compilation creates caches or fixtures.
        source_files = sorted(path for path in workspace.rglob("*") if path.is_file())
        for target in ["wasm", "wasm-gc", "js", "native"]:
            print(f"External static consumer: {target}", flush=True)
            run_static(target, workspace, output)
        print("External browser consumer: build + real browser", flush=True)
        run(["moon", "build", "example/cmd/app", "--target", "js"], workspace, output / "consumer-build.log")
        environment = dict(os.environ, MOONPLOT_CONSUMER_OUTPUT=str(output / "consumer-browser"))
        with (output / "consumer-browser.log").open("w") as log:
            subprocess.run(["node", str(ROOT / "tools/verify_release_consumer.cjs"), str(workspace)], cwd=ROOT,
                           env=environment, stdout=log, stderr=subprocess.STDOUT, check=True)
        bundle = artifacts / f"moonplot-v{version}-source.zip"
        with zipfile.ZipFile(bundle, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
            for path in source_files:
                archive.write(path, path.relative_to(workspace.parent))
        packages.append({
            "file": bundle.name, "bytes": bundle.stat().st_size, "files": len(source_files),
            "sha256": hashlib.sha256(bundle.read_bytes()).hexdigest(),
        })
    manifest = {
        "version": version,
        "source_commit": source_commit,
        "dirty_rehearsal": dirty,
        "delivery": "Single-module source distribution for Lampese/mathplotlib",
        "verification": {"static_targets": ["wasm", "wasm-gc", "js", "native"], "dom": "real browser external consumer"},
        "artifacts": packages,
    }
    if not args.allow_dirty:
        current_commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
        if current_commit != source_commit or subprocess.check_output(["git", "status", "--porcelain"], cwd=ROOT):
            raise RuntimeError("Release sources changed during verification; commit and rebuild")
    (artifacts / "release-manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    checksums = [(row["file"], row["sha256"]) for row in packages]
    checksums.append(("release-manifest.json", hashlib.sha256((artifacts / "release-manifest.json").read_bytes()).hexdigest()))
    (artifacts / "SHA256SUMS").write_text("".join(f"{digest}  {name}\n" for name, digest in checksums))
    print(json.dumps(manifest, indent=2))


if __name__ == "__main__":
    main()
