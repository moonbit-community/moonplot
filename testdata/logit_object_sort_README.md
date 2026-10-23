# LogitFormatter Object 距离排序参考

本片已通过主任务统一编译和四目标行为门禁，Python 原源检查另外记录。

Object dtype 的距离向量由原 NumPy 先完整 subtraction、再完整 absolute，随后
`np.sort`。Object 默认排序走 generic `npy_quicksort`，不是前一个 tuple 键排序
采用的 CPython powersort，也不是把 NaN 统一排在末尾。`OBJECT_compare` 依次尝试
小于、大于；两个比较均为假时返回0，NaN 因而保留这种非全序比较的真实作用。

`ticker/formatter_logit_object_sort.mbt` 保留 NumPy2.3.5 的 median-of-three、
双向 do-while 扫描、先处理小分区、深度栈恢复、短分区 insertion，以及深度耗尽
后的 generic heapsort。深度检查位于原 outer loop；扫描先比较再检查交叉边界。
Heap 子节点计算使用 Int64，避免合法 Int32 数组地址域内的倍增溢出。无小长度
替代协议或100000前缀截断。

内部 helper 仅服务 LogitFormatter 新建的距离临时数组，支持冻结的六种
`ScalarNumber` 来源，并保留 Python float/int/bool 与 NumPy float64/int64/bool
的比较及首个异常。它不扩展到任意 Python object、子类 operator 或比较副作用。
原 OBJECT 比较在挂起异常后继续内部置换；本 helper 可直接抛首个异常，因为该
失败临时缓冲区不会暴露。失败时的内部排列不属于移植承诺。

独立生成器实际执行固定 CPython3.12.14/NumPy2.3.5 的
`np.sort(np.array(values, dtype=object))`，并用真实 `kind="heapsort"` 分别检验
fallback primitive；不使用翻译后的排序模型生成期望。当前220个 source cases
分成7个注册测试，每32个私有 case 一组：110 quicksort、110 heapsort，其中
213成功、5个原 C-long 转换 OverflowError、2个原 float 转换 OverflowError。
异常消息逐字保留；成功结果同时比较 scalar 来源和全部数值位。

语料含4元素 NaN 反例、16/17元素分界、分区/重复/NaN/Inf/signed zero、六种
数值来源、median3 adversary/organpipe/sawtooth，以及125001、200001、131073
元素的完整合法数组。大数组 JSON 的每个输入和输出 Float64 位都以 big-endian
UInt64 base64 无损保存；测试使用相同全量期望的 run 压缩或十进制 UInt64 文本，
展开后逐元素比较。没有只存前缀、头尾或按生产算法重算期望。

固定 NumPy v2.3.5 原代码及 SHA256：

| 文件 | SHA256 |
| --- | --- |
| `numpy/_core/src/npysort/quicksort.cpp` | `fd96048d864522a41c8de995194d2013a4aa8467eaa845cb9b5213c5b494b4c9` |
| `numpy/_core/src/npysort/heapsort.cpp` | `2526c80d9208f9bd07272ec150d92b7da34de0a470c4e3db966e2f621eb49642` |
| `numpy/_core/src/multiarray/arraytypes.c.src` | `2cc85885ed03da024edd7adcbed9b763449a2a9f168de3845089b9cbd20c373a` |
| `numpy/_core/src/multiarray/item_selection.c` | `a137b003ec36a46113895ae132338a87602542a5a71a5173dea5f15d340d1aa3` |

协议来源为 NumPy BSD 许可代码，排序原归属含 numarray/Charles R. Harris；完整
许可与总归属由主任务合并到项目 notices。本片没有新增运行时 NumPy 或 C 依赖。

复现生成与只读检查：

```sh
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_object_sort_reference.py
/Users/lampese/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3 scripts/generate_logit_object_sort_reference.py --check
```

生成和 `--check` 均 exit0；MoonBit 语法、类型和四目标行为已通过统一门禁。
stdin 格式检查与这些验收结果分别记录。
