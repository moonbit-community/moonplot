# YearLocator 原源参考

Matplotlib **v3.11.2**，commit `d3ca9172e392048ec242b90e8423e88d1a3000b2`。
`scripts/generate_year_locator_reference.py` 执行固定 `YearLocator`、`RRuleLocator`、
`DateLocator`、`rrulewrapper` 与原 `_Edge_integer`，不导入已安装 Matplotlib。
共享 loader 提供原 date2num/num2date、NumPy 与抽象 locator/axis 的最小 stub。

| 固定来源 | SHA-256 |
| --- | --- |
| dates.py | `fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233` |
| ticker.py | `49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad` |
| dateutil/rrule.py | `289cca95a09dd6311bbb8037f1996db256a801487d9d26dd6ce15d8e9ef429ec` |
| dateutil/tz/tz.py | `1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a` |
| dateutil/tz/_common.py | `720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e` |
| CPython _datetimemodule.c | `cd11d1f38e9e637c7404c98ff45e355053b7f7e8251015d58a4c1f17e6d5f8a8` |

原源运行环境为 Python **3.12.14**、dateutil **2.9.0.post0**、NumPy **2.3.5**。
NY/Lord Howe 使用 `testdata/tzif/manifest.json` 的 fat fixture 与 dateutil first-block
profile，在 MoonBit 端注册同一输入。另有秒级 fixed offset、±23h、负 DST、午夜 fold。

## 对齐行为

- `YearLocator::new(base=...,month=...,day=...,context=...)` 构造 naive YEARLY wrapper，
  再捕获显示时区。省略 dtstart 每次需要重建时读取 host now；显式 context 可注入 clock，
  构造不选择 epoch。显示 zone 与 wrapper base 独立。
- 正 Int32 base 在构造时冻结，用于 floor/ceil 年倍数并 cap 到1..9999。对应 typed 范围
  内的精确 Int64 运算与 `_Edge_integer(step,0)` 等价。后续 rule.set(interval=...)
  不改变对齐 base；unit/interval/nonsingular 仍读取最新成功 core。
- start 替换输入 vmin 的 year/month/day/hour/minute/second，保留其微秒、zone 与 fold；
  stop 只再替换 year。任一日期非法立即抛错，直到两日期有效才更新 wrapper。
  比如 Feb29 对齐到非闰年抛错，负 monthday 即使 core 接受也不能作为 replace 的 day。
- between 查询使用对齐后的 start/stop，可能生成视野外 ticks。start 微秒会使底层
  dtstart 的整秒 occurrence 被排除；stop 的微秒保留。空规则回退原输入端点。
- source `_construct` 保留 month/day 的动态形态。`RRuleWrapper.new/set` 的
  `bymonth_value`/`bymonthday_value` 表示 scalar；原 `bymonth`/`bymonthday` 是数组。
  scalar 与数组互斥，null 名单覆盖；省略保留旧值。Year 查询会拒绝 array（即使单元素）
  或显式 None 的日期字段，不把它们缩成合法 scalar。通用 recurrence 查询仍使用选择器数组。
- direct Year bounds 可混合 awareness：vmax 只提供 year，对齐 start/stop 都取 vmin 的
  zone/awareness。空结果 date2num 的首元素决定整组转换策略。首元素 aware 时，后续
  naive 日期按 host context 解释并在读取 epoch 前检查 UTC 年界；首元素 naive 时，保留
  NumPy datetime64 路径可编码 aware UTC 跨越年0/10000 的行为。
- host naive astimezone 复用原 CPython `local_to_seconds` 两 fold/±24h 探测算法。
  因此年1第一天或年9999最后一天的探测可能越界，即使最终 UTC 日期有效仍抛错。
  这也修正了共享字符串 parser 的同一转换入口；既有 parser 原源回归仍通过。
- `as_rrule_locator()` 保留 year alignment 模式；`as_locator()`/其 copy/Axis 安装共享
  wrapper。with_timezone/with_offset 只改 display。旧 `year_locator()` 的跳过无效日期等
  扩展保留独立，未静默改变。
- `AutoDateLocator` 的 year-multiples 分支也使用新对象，直接消费已 decode/round 的日期，
  不再次 inverse。新增可选 context 只在选中 year branch 时采样；Auto 构造不采样。
  浏览器缺少 host zone 文件时，可显式 `DateParserContext::utc/from_posix/from_tzif`。

## 验证数据

`year_locator_reference.json` 与 `ticker/date/year_locator_reference_test.mbt` 包含
**109 named、138 states**：base1/2/5/10/100/1000/Int32最大值、microsecond0/123456/
999999、闰日/非法月日/倒置/年界、zone、scalar/array/None 变更、失败阶段、默认 clock
重采样、混合 awareness、每次 direct/numeric 前后 core 与 copy 动态 metadata。

时钟只替换 rrule 模块的 datetime namespace，保留真实 datetime isinstance，host TZ
固定 UTC0 并在完成后恢复。输入和输出不依赖生成当天的日期。fraction/2400 epoch helper
另检查 direct Year 与 Auto year-multiples 的原源坐标，纳入既有隔离测试。
通用 wrapper 参考增加 scalar 选择器案例；checked API 示例、scalar copy/互斥回归、
无 Node context、invalid-year epoch 纯度、shared inverted SVG live 日期更新覆盖真实接线。

```sh
python3 scripts/generate_year_locator_reference.py /path/to/pinned/dates.py --check
python3 scripts/generate_rrule_wrapper_reference.py /path/to/pinned/dates.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

省略 --check 可重新生成。Python 仅用于开发参考，不参与运行时。

## Typed 范围与许可

base 正 Int32，日期字段遵循现有 selector/date 校验；不声明 Python float base、任意精度
或任意动态对象/字段赋值、反射/pickle 协议。显式 scalar 关键字是保留原 int 参数形态的
MoonBit 表达方式。DateTime 模型不变，fold 在 wrapper 边界私有保存。eager ticks 上限100000。

Matplotlib/dateutil 许可见根目录对应文件。CPython 源只参考算法与校验，不分发 C 代码；
沿用 `docs/THIRD_PARTY_NOTICES.md` 中既有 Python 行为重写声明。未增加外部依赖。
