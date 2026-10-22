# 跨级时钟递推的检查式迭代参考

固定基线：Matplotlib **v3.11.2**，commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`；dateutil **2.9.0.post0**。
`scripts/generate_clock_iteration_reference.py` 执行原 `rrulewrapper`、`RRuleLocator`、
原日期转换 helper 与原 dateutil rrule，不导入已安装 Matplotlib。运行环境为
Python **3.12.14**、NumPy **2.3.5**。

| 来源 | SHA-256 |
| --- | --- |
| dates.py | `fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233` |
| dateutil/rrule.py | `289cca95a09dd6311bbb8037f1996db256a801487d9d26dd6ce15d8e9ef429ec` |
| dateutil/tz/tz.py | `1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a` |
| dateutil/tz/_common.py | `720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e` |

## 行为与共享实现

MINUTELY/SECONDLY 的同级 `__construct_byset` 筛选通过后，跨级 hour/minute mask
仍可能不可达。例如从2024-01-01 12:00开始：

- Minutely，interval1440，byhour13/byminute0；
- Secondly，interval86400，byhour13/byminute0/bysecond0。

两者构造成功，首次读取 iterator 时 ValueError。source 的分钟/秒推进会在完整 clock
周期找不到值时抛错，发生在 count、until、查询比较能够终止迭代之前。count0/负count、
until早于start、before早于start、反向或不重叠between、xafter count0 均不能吞掉该错误。

实现抽取已有 `recurrence_clock_slots` 为惰性 residue iterator，按
`gcd(interval, units_per_day)` 枚举同一24h周期的可达slot。原候选生成复用其 to_array，
检查式 reader 复用 next 判断。只检查成功 core，失败 set 留下的 raw construct 不参与；
不把普通 calendar filter 无匹配当作时钟错误。检查不读取日期 epoch、显示 rc 或 host clock。

`after/before/between/xafter` 与 `occurrence_count` 共用检查式 reader；before 的窗口优化
在早返回前执行同一检查。`occurrence_count()` 现在标记 `raise DateError`，与原 count()
可能抛错一致。在非 raising callback 中需显式 try/catch 或对已知有效规则使用 try!。

新增 `checked_raw_iter() -> RRuleDateIterator`：

- 构造 reader 不抛迭代错误；`next() -> RRuleDateTime? raise DateError` 首次读取时检查；
- 返回底层 naive 日期，不附 wrapper 有效 timezone；
- 已结束或出错的 reader 后续返回 None；
- 保存成功 core/cache 的 snapshot，之后 wrapper.set 不改变旧 reader；
- copy 使用独立空cache，set 创建新core/cache；错误不会把旧cache标为complete或增加值。

原 `raw_iter() -> Iter[RRuleDateTime]` 继续作为不抛错的 Moon native Iter 扩展，支持
map/take/for；它将不可达 clock masks 表示为空。需要原迭代错误语义时使用
checked_raw_iter。旧 RRule/raw_rule 的 native Iterator 空规则扩展同样保持。
检查式查询不会被这种 legacy reader 留下的空 cache.complete 隐藏。

RRuleLocator 直接日期查询仍传播 DateError；DateLocator/Axis 的既有安全numeric adapter
将错误映射为空 ticks。规则修复后恢复生成；这属于现有 port UI 错误边界。

## 原源参考和缓存说明

`clock_iteration_reference.json` 与 `ticker/date/clock_iteration_reference_test.mbt` 含
**208 named、2912观察**：128个主要边界矩阵、其他跨级 mask、合法可达/零count/提前until、
普通calendar无匹配、年1/9999。每例构造必须成功，检查9种查询/count、3次同一reader读取、
direct locator 与 numeric adapter。原source错误类型和输出均记录在JSON；Moon映射为
DateError。near-year bounds 还可在locator重新构造时触发既有同级相位错误。

原 Python cached iterator 遇到 ValueError 时可能留下已获取的线程锁，再创建 reader
或查询同一失败 core 会死锁。因此参考每个操作使用新规则，错误后只继续读同一已关闭的
generator。Moon typed cache 无 Python 并发锁，不模拟锁/死锁协议；验证逻辑前缀、lazy
构造、终止、set/copy/旧reader快照与恢复。未把挂死当成应复制的接口。

补充测试验证：checked reader 在set前后的快照、失败set保持旧core、copy独立、空legacy
cache不掩盖错误、错误时缓存不变、独立epoch包、无Node、named locator到Axis的错误映射
与恢复；checked API文档示例也纳入测试。所有参考输入显式dtstart，不依赖生成时日期。

```sh
python3 scripts/generate_clock_iteration_reference.py /path/to/pinned/dates.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

## Typed 范围与许可

沿用有效非空 selector、正Int32 interval、年1..9999/微秒与100000 eager上限；checked raw
reader 与 count 无额外 occurrence 上限。不宣称 Python 动态迭代代理、线程锁、反射/pickle
协议。无新增外部依赖或运行时Python；沿用根目录Matplotlib/dateutil许可及第三方说明。
