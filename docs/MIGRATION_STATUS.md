# MoonPlot 当前执行检查点

更新时间：2026-10-24（Asia/Shanghai）。恢复会话先读本页，再执行下一条未完成动作。

## 当前范围与用户决定

- 实用 MoonBit 画图库，以能力和完整绘图场景对齐，完整 Matplotlib API 复刻不是交付前提。
- M1：基础二维 SVG 稳定与少量易用性功能，**已完成验收**。
- 下一个独立大目标为用户要求的 Rabbita（原 Rabbit-TEA）交互 DOM，**尚未实现**，不是 M1 前置条件。
- 允许合理复用、独立 subagents、本地分批 commit、正常 push 到 moonbit-community/moonplot。
- 不恢复旧 D55 / 全 API 清单迁移，不用原 API 指数或历史估算表示当前整体完成率。

## M1 已完成并验证

- [x] 修复默认 `which="both"` 下 `grid(axis="x"/"y")` 的错误拒绝，保留旧 major/minor/legacy 入口。
- [x] `LegendPosition` 四角位置、Axes/Figure getter/setter，默认右上、clear/自动与显式条目、子图隔离均验证。共享枚举由公开 core 拥有，根包用户可直接使用。
- [x] 修复视觉验收发现的柱宽未计入自动范围。Bar/BarH 的数据范围与绘制共用宽度；包含单柱、非有限配对过滤、反向轴和对数边缘检查。
- [x] 最终 `moon check --target all` 通过，7 既有 Ref 警告/0 error；整个SVG后端+相关Scene/root回归四目标各353/353；info/fmt通过。新增14回归，旧expected/source JSON未改。
- [x] 4份预期mbti差异全文已审；柱宽私有修复后42份接口与已审版本逐字相同。
- [x] cmd/main、cmd/preview、cmd/gallery 最终native均exit0；SVG合法，原preview逐字一致。
- [x] Gallery 2折线/7散点/4柱及所有标签通过XML/有限数/面板几何检查；2400×840实际PNG视觉通过，柱形不再越框遮刻度。
- [x] 四大目标、现有能力、M1记录、README/指南与Rabbita接入设计已整理；旧长计划/执行历史归档。
- [x] 文档路线图已本地提交f4c0548，验证过的绘图实现已提交36e6710。
- [ ] Gallery/最终验收记录提交后，正常push并核对远端SHA。

## 精确下一动作

先完成本轮剩余Git提交和正常push，核对origin/master与HEAD相同、工作区干净。
随后当前里程碑可交付。下一功能切片是 [Rabbita DOM接入试验](RABBITA_DOM.md)：
隔离JS依赖与x版本，mount最小真实SVG节点树，再验证事件→消息→视图更新；不要先重写全部renderer。
当前所有agents STOP，无live工具、无用户阻塞。尚未添加Rabbita依赖或承诺具体DOM公共API。

## 验证证据与恢复约束

- Root最终session25840已terminal0。日志 `.moonagent/checkpoints/M1-2026-10-24/bar-final-*.log`；SVG检查结果svg-validation.json。
- 原grid失败native77020已terminal255；原柱宽4回归失败78098已terminal2，证据在 `.moonagent/checkpoints/practical-library-probe-2026-10-24/`，不是live。
- 首轮check曾发现公开枚举owner在internal不可由root用户构造，已移public core，后续四目标和root真实示例全部通过，不重查已修问题。
- 历史D54全套：nonJS22233/JS22240曾通过。本轮353定向回归不冒称重跑完整历史套件，不因文档变化重复无关日期/formatter审计。
- Git：master 跟踪 origin/master，origin使用SSH；本轮起始基线189e7e8。
- Rabbita固定查阅commit `c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367`（moon.mod0.16.7），源码研究已存ignored cache；具体约束和待验证项见设计。

[路线图](MIGRATION_PLAN.md) · [现有能力](CAPABILITIES.md) · [M1验收](MILESTONE_M1.md) · [历史执行记录](archive/migration-status-through-2026-10-24.md)
