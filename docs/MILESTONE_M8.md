# M8：Stem 杆线图交互

创建日期：2026-10-25。状态：**独立实现已启动，尚未验收或发布**。目标0.9.0，当前正式版本为0.8.0。
继续复用现有静态stem，补原样本语义和真实杆/头命中，不扩一般格式字符串或可变Container API。

## 固定合同

- [ ] 保持既有stem参数、返回Container、N+2实际artist顺序与静态SVG。
- [ ] 新增`HitKind::Stem`；`point_index`是原输入i，过滤后保留索引洞，data为原head坐标，value为原head scalar，series为原label。
- [ ] 复用`HitInfo.band=BandInfo(bottom,head,horizontal,false)`，保留正负方向和非零起点；不新增StemInfo或公共可变数组。
- [ ] 实际Rod Segment与默认Scatter head Point共享原datum，但保留真实component artist_index；全局baseline静态，bottom不当作观测。
- [ ] 两命中模式首先只选择实际杆/头；不隐式增加全panel横轴吸附，不虚构底部锚点或零长度杆。

## 实现与边界

- [ ] 复用同次Line valid-run捕获、metadata/context身份、实际paint与panel clip；头在实际circle写出后回调，保留未过滤i。
- [ ] call级只读carrier与Rod(i)/Heads轻量记录共享源表；每根杆不复制全N个datum，避免O(N²)。
- [ ] 缺失head/location、zero-height、Log域外bottom但合法head、反向轴和跨视图杆保留真实源语义，不能由端点bbox造线。
- [ ] 输入副本、实际path变化与旧Drawing快照明确处理；保持普通Line2D/Scatter与旧统计图规则。
- [ ] 同色多call、图像/inline contour前缀、区域覆盖先后和真实component身份经过定向验证。

## 验收与交付

- [ ] 旧stem实际SVG控制；独立公开消费/真实几何复审；受影响四目标和Rabbita定向测试通过。
- [ ] 默认/自定义提示、独立显隐/更新/重挂载、CSS半径/letterbox与375px的真实DOM示例。
- [ ] 中央接口/fmt/结构、最终四目标全套及适当既有示例回归通过。
- [ ] clean正式包、实际Mooncakes全新安装、四目标静态/浏览器消费、GitHub四附件完整下载核验。

m3_donut负责独立worktree生产实现；m4_area准备独立oracle与旧SVG控制，精确commit后复审；m3_browser先只写ignored草稿，生产合入后再授权七文件部署。
Root负责中央合入、版本/文档、外部consumer和实际交付。M7已发布闭环；每片结果只在实际通过后记完成。
详见[执行检查点](MIGRATION_STATUS.md)、[能力](CAPABILITIES.md)与[安装](PUBLISHING.md)。
