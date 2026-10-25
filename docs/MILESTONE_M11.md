# M11：线等值线级别与 inline 标签

创建日期：2026-10-25。状态：**已授权独立实现，尚未验收**。目标0.12.0，当前正式版本0.11.0。
从正式源`0177b0cd77cc3cb05f108a2af49f561e3a0fd036`继续；只补已有regular contour、tricontour及委托wrapper，不扩filled等值区或完整Matplotlib参数。

## 固定合同

- [ ] 仅追加`HitKind::Contour`；`value`为精确resolved level，`series`为不可变call label；不新增ContourInfo或伪网格cell/vector/band/error/fraction数据。
- [ ] `point_index`是原`ContourSet.segments()`生成path槽，inline两片保留同槽；`artist_index`属于当前实际片段，不冒充原网格观测索引。
- [ ] `data_x/y`为实际emitted valid-run边在viewport clip前的安全几何中点；screen锚点为可见clip中点。它们描述生成线的几何，不是原样本或指针插值。
- [ ] 只捕获实际非零Segment，两mode均physical；无生成端点Point、全panel XNearest、跨无效/Log gap连线、闭环内部填面或bbox命中。
- [ ] 保留旧签名、ContourSet复制getters、levels/paths/stitch/mask/locator、Container、静态legend/颜色及正常SVG；不重算轮廓。
- [ ] 默认inline clabel保原按几何相等擦线范围，迁移每个已证明Contour自己的level/槽/label；其他call、普通Line或Barbs不串贴，失效intent不能因新fragment复活。
- [ ] identity/content/prepared-context provenance失配保守static且无generic Line回退；clear/remove/image/inline重排仍对齐，旧Drawing保持不可变。
- [ ] 共享小lineage、每fragment一次几何快照/guard和每edge O(1)回调；准备cursor保持线性，无每边完整path扫描或每fragment复制全grid。
- [ ] 两线API空/无path时不改前一series，保留静态legend/颜色及空Container行为；不趁机修改filled入口。

## 验收与交付

- [ ] regular/tri/wrapper、非均匀grid、同level多path、mask/corner_mask、反轴/Log/clip与真实paint。
- [ ] inline两片、实际擦除gap、inline=false、Text无target、同色/同几何calls、普通Line/Barbs及Area组合。
- [ ] 原path/level复制、当前identity/content/失效lineage、移除与清空、旧Drawing及有界多边压力。
- [ ] 精确旧源的同target SVG逐字、独立实际XML/公开consumer复审、必要四目标与Rabbita。
- [ ] 真实双卡DOM、级别默认/自定义提示、更新/图例/重挂载、CSS与375px；源码与截图均须真实编译/运行。
- [ ] 中央info/fmt/结构/全套和既有Chrome；clean包、实际Mooncakes/registry与GitHub完整下载。

只读准备已运行正式c9六个小公开Native场景：旧regular/tri是generic几何Y提示，仅末path有call label；inline后七片都丢失series。filled双环保留真实evenodd孔洞且无目标，后续独立处理。此旧基线不算新语义验收。

producer在独立工作树生产core/IR/backend/own tests和指南；Root负责版本、中央文档、consumer、UI与交付。独立review先只读准备，浏览器五文件仍是ignored草稿/14组计划，无新功能编译或截图声明。

[执行检查点](MIGRATION_STATUS.md) · [能力](CAPABILITIES.md) · [路线图](MIGRATION_PLAN.md)
