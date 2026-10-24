# 安装与发布

当前分发模块为 **`Lampese/mathplotlib@0.2.1`**：核心绘图与 Rabbita 组件合并为一个 Mooncakes module。

本页安装命令对应 0.2.1；使用 [Mooncakes 模块页](https://mooncakes.io/docs/Lampese/mathplotlib)
查看 registry 版本。维护者使用 `tools/verify_registry.py` 从全新、无 `moon.work` 的应用
安装并验证静态四目标和真实浏览器交互。
GitHub [v0.2.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.2.0)
是此前两个模块的源码版本包，原附件与历史记录保留不变。

## 安装一个模块

在应用的模块目录运行：

```sh
moon add Lampese/mathplotlib@0.2.1
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

浏览器应用在 `moon.pkg` 中导入：

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

0.2.1 的源码版本包包含唯一库归档的解压目录 `library/` 和独立应用 `example/`。
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

| 早期路径 | 0.2.1 路径 |
| --- | --- |
| `mathplotlib/mathplotlib` | `Lampese/mathplotlib` |
| `mathplotlib/mathplotlib/drawing` | `Lampese/mathplotlib/drawing` |
| `mathplotlib/mathplotlib/scene` 等子包 | `Lampese/mathplotlib/scene` 等相同后缀 |
| `moonbit-community/moonplot-rabbita` | `Lampese/mathplotlib/rabbita`，建议别名 `@plot_dom` |
| 仓库 `adapters/rabbita/` | 仓库 `rabbita/` |

更新应用的 `moon.mod`，移除两个旧模块依赖，改为单个 `Lampese/mathplotlib@0.2.1`；
同步更新 `moon.pkg` 的包前缀。根包默认 alias 仍是 `@mathplotlib`，已有绘图方法调用无需改名。
浏览器组件显式写 `"Lampese/mathplotlib/rabbita" @plot_dom`，避免与 Rabbita 本身的 alias 冲突。
移除仅为两个旧模块建立的 workspace 条目；自己的其他 workspace 成员照常保留。

这次合并调整分发单位与导入路径，M2 的绘图、命中、SVG 资源作用域和交互范围保持不变。
[M2 验收记录](MILESTONE_M2.md)的 0.2.0 测试结果属于历史版本，不自动作为 0.2.1 发布证据。

## 0.2.1 本地发布前验收

- 合并后 `moon check --target all`、`moon info --target all`、`moon fmt` 通过。
- 全套测试：Wasm / Wasm-GC / Native 各 **22,264/22,264**，JS **22,285/22,285**（含 14 个交互适配测试）。
- 51 份接口仅模块路径变化，907 份 MoonBit 源码内容与合并前逐字节一致。
- Chrome 155 原双图 11 项、资源隔离 7 组通过，页面错误为 0；两份截图与原验收逐字节相同。
- 实际生产 ZIP 在仓库外的显式 workspace 中通过静态四目标与浏览器 5 项验收。
- dry-run 的解包 check 通过，服务端返回 `202 Accepted` 并明确说明 `No changes were made`。
  当前 CLI 将该非 200 状态误报为失败，日志退出码为 255；不把此预检记录为实际发布。

以上是本地与源码包验收；registry 实际发布与无 workspace 安装结果另由执行检查点记录。
