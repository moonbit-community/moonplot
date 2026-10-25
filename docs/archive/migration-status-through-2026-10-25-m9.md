# MoonPlot 当前执行检查点

更新时间：2026-10-25（Asia/Shanghai）。恢复会话先读本页，按精确下一动作继续。

## 范围与用户决定

- 实用MoonBit画图库，按能力与场景对齐，不复制完整Matplotlib API/Python动态协议，不恢复旧D55指数，不编造完成百分比。
- M1至M8及0.3.0提示片已验收交付；用户要求“一直往后对齐”，现在推进M9 Quiver。
- 用户授权合理复用、独立subagents、小步本地commit和正常push至moonbit-community/moonplot；本地commit授权2026-10-23。
- 2026-10-24用户明确授权实际发布Mooncakes，前缀Lampese/，核心与Rabbita为单一Lampese/mathplotlib module。
- 根facade api.mbt；消费测试tests/api；全局配置tests/integration；实现/白盒归拥有包，维护mbt<2000行。

## 当前切片：M9 Quiver（全部功能验收通过，待0.10.0正式发布）

- 范围[M9](../MILESTONE_M9.md)，目标0.10.0，Root版本仍正式0.9.0；仅Quiver，不扩Barbs/Streamplot，不重开19图调查。
- 固定：HitKind::Quiver；只读VectorInfo{u,v}+HitInfo.vector?；data原x/y、原输入i、通用value明确原v；默认提示X/Y/U/V。
- 实际旧箭头是shaft+双wing三个line（7SVGpx/0.55rad），只收三个实际Segment，无填充三角；两mode都physical，无XNearest fallback。
- 保留静态SVG、旧签名/Unit/单artist与Container、非finite整call报错；zero/scaleinvalid/endpoint overflow/clip跳过保留原i洞。
- points+vectors身份及immutable源/实际prepared-context必须guard；不得用error/band/fraction假装U/V，不改变global finite政策。
- normoverflow可真实发生：x=y=-8e307,u=v=1.7e308在SymLog可画但norm Inf；首片不新增magnitude接口，不截断、不假0。
- m3_donut只读packet已收Root M9-quiver/design，16生产源SHA与正式0.9一致；6旧SVG Native20060 terminal0。首完整核心e475dd7390749bb4bd8e55cb4853cb2fe00c4733已合Root4403974（base正式95a）。
- [x] 核心e475：call级points/vectors复制源、双arrayidentity、once O(N)完整guard、actual三write后原i回调，Segment clip/actual style gate、VectorInfo/vector?/Quiver及X/Y/U/V提示/facade。旧计算/Unit/Container/非finite整call验证保持。
  all-target check64133 129tasks/0errors、Native43097 10/10含6旧SVG逐字；后续0f6530ada8bf141f130775f60de4a460592903de已合Root60f7ca4，仅补5测试/guide文件，生产/接口自e475不变。
  79098 terminal0 affected Wasm/Wasm-GC/JS各155/155、Native156/156（多native-only golden1），Rabbita40/40；54068 terminal0 exact95a immutable archive同6公共fixture旧/新各4目标24SVG逐字。compiler info/fmt/结构/diff与25最终文件SHA匹配。
  首Wasm155/156为Native libm最后一位字面golden被误用于跨target；只加Native cfg，原字符串未改，未保留镜像writer，同target旧/新SVG24份已独立实证排除生产回归。
- [x] m4独立准备从正式95a：Native66949 terminal0，8旧SVG+3公开control，actualXML独立oracle最大差1.14e-13、旧targets0。Root已收baseline-review/5文件+8SVG；未来visibleparts9/9/6/6/6/1/3/1尚只是预期。
  m4 exact e475独立复审全部通过无blocker/live：Native/JS各18公开组、各8XML41target逐一真实line/原数据/clipanchor、Native8旧SVG逐字、4096datum/12288targets两端过；Scene71239与Backend98449各Native2/2，dual identity/content/zero槽/旧Drawing/IR mismatch及poisonedLineprovider0调用/actual paint边界均过。
  final-review/四份冻结证据已收Root，14生产源SHA精确匹配；0f6530a仅tests/guide不需要重做复审，Quiver实际不调用Line prepare_line。
- [x] Root0.10候选与公开consumer/3组合已部署，info/fmt与Node语法通过。88431 terminal0四目标overlay各3/3：Quiver/Area、Quiver/Stem真实compound身份、Quiver/Hex，两顺序/两mode。
  26693 terminal0 dirty外部演练：静态四目标+真实Chrome28项/0errors，4次actual integer MouseEvent与请求相同，shaft/双wing各自独立dist<.23px、距其他线>1.36px（radius1）；原tail/u/v、zero洞、负v、输入副本/反轴/clip通过。dirty包不上传。
  Root29994保存3旧Native SVG，90255新实际各targets9/9/1且三个SVG逐字相同；M9-quiver/consumer-svg-check.json与baseline-consumer-report留证，基线实际source82471d9仅docs异于formal95a。
- UI七文件已freeze，隔离53444/info91925与真实Chrome91091 terminal0，12/12/0pageerrors；24实际shaft/wing事件最大距1.1154CSSpx（radius2），open head空白点到9线clearance4.4868px实际nohit。
  Root已目视真实desktop/mobile并逐一核七SHA，asset1280×1015/75274bytes/SHA9bab68fb64b8bfc66c3eac9c586efad7cebc1844ab25fa53fbe146f7278e1b01；实际JS4509800bytes/SHA9fb452af149cda424cf7c472bf18c50bd8cfa8b4f755129df0bbe0a421b09c9c。
  初Chrome18129/65682分别runner dataset数字连字键、临时zoom头部被卡裁切，已只修runner并保留失败证据；main从草稿部署未改，未扩大生产epsilon。证据M9-quiver/browser-final/final-evidence与draft/FINAL_HANDOFF，无UI live。
- Root UI f8b6633已commit，默认build通过、默认/隔离JS4509800bytes/SHA精确一致，8765实际HTML/JS/三CSS HTTP200逐字同磁盘；preview-http.json留证。open_in_codex返回queued，未声称前台已打开。
- [x] Root中央72277 terminal0：Wasm/Wasm-GC各22520/22520、Native22521/22521、JS22567/22567；info/fmt/10JS builds无意外mbti变化。
  十个真实Chrome122项/0errors；三个native SVG可解析，preview6886/gallery14246与资产逐字；42MD/498本地链接、结构/diff全部通过。七文件freeze仍SHA相同；证据M9-quiver/final-validation-progress.json/log、browser-final-summary。
- [ ] clean正式包/实际0.10发布尚待；所有dirty包未上传。候选README/guide/发布状态已更新。
- Root helpers M9-quiver/verify_github与release-notes已备，未实际release；integrate_consumer.py/update_release_docs.py已各执行一次，不可重复。
- M8交付/M9范围f1e3058已push65943 terminal0，定点准备82471d9已push20460 terminal0，Root消费6dfee94已push82568 terminal0；最初probe未建workdir的工具拒绝未执行，建目录后29994成功，非生产问题。
- 精确下一动作：M8实际发布闭环全部完成，交付文档commit/push → producer最终0f6530a已合、定向/独立/UI/外部全部过 → 中央72277已terminal0全部过 → 更新验证文档release-prep commit/push → clean0.10实际publish/registry4+Chrome28/GH四附件完整下载；formal冻结期不tracked写/commit。
- Root无测试/发布/下载live；唯一有意预览8765/session43005/PID70622。UI/reviewer均已freeze无live。producer已被明确授权仅只读M10 Barbs定点设计/少量旧SVG（不实现/commit/Root写/新agent，任何M9反例优先），等正式0.10 SHA及明确授权再生产。

## 最新交付：M8 / 0.9.0（2026-10-25）

- [x] 实际Stem rod/head携原head/x/y/i与BandInfo(bottom,head,horizontal,false)，component身份、N+2/Unit/静态保留；共享源表/常数view/heads一次guard，双mode只physical。
- [x] owner cf4de322（Root fe9de53）四目标定向各133/133、adapter38/38；10旧Stem+14旧离散SVG逐字；Root三组合四目标各3/3，外部dirty演练4目标/Chrome25（未上传）。
- [x] 独立m4 cf4de322：Native/JS各23公开组、各8实际SVG/23target匹配真实primitive、旧Native8SVG逐字、Scene2+context1全部terminal0，无blocker。4096datum/8192targets两端过；11生产源SHA与Root精确匹配。
  证据Root .moonagent/checkpoints/M8-stem/final-review/review.md/results/geometry/source-manifest与root-final-match，无live。
- [x] 七文件Stem三卡UI292e3b7已freeze，isolated38963/info/Chrome90130首轮12/12/0errors；Root已目视desktop/mobile，actual7head事件匹配canonicalClient。
  asset1280×1755/96620bytes/SHA2b12269986b080c4dcb0c47f11dff11f3fde25b787d01d19dbaad4a55b6cd4d3，JS4504167bytes/SHA3768e880572a77db935bf3cae8293efdc31238b9642b23278b83b1ec6d0dec14。
- [x] Root中央40879 terminal0：info/fmt/9JS builds；Wasm/Wasm-GC/Native各22505/22505、JS22550/22550。
  九Chrome110项/0errors；三native SVG解析，preview6886/gallery14246与资产逐字；40MD/488链接、结构/diff通过，默认/isolated JS与8765实际HTTP200逐字一致。
- [x] 正式源95a34c3dc154f48fb3b83b7f37ecad3a0e8273c8已push19158 terminal0，clean builder21070 terminal0/dirty=false，外部静态4目标+Chrome25。
  模块ZIP2179542bytes/560files/SHA352a7d165124952f0d13bf988e60c9927991c88a1a1d8fbcced6fbfa008562c5；sourceZIP2212594bytes/577files/SHA99934cca03b701938b30fe18acf0a42844b5ffb9fa6509002b3acf26e52d3a39。
- [x] 实际publish84366 terminal0/200；manifest首次queued，随后success/has_package=true/yanked=false、checksum与正式ZIP相同；未重复publish。
  registry51252 terminal0：全新无workspace、560安装源逐一相同、静态4目标/Chrome25全部通过。
- [x] GitHub创建55397、完整下载30349 terminal0；整个gh download完成后逐字比较四附件/远端digest和size/tag源码SHA全过。
  https://github.com/moonbit-community/moonplot/releases/tag/v0.9.0 。formal builder至网络闭环无tracked写入/commit，dirty演练未上传。
- 证据Root .moonagent/checkpoints/M8-stem/：final-validation-progress.json、各browser-final-*、release-final/artifacts/download-check、registry-consumer/report、release-live.json（complete，无live）。

## 早期交付与源码地图

- M7/0.8正式2f7aeb77c70499979b43273d1ea8a0b0504ba040：Step/Stairs/ECDF，中央各22488/JS22531/Chrome98；555安装源/4目标Chrome23与四附件全验。
- M6/0.7真实Hex数学分箱修正与Violin、M5/0.6 meshes/hist2d、M1至M4均已正式交付，无需重验。
- [M8之前实施记录](migration-status-through-2026-10-25-m8.md)、[M7历史](migration-status-through-2026-10-25-m7.md)、[M5历史](migration-status-through-2026-10-25-m5.md)、[早期历史](migration-status-through-2026-10-25-m4.md)保留逐步命令与失败定位，旧tag/附件不移动。
- 当前预览http://127.0.0.1:8765/rabbita/vectors.html，实际0.10候选默认JS已构建/验证。服务若connection refused才重启并更新session/PID，不复活旧测试服务器。
- 主master，SSH origin=git@github.com:moonbit-community/moonplot.git；独立分支前缀codex/。
- JS-only接口用tools/update_interfaces.py真实compiler生成；最后info/fmt、预期mbti审查、python3 tools/check_structure.py与适当测试。

[路线图](../MIGRATION_PLAN.md) · [能力](../CAPABILITIES.md) · [架构](../ARCHITECTURE.md) · [安装](../PUBLISHING.md)

## 追加：M9实际发布已完成

正式source c9eb6bec526a2f6d2b1f6330a60ef616dd83a16a，clean14188/actual publish24617/registry94135/GitHub create35288及完整下载21859全部terminal0。
实际publish200，公开success/has_package=true/yanked=false、checksum与正式ZIP一致；566安装源逐字、静态4目标/Chrome28全部通过。
GitHub四附件逐字/远端digest和size/tag源码SHA全部过；正式构建至闭环无tracked写/commit，release-live complete无live。
模块2258118bytes/SHA1bea6b23cbce9a240e004e22be02fbfbe7c70e335173ad8d132cf66eb7e9968f；source2294805bytes/SHA4f1552295d07ff44b02383d0b5e83ff200a823abaf1bf42cf6788aa449cf73dd。
