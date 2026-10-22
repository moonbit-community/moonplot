"""Observe shared Index ownership using real Grouper and subplot join ordering.

GridSpec.subplots, Axes.sharex/sharey, Axis setters and Figure._remove_axes run
their pinned AST bodies. Layout cells, finite local data and labeling/event
sinks are controlled; no grouping, ordering or binding method is replaced.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import json
import sys
import types
import weakref

from generate_auto_date_reference import formatted, moon
from generate_index_axis_reference import load as load_binding, HASHES as BINDING_HASHES

ROOT = Path(__file__).resolve().parents[1]
HASHES = {
    **BINDING_HASHES,
    "cbook.py": "e7ffc8b1d5c3892ab28bb2dcce71924df6192d0674023c8d891f99994b863643",
    "gridspec.py": "df8395306765d9b93f98d6b2e867836a9b2b0786cf5b39a26103309c4331afde",
    "axes/_base.py": "ceff4d2fa9bd99eb1451a27812bef343902384dd592a9b8482f31b2eac55f36b",
}


def load(directory):
    namespace = load_binding(directory)
    namespace["weakref"] = weakref
    for filename, sha in HASHES.items():
        if hashlib.sha256((directory / filename).read_bytes()).hexdigest() != sha:
            raise ValueError("pinned source differs: " + filename)

    def run(node, filename):
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(directory / filename), "exec"), namespace)

    def original_class(filename, name, methods=None):
        node = copy.deepcopy(next(node for node in ast.parse((directory / filename).read_text()).body
                                  if isinstance(node, ast.ClassDef) and node.name == name))
        if methods is not None:
            node.bases, node.decorator_list = [], []
            node.body = [part for part in node.body if isinstance(part, ast.FunctionDef) and part.name in methods]
        run(node, filename)

    original_class("cbook.py", "Grouper")
    check = next(node for node in ast.parse((directory / "_api/__init__.py").read_text()).body
                 if isinstance(node, ast.FunctionDef) and node.name == "check_in_list")
    run(check, "_api/__init__.py")
    namespace["_api"].check_in_list = namespace["check_in_list"]
    original_class("axes/_base.py", "_AxesBase", {"sharex", "sharey"})
    original_class("gridspec.py", "GridSpecBase", {"subplots"})
    return namespace


def fixtures(source):
    class Formatter(source["TickHelper"]):
        def _set_locator(self, locator):
            self.last_locator = locator

    class Axis(source["Axis"]):
        def __init__(self, name, data):
            self.name, self.data, self._scale = name, data, None
            self.major = types.SimpleNamespace(locator=source["IndexLocator"](1., 0.), formatter=Formatter())
            self.minor = types.SimpleNamespace(locator=source["IndexLocator"](2., 0.), formatter=Formatter())
            self.major.locator.set_axis(self)
            self.minor.locator.set_axis(self)

        def get_data_interval(self):
            return self.data

    class Axes(source["_AxesBase"]):
        def __init__(self, figure, sharex=None, sharey=None):
            index = len(figure.created)
            self.index = index
            self._sharex = self._sharey = None
            self._shared_axes, self._twinned_axes = figure.groups, figure.twins
            self.xaxis = Axis("axis" + str(index) + ".x", (10. * index, 10. * index + 2.))
            self.yaxis = Axis("axis" + str(index) + ".y", (1000. + 10. * index, 1002. + 10. * index))
            self._axis_names, self._axis_map = ["x", "y"], {"x": self.xaxis, "y": self.yaxis}
            self.xview = self.yview = (0., 1.)
            if sharex is not None:
                self.sharex(sharex)
            if sharey is not None:
                self.sharey(sharey)

        def get_xlim(self): return self.xview
        def get_ylim(self): return self.yview
        def set_xlim(self, first, last, **kwargs): self.xview = (first, last)
        def set_ylim(self, first, last, **kwargs): self.yview = (first, last)
        def get_autoscalex_on(self): return True
        def get_autoscaley_on(self): return True
        def _label_outer_xaxis(self, **kwargs): pass
        def _label_outer_yaxis(self, **kwargs): pass

    class Figure(source["FigureBase"]):
        def __init__(self):
            self.created = []
            self.groups = {name: source["Grouper"]() for name in ["x", "y"]}
            self.twins = source["Grouper"]()
            self._axobservers = types.SimpleNamespace(process=lambda *args: None)
            self._root_figure = types.SimpleNamespace(canvas=types.SimpleNamespace(release_mouse=lambda *args: None))

        def add_subplot(self, spec, **kwargs):
            axes = Axes(self, **kwargs)
            self.created.append(axes)
            return axes

    class Grid(source["GridSpecBase"]):
        def __init__(self, figure, rows, columns):
            self.figure, self._nrows, self._ncols = figure, rows, columns

        def __getitem__(self, index):
            return index

    return Figure, Grid


def source_case(source, figure_type, grid_type, rows, columns, mode, removed, hosts):
    figure = figure_type()
    host_axes = []
    for _ in range(hosts):
        created = grid_type(figure, rows, columns).subplots(sharex=mode, sharey=mode, squeeze=False)
        host_axes.append(list(created.flat))
    axes = figure.created
    for ax in axes:
        for axis in [ax.xaxis, ax.yaxis]:
            axis.set_major_locator(source["IndexLocator"](1., 0.))
            axis.set_minor_locator(source["IndexLocator"](2., 0.))
    copies = []
    for ax in axes:
        pair = [copy.copy(ax.xaxis.get_major_locator()), copy.copy(ax.yaxis.get_major_locator())]
        for locator in pair:
            locator.set_params(base=2.)
        copies.append(pair)
    active = axes[:]
    initial_orders = {name: [[member.index for member in group] for group in grouper]
                      for name, grouper in figure.groups.items()}

    def query(locator):
        return dict(owner=locator.axis.name, ticks=[float(value) for value in locator()])

    def snapshot(stage):
        return dict(stage=stage, active=[dict(axis=ax.index,
                    major_x=query(ax.xaxis.get_major_locator()), major_y=query(ax.yaxis.get_major_locator()),
                    minor_x=query(ax.xaxis.get_minor_locator()), minor_y=query(ax.yaxis.get_minor_locator())) for ax in active],
                    external_copies=[dict(axis=index, x=query(pair[0]), y=query(pair[1])) for index, pair in enumerate(copies)])

    stages = [snapshot("installed")]
    removals = []
    for index in removed:
        ax = axes[index]
        siblings = {name: [other.index for other in grouper.get_siblings(ax, include_self=False)]
                    for name, grouper in figure.groups.items()}
        figure._remove_axes(ax, owners=[active, host_axes[index // (rows * columns)]])
        stages.append(snapshot("removed " + str(index)))
        ax.xaxis.data = (ax.xaxis.data[0], ax.xaxis.data[0] + 4.)
        ax.yaxis.data = (ax.yaxis.data[0], ax.yaxis.data[0] + 4.)
        stages.append(snapshot("updated detached " + str(index)))
        removals.append(dict(axis=index, source_remaining_siblings=siblings))
    return dict(rows=rows, columns=columns, mode=mode, hosts=hosts, removed=removed,
                initial_grouper_orders=initial_orders, removals=removals, stages=stages)


def emit_checks(stage):
    code = ""
    for row in stage["active"]:
        index = row["axis"]
        for field, axis, level in [("major_x", "x", "locator"), ("major_y", "y", "locator"),
                                   ("minor_x", "x", "minor_locator"), ("minor_y", "y", "minor_locator")]:
            expression = "axes[" + str(index) + "]." + axis + "_axis()." + level + "().unwrap().index_locator().unwrap().call()"
            code += "  assert_eq(" + expression + ", " + moon(row[field]["ticks"]) + ")\n"
    for row in stage["external_copies"]:
        index = row["axis"]
        for axis in ["x", "y"]:
            code += "  assert_eq(copies_" + axis + "[" + str(index) + "].call(), " + moon(row[axis]["ticks"]) + ")\n"
    return code


def emit_case(case, host, serial):
    mode = {"all": "All", "row": "Row", "col": "Column"}[case["mode"]]
    rows, columns = case["rows"], case["columns"]
    code = "\n///|\ntest " + moon("Index actual Grouper order " + str(serial) + " " + host + " " + case["mode"] + " remove " + str(case["removed"])) + " {\n"
    code += "  let figure = @scene.figure()\n"
    for host_index in range(case["hosts"]):
        suffix = str(host_index)
        if host == "SubFigure":
            code += "  let outer_" + suffix + " = figure.grid_spec(1, " + str(case["hosts"]) + ")\n"
            code += "  let sub_" + suffix + " = figure.add_subfigure(outer_" + suffix + ".cell_spec(0, " + suffix + "))\n"
            code += "  let grid_" + suffix + " = sub_" + suffix + ".subplot_spec().subgridspec(" + str(rows) + ", " + str(columns) + ")"
        else:
            code += "  let grid_" + suffix + " = figure.grid_spec(" + str(rows) + ", " + str(columns) + ")"
        code += ".with_shared_axes(@gridspec.ShareMode::" + mode + ", @gridspec.ShareMode::" + mode + ")\n"
        code += "  let axes_" + suffix + " = " + ("sub_" + suffix if host == "SubFigure" else "figure") + ".subplots_with_grid(grid_" + suffix + ")\n"
    if case["hosts"] == 1:
        code += "  let axes = axes_0\n"
    else:
        code += "  let axes : Array[@scene.Axes] = []\n"
        for host_index in range(case["hosts"]):
            code += "  for axis in axes_" + str(host_index) + " { axes.push(axis) }\n"
    code += "  for index, axis in axes {\n    let start = Double::from_int(index) * 10.0\n    axis.plot([start, start + 2.0], [1000.0 + start, 1002.0 + start])\n"
    for axis in ["x", "y"]:
        code += "    axis.set_" + axis + "_locator(@ticker.IndexLocator::new(base=1.0, offset=0.0).as_locator())\n"
        code += "    axis.set_" + axis + "_minor_locator(@ticker.IndexLocator::new(base=2.0, offset=0.0).as_minor_locator())\n"
    code += "  }\n"
    for axis in ["x", "y"]:
        code += "  let copies_" + axis + " = axes.map(axis => axis." + axis + "_axis().locator().unwrap().index_locator().unwrap().copy())\n"
        code += "  for locator in copies_" + axis + " { locator.set_params(base=2.0) }\n"
    code += emit_checks(case["stages"][0])
    for removal, index in enumerate(case["removed"]):
        owner = "sub_" + str(index // (rows * columns)) if host == "SubFigure" else "figure"
        code += "  " + owner + ".delaxes(axes[" + str(index) + "])\n"
        code += emit_checks(case["stages"][2 * removal + 1])
        start = 10. * index
        code += "  axes[" + str(index) + "].plot([" + moon(start + 4.) + "], [" + moon(1004. + start) + "])\n"
        code += emit_checks(case["stages"][2 * removal + 2])
    return code + "}\n"


def generate(directory):
    source = load(directory)
    figure_type, grid_type = fixtures(source)
    specs = []
    for rows, columns, mode in [(1, 3, "all"), (1, 4, "all"), (2, 2, "all"),
                                (2, 3, "row"), (3, 2, "col")]:
        for removed in range(rows * columns):
            specs.append((rows, columns, mode, [removed]))
    specs += [(1, 4, "all", order) for order in [[0, 1, 3], [1, 0, 3], [3, 0, 1], [3, 2, 1]]]
    specs += [(2, 4, "row", [3, 0, 1]), (4, 2, "col", [6, 0, 2])]
    cases = []
    code = "// Generated from actual Grouper/GridSpec/Axes.share*/Axis setter/Figure removal AST.\n"
    for host in ["Figure", "SubFigure"]:
        for rows, columns, mode, removed in specs:
            case = source_case(source, figure_type, grid_type, rows, columns, mode, removed, hosts=1)
            case["moon_host"] = host
            code += emit_case(case, host, len(cases))
            cases.append(case)
    for mode, rows, columns in [("row", 2, 3), ("col", 3, 2)]:
        case = source_case(source, figure_type, grid_type, rows, columns, mode, [rows * columns + 2], hosts=2)
        case["moon_host"] = "SubFigure"
        code += emit_case(case, "SubFigure", len(cases))
        cases.append(case)
    payload = dict(source_hashes=HASHES, python=sys.version.split()[0], numpy=source["np"].__version__,
                   source_methods=["cbook.Grouper entire class", "GridSpecBase.subplots", "_AxesBase.sharex", "_AxesBase.sharey",
                                   "Axis.set_major_locator", "Axis.set_minor_locator", "TickHelper.set_axis", "FigureBase._remove_axes"],
                   fixture_boundaries="real source Grouper/order/share/binding/removal; controlled layout cell objects, finite local data, label and event sinks; two source grids share one real Grouper for multi-SubFigure cases",
                   cases=cases)
    return payload, formatted(code)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    payload, code = generate(args.ticker.parent)
    outputs = {ROOT / "testdata/index_shared_order_reference.json": json.dumps(payload, indent=2) + "\n",
               ROOT / "scene/index_shared_order_test.mbt": code}
    for path, text in outputs.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    print("Index shared order reference:", len(payload["cases"]), "traces/tests,",
          sum(len(case["stages"]) for case in payload["cases"]), "stages,",
          sum(len(case["removed"]) for case in payload["cases"]), "removals")


if __name__ == "__main__":
    main()
