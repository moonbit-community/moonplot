# MoonPlot 当前执行检查点

更新时间：2026-10-26。用户要求“先把现在的事情发个新版本”。现有功能已发布0.18.0，
本轮结束后不再自主开启新图类或新milestone；用户已指出编号粒度过碎。

## 已实际交付0.18.0

正式源 `ec1e176414fdfc830b2d830df0e378a2d9bbb79f`，Mooncakes Lampese/mathplotlib@0.18.0构建成功可安装；
GitHub v0.18.0四附件完整下载/大小/digest/tag已核同。全新registry无workspace覆盖，
全部安装源逐一同正式ZIP，四静态/Chrome63和9新bar整数事件通过。
finalaudit确认formal builder至网络audit全程HEAD/gitclean不变后解除freeze，才写本次交付后文档。

功能：[极坐标柱形／玫瑰图](POLAR.md)。必填单scalar弧度角宽、center/zero-bottom/fill-only，
full2π真圆；原θ/r/i/calllabel、缺失保洞、径上限裁剪保rawr。来源guard与静态角宽独立，
两mode实际填面/逐panelcircle，仅newBar上的laterPolar物理overlay；默认与中文提示/clip/响应式。
无新Info、stack/bottom/可变宽数组或雷达填面。

验证：own四目标38，Drawing四目标65，public数学Native/JS各6SVG和426明确区域查询，
双卡14checks/27整数请求组/69实际handler events与375通过。独立复审发现真实east bounds舍入失败，
Root修后Native/JS原反例过；剩余工作因子代理额度错误由Root完成，不冒称完整独立验收。
中央四目标全套和16页面Chrome204/0errors、三静态、实际info/fmt/结构/docs通过。

全部日志、源码SHA、失败before与正式归档留ignored `.moonagent/checkpoints/M17-polar-bars/`，
实际delivery-final-audit.json和release-live.json为网络终态。历史细节见
[0.18完整记录](archive/migration-status-through-2026-10-26-m17.md)和
[0.17记录](archive/migration-status-through-2026-10-26-m16.md)。

## 精确下一动作与现场

完成本次交付后文档检查/commit/push，向用户报告0.18.0并停止扩展；不启动下一片。
Root无发布/验证live；8765预览服务如仍运行可保留，未声称前台tab已经刷新。
按用户要求已删25份D30–D54 tracked.tar，5304166400bytes，删除前逐blob同保存Git commit；
HEAD/接口/日志保留，ignored archive-cleanup.json给恢复命令。不再生成这种重复整仓tar。
master，SSH origin git@github.com:moonbit-community/moonplot.git，README symlink/单module/
核心不importUI/RabbitaJS-only及pins0.16.7/XML0.5.0保持。
[能力](CAPABILITIES.md) · [安装](PUBLISHING.md) · [本次验收](MILESTONE_M17.md)


## 2026-10-29 toolchain compatibility audit

- Scope: preserve 0.18.0 plotting behavior while migrating removed `try?`, deprecated Ref construction, unused helper raises, and the Rabbita import alias collision. No new plotting features or release were requested in this repair.
- Implementation: source and consumer migrations complete; stable/nightly CI added in `.github/workflows/check.yml`; generated interfaces refreshed with `tools/update_interfaces.py`.
- Verified: strict all-target check; structure checker; independent published-version consumer all-target check, native static SVG/assertions, and JS app build. The published consumer archive still prints its existing Rabbita alias warning.
- Verified: complete debug and release suites pass on every target: Wasm/Wasm-GC 22,678 each, JavaScript 22,740, native 22,682. No snapshots were updated.
- Release handoff: the namespace owner must publish a version above Lampese/mathplotlib 0.18.0 after the source passes exact-head stable/nightly CI and is merged. No third-party publishing or unpublished dependency overrides were performed by this audit.
- Local audit evidence: `.health/release-20261029/releases/moonplot-*` in the parent audit workspace. No local test session remains live. Next release action: the owner should follow the compatibility PR and release handoff issue, confirm green exact-head CI and merge, then publish and validate the new archive. Browser interaction acceptance is not rerun for this compatibility-only change; JS adapter unit tests and independent consumer builds pass.
