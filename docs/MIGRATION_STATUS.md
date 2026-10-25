# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力与场景对齐，不复制完整Matplotlib API/Python动态协议，不恢复旧D55指数，不编造完成百分比。
- M1至M7及0.3.0提示片均已验收交付；用户要求“一直往后对齐”，现在推进M8 Stem。
- 用户授权合理复用、独立subagents、小步本地commit和正常push至moonbit-community/moonplot；本地commit授权2026-10-23。
- 2026-10-24用户明确授权实际发布Mooncakes，前缀Lampese/，核心与Rabbita为单一Lampese/mathplotlib module。
- 根facade api.mbt；消费测试tests/api；全局配置tests/integration；实现/白盒归拥有包，维护mbt<2000行。

## 当前切片：M8 Stem（独立实现中，0.9.0未发布）

- 范围[M8](MILESTONE_M8.md)。当前Root版本与公开registry均0.8.0；尚未改0.9候选版本、未合Stem代码，不把旧静态入口算新交互已完成。
- [ ] m3_donut已从正式M7 2f7aeb77c70499979b43273d1ea8a0b0504ba040 在own managed worktree建codex/m8-stem，实现core/IR/scene/SVG/Drawing/tooltip、专项/facade/adapter与独立STEM guide；Root不被并行改源。
  固定合同：新增HitKind::Stem，原i/原head坐标/value=head/label，band=BandInfo(bottom,head,horizontal,false)，不加StemInfo/公共mutable数组。
  Rod Segment与实际默认head Point各保留真实component artist_index；全局baseline静态，bottom非观测；两mode只物理，无panel-wide虚构fallback。
  保持旧签名/Container/N+2顺序/静态SVG；复用actual-run与actual-head callback/metadata/context/clip/paint，call级只读共享carrier+Rod(i)/Heads，严防每rod复制N datum造成O(N²)。
  10份实际旧Stem SVG（横竖×bottom0/1×finite/NaN+empty）Native74853 1/1已冻结，不再update；正在实现共享StemHitData与常数StemHitView、实际Line run/heads circle callback。
  头按实际circle fill/radius可见性捕获，不以原painter未写出的line alpha误屏蔽实际head。Native首验、受影响四目标/adapter/info/fmt/结构后coherent commit交Root；不全套、不push发布、不改中央docs/版本/consumer/UI。
- [x] m4_area固定正式0.8 immutable archive完成reviewer准备：Native77543 terminal0，8份真实StemSVG+Container/N+2控制与Python实际polyline/circle8/8通过；只验旧源，不算M8新target验收。
  own ignored M8-stem-review/plan.md/oracle.json/baseline-results.json/baseline-source-manifest.json/observed-old-gaps.json/future-checks.mbt.txt已冻结，独立输入已与producer同步；待精确commit再复审，无live。
- [x] m3_browser已完成Root ignored .moonagent/checkpoints/M8-stem/draft/HANDOFF.md 三卡草稿（竖向、横向、置信带覆盖），447行main/359行runner/12组计划；语法fmt/Node/ignore/whitespace terminal0，未授权tracked部署/编译/Chrome/PNG。
  与producer确认NaN源洞fixture heads[5,NaN,-1,7]/locs[1,2,4,7]/bottom1，更新[3,NaN,-2,6]；不是已运行M8测试，无live。
  预定七文件stems例；保留M7实际MouseEvent经验，不将page.mouse参数当真实浮点event，端点采用可实际表达布局并记录event。
- [ ] Root已准备ignored consumer-draft/static_stem.mbt/app_stem.mbt/browser_stem.mjs，Moon格式解析/Node语法通过，尚未部署或语义运行。
  静态原i/head/band/真实各artist与Container N+2、横竖/反向/输入副本、NaN+zero-height、两端视图外clip、Log0仅head和baseline空白；app横向非零bottom，实际rod/head两组计划将外部检查23→25。
  Root三组合草稿已写：Stem/Area横竖与两顺序、Stem/Hex与Stem/Step两顺序，每组两mode；Root将owns scene/stem_overlay_wbtest.mbt，尚未部署/语义运行。
  Root已准备isolated final脚本但未执行，九JS例/最终四目标/实际浏览器/静态/链接/结构、0.9正式交付；等最小可验Stem commit，合入后才部署UI。
- M8派发先于M7最后网络下载数十秒，仅own worktree/ignored草稿；Root直到65222完整成功保持M7 tracked freeze，M7来源/包未被后续工作污染。
- 精确下一动作：M7交付记录/M8 scope0075e7b已push90203 terminal0 → 收producer首个定向可验commit与UI草稿 → Root合入/公开consumer/独立复审 → UI正式授权/最终交付。
- 不重开19图调查；旧Stem定点设计Root .moonagent/checkpoints/M7-discrete/next-stem-notes.md与design/stem-later.md仅作源图；其中旧StemInfo建议/授权版本已被本页固定合同替代。
- Root无测试/发布/下载live；三个M8 agents任务已派，live IDs由各owner报告；唯一有意预览8765/session43005/PID70622。

## 最新交付：M7 / 0.8.0（2026-10-25）

- [x] Step三mode原sample/interval、Stairs实际完整strip、ECDF实际returned slot/value/概率/原before→after band已交付。复用同次绘制，不在UI重算统计。
- [x] source guard在实际provider/cache之后验证；changed path/context None保守失效，原Drawing不可变；透明/clip/valid-run/跨artist顺序和索引洞保留。
- [x] 两个真实Step问题已修：client逆算roundoff55/810错误归零；ECDF新zero-edge捕获导致重合source点顺序倒退及Step fallback同族，最终6541907（Root0877cd9）以sameartist/samecoords Point较大源索引解平距。
  普通Line/Scatter/ErrorBar、不同位置等距、跨artistpaint与Point/Segment规则保持。实际Chrome事件取整首失败为runner错误前提，未放宽生产epsilon；真实可表达端点已验。
- [x] 独立复审：StepNative/JS各15公开/4guard/14实际SVG与修复各810+12控制；Stairs各29、22XML/5000实际几何包含/2guard；ECDF各28/26XML，最终fix各26，全部无blocker。
- [x] Root最终85355 terminal0：Wasm/Wasm-GC/Native各22488/22488，JS22531/22531；info/fmt与八JS build、结构通过。
  实际Chrome共98项（离散14/分布13/网格11/统计14/图表14/提示14/双图11/资源7）、0errors；三native SVG可解析，preview6886/gallery14246与资产逐字相同。
  38份MD/477本地链接通过，Root已目视桌面真实PNG；默认/隔离JS4489623 bytes/SHA78d79c981f059831d01571ddd871646af25cf34f74abccb00004076d39ef4f82相同。
  asset94636 bytes/SHA7a1a90e05627186363ca0d8a15f695f11ea769e782f01ea6eae54c3fac4c9674；8765实际HTML/CSS/JS HTTP200逐字相同，open_in_codex返回queued未声称前台已打开。
- [x] 正式源2f7aeb77c70499979b43273d1ea8a0b0504ba040已push46692 terminal0；clean builder63118 terminal0、dirty=false，外部静态4目标/Chrome23。
  模块ZIP2087347 bytes/555 files/SHA4588b872d933110fec36b2498ff30bcf96d61d2ae570b5532c7dbf33d0b7be43；
  sourceZIP2117382 bytes/570 files/SHAe4e18ace990bdb00af49aec8a5aa870acd67a9a19419d883dd85681ebcd02367。
- [x] 实际publish95504 terminal0/200；最初manifest queued，随后40332 success/has_package=true/yanked=false，checksum与正式ZIP相同；未重复publish。
  registry48583 terminal0：全新无workspace覆盖、555安装源逐一相同、静态4目标与真实Chrome23通过。
- [x] GitHub创建38137、完整下载核验65222均terminal0；等待整个gh download完成后才逐字比较，四附件/远端digest/size/不可变tagSHA全过。
  https://github.com/moonbit-community/moonplot/releases/tag/v0.8.0 。Root从formal builder开始到下载闭环无tracked写入或commit。
- 证据Root .moonagent/checkpoints/M7-discrete/：final-validation-progress.json、各browser-final-*、release-final/artifacts与download-check、registry-consumer/report、review冻结与root-final-match。
  所有rehearsal/dirty/before-fix包绝不可上传，正式只用release-final/artifacts；完整阶段/失败定位记录见[M7前交接历史](archive/migration-status-through-2026-10-25-m7.md)。

## 早期交付与源码地图

- M6/0.7.0真实Hex数学分箱修正与Violin body/summary、M5/0.6.0 meshes/hist2d均已实际发布闭环；早期证据保留在M7交接历史和[M5历史](archive/migration-status-through-2026-10-25-m5.md)。
- M1至M4完整记录见[早期执行历史](archive/migration-status-through-2026-10-25-m4.md)。旧tag与附件不移动或覆盖。
- 当前预览http://127.0.0.1:8765/rabbita/discrete.html，实际0.8默认JS已构建/验证。服务若connection refused才重启并更新session/PID，不复活旧测试服务器。
- 主分支master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支前缀codex/。
- JS-only接口由tools/update_interfaces.py通过真实moon info生成；最后info/fmt、审查mbti、python3 tools/check_structure.py及适当测试。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
