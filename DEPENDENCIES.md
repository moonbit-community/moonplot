# Mooncakes 依赖评估

本项目的目标是迁移 Matplotlib v3.11.2 的完整公开绘图能力。依赖只在对应层确实需要时接入，核心数据模型和场景模型不暴露第三方类型。

## 已核查候选

| 包 | 版本 | 结论 | 接入边界 |
| --- | --- | --- | --- |
| `caijiewei295/tzif-engine` | `0.1.0` | Apache-2.0；源码/解析限制已核查；四目标各 847/847 通过 | `ticker/date` 私有 TZif load/PosixRule，公共 API 不暴露第三方类型 |
| `marianoguerra/temporal` | `0.1.0` | 已核查时区 provider；内置仅 UTC，仍需外部规则源；本轮不采用 | 不引入额外日期模型 |
| `Milky2018/xml` | `0.5.0` | 在当前 Moon `0.1.20260920` 上可编译；registry build success、仓库未归档 | `backend/svg` 的 XML 写出与结构测试 |
| `Milky2018/svg` | `0.6.0` | 提供 SVG 解析和 CPU 栅格化，适合后端验证 | 仅 `backend/svg` 或图像测试工具；不进入 `core`/`scene` |
| `mizchi/font` | `0.7.4` | 字体解析候选 | 文本测量和字体资源层，待阶段 5 评估 |
| `0717lee/pixelforge` | `0.19.0` | 图像处理和编解码候选 | PNG/图像后端，待阶段 7 评估 |
| `mizchi/numbt` | `0.2.4` | 维护中，主要提供 native Float/BLAS | 可选 native 加速；不作为跨平台 binary64 核心 |
| `bobzhang/colors` | `0.8.2` | 有维护活动和 Double 颜色空间转换 | 使用前核对 registry 元数据与仓库许可证 |

## 暂不采用

| 包 | 原因 |
| --- | --- |
| `Kaida-Amethyst/matplotlib` | registry 标记为 legacy，并依赖 Python bridge，不能作为独立 MoonBit 迁移基础 |
| `tonyfettes/cairo` | registry build success，但元数据中的 GitHub 仓库返回 404，维护状态未确认 |

## 接入规则

1. `core` 只使用 MoonBit 自身的 `Double`、数组和错误类型，保证 Wasm/native 的基础语义一致。
2. `scene` 只产生后端无关的图元和布局结果；任何 XML、位图或 C 类型都不能泄漏到该层。
3. `Milky2018/xml` 只有在 `backend/svg` 开始结构化编码时加入，并用 `moon add` 固定版本后提交 `moon.mod` 变化。
4. native 图像、字体和 GUI 依赖分别放入对应后端包，不能为了一个后端改变公共绘图 API。
5. 每次增加依赖都记录版本、构建状态、许可证核查结果和最小验证命令。

## 当前验证依据

候选版本来自本轮 Mooncakes registry/仓库状态核查。`0.6.1` 的 registry 包在当前工具链上引用了已不存在的 `Int32`，因此本项目固定使用兼容的 `0.5.0`，并已通过 `moon check --target all`、`moon test` 和 native 测试。未接入的候选不应出现在核心包的公开 `.mbti` 中。

## D01 TZif 数据接入

- 固定 `caijiewei295/tzif-engine@0.1.0`（Apache-2.0），声明的传递模块依赖为
  `moonbitlang/x@0.4.46`（Apache-2.0）。仅 `ticker/date` 导入解析 facade、
  私有类型和 POSIX evaluator；自有 transition/gap/fold/recurrence 继续复用。
- 包源码与 LICENSE 已从 Mooncakes 0.1.0 归档核对；不修改或复制解析器实现。
  候选信息：[Mooncakes](https://mooncakes.io/docs/caijiewei295/tzif-engine@0.1.0)。
- TZif 标准：[RFC 9636](https://www.rfc-editor.org/rfc/rfc9636.html)。本 adapter
  支持 v2/v3；v1/v4、leap-second 表及超出 DateTime offset 范围的数据显式拒绝。
- 基础 date 包接受调用方 Bytes；D02 另有可选独立 tzdb 生产数据包。IANA 2026e fixtures 属公有领域，仅用于
  黑盒测试；编译器、源数据哈希与复现说明在 `testdata/tzif/README.md`。
- 验证日志：`.moonagent/checkpoints/D01-{narrow,info,fmt,check-all,test-all}.log`。

D01 最终验证：moon info && moon fmt、moon check --target all 通过（8 条已有 warnings）；
专项 178/178，wasm/wasm-gc/js/native 各 847/847。未出现第三方公开类型。

## D02 可选 IANA 名称数据库

- 新 `ticker/date/tzdb` 包内嵌 IANA tzdata **2026e** 标准构建的全部 598 个
  Zone/Link 名称（包含 backward）；345 份去重 TZif slim，共 206817 字节。
  复用 D01 的解析依赖，无新增 Mooncakes 依赖，也不引入第二套日期模型。
- 再次核查 `moonbitstack/moondate`：文档明确不含 named DST/IANA；temporal
  仍需外部 provider；tzif-engine 为解析器，不分发完整库。此处直接复用官方
  public-domain 数据与 pinned zic，非手写时区规则。
- 基础 date/scene/pyplot 的生产导入不依赖 tzdb；scene/pyplot 仅在黑盒测试导入。
  用户显式导入 tzdb.timezone(name)，再把自有 DateTimeZone 传入已有入口。
- 官方源归档/哈希、源文件清单、canonical/alias→内容索引与每项哈希见
  `ticker/date/tzdb/manifest.json`；许可随包保存；不启用可选 backzone/packrat，
  不含系统 localtime、leap/right 或任意 POSIX TZ 字符串解析。
- `scripts/generate_tzdb.py` 从校验后的固定归档在临时目录构建 zic，逐一核对
  源 Zone/Link 与产物名称；--check 可在不改 checkout 的情况下复现验证。
  全部名称的历史/未来参考 offsets 由 Python zoneinfo 读取同一 TZif 独立产生。
- D02 验证进度/日志见 MIGRATION_STATUS 与 `.moonagent/checkpoints/D02-*`。

D02 最终验证：独立生成 --check、info/fmt、check --target all 通过；
专项 14/14，wasm/wasm-gc/js/native 各 861/861，每目标包含全名称 8372 个参考 offset 断言。

## D11 日期字符串宿主上下文

- `moonbitlang/x@0.4.46` 从已存在的传递依赖提升为显式固定依赖（Apache-2.0），
  仅 `internal/date_host` 在 native/Wasm 复用 `x/fs.read_file_to_bytes`；无新增自有Cstub。
- JS使用guarded `process.getBuiltinModule`读文件，避免静态node:fs导入；无该能力的
  嵌入宿主显式提供 `DateParserContext`。clock复用 `core/env.now`，外部可注入毫秒回调。
- TZif/POSIX与is_dst查询继续复用已固定的TZif Engine；基础date不导入可选tzdb。
  tzdb仅增加 `parser_context(name)` 复用其原Bytes索引。宿主文件读取按调用惰性发生，
  不写文件、不改变系统TZ；受控测试的环境变量修改均恢复。
- 默认采用固定CPython采样profile，`with_local_info`接入另一宿主的std/dst descriptor。
  source/reference/runtime能力边界与验证见 `testdata/date_parser_README.md` 和D11检查点。

## D12 默认日期时区

复用 D11 的 host Bytes 读取和现有 TZif Engine parser；日期字符串 gettz profile
读取第一32位兼容区块，widen后交给同一checked parser，完整IANA路径继续保留原模型。
GNU TZ名称offset与dateutil相同；其calendar/weekday计算使用现有本地Gregorian日历，
按需查询目标年份，不物化万年转换表。无新增依赖或自有C代码。
可选tzdb.register_timezone只注册指定名称的原Bytes；基础date仍不生产导入tzdb。

## D13 日历相对运算

仅增加 `moonbitlang/core/bigint` 和 `core/string` 标准库导入，无外部依赖或自有C代码。
精确binary64→decimal量子→binary64复用BigInt和parse_double，避免Double先乘10^n的伪tie；
scale的截断整数通过BigInt作carry/cancellation，归一后检查typed Int64/finite Double范围。
DateTime日历/时区墙钟算术沿用既有模型，between按zone handle identity区分墙钟/instant。
原始dateutil/CPython源码和参考只用于开发验证，不在运行时加载Python或上游源文件。

## D14 rrulewrapper 与 named RRuleLocator

复用 DateParserContext、RRule/RecurrenceCache、纯 calendar candidate、DateTimeZone 与
RelativeDelta；只抽取已被两个调用链实际需要的 calendar window/dispatch。
无新增依赖、Python运行时或自有C。dateutil tzstr 的墙钟 offset 选择参考原
`tz/_common.py::tzrangebase`，与完整 TZif 及旧 instant recurrence 语义分开保留。
参考脚本使用开发依赖Python3.12.14、dateutil2.9.0.post0/NumPy2.3.5，固定源与许可见
[testdata/rrule_wrapper_README.md](testdata/rrule_wrapper_README.md)。

## D15 自动日期 recurrence 接线

AutoDateLocator复用D14公开wrapper/locator及已decode bounds，无新依赖。
dateutil POSIX fromutc/utcoffset两次mask通过共享私有helper实现；完整TZif evaluator不变。
原源92组transition cases、旧自定义epoch及scene/pyplot回归保留在auto_locator参考指南。

## D16 命名年定位器

YearLocator与Auto年倍数分支复用RRuleWrapper/RRuleLocator/DateParserContext；wrapper仅新增
私有calendar形态标记和可选scalar参数，无新增外部依赖。共享naive host解释入口直接按固定
CPython3.12.14 local_to_seconds/两fold探测重写，并保留年界错误；不包含C实现或Python运行时。
原源、clock注入及typed范围见testdata/year_locator_README.md。

## D17 命名日历/时间定位器

六个命名类复用RRuleLocator/RRuleWrapper，只有构造默认值/None/scalar-array归一共享helper。
同级clock selector相位筛选重用本地gcd，在wrapper构造时执行，旧RRule扩展不变。
原源generator执行六class与原_get_tzinfo，控制开发时clock/hostTZ，不增加运行时依赖。
参考与typed范围见testdata/named_locator_README.md。

## D18 检查式递推迭代

复用既有24h clock slots/residue/gcd模型，候选与错误检查共享惰性slot iterator；新增opaque
RRuleDateIterator，不引入外部iterator、线程库或Python运行时。旧RRule/native Iter扩展保持。
来源、checked count签名与缓存边界见testdata/clock_iteration_README.md。

## D19 命名微秒定位器

新MicrosecondLocator与旧helper共用Double multiple/divmod kernel；whole-array日期转换
由RRuleLocator抽取复用，Auto直接传已解码字段。CPython/NumPy浮点divmod及NumPy首naive
秒级偏移截断通过固定开发运行时验证，无新增外部依赖、Python运行时或C实现。
范围、精确间隔getter与173named/72逐bit参考见testdata/microsecond_locator_README.md。

## D20 数值固定间隔定位器

数值MultipleLocator与D19微秒定位器共用新内部包`internal/tick_grid`：把既有CPython/NumPy
divmod、Edge ge及multiple grid提取并补le/offset，由数值/DataError和日期/DateError入口适配。
不增加外部依赖、运行时Python或自有C实现，旧日期helper/API保持原行为。
config增加`axes_autolimit_mode`，axis复用已有margin/sticky/shared/secondary与render链路。
参考生成仅使用既有开发Python3.12.14、NumPy2.3.5和固定Matplotlib源码；来源、typed边界
及重现命令见[testdata/multiple_locator_README.md](testdata/multiple_locator_README.md)。
