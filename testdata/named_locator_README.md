# 命名日历和时间定位器参考

`MonthLocator`、`WeekdayLocator`、`DayLocator`、`HourLocator`、`MinuteLocator` 与
`SecondLocator` 使用固定 Matplotlib **v3.11.2** 的原始六个 class AST 验证，commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`。继承的 RRuleLocator/DateLocator/rrulewrapper
及日期数值转换均执行原实现。生成器还执行原 `_get_tzinfo`，不以简单 timezone stub 代替
无效名称、默认 rc 捕获和构造顺序；仅抽象 locator/axis/warning sink 使用既有最小 stub。
不导入已安装 Matplotlib。

来源哈希（dates/ticker/rc 也由共享 loader 校验）：

| 来源 | SHA-256 |
| --- | --- |
| dates.py | `fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233` |
| dateutil/rrule.py | `289cca95a09dd6311bbb8037f1996db256a801487d9d26dd6ce15d8e9ef429ec` |
| dateutil/tz/tz.py | `1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a` |
| dateutil/tz/_common.py | `720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e` |

参考环境：Python **3.12.14**、dateutil **2.9.0.post0**、NumPy **2.3.5**。
NY/Lord Howe/Paris 的输入取 `testdata/tzif/manifest.json` 固定 fat fixture，经注册名称
选择与原 dateutil.tzfile 相同的32位兼容区块；GNU TZ 负DST和秒级fixed offset另有参考。

## 构造和生命周期

| 命名对象 | 默认 selector | 固定较小时间字段 | 频率 |
| --- | --- | --- | --- |
| MonthLocator | 全部月份、月日1 | h/m/s=0 | Monthly |
| WeekdayLocator | 周二（Monday=0，Tuesday=1） | h/m/s=0 | Daily |
| DayLocator | 月日1..31 | h/m/s=0 | Daily |
| HourLocator | 小时0..23 | m/s=0 | Hourly |
| MinuteLocator | 分钟0..59 | s=0 | Minutely |
| SecondLocator | 秒0..59 | 无 | Secondly |

每个命名对象只封装已验收的 RRuleLocator，委托日期算法、rule/timezone/unit/interval、
with_timezone/with_offset 和两个 adapter。没有增加重复日期计算或新的 DateLocator 存储。
`rule()` 为共享可变 wrapper；`as_locator()`、它的 copy、Axis 安装/读取与共享轴都保留
这一 handle。unit/interval 读取当前成功 core；with_timezone/with_offset 返回改变显示
zone 的对象，保留 wrapper。普通 RRuleLocator adapter 的 kind 仍为 Recurrence。

数组 selector 使用源关键字（如 byhour），scalar 使用对应 `_value`（如 byhour_value），
二者互斥。Month 的 bymonthday 也支持两种形式。Weekday 另外支持 on_weekday 单个对象或
byweekdays 对象数组；Daily 忽略 nth，wrapper 保留对象以便后续 set(frequency=Monthly)
恢复 ordinal 语义。构造数组引用保留到 raw construct，下次 set 才重新消费，core 是快照。

`null=[source_keyword]` 传明确 None。Month bymonth、Day bymonthday、Hour/Minute/Second
的 selector None 恢复其完整默认范围；Weekday byweekday None 解除星期筛选，Month
bymonthday None 解除月日筛选。null 仅接受该构造器对应的 source selector 名称。

默认 dtstart 来自 host local now；显式 DateParserContext 提供可复现 clock 或浏览器
所需规则。构造先创建 rule/采样 clock，再捕获显示 timezone（与 wrapper base 独立）。
DayLocator 对正 interval 的检查在 clock 前。其他类的 interval 沿现有正 Int32 typed
范围，Python 某些可接受但迭代不终止的非正参数不属于该 typed 协议。

日期查询复用 wrapper 的 naive candidate 后附时区语义，保留 imaginary gap、fold0、
可能重复/不单调的 UTC 坐标。原小写 helper 的 skip-gap/双 fold 扩展继续独立。
直接 bounds 保留 RRuleDateTime awareness，numeric adapter 按项目约定排序再倒置输出。
无匹配结果回退原端点；动态查询/失败阶段和更多边界见
[wrapper指南](rrule_wrapper_README.md)。

## 时钟 selector 构造检查

原 dateutil `__construct_byset` 对与频率同级的 BYHOUR/BYMINUTE/BYSECOND 按
`gcd(interval,24/60)` 筛选可到达值，无可到达值时在构造/重建时抛错。
wrapper 现在保留该阶段：成功 core 持有筛选结果，原 construct 数组保持完整供下次 set。
raw_rule().replace 读取 core，不能把被剔除值重新带回。旧 RRule 的空规则扩展保持原样。
通用 wrapper 参考增加3个不可达构造与1组 core/construct/replace 更新案例。

## 参考规模与真实接线

`scripts/generate_named_locator_reference.py` 生成 `named_locator_reference.json` 与
`ticker/date/named_locator_reference_test.mbt`：**144 named、173 states**，其中15个构造
错误检查 invalid display/default rc、Day interval 前置和 Hour 不可能相位。其余覆盖：

- 六类默认值、scalar/array/object/None、Weekday 对象跨频率、interval phase；
- clock 次数、raw core start/until/reader、更新/失败/恢复、外部 selector 数组变动；
- 原 timezone rc 捕获、秒级offset、NY/Lord Howe gap/fold、负DST、历史Paris；
- 年1/9999、倒置、direct/generic/adapter、with_offset/with_timezone 共享 rule；
- fraction 与2400 epoch的12组 direct/numeric观察，写入两个既有隔离测试 helper。

controlled clock 只替换 rrule 模块的 datetime namespace，保留真正 datetime isinstance；
host TZ=UTC0，结束后恢复。JSON 保存修改前的原始 case，数组更新另记入每个 state。

6个 checked API 示例、1个重复输入形态前置错误、shared inverted SVG live月日更新、
major/minor绑定、无Node全家族与epoch纯度测试补充真实场景。Python仅用于开发生成参考。

```sh
python3 scripts/generate_named_locator_reference.py /path/to/pinned/dates.py --check
python3 scripts/generate_rrule_wrapper_reference.py /path/to/pinned/dates.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

## Typed 边界与许可

日期年1..9999/微秒，interval正Int32，selector为既有有效非空范围，所有错误对应 DateError。
不宣称 Python 任意动态对象/反射/pickle/pytz 协议；raw_iter 为已有 typed 惰性日期流扩展。
eager 输出最多100000。完整 dateutil 对象协议仍按兼容清单逐项迁移；跨级不可达clock masks的checked查询错误现已接入共享reader，详见clock_iteration_README.md。

沿用根目录 Matplotlib/dateutil 许可与第三方声明。无新增外部依赖、C代码或运行时Python。
