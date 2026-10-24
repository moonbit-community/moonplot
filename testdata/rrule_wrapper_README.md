# rrulewrapper 与 RRuleLocator 原源参考

基线为 Matplotlib **v3.11.2**，commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`。两个生成器执行固定 `dates.py`
中的原 class AST，使用原 python-dateutil **2.9.0.post0**，不导入已安装 Matplotlib。
MoonBit 运行时不依赖 Python。

| 输入 | SHA-256 |
| --- | --- |
| dates.py | `fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233` |
| dateutil/rrule.py | `289cca95a09dd6311bbb8037f1996db256a801487d9d26dd6ce15d8e9ef429ec` |
| dateutil/tz/tz.py | `1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a` |
| dateutil/tz/_common.py | `720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e` |
| dateutil/relativedelta.py | `218fe6825323a196d87ebbe5a1363671ed366a25633c892265faa03536517ee0` |

定位器生成器还复用原 `DateLocator`、日期转换 helper、NumPy 2.3.5，及已固定哈希的
`ticker.py`/rc AST loader。外层 `Locator.raise_if_exceeds` 返回原值，忽略 Python 的
大 tick 数警告；没有重写定位器算法。Python 为 **3.12.14**。

## 已固定的行为

- `RRuleDateTime::naive/aware/from_local` 在 wrapper 边界保留 awareness；原 `DateTime`
  模型不变。from_local 的 fold 与 dateutil attach 对应。查询结果在纯 naive recurrence
  生成后附加有效时区；普通 gap 保留 imaginary post-gap offset，普通 fold 只留 fold0。
  dateutil tzstr 的负 DST 按原标准墙钟标签求 offset，可能保留 gap 前 offset。
  因此 UTC 输出可能重复或不单调。完整 TZif/旧 `RRule` 的 skip-gap/双 fold 扩展仍独立。
- 显式 base timezone 与由 aware dtstart 推断的有效 timezone 分开保存。构造会把 aware
  dtstart/until 转到 base 并去掉时区，dtstart 截整秒。推断时区不会变成 base，后续
  `set()` 消费已 naive 的 dtstart 时有效时区消失。
- `set()` 按源更新阶段保留部分状态：normalizer 错误留下新构造参数；core 构造错误还
  可以留下新的时区 metadata，但保留旧成功 core。修复对应参数后继续构造。
- `null=["count", "until", ...]` 表示明确传入 Python None。省略 dtstart 才使用 host
  local now；明确 null dtstart/until 会抛出 checked DateError。count<=0 为零 occurrence。
  默认时钟每次重建采样，复用 `DateParserContext`，不按 wrapper base zone 改变 now 字段。
- 无有效时区的 aware query 仅在实际进行 naive/aware 比较时抛错，空 core 可直接返回空。
  between 先比较 upper 再 lower，xafter count0 也先比较首个匹配候选。有有效时区的
  after/before 无匹配时，源 attach(None) 抛错，MoonBit 对应 DateError。
- `byweekdays=[mo.with_nth(2)]` 支持月/年 ordinal weekday，年可按 bymonth 收窄；更细
  频率忽略 nth。普通和 ordinal mask 混合采用交集。raw_rule().replace 降频时重新映射。
- 调用方配置数组保留引用，旧 core 已复制 selector；原数组变动在下次 set 生效。
  显式 copy() 是独立配置数组/空缓存快照扩展，并保留失败后的状态，非 Python shallow copy。
- named `RRuleLocator` 在每次 range 调用时按 relativedelta 扩展并通过 wrapper.set 重建。
  display timezone 独立捕获。DateLocator adapter/其 copy/安装到 Axis 都共享 wrapper；
  unit、interval、nonsingular 动态读取成功 core。直接 bounds 保留 awareness/zone，倒置
  输入按原有符号 delta 处理；numeric adapter 按项目约定排序并倒置 ticks。
- wrapper 构造/更新/日期查询/raw_iter/count/copy 不读 epoch/显示 rc；只有数值转换/locator
  tick 输出选择 epoch。aware UTC 溢出在读 epoch 前检查。fraction 与 2400 epoch 原源参考
  覆盖直接 bounds 与 adapter 的公开 inverse 转换差异。

## 参考规模与文件

- `rrule_wrapper_reference.json`、`ticker/date/rrule_wrapper_reference_test.mbt`：
  **80 named、150 states**，检查 metadata、clock 次数、查询字段/offset、错误阶段、raw
  reader、count、数组变动、负 DST。默认 clock 在 rrule 模块局部 datetime namespace
  注入，保留 datetime isinstance；host TZ=UTC0，结束后恢复环境。
- `rrule_locator_reference.json`、`ticker/date/rrule_locator_reference_test.mbt`：
  **103 named、111 states**，同时检查 direct/numeric、调用前后 wrapper 状态、copy 的动态
  interval/unit/nonsingular。另为 tests/integration/epoch_fraction 与 epoch_2400 生成 helper。
- 独立 epoch 包、无 Node JS 测试、raw replacement/copy 回归、shared inverted SVG 与
  minor locator 测试补充真实接线；checked API 示例纳入 moon test。

NY/Lord Howe 参考使用 dateutil.tzfile 的 **32 位兼容区块**与
`testdata/tzif/manifest.json` 中的 fat fixture 哈希，MoonBit 端通过注册名称选择相同
profile。不能把这些输入替换为 production slim tzdb 的完整 64 位/footer profile。
GNU TZ、UTC、秒级 fixed offset 和 ±23 小时边界另有直接构造参考。

## 重现

```sh
python3 scripts/generate_rrule_wrapper_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/dates.py --check
python3 scripts/generate_rrule_locator_reference.py .moonagent/upstream/matplotlib-v3.11.2/lib/matplotlib/dates.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

省略 --check 可重新生成 JSON、MoonBit assertions 和 custom epoch helper。

## Typed 范围

frequency 为七个 RRuleFrequency，interval 正 Int32；wkst 默认 Monday=0，显式为0..6。
配置 selector 复用现有非空有效数组检查，不支持 Python 任意动态参数容器或 calendar
全局 firstweekday。RRuleDateTime 日期字段为年1..9999/微秒，所有错误映射为 DateError，
不复制 Python exception class。byweekday 为整数数组；weekday object 数组用 byweekdays，
二者是替代的关键字形式。bymonth_value/bymonthday_value提供scalar月/日形态，与对应数组
参数互斥；YearLocator按原_construct读取这些形态，详见year_locator_README.md。

xafter 统一返回 eager Array；between/xafter/numeric ticks 最多100000项。raw_iter 是独立
惰性 naive stream，occurrence_count 按自然结束完整统计；密集无 count/until 规则可能很长。
raw_rule 返回已有 typed RRule snapshot，其旧 ordinal 查询协议保持不变。
不宣称 Python 动态 callable 代理、迭代/索引/反射/pickle 协议或 pytz.localize 适配。
Matplotlib/dateutil 许可见 docs/licenses/LICENSE-MATPLOTLIB、docs/licenses/LICENSE-DATEUTIL 与第三方声明。

同级 clock selector 的构造/重建现在按原 `__construct_byset` 进行 gcd residue 筛选，
空结果即抛错；core 保存筛选值，raw construct 保持原输入，raw_rule.replace 不恢复已剔除值。
该差异由命名 locator 原源参考暴露，补充来源及范围见 named_locator_README.md。

跨级clock masks的迭代错误已通过checked查询/计数与新的checked_raw_iter对齐；
occurrence_count现在raise DateError。raw_iter仍为不抛的native Iter扩展，错误时机、cache/
快照与Python锁边界详见[递推迭代参考](clock_iteration_README.md)。
