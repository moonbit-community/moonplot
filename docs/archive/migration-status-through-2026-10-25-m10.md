# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力/场景对齐，不复制完整Matplotlib API/Python动态协议，不恢复旧D55或编造完成百分比。
- 用户要求“一直往后对齐”；M1至M10与0.3.0提示片已验收交付，M11已在独立工作树授权生产。
- 授权合理复用、独立subagents、小步verified local commits（2026-10-23）/正常push至moonbit-community/moonplot。
- 2026-10-24明确授权实际Mooncakes发布，前缀Lampese/，核心与Rabbita为单一Lampese/mathplotlib module。
- 根facade api.mbt；consumer tests/api，global tests/integration，owning implementation/wbtests；维护mbt<2000行，结构检查必跑。

## 已交付切片：M10 Barbs / 0.11.0

- 范围[M10](../MILESTONE_M10.md)，Root/consumer为0.11.0；最新正式发布仍0.10.0。源码、独立复审、四目标全套及11页面浏览器验收均已通过，正在准备正式发布，未把网络交付算完成。
- 仅Barbs两旧API，不扩Streamplot/一般样式；保留签名、Unit、多component顺序、无Container、按i校验并push/后项错误保留有效前缀。
- HitKind::Barbs，复用VectorInfo U/V，value原V、原i、原pivot前input x/y和call label；middle/tip不能把输入都叫tail。
- 实际Line仅非零valid-run Segment；真实Flag填面用Quad(a,b,c,c)，可见stroke三edges；calm用实际filled disk全Sector，无新Shape/Part/magnitude。两mode只physical，无XNearest fallback或伪端点。
- 共享call表+常数component view O(N+P)；每view只guard自己的1/2/3点，不每part复制/扫描全N，不能用后项NaN否决已画prefix。
- rawLine prepared-context匹配provenance才给Barbs语义；不匹配/None/内容或identity变更保守static，不退generic Line/Scatter假数据。重用既有writer真实回调/原计算。
- 额外明确修两实证问题：zero/empty/fill_empty=false无新component不得串改前Line/旧Barbs的series，保持静态legend/颜色；advanced先拒绝非finite派生值与不可表示counts再to_int/loop，复用InvalidQuiver，不设任意小cap，正常SVG不变。
- Basic normoverflow保留旧合法shaft/NaN羽枝不造绘；tiny underflow/width0填面圆/zero等按实际paint。高级计数修复不改变有效前缀错误行为。
- m3_donut定点readonlypacket已收Root .moonagent/checkpoints/M10-barbs/design：design/handoff/observed/source-manifest/baseline-native.log+8SVG。Native62148 terminal0仅旧基线/控制；oldtargets都是generic Line/Scatter，不算Barbs已适配。
  basic/advanced后项NaN保留4/3artists；zero/empty公开实证改前Line series；安全count probe Inf→Int2147483647，未执行巨大循环。无producer live。
- 已明确授权m3_donut从精确正式0.10 source c9eb6bec526a2f6d2b1f6330a60ef616dd83a16a在own managed worktree建codex/m10-barbs生产，拥有core/IR/Scene/Backend/Drawing/tooltip+own tests及BARBS_INTERACTION.md。先真实bugfix小verified commits再能力；必要Native→四target/adapter/info/fmt/结构，不全库/Root写/push/publish/新agent，尽早给coherent SHA供并行。
- 已明确授权m4_area仅own ignored immutable c9独立旧SVG/公开consumer/oracle准备，m3_browser仅ignored紧凑双卡草稿/实际DOM计划；两者不可提前生产/Roottracked写/commit/发布，全套由Root收口。
- [x] 标签修复716565e已cherry为46e5e3b：没有新component时不再改前一artist的series；保留原静态legend/颜色。Native40554 terminal0/5项，actual info/fmt/结构/diff过，无mbti变化。
  Root公开consumer59142 terminal0：普通Line仍回调Original（旧为Empty wind），实际SVG2570bytes与正式c9逐字，证明静态不变；.moonagent/checkpoints/M10-barbs/label-fixed-public-report.json留证。
- [x] 高级计数修复1a3392f已cherry为f586978：派生finite、单项与累计components可表示后才转换/循环，保留已画前缀，无任意小cap。Native37673及W/WG/JS89839均terminal0/各8项；info/fmt/结构/diff过，无mbti变化。
  helper测试只检查最大可表示计数，不实际展开大循环；后项溢出保留有效55前缀，SVG与单独前缀相同。独立反例单项可表示但总数2600000001也已覆盖。
- [x] Root独立git archive正式c9并运行五公开fixture89973 terminal0：basic/反轴各8artists/8polyline，advanced各9artists/5polyline+2polygon+2circle，empty-label控制；原SVG及计数存baseline-consumer-report.json。旧generic targets不算Barbs通过。
- [x] m4_area旧基线98036 terminal0/13项，8份实际XML组件几何及5控制，保存10SVG；21生产源SHA和oracle/fixtures已复制到Root baseline-review/。最大几何差5.684341886080802e-14px；仅冻结正式c9旧行为，等待精确语义SHA复审，无live。
- [x] m3_browser ignored draft/HANDOFF已收，main465/runner305行，basic/options双卡及12组真实DOM计划；moonfmt/Node语法/ignore检查通过。尚无tracked部署/编译/Chrome/截图/生成mbti，等待Root明确授权。
- [x] cd0319d已cherry为48f8cb4：共享BarbHitData+常数view、原i/input-before-pivot/U-V/calllabel，实际Segment/Quad+3edges/fullSector；公开仅追加HitKind::Barbs。Native84705 terminal0/14项、8Native旧SVG逐字，all-target carrier107/capture32 check0error，实际info/fmt/结构/diff过。
- [x] Root公开Native50470 terminal0：basic/反轴各8Segment，advanced15或width0仅4填面目标，旗面/空bbox角/圆内偏心radius0、原数据副本及两physicalmode通过；五SVG与正式c9逐字。首probe main漏raise只编译失败，已留日志并修probe，无生产改动。
- [x] Root外部dirty包32443 terminal0：四目标static与Chrome32/0errors，8实际Barbs整数事件精确等于请求；shaft/三羽枝/负值洞、零描边旗面深内点、rounded非零与exact-zero disk内部均过。仅rehearsal，未上传，正式clean包待最后。
- [x] Root三组合19355 terminal0，四目标各3/3：flag/Area、calm/Hex paint order及普通Line真实sample/现有XNearest physical优先。前两轮新测试错误预设Line中段采样与XNearest全paintorder，已保留失败日志并只修测试，不改通用命中策略。
- [x] UI七文件已实际部署并freeze：build28249/info/Chrome62943 terminal0，12/12、0errors；46真实整数hit、28segment最大1.3354CSSpx≤radius2，flag深内点每edge至少5.4422px，disk离center3.0584px>radius2且<实际半径3.4393px。
  Root已view_image目视desktop/mobile；asset1280×1015/78865bytes/SHA303cb378d6959c6218bbe4b092d16e4bd496ab835fd10c8edc82403b29852c48；isolated JS4507611bytes/SHAbea988882813e533745f0d00bf40b585246f0263d344b689d0a6760167e21495。七SHA及真实compiler mbti见draft/FINAL_HANDOFF和browser/final-evidence.json；无UI live。
- UI已commit30cbfe2；consumer/overlay/候选version及检查点已commite0f640d并push51934 terminal0。中央文档本地草稿已更新能力/示例，Barbs指南仍producer负责，尚未做中央全套。
- [x] cd0319d其余独立有限表Native81608/JS各17公开组通过，各10实际XML/36Barbs targets逐一source/shape/primitive匹配，Native10+JS10同target旧SVG逐字。Scene31733的2项、IR30850的1项、Backend42004的2项均Native terminal0；2048datum压力也过，无第二blocker。
- [x] 独立Native69717抓到原component同值copy后Scene identity miss→generic fallback；producer before43166实证失败。修复edb6559已cherry为7fcb70c：known-slot O(1) intent+disabled共享view，失配保static且禁capture，维护image/inline-contour/Line.remove/clear；普通Line无intent保原规则。
  Native44871 terminal0/43项、实际all-target info/check/fmt/结构/diff过；first-after11634修正copy后仅旧私有断言None需改为disabled-sentinel，最终43全过。
  独立edb复核Native98906/JS5376 terminal0，各4组：3roles×4操作12子例含跨kind replacement、两image+3level inline+两remove顺序4intent/7targets、clear/旧Drawing/cross-call alias及普通Line/Scatter保留；唯一blocker解除，未重跑原17表。final-review七文件已复制，16production SHA全部与Root一致，root-production-match.json留证。
- [x] 最终专项/指南7cdaece已cherry为49f6d75，生产自edb完全不变；94048 terminal0：Native197、W/WG/JS各195，Rabbita42全部过；4285 terminal0：immutable c9八公开fixture×四目标32SVG逐字，Drawing/static一致，无mirror writer或golden更新。
  producer-final/handoff与source-manifest已复制；Root实核全部29文件SHA（16production/3interfaces）一致，root-files-match.json留证。
- [x] 中央54039中实际info/fmt、11JS builds及四目标全套通过：W/WG各22543，Native22545，JS22592；full-suite266.67秒/terminal0，实际git diff只有中央文档，无意外接口变化。
- [x] 54039止于首Barbs浏览器回归：前7组过，runner258行advanced legend.click后即时DOM count3!=0。原日志/JSON/PNG保留；实际截图已空图，retry记录立即3@3431.3ms→完成0@3448.5ms，重显立即0→完成3，确认reactive render race。
  仅runner改为状态/DOM完成条件等待，无sleep/生产改动/放宽断言；已commitf66c575。真实default JS retry29449 terminal0/12项0errors，新runner SHAa0ca946110889b9eb7cbe026aa27d5bbf80a52cd89d8b4c7464283db2f5315ef，其余六文件逐字不变。
  剩余19741 terminal0：其余10Chrome122项、三SVG（preview/gallery逐字）、44MD/508链接（正式发布文案更新前）、结构/diff全过；合计11页面134/0errors。central-summary.json收齐，未重复已过全库；Node语法也过，无意外mbti改变。
- 下一片仅定点准备：M11-contour/browser-design packet已收，c9六有界公开Native23053 terminal0。regular/tri只末path有series，inline真实7片全失series，filled evenodd双环0targets；只线level/inline lineage为下一片，filled多环孔洞后片。
  Root ignored scope-draft拟定point_index为原generated pathslot、dataXY实际边clip前安全midpoint、screen可见clip中点/value精确level。producer只读可行性复核、browser仅ignored双卡草稿；尚无M11生产授权/实现。
- M11只读设计已收（producer M11-contour-design/），固定合同可行；inline保持原几何擦线范围、每个已知Contour各自迁移level/slot/label，不能借新fragment复活失效intent；准备pass须维持cursor线性，避免交错Barbs重复全扫。尚未授权M11生产；browser继续ignored双卡草稿。
- 精确下一动作：最后发布文案本地链接检查→正式source commit/push→clean包、真实Mooncakes/registry/GH完整下载。正式流程实时以Root .moonagent/checkpoints/M10-barbs/release-live.json为准；先读phase/manifest/session再续，不重复builder或publish。禁止从dirty演练上传，正式builder至网络闭环禁止tracked写入/commit。
- Root当前无测试/发布/下载live；唯一有意预览8765/session43005/PID70622。默认Barbs JS已实际build terminal0，HTML/JS/三CSS HTTP200且与本地逐字；JS4521282bytes/SHA1cc7844347208de0e8776d184a81050b8c91ecc9ac583e40414b47625e2b61aa。open_in_codex queued，未声称已前台展示。
  M10生产与UI已freeze，所有实际失败已解决；两个agent仅M11准备，reviewer完成无live。下一片生产等待正式0.11基点和Root明确指令。

## M10正式交付闭环（2026-10-25 20:29 Asia/Shanghai）

- 正式源0177b0cd77cc3cb05f108a2af49f561e3a0fd036已push87697 terminal0；clean41056 terminal0/dirty=false，外部静态四目标/Chrome32过。
- module2346216bytes/573files/SHA b87b76d3471b185124458e5b992dba1983456d47cde679b0632ef4aae48520e0；source2386461bytes/594files/SHA ab9188c5c881f8c46f4176de83342c904067a289631328750ed44d08087ecc9d。
- actual publish10237 terminal0/200；公开version0.11.0/buildsuccess/has_package=true/yanked=false，metadata.checksum等正式module。
- registry75023 terminal0，无workspace全新安装573源逐一与正式ZIP相同，静态四目标/Chrome32通过。
- GHcreate63983、整下载68272均terminal0；整个gh download完成后才比四附件字节/size/远端digest与tag源码SHA，全部过。
- [GitHub v0.11.0](https://github.com/moonbit-community/moonplot/releases/tag/v0.11.0)；Root从clean builder到完整网络闭环HEAD0177不变且gitclean，无tracked写/commit，审计后才解除freeze。dirty演练未上传；旧版本tag/附件不动。
- release-live.json phase=complete/no live；原失败、独立before、runner race真实时序均保留，未重跑已过full或改golden。

## 最新交付：M9 / 0.10.0（2026-10-25）

- [x] Quiver原位置/i/U/V及value原V，经三个实际shaft/wing Segment进入默认/自定义提示；两mode只physical，open head无填三角。旧签名/Unit/单artist Container/非finite整call错误与静态保留。
- [x] producer e475dd7→Root4403974，后续0f6530a→Root60f7ca4仅tests/guide；all-target check129tasks/0errors，Native初10后13；affected W/WG/JS各155、Native156、Rabbita40全部过。
  首Wasm是Native libm末位字面golden跨target误用，原golden未改只加Native cfg；immutable95a old/new6fixture×4target=24SVG逐字，未保留镜像writer。25最终文件SHA与Root一致。
- [x] 独立e475 Native/JS各18公开组，各8实际XML41targets原数据/实际line/clipanchor逐一匹配；Native8旧SVG逐字；4096datum→12288targets两端过；Scene71239/Backend98449各Native2/2，均无blocker/live。
  dualidentity/zero槽content/旧Drawing/IR mismatch/poisonedLineprovider0调用及actual paint通过。Root收final-review四文件，14生产SHA精确匹配，0f无生产改变不重验。
- [x] UI七文件f8b6633已freeze：隔离53444/info91925、最终Chrome91091 terminal0/12项0errors。24真实事件dist最大1.1154CSSpx≤radius2；openhead空白距全部9线4.4868px实际nohit。
  首两轮仅runner dataset数字连字键/临时zoom被卡裁切，已保留失败并只修runner；Root目视真实desktop/mobile，七SHA匹配。
  asset1280×1015/75274bytes/SHA9bab68fb64b8bfc66c3eac9c586efad7cebc1844ab25fa53fbe146f7278e1b01；JS4509800bytes/SHA9fb452af149cda424cf7c472bf18c50bd8cfa8b4f755129df0bbe0a421b09c9c。
- [x] Root外部dirty26693四静态/Chrome28与overlay88431四目标各3/3通过；actual4整数MouseEvent精确=请求，ownstroke dist<.23px/other>1.36px(radius1)，真实双wing独立触发。3个自选旧SVG90255逐字，dirty包未上传。
- [x] 中央72277 terminal0：W/WG22520/22520，Native22521/22521，JS22567/22567；info/fmt/10JS builds，10Chrome122项/0errors，3nativeSVG/preview6886与gallery14246逐字、42MD/498链接、结构/diff全部通过，无意外mbti变化。
  默认/isolated JS与实际8765 HTML/JS/三CSS HTTP200逐字，open_in_codex queued未声称前台已显示。final-validation-progress、browser-final-summary、preview-http留证。
- [x] 正式源c9eb6bec526a2f6d2b1f6330a60ef616dd83a16a已push6953 terminal0；clean14188 terminal0/dirty=false，external静态4+Chrome28。
  module2258118bytes/566files/SHA1bea6b23cbce9a240e004e22be02fbfbe7c70e335173ad8d132cf66eb7e9968f；source2294805bytes/585files/SHA4f1552295d07ff44b02383d0b5e83ff200a823abaf1bf42cf6788aa449cf73dd。
- [x] actual publish24617 terminal0/200，初queued后success/has_package=true/yanked=false、checksum同正式module；registry94135 terminal0，无workspace全新安装566files逐字，静态4/Chrome28过，未重复publish。
- [x] GHcreate35288及整下载21859 terminal0；等整个gh download后比较四附件字节/远端digest和size/tag源码SHA全部通过。
  https://github.com/moonbit-community/moonplot/releases/tag/v0.10.0 。formal builder至网络闭环无tracked写/commit。
- 证据Root .moonagent/checkpoints/M9-quiver/：producer-final、final-review、browser-final与各browser-final-*、release-final/artifacts/download-check、registry-consumer/report、release-live complete/no live。

## 早期交付与源码地图

- M8/0.9正式95a34c3dc154f48fb3b83b7f37ecad3a0e8273c8，Stem；W/WG/Native22505、JS22550、Chrome110；560安装源/4目标Chrome25、四附件全部验收。
- M7/0.8 Step/Stairs/ECDF、M6/0.7 Hex数学修正与Violin、M5/0.6 meshes/hist2d、M1至M4均已实际发布闭环，无需重跑。
- [M9历史](migration-status-through-2026-10-25-m9.md)、[M8历史](migration-status-through-2026-10-25-m8.md)、[M7历史](migration-status-through-2026-10-25-m7.md)、[早期历史](migration-status-through-2026-10-25-m4.md)保留失败定位，旧tag/附件不移动。
- 当前可访问候选预览http://127.0.0.1:8765/rabbita/barbs.html；vectors正式0.10旧构建也可访问。仅connection refused才重启并更新session/PID。
- 主master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支codex/。
- JS-only接口用tools/update_interfaces.py真实compiler生成；最后info/fmt、预期mbti审查、python3 tools/check_structure.py和适当tests。

[路线图](../MIGRATION_PLAN.md) · [能力](../CAPABILITIES.md) · [架构](../ARCHITECTURE.md) · [安装](../PUBLISHING.md)
