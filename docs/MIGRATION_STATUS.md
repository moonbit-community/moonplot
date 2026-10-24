# MoonPlot 当前执行检查点

更新时间：2026-10-24（Asia/Shanghai）。每次会话恢复先读本页，再执行下一项。

## 当前范围与用户决定

- 交付实用 MoonBit 画图库，以能力和完整绘图场景对齐，不再要求完整复刻 Matplotlib API。
- 当前 M1：基础二维 SVG 出图稳定，增加少量易用性功能；用户已选择该方向。
- Rabbita（原 Rabbit-TEA）交互 DOM 是单独大目标，不是 M1 前置条件。当前未实现。
- 复用现有 Scene → render IR → SVG；有第二后端实际需求再提取共享几何。
- 允许独立 subagents、本地分批 commit、正常 push 到 moonbit-community/moonplot。
- 历史百分比不作为当前目标进度。原 API 对比数据保留，不再恢复旧 D55 全 API 迁移。

## 当前切片 M1（实现与验收分开记录）

- [x] 能力清单、四大目标与独立Rabbita DOM设计已写，旧API路线/长执行历史归档。
- [x] 已定位三图错误：grid(axis="y") 与默认 which="both" 被错误拒绝，非自动刻度错误。
- [x] 已记录新回归的失败：native session 77020 terminal255/SIGABRT；ignored grid-red-native.log。
- [x] 四角 LegendPosition 与5测试已通过四目标行为验收，root facade另有直接使用回归。
- [x] grid 默认单轴选择修复与 3 个回归；B native/wasm-gc 各3/3、旧 Figure native31/31通过；原三图SVG解析通过，临时包已清理。
- [x] Root 已导出 LegendPosition、落地 cmd/gallery；新增根包基本常量数据流程测试。预览已生成，视觉发现bar越框正在修复。
- [x] 已通过check-all、相关新旧92/92×四目标、最终9/9×4、info/fmt；四份接口全文审毕，无新增warning。bar后续变更须补回归。
- [x] 三个示例 native exit0、SVG XML与计数检查；原preview逐字一致。
- [ ] 视觉发现新的真实柱状图缺陷：范围只包含center，漏柱宽，gallery两端越框遮刻度。B获授权修共享bar几何/范围，Root后续重验。视觉验收尚未通过。
- [ ] 更新能力清单、M1 验收记录、首页、路线图与 Rabbita DOM 具体接入设计。
- [ ] 按验证过的步骤提交并 push，核对远端 SHA。

## 精确下一动作与在途工作

Root 已全文审 legend/grid 变更；四目标 check→定向回归→info→fmt 首轮56710发现测试helper漏处理raise与公开枚举位于internal导致根包用户无法构造；Root已修helper，并将共享枚举owner移至公开core/legend.mbt，Scene/IR重导出。70508已terminal0：check-all0、定向92/92×4、info/fmt0。消除新枚举两条implicit-promotion警告，添加公开trait扩展及core/debug显式导入；83290已terminal0：final check（7旧警告0error）、新9/9×4、info/fmt、三个实际示例native0。四份mbti全文差异已审，均仅新增legend可选API。日志 .moonagent/checkpoints/M1-2026-10-24/。下一步等B修bar范围STOP，复核并跑相关SVG/Scene回归、重出gallery/真实视觉验收。
A/C均STOP，无live；B正在修M1视觉验收发现的bar/H范围缺陷，不动legend。Rabbita固定接口设计已落docs/RABBITA_DOM.md，依赖尚未安装。
B 所有会话均已 terminal，不能轮询旧 IDs。

## 基线与证据

- Git：master 跟踪 origin/master，已推送基线 189e7e8；origin 使用 SSH。
- D54 完整回归历史通过：wasm/wasm-gc/native 22233，JS 22240；不因本轮文档重跑无关日期/formatter 全套。
- 原 cmd/main、cmd/preview 已真实 native 运行，assets/two-series.* 是已核验输出。
- 上一轮 info/fmt/check-all 通过，7 条既有 Ref 警告，0 error；接口当时无变化。
- 当前新增/修改文件：legend 的 core公开值/Scene/IR/SVG 与测试、grid 与测试、根 types；文档/示例本轮待完成。
- 原三图失败源码：.moonagent/checkpoints/practical-library-probe-2026-10-24/。
- Rabbita 查阅固定 commit：c6bbd1b3b649d5f6ea6b21e6c42f8003ec41c367（moon.mod 0.16.7），源码在 .moonagent/upstream/rabbita-<commit>/。

[路线图](MIGRATION_PLAN.md) · [现有能力](CAPABILITIES.md) · [历史执行记录](archive/migration-status-through-2026-10-24.md) · [原 API 迁移计划](archive/migration-plan-api-history.md)
