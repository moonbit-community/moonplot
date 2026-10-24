#!/usr/bin/env python3
"""Verify a published module from a fresh, workspace-free registry consumer."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import urllib.request
import xml.etree.ElementTree as ET
import zipfile

from build_release import ROOT, module_version, run


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--expected-archive", type=Path, required=True)
    parser.add_argument("--output", type=Path, default=ROOT / ".moonagent/checkpoints/Mooncakes-0.2.1/registry-consumer")
    args = parser.parse_args()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    version = module_version(ROOT / "moon.mod")
    module = "Lampese/mathplotlib"
    with urllib.request.urlopen("https://mooncakes.io/api/v0/manifest/" + module, timeout=30) as response:
        manifest = json.load(response)
    if manifest["module"] != module or manifest["version"] != version or manifest.get("yanked"):
        raise RuntimeError(f"Expected live registry version {module}@{version}")
    (output / "public-manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    with tempfile.TemporaryDirectory(prefix="moonplot-registry-consumer-") as temporary:
        root = Path(temporary)
        example = root / "example"
        shutil.copytree(ROOT / "tests/consumer", example, ignore=shutil.ignore_patterns(
            "_build", ".mooncakes", "moon.work", "__pycache__", "*.pyc",
        ))
        # Actually exercise the documented moon add, rather than relying on
        # a fixture's already-declared dependency or any workspace override.
        module_file = example / "moon.mod"
        module_file.write_text(module_file.read_text().replace(f'  "{module}@{version}",\n', ""))
        assert not any((parent / "moon.work").exists() for parent in [example, *example.parents])
        # A pure static app declares only MoonPlot. The interactive example
        # separately declares the Rabbita APIs that its own source imports.
        static = root / "static"
        shutil.copytree(example / "cmd/static", static / "cmd/static")
        (static / "moon.mod").write_text(
            'name = "moonplot-registry/static"\nversion = "0.2.1"\n'
        )
        run(["moon", "update"], static, output / "static-update.log")
        run(["moon", "add", f"{module}@{version}"], static, output / "static-add.log")
        run(["moon", "update"], example, output / "update.log")
        run(["moon", "add", f"{module}@{version}"], example, output / "add.log")
        run(["moon", "install"], example, output / "install.log")
        dependency = example / ".mooncakes" / module
        assert dependency.is_dir()
        assert not dependency.resolve().is_relative_to(ROOT)
        assert re.search(r'^name = "Lampese/mathplotlib"', (dependency / "moon.mod").read_text(), re.M)
        assert module_version(dependency / "moon.mod") == version
        # Check every installed archive file, not only the declared version.
        files = []
        with zipfile.ZipFile(args.expected_archive) as archive:
            for name in archive.namelist():
                data = archive.read(name)
                assert (dependency / name).read_bytes() == data, f"Registry source differs: {name}"
                files.append({"file": name, "sha256": hashlib.sha256(data).hexdigest()})
        (output / "installed-source-check.json").write_text(json.dumps(files, indent=2) + "\n")
        # This is an asset deployment directory, not a local module: no
        # moon.mod or moon.work is copied outside the new consumer project.
        css = root / "library/rabbita/moonplot.css"
        css.parent.mkdir(parents=True)
        shutil.copyfile(dependency / "rabbita/moonplot.css", css)
        for target in ["wasm", "wasm-gc", "js", "native"]:
            print(f"Registry static consumer: {target}", flush=True)
            with (output / f"static-{target}.log").open("w") as log:
                result = subprocess.run(["moon", "run", "cmd/static", "--target", target],
                                        cwd=static, stdout=subprocess.PIPE, stderr=log)
            if result.returncode:
                raise RuntimeError(f"Static registry consumer failed: {target}")
            assert ET.fromstring(result.stdout).tag == "{http://www.w3.org/2000/svg}svg"
            (output / f"static-{target}.svg").write_bytes(result.stdout)
        run(["moon", "build", "cmd/app", "--target", "js"], example, output / "browser-build.log")
        # Standalone builds omit the workspace module prefix. Stage that exact
        # generated JS at the example shell's URL for the shared browser runner.
        javascript = example / "_build/js/debug/build/cmd/app/app.js"
        deployed = root / "_build/js/debug/build/moonplot-release/consumer/cmd/app/app.js"
        deployed.parent.mkdir(parents=True)
        shutil.copyfile(javascript, deployed)
        environment = dict(os.environ, MOONPLOT_CONSUMER_OUTPUT=str(output / "browser"))
        with (output / "browser.log").open("w") as log:
            subprocess.run(["node", str(ROOT / "tools/verify_release_consumer.cjs"), str(root)],
                           cwd=ROOT, env=environment, stdout=log, stderr=subprocess.STDOUT, check=True)
        report = {
            "module": module, "version": version,
            "no_workspace_override": True,
            "static_application_imports_only": module,
            "browser_application_declares_framework": "moonbit-community/rabbita@0.16.7",
            "installed_archive_files_equal": len(files),
            "static_targets": ["wasm", "wasm-gc", "js", "native"],
            "browser": "5 real-browser consumer checks passed",
            "installed_source_location": str(dependency.resolve()),
        }
        (output / "report.json").write_text(json.dumps(report, indent=2) + "\n")
        print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
