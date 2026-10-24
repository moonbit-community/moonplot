# M1：基础二维 SVG 可用版

验收日期：2026-10-24。**当前正在验收，结果尚未填入。**

## 本轮交付

- 修复默认 `which="both"` 时 `grid(axis="x"/"y")` 抛出 InvalidTicks 的问题。
- 增加 `LegendPosition::{UpperRight, UpperLeft, LowerRight, LowerLeft}` 与 Axes/Figure 的位置读写。
- 增加 `cmd/gallery` 折线、散点、分类柱状图组合；默认范围与刻度保留自动计算。
- 将现行计划收束为能力目标；原长迁移计划与执行历史保存在 archive/。

## 可复现的三个示例

在仓库根目录执行：

```sh
moon install
moon run cmd/main --target native > minimal.svg
moon run cmd/preview --target native > two-series.svg
moon run cmd/gallery --target native > gallery.svg
```

- `cmd/main`：最小折线。
- `cmd/preview`：双折线、散点、显式范围与刻度、图例。
- `cmd/gallery`：独立三面板、默认范围与刻度、分类标签、y 方向网格、左上角自动图例。

打开 SVG 即可查看。仓库中的 PNG 是由外部 SVG 工具生成的展示图，不是新增 PNG 输出后端。

## 新增易用性接口

```moonbit nocheck
let fig = @mathplotlib.figure()
fig.set_legend_position(@mathplotlib.LegendPosition::LowerLeft)
// 每个子图也可独立调用 axes.set_legend_position(...)
```

新建与完整 clear 后默认为 UpperRight。`clear_legend()` 恢复原有自动条目行为并保留位置。
显式图例条目、自动标签和已有 legend API 均沿用原行为。

## 验证记录

本节待 Root 统一执行后填写；不以实现文件存在代替通过记录。

## 实用边界与下一目标

M1 验收覆盖本页的代表性流程和相关输入；不意味着任意参数、图表组合都无问题。
图例暂为固定宽度、每行固定高度，长标签和非常小的画布仍需调用者合理安排布局。
SVG 字体由查看器提供，完整文字测量与自动避让尚未提供。

下一独立目标为 [Rabbita 可交互 DOM](RABBITA_DOM.md)。当前没有 DOM 输出 API，
也没有独立 PNG/PDF、3D 或完整 TeX 排版后端。
