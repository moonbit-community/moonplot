# 安装与发布

当前源码目标模块为 **`Lampese/mathplotlib@0.6.0`**：核心绘图与 Rabbita 组件合并为一个 Mooncakes module。
新增[图表悬停与提示](TOOLTIPS.md)包括柱形、直方图、饼图、折线横轴吸附和自定义格式。
0.4.0 接续[热图单元格、分组/堆叠柱与环形图](M3_CHARTS.md)，新示例为 `rabbita/charts.html`。

0.5.0 接续[统计图与区间交互](STATISTICS.md)，新示例为 `rabbita/statistics.html`。
0.6.0 接续[矩形网格与二维计数交互](MESH_INTERACTION.md)，新示例为 `rabbita/grids.html`。
本页安装命令对应 0.6.0；使用 [Mooncakes 模块页](https://mooncakes.io/docs/Lampese/mathplotlib)
查看 registry 版本。维护者使用 `tools/verify_registry.py` 从全新、无 `moon.work` 的应用
安装并验证静态四目标和真实浏览器交互。
GitHub [v0.2.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.2.0)
是此前两个模块的源码版本包，原附件与历史记录保留不变。

## 安装一个模块

在应用的模块目录运行：

```sh
moon add Lampese/mathplotlib@0.6.0
```

静态出图只需在对应 executable 的 `moon.pkg` 导入根包：

```moonbit nocheck
import {
  "Lampese/mathplotlib",
}
```

```moonbit nocheck
fn main raise {
  let fig = @mathplotlib.figure(width=640, height=400)
  fig.set_title("Measurements")
  fig.plot([1.0, 2.0, 3.0], [2.0, 5.0, 4.0])
  println(fig.to_svg_checked())
}
```

将示例放入应用的 main package 后，按实际路径运行，例如：

```sh
moon run cmd/main --target native > chart.svg
```

运行 native 需 C 编译器；Wasm、Wasm-GC、JS 静态输出可按应用目标选择。
Python 不属于绘图库运行时依赖。

## 同一模块中的浏览器组件

浏览器应用会直接调用 Rabbita 框架 API。若应用尚未声明 Rabbita 框架，先运行：

```sh
moon add moonbit-community/rabbita@0.16.7
```

这声明的是应用直接调用的框架 API；MoonPlot 自身仍只发布一个模块。
Moon 不允许应用仅凭传递依赖直接导入框架。随后在 `moon.pkg` 中导入：

```moonbit nocheck
import {
  "Lampese/mathplotlib",
  "Lampese/mathplotlib/drawing",
  "Lampese/mathplotlib/rabbita" @plot_dom,
  "moonbit-community/rabbita",
  "moonbit-community/rabbita/html",
}
```

`@plot_dom.view(figure.to_drawing(), id=..., on_event=...)` 返回可组合的 Rabbita `Html`。
Rabbita 子包及其 browser executable 声明 `supported_targets = "js"`，静态 facade、
Scene、Drawing 与 SVG renderer 不导入 UI 包，公开模型中没有 UI 类型。

Mooncakes 的依赖声明在 module 层。因此安装统一模块时也会解析 Rabbita 及其传递依赖；
选择静态根包不会编译或链接 JS 组件。统一 module 不再使用独立 adapter 的依赖缓存或局部 `moon.work`。
固定 Rabbita `0.16.7`；其传递依赖会将统一依赖图中的 `moonbitlang/x` 解析到至少 `0.5.1`。
这不改变静态绘图 API 的平台边界。

应用负责 hover/selection/visibility/data 状态，并在 `rabbita.new` 的 builder 内创建状态。
样式可从安装包的 `rabbita/moonplot.css` 复制到应用静态资源；路径由应用的服务方式决定。
完整接入、事件、坐标与资源隔离契约见 [组件指南](../rabbita/README.md)。

## 从仓库运行示例

从仓库根目录运行，无需建立额外 workspace：

```sh
moon run cmd/preview --target native > chart.svg
moon build rabbita/cmd/demo --target js
python3 -m http.server 8765 --bind 127.0.0.1
```

打开 [双图交互示例](http://127.0.0.1:8765/rabbita/)。资源冲突专项示例先运行
`moon build rabbita/cmd/resources --target js`，然后打开
[资源隔离示例](http://127.0.0.1:8765/rabbita/resources.html)。
HTTP 服务的根目录必须是仓库根目录，示例会从根目录的 `_build` 读取 JavaScript。

## 从源码版本包运行

源码版本包包含唯一库归档的解压目录 `library/` 和独立应用 `example/`。
根 `moon.work` 显式列出 `library`、`example`，不指向原仓库，也不包含隐藏的 adapter workspace。
从解压根目录运行：

```sh
moon run example/cmd/static --target native > chart.svg
moon build example/cmd/app --target js
python3 -m http.server 8765 --bind 127.0.0.1
```

打开 [独立应用](http://127.0.0.1:8765/example/)。应用使用公开版本依赖与包导入，
组件 CSS 来自 `library/rabbita/moonplot.css`。这是显式源码 workspace 路线；
Mooncakes 安装路线只依赖 registry，不需要这个 workspace。
独立消费验收应分别检查实际源码归档和无 `moon.work` 的全新 registry 应用。

## 从早期模块路径迁移

| 早期路径 | 当前路径 |
| --- | --- |
| `mathplotlib/mathplotlib` | `Lampese/mathplotlib` |
| `mathplotlib/mathplotlib/drawing` | `Lampese/mathplotlib/drawing` |
| `mathplotlib/mathplotlib/scene` 等子包 | `Lampese/mathplotlib/scene` 等相同后缀 |
| `moonbit-community/moonplot-rabbita` | `Lampese/mathplotlib/rabbita`，建议别名 `@plot_dom` |
| 仓库 `adapters/rabbita/` | 仓库 `rabbita/` |

更新应用的 `moon.mod`，移除两个旧模块依赖，改为单个 `Lampese/mathplotlib@0.4.0`；
同步更新 `moon.pkg` 的包前缀。根包默认 alias 仍是 `@mathplotlib`，已有绘图方法调用无需改名。
浏览器组件显式写 `"Lampese/mathplotlib/rabbita" @plot_dom`，避免与 Rabbita 本身的 alias 冲突。
移除仅为两个旧模块建立的 workspace 条目；自己的其他 workspace 成员照常保留。

这次合并调整分发单位与导入路径，M2 的绘图、命中、SVG 资源作用域和交互范围保持不变。
[M2 验收记录](MILESTONE_M2.md)的 0.2.0 测试结果属于历史版本，不自动作为 0.2.1 发布证据。

## 历史：0.2.1 发布验收

- 合并后 `moon check --target all`、`moon info --target all`、`moon fmt` 通过。
- 全套测试：Wasm / Wasm-GC / Native 各 **22,264/22,264**，JS **22,285/22,285**（含 14 个交互适配测试）。
- 51 份接口仅模块路径变化，907 份 MoonBit 源码内容与合并前逐字节一致。
- Chrome 155 原双图 11 项、资源隔离 7 组通过，页面错误为 0；两份截图与原验收逐字节相同。
- 实际生产 ZIP 在仓库外的显式 workspace 中通过静态四目标与浏览器 5 项验收。
- dry-run 的解包 check 通过，服务端返回 `202 Accepted` 并明确说明 `No changes were made`。
  当前 CLI 将该非 200 状态误报为失败，日志退出码为 255；不把此预检记录为实际发布。

### 实际发布与 registry 验收

`Lampese/mathplotlib@0.2.1` 已于 2026-10-24 实际发布，服务器返回 **200 OK**。
公开 manifest 返回版本 0.2.1、构建成功、包可用且未撤回。

全新的仓库外项目在没有 `moon.work` 的情况下执行 `moon add`，安装到的 **486 个文件**
与正式生产 ZIP 逐一相同。纯静态应用只声明 MoonPlot，四目标 SVG 通过；
独立浏览器应用声明其直接使用的 Rabbita 框架，JS 构建和 Chrome 155 的 **5 项**交互/响应式检查通过，页面错误为 0。

正式包源码提交为 `e5393b9cffacb84105e947adb8c8e81776af083b`。
registry 验证工具随后补齐了应用框架声明的检查；绘图与交互源码没有后续修改。
本地证据保存在忽略目录 `.moonagent/checkpoints/Mooncakes-0.2.1/`。
复现 registry 消费时，下载对应版本的模块 ZIP 作为 `--expected-archive`，并从当前仓库运行：

```sh
PLAYWRIGHT_MODULE=/path/to/node_modules/playwright \
  python3 tools/verify_registry.py --expected-archive /path/to/Lampese-mathplotlib-0.2.1.zip
```

工具需要 Playwright 和已安装的 Google Chrome（或 `BROWSER_CHANNEL=bundled`）。
它分别建立纯静态和浏览器消费者，真实安装 registry 包，核对源文件并运行应用；
不会用本地库 workspace 替代 registry。测试临时 HTTP 与浏览器均会关闭。
