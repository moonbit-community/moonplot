# 安装与发布

本次发布目标为 **`Lampese/mathplotlib@0.10.0`**：核心绘图与 Rabbita 组件合并为一个 Mooncakes module。
0.10.0功能、独立复审与中央最终均通过，尚未实际发布；上一正式0.9.0可安装且实际registry/GitHub核验已完成。
新增[图表悬停与提示](TOOLTIPS.md)包括柱形、直方图、饼图、折线横轴吸附和自定义格式。
0.4.0 接续[热图单元格、分组/堆叠柱与环形图](M3_CHARTS.md)，新示例为 `rabbita/charts.html`。

0.5.0 接续[统计图与区间交互](STATISTICS.md)，新示例为 `rabbita/statistics.html`。
0.6.0 接续[矩形网格与二维计数交互](MESH_INTERACTION.md)，新示例为 `rabbita/grids.html`。
0.7.0 接续[六边形分箱](HEXBIN_INTERACTION.md)与[小提琴分布](VIOLIN_INTERACTION.md)，
同时修正旧 hexbin 分桶与轮廓错位；新示例为 `rabbita/distributions.html`。
0.8.0 接续[Step](STEP_INTERACTION.md)、[Stairs](STAIRS_INTERACTION.md)与[ECDF](ECDF_INTERACTION.md)的原采样、区间及概率提示，
新示例为 `rabbita/discrete.html`。0.9.0接续[Stem原样本、实际杆段与圆头](STEM_INTERACTION.md)，新示例为 `rabbita/stems.html`。0.10.0接续[Quiver原位置与U/V分量](QUIVER_INTERACTION.md)，新示例为 `rabbita/vectors.html`。下方安装命令对应本次0.10.0发布目标；使用 [Mooncakes 模块页](https://mooncakes.io/docs/Lampese/mathplotlib)
查看 registry 版本。维护者使用 `tools/verify_registry.py` 从全新、无 `moon.work` 的应用
安装并验证静态四目标和真实浏览器交互。
GitHub [v0.2.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.2.0)
是此前两个模块的源码版本包，原附件与历史记录保留不变。

## 安装一个模块

在应用的模块目录运行：

```sh
moon add Lampese/mathplotlib@0.10.0
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

更新应用的 `moon.mod`，移除两个旧模块依赖，改为单个 `Lampese/mathplotlib@0.10.0`；
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

## 0.7.0 分布图发布验收

2026-10-25 已实际发布 `Lampese/mathplotlib@0.7.0`，服务端200 OK，公开构建成功且包可安装。
正式源码提交 `f5b55cda898e359cc839109c19044d73131e59b5`；[GitHub v0.7.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.7.0)
的模块ZIP、独立源码应用ZIP、manifest和SHA256SUMS均已完整回下载，逐字、远端摘要/大小与tag提交核对通过。

- 全套：Wasm/Wasm-GC/Native各22452/22452，JS22489/22489；新分布图Chrome13项与既有四例53项通过，均0页面错误。
- clean正式包在仓库外通过静态四目标与Chrome17项；实际registry全新应用同样通过，543份安装源文件与正式模块ZIP逐一相同。
- 模块ZIP：1980179 bytes，SHA256 `920a2a33c74f2797879ac295e76ccffd9289bb02af8bca6511d2afd6361fc2db`。
- 独立源码ZIP：2005511 bytes，SHA256 `3b83615a8969d2ae7c8afb93465ae68a49d800af79c6f6461333274ddb210e7e`。

[六角格](HEXBIN_INTERACTION.md)修正了旧真实分箱错误，中心、计数、聚合组与SVG会必要变化；
[小提琴](VIOLIN_INTERACTION.md)的KDE采样与各统计部位有独立身份。静态入口签名保留，穷尽匹配HitKind需处理新增分支。

## 0.8.0 离散曲线发布验收

功能、独立复审与中央验收已完成；2026-10-25实际发布返回200，公开构建成功且包可安装。
静态签名和14份旧SVG保持；Step原sample、Stairs原interval与ECDF实际returned slot通过同次绘制进入提示。

- 全套：Wasm/Wasm-GC/Native各22488/22488，JS22531/22531；info/fmt、八JS构建、结构与文档链接通过。
- 八个Chrome示例98项通过，页面错误为0；新离散例14项含实际整数事件可定位的原端点、横竖/填充切换、压缩、独立显隐/更新/重挂载、375px与CSS半径。
- 修复后仓库外dirty演练静态四目标+Chrome23项通过；包含两/三重复Step的物理命中与横轴吸附、ECDF末尾零权重重合返回槽。
- 独立复审：Step端点往返Native/JS各810次与各12控制；Stairs各29组、22实际XML/5000几何包含；ECDF各28组/26实际XML及最终source-tie bounded各26组。

正式源码提交`2f7aeb77c70499979b43273d1ea8a0b0504ba040`；clean正式包与全新registry应用均通过静态四目标/Chrome23，555份安装源逐一相同。
[GitHub v0.8.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.8.0)四附件已完整下载并核验逐字、远端digest/size与tag源码提交。

- 模块ZIP2087347 bytes，SHA256 `4588b872d933110fec36b2498ff30bcf96d61d2ae570b5532c7dbf33d0b7be43`。
- 独立源码ZIP2117382 bytes，SHA256 `e4e18ace990bdb00af49aec8a5aa870acd67a9a19419d883dd85681ebcd02367`。

所有dirty演练包仅保留开发记录，实际发布只使用clean正式归档；旧版本tag和附件不变。

## 0.9.0 Stem 发布验收

Stem原样本、真实杆段和圆头通过既有字段进入默认/自定义提示；旧签名、Unit返回、Container/N+2 artist及10份旧Stem/14份离散SVG保持。

- 四目标定向各133/133、adapter38/38；Root三组合四目标各3/3与dirty包静态四目标/Chrome25通过。
- 中央全套Wasm/Wasm-GC/Native各22505/22505、JS22550/22550；info/fmt/九JS构建、结构和40份MD/488本地链接通过。
- 九个真实Chrome示例110项通过、0errors；新Stem三卡12项含原索引洞、非零起点正负值、actual rod/head组件、clip、Area、显隐/更新/重挂载、CSS与375px。
- 独立Native/JS各23公开组、各8实际SVG与23个真实primitive匹配、旧Native8份SVG逐字、Scene2+context1组全部通过，11个生产源hash与中央匹配。
- 正式源码`95a34c3dc154f48fb3b83b7f37ecad3a0e8273c8`，clean包与全新无workspace registry均通过静态四目标/Chrome25；560份安装源与正式ZIP逐一相同。
- 实际publish200、公开success/has_package=true/yanked=false；[GitHub v0.9.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.9.0)四附件完整下载逐字、远端digest/size与tag源码SHA全部通过。
- 模块ZIP2179542bytes，SHA256 `352a7d165124952f0d13bf988e60c9927991c88a1a1d8fbcced6fbfa008562c5`。
- 独立源码ZIP2212594bytes，SHA256 `99934cca03b701938b30fe18acf0a42844b5ffb9fa6509002b3acf26e52d3a39`。

正式构建至网络验收闭环未改tracked文件；dirty演练包未上传。

## 0.10.0 Quiver 发布验收（候选）

实际箭杆与双箭翼带原tail X/Y、原i和只读VectorInfo U/V；通用value明确原V。双mode只physical，open head不增加填面或横轴吸附。原签名/Unit/Container/非finite整call校验与旧SVG保持。

Root外部dirty演练静态四目标/Chrome28项、三组合四目标各3/3、三个独立旧SVG逐字已通过；dirty包不上传。
- 定向W/WG/JS各155、Native156、Rabbita40全部通过；24份同target旧/新SVG逐字。Native golden限定本target，未以libm末位差误报生产回归。
- 独立Native/JS各18公开组、各8XML41targets、Native8旧SVG、Scene2+Backend2通过；14生产SHA与中央匹配。
- 中央Wasm/Wasm-GC各22520、Native22521、JS22567；十页面Chrome122项/0errors、三个SVG、42MD/498本地链接、info/fmt/10JS builds和结构全部通过。
- clean正式包、实际Mooncakes全新安装与GitHub四附件完整下载尚待，未完成项目不算发布。
