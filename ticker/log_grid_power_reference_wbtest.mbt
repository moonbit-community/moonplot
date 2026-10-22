// Independent exact/Decimal mathematical powers and actual NumPy-expression source powers.

///|
test "Log integer power independent mathematical 0" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -1075.0)], [-0.0])
}

///|
test "Log array power actual Darwin source 0" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -1075.0)], [-0.0])
}

///|
test "Log integer power independent mathematical 1" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -1074.0)], [0.0])
}

///|
test "Log array power actual Darwin source 1" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -1074.0)], [0.0])
}

///|
test "Log integer power independent mathematical 2" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -1024.0)], [0.0])
}

///|
test "Log array power actual Darwin source 2" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -1024.0)], [0.0])
}

///|
test "Log integer power independent mathematical 3" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -324.0)], [0.0])
}

///|
test "Log array power actual Darwin source 3" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -324.0)], [0.0])
}

///|
test "Log integer power independent mathematical 4" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -308.0)], [1.0e-308])
}

///|
test "Log array power actual Darwin source 4" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -308.0)], [1.0e-308])
}

///|
test "Log integer power independent mathematical 5" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -100.0)], [1.0e-100])
}

///|
test "Log array power actual Darwin source 5" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -100.0)], [1.0e-100])
}

///|
test "Log integer power independent mathematical 6" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -6.0)], [1.0e-06])
}

///|
test "Log array power actual Darwin source 6" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -6.0)], [1.0e-06])
}

///|
test "Log integer power independent mathematical 7" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -4.0)], [0.0001])
}

///|
test "Log array power actual Darwin source 7" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -4.0)], [0.0001])
}

///|
test "Log integer power independent mathematical 8" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -3.0)], [-0.001])
}

///|
test "Log array power actual Darwin source 8" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -3.0)], [-0.001])
}

///|
test "Log integer power independent mathematical 9" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -2.0)], [0.01])
}

///|
test "Log array power actual Darwin source 9" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -2.0)], [0.01])
}

///|
test "Log integer power independent mathematical 10" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, -1.0)], [-0.1])
}

///|
test "Log array power actual Darwin source 10" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, -1.0)], [-0.1])
}

///|
test "Log integer power independent mathematical 11" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 11" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 12" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 1.0)], [-10.0])
}

///|
test "Log array power actual Darwin source 12" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 1.0)], [-10.0])
}

///|
test "Log integer power independent mathematical 13" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 2.0)], [100.0])
}

///|
test "Log array power actual Darwin source 13" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 2.0)], [100.0])
}

///|
test "Log integer power independent mathematical 14" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 3.0)], [-1000.0])
}

///|
test "Log array power actual Darwin source 14" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 3.0)], [-1000.0])
}

///|
test "Log integer power independent mathematical 15" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 4.0)], [10000.0])
}

///|
test "Log array power actual Darwin source 15" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 4.0)], [10000.0])
}

///|
test "Log integer power independent mathematical 16" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 6.0)], [1000000.0])
}

///|
test "Log array power actual Darwin source 16" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 6.0)], [1000000.0])
}

///|
test "Log integer power independent mathematical 17" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 100.0)], [1.0e+100])
}

///|
test "Log array power actual Darwin source 17" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 100.0)], [1.0e+100])
}

///|
test "Log integer power independent mathematical 18" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 308.0)], [1.0e+308])
}

///|
test "Log array power actual Darwin source 18" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 308.0)], [1.0e+308])
}

///|
test "Log integer power independent mathematical 19" {
  verify_log_grid_bits([log_grid_integer_power(-10.0, 1024.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 19" {
  verify_log_grid_bits([log_grid_numpy_power(-10.0, 1024.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 20" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -1075.0)], [
    -5.03380647601406e-190,
  ])
}

///|
test "Log array power actual Darwin source 20" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -1075.0)], [
    -5.03380647601406e-190,
  ])
}

///|
test "Log integer power independent mathematical 21" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -1074.0)], [
    7.550709714021091e-190,
  ])
}

///|
test "Log array power actual Darwin source 21" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -1074.0)], [
    7.550709714021091e-190,
  ])
}

///|
test "Log integer power independent mathematical 22" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -1024.0)], [
    4.814494855534925e-181,
  ])
}

///|
test "Log array power actual Darwin source 22" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -1024.0)], [
    4.814494855534925e-181,
  ])
}

///|
test "Log integer power independent mathematical 23" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -324.0)], [
    8.839588860806092e-58,
  ])
}

///|
test "Log array power actual Darwin source 23" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -324.0)], [
    8.839588860806092e-58,
  ])
}

///|
test "Log integer power independent mathematical 24" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -308.0)], [
    5.806202933438532e-55,
  ])
}

///|
test "Log array power actual Darwin source 24" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -308.0)], [
    5.806202933438532e-55,
  ])
}

///|
test "Log integer power independent mathematical 25" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -100.0)], [
    2.4596544265798292e-18,
  ])
}

///|
test "Log array power actual Darwin source 25" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -100.0)], [
    2.4596544265798292e-18,
  ])
}

///|
test "Log integer power independent mathematical 26" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -6.0)], [
    0.0877914951989026,
  ])
}

///|
test "Log array power actual Darwin source 26" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -6.0)], [0.0877914951989026])
}

///|
test "Log integer power independent mathematical 27" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -4.0)], [
    0.19753086419753085,
  ])
}

///|
test "Log array power actual Darwin source 27" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -4.0)], [0.19753086419753085])
}

///|
test "Log integer power independent mathematical 28" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -3.0)], [
    -0.2962962962962963,
  ])
}

///|
test "Log array power actual Darwin source 28" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -3.0)], [-0.2962962962962963])
}

///|
test "Log integer power independent mathematical 29" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -2.0)], [
    0.4444444444444444,
  ])
}

///|
test "Log array power actual Darwin source 29" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -2.0)], [0.4444444444444444])
}

///|
test "Log integer power independent mathematical 30" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, -1.0)], [
    -0.6666666666666666,
  ])
}

///|
test "Log array power actual Darwin source 30" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, -1.0)], [-0.6666666666666666])
}

///|
test "Log integer power independent mathematical 31" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 31" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 32" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 1.0)], [-1.5])
}

///|
test "Log array power actual Darwin source 32" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 1.0)], [-1.5])
}

///|
test "Log integer power independent mathematical 33" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 2.0)], [2.25])
}

///|
test "Log array power actual Darwin source 33" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 2.0)], [2.25])
}

///|
test "Log integer power independent mathematical 34" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 3.0)], [-3.375])
}

///|
test "Log array power actual Darwin source 34" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 3.0)], [-3.375])
}

///|
test "Log integer power independent mathematical 35" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 4.0)], [5.0625])
}

///|
test "Log array power actual Darwin source 35" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 4.0)], [5.0625])
}

///|
test "Log integer power independent mathematical 36" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 6.0)], [11.390625])
}

///|
test "Log array power actual Darwin source 36" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 6.0)], [11.390625])
}

///|
test "Log integer power independent mathematical 37" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 100.0)], [
    4.065611775352152e+17,
  ])
}

///|
test "Log array power actual Darwin source 37" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 100.0)], [
    4.065611775352152e+17,
  ])
}

///|
test "Log integer power independent mathematical 38" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 308.0)], [
    1.7222959849386164e+54,
  ])
}

///|
test "Log array power actual Darwin source 38" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 308.0)], [
    1.7222959849386164e+54,
  ])
}

///|
test "Log integer power independent mathematical 39" {
  verify_log_grid_bits([log_grid_integer_power(-1.5, 1024.0)], [
    2.0770611040332967e+180,
  ])
}

///|
test "Log array power actual Darwin source 39" {
  verify_log_grid_bits([log_grid_numpy_power(-1.5, 1024.0)], [
    2.0770611040332967e+180,
  ])
}

///|
test "Log integer power independent mathematical 40" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -1075.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 40" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -1075.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 41" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -1074.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 41" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -1074.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 42" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -1024.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 42" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -1024.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 43" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -324.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 43" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -324.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 44" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -308.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 44" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -308.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 45" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -100.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 45" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -100.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 46" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -6.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 46" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -6.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 47" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -4.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 47" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -4.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 48" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -3.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 48" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -3.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 49" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -2.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 49" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -2.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 50" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, -1.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 50" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, -1.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 51" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 51" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 52" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 1.0)], [5.0e-324])
}

///|
test "Log array power actual Darwin source 52" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 1.0)], [5.0e-324])
}

///|
test "Log integer power independent mathematical 53" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 2.0)], [0.0])
}

///|
test "Log array power actual Darwin source 53" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 2.0)], [0.0])
}

///|
test "Log integer power independent mathematical 54" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 3.0)], [0.0])
}

///|
test "Log array power actual Darwin source 54" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 3.0)], [0.0])
}

///|
test "Log integer power independent mathematical 55" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 4.0)], [0.0])
}

///|
test "Log array power actual Darwin source 55" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 4.0)], [0.0])
}

///|
test "Log integer power independent mathematical 56" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 6.0)], [0.0])
}

///|
test "Log array power actual Darwin source 56" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 6.0)], [0.0])
}

///|
test "Log integer power independent mathematical 57" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 100.0)], [0.0])
}

///|
test "Log array power actual Darwin source 57" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 100.0)], [0.0])
}

///|
test "Log integer power independent mathematical 58" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 308.0)], [0.0])
}

///|
test "Log array power actual Darwin source 58" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 308.0)], [0.0])
}

///|
test "Log integer power independent mathematical 59" {
  verify_log_grid_bits([log_grid_integer_power(5.0e-324, 1024.0)], [0.0])
}

///|
test "Log array power actual Darwin source 59" {
  verify_log_grid_bits([log_grid_numpy_power(5.0e-324, 1024.0)], [0.0])
}

///|
test "Log integer power independent mathematical 60" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -1075.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 60" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -1075.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 61" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -1074.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 61" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -1074.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 62" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -1024.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 62" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -1024.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 63" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -324.0)], [
    3.417579257473456e+97,
  ])
}

///|
test "Log array power actual Darwin source 63" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -324.0)], [
    3.417579257473456e+97,
  ])
}

///|
test "Log integer power independent mathematical 64" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -308.0)], [
    5.2148120994162844e+92,
  ])
}

///|
test "Log array power actual Darwin source 64" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -308.0)], [
    5.2148120994162844e+92,
  ])
}

///|
test "Log integer power independent mathematical 65" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -100.0)], [
    1.2676506002282294e+30,
  ])
}

///|
test "Log array power actual Darwin source 65" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -100.0)], [
    1.2676506002282294e+30,
  ])
}

///|
test "Log integer power independent mathematical 66" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -6.0)], [64.0])
}

///|
test "Log array power actual Darwin source 66" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -6.0)], [64.0])
}

///|
test "Log integer power independent mathematical 67" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -4.0)], [16.0])
}

///|
test "Log array power actual Darwin source 67" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -4.0)], [16.0])
}

///|
test "Log integer power independent mathematical 68" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -3.0)], [8.0])
}

///|
test "Log array power actual Darwin source 68" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -3.0)], [8.0])
}

///|
test "Log integer power independent mathematical 69" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -2.0)], [4.0])
}

///|
test "Log array power actual Darwin source 69" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -2.0)], [4.0])
}

///|
test "Log integer power independent mathematical 70" {
  verify_log_grid_bits([log_grid_integer_power(0.5, -1.0)], [2.0])
}

///|
test "Log array power actual Darwin source 70" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, -1.0)], [2.0])
}

///|
test "Log integer power independent mathematical 71" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 71" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 72" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 1.0)], [0.5])
}

///|
test "Log array power actual Darwin source 72" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 1.0)], [0.5])
}

///|
test "Log integer power independent mathematical 73" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 2.0)], [0.25])
}

///|
test "Log array power actual Darwin source 73" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 2.0)], [0.25])
}

///|
test "Log integer power independent mathematical 74" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 3.0)], [0.125])
}

///|
test "Log array power actual Darwin source 74" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 3.0)], [0.125])
}

///|
test "Log integer power independent mathematical 75" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 4.0)], [0.0625])
}

///|
test "Log array power actual Darwin source 75" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 4.0)], [0.0625])
}

///|
test "Log integer power independent mathematical 76" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 6.0)], [0.015625])
}

///|
test "Log array power actual Darwin source 76" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 6.0)], [0.015625])
}

///|
test "Log integer power independent mathematical 77" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 100.0)], [
    7.888609052210118e-31,
  ])
}

///|
test "Log array power actual Darwin source 77" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 100.0)], [
    7.888609052210118e-31,
  ])
}

///|
test "Log integer power independent mathematical 78" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 308.0)], [
    1.9176146348819244e-93,
  ])
}

///|
test "Log array power actual Darwin source 78" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 308.0)], [
    1.9176146348819244e-93,
  ])
}

///|
test "Log integer power independent mathematical 79" {
  verify_log_grid_bits([log_grid_integer_power(0.5, 1024.0)], [
    5.562684646268003e-309,
  ])
}

///|
test "Log array power actual Darwin source 79" {
  verify_log_grid_bits([log_grid_numpy_power(0.5, 1024.0)], [
    5.562684646268003e-309,
  ])
}

///|
test "Log integer power independent mathematical 80" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -1.0e+308)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 80" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -1.0e+308)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 81" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -1.0e+100)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 81" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -1.0e+100)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 82" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -9.223372036854776e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 82" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -9.223372036854776e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log integer power independent mathematical 83" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -6.393154322601328e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 83" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -6.393154322601328e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log integer power independent mathematical 84" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -6.387871561946855e+18)],
    [1.000000000000053e+308],
  )
}

///|
test "Log array power actual Darwin source 84" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -6.387871561946855e+18)],
    [1.000000000000053e+308],
  )
}

///|
test "Log integer power independent mathematical 85" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -4.986779963944082e+18)],
    [2.7825594022073917e+240],
  )
}

///|
test "Log array power actual Darwin source 85" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -4.986779963944082e+18)],
    [2.7825594022073917e+240],
  )
}

///|
test "Log integer power independent mathematical 86" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -4.937768279977892e+18)],
    [1.205809754798887e+238],
  )
}

///|
test "Log array power actual Darwin source 86" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -4.937768279977892e+18)],
    [1.205809754798887e+238],
  )
}

///|
test "Log integer power independent mathematical 87" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -3.5856883659413084e+18)],
    [7.742636826811466e+172],
  )
}

///|
test "Log array power actual Darwin source 87" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -3.5856883659413084e+18)],
    [7.742636826811466e+172],
  )
}

///|
test "Log integer power independent mathematical 88" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -3.482382237354456e+18)],
    [8.088016450479954e+167],
  )
}

///|
test "Log array power actual Darwin source 88" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -3.482382237354456e+18)],
    [8.088016450479954e+167],
  )
}

///|
test "Log integer power independent mathematical 89" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -2.1845967679385352e+18)],
    [2.1544346900319696e+105],
  )
}

///|
test "Log array power actual Darwin source 89" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -2.1845967679385352e+18)],
    [2.1544346900319696e+105],
  )
}

///|
test "Log integer power independent mathematical 90" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -2.02699619473102e+18)],
    [5.425068908498176e+97],
  )
}

///|
test "Log array power actual Darwin source 90" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -2.02699619473102e+18)],
    [5.425068908498176e+97],
  )
}

///|
test "Log integer power independent mathematical 91" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -7.835051699357617e+17)],
    [5.994842503189566e+37],
  )
}

///|
test "Log array power actual Darwin source 91" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -7.835051699357617e+17)],
    [5.994842503189566e+37],
  )
}

///|
test "Log integer power independent mathematical 92" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -5.7161015210758406e+17)],
    [3.6388863502135055e+27],
  )
}

///|
test "Log array power actual Darwin source 92" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -5.7161015210758406e+17)],
    [3.6388863502135055e+27],
  )
}

///|
test "Log integer power independent mathematical 93" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -6.221952820078106e+16)],
    [1000.0000000000001],
  )
}

///|
test "Log array power actual Darwin source 93" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -6.221952820078106e+16)],
    [1000.0000000000001],
  )
}

///|
test "Log integer power independent mathematical 94" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -5.530624728958316e+16)],
    [464.1588833612779],
  )
}

///|
test "Log array power actual Darwin source 94" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -5.530624728958316e+16)],
    [464.1588833612779],
  )
}

///|
test "Log integer power independent mathematical 95" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -4.839296637838526e+16)],
    [215.44346900318834],
  )
}

///|
test "Log array power actual Darwin source 95" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -4.839296637838526e+16)],
    [215.44346900318834],
  )
}

///|
test "Log integer power independent mathematical 96" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -4.147968546718737e+16)],
    [99.99999999999999],
  )
}

///|
test "Log array power actual Darwin source 96" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -4.147968546718737e+16)],
    [99.99999999999999],
  )
}

///|
test "Log integer power independent mathematical 97" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -3.4566404555989476e+16)],
    [46.41588833612779],
  )
}

///|
test "Log array power actual Darwin source 97" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -3.4566404555989476e+16)],
    [46.41588833612779],
  )
}

///|
test "Log integer power independent mathematical 98" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -2.765312364479158e+16)],
    [21.54434690031884],
  )
}

///|
test "Log array power actual Darwin source 98" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -2.765312364479158e+16)],
    [21.54434690031884],
  )
}

///|
test "Log integer power independent mathematical 99" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -2.0739842733593684e+16)],
    [9.999999999999998],
  )
}

///|
test "Log array power actual Darwin source 99" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -2.0739842733593684e+16)],
    [9.999999999999998],
  )
}

///|
test "Log integer power independent mathematical 100" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -1.382656182239579e+16)],
    [4.641588833612779],
  )
}

///|
test "Log array power actual Darwin source 100" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -1.382656182239579e+16)],
    [4.641588833612779],
  )
}

///|
test "Log integer power independent mathematical 101" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -9007199254740994.0)],
    [2.718281828459046],
  )
}

///|
test "Log array power actual Darwin source 101" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -9007199254740994.0)],
    [2.718281828459046],
  )
}

///|
test "Log integer power independent mathematical 102" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, -6913280911197895.0)],
    [2.154434690031884],
  )
}

///|
test "Log array power actual Darwin source 102" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, -6913280911197895.0)],
    [2.154434690031884],
  )
}

///|
test "Log integer power independent mathematical 103" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -1075.0)], [
    1.0000000000001195,
  ])
}

///|
test "Log array power actual Darwin source 103" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -1075.0)], [
    1.0000000000001195,
  ])
}

///|
test "Log integer power independent mathematical 104" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -1074.0)], [
    1.0000000000001192,
  ])
}

///|
test "Log array power actual Darwin source 104" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -1074.0)], [
    1.0000000000001192,
  ])
}

///|
test "Log integer power independent mathematical 105" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -1024.0)], [
    1.0000000000001137,
  ])
}

///|
test "Log array power actual Darwin source 105" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -1024.0)], [
    1.0000000000001137,
  ])
}

///|
test "Log integer power independent mathematical 106" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -324.0)], [
    1.000000000000036,
  ])
}

///|
test "Log array power actual Darwin source 106" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -324.0)], [
    1.000000000000036,
  ])
}

///|
test "Log integer power independent mathematical 107" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -308.0)], [
    1.0000000000000342,
  ])
}

///|
test "Log array power actual Darwin source 107" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -308.0)], [
    1.0000000000000342,
  ])
}

///|
test "Log integer power independent mathematical 108" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -100.0)], [
    1.000000000000011,
  ])
}

///|
test "Log array power actual Darwin source 108" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -100.0)], [
    1.000000000000011,
  ])
}

///|
test "Log integer power independent mathematical 109" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -6.0)], [
    1.0000000000000007,
  ])
}

///|
test "Log array power actual Darwin source 109" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -6.0)], [
    1.0000000000000007,
  ])
}

///|
test "Log integer power independent mathematical 110" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -4.0)], [
    1.0000000000000004,
  ])
}

///|
test "Log array power actual Darwin source 110" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -4.0)], [
    1.0000000000000004,
  ])
}

///|
test "Log integer power independent mathematical 111" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -3.0)], [
    1.0000000000000004,
  ])
}

///|
test "Log array power actual Darwin source 111" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -3.0)], [
    1.0000000000000004,
  ])
}

///|
test "Log integer power independent mathematical 112" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -2.0)], [
    1.0000000000000002,
  ])
}

///|
test "Log array power actual Darwin source 112" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, -2.0)], [
    1.0000000000000002,
  ])
}

///|
test "Log integer power independent mathematical 113" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, -1.0)], [
    1.0000000000000002,
  ])
}

///|
test "Log explicit Darwin rounding profile difference 113" {
  let actual = log_grid_numpy_power(0.9999999999999999, -1.0)
  verify_log_grid_bits([actual], [1.0000000000000002])
  assert_true(actual.reinterpret_as_uint64() != 4607182418800017408UL)
}

///|
test "Log integer power independent mathematical 114" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 114" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 115" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 1.0)], [
    0.9999999999999999,
  ])
}

///|
test "Log array power actual Darwin source 115" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 1.0)], [
    0.9999999999999999,
  ])
}

///|
test "Log integer power independent mathematical 116" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 2.0)], [
    0.9999999999999998,
  ])
}

///|
test "Log array power actual Darwin source 116" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 2.0)], [
    0.9999999999999998,
  ])
}

///|
test "Log integer power independent mathematical 117" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 3.0)], [
    0.9999999999999997,
  ])
}

///|
test "Log array power actual Darwin source 117" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 3.0)], [
    0.9999999999999997,
  ])
}

///|
test "Log integer power independent mathematical 118" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 4.0)], [
    0.9999999999999996,
  ])
}

///|
test "Log array power actual Darwin source 118" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 4.0)], [
    0.9999999999999996,
  ])
}

///|
test "Log integer power independent mathematical 119" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 6.0)], [
    0.9999999999999993,
  ])
}

///|
test "Log array power actual Darwin source 119" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 6.0)], [
    0.9999999999999993,
  ])
}

///|
test "Log integer power independent mathematical 120" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 100.0)], [
    0.9999999999999889,
  ])
}

///|
test "Log array power actual Darwin source 120" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 100.0)], [
    0.9999999999999889,
  ])
}

///|
test "Log integer power independent mathematical 121" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 308.0)], [
    0.9999999999999658,
  ])
}

///|
test "Log array power actual Darwin source 121" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 308.0)], [
    0.9999999999999658,
  ])
}

///|
test "Log integer power independent mathematical 122" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 1024.0)], [
    0.9999999999998863,
  ])
}

///|
test "Log array power actual Darwin source 122" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 1024.0)], [
    0.9999999999998863,
  ])
}

///|
test "Log integer power independent mathematical 123" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6913280911197895.0)],
    [0.46415888336127786],
  )
}

///|
test "Log array power actual Darwin source 123" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6913280911197895.0)],
    [0.46415888336127786],
  )
}

///|
test "Log integer power independent mathematical 124" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 9007199254740994.0)],
    [0.3678794411714422],
  )
}

///|
test "Log array power actual Darwin source 124" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 9007199254740994.0)],
    [0.3678794411714422],
  )
}

///|
test "Log integer power independent mathematical 125" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 1.560828692041339e+17)],
    [2.980232238769559e-08],
  )
}

///|
test "Log array power actual Darwin source 125" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 1.560828692041339e+17)],
    [2.980232238769559e-08],
  )
}

///|
test "Log integer power independent mathematical 126" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.175864280670118e+17)],
    [1.668100537200079e-30],
  )
}

///|
test "Log array power actual Darwin source 126" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.175864280670118e+17)],
    [1.668100537200079e-30],
  )
}

///|
test "Log integer power independent mathematical 127" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 8.837758905158518e+17)],
    [2.4407973600165763e-43],
  )
}

///|
test "Log array power actual Darwin source 127" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 8.837758905158518e+17)],
    [2.4407973600165763e-43],
  )
}

///|
test "Log integer power independent mathematical 128" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 2.0186780260697853e+18)],
    [4.641588833612771e-98],
  )
}

///|
test "Log array power actual Darwin source 128" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 2.0186780260697853e+18)],
    [4.641588833612771e-98],
  )
}

///|
test "Log integer power independent mathematical 129" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 2.3391619331392876e+18)],
    [1.637174448252385e-113],
  )
}

///|
test "Log array power actual Darwin source 129" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 2.3391619331392876e+18)],
    [1.637174448252385e-113],
  )
}

///|
test "Log integer power independent mathematical 130" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 3.4197696240725586e+18)],
    [1.2915496650149006e-165],
  )
}

///|
test "Log array power actual Darwin source 130" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 3.4197696240725586e+18)],
    [1.2915496650149006e-165],
  )
}

///|
test "Log integer power independent mathematical 131" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 3.794547975762724e+18)],
    [1.0981412131616473e-183],
  )
}

///|
test "Log array power actual Darwin source 131" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 3.794547975762724e+18)],
    [1.0981412131616473e-183],
  )
}

///|
test "Log integer power independent mathematical 132" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 4.820861222075333e+18)],
    [3.59381366380442e-233],
  )
}

///|
test "Log array power actual Darwin source 132" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 4.820861222075333e+18)],
    [3.59381366380442e-233],
  )
}

///|
test "Log integer power independent mathematical 133" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 5.24993401838616e+18)],
    [7.365825464302021e-254],
  )
}

///|
test "Log array power actual Darwin source 133" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 5.24993401838616e+18)],
    [7.365825464302021e-254],
  )
}

///|
test "Log integer power independent mathematical 134" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.221952820078106e+18)],
    [9.999999999999853e-301],
  )
}

///|
test "Log array power actual Darwin source 134" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.221952820078106e+18)],
    [9.999999999999853e-301],
  )
}

///|
test "Log integer power independent mathematical 135" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.275660291292716e+18)],
    [2.572885843661214e-303],
  )
}

///|
test "Log array power actual Darwin source 135" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.275660291292716e+18)],
    [2.572885843661214e-303],
  )
}

///|
test "Log integer power independent mathematical 136" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.329367762507325e+18)],
    [6.619741564513126e-306],
  )
}

///|
test "Log array power actual Darwin source 136" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.329367762507325e+18)],
    [6.619741564513126e-306],
  )
}

///|
test "Log integer power independent mathematical 137" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.383075233721936e+18)],
    [1.7031839360031807e-308],
  )
}

///|
test "Log array power actual Darwin source 137" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.383075233721936e+18)],
    [1.7031839360031807e-308],
  )
}

///|
test "Log integer power independent mathematical 138" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.436782704936545e+18)],
    [4.3820978380944e-311],
  )
}

///|
test "Log array power actual Darwin source 138" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.436782704936545e+18)],
    [4.3820978380944e-311],
  )
}

///|
test "Log integer power independent mathematical 139" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.490490176151156e+18)],
    [1.1274637493e-313],
  )
}

///|
test "Log array power actual Darwin source 139" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.490490176151156e+18)],
    [1.1274637493e-313],
  )
}

///|
test "Log integer power independent mathematical 140" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.544197647365765e+18)],
    [2.90083554e-316],
  )
}

///|
test "Log array power actual Darwin source 140" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.544197647365765e+18)],
    [2.90083554e-316],
  )
}

///|
test "Log integer power independent mathematical 141" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.597905118580376e+18)],
    [7.4635e-319],
  )
}

///|
test "Log array power actual Darwin source 141" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.597905118580376e+18)],
    [7.4635e-319],
  )
}

///|
test "Log integer power independent mathematical 142" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.651612589794985e+18)],
    [1.92e-321],
  )
}

///|
test "Log array power actual Darwin source 142" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.651612589794985e+18)],
    [1.92e-321],
  )
}

///|
test "Log integer power independent mathematical 143" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.705320061009595e+18)],
    [5.0e-324],
  )
}

///|
test "Log array power actual Darwin source 143" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.705320061009595e+18)],
    [5.0e-324],
  )
}

///|
test "Log integer power independent mathematical 144" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 6.759027532224206e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 144" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 6.759027532224206e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 145" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 7.623044418080879e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 145" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 7.623044418080879e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 146" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 8.160706103633031e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 146" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 8.160706103633031e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 147" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 9.223372036854776e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 147" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 9.223372036854776e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 148" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 1.1071478188879903e+19)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 148" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 1.1071478188879903e+19)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 149" {
  verify_log_grid_bits(
    [log_grid_integer_power(0.9999999999999999, 1.3254557252815057e+19)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 149" {
  verify_log_grid_bits(
    [log_grid_numpy_power(0.9999999999999999, 1.3254557252815057e+19)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 150" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 1.0e+100)], [
    0.0,
  ])
}

///|
test "Log array power actual Darwin source 150" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 1.0e+100)], [
    0.0,
  ])
}

///|
test "Log integer power independent mathematical 151" {
  verify_log_grid_bits([log_grid_integer_power(0.9999999999999999, 1.0e+308)], [
    0.0,
  ])
}

///|
test "Log array power actual Darwin source 151" {
  verify_log_grid_bits([log_grid_numpy_power(0.9999999999999999, 1.0e+308)], [
    0.0,
  ])
}

///|
test "Log integer power independent mathematical 152" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -1.0e+308)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 152" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -1.0e+308)], [
    0.0,
  ])
}

///|
test "Log integer power independent mathematical 153" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -1.0e+100)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 153" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -1.0e+100)], [
    0.0,
  ])
}

///|
test "Log integer power independent mathematical 154" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -9.90189722231026e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 154" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -9.90189722231026e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 155" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -9.223372036854776e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 155" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -9.223372036854776e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 156" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -6.627278626407529e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 156" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -6.627278626407529e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 157" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -4.171314679480481e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 157" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -4.171314679480481e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 158" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.8990904339156137e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 158" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.8990904339156137e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 159" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.3828704830630164e+18)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 159" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.3828704830630164e+18)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 160" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.352660030504798e+18)],
    [5.0e-324],
  )
}

///|
test "Log array power actual Darwin source 160" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.352660030504798e+18)],
    [5.0e-324],
  )
}

///|
test "Log integer power independent mathematical 161" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.32244957794658e+18)],
    [4.046e-321],
  )
}

///|
test "Log array power actual Darwin source 161" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.32244957794658e+18)],
    [4.046e-321],
  )
}

///|
test "Log integer power independent mathematical 162" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.2922391253883617e+18)],
    [3.31389e-318],
  )
}

///|
test "Log array power actual Darwin source 162" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.2922391253883617e+18)],
    [3.31389e-318],
  )
}

///|
test "Log integer power independent mathematical 163" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.262028672830144e+18)],
    [2.71403479e-315],
  )
}

///|
test "Log array power actual Darwin source 163" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.262028672830144e+18)],
    [2.71403479e-315],
  )
}

///|
test "Log integer power independent mathematical 164" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.231818220271926e+18)],
    [2.222758749483e-312],
  )
}

///|
test "Log array power actual Darwin source 164" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.231818220271926e+18)],
    [2.222758749483e-312],
  )
}

///|
test "Log integer power independent mathematical 165" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.2016077677137075e+18)],
    [1.82041014165551e-309],
  )
}

///|
test "Log array power actual Darwin source 165" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.2016077677137075e+18)],
    [1.82041014165551e-309],
  )
}

///|
test "Log integer power independent mathematical 166" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.17139731515549e+18)],
    [1.4908919308537406e-306],
  )
}

///|
test "Log array power actual Darwin source 166" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.17139731515549e+18)],
    [1.4908919308537406e-306],
  )
}

///|
test "Log integer power independent mathematical 167" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.1411868625972716e+18)],
    [1.221020856027333e-303],
  )
}

///|
test "Log array power actual Darwin source 167" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.1411868625972716e+18)],
    [1.221020856027333e-303],
  )
}

///|
test "Log integer power independent mathematical 168" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.1109764100390533e+18)],
    [9.999999999999868e-301],
  )
}

///|
test "Log array power actual Darwin source 168" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.1109764100390533e+18)],
    [9.999999999999868e-301],
  )
}

///|
test "Log integer power independent mathematical 169" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3.080765957480835e+18)],
    [8.189868298020194e-298],
  )
}

///|
test "Log array power actual Darwin source 169" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3.080765957480835e+18)],
    [8.189868298020194e-298],
  )
}

///|
test "Log integer power independent mathematical 170" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -2.5340053815291156e+18)],
    [4.354126273026166e-245],
  )
}

///|
test "Log array power actual Darwin source 170" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -2.5340053815291156e+18)],
    [4.354126273026166e-245],
  )
}

///|
test "Log integer power independent mathematical 171" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -2.322862386162493e+18)],
    [1.0000000000000371e-224],
  )
}

///|
test "Log array power actual Darwin source 171" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -2.322862386162493e+18)],
    [1.0000000000000371e-224],
  )
}

///|
test "Log integer power independent mathematical 172" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -1.7153507325534326e+18)],
    [3.8372260368717005e-166],
  )
}

///|
test "Log array power actual Darwin source 172" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -1.7153507325534326e+18)],
    [3.8372260368717005e-166],
  )
}

///|
test "Log integer power independent mathematical 173" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -1.534748362285933e+18)],
    [9.999999999999737e-149],
  )
}

///|
test "Log array power actual Darwin source 173" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -1.534748362285933e+18)],
    [9.999999999999737e-149],
  )
}

///|
test "Log integer power independent mathematical 174" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -8.966960835777498e+17)],
    [3.381689628356071e-87],
  )
}

///|
test "Log array power actual Darwin source 174" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -8.966960835777498e+17)],
    [3.381689628356071e-87],
  )
}

///|
test "Log integer power independent mathematical 175" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -7.466343384093727e+17)],
    [1.0000000000000241e-72],
  )
}

///|
test "Log array power actual Darwin source 175" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -7.466343384093727e+17)],
    [1.0000000000000241e-72],
  )
}

///|
test "Log integer power independent mathematical 176" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -7.804143460206694e+16)],
    [2.9802322387695676e-08],
  )
}

///|
test "Log array power actual Darwin source 176" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -7.804143460206694e+16)],
    [2.9802322387695676e-08],
  )
}

///|
test "Log integer power independent mathematical 177" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -9007199254740994.0)],
    [0.13533528323661267],
  )
}

///|
test "Log array power actual Darwin source 177" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -9007199254740994.0)],
    [0.13533528323661267],
  )
}

///|
test "Log integer power independent mathematical 178" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, -3888720512548816.0)],
    [0.4216965034285823],
  )
}

///|
test "Log array power actual Darwin source 178" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, -3888720512548816.0)],
    [0.4216965034285823],
  )
}

///|
test "Log integer power independent mathematical 179" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -1075.0)], [
    0.9999999999997613,
  ])
}

///|
test "Log array power actual Darwin source 179" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -1075.0)], [
    0.9999999999997613,
  ])
}

///|
test "Log integer power independent mathematical 180" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -1074.0)], [
    0.9999999999997615,
  ])
}

///|
test "Log array power actual Darwin source 180" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -1074.0)], [
    0.9999999999997615,
  ])
}

///|
test "Log integer power independent mathematical 181" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -1024.0)], [
    0.9999999999997726,
  ])
}

///|
test "Log array power actual Darwin source 181" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -1024.0)], [
    0.9999999999997726,
  ])
}

///|
test "Log integer power independent mathematical 182" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -324.0)], [
    0.9999999999999281,
  ])
}

///|
test "Log array power actual Darwin source 182" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -324.0)], [
    0.9999999999999281,
  ])
}

///|
test "Log integer power independent mathematical 183" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -308.0)], [
    0.9999999999999316,
  ])
}

///|
test "Log array power actual Darwin source 183" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -308.0)], [
    0.9999999999999316,
  ])
}

///|
test "Log integer power independent mathematical 184" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -100.0)], [
    0.9999999999999778,
  ])
}

///|
test "Log array power actual Darwin source 184" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -100.0)], [
    0.9999999999999778,
  ])
}

///|
test "Log integer power independent mathematical 185" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -6.0)], [
    0.9999999999999987,
  ])
}

///|
test "Log array power actual Darwin source 185" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -6.0)], [
    0.9999999999999987,
  ])
}

///|
test "Log integer power independent mathematical 186" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -4.0)], [
    0.9999999999999991,
  ])
}

///|
test "Log array power actual Darwin source 186" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -4.0)], [
    0.9999999999999991,
  ])
}

///|
test "Log integer power independent mathematical 187" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -3.0)], [
    0.9999999999999993,
  ])
}

///|
test "Log array power actual Darwin source 187" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -3.0)], [
    0.9999999999999993,
  ])
}

///|
test "Log integer power independent mathematical 188" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -2.0)], [
    0.9999999999999996,
  ])
}

///|
test "Log array power actual Darwin source 188" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -2.0)], [
    0.9999999999999996,
  ])
}

///|
test "Log integer power independent mathematical 189" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, -1.0)], [
    0.9999999999999998,
  ])
}

///|
test "Log array power actual Darwin source 189" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, -1.0)], [
    0.9999999999999998,
  ])
}

///|
test "Log integer power independent mathematical 190" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 190" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 191" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 1.0)], [
    1.0000000000000002,
  ])
}

///|
test "Log array power actual Darwin source 191" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 1.0)], [
    1.0000000000000002,
  ])
}

///|
test "Log integer power independent mathematical 192" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 2.0)], [
    1.0000000000000004,
  ])
}

///|
test "Log array power actual Darwin source 192" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 2.0)], [
    1.0000000000000004,
  ])
}

///|
test "Log integer power independent mathematical 193" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 3.0)], [
    1.0000000000000007,
  ])
}

///|
test "Log array power actual Darwin source 193" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 3.0)], [
    1.0000000000000007,
  ])
}

///|
test "Log integer power independent mathematical 194" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 4.0)], [
    1.0000000000000009,
  ])
}

///|
test "Log array power actual Darwin source 194" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 4.0)], [
    1.0000000000000009,
  ])
}

///|
test "Log integer power independent mathematical 195" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 5.0)], [
    1.000000000000001,
  ])
}

///|
test "Log array power actual Darwin source 195" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 5.0)], [
    1.000000000000001,
  ])
}

///|
test "Log integer power independent mathematical 196" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 6.0)], [
    1.0000000000000013,
  ])
}

///|
test "Log array power actual Darwin source 196" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 6.0)], [
    1.0000000000000013,
  ])
}

///|
test "Log integer power independent mathematical 197" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 7.0)], [
    1.0000000000000016,
  ])
}

///|
test "Log array power actual Darwin source 197" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 7.0)], [
    1.0000000000000016,
  ])
}

///|
test "Log integer power independent mathematical 198" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 8.0)], [
    1.0000000000000018,
  ])
}

///|
test "Log array power actual Darwin source 198" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 8.0)], [
    1.0000000000000018,
  ])
}

///|
test "Log integer power independent mathematical 199" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 9.0)], [
    1.000000000000002,
  ])
}

///|
test "Log array power actual Darwin source 199" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 9.0)], [
    1.000000000000002,
  ])
}

///|
test "Log integer power independent mathematical 200" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 10.0)], [
    1.0000000000000022,
  ])
}

///|
test "Log array power actual Darwin source 200" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 10.0)], [
    1.0000000000000022,
  ])
}

///|
test "Log integer power independent mathematical 201" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 11.0)], [
    1.0000000000000024,
  ])
}

///|
test "Log array power actual Darwin source 201" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 11.0)], [
    1.0000000000000024,
  ])
}

///|
test "Log integer power independent mathematical 202" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 100.0)], [
    1.0000000000000222,
  ])
}

///|
test "Log array power actual Darwin source 202" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 100.0)], [
    1.0000000000000222,
  ])
}

///|
test "Log integer power independent mathematical 203" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 308.0)], [
    1.0000000000000684,
  ])
}

///|
test "Log array power actual Darwin source 203" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 308.0)], [
    1.0000000000000684,
  ])
}

///|
test "Log integer power independent mathematical 204" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 1024.0)], [
    1.0000000000002274,
  ])
}

///|
test "Log array power actual Darwin source 204" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 1024.0)], [
    1.0000000000002274,
  ])
}

///|
test "Log integer power independent mathematical 205" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 3888720512548816.0)],
    [2.371373705661655],
  )
}

///|
test "Log array power actual Darwin source 205" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 3888720512548816.0)],
    [2.371373705661655],
  )
}

///|
test "Log integer power independent mathematical 206" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 7777441025097632.0)],
    [5.623413251903489],
  )
}

///|
test "Log array power actual Darwin source 206" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 7777441025097632.0)],
    [5.623413251903489],
  )
}

///|
test "Log integer power independent mathematical 207" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 9007199254740994.0)],
    [7.389056098930652],
  )
}

///|
test "Log array power actual Darwin source 207" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 9007199254740994.0)],
    [7.389056098930652],
  )
}

///|
test "Log integer power independent mathematical 208" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 1.1666161537646448e+16)],
    [13.335214321633234],
  )
}

///|
test "Log array power actual Darwin source 208" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 1.1666161537646448e+16)],
    [13.335214321633234],
  )
}

///|
test "Log integer power independent mathematical 209" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 1.5554882050195264e+16)],
    [31.62277660168378],
  )
}

///|
test "Log array power actual Darwin source 209" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 1.5554882050195264e+16)],
    [31.62277660168378],
  )
}

///|
test "Log integer power independent mathematical 210" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 1.944360256274408e+16)],
    [74.98942093324554],
  )
}

///|
test "Log array power actual Darwin source 210" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 1.944360256274408e+16)],
    [74.98942093324554],
  )
}

///|
test "Log integer power independent mathematical 211" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 2.3332323075292896e+16)],
    [177.82794100389214],
  )
}

///|
test "Log array power actual Darwin source 211" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 2.3332323075292896e+16)],
    [177.82794100389214],
  )
}

///|
test "Log integer power independent mathematical 212" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 2.722104358784171e+16)],
    [421.6965034285819],
  )
}

///|
test "Log array power actual Darwin source 212" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 2.722104358784171e+16)],
    [421.6965034285819],
  )
}

///|
test "Log integer power independent mathematical 213" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 3.110976410039053e+16)],
    [999.999999999999],
  )
}

///|
test "Log array power actual Darwin source 213" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 3.110976410039053e+16)],
    [999.999999999999],
  )
}

///|
test "Log integer power independent mathematical 214" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 3.4998484612939344e+16)],
    [2371.3737056616524],
  )
}

///|
test "Log array power actual Darwin source 214" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 3.4998484612939344e+16)],
    [2371.3737056616524],
  )
}

///|
test "Log integer power independent mathematical 215" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 4.147968546718746e+16)],
    [10000.000000000176],
  )
}

///|
test "Log array power actual Darwin source 215" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 4.147968546718746e+16)],
    [10000.000000000176],
  )
}

///|
test "Log integer power independent mathematical 216" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 7.406132143736159e+17)],
    [2.6264338756951916e+71],
  )
}

///|
test "Log array power actual Darwin source 216" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 7.406132143736159e+17)],
    [2.6264338756951916e+71],
  )
}

///|
test "Log integer power independent mathematical 217" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 8.295937093437476e+17)],
    [1.0000000000000112e+80],
  )
}

///|
test "Log array power actual Darwin source 217" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 8.295937093437476e+17)],
    [1.0000000000000112e+80],
  )
}

///|
test "Log integer power independent mathematical 218" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 1.5592678633492987e+18)],
    [2.314636696315744e+150],
  )
}

///|
test "Log array power actual Darwin source 218" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 1.5592678633492987e+18)],
    [2.314636696315744e+150],
  )
}

///|
test "Log integer power independent mathematical 219" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 1.617707733220308e+18)],
    [1.0000000000000615e+156],
  )
}

///|
test "Log array power actual Darwin source 219" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 1.617707733220308e+18)],
    [1.0000000000000615e+156],
  )
}

///|
test "Log integer power independent mathematical 220" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 2.377922512324982e+18)],
    [2.0398545288004542e+229],
  )
}

///|
test "Log array power actual Darwin source 220" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 2.377922512324982e+18)],
    [2.0398545288004542e+229],
  )
}

///|
test "Log integer power independent mathematical 221" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 2.405821757096868e+18)],
    [9.999999999999981e+231],
  )
}

///|
test "Log array power actual Darwin source 221" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 2.405821757096868e+18)],
    [9.999999999999981e+231],
  )
}

///|
test "Log integer power independent mathematical 222" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 3.193935780973428e+18)],
    [1.0000000000000485e+308],
  )
}

///|
test "Log array power actual Darwin source 222" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 3.193935780973428e+18)],
    [1.0000000000000485e+308],
  )
}

///|
test "Log integer power independent mathematical 223" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 3.1965771613006643e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 223" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 3.1965771613006643e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log integer power independent mathematical 224" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 3.9820498048499886e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 224" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 3.9820498048499886e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log integer power independent mathematical 225" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 4.015231810276347e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 225" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 4.015231810276347e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log integer power independent mathematical 226" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 6.471195757203396e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 226" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 6.471195757203396e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log integer power independent mathematical 227" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 9.223372036854776e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 227" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 9.223372036854776e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log integer power independent mathematical 228" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.0000000000000002, 9.745814353106127e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 228" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.0000000000000002, 9.745814353106127e+18)],
    [1.0 / 0.0],
  )
}

///|
test "Log integer power independent mathematical 229" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 1.0e+100)], [
    1.0 / 0.0,
  ])
}

///|
test "Log array power actual Darwin source 229" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 1.0e+100)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 230" {
  verify_log_grid_bits([log_grid_integer_power(1.0000000000000002, 1.0e+308)], [
    1.0 / 0.0,
  ])
}

///|
test "Log array power actual Darwin source 230" {
  verify_log_grid_bits([log_grid_numpy_power(1.0000000000000002, 1.0e+308)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 231" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -1075.0)], [
    5.03380647601406e-190,
  ])
}

///|
test "Log array power actual Darwin source 231" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -1075.0)], [
    5.03380647601406e-190,
  ])
}

///|
test "Log integer power independent mathematical 232" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -1074.0)], [
    7.550709714021091e-190,
  ])
}

///|
test "Log array power actual Darwin source 232" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -1074.0)], [
    7.550709714021091e-190,
  ])
}

///|
test "Log integer power independent mathematical 233" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -1024.0)], [
    4.814494855534925e-181,
  ])
}

///|
test "Log array power actual Darwin source 233" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -1024.0)], [
    4.814494855534925e-181,
  ])
}

///|
test "Log integer power independent mathematical 234" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -324.0)], [
    8.839588860806092e-58,
  ])
}

///|
test "Log array power actual Darwin source 234" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -324.0)], [
    8.839588860806092e-58,
  ])
}

///|
test "Log integer power independent mathematical 235" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -308.0)], [
    5.806202933438532e-55,
  ])
}

///|
test "Log array power actual Darwin source 235" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -308.0)], [
    5.806202933438532e-55,
  ])
}

///|
test "Log integer power independent mathematical 236" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -100.0)], [
    2.4596544265798292e-18,
  ])
}

///|
test "Log array power actual Darwin source 236" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -100.0)], [
    2.4596544265798292e-18,
  ])
}

///|
test "Log integer power independent mathematical 237" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -6.0)], [0.0877914951989026])
}

///|
test "Log array power actual Darwin source 237" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -6.0)], [0.0877914951989026])
}

///|
test "Log integer power independent mathematical 238" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -4.0)], [
    0.19753086419753085,
  ])
}

///|
test "Log array power actual Darwin source 238" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -4.0)], [0.19753086419753085])
}

///|
test "Log integer power independent mathematical 239" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -3.0)], [0.2962962962962963])
}

///|
test "Log array power actual Darwin source 239" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -3.0)], [0.2962962962962963])
}

///|
test "Log integer power independent mathematical 240" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -2.0)], [0.4444444444444444])
}

///|
test "Log array power actual Darwin source 240" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -2.0)], [0.4444444444444444])
}

///|
test "Log integer power independent mathematical 241" {
  verify_log_grid_bits([log_grid_integer_power(1.5, -1.0)], [0.6666666666666666])
}

///|
test "Log array power actual Darwin source 241" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, -1.0)], [0.6666666666666666])
}

///|
test "Log integer power independent mathematical 242" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 242" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 243" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 1.0)], [1.5])
}

///|
test "Log array power actual Darwin source 243" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 1.0)], [1.5])
}

///|
test "Log integer power independent mathematical 244" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 2.0)], [2.25])
}

///|
test "Log array power actual Darwin source 244" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 2.0)], [2.25])
}

///|
test "Log integer power independent mathematical 245" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 3.0)], [3.375])
}

///|
test "Log array power actual Darwin source 245" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 3.0)], [3.375])
}

///|
test "Log integer power independent mathematical 246" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 4.0)], [5.0625])
}

///|
test "Log array power actual Darwin source 246" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 4.0)], [5.0625])
}

///|
test "Log integer power independent mathematical 247" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 6.0)], [11.390625])
}

///|
test "Log array power actual Darwin source 247" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 6.0)], [11.390625])
}

///|
test "Log integer power independent mathematical 248" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 100.0)], [
    4.065611775352152e+17,
  ])
}

///|
test "Log array power actual Darwin source 248" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 100.0)], [
    4.065611775352152e+17,
  ])
}

///|
test "Log integer power independent mathematical 249" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 308.0)], [
    1.7222959849386164e+54,
  ])
}

///|
test "Log array power actual Darwin source 249" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 308.0)], [
    1.7222959849386164e+54,
  ])
}

///|
test "Log integer power independent mathematical 250" {
  verify_log_grid_bits([log_grid_integer_power(1.5, 1024.0)], [
    2.0770611040332967e+180,
  ])
}

///|
test "Log array power actual Darwin source 250" {
  verify_log_grid_bits([log_grid_numpy_power(1.5, 1024.0)], [
    2.0770611040332967e+180,
  ])
}

///|
test "Log integer power independent mathematical 251" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1248.0)], [0.0])
}

///|
test "Log array power actual Darwin source 251" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1248.0)], [0.0])
}

///|
test "Log integer power independent mathematical 252" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1080.0)], [0.0])
}

///|
test "Log array power actual Darwin source 252" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1080.0)], [0.0])
}

///|
test "Log integer power independent mathematical 253" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1075.0)], [0.0])
}

///|
test "Log array power actual Darwin source 253" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1075.0)], [0.0])
}

///|
test "Log integer power independent mathematical 254" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1074.0)], [5.0e-324])
}

///|
test "Log array power actual Darwin source 254" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1074.0)], [5.0e-324])
}

///|
test "Log integer power independent mathematical 255" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1071.0)], [4.0e-323])
}

///|
test "Log array power actual Darwin source 255" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1071.0)], [4.0e-323])
}

///|
test "Log integer power independent mathematical 256" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1062.0)], [2.0237e-320])
}

///|
test "Log array power actual Darwin source 256" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1062.0)], [2.0237e-320])
}

///|
test "Log integer power independent mathematical 257" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1053.0)], [1.036131e-317])
}

///|
test "Log array power actual Darwin source 257" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1053.0)], [1.036131e-317])
}

///|
test "Log integer power independent mathematical 258" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1044.0)], [
    5.304989477e-315,
  ])
}

///|
test "Log array power actual Darwin source 258" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1044.0)], [5.304989477e-315])
}

///|
test "Log integer power independent mathematical 259" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1035.0)], [
    2.716154612436e-312,
  ])
}

///|
test "Log array power actual Darwin source 259" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1035.0)], [
    2.716154612436e-312,
  ])
}

///|
test "Log integer power independent mathematical 260" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1026.0)], [
    1.390671161567e-309,
  ])
}

///|
test "Log array power actual Darwin source 260" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1026.0)], [
    1.390671161567e-309,
  ])
}

///|
test "Log integer power independent mathematical 261" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1024.0)], [
    5.562684646268003e-309,
  ])
}

///|
test "Log array power actual Darwin source 261" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1024.0)], [
    5.562684646268003e-309,
  ])
}

///|
test "Log integer power independent mathematical 262" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1017.0)], [
    7.120236347223045e-307,
  ])
}

///|
test "Log array power actual Darwin source 262" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1017.0)], [
    7.120236347223045e-307,
  ])
}

///|
test "Log integer power independent mathematical 263" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1008.0)], [
    3.645561009778199e-304,
  ])
}

///|
test "Log array power actual Darwin source 263" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1008.0)], [
    3.645561009778199e-304,
  ])
}

///|
test "Log integer power independent mathematical 264" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -999.0)], [
    1.8665272370064378e-301,
  ])
}

///|
test "Log array power actual Darwin source 264" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -999.0)], [
    1.8665272370064378e-301,
  ])
}

///|
test "Log integer power independent mathematical 265" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -996.0)], [
    1.4932217896051502e-300,
  ])
}

///|
test "Log array power actual Darwin source 265" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -996.0)], [
    1.4932217896051502e-300,
  ])
}

///|
test "Log integer power independent mathematical 266" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -990.0)], [
    9.556619453472961e-299,
  ])
}

///|
test "Log array power actual Darwin source 266" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -990.0)], [
    9.556619453472961e-299,
  ])
}

///|
test "Log integer power independent mathematical 267" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -744.0)], [
    1.0806454419566534e-224,
  ])
}

///|
test "Log array power actual Darwin source 267" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -744.0)], [
    1.0806454419566534e-224,
  ])
}

///|
test "Log integer power independent mathematical 268" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -492.0)], [
    7.820637090558988e-149,
  ])
}

///|
test "Log array power actual Darwin source 268" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -492.0)], [
    7.820637090558988e-149,
  ])
}

///|
test "Log integer power independent mathematical 269" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -324.0)], [
    2.926047721682624e-98,
  ])
}

///|
test "Log array power actual Darwin source 269" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -324.0)], [
    2.926047721682624e-98,
  ])
}

///|
test "Log integer power independent mathematical 270" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -308.0)], [
    1.9176146348819244e-93,
  ])
}

///|
test "Log array power actual Darwin source 270" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -308.0)], [
    1.9176146348819244e-93,
  ])
}

///|
test "Log integer power independent mathematical 271" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -240.0)], [
    5.659799424266695e-73,
  ])
}

///|
test "Log array power actual Darwin source 271" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -240.0)], [
    5.659799424266695e-73,
  ])
}

///|
test "Log integer power independent mathematical 272" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -100.0)], [
    7.888609052210118e-31,
  ])
}

///|
test "Log array power actual Darwin source 272" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -100.0)], [
    7.888609052210118e-31,
  ])
}

///|
test "Log integer power independent mathematical 273" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -6.0)], [0.015625])
}

///|
test "Log array power actual Darwin source 273" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -6.0)], [0.015625])
}

///|
test "Log integer power independent mathematical 274" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -4.0)], [0.0625])
}

///|
test "Log array power actual Darwin source 274" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -4.0)], [0.0625])
}

///|
test "Log integer power independent mathematical 275" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -3.0)], [0.125])
}

///|
test "Log array power actual Darwin source 275" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -3.0)], [0.125])
}

///|
test "Log integer power independent mathematical 276" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -2.0)], [0.25])
}

///|
test "Log array power actual Darwin source 276" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -2.0)], [0.25])
}

///|
test "Log integer power independent mathematical 277" {
  verify_log_grid_bits([log_grid_integer_power(2.0, -1.0)], [0.5])
}

///|
test "Log array power actual Darwin source 277" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, -1.0)], [0.5])
}

///|
test "Log integer power independent mathematical 278" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 278" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 279" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 1.0)], [2.0])
}

///|
test "Log array power actual Darwin source 279" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 1.0)], [2.0])
}

///|
test "Log integer power independent mathematical 280" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 2.0)], [4.0])
}

///|
test "Log array power actual Darwin source 280" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 2.0)], [4.0])
}

///|
test "Log integer power independent mathematical 281" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 3.0)], [8.0])
}

///|
test "Log array power actual Darwin source 281" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 3.0)], [8.0])
}

///|
test "Log integer power independent mathematical 282" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 4.0)], [16.0])
}

///|
test "Log array power actual Darwin source 282" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 4.0)], [16.0])
}

///|
test "Log integer power independent mathematical 283" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 6.0)], [64.0])
}

///|
test "Log array power actual Darwin source 283" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 6.0)], [64.0])
}

///|
test "Log integer power independent mathematical 284" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 8.0)], [256.0])
}

///|
test "Log array power actual Darwin source 284" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 8.0)], [256.0])
}

///|
test "Log integer power independent mathematical 285" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 10.0)], [1024.0])
}

///|
test "Log array power actual Darwin source 285" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 10.0)], [1024.0])
}

///|
test "Log integer power independent mathematical 286" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 12.0)], [4096.0])
}

///|
test "Log array power actual Darwin source 286" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 12.0)], [4096.0])
}

///|
test "Log integer power independent mathematical 287" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 100.0)], [
    1.2676506002282294e+30,
  ])
}

///|
test "Log array power actual Darwin source 287" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 100.0)], [
    1.2676506002282294e+30,
  ])
}

///|
test "Log integer power independent mathematical 288" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 264.0)], [
    2.9642774844752946e+79,
  ])
}

///|
test "Log array power actual Darwin source 288" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 264.0)], [
    2.9642774844752946e+79,
  ])
}

///|
test "Log integer power independent mathematical 289" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 308.0)], [
    5.2148120994162844e+92,
  ])
}

///|
test "Log array power actual Darwin source 289" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 308.0)], [
    5.2148120994162844e+92,
  ])
}

///|
test "Log integer power independent mathematical 290" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 516.0)], [
    2.1452492687908155e+155,
  ])
}

///|
test "Log array power actual Darwin source 290" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 516.0)], [
    2.1452492687908155e+155,
  ])
}

///|
test "Log integer power independent mathematical 291" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 768.0)], [
    1.552518092300709e+231,
  ])
}

///|
test "Log array power actual Darwin source 291" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 768.0)], [
    1.552518092300709e+231,
  ])
}

///|
test "Log integer power independent mathematical 292" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 1020.0)], [
    1.1235582092889474e+307,
  ])
}

///|
test "Log array power actual Darwin source 292" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 1020.0)], [
    1.1235582092889474e+307,
  ])
}

///|
test "Log integer power independent mathematical 293" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 1023.0)], [
    8.98846567431158e+307,
  ])
}

///|
test "Log array power actual Darwin source 293" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 1023.0)], [
    8.98846567431158e+307,
  ])
}

///|
test "Log integer power independent mathematical 294" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 1024.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 294" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 1024.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 295" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 1025.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 295" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 1025.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 296" {
  verify_log_grid_bits([log_grid_integer_power(2.0, 1272.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 296" {
  verify_log_grid_bits([log_grid_numpy_power(2.0, 1272.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 297" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -1075.0)], [
    0.0,
  ])
}

///|
test "Log array power actual Darwin source 297" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -1075.0)], [0.0])
}

///|
test "Log integer power independent mathematical 298" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -1074.0)], [
    0.0,
  ])
}

///|
test "Log array power actual Darwin source 298" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -1074.0)], [0.0])
}

///|
test "Log integer power independent mathematical 299" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -1024.0)], [
    0.0,
  ])
}

///|
test "Log array power actual Darwin source 299" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -1024.0)], [0.0])
}

///|
test "Log integer power independent mathematical 300" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -324.0)], [
    1.9435148500493263e-141,
  ])
}

///|
test "Log array power actual Darwin source 300" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -324.0)], [
    1.9435148500493263e-141,
  ])
}

///|
test "Log integer power independent mathematical 301" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -308.0)], [
    1.7270287755786585e-134,
  ])
}

///|
test "Log array power actual Darwin source 301" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -308.0)], [
    1.7270287755786585e-134,
  ])
}

///|
test "Log integer power independent mathematical 302" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -100.0)], [
    3.7200759760208555e-44,
  ])
}

///|
test "Log array power actual Darwin source 302" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -100.0)], [
    3.7200759760208555e-44,
  ])
}

///|
test "Log integer power independent mathematical 303" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -6.0)], [
    0.0024787521766663594,
  ])
}

///|
test "Log array power actual Darwin source 303" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -6.0)], [
    0.0024787521766663594,
  ])
}

///|
test "Log integer power independent mathematical 304" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -4.0)], [
    0.018315638888734186,
  ])
}

///|
test "Log array power actual Darwin source 304" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -4.0)], [
    0.018315638888734186,
  ])
}

///|
test "Log integer power independent mathematical 305" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -3.0)], [
    0.04978706836786395,
  ])
}

///|
test "Log array power actual Darwin source 305" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -3.0)], [
    0.04978706836786395,
  ])
}

///|
test "Log integer power independent mathematical 306" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -2.0)], [
    0.1353352832366127,
  ])
}

///|
test "Log array power actual Darwin source 306" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -2.0)], [
    0.1353352832366127,
  ])
}

///|
test "Log integer power independent mathematical 307" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, -1.0)], [
    0.36787944117144233,
  ])
}

///|
test "Log array power actual Darwin source 307" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, -1.0)], [
    0.36787944117144233,
  ])
}

///|
test "Log integer power independent mathematical 308" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 308" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 309" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 1.0)], [
    2.718281828459045,
  ])
}

///|
test "Log array power actual Darwin source 309" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 1.0)], [
    2.718281828459045,
  ])
}

///|
test "Log integer power independent mathematical 310" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 2.0)], [
    7.3890560989306495,
  ])
}

///|
test "Log array power actual Darwin source 310" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 2.0)], [
    7.3890560989306495,
  ])
}

///|
test "Log integer power independent mathematical 311" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 3.0)], [
    20.085536923187664,
  ])
}

///|
test "Log array power actual Darwin source 311" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 3.0)], [
    20.085536923187664,
  ])
}

///|
test "Log integer power independent mathematical 312" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 4.0)], [
    54.59815003314423,
  ])
}

///|
test "Log array power actual Darwin source 312" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 4.0)], [
    54.59815003314423,
  ])
}

///|
test "Log integer power independent mathematical 313" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 5.0)], [
    148.41315910257657,
  ])
}

///|
test "Log array power actual Darwin source 313" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 5.0)], [
    148.41315910257657,
  ])
}

///|
test "Log integer power independent mathematical 314" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 6.0)], [
    403.428793492735,
  ])
}

///|
test "Log array power actual Darwin source 314" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 6.0)], [
    403.428793492735,
  ])
}

///|
test "Log integer power independent mathematical 315" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 7.0)], [
    1096.6331584284583,
  ])
}

///|
test "Log array power actual Darwin source 315" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 7.0)], [
    1096.6331584284583,
  ])
}

///|
test "Log integer power independent mathematical 316" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 100.0)], [
    2.6881171418161212e+43,
  ])
}

///|
test "Log array power actual Darwin source 316" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 100.0)], [
    2.6881171418161212e+43,
  ])
}

///|
test "Log integer power independent mathematical 317" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 308.0)], [
    5.790291477135e+133,
  ])
}

///|
test "Log array power actual Darwin source 317" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 308.0)], [
    5.790291477135e+133,
  ])
}

///|
test "Log integer power independent mathematical 318" {
  verify_log_grid_bits([log_grid_integer_power(2.718281828459045, 1024.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log array power actual Darwin source 318" {
  verify_log_grid_bits([log_grid_numpy_power(2.718281828459045, 1024.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 319" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -1075.0)], [0.0])
}

///|
test "Log array power actual Darwin source 319" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -1075.0)], [0.0])
}

///|
test "Log integer power independent mathematical 320" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -1074.0)], [0.0])
}

///|
test "Log array power actual Darwin source 320" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -1074.0)], [0.0])
}

///|
test "Log integer power independent mathematical 321" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -1024.0)], [0.0])
}

///|
test "Log array power actual Darwin source 321" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -1024.0)], [0.0])
}

///|
test "Log integer power independent mathematical 322" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -787.0)], [0.0])
}

///|
test "Log array power actual Darwin source 322" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -787.0)], [0.0])
}

///|
test "Log integer power independent mathematical 323" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -683.0)], [0.0])
}

///|
test "Log array power actual Darwin source 323" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -683.0)], [0.0])
}

///|
test "Log integer power independent mathematical 324" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -677.0)], [1.0e-323])
}

///|
test "Log array power actual Darwin source 324" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -677.0)], [1.0e-323])
}

///|
test "Log integer power independent mathematical 325" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -671.0)], [7.105e-321])
}

///|
test "Log array power actual Darwin source 325" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -671.0)], [7.105e-321])
}

///|
test "Log integer power independent mathematical 326" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -665.0)], [5.180427e-318])
}

///|
test "Log array power actual Darwin source 326" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -665.0)], [5.180427e-318])
}

///|
test "Log integer power independent mathematical 327" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -659.0)], [3.776531746e-315])
}

///|
test "Log array power actual Darwin source 327" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -659.0)], [3.776531746e-315])
}

///|
test "Log integer power independent mathematical 328" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -653.0)], [
    2.75309164258e-312,
  ])
}

///|
test "Log array power actual Darwin source 328" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -653.0)], [2.75309164258e-312])
}

///|
test "Log integer power independent mathematical 329" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -647.0)], [
    2.007003807441054e-309,
  ])
}

///|
test "Log array power actual Darwin source 329" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -647.0)], [
    2.007003807441054e-309,
  ])
}

///|
test "Log integer power independent mathematical 330" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -641.0)], [
    1.4631057756245283e-306,
  ])
}

///|
test "Log array power actual Darwin source 330" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -641.0)], [
    1.4631057756245283e-306,
  ])
}

///|
test "Log integer power independent mathematical 331" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -635.0)], [
    1.0666041104302812e-303,
  ])
}

///|
test "Log array power actual Darwin source 331" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -635.0)], [
    1.0666041104302812e-303,
  ])
}

///|
test "Log integer power independent mathematical 332" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -629.0)], [
    7.77554396503675e-301,
  ])
}

///|
test "Log array power actual Darwin source 332" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -629.0)], [
    7.77554396503675e-301,
  ])
}

///|
test "Log integer power independent mathematical 333" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -628.0)], [
    2.332663189511025e-300,
  ])
}

///|
test "Log array power actual Darwin source 333" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -628.0)], [
    2.332663189511025e-300,
  ])
}

///|
test "Log integer power independent mathematical 334" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -623.0)], [
    5.668371550511791e-298,
  ])
}

///|
test "Log array power actual Darwin source 334" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -623.0)], [
    5.668371550511791e-298,
  ])
}

///|
test "Log integer power independent mathematical 335" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -469.0)], [
    1.6987580840979576e-224,
  ])
}

///|
test "Log array power actual Darwin source 335" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -469.0)], [
    1.6987580840979576e-224,
  ])
}

///|
test "Log integer power independent mathematical 336" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -324.0)], [
    2.5865058846772766e-155,
  ])
}

///|
test "Log array power actual Darwin source 336" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -324.0)], [
    2.5865058846772766e-155,
  ])
}

///|
test "Log integer power independent mathematical 337" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -310.0)], [
    1.2371177464728988e-148,
  ])
}

///|
test "Log array power actual Darwin source 337" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -310.0)], [
    1.2371177464728988e-148,
  ])
}

///|
test "Log integer power independent mathematical 338" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -308.0)], [
    1.113405971825609e-147,
  ])
}

///|
test "Log array power actual Darwin source 338" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -308.0)], [
    1.113405971825609e-147,
  ])
}

///|
test "Log integer power independent mathematical 339" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -151.0)], [
    9.00928939184922e-73,
  ])
}

///|
test "Log array power actual Darwin source 339" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -151.0)], [
    9.00928939184922e-73,
  ])
}

///|
test "Log integer power independent mathematical 340" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -100.0)], [
    1.9403252174826328e-48,
  ])
}

///|
test "Log array power actual Darwin source 340" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -100.0)], [
    1.9403252174826328e-48,
  ])
}

///|
test "Log integer power independent mathematical 341" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -6.0)], [
    0.0013717421124828531,
  ])
}

///|
test "Log array power actual Darwin source 341" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -6.0)], [
    0.0013717421124828531,
  ])
}

///|
test "Log integer power independent mathematical 342" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -4.0)], [
    0.012345679012345678,
  ])
}

///|
test "Log array power actual Darwin source 342" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -4.0)], [0.012345679012345678])
}

///|
test "Log integer power independent mathematical 343" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -3.0)], [
    0.037037037037037035,
  ])
}

///|
test "Log array power actual Darwin source 343" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -3.0)], [0.037037037037037035])
}

///|
test "Log integer power independent mathematical 344" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -2.0)], [0.1111111111111111])
}

///|
test "Log array power actual Darwin source 344" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -2.0)], [0.1111111111111111])
}

///|
test "Log integer power independent mathematical 345" {
  verify_log_grid_bits([log_grid_integer_power(3.0, -1.0)], [0.3333333333333333])
}

///|
test "Log array power actual Darwin source 345" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, -1.0)], [0.3333333333333333])
}

///|
test "Log integer power independent mathematical 346" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 346" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 347" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 1.0)], [3.0])
}

///|
test "Log array power actual Darwin source 347" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 1.0)], [3.0])
}

///|
test "Log integer power independent mathematical 348" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 2.0)], [9.0])
}

///|
test "Log array power actual Darwin source 348" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 2.0)], [9.0])
}

///|
test "Log integer power independent mathematical 349" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 3.0)], [27.0])
}

///|
test "Log array power actual Darwin source 349" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 3.0)], [27.0])
}

///|
test "Log integer power independent mathematical 350" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 4.0)], [81.0])
}

///|
test "Log array power actual Darwin source 350" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 4.0)], [81.0])
}

///|
test "Log integer power independent mathematical 351" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 5.0)], [243.0])
}

///|
test "Log array power actual Darwin source 351" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 5.0)], [243.0])
}

///|
test "Log integer power independent mathematical 352" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 6.0)], [729.0])
}

///|
test "Log array power actual Darwin source 352" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 6.0)], [729.0])
}

///|
test "Log integer power independent mathematical 353" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 7.0)], [2187.0])
}

///|
test "Log array power actual Darwin source 353" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 7.0)], [2187.0])
}

///|
test "Log integer power independent mathematical 354" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 8.0)], [6561.0])
}

///|
test "Log array power actual Darwin source 354" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 8.0)], [6561.0])
}

///|
test "Log integer power independent mathematical 355" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 9.0)], [19683.0])
}

///|
test "Log array power actual Darwin source 355" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 9.0)], [19683.0])
}

///|
test "Log integer power independent mathematical 356" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 10.0)], [59049.0])
}

///|
test "Log array power actual Darwin source 356" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 10.0)], [59049.0])
}

///|
test "Log integer power independent mathematical 357" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 100.0)], [
    5.153775207320113e+47,
  ])
}

///|
test "Log array power actual Darwin source 357" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 100.0)], [
    5.153775207320113e+47,
  ])
}

///|
test "Log integer power independent mathematical 358" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 167.0)], [
    4.778037326555936e+79,
  ])
}

///|
test "Log array power actual Darwin source 358" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 167.0)], [
    4.778037326555936e+79,
  ])
}

///|
test "Log integer power independent mathematical 359" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 308.0)], [
    8.981449941033984e+146,
  ])
}

///|
test "Log array power actual Darwin source 359" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 308.0)], [
    8.981449941033984e+146,
  ])
}

///|
test "Log integer power independent mathematical 360" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 326.0)], [
    3.479597728084407e+155,
  ])
}

///|
test "Log array power actual Darwin source 360" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 326.0)], [
    3.479597728084407e+155,
  ])
}

///|
test "Log integer power independent mathematical 361" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 485.0)], [
    2.5340112522765627e+231,
  ])
}

///|
test "Log array power actual Darwin source 361" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 485.0)], [
    2.5340112522765627e+231,
  ])
}

///|
test "Log integer power independent mathematical 362" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 644.0)], [
    1.8453894755814917e+307,
  ])
}

///|
test "Log array power actual Darwin source 362" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 644.0)], [
    1.8453894755814917e+307,
  ])
}

///|
test "Log integer power independent mathematical 363" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 645.0)], [
    5.536168426744475e+307,
  ])
}

///|
test "Log array power actual Darwin source 363" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 645.0)], [
    5.536168426744475e+307,
  ])
}

///|
test "Log integer power independent mathematical 364" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 646.0)], [
    1.6608505280233425e+308,
  ])
}

///|
test "Log array power actual Darwin source 364" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 646.0)], [
    1.6608505280233425e+308,
  ])
}

///|
test "Log integer power independent mathematical 365" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 647.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 365" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 647.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 366" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 803.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 366" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 803.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 367" {
  verify_log_grid_bits([log_grid_integer_power(3.0, 1024.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 367" {
  verify_log_grid_bits([log_grid_numpy_power(3.0, 1024.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 368" {
  verify_log_grid_bits([log_grid_integer_power(5.0, -1.0)], [0.2])
}

///|
test "Log array power actual Darwin source 368" {
  verify_log_grid_bits([log_grid_numpy_power(5.0, -1.0)], [0.2])
}

///|
test "Log integer power independent mathematical 369" {
  verify_log_grid_bits([log_grid_integer_power(5.0, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 369" {
  verify_log_grid_bits([log_grid_numpy_power(5.0, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 370" {
  verify_log_grid_bits([log_grid_integer_power(5.0, 1.0)], [5.0])
}

///|
test "Log array power actual Darwin source 370" {
  verify_log_grid_bits([log_grid_numpy_power(5.0, 1.0)], [5.0])
}

///|
test "Log integer power independent mathematical 371" {
  verify_log_grid_bits([log_grid_integer_power(5.0, 2.0)], [25.0])
}

///|
test "Log array power actual Darwin source 371" {
  verify_log_grid_bits([log_grid_numpy_power(5.0, 2.0)], [25.0])
}

///|
test "Log integer power independent mathematical 372" {
  verify_log_grid_bits([log_grid_integer_power(5.0, 3.0)], [125.0])
}

///|
test "Log array power actual Darwin source 372" {
  verify_log_grid_bits([log_grid_numpy_power(5.0, 3.0)], [125.0])
}

///|
test "Log integer power independent mathematical 373" {
  verify_log_grid_bits([log_grid_integer_power(5.0, 4.0)], [625.0])
}

///|
test "Log array power actual Darwin source 373" {
  verify_log_grid_bits([log_grid_numpy_power(5.0, 4.0)], [625.0])
}

///|
test "Log integer power independent mathematical 374" {
  verify_log_grid_bits([log_grid_integer_power(5.0, 5.0)], [3125.0])
}

///|
test "Log array power actual Darwin source 374" {
  verify_log_grid_bits([log_grid_numpy_power(5.0, 5.0)], [3125.0])
}

///|
test "Log integer power independent mathematical 375" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -1075.0)], [0.0])
}

///|
test "Log array power actual Darwin source 375" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -1075.0)], [0.0])
}

///|
test "Log integer power independent mathematical 376" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -1074.0)], [0.0])
}

///|
test "Log array power actual Darwin source 376" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -1074.0)], [0.0])
}

///|
test "Log integer power independent mathematical 377" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -1024.0)], [0.0])
}

///|
test "Log array power actual Darwin source 377" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -1024.0)], [0.0])
}

///|
test "Log integer power independent mathematical 378" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -376.0)], [0.0])
}

///|
test "Log array power actual Darwin source 378" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -376.0)], [0.0])
}

///|
test "Log integer power independent mathematical 379" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -324.0)], [0.0])
}

///|
test "Log array power actual Darwin source 379" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -324.0)], [0.0])
}

///|
test "Log integer power independent mathematical 380" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -321.0)], [1.0e-321])
}

///|
test "Log array power actual Darwin source 380" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -321.0)], [1.0e-321])
}

///|
test "Log integer power independent mathematical 381" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -318.0)], [1.0e-318])
}

///|
test "Log array power actual Darwin source 381" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -318.0)], [1.0e-318])
}

///|
test "Log integer power independent mathematical 382" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -315.0)], [1.0e-315])
}

///|
test "Log array power actual Darwin source 382" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -315.0)], [1.0e-315])
}

///|
test "Log integer power independent mathematical 383" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -312.0)], [1.0e-312])
}

///|
test "Log array power actual Darwin source 383" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -312.0)], [1.0e-312])
}

///|
test "Log integer power independent mathematical 384" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -309.0)], [1.0e-309])
}

///|
test "Log array power actual Darwin source 384" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -309.0)], [1.0e-309])
}

///|
test "Log integer power independent mathematical 385" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -308.0)], [1.0e-308])
}

///|
test "Log array power actual Darwin source 385" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -308.0)], [1.0e-308])
}

///|
test "Log integer power independent mathematical 386" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -306.0)], [1.0e-306])
}

///|
test "Log array power actual Darwin source 386" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -306.0)], [1.0e-306])
}

///|
test "Log integer power independent mathematical 387" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -303.0)], [1.0e-303])
}

///|
test "Log array power actual Darwin source 387" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -303.0)], [1.0e-303])
}

///|
test "Log integer power independent mathematical 388" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -300.0)], [1.0e-300])
}

///|
test "Log array power actual Darwin source 388" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -300.0)], [1.0e-300])
}

///|
test "Log integer power independent mathematical 389" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -297.0)], [1.0e-297])
}

///|
test "Log array power actual Darwin source 389" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -297.0)], [1.0e-297])
}

///|
test "Log integer power independent mathematical 390" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -224.0)], [1.0e-224])
}

///|
test "Log array power actual Darwin source 390" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -224.0)], [1.0e-224])
}

///|
test "Log integer power independent mathematical 391" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -148.0)], [1.0e-148])
}

///|
test "Log array power actual Darwin source 391" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -148.0)], [1.0e-148])
}

///|
test "Log integer power independent mathematical 392" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -100.0)], [1.0e-100])
}

///|
test "Log array power actual Darwin source 392" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -100.0)], [1.0e-100])
}

///|
test "Log integer power independent mathematical 393" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -72.0)], [1.0e-72])
}

///|
test "Log array power actual Darwin source 393" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -72.0)], [1.0e-72])
}

///|
test "Log integer power independent mathematical 394" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -12.0)], [1.0e-12])
}

///|
test "Log array power actual Darwin source 394" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -12.0)], [1.0e-12])
}

///|
test "Log integer power independent mathematical 395" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -11.0)], [1.0e-11])
}

///|
test "Log array power actual Darwin source 395" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -11.0)], [1.0e-11])
}

///|
test "Log integer power independent mathematical 396" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -10.0)], [1.0e-10])
}

///|
test "Log array power actual Darwin source 396" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -10.0)], [1.0e-10])
}

///|
test "Log integer power independent mathematical 397" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -9.0)], [1.0e-09])
}

///|
test "Log array power actual Darwin source 397" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -9.0)], [1.0e-09])
}

///|
test "Log integer power independent mathematical 398" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -6.0)], [1.0e-06])
}

///|
test "Log array power actual Darwin source 398" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -6.0)], [1.0e-06])
}

///|
test "Log integer power independent mathematical 399" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -5.0)], [1.0e-05])
}

///|
test "Log array power actual Darwin source 399" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -5.0)], [1.0e-05])
}

///|
test "Log integer power independent mathematical 400" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -4.0)], [0.0001])
}

///|
test "Log array power actual Darwin source 400" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -4.0)], [0.0001])
}

///|
test "Log integer power independent mathematical 401" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -3.0)], [0.001])
}

///|
test "Log array power actual Darwin source 401" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -3.0)], [0.001])
}

///|
test "Log integer power independent mathematical 402" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -2.0)], [0.01])
}

///|
test "Log array power actual Darwin source 402" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -2.0)], [0.01])
}

///|
test "Log integer power independent mathematical 403" {
  verify_log_grid_bits([log_grid_integer_power(10.0, -1.0)], [0.1])
}

///|
test "Log array power actual Darwin source 403" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, -1.0)], [0.1])
}

///|
test "Log integer power independent mathematical 404" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 404" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 405" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 1.0)], [10.0])
}

///|
test "Log array power actual Darwin source 405" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 1.0)], [10.0])
}

///|
test "Log integer power independent mathematical 406" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 2.0)], [100.0])
}

///|
test "Log array power actual Darwin source 406" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 2.0)], [100.0])
}

///|
test "Log integer power independent mathematical 407" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 3.0)], [1000.0])
}

///|
test "Log array power actual Darwin source 407" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 3.0)], [1000.0])
}

///|
test "Log integer power independent mathematical 408" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 4.0)], [10000.0])
}

///|
test "Log array power actual Darwin source 408" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 4.0)], [10000.0])
}

///|
test "Log integer power independent mathematical 409" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 5.0)], [100000.0])
}

///|
test "Log array power actual Darwin source 409" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 5.0)], [100000.0])
}

///|
test "Log integer power independent mathematical 410" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 6.0)], [1000000.0])
}

///|
test "Log array power actual Darwin source 410" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 6.0)], [1000000.0])
}

///|
test "Log integer power independent mathematical 411" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 7.0)], [10000000.0])
}

///|
test "Log array power actual Darwin source 411" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 7.0)], [10000000.0])
}

///|
test "Log integer power independent mathematical 412" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 8.0)], [100000000.0])
}

///|
test "Log array power actual Darwin source 412" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 8.0)], [100000000.0])
}

///|
test "Log integer power independent mathematical 413" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 9.0)], [1000000000.0])
}

///|
test "Log array power actual Darwin source 413" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 9.0)], [1000000000.0])
}

///|
test "Log integer power independent mathematical 414" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 10.0)], [10000000000.0])
}

///|
test "Log array power actual Darwin source 414" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 10.0)], [10000000000.0])
}

///|
test "Log integer power independent mathematical 415" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 11.0)], [100000000000.0])
}

///|
test "Log array power actual Darwin source 415" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 11.0)], [100000000000.0])
}

///|
test "Log integer power independent mathematical 416" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 12.0)], [1000000000000.0])
}

///|
test "Log array power actual Darwin source 416" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 12.0)], [1000000000000.0])
}

///|
test "Log integer power independent mathematical 417" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 80.0)], [1.0e+80])
}

///|
test "Log array power actual Darwin source 417" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 80.0)], [1.0e+80])
}

///|
test "Log integer power independent mathematical 418" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 99.0)], [1.0e+99])
}

///|
test "Log array power actual Darwin source 418" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 99.0)], [1.0e+99])
}

///|
test "Log integer power independent mathematical 419" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 100.0)], [1.0e+100])
}

///|
test "Log array power actual Darwin source 419" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 100.0)], [1.0e+100])
}

///|
test "Log integer power independent mathematical 420" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 101.0)], [1.0e+101])
}

///|
test "Log array power actual Darwin source 420" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 101.0)], [1.0e+101])
}

///|
test "Log integer power independent mathematical 421" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 156.0)], [1.0e+156])
}

///|
test "Log array power actual Darwin source 421" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 156.0)], [1.0e+156])
}

///|
test "Log integer power independent mathematical 422" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 232.0)], [1.0e+232])
}

///|
test "Log array power actual Darwin source 422" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 232.0)], [1.0e+232])
}

///|
test "Log integer power independent mathematical 423" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 299.0)], [1.0e+299])
}

///|
test "Log array power actual Darwin source 423" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 299.0)], [1.0e+299])
}

///|
test "Log integer power independent mathematical 424" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 300.0)], [1.0e+300])
}

///|
test "Log array power actual Darwin source 424" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 300.0)], [1.0e+300])
}

///|
test "Log integer power independent mathematical 425" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 301.0)], [1.0e+301])
}

///|
test "Log array power actual Darwin source 425" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 301.0)], [1.0e+301])
}

///|
test "Log integer power independent mathematical 426" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 307.0)], [1.0e+307])
}

///|
test "Log array power actual Darwin source 426" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 307.0)], [1.0e+307])
}

///|
test "Log integer power independent mathematical 427" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 308.0)], [1.0e+308])
}

///|
test "Log array power actual Darwin source 427" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 308.0)], [1.0e+308])
}

///|
test "Log integer power independent mathematical 428" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 309.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 428" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 309.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 429" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 384.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 429" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 384.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 430" {
  verify_log_grid_bits([log_grid_integer_power(10.0, 1024.0)], [1.0 / 0.0])
}

///|
test "Log array power actual Darwin source 430" {
  verify_log_grid_bits([log_grid_numpy_power(10.0, 1024.0)], [1.0 / 0.0])
}

///|
test "Log integer power independent mathematical 431" {
  verify_log_grid_bits([log_grid_integer_power(62501.0, -1.0)], [
    1.5999744004095935e-05,
  ])
}

///|
test "Log array power actual Darwin source 431" {
  verify_log_grid_bits([log_grid_numpy_power(62501.0, -1.0)], [
    1.5999744004095935e-05,
  ])
}

///|
test "Log integer power independent mathematical 432" {
  verify_log_grid_bits([log_grid_integer_power(62501.0, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 432" {
  verify_log_grid_bits([log_grid_numpy_power(62501.0, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 433" {
  verify_log_grid_bits([log_grid_integer_power(62501.0, 1.0)], [62501.0])
}

///|
test "Log array power actual Darwin source 433" {
  verify_log_grid_bits([log_grid_numpy_power(62501.0, 1.0)], [62501.0])
}

///|
test "Log integer power independent mathematical 434" {
  verify_log_grid_bits([log_grid_integer_power(100001.0, -1.0)], [
    9.99990000099999e-06,
  ])
}

///|
test "Log array power actual Darwin source 434" {
  verify_log_grid_bits([log_grid_numpy_power(100001.0, -1.0)], [
    9.99990000099999e-06,
  ])
}

///|
test "Log integer power independent mathematical 435" {
  verify_log_grid_bits([log_grid_integer_power(100001.0, 0.0)], [1.0])
}

///|
test "Log array power actual Darwin source 435" {
  verify_log_grid_bits([log_grid_numpy_power(100001.0, 0.0)], [1.0])
}

///|
test "Log integer power independent mathematical 436" {
  verify_log_grid_bits([log_grid_integer_power(100001.0, 1.0)], [100001.0])
}

///|
test "Log array power actual Darwin source 436" {
  verify_log_grid_bits([log_grid_numpy_power(100001.0, 1.0)], [100001.0])
}

///|
test "Log integer power independent mathematical 437" {
  verify_log_grid_bits([log_grid_integer_power(4.655841924295005e+108, -1.0)], [
    2.147839244244577e-109,
  ])
}

///|
test "Log explicit Darwin rounding profile difference 437" {
  let actual = log_grid_numpy_power(4.655841924295005e+108, -1.0)
  verify_log_grid_bits([actual], [2.147839244244577e-109])
  assert_true(actual.reinterpret_as_uint64() != 2981422847939609261UL)
}

///|
test "Log integer power independent mathematical 438" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -1075.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 438" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.7976931348623157e+308, -1075.0)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 439" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -1074.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 439" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.7976931348623157e+308, -1074.0)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 440" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -1024.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 440" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.7976931348623157e+308, -1024.0)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 441" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -324.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 441" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.7976931348623157e+308, -324.0)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 442" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -308.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 442" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.7976931348623157e+308, -308.0)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 443" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -100.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 443" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.7976931348623157e+308, -100.0)],
    [0.0],
  )
}

///|
test "Log integer power independent mathematical 444" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -6.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 444" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, -6.0)], [
    0.0,
  ])
}

///|
test "Log integer power independent mathematical 445" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -4.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 445" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, -4.0)], [
    0.0,
  ])
}

///|
test "Log integer power independent mathematical 446" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -3.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 446" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, -3.0)], [
    0.0,
  ])
}

///|
test "Log integer power independent mathematical 447" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -2.0)],
    [0.0],
  )
}

///|
test "Log array power actual Darwin source 447" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, -2.0)], [
    0.0,
  ])
}

///|
test "Log integer power independent mathematical 448" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, -1.0)],
    [5.562684646268003e-309],
  )
}

///|
test "Log array power actual Darwin source 448" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, -1.0)], [
    5.562684646268003e-309,
  ])
}

///|
test "Log integer power independent mathematical 449" {
  verify_log_grid_bits([log_grid_integer_power(1.7976931348623157e+308, 0.0)], [
    1.0,
  ])
}

///|
test "Log array power actual Darwin source 449" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, 0.0)], [
    1.0,
  ])
}

///|
test "Log integer power independent mathematical 450" {
  verify_log_grid_bits([log_grid_integer_power(1.7976931348623157e+308, 1.0)], [
    1.7976931348623157e+308,
  ])
}

///|
test "Log array power actual Darwin source 450" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, 1.0)], [
    1.7976931348623157e+308,
  ])
}

///|
test "Log integer power independent mathematical 451" {
  verify_log_grid_bits([log_grid_integer_power(1.7976931348623157e+308, 2.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log array power actual Darwin source 451" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, 2.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 452" {
  verify_log_grid_bits([log_grid_integer_power(1.7976931348623157e+308, 3.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log array power actual Darwin source 452" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, 3.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 453" {
  verify_log_grid_bits([log_grid_integer_power(1.7976931348623157e+308, 4.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log array power actual Darwin source 453" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, 4.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 454" {
  verify_log_grid_bits([log_grid_integer_power(1.7976931348623157e+308, 6.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log array power actual Darwin source 454" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, 6.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 455" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, 100.0)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 455" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, 100.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 456" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, 308.0)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 456" {
  verify_log_grid_bits([log_grid_numpy_power(1.7976931348623157e+308, 308.0)], [
    1.0 / 0.0,
  ])
}

///|
test "Log integer power independent mathematical 457" {
  verify_log_grid_bits(
    [log_grid_integer_power(1.7976931348623157e+308, 1024.0)],
    [1.0 / 0.0],
  )
}

///|
test "Log array power actual Darwin source 457" {
  verify_log_grid_bits(
    [log_grid_numpy_power(1.7976931348623157e+308, 1024.0)],
    [1.0 / 0.0],
  )
}

///|
test "Log near-one point records the deliberate mathematical rounding contract" {
  let previous = @config.classic_mode()
  defer @config.set_classic_mode(previous)
  @config.set_classic_mode(false)
  let locator = LogLocator::new(base=0.9999999999999999)
  verify_log_grid_bits(locator.tick_values(1.0, 1.0), [
    1.0000000000000002, 1.0, 0.9999999999999999,
  ])
  assert_true(
    1.0.reinterpret_as_uint64() != 1.0000000000000002.reinterpret_as_uint64(),
  )
}
