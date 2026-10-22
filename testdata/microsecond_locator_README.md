# MicrosecondLocator 原源参考

固定 Matplotlib **v3.11.2**，commit
`d3ca9172e392048ec242b90e8423e88d1a3000b2`。生成器执行原 `MicrosecondLocator`、
`MultipleLocator`、`_Edge_integer`、`DateLocator.nonsingular`、日期转换和 timezone helper，
不导入已安装 Matplotlib。Python **3.12.14**、NumPy **2.3.5**、dateutil **2.9.0.post0**。

| 来源 | SHA-256 |
| --- | --- |
| dates.py | `fb8d673fbc57c2499f2dd138c87c6c9520a59b38b60b01a6d59d5eb6540ef233` |
| ticker.py | `49d4586a18a4488387411b168d8064bb60e1f59d478e139965e2f7cef509e2ad` |
| CPython Objects/floatobject.c | `d558f168de7ec864b64ffad7ee2b056bda4efca1ee68ca690189354b893ccc76` |
| dateutil/rrule.py | `289cca95a09dd6311bbb8037f1996db256a801487d9d26dd6ce15d8e9ef429ec` |
| dateutil/tz/tz.py | `1149c474c7de4e15e263a978b21f7205a6d9eb7fcf3b3cb4d734ac87db619f5a` |
| dateutil/tz/_common.py | `720cc34c036c397bc473ce9c605efb12c962b9269bf0fbb0a6c979f9b5f7fd2e` |

## 对象与转换顺序

`MicrosecondLocator::new(interval=1.0, tz?, timezone?, context?)` 接受有限正 Double，
包含分数微秒、subnormal 和大于 Int32 的值。先捕获显示 timezone，再验证 interval，
构造不读取 clock 或 epoch。context 仅用于首元素 aware、后续 naive 的宿主时间解释。

直接 `tick_values(first:RRuleDateTime,last:RRuleDateTime)` 先执行整个日期数组的 date2num：

- 首元素 aware：先把全部日期精确转换为 UTC 并检查 Python 年界，后续 naive 使用 host；
- 首元素 naive：使用 NumPy datetime64 路径，后续 aware 的偏移向零截断到整分钟；
  不执行 Python aware UTC 年界预检。

转换与 RRuleLocator 共用 `date_values_to_numbers`。然后先从**原始第一个端点**取
`floor(nmin)`，减去该原点并缩放成当天微秒，最后由 multiple grid 排序。直接倒置查询
仍输出升序，且可能因原点不同而与正向查询有不同舍入。显示 timezone 不改变 UTC 网格。
保留源邻接点、重复坐标与超出 Gregorian 年界的刻度；远离 epoch 的微秒精度仍受 binary64
限制。旧 `microsecond_locator(Int32)` 继续裁掉不支持的年界坐标。

numeric adapter 先按显示 timezone 执行公共 num2date，随后调用直接查询；按项目约定保留
输入方向，错误返回空 ticks。非有限输入同样先选择 epoch，再返回空值。Auto 微秒分支
复用新对象，直接传已解码字段，避免 fractional epoch 二次逆转换。

`interval()` 在命名对象上返回准确 Double。`as_locator().interval_value()` 也准确；
旧 `DateLocator.interval()->Int32` 对新对象截断分数，超大值饱和为 2147483647。
`nonsingular` 使用准确值，`microsecond_locator()` 可取回对象。copy/with_offset/
with_timezone、主次日期轴、共享轴及 SVG 维持同一精度。

## 浮点网格与范围

共用现有微秒 kernel，按 CPython/NumPy 的 divmod 实现正余数与商的整数修正；
`1.0 // 0.1 == 9.0`，不能替换成 `floor(1.0 / 0.1)`。`_Edge_integer.ge` 的近零容差和
`MultipleLocator` 的 `0.001 * step`、邻接点及 arange 运算顺序均保留。

eager 返回最多 **100000** 个前缀刻度；非有限 alignment/count 抛 DateError。
极大有限 interval 可以产生无限刻度坐标，直接查询保留原源结果。非正、NaN、无限
interval 在 typed 构造阶段拒绝；不宣称原 Python 动态参数的全部异常/对象协议。
通用 `ticker.MultipleLocator` 的公开对象及 view_limits/rc 接入见
[数值定位器说明](multiple_locator_README.md)。D20将共用网格移至 `internal/tick_grid`，
72组divmod参考随之移到该包，日期接口与观察保持原样。

## 参考覆盖与重现

`scripts/generate_microsecond_locator_reference.py` 生成 JSON、黑盒/白盒测试及两个
自定义 epoch helper：

- **173 named**：年1/1970/2000/2400/9999、分数步长、倒置/跨日/年界、极值、
  NY/Lord Howe gap/fold、负 DST、秒级偏移、mixed awareness、host/default rc、nonsingular；
- **72 divmod**：CPython 与 NumPy 逐位核对商和余数，覆盖正负零、subnormal、极大值；
- **48 epoch观察**：fractional 2000 与2400原点，直接/数值倒置与 Auto 已解码字段；
- 手写 cap、精确元数据/zone copy、构造/预检不锁 epoch、非有限 numeric 锁 epoch、
  无 Node、主轴绑定及共享倒置 SVG 回归，另有 checked API 示例。

参考 arange 在请求超过100000项时立即失败以避免巨量开发时分配；该预算错误不会被
当成上游错误。`interval=1e-300` 的非零 point 可能因舍入要求约1.11e284项，故该样本
只验证生产前缀上限，原源枚举使用零 point。运行参考不修改原日期/网格算术。
TZif fixtures 的 hash 校验来自 `tzif/manifest.json`，使用 dateutil 的 fat 32位读取语义。
源类的抽象 ticker base/超量告警 sink 使用测试替身，epoch与host TZ 显式设置并恢复。

```sh
python3 scripts/generate_microsecond_locator_reference.py /path/to/pinned/dates.py --check
moon info && moon fmt
moon check --target all
moon test --target all
```

没有新增运行时依赖、Python 或自有 C；许可沿用根目录 Matplotlib/dateutil 说明。
