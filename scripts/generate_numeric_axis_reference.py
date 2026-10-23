"""Pinned numeric axis/font heuristics with a stated dpi72 geometry fixture.

Executes original XAxis/YAxis.get_tick_space, Axis._get_tick_label_size,
FontProperties.set_size/get_size and FontManager.get_default_size AST bodies,
then the original MaxNLocator/AutoLocator against that context. The fixture
supplies already transformed Bbox dimensions in inches and a small rc map; it
does not claim to run Matplotlib transforms, full FontProperties or a renderer.
"""
from pathlib import Path
import argparse
import ast
import copy
import hashlib
import json
import math
import sys
import types
import warnings

from generate_auto_date_reference import formatted, moon
from generate_maxn_params_reference import load as load_maxn
from generate_multiple_locator_reference import clean, TICKER_SHA

ROOT = Path(__file__).resolve().parents[1]
AXIS_SHA = "f7bff99d2cffae77e75eea0fb942a2dd0d0fc28c702eccb540691bca736432b0"
FONT_SHA = "d0e464bd1aff8e1815d375aa8bfc6dd32869979b348d8ec3b82edd61b8288788"


class PhysicalBbox:
    def __init__(self, width=0., height=0.):
        self.width, self.height = width, height

    @staticmethod
    def unit():
        return PhysicalBbox()

    def transformed(self, transform):
        return transform


class AxesTransform:
    def __init__(self, owner):
        self.owner = owner

    def __sub__(self, unused_dpi_transform):
        return PhysicalBbox(self.owner.width / 72., self.owner.height / 72.)


def load(path):
    reference = load_maxn(path)
    axis_path = path.with_name("axis.py")
    font_path = path.with_name("font_manager.py")
    for source, sha in [(axis_path, AXIS_SHA), (font_path, FONT_SHA)]:
        if hashlib.sha256(source.read_bytes()).hexdigest() != sha:
            raise ValueError("pinned source differs: " + str(source))
    font_tree = ast.parse(font_path.read_text())
    scales = next(node for node in font_tree.body if isinstance(node, ast.Assign)
                  and any(isinstance(target, ast.Name) and target.id == "font_scalings" for target in node.targets))
    exec(compile(ast.Module(body=[scales], type_ignores=[]), str(font_path), "exec"), reference)
    for name, methods in [("FontProperties", {"set_size", "get_size"}),
                          ("FontManager", {"get_default_size"})]:
        cls = copy.deepcopy(next(node for node in font_tree.body if isinstance(node, ast.ClassDef) and node.name == name))
        cls.bases = []
        cls.decorator_list = []
        cls.body = [node for node in cls.body if isinstance(node, ast.FunctionDef) and node.name in methods]
        exec(compile(ast.Module(body=[cls], type_ignores=[]), str(font_path), "exec"), reference)
    reference["FontProperties"].get_size_in_points = reference["FontProperties"].get_size
    reference["mpl"].rcParams.update({"font.size": 10., "xtick.labelsize": "medium", "ytick.labelsize": "medium"})
    reference["mpl"]._val_or_rc = lambda value, key: reference["mpl"].rcParams[key] if value is None else value

    def font_properties(size):
        result = object.__new__(reference["FontProperties"])
        result.set_size(size)
        return result
    reference["mtext"] = types.SimpleNamespace(FontProperties=font_properties)
    reference["mtransforms"].Bbox = PhysicalBbox
    axis_classes = {node.name: node for node in ast.parse(axis_path.read_text()).body if isinstance(node, ast.ClassDef)}
    for source_name, cls, method in [("label", "Axis", "_get_tick_label_size"),
                                     ("x", "XAxis", "get_tick_space"), ("y", "YAxis", "get_tick_space")]:
        node = copy.deepcopy(next(node for node in axis_classes[cls].body if isinstance(node, ast.FunctionDef) and node.name == method))
        node.name = "original_axis_" + source_name
        exec(compile(ast.Module(body=[node], type_ignores=[]), str(axis_path), "exec"), reference)
    auto = next(node for node in ast.parse(path.read_text()).body if isinstance(node, ast.ClassDef) and node.name == "AutoLocator")
    exec(compile(ast.Module(body=[auto], type_ignores=[]), str(path), "exec"), reference)
    return reference


def context(reference, length, horizontal, size=10., bounds=(0., 20.), override=True):
    axis_name = "x" if horizontal else "y"
    instance = types.SimpleNamespace(width=length if horizontal else 1., height=1. if horizontal else length,
                                     bounds=bounds, _major_tick_kw={"labelsize": size} if override else {})
    instance.axes = types.SimpleNamespace(name="rectilinear", transAxes=AxesTransform(instance))
    instance.get_figure = lambda root=False: types.SimpleNamespace(dpi_scale_trans=object())
    instance.get_view_interval = lambda: instance.bounds
    instance._get_tick_label_size = types.MethodType(reference["original_axis_label"], instance)
    instance.get_tick_space = types.MethodType(reference["original_axis_" + axis_name], instance)
    return instance


def ticks(reference, kind, axis):
    locator = reference["AutoLocator"]() if kind == "auto" else reference["MaxNLocator"](nbins="auto")
    locator.set_axis(axis)
    return [float(value) for value in locator()]


def ownership(reference):
    rows = []
    for kind in ["maxn", "auto"]:
        a = context(reference, 360., True, bounds=(0., 20.))
        b = context(reference, 120., True, bounds=(100., 120.))
        locator = reference["AutoLocator"]() if kind == "auto" else reference["MaxNLocator"](nbins="auto")
        locator.set_axis(a)
        locator.set_axis(b)
        shallow = copy.copy(locator)
        stages = [dict(stage="last different axis", view=list(b.bounds), length=b.width,
                       original=[float(v) for v in locator()], copy=[float(v) for v in shallow()])]
        b.width = 60.; b.bounds = (200., 220.)
        stages.append(dict(stage="last owner length and view change", view=list(b.bounds), length=b.width,
                           original=[float(v) for v in locator()], copy=[float(v) for v in shallow()]))
        locator.set_axis(a)
        stages.append(dict(stage="original rebound while copy retains old owner", view=list(a.bounds), length=a.width,
                           original=[float(v) for v in locator()], copy=[float(v) for v in shallow()]))
        rows.append(dict(kind=kind, stages=stages))
    return rows


def generate(path):
    reference = load(path)
    specs = [(length, horizontal, size, True) for length in [0., 30., 120., 360.]
             for size in [-math.inf, 0., .5, 1., 10., 24., math.nan, math.inf]
             for horizontal in [True, False]]
    specs += [(240., True, None, False), (240., False, None, False),
              (240., True, "large", True), (240., False, "small", True)]
    for boundary in [30., 60., 90., 120.]:
        specs += [(math.nextafter(boundary, -math.inf), True, 10., True),
                  (math.nextafter(boundary, math.inf), True, 10., True)]
    noninteger_boundary = 12.7 * 3
    specs += [(math.nextafter(noninteger_boundary, -math.inf), True, 12.7, True),
              (noninteger_boundary, True, 12.7, True),
              (math.nextafter(noninteger_boundary, math.inf), True, 12.7, True)]
    code = """// Original numeric axis/font heuristics with supplied physical Bbox dimensions.
// Geometry is a dpi72 fixture; this does not execute Matplotlib transforms/rendering.

///|
fn verify_numeric_axis_values(actual : Array[Double], expected : Array[Double]) -> Unit raise {
  assert_eq(actual.length(), expected.length())
  for index, value in expected {
    if value.is_nan() { assert_true(actual[index].is_nan()) }
    else { assert_eq(actual[index].reinterpret_as_uint64(), value.reinterpret_as_uint64()) }
  }
}

///|
fn numeric_axis_label_size(svg : String, label : String, size : String) -> Bool {
  svg.split("<text").any(fragment => fragment.contains(">" + label + "<") && fragment.contains("font-size=\\\"" + size + "\\\""))
}
"""
    rows = []
    for index, (length, horizontal, size, override) in enumerate(specs):
        source = context(reference, length, horizontal, size=size, override=override)
        resolved = float(source._get_tick_label_size("x" if horizontal else "y"))
        space = float(source.get_tick_space())
        values_maxn = ticks(reference, "maxn", source)
        values_auto = ticks(reference, "auto", source)
        code += "\n///|\ntest " + moon("numeric axis original physical font profile " + str(index)) + " {\n"
        code += "  let previous_classic = @config.classic_mode()\n  defer { @config.set_classic_mode(previous_classic) }\n  @config.set_classic_mode(false)\n"
        code += "  let axis = @axis.axis()\n  axis.set_tick_layout(" + moon(length) + ", " + moon(horizontal) + ")\n"
        # Relative source names are observed through their numeric resolved size.
        # The typed API does not claim to migrate the whole font/rc string system.
        if override:
            supplied = resolved if isinstance(size, str) else size
            code += "  axis.set_tick_label_size(" + moon(supplied) + ")\n"
        code += "  verify_numeric_axis_values([axis.tick_label_size()], [" + moon(resolved) + "])\n"
        code += "  assert_eq(axis.get_tick_space(), " + moon(space) + ")\n  axis.set_limits(0.0, 20.0)\n"
        code += "  let maxn = @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto)\n  axis.set_locator(maxn.as_locator())\n"
        code += "  verify_numeric_axis_values(maxn.call(), " + moon(values_maxn) + ")\n"
        code += "  let auto = @ticker.AutoLocator::new()\n  axis.set_locator(auto.as_locator())\n"
        code += "  verify_numeric_axis_values(auto.call(), " + moon(values_auto) + ")\n}\n"
        rows.append(dict(length_points=length, horizontal=horizontal, input_size=size, explicit_override=override,
                         resolved_size=resolved, tick_space=space, maxn_ticks=values_maxn, auto_ticks=values_auto))
    profile_specs = [("auto8", 240., 10., True, (0., 20.)), ("auto4", 120., 10., True, (0., 20.)),
                     ("auto2", 60., 10., True, (0., 20.)), ("auto13", 400., 10., True, (0., 20.)),
                     ("auto6", 200., 10., True, (0., 20.)), ("auto3", 100., 10., True, (0., 20.)),
                     ("auto12", 360., 10., True, (0., 20.)), ("secondary_x", 240., 20., True, (0., 40.)),
                     ("secondary_y", 120., 20., False, (0., 40.)), ("secondary_owner", 240., 20., True, (100., 120.))]
    layout_fixtures = {}
    for name, length, size, horizontal, bounds in profile_specs:
        axis = context(reference, length, horizontal, size=size, bounds=bounds)
        layout_fixtures[name] = dict(length_points=length, size=size, horizontal=horizontal,
                                     bounds=list(bounds), tick_space=int(axis.get_tick_space()),
                                     auto_ticks=ticks(reference, "auto", axis))
    owner_rows = ownership(reference)
    code += scene_integration_code(layout_fixtures, owner_rows)
    payload = dict(ticker_source_sha256=TICKER_SHA, axis_source_sha256=AXIS_SHA, font_manager_source_sha256=FONT_SHA,
                   python=sys.version.split()[0], numpy=reference["np"].__version__,
                   profile="SVG user units are points, dpi72; x text aspect3, y2; font.size10, medium defaults",
                   harness_boundaries="Original selected AST methods; supplied post-transform Bbox dimensions and minimal rc map; no full FontProperties/transform/renderer execution; relative names mapped to resolved numeric size for typed API; nonfinite font fixtures only estimate ticks, not render glyphs",
                   source_bodies=["XAxis.get_tick_space", "YAxis.get_tick_space", "Axis._get_tick_label_size", "FontProperties.set_size", "FontProperties.get_size", "FontManager.get_default_size", "MaxNLocator", "AutoLocator"],
                   cases=rows, layout_fixtures=layout_fixtures, ownership_cases=owner_rows)
    return clean(payload), formatted(code)


def scene_integration_code(fixtures, owner_rows):
    text = SCENE_TESTS
    for name, row in fixtures.items():
        text = text.replace("__" + name.upper() + "__", moon(row["auto_ticks"]))
    for row in owner_rows:
        for index, stage in enumerate(row["stages"]):
            text = text.replace("__" + row["kind"].upper() + "_OWNER" + str(index) + "__", moon(stage["original"]))
            text = text.replace("__" + row["kind"].upper() + "_COPY" + str(index) + "__", moon(stage["copy"]))
    return text


SCENE_TESTS = r'''
///|
test "numeric scene geometry and rendered font size use the same points" {
  let previous = @config.classic_mode()
  defer { @config.set_classic_mode(previous) }
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=480, height=240)
  let axes = figure.add_axes(0.0, 0.0, 0.5, 0.5)
  axes.set_x_limits(0.0, 20.0)
  axes.set_y_limits(0.0, 20.0)
  let auto = @ticker.AutoLocator::new()
  axes.set_x_locator(auto.as_locator())
  axes.set_x_formatter(@ticker.format_str_formatter("ctx-x=%.1f"))
  axes.x_axis().set_tick_label_size(10.0)
  assert_eq(axes.x_axis().get_tick_space(), 8.0)
  assert_eq(axes.y_axis().get_tick_space(), 6.0)
  verify_numeric_axis_values(auto.call(), __AUTO8__)
  let first = figure.to_svg_checked()
  assert_true(numeric_axis_label_size(first, "ctx-x=0.0", "10"))
  axes.x_axis().set_tick_label_size(20.0)
  let updated = figure.to_svg_checked()
  assert_eq(axes.x_axis().get_tick_space(), 4.0)
  verify_numeric_axis_values(auto.call(), __AUTO4__)
  assert_eq(updated.split(">ctx-x=").count() - 1, 5)
  assert_true(numeric_axis_label_size(updated, "ctx-x=0.0", "20"))
}

///|
test "numeric physical dimensions manual positions and aspect update locator context" {
  let previous = @config.classic_mode()
  defer { @config.set_classic_mode(previous) }
  @config.set_classic_mode(false)
  for (width, height, expected) in [(120, 60, (4.0, 3.0)), (240, 120, (8.0, 6.0))] {
    let figure = @scene.figure(width~, height~)
    let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
    assert_eq(axes.x_axis().get_tick_space(), expected.0)
    assert_eq(axes.y_axis().get_tick_space(), expected.1)
  }
  let figure = @scene.figure(width=400, height=200)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_x_limits(0.0, 20.0)
  axes.set_y_limits(0.0, 20.0)
  let auto = @ticker.AutoLocator::new()
  axes.set_x_locator(auto.as_locator())
  assert_eq(axes.x_axis().get_tick_space(), 13.0)
  verify_numeric_axis_values(auto.call(), __AUTO13__)
  axes.set_aspect_equal()
  ignore(figure.to_svg_checked())
  assert_eq(axes.x_axis().get_tick_space(), 6.0)
  verify_numeric_axis_values(auto.call(), __AUTO6__)
  axes.set_aspect_auto()
  axes.set_position(0.0, 0.0, 0.25, 1.0)
  ignore(figure.to_svg_checked())
  assert_eq(axes.x_axis().get_tick_space(), 3.0)
  verify_numeric_axis_values(auto.call(), __AUTO3__)
}

///|
test "numeric shared owner active dimensions are installed before every panel queries ticks" {
  let previous = @config.classic_mode()
  defer { @config.set_classic_mode(previous) }
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=600, height=300)
  let axes = figure.subplots(1, 2, share_x=true)
  axes[0].set_position(0.0, 0.0, 0.6, 1.0)
  axes[1].set_position(0.7, 0.0, 0.2, 1.0)
  axes[1].set_box_aspect(aspect=5.0)
  axes[0].set_x_limits(0.0, 20.0)
  for axis in axes { axis.set_y_limits(0.0, 20.0) }
  let auto = @ticker.AutoLocator::new()
  axes[1].set_x_locator(auto.as_locator())
  axes[1].set_x_formatter(@ticker.format_str_formatter("ctx-shared=%.1f"))
  let external = auto.copy()
  let first = figure.to_svg_checked()
  assert_eq(axes[1].x_axis().get_tick_space(), 2.0)
  verify_numeric_axis_values(auto.call(), __AUTO2__)
  assert_eq(first.split(">ctx-shared=").count() - 1, 6)
  axes[1].remove()
  let updated = figure.to_svg_checked()
  verify_numeric_axis_values(auto.call(), __AUTO12__)
  verify_numeric_axis_values(external.call(), __AUTO2__)
  assert_eq(updated.split(">ctx-shared=").count() - 1, 9)
}

///|
test "numeric secondary axes use parent direction length and their own rendered font" {
  let previous = @config.classic_mode()
  defer { @config.set_classic_mode(previous) }
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=480, height=240)
  // This origin preserves the source supplied physical lengths through the real affine.
  let axes = figure.add_axes(0.25, 0.25, 0.5, 0.5)
  axes.set_x_limits(0.0, 20.0)
  axes.set_y_limits(0.0, 20.0)
  let secondary_x = axes.secondary_xaxis(x => x * 2.0, x => x / 2.0)
  let secondary_y = axes.secondary_yaxis(y => y * 2.0, y => y / 2.0)
  secondary_x.set_tick_label_size(20.0)
  secondary_y.set_tick_label_size(20.0)
  let x_auto = @ticker.AutoLocator::new()
  let y_auto = @ticker.AutoLocator::new()
  secondary_x.set_locator(x_auto.as_locator())
  secondary_y.set_locator(y_auto.as_locator())
  secondary_x.set_formatter(@ticker.format_str_formatter("ctx-secondary-x=%.1f"))
  secondary_y.set_formatter(@ticker.format_str_formatter("ctx-secondary-y=%.1f"))
  // Source physical profile is positioned; constructor geometry is full figure.
  ignore(figure.to_svg_checked())
  assert_eq(secondary_x.get_tick_space(), 4.0)
  assert_eq(secondary_y.get_tick_space(), 3.0)
  axes.x_axis().set_tick_label_size(40.0)
  axes.y_axis().set_tick_label_size(5.0)
  assert_eq(secondary_x.get_tick_space(), 4.0)
  assert_eq(secondary_y.get_tick_space(), 3.0)
  let svg = figure.to_svg_checked()
  verify_numeric_axis_values(x_auto.call(), __SECONDARY_X__)
  verify_numeric_axis_values(y_auto.call(), __SECONDARY_Y__)
  assert_true(numeric_axis_label_size(svg, "ctx-secondary-x=0.0", "20"))
  assert_true(numeric_axis_label_size(svg, "ctx-secondary-y=0.0", "20"))
}

///|
test "numeric calls resolve automatic views and copied callbacks propagate checked range errors" {
  let previous_classic = @config.classic_mode()
  let previous_mode = @config.axes_autolimit_mode()
  defer { @config.set_classic_mode(previous_classic); try! @config.set_axes_autolimit_mode(previous_mode) }
  @config.set_classic_mode(false)
  @config.set_axes_autolimit_mode("data")
  let figure = @scene.figure(width=240, height=120)
  let axes = figure.add_axes(0.0, 0.0, 1.0, 1.0)
  axes.set_margins(0.0, 0.0)
  axes.plot([0.0, 20.0], [0.0, 1.0])
  let auto = @ticker.AutoLocator::new()
  axes.set_x_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), __AUTO8__)
  let copied = auto.copy()
  let failing = @ticker.LinearLocator::new(numticks=2)
  axes.set_x_locator(failing.as_locator())
  @config.set_axes_autolimit_mode("round_numbers")
  // Replacing a locator or changing rc does not request a view recomputation.
  // The prior call consumed the plot request; explicitly enter view_limits.
  axes.request_autoscale_view(axis="x", tight=false)
  assert_true(try { ignore(copied.call()); false } catch { @core.DataError::InvalidTicks(..) => true; _ => false })
  @config.set_axes_autolimit_mode("data")
  verify_numeric_axis_values(copied.call(), __AUTO8__)
}

///|
test "numeric MaxN and Auto shared handles follow last unshared owner view and physical width" {
  let previous = @config.classic_mode()
  defer { @config.set_classic_mode(previous) }
  @config.set_classic_mode(false)
  for use_auto in [false, true] {
    let figure = @scene.figure(width=600, height=300)
    let a = figure.add_axes(0.0, 0.0, 0.6, 1.0)
    let b = figure.add_axes(0.6, 0.0, 0.2, 1.0)
    a.set_x_limits(0.0, 20.0)
    b.set_x_limits(100.0, 120.0)
    a.set_y_limits(0.0, 1.0)
    b.set_y_limits(0.0, 1.0)
    let auto = @ticker.AutoLocator::new()
    let state = if use_auto { auto.as_maxn_locator() } else { @ticker.MaxNLocator::new(nbins=@ticker.MaxNBins::Auto) }
    let adapter = if use_auto { auto.as_locator() } else { state.as_locator() }
    a.set_x_locator(adapter)
    b.set_x_locator(adapter)
    a.set_x_formatter(@ticker.format_str_formatter("ctx-owner-A=%.1f"))
    b.set_x_formatter(@ticker.format_str_formatter("ctx-owner-B=%.1f"))
    let copied = state.copy()
    verify_numeric_axis_values(state.call(), __AUTO_OWNER0__)
    assert_eq(a.x_axis().tick_values_checked(@core.limits(0.0, 20.0)), __AUTO_OWNER0__)
    let first = figure.to_svg_checked()
    assert_true(!first.contains(">ctx-owner-A="))
    assert_eq(first.split(">ctx-owner-B=").count() - 1, 5)
    b.set_position(0.6, 0.0, 0.1, 1.0)
    b.set_x_limits(200.0, 220.0)
    verify_numeric_axis_values(state.call(), __AUTO_OWNER1__)
    a.set_x_locator(adapter)
    verify_numeric_axis_values(state.call(), __AUTO_OWNER2__)
    verify_numeric_axis_values(copied.call(), __AUTO_COPY2__)
    let rebound = figure.to_svg_checked()
    assert_eq(rebound.split(">ctx-owner-A=").count() - 1, 9)
    assert_true(!rebound.contains(">ctx-owner-B="))
  }
}

///|
test "numeric handle rebound to secondary reads secondary range and label size" {
  let previous = @config.classic_mode()
  defer { @config.set_classic_mode(previous) }
  @config.set_classic_mode(false)
  let figure = @scene.figure(width=480, height=240)
  // This origin preserves the source supplied physical lengths through the real affine.
  let axes = figure.add_axes(0.25, 0.0, 0.5, 0.5)
  axes.set_x_limits(0.0, 20.0)
  axes.set_y_limits(0.0, 1.0)
  let auto = @ticker.AutoLocator::new()
  axes.set_x_locator(auto.as_locator())
  axes.set_x_formatter(@ticker.format_str_formatter("ctx-primary=%.1f"))
  let secondary = axes.secondary_xaxis(x => x + 100.0, x => x - 100.0)
  secondary.set_tick_label_size(20.0)
  secondary.set_locator(auto.as_locator())
  secondary.set_formatter(@ticker.format_str_formatter("ctx-rebound-secondary=%.1f"))
  // Resolve positioned frame and mapped own view before the direct owner query.
  let svg = figure.to_svg_checked()
  verify_numeric_axis_values(auto.call(), __SECONDARY_OWNER__)
  assert_true(!svg.contains(">ctx-primary="))
  assert_eq(svg.split(">ctx-rebound-secondary=").count() - 1, 5)
  axes.set_x_locator(auto.as_locator())
  verify_numeric_axis_values(auto.call(), __AUTO8__)
  let rebound = figure.to_svg_checked()
  assert_eq(rebound.split(">ctx-primary=").count() - 1, 9)
  assert_true(!rebound.contains(">ctx-rebound-secondary="))
}
'''


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ticker", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    with warnings.catch_warnings():
        warnings.simplefilter("ignore", RuntimeWarning)
        payload, code = generate(args.ticker)
    for path, text in {ROOT / "testdata/numeric_axis_reference.json": json.dumps(payload, indent=2, allow_nan=False) + "\n",
                       ROOT / "scene/numeric_axis_context_test.mbt": code}.items():
        if args.check:
            if not path.exists() or path.read_text() != text:
                raise SystemExit("reference differs: " + str(path))
        else:
            path.write_text(text)
    print("Numeric axis reference:", len(payload["cases"]), "font/physical profiles,", len(payload["layout_fixtures"]),
          "layout fixtures,", len(payload["ownership_cases"]), "ownership traces")


if __name__ == "__main__":
    main()
