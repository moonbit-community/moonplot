# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景对齐，不复制完整Matplotlib/Python动态协议，不恢复D55或编造完成百分比。用户要求“一直往后对齐”。
- M1至M12及0.3.0提示片已验收并实际交付；当前正式Lampese/mathplotlib0.13.0，推进M13三角面着色交互，目标0.14.0。
- 已授权合理复用、独立subagents、小步verified commits/push到moonbit-community/moonplot、实际Mooncakes发布Lampese/前缀，统一单module。
- 根facade api.mbt；consumer tests/api；global tests/integration；own implementation/wbtests；维护mbt<2000行，结构检查必跑。

## 当前切片：M13 Tripcolor（功能与独立专项通过，0.14.0候选中央完整验收通过，准备实际交付）

- 合同 `.moonagent/checkpoints/M13-tripcolor/active-scope.md` 与[M13](MILESTONE_M13.md)。正式基线0.13源 `87a3280f31fb3ba043da415f89eab6ad5a8ef59e`；Root/consumer现aebc4e6的0.14.0候选，实际公开分发仍0.13.0。没有提前发布。
- 已实现Tripcolor kind、单环nonzero FilledRegion、TriColorInfo有序vertices/vertex_mean及facade。保Unit/0Containers、actualmesh原面槽/series、mask洞、全输入norm、facecount==vertexcount时face优先、原ordered均值位模式/overflow omission/同target旧SVG。两mode actualfill/plot only；真实边的安全preclipdata与visibleclipscreen锚点，非原网格观测；默认Value/Vertex mean与中文custom，无geometryXY。三点onceguard/knownslot/linear cursor，无wholemesh perface。详见[专项指南](TRIPCOLOR_INTERACTION.md)。
- [x] owner最终 `a7f53f271bb42d426ddab47ffe3f0af3fb267dc8`，Root core `ff0663c34571ae4e3028fa40fcd5aecd868c032f`；empty ee→fe6、首9702→a54、tests/guide917→6c8、两窄fix bac7→242/a7→ff 均审合。36ownerfiles（19production/3interfaces/13tests/guide）Root逐SHA一致，producer-final/root-match.json。新a7专项34539 terminal0：Native23、W/WG/JS各22、adapter2；actualinfo/fmt/structure/diff0，Native3旧SVG再次过。旧bac7 broader205/204/48仅明确保留为未改部分依据，不冒称新源全表。
- [x] 独立最终a7 Native43311/JS94555七delta均[0,0,0,1,1,1,1]，14同target旧SVG逐字，exact Fraction证3共线/4合法，无remaining blocker。原9702固定三fixture/44query、八额外接受fixture/1120query（maxdiff2.84217e-14）、Scene4+IR2每端6tests与仅两M12 helper控制复用；Drawing.region不变。Root19production/3interfaces/region全SHA同，89proof文件已SHA核copy、4immutable archives原地SHA核对，final-review/root-production-match.json。
- [x] 三类实际失败均保：empty/masked/nonfinite串改前series（before19679→after4481）；源共线被screen舍入打开（review29039、owner3398/中间75670）；共同scale丢异量纲合法面（reviewNative69540/10328、owner36013）。最终两stage per-axis纯2幂，无epsilon/不改writer或ContourF，均已实际复验解决。首编译/consumer harness错误也保原log，不误报production。
- [x] UI七files commit81fc697；build16148/info8afcad全0，Chrome65892首轮14/14、29实际整数事件相符、14typed geometry/24callbacks/5native negatives/0errors，mask真实前后/norm-only/两次data/legend/remount/CSS375均过。assets/triangles.png62757bytes/SHAca496caa102ebc47d430ec46ac48d21cebd268bda545f8a8a9da511f347df764，Root核七SHA并目视；FINAL_HANDOFF.md/ui-final-evidence.json保原证据。
- [x] 外部consumer commit19ce678：Native28910、JS38269/第二exec66c6c5全0；Chrome81253实际46/46、11三角面整数事件/0errors（原槽/tuple/mode、raw15/35/45、均值8/10/12/10、mask/bbox/XNearest空白/375中文）。info71772/fmt86144f均0，两private mbti不变。before86608误用facade genericfactory、28433误把public artists深拷贝当live，均纠正consumer并保log，非core缺陷。
- [x] ENOSPC119MiB曾阻断checkpoint heredoc/review setup/owner finalinfo101，原失败保留，只续受影响步骤。Root15049 terminal0清旧42targetcache/10.8GiB，保JS/publish/源码/log/JSON/SVG/PNG/ZIP；agent清own可再生cache，后可用17GiB，cache-cleanup-result.json有清单；不重跑已过历史完整矩阵。
- [x] 中央最终验收：候选aebc4e6已commit。prelude94492 terminal0（真实info/fmt0、14JS构建0），唯一full81669 terminal0/267.69s：W/WG22611、Native22614、JS22666全过。postlude29009 terminal0，collect dffa65全21steps0：14页面Chrome176/0errors、三静态SVG（preview/gallery逐字）、50MD562本地链接、structure/diff全部0，无意外mbti。final-ui-asset-check.json证central PNG同asset；不要重跑M12全套，不重复已过full除非相关变化/失败。
- [ ] 精确下一动作：提交本次中央结果的正式docs/sourcecommit，push，然后gitclean冻结Root tracked直到 clean包→actualpublish→公开success/checksum→无workspace全新registry四静态/Chrome46→GitHub四完整附件bytes/digest/size/tag→unchangedHEAD/gitclean finalaudit。此闭环尚未执行。final_audit.py支持真实session或chunk，不编造会话ID。
- Root当前无验证live，origin/master=f371ea5，尚未formal tracked freeze；Root进行central，M13两独立交付已freeze/no live。预览8765/session43005/PID70622的triangles.html/JS/三CSS均实际HTTP200逐字同本地（JS4686665bytes/SHAe528fb4363a0046927ea128c7336142f0191f34f18a19b398c7359bc0a3121ea），open_in_codex queued、不声称前台。producer已获准own ignored做M14最小body线段+场值设计，未授权production或Roottracked。
- 下一片streamplot只读准备已freeze：M14-streamplot-prep/HANDOFF.md/packet-sha256.json；immutable87a三Native11259/XML00ab46通过（1668源不变），旧49通用Line/Point targets的value是生成y，未有typed流线语义，1Container与实际返回/paint错位已记录。未实现M14，待0.14交付后定精确合同；不重新全库调查。

## 最新交付：M12 /0.13.0（2026-10-25）

- [x] 真正nonzero/evenodd wholeband region、holes/分岛gap/透选、有限clip区间/代表值/原logicalband槽和immutableRegion；actualfilteredwriter/plotonly与两类geometryanchor，保旧静态与API。三实证bug（collinear/BBox/跨kindmetadata）留before并修复。
- [x] owner最终f91已合Rootf6b46f9，31files含18production/3interfaces全SHA同，production自14a不变；四target184/adapter46、8旧SVG过。独立Native/JS各9public/5Scene/3delta、18actualXML/18旧SVG/432query一致、maxdiff2.84217e-14，无剩余blocker，Root18production/3interfaces全同，49证据已SHA核copy。
- [x] UI994c536：14Chrome/24整数事件/0errors、真实mask737样本/原槽1/2/3/legend/remount/CSS375；finalPNG同asset60561bytes/SHA6231fbc25bdd294584259eca606c3f87e3294d0bb1b7bbe775c8c79bcd58e777已目视。consumer0454960 Native/JS/actualinfo/fmt/Chrome41、10填色整数事件、0errors。
- [x] 中央prelude16307/postlude47933全部0；唯一full30284/268.45s：W/WG22589、JS22642、Native22591；13Chrome162/0errors、info/fmt/13JS/三静态SVG/docs48/539链接/结构/diff，无意外mbti、未重复full。
- [x] 正式源87a3280f31fb3ba043da415f89eab6ad5a8ef59e/push68683；clean20806 terminal0/dirtyfalse，四静态/Chrome41。module2503930bytes/590files/SHA7372afea56bda7a91464f507da5bf61495958355914290a0eb4fc4ad947ae3e1；source2551348bytes/615files/SHAec030e46c161077851991d45396dce28d2618bd0803f9f26a75bf5780f8155a4。
- [x] actualpublish46591/200；首API23042因queued/haspackagefalse保留snapshot/log，未冒称完成；后API64558 terminal0 buildsuccess/haspackage/notyanked/checksum一致；无workspace全新registry60742 terminal0，590安装源逐一同正式ZIP，四静态/Chrome41过。
- [x] GHcreate21562、整下载72398 terminal0，四完整附件bytes/digest/size/tag87a全部过；最终audit2026-10-25T14:19:05.947223Z Root HEAD87a+gitclean，自正式builder至网络闭环无tracked写/commit，然后解除freeze。[GitHub v0.13.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.13.0)。
- 证据Root `.moonagent/checkpoints/M12-contourf/`：producer-final/root-match、final-review/root-production-match及49evidence、central-summary/final-validation-progress、release-final/artifacts/download-check、registry-consumer/report、delivery-final-audit与release-live complete/no live。

## 历史与源码地图

- [M12完整历史](archive/migration-status-through-2026-10-25-m12.md)、[M11](archive/migration-status-through-2026-10-25-m11.md)、[M10](archive/migration-status-through-2026-10-25-m10.md)、[M9](archive/migration-status-through-2026-10-25-m9.md)、[M8](archive/migration-status-through-2026-10-25-m8.md)、[早期](archive/migration-status-through-2026-10-25-m4.md)保留既有决定/失败/附件证明。M1-M12与0.3提示片均交付，不重跑。
- master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支codex/。静态core不importUI，统一module Rabbita仅JS，pins0.16.7/XML0.5.0不要误改。
- JS-only接口由tools/update_interfaces.py实际compiler生成；最后info/fmt并审预期mbti、python3 tools/check_structure.py与适当tests；Root统一版本/中央与发布。维护文件<2000行。

[路线图](MIGRATION_PLAN.md) · [能力](CAPABILITIES.md) · [架构](ARCHITECTURE.md) · [安装](PUBLISHING.md)
