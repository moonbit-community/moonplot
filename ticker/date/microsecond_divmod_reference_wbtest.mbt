// Original CPython divmod, confirmed against NumPy scalar divmod.

///|
test "CPython microsecond divmod 0.0 / 5e-324" {
  let (q, r) = microsecond_divmod(0.0, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 0.0 / 0.1" {
  let (q, r) = microsecond_divmod(0.0, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 0.0 / 1.0" {
  let (q, r) = microsecond_divmod(0.0, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 0.0 / 7.0" {
  let (q, r) = microsecond_divmod(0.0, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 0.0 / 1e+300" {
  let (q, r) = microsecond_divmod(0.0, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 0.0 / 1e+308" {
  let (q, r) = microsecond_divmod(0.0, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -0.0 / 5e-324" {
  let (q, r) = microsecond_divmod(-0.0, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 9223372036854775808UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -0.0 / 0.1" {
  let (q, r) = microsecond_divmod(-0.0, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 9223372036854775808UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -0.0 / 1.0" {
  let (q, r) = microsecond_divmod(-0.0, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 9223372036854775808UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -0.0 / 7.0" {
  let (q, r) = microsecond_divmod(-0.0, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 9223372036854775808UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -0.0 / 1e+300" {
  let (q, r) = microsecond_divmod(-0.0, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 9223372036854775808UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -0.0 / 1e+308" {
  let (q, r) = microsecond_divmod(-0.0, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 9223372036854775808UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 1.0 / 5e-324" {
  let (q, r) = microsecond_divmod(1.0, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 9218868437227405312UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 1.0 / 0.1" {
  let (q, r) = microsecond_divmod(1.0, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 4621256167635550208UL)
  assert_eq(r.reinterpret_as_uint64(), 4591870180066957718UL)
}

///|
test "CPython microsecond divmod 1.0 / 1.0" {
  let (q, r) = microsecond_divmod(1.0, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 4607182418800017408UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 1.0 / 7.0" {
  let (q, r) = microsecond_divmod(1.0, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 4607182418800017408UL)
}

///|
test "CPython microsecond divmod 1.0 / 1e+300" {
  let (q, r) = microsecond_divmod(1.0, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 4607182418800017408UL)
}

///|
test "CPython microsecond divmod 1.0 / 1e+308" {
  let (q, r) = microsecond_divmod(1.0, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 4607182418800017408UL)
}

///|
test "CPython microsecond divmod -1.0 / 5e-324" {
  let (q, r) = microsecond_divmod(-1.0, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 18442240474082181120UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -1.0 / 0.1" {
  let (q, r) = microsecond_divmod(-1.0, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 13845191154443747328UL)
  assert_eq(r.reinterpret_as_uint64(), 4363988038922010624UL)
}

///|
test "CPython microsecond divmod -1.0 / 1.0" {
  let (q, r) = microsecond_divmod(-1.0, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -1.0 / 7.0" {
  let (q, r) = microsecond_divmod(-1.0, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4618441417868443648UL)
}

///|
test "CPython microsecond divmod -1.0 / 1e+300" {
  let (q, r) = microsecond_divmod(-1.0, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 9094988921128908188UL)
}

///|
test "CPython microsecond divmod -1.0 / 1e+308" {
  let (q, r) = microsecond_divmod(-1.0, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 9214871658872686752UL)
}

///|
test "CPython microsecond divmod 0.3 / 5e-324" {
  let (q, r) = microsecond_divmod(0.3, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 9218868437227405312UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 0.3 / 0.1" {
  let (q, r) = microsecond_divmod(0.3, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 4611686018427387904UL)
  assert_eq(r.reinterpret_as_uint64(), 4591870180066957720UL)
}

///|
test "CPython microsecond divmod 0.3 / 1.0" {
  let (q, r) = microsecond_divmod(0.3, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 4599075939470750515UL)
}

///|
test "CPython microsecond divmod 0.3 / 7.0" {
  let (q, r) = microsecond_divmod(0.3, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 4599075939470750515UL)
}

///|
test "CPython microsecond divmod 0.3 / 1e+300" {
  let (q, r) = microsecond_divmod(0.3, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 4599075939470750515UL)
}

///|
test "CPython microsecond divmod 0.3 / 1e+308" {
  let (q, r) = microsecond_divmod(0.3, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 4599075939470750515UL)
}

///|
test "CPython microsecond divmod -0.3 / 5e-324" {
  let (q, r) = microsecond_divmod(-0.3, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 18442240474082181120UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -0.3 / 0.1" {
  let (q, r) = microsecond_divmod(-0.3, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 13837309855095848960UL)
  assert_eq(r.reinterpret_as_uint64(), 4359484439294640128UL)
}

///|
test "CPython microsecond divmod -0.3 / 1.0" {
  let (q, r) = microsecond_divmod(-0.3, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4604480259023595110UL)
}

///|
test "CPython microsecond divmod -0.3 / 7.0" {
  let (q, r) = microsecond_divmod(-0.3, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4619229547803233485UL)
}

///|
test "CPython microsecond divmod -0.3 / 1e+300" {
  let (q, r) = microsecond_divmod(-0.3, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 9094988921128908188UL)
}

///|
test "CPython microsecond divmod -0.3 / 1e+308" {
  let (q, r) = microsecond_divmod(-0.3, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 9214871658872686752UL)
}

///|
test "CPython microsecond divmod 5e-324 / 5e-324" {
  let (q, r) = microsecond_divmod(5.0e-324, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 4607182418800017408UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 5e-324 / 0.1" {
  let (q, r) = microsecond_divmod(5.0e-324, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 1UL)
}

///|
test "CPython microsecond divmod 5e-324 / 1.0" {
  let (q, r) = microsecond_divmod(5.0e-324, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 1UL)
}

///|
test "CPython microsecond divmod 5e-324 / 7.0" {
  let (q, r) = microsecond_divmod(5.0e-324, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 1UL)
}

///|
test "CPython microsecond divmod 5e-324 / 1e+300" {
  let (q, r) = microsecond_divmod(5.0e-324, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 1UL)
}

///|
test "CPython microsecond divmod 5e-324 / 1e+308" {
  let (q, r) = microsecond_divmod(5.0e-324, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 1UL)
}

///|
test "CPython microsecond divmod -5e-324 / 5e-324" {
  let (q, r) = microsecond_divmod(-5.0e-324, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -5e-324 / 0.1" {
  let (q, r) = microsecond_divmod(-5.0e-324, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4591870180066957722UL)
}

///|
test "CPython microsecond divmod -5e-324 / 1.0" {
  let (q, r) = microsecond_divmod(-5.0e-324, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4607182418800017408UL)
}

///|
test "CPython microsecond divmod -5e-324 / 7.0" {
  let (q, r) = microsecond_divmod(-5.0e-324, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4619567317775286272UL)
}

///|
test "CPython microsecond divmod -5e-324 / 1e+300" {
  let (q, r) = microsecond_divmod(-5.0e-324, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 9094988921128908188UL)
}

///|
test "CPython microsecond divmod -5e-324 / 1e+308" {
  let (q, r) = microsecond_divmod(-5.0e-324, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 9214871658872686752UL)
}

///|
test "CPython microsecond divmod 1e-300 / 5e-324" {
  let (q, r) = microsecond_divmod(1.0e-300, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 4955488047685235545UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 1e-300 / 0.1" {
  let (q, r) = microsecond_divmod(1.0e-300, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 118622047889322841UL)
}

///|
test "CPython microsecond divmod 1e-300 / 1.0" {
  let (q, r) = microsecond_divmod(1.0e-300, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 118622047889322841UL)
}

///|
test "CPython microsecond divmod 1e-300 / 7.0" {
  let (q, r) = microsecond_divmod(1.0e-300, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 118622047889322841UL)
}

///|
test "CPython microsecond divmod 1e-300 / 1e+300" {
  let (q, r) = microsecond_divmod(1.0e-300, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 118622047889322841UL)
}

///|
test "CPython microsecond divmod 1e-300 / 1e+308" {
  let (q, r) = microsecond_divmod(1.0e-300, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 0UL)
  assert_eq(r.reinterpret_as_uint64(), 118622047889322841UL)
}

///|
test "CPython microsecond divmod -1e-300 / 5e-324" {
  let (q, r) = microsecond_divmod(-1.0e-300, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 14178860084540011353UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -1e-300 / 0.1" {
  let (q, r) = microsecond_divmod(-1.0e-300, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4591870180066957722UL)
}

///|
test "CPython microsecond divmod -1e-300 / 1.0" {
  let (q, r) = microsecond_divmod(-1.0e-300, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4607182418800017408UL)
}

///|
test "CPython microsecond divmod -1e-300 / 7.0" {
  let (q, r) = microsecond_divmod(-1.0e-300, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 4619567317775286272UL)
}

///|
test "CPython microsecond divmod -1e-300 / 1e+300" {
  let (q, r) = microsecond_divmod(-1.0e-300, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 9094988921128908188UL)
}

///|
test "CPython microsecond divmod -1e-300 / 1e+308" {
  let (q, r) = microsecond_divmod(-1.0e-300, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 9214871658872686752UL)
}

///|
test "CPython microsecond divmod 1e+308 / 5e-324" {
  let (q, r) = microsecond_divmod(1.0e+308, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 9218868437227405312UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 1e+308 / 0.1" {
  let (q, r) = microsecond_divmod(1.0e+308, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 9218868437227405312UL)
  assert_eq(r.reinterpret_as_uint64(), 4588942175050875880UL)
}

///|
test "CPython microsecond divmod 1e+308 / 1.0" {
  let (q, r) = microsecond_divmod(1.0e+308, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 9214871658872686752UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod 1e+308 / 7.0" {
  let (q, r) = microsecond_divmod(1.0e+308, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 9202076634404864183UL)
  assert_eq(r.reinterpret_as_uint64(), 4613937818241073152UL)
}

///|
test "CPython microsecond divmod 1e+308 / 1e+300" {
  let (q, r) = microsecond_divmod(1.0e+308, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 4726483295817170944UL)
  assert_eq(r.reinterpret_as_uint64(), 9094988921100982684UL)
}

///|
test "CPython microsecond divmod 1e+308 / 1e+308" {
  let (q, r) = microsecond_divmod(1.0e+308, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 4607182418800017408UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -1e+308 / 5e-324" {
  let (q, r) = microsecond_divmod(-1.0e+308, 5.0e-324)
  assert_eq(q.reinterpret_as_uint64(), 18442240474082181120UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -1e+308 / 0.1" {
  let (q, r) = microsecond_divmod(-1.0e+308, 0.1)
  assert_eq(q.reinterpret_as_uint64(), 18442240474082181120UL)
  assert_eq(r.reinterpret_as_uint64(), 4585790985828298572UL)
}

///|
test "CPython microsecond divmod -1e+308 / 1.0" {
  let (q, r) = microsecond_divmod(-1.0e+308, 1.0)
  assert_eq(q.reinterpret_as_uint64(), 18438243695727462560UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}

///|
test "CPython microsecond divmod -1e+308 / 7.0" {
  let (q, r) = microsecond_divmod(-1.0e+308, 7.0)
  assert_eq(q.reinterpret_as_uint64(), 18425448671259639991UL)
  assert_eq(r.reinterpret_as_uint64(), 4616189618054758400UL)
}

///|
test "CPython microsecond divmod -1e+308 / 1e+300" {
  let (q, r) = microsecond_divmod(-1.0e+308, 1.0e+300)
  assert_eq(q.reinterpret_as_uint64(), 13949855332739055616UL)
  assert_eq(r.reinterpret_as_uint64(), 8969659453867556864UL)
}

///|
test "CPython microsecond divmod -1e+308 / 1e+308" {
  let (q, r) = microsecond_divmod(-1.0e+308, 1.0e+308)
  assert_eq(q.reinterpret_as_uint64(), 13830554455654793216UL)
  assert_eq(r.reinterpret_as_uint64(), 0UL)
}
