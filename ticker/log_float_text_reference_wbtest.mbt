// Native CPython float(str); every expected result comes from the builtin.

///|
fn verify_log_float_text(
  id : Int32,
  text : String,
  bits : UInt64?,
  expected_error : String?,
) -> Unit raise {
  let (actual, error) = (
    Some(log_text_float(text).reinterpret_as_uint64()),
    None,
  ) catch {
    @core.DataError::InvalidTicks(message~) => (None, Some(message))
    _ => (None, Some("unexpected error"))
  }
  if actual != bits || error != expected_error {
    fail("float text case " + id.to_string() + ": unexpected result or error")
  }
}

///|
test "native log base float text group 0" {
  verify_log_float_text(
    0,
    "",
    None,
    Some("ValueError: could not convert string to float: ''"),
  )
  verify_log_float_text(
    1,
    "+",
    None,
    Some("ValueError: could not convert string to float: '+'"),
  )
  verify_log_float_text(
    2,
    "-",
    None,
    Some("ValueError: could not convert string to float: '-'"),
  )
  verify_log_float_text(
    3,
    ".",
    None,
    Some("ValueError: could not convert string to float: '.'"),
  )
  verify_log_float_text(
    4,
    "+.",
    None,
    Some("ValueError: could not convert string to float: '+.'"),
  )
  verify_log_float_text(
    5,
    "-.",
    None,
    Some("ValueError: could not convert string to float: '-.'"),
  )
  verify_log_float_text(6, "0", Some(0UL), None)
  verify_log_float_text(7, "-0", Some(9223372036854775808UL), None)
  verify_log_float_text(8, "+0", Some(0UL), None)
  verify_log_float_text(9, "1.", Some(4607182418800017408UL), None)
  verify_log_float_text(10, ".1", Some(4591870180066957722UL), None)
  verify_log_float_text(11, "1.e2", Some(4636737291354636288UL), None)
  verify_log_float_text(12, "1_0.2_5e+0_1", Some(4636913213215080448UL), None)
  verify_log_float_text(13, "00_00.00_01", Some(4547007122018943789UL), None)
  verify_log_float_text(14, "NaN", Some(9221120237041090560UL), None)
  verify_log_float_text(15, "nan", Some(9221120237041090560UL), None)
  verify_log_float_text(16, "-NaN", Some(18444492273895866368UL), None)
  verify_log_float_text(17, "+nAn", Some(9221120237041090560UL), None)
  verify_log_float_text(18, "INF", Some(9218868437227405312UL), None)
  verify_log_float_text(19, "-Infinity", Some(18442240474082181120UL), None)
  verify_log_float_text(20, "+inFinIty", Some(9218868437227405312UL), None)
  verify_log_float_text(
    21,
    "nan(1)",
    None,
    Some("ValueError: could not convert string to float: 'nan(1)'"),
  )
  verify_log_float_text(
    22,
    "i_nf",
    None,
    Some("ValueError: could not convert string to float: 'i_nf'"),
  )
  verify_log_float_text(
    23,
    "_1",
    None,
    Some("ValueError: could not convert string to float: '_1'"),
  )
  verify_log_float_text(
    24,
    "1_",
    None,
    Some("ValueError: could not convert string to float: '1_'"),
  )
  verify_log_float_text(
    25,
    "1__0",
    None,
    Some("ValueError: could not convert string to float: '1__0'"),
  )
  verify_log_float_text(
    26,
    "1_.0",
    None,
    Some("ValueError: could not convert string to float: '1_.0'"),
  )
  verify_log_float_text(
    27,
    "1._0",
    None,
    Some("ValueError: could not convert string to float: '1._0'"),
  )
  verify_log_float_text(
    28,
    "1e_2",
    None,
    Some("ValueError: could not convert string to float: '1e_2'"),
  )
  verify_log_float_text(
    29,
    "1_e2",
    None,
    Some("ValueError: could not convert string to float: '1_e2'"),
  )
  verify_log_float_text(
    30,
    "1e+_2",
    None,
    Some("ValueError: could not convert string to float: '1e+_2'"),
  )
  verify_log_float_text(
    31,
    "1 e2",
    None,
    Some("ValueError: could not convert string to float: '1 e2'"),
  )
}

///|
test "native log base float text group 1" {
  verify_log_float_text(
    32,
    "0x1p2",
    None,
    Some("ValueError: could not convert string to float: '0x1p2'"),
  )
  verify_log_float_text(
    33,
    "0x10",
    None,
    Some("ValueError: could not convert string to float: '0x10'"),
  )
  verify_log_float_text(
    34,
    "1,2",
    None,
    Some("ValueError: could not convert string to float: '1,2'"),
  )
  verify_log_float_text(
    35,
    "1\u{0}",
    None,
    Some("ValueError: could not convert string to float: '1\\x00'"),
  )
  verify_log_float_text(
    36,
    "\u{0}1",
    None,
    Some("ValueError: could not convert string to float: '\\x001'"),
  )
  verify_log_float_text(
    37,
    "−1",
    None,
    Some("ValueError: could not convert string to float: '−1'"),
  )
  verify_log_float_text(
    38,
    "１．２",
    None,
    Some("ValueError: could not convert string to float: '１．２'"),
  )
  verify_log_float_text(
    39,
    "a'b",
    None,
    Some("ValueError: could not convert string to float: \"a'b\""),
  )
  verify_log_float_text(
    40,
    "a\"b",
    None,
    Some("ValueError: could not convert string to float: 'a\"b'"),
  )
  verify_log_float_text(
    41,
    "a'\"b",
    None,
    Some("ValueError: could not convert string to float: 'a\\'\"b'"),
  )
  verify_log_float_text(
    42,
    "\\",
    None,
    Some("ValueError: could not convert string to float: '\\\\'"),
  )
  verify_log_float_text(43, "\u{a}1\u{9}", Some(4607182418800017408UL), None)
  verify_log_float_text(
    44,
    "1\u{200b}",
    None,
    Some("ValueError: could not convert string to float: '1\\u200b'"),
  )
  verify_log_float_text(
    45,
    "\u{feff}1",
    None,
    Some("ValueError: could not convert string to float: '\\ufeff1'"),
  )
  verify_log_float_text(46, "0.5", Some(4602678819172646912UL), None)
  verify_log_float_text(47, "1e+0", Some(4607182418800017408UL), None)
  verify_log_float_text(48, "1.5", Some(4609434218613702656UL), None)
  verify_log_float_text(49, "1e+1", Some(4621819117588971520UL), None)
  verify_log_float_text(50, "2.5", Some(4612811918334230528UL), None)
  verify_log_float_text(51, "1e+2", Some(4636737291354636288UL), None)
  verify_log_float_text(52, "3.5", Some(4615063718147915776UL), None)
  verify_log_float_text(53, "1e+3", Some(4652007308841189376UL), None)
  verify_log_float_text(54, "4.5", Some(4616752568008179712UL), None)
  verify_log_float_text(55, "1e+4", Some(4666723172467343360UL), None)
  verify_log_float_text(56, "5.5", Some(4617878467915022336UL), None)
  verify_log_float_text(57, "1e+5", Some(4681608360884174848UL), None)
  verify_log_float_text(58, "6.5", Some(4619004367821864960UL), None)
  verify_log_float_text(59, "1e+6", Some(4696837146684686336UL), None)
  verify_log_float_text(60, "7.5", Some(4620130267728707584UL), None)
  verify_log_float_text(61, "1e+7", Some(4711630319722168320UL), None)
  verify_log_float_text(62, "8.5", Some(4620974692658839552UL), None)
  verify_log_float_text(63, "1e+8", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 2" {
  verify_log_float_text(64, "9.5", Some(4621537642612260864UL), None)
  verify_log_float_text(65, "1e+9", Some(4741671816366391296UL), None)
  verify_log_float_text(66, "٠.5", Some(4602678819172646912UL), None)
  verify_log_float_text(67, "1e+٠", Some(4607182418800017408UL), None)
  verify_log_float_text(68, "١.5", Some(4609434218613702656UL), None)
  verify_log_float_text(69, "1e+١", Some(4621819117588971520UL), None)
  verify_log_float_text(70, "٢.5", Some(4612811918334230528UL), None)
  verify_log_float_text(71, "1e+٢", Some(4636737291354636288UL), None)
  verify_log_float_text(72, "٣.5", Some(4615063718147915776UL), None)
  verify_log_float_text(73, "1e+٣", Some(4652007308841189376UL), None)
  verify_log_float_text(74, "٤.5", Some(4616752568008179712UL), None)
  verify_log_float_text(75, "1e+٤", Some(4666723172467343360UL), None)
  verify_log_float_text(76, "٥.5", Some(4617878467915022336UL), None)
  verify_log_float_text(77, "1e+٥", Some(4681608360884174848UL), None)
  verify_log_float_text(78, "٦.5", Some(4619004367821864960UL), None)
  verify_log_float_text(79, "1e+٦", Some(4696837146684686336UL), None)
  verify_log_float_text(80, "٧.5", Some(4620130267728707584UL), None)
  verify_log_float_text(81, "1e+٧", Some(4711630319722168320UL), None)
  verify_log_float_text(82, "٨.5", Some(4620974692658839552UL), None)
  verify_log_float_text(83, "1e+٨", Some(4726483295884279808UL), None)
  verify_log_float_text(84, "٩.5", Some(4621537642612260864UL), None)
  verify_log_float_text(85, "1e+٩", Some(4741671816366391296UL), None)
  verify_log_float_text(86, "۰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(87, "1e+۰", Some(4607182418800017408UL), None)
  verify_log_float_text(88, "۱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(89, "1e+۱", Some(4621819117588971520UL), None)
  verify_log_float_text(90, "۲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(91, "1e+۲", Some(4636737291354636288UL), None)
  verify_log_float_text(92, "۳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(93, "1e+۳", Some(4652007308841189376UL), None)
  verify_log_float_text(94, "۴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(95, "1e+۴", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 3" {
  verify_log_float_text(96, "۵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(97, "1e+۵", Some(4681608360884174848UL), None)
  verify_log_float_text(98, "۶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(99, "1e+۶", Some(4696837146684686336UL), None)
  verify_log_float_text(100, "۷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(101, "1e+۷", Some(4711630319722168320UL), None)
  verify_log_float_text(102, "۸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(103, "1e+۸", Some(4726483295884279808UL), None)
  verify_log_float_text(104, "۹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(105, "1e+۹", Some(4741671816366391296UL), None)
  verify_log_float_text(106, "߀.5", Some(4602678819172646912UL), None)
  verify_log_float_text(107, "1e+߀", Some(4607182418800017408UL), None)
  verify_log_float_text(108, "߁.5", Some(4609434218613702656UL), None)
  verify_log_float_text(109, "1e+߁", Some(4621819117588971520UL), None)
  verify_log_float_text(110, "߂.5", Some(4612811918334230528UL), None)
  verify_log_float_text(111, "1e+߂", Some(4636737291354636288UL), None)
  verify_log_float_text(112, "߃.5", Some(4615063718147915776UL), None)
  verify_log_float_text(113, "1e+߃", Some(4652007308841189376UL), None)
  verify_log_float_text(114, "߄.5", Some(4616752568008179712UL), None)
  verify_log_float_text(115, "1e+߄", Some(4666723172467343360UL), None)
  verify_log_float_text(116, "߅.5", Some(4617878467915022336UL), None)
  verify_log_float_text(117, "1e+߅", Some(4681608360884174848UL), None)
  verify_log_float_text(118, "߆.5", Some(4619004367821864960UL), None)
  verify_log_float_text(119, "1e+߆", Some(4696837146684686336UL), None)
  verify_log_float_text(120, "߇.5", Some(4620130267728707584UL), None)
  verify_log_float_text(121, "1e+߇", Some(4711630319722168320UL), None)
  verify_log_float_text(122, "߈.5", Some(4620974692658839552UL), None)
  verify_log_float_text(123, "1e+߈", Some(4726483295884279808UL), None)
  verify_log_float_text(124, "߉.5", Some(4621537642612260864UL), None)
  verify_log_float_text(125, "1e+߉", Some(4741671816366391296UL), None)
  verify_log_float_text(126, "०.5", Some(4602678819172646912UL), None)
  verify_log_float_text(127, "1e+०", Some(4607182418800017408UL), None)
}

///|
test "native log base float text group 4" {
  verify_log_float_text(128, "१.5", Some(4609434218613702656UL), None)
  verify_log_float_text(129, "1e+१", Some(4621819117588971520UL), None)
  verify_log_float_text(130, "२.5", Some(4612811918334230528UL), None)
  verify_log_float_text(131, "1e+२", Some(4636737291354636288UL), None)
  verify_log_float_text(132, "३.5", Some(4615063718147915776UL), None)
  verify_log_float_text(133, "1e+३", Some(4652007308841189376UL), None)
  verify_log_float_text(134, "४.5", Some(4616752568008179712UL), None)
  verify_log_float_text(135, "1e+४", Some(4666723172467343360UL), None)
  verify_log_float_text(136, "५.5", Some(4617878467915022336UL), None)
  verify_log_float_text(137, "1e+५", Some(4681608360884174848UL), None)
  verify_log_float_text(138, "६.5", Some(4619004367821864960UL), None)
  verify_log_float_text(139, "1e+६", Some(4696837146684686336UL), None)
  verify_log_float_text(140, "७.5", Some(4620130267728707584UL), None)
  verify_log_float_text(141, "1e+७", Some(4711630319722168320UL), None)
  verify_log_float_text(142, "८.5", Some(4620974692658839552UL), None)
  verify_log_float_text(143, "1e+८", Some(4726483295884279808UL), None)
  verify_log_float_text(144, "९.5", Some(4621537642612260864UL), None)
  verify_log_float_text(145, "1e+९", Some(4741671816366391296UL), None)
  verify_log_float_text(146, "০.5", Some(4602678819172646912UL), None)
  verify_log_float_text(147, "1e+০", Some(4607182418800017408UL), None)
  verify_log_float_text(148, "১.5", Some(4609434218613702656UL), None)
  verify_log_float_text(149, "1e+১", Some(4621819117588971520UL), None)
  verify_log_float_text(150, "২.5", Some(4612811918334230528UL), None)
  verify_log_float_text(151, "1e+২", Some(4636737291354636288UL), None)
  verify_log_float_text(152, "৩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(153, "1e+৩", Some(4652007308841189376UL), None)
  verify_log_float_text(154, "৪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(155, "1e+৪", Some(4666723172467343360UL), None)
  verify_log_float_text(156, "৫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(157, "1e+৫", Some(4681608360884174848UL), None)
  verify_log_float_text(158, "৬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(159, "1e+৬", Some(4696837146684686336UL), None)
}

///|
test "native log base float text group 5" {
  verify_log_float_text(160, "৭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(161, "1e+৭", Some(4711630319722168320UL), None)
  verify_log_float_text(162, "৮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(163, "1e+৮", Some(4726483295884279808UL), None)
  verify_log_float_text(164, "৯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(165, "1e+৯", Some(4741671816366391296UL), None)
  verify_log_float_text(166, "੦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(167, "1e+੦", Some(4607182418800017408UL), None)
  verify_log_float_text(168, "੧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(169, "1e+੧", Some(4621819117588971520UL), None)
  verify_log_float_text(170, "੨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(171, "1e+੨", Some(4636737291354636288UL), None)
  verify_log_float_text(172, "੩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(173, "1e+੩", Some(4652007308841189376UL), None)
  verify_log_float_text(174, "੪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(175, "1e+੪", Some(4666723172467343360UL), None)
  verify_log_float_text(176, "੫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(177, "1e+੫", Some(4681608360884174848UL), None)
  verify_log_float_text(178, "੬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(179, "1e+੬", Some(4696837146684686336UL), None)
  verify_log_float_text(180, "੭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(181, "1e+੭", Some(4711630319722168320UL), None)
  verify_log_float_text(182, "੮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(183, "1e+੮", Some(4726483295884279808UL), None)
  verify_log_float_text(184, "੯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(185, "1e+੯", Some(4741671816366391296UL), None)
  verify_log_float_text(186, "૦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(187, "1e+૦", Some(4607182418800017408UL), None)
  verify_log_float_text(188, "૧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(189, "1e+૧", Some(4621819117588971520UL), None)
  verify_log_float_text(190, "૨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(191, "1e+૨", Some(4636737291354636288UL), None)
}

///|
test "native log base float text group 6" {
  verify_log_float_text(192, "૩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(193, "1e+૩", Some(4652007308841189376UL), None)
  verify_log_float_text(194, "૪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(195, "1e+૪", Some(4666723172467343360UL), None)
  verify_log_float_text(196, "૫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(197, "1e+૫", Some(4681608360884174848UL), None)
  verify_log_float_text(198, "૬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(199, "1e+૬", Some(4696837146684686336UL), None)
  verify_log_float_text(200, "૭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(201, "1e+૭", Some(4711630319722168320UL), None)
  verify_log_float_text(202, "૮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(203, "1e+૮", Some(4726483295884279808UL), None)
  verify_log_float_text(204, "૯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(205, "1e+૯", Some(4741671816366391296UL), None)
  verify_log_float_text(206, "୦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(207, "1e+୦", Some(4607182418800017408UL), None)
  verify_log_float_text(208, "୧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(209, "1e+୧", Some(4621819117588971520UL), None)
  verify_log_float_text(210, "୨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(211, "1e+୨", Some(4636737291354636288UL), None)
  verify_log_float_text(212, "୩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(213, "1e+୩", Some(4652007308841189376UL), None)
  verify_log_float_text(214, "୪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(215, "1e+୪", Some(4666723172467343360UL), None)
  verify_log_float_text(216, "୫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(217, "1e+୫", Some(4681608360884174848UL), None)
  verify_log_float_text(218, "୬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(219, "1e+୬", Some(4696837146684686336UL), None)
  verify_log_float_text(220, "୭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(221, "1e+୭", Some(4711630319722168320UL), None)
  verify_log_float_text(222, "୮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(223, "1e+୮", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 7" {
  verify_log_float_text(224, "୯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(225, "1e+୯", Some(4741671816366391296UL), None)
  verify_log_float_text(226, "௦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(227, "1e+௦", Some(4607182418800017408UL), None)
  verify_log_float_text(228, "௧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(229, "1e+௧", Some(4621819117588971520UL), None)
  verify_log_float_text(230, "௨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(231, "1e+௨", Some(4636737291354636288UL), None)
  verify_log_float_text(232, "௩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(233, "1e+௩", Some(4652007308841189376UL), None)
  verify_log_float_text(234, "௪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(235, "1e+௪", Some(4666723172467343360UL), None)
  verify_log_float_text(236, "௫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(237, "1e+௫", Some(4681608360884174848UL), None)
  verify_log_float_text(238, "௬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(239, "1e+௬", Some(4696837146684686336UL), None)
  verify_log_float_text(240, "௭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(241, "1e+௭", Some(4711630319722168320UL), None)
  verify_log_float_text(242, "௮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(243, "1e+௮", Some(4726483295884279808UL), None)
  verify_log_float_text(244, "௯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(245, "1e+௯", Some(4741671816366391296UL), None)
  verify_log_float_text(246, "౦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(247, "1e+౦", Some(4607182418800017408UL), None)
  verify_log_float_text(248, "౧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(249, "1e+౧", Some(4621819117588971520UL), None)
  verify_log_float_text(250, "౨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(251, "1e+౨", Some(4636737291354636288UL), None)
  verify_log_float_text(252, "౩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(253, "1e+౩", Some(4652007308841189376UL), None)
  verify_log_float_text(254, "౪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(255, "1e+౪", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 8" {
  verify_log_float_text(256, "౫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(257, "1e+౫", Some(4681608360884174848UL), None)
  verify_log_float_text(258, "౬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(259, "1e+౬", Some(4696837146684686336UL), None)
  verify_log_float_text(260, "౭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(261, "1e+౭", Some(4711630319722168320UL), None)
  verify_log_float_text(262, "౮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(263, "1e+౮", Some(4726483295884279808UL), None)
  verify_log_float_text(264, "౯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(265, "1e+౯", Some(4741671816366391296UL), None)
  verify_log_float_text(266, "೦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(267, "1e+೦", Some(4607182418800017408UL), None)
  verify_log_float_text(268, "೧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(269, "1e+೧", Some(4621819117588971520UL), None)
  verify_log_float_text(270, "೨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(271, "1e+೨", Some(4636737291354636288UL), None)
  verify_log_float_text(272, "೩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(273, "1e+೩", Some(4652007308841189376UL), None)
  verify_log_float_text(274, "೪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(275, "1e+೪", Some(4666723172467343360UL), None)
  verify_log_float_text(276, "೫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(277, "1e+೫", Some(4681608360884174848UL), None)
  verify_log_float_text(278, "೬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(279, "1e+೬", Some(4696837146684686336UL), None)
  verify_log_float_text(280, "೭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(281, "1e+೭", Some(4711630319722168320UL), None)
  verify_log_float_text(282, "೮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(283, "1e+೮", Some(4726483295884279808UL), None)
  verify_log_float_text(284, "೯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(285, "1e+೯", Some(4741671816366391296UL), None)
  verify_log_float_text(286, "൦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(287, "1e+൦", Some(4607182418800017408UL), None)
}

///|
test "native log base float text group 9" {
  verify_log_float_text(288, "൧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(289, "1e+൧", Some(4621819117588971520UL), None)
  verify_log_float_text(290, "൨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(291, "1e+൨", Some(4636737291354636288UL), None)
  verify_log_float_text(292, "൩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(293, "1e+൩", Some(4652007308841189376UL), None)
  verify_log_float_text(294, "൪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(295, "1e+൪", Some(4666723172467343360UL), None)
  verify_log_float_text(296, "൫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(297, "1e+൫", Some(4681608360884174848UL), None)
  verify_log_float_text(298, "൬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(299, "1e+൬", Some(4696837146684686336UL), None)
  verify_log_float_text(300, "൭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(301, "1e+൭", Some(4711630319722168320UL), None)
  verify_log_float_text(302, "൮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(303, "1e+൮", Some(4726483295884279808UL), None)
  verify_log_float_text(304, "൯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(305, "1e+൯", Some(4741671816366391296UL), None)
  verify_log_float_text(306, "෦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(307, "1e+෦", Some(4607182418800017408UL), None)
  verify_log_float_text(308, "෧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(309, "1e+෧", Some(4621819117588971520UL), None)
  verify_log_float_text(310, "෨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(311, "1e+෨", Some(4636737291354636288UL), None)
  verify_log_float_text(312, "෩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(313, "1e+෩", Some(4652007308841189376UL), None)
  verify_log_float_text(314, "෪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(315, "1e+෪", Some(4666723172467343360UL), None)
  verify_log_float_text(316, "෫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(317, "1e+෫", Some(4681608360884174848UL), None)
  verify_log_float_text(318, "෬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(319, "1e+෬", Some(4696837146684686336UL), None)
}

///|
test "native log base float text group 10" {
  verify_log_float_text(320, "෭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(321, "1e+෭", Some(4711630319722168320UL), None)
  verify_log_float_text(322, "෮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(323, "1e+෮", Some(4726483295884279808UL), None)
  verify_log_float_text(324, "෯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(325, "1e+෯", Some(4741671816366391296UL), None)
  verify_log_float_text(326, "๐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(327, "1e+๐", Some(4607182418800017408UL), None)
  verify_log_float_text(328, "๑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(329, "1e+๑", Some(4621819117588971520UL), None)
  verify_log_float_text(330, "๒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(331, "1e+๒", Some(4636737291354636288UL), None)
  verify_log_float_text(332, "๓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(333, "1e+๓", Some(4652007308841189376UL), None)
  verify_log_float_text(334, "๔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(335, "1e+๔", Some(4666723172467343360UL), None)
  verify_log_float_text(336, "๕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(337, "1e+๕", Some(4681608360884174848UL), None)
  verify_log_float_text(338, "๖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(339, "1e+๖", Some(4696837146684686336UL), None)
  verify_log_float_text(340, "๗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(341, "1e+๗", Some(4711630319722168320UL), None)
  verify_log_float_text(342, "๘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(343, "1e+๘", Some(4726483295884279808UL), None)
  verify_log_float_text(344, "๙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(345, "1e+๙", Some(4741671816366391296UL), None)
  verify_log_float_text(346, "໐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(347, "1e+໐", Some(4607182418800017408UL), None)
  verify_log_float_text(348, "໑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(349, "1e+໑", Some(4621819117588971520UL), None)
  verify_log_float_text(350, "໒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(351, "1e+໒", Some(4636737291354636288UL), None)
}

///|
test "native log base float text group 11" {
  verify_log_float_text(352, "໓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(353, "1e+໓", Some(4652007308841189376UL), None)
  verify_log_float_text(354, "໔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(355, "1e+໔", Some(4666723172467343360UL), None)
  verify_log_float_text(356, "໕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(357, "1e+໕", Some(4681608360884174848UL), None)
  verify_log_float_text(358, "໖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(359, "1e+໖", Some(4696837146684686336UL), None)
  verify_log_float_text(360, "໗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(361, "1e+໗", Some(4711630319722168320UL), None)
  verify_log_float_text(362, "໘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(363, "1e+໘", Some(4726483295884279808UL), None)
  verify_log_float_text(364, "໙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(365, "1e+໙", Some(4741671816366391296UL), None)
  verify_log_float_text(366, "༠.5", Some(4602678819172646912UL), None)
  verify_log_float_text(367, "1e+༠", Some(4607182418800017408UL), None)
  verify_log_float_text(368, "༡.5", Some(4609434218613702656UL), None)
  verify_log_float_text(369, "1e+༡", Some(4621819117588971520UL), None)
  verify_log_float_text(370, "༢.5", Some(4612811918334230528UL), None)
  verify_log_float_text(371, "1e+༢", Some(4636737291354636288UL), None)
  verify_log_float_text(372, "༣.5", Some(4615063718147915776UL), None)
  verify_log_float_text(373, "1e+༣", Some(4652007308841189376UL), None)
  verify_log_float_text(374, "༤.5", Some(4616752568008179712UL), None)
  verify_log_float_text(375, "1e+༤", Some(4666723172467343360UL), None)
  verify_log_float_text(376, "༥.5", Some(4617878467915022336UL), None)
  verify_log_float_text(377, "1e+༥", Some(4681608360884174848UL), None)
  verify_log_float_text(378, "༦.5", Some(4619004367821864960UL), None)
  verify_log_float_text(379, "1e+༦", Some(4696837146684686336UL), None)
  verify_log_float_text(380, "༧.5", Some(4620130267728707584UL), None)
  verify_log_float_text(381, "1e+༧", Some(4711630319722168320UL), None)
  verify_log_float_text(382, "༨.5", Some(4620974692658839552UL), None)
  verify_log_float_text(383, "1e+༨", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 12" {
  verify_log_float_text(384, "༩.5", Some(4621537642612260864UL), None)
  verify_log_float_text(385, "1e+༩", Some(4741671816366391296UL), None)
  verify_log_float_text(386, "၀.5", Some(4602678819172646912UL), None)
  verify_log_float_text(387, "1e+၀", Some(4607182418800017408UL), None)
  verify_log_float_text(388, "၁.5", Some(4609434218613702656UL), None)
  verify_log_float_text(389, "1e+၁", Some(4621819117588971520UL), None)
  verify_log_float_text(390, "၂.5", Some(4612811918334230528UL), None)
  verify_log_float_text(391, "1e+၂", Some(4636737291354636288UL), None)
  verify_log_float_text(392, "၃.5", Some(4615063718147915776UL), None)
  verify_log_float_text(393, "1e+၃", Some(4652007308841189376UL), None)
  verify_log_float_text(394, "၄.5", Some(4616752568008179712UL), None)
  verify_log_float_text(395, "1e+၄", Some(4666723172467343360UL), None)
  verify_log_float_text(396, "၅.5", Some(4617878467915022336UL), None)
  verify_log_float_text(397, "1e+၅", Some(4681608360884174848UL), None)
  verify_log_float_text(398, "၆.5", Some(4619004367821864960UL), None)
  verify_log_float_text(399, "1e+၆", Some(4696837146684686336UL), None)
  verify_log_float_text(400, "၇.5", Some(4620130267728707584UL), None)
  verify_log_float_text(401, "1e+၇", Some(4711630319722168320UL), None)
  verify_log_float_text(402, "၈.5", Some(4620974692658839552UL), None)
  verify_log_float_text(403, "1e+၈", Some(4726483295884279808UL), None)
  verify_log_float_text(404, "၉.5", Some(4621537642612260864UL), None)
  verify_log_float_text(405, "1e+၉", Some(4741671816366391296UL), None)
  verify_log_float_text(406, "႐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(407, "1e+႐", Some(4607182418800017408UL), None)
  verify_log_float_text(408, "႑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(409, "1e+႑", Some(4621819117588971520UL), None)
  verify_log_float_text(410, "႒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(411, "1e+႒", Some(4636737291354636288UL), None)
  verify_log_float_text(412, "႓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(413, "1e+႓", Some(4652007308841189376UL), None)
  verify_log_float_text(414, "႔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(415, "1e+႔", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 13" {
  verify_log_float_text(416, "႕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(417, "1e+႕", Some(4681608360884174848UL), None)
  verify_log_float_text(418, "႖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(419, "1e+႖", Some(4696837146684686336UL), None)
  verify_log_float_text(420, "႗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(421, "1e+႗", Some(4711630319722168320UL), None)
  verify_log_float_text(422, "႘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(423, "1e+႘", Some(4726483295884279808UL), None)
  verify_log_float_text(424, "႙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(425, "1e+႙", Some(4741671816366391296UL), None)
  verify_log_float_text(426, "០.5", Some(4602678819172646912UL), None)
  verify_log_float_text(427, "1e+០", Some(4607182418800017408UL), None)
  verify_log_float_text(428, "១.5", Some(4609434218613702656UL), None)
  verify_log_float_text(429, "1e+១", Some(4621819117588971520UL), None)
  verify_log_float_text(430, "២.5", Some(4612811918334230528UL), None)
  verify_log_float_text(431, "1e+២", Some(4636737291354636288UL), None)
  verify_log_float_text(432, "៣.5", Some(4615063718147915776UL), None)
  verify_log_float_text(433, "1e+៣", Some(4652007308841189376UL), None)
  verify_log_float_text(434, "៤.5", Some(4616752568008179712UL), None)
  verify_log_float_text(435, "1e+៤", Some(4666723172467343360UL), None)
  verify_log_float_text(436, "៥.5", Some(4617878467915022336UL), None)
  verify_log_float_text(437, "1e+៥", Some(4681608360884174848UL), None)
  verify_log_float_text(438, "៦.5", Some(4619004367821864960UL), None)
  verify_log_float_text(439, "1e+៦", Some(4696837146684686336UL), None)
  verify_log_float_text(440, "៧.5", Some(4620130267728707584UL), None)
  verify_log_float_text(441, "1e+៧", Some(4711630319722168320UL), None)
  verify_log_float_text(442, "៨.5", Some(4620974692658839552UL), None)
  verify_log_float_text(443, "1e+៨", Some(4726483295884279808UL), None)
  verify_log_float_text(444, "៩.5", Some(4621537642612260864UL), None)
  verify_log_float_text(445, "1e+៩", Some(4741671816366391296UL), None)
  verify_log_float_text(446, "᠐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(447, "1e+᠐", Some(4607182418800017408UL), None)
}

///|
test "native log base float text group 14" {
  verify_log_float_text(448, "᠑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(449, "1e+᠑", Some(4621819117588971520UL), None)
  verify_log_float_text(450, "᠒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(451, "1e+᠒", Some(4636737291354636288UL), None)
  verify_log_float_text(452, "᠓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(453, "1e+᠓", Some(4652007308841189376UL), None)
  verify_log_float_text(454, "᠔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(455, "1e+᠔", Some(4666723172467343360UL), None)
  verify_log_float_text(456, "᠕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(457, "1e+᠕", Some(4681608360884174848UL), None)
  verify_log_float_text(458, "᠖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(459, "1e+᠖", Some(4696837146684686336UL), None)
  verify_log_float_text(460, "᠗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(461, "1e+᠗", Some(4711630319722168320UL), None)
  verify_log_float_text(462, "᠘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(463, "1e+᠘", Some(4726483295884279808UL), None)
  verify_log_float_text(464, "᠙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(465, "1e+᠙", Some(4741671816366391296UL), None)
  verify_log_float_text(466, "᥆.5", Some(4602678819172646912UL), None)
  verify_log_float_text(467, "1e+᥆", Some(4607182418800017408UL), None)
  verify_log_float_text(468, "᥇.5", Some(4609434218613702656UL), None)
  verify_log_float_text(469, "1e+᥇", Some(4621819117588971520UL), None)
  verify_log_float_text(470, "᥈.5", Some(4612811918334230528UL), None)
  verify_log_float_text(471, "1e+᥈", Some(4636737291354636288UL), None)
  verify_log_float_text(472, "᥉.5", Some(4615063718147915776UL), None)
  verify_log_float_text(473, "1e+᥉", Some(4652007308841189376UL), None)
  verify_log_float_text(474, "᥊.5", Some(4616752568008179712UL), None)
  verify_log_float_text(475, "1e+᥊", Some(4666723172467343360UL), None)
  verify_log_float_text(476, "᥋.5", Some(4617878467915022336UL), None)
  verify_log_float_text(477, "1e+᥋", Some(4681608360884174848UL), None)
  verify_log_float_text(478, "᥌.5", Some(4619004367821864960UL), None)
  verify_log_float_text(479, "1e+᥌", Some(4696837146684686336UL), None)
}

///|
test "native log base float text group 15" {
  verify_log_float_text(480, "᥍.5", Some(4620130267728707584UL), None)
  verify_log_float_text(481, "1e+᥍", Some(4711630319722168320UL), None)
  verify_log_float_text(482, "᥎.5", Some(4620974692658839552UL), None)
  verify_log_float_text(483, "1e+᥎", Some(4726483295884279808UL), None)
  verify_log_float_text(484, "᥏.5", Some(4621537642612260864UL), None)
  verify_log_float_text(485, "1e+᥏", Some(4741671816366391296UL), None)
  verify_log_float_text(486, "᧐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(487, "1e+᧐", Some(4607182418800017408UL), None)
  verify_log_float_text(488, "᧑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(489, "1e+᧑", Some(4621819117588971520UL), None)
  verify_log_float_text(490, "᧒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(491, "1e+᧒", Some(4636737291354636288UL), None)
  verify_log_float_text(492, "᧓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(493, "1e+᧓", Some(4652007308841189376UL), None)
  verify_log_float_text(494, "᧔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(495, "1e+᧔", Some(4666723172467343360UL), None)
  verify_log_float_text(496, "᧕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(497, "1e+᧕", Some(4681608360884174848UL), None)
  verify_log_float_text(498, "᧖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(499, "1e+᧖", Some(4696837146684686336UL), None)
  verify_log_float_text(500, "᧗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(501, "1e+᧗", Some(4711630319722168320UL), None)
  verify_log_float_text(502, "᧘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(503, "1e+᧘", Some(4726483295884279808UL), None)
  verify_log_float_text(504, "᧙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(505, "1e+᧙", Some(4741671816366391296UL), None)
  verify_log_float_text(506, "᪀.5", Some(4602678819172646912UL), None)
  verify_log_float_text(507, "1e+᪀", Some(4607182418800017408UL), None)
  verify_log_float_text(508, "᪁.5", Some(4609434218613702656UL), None)
  verify_log_float_text(509, "1e+᪁", Some(4621819117588971520UL), None)
  verify_log_float_text(510, "᪂.5", Some(4612811918334230528UL), None)
  verify_log_float_text(511, "1e+᪂", Some(4636737291354636288UL), None)
}

///|
test "native log base float text group 16" {
  verify_log_float_text(512, "᪃.5", Some(4615063718147915776UL), None)
  verify_log_float_text(513, "1e+᪃", Some(4652007308841189376UL), None)
  verify_log_float_text(514, "᪄.5", Some(4616752568008179712UL), None)
  verify_log_float_text(515, "1e+᪄", Some(4666723172467343360UL), None)
  verify_log_float_text(516, "᪅.5", Some(4617878467915022336UL), None)
  verify_log_float_text(517, "1e+᪅", Some(4681608360884174848UL), None)
  verify_log_float_text(518, "᪆.5", Some(4619004367821864960UL), None)
  verify_log_float_text(519, "1e+᪆", Some(4696837146684686336UL), None)
  verify_log_float_text(520, "᪇.5", Some(4620130267728707584UL), None)
  verify_log_float_text(521, "1e+᪇", Some(4711630319722168320UL), None)
  verify_log_float_text(522, "᪈.5", Some(4620974692658839552UL), None)
  verify_log_float_text(523, "1e+᪈", Some(4726483295884279808UL), None)
  verify_log_float_text(524, "᪉.5", Some(4621537642612260864UL), None)
  verify_log_float_text(525, "1e+᪉", Some(4741671816366391296UL), None)
  verify_log_float_text(526, "᪐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(527, "1e+᪐", Some(4607182418800017408UL), None)
  verify_log_float_text(528, "᪑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(529, "1e+᪑", Some(4621819117588971520UL), None)
  verify_log_float_text(530, "᪒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(531, "1e+᪒", Some(4636737291354636288UL), None)
  verify_log_float_text(532, "᪓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(533, "1e+᪓", Some(4652007308841189376UL), None)
  verify_log_float_text(534, "᪔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(535, "1e+᪔", Some(4666723172467343360UL), None)
  verify_log_float_text(536, "᪕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(537, "1e+᪕", Some(4681608360884174848UL), None)
  verify_log_float_text(538, "᪖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(539, "1e+᪖", Some(4696837146684686336UL), None)
  verify_log_float_text(540, "᪗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(541, "1e+᪗", Some(4711630319722168320UL), None)
  verify_log_float_text(542, "᪘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(543, "1e+᪘", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 17" {
  verify_log_float_text(544, "᪙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(545, "1e+᪙", Some(4741671816366391296UL), None)
  verify_log_float_text(546, "᭐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(547, "1e+᭐", Some(4607182418800017408UL), None)
  verify_log_float_text(548, "᭑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(549, "1e+᭑", Some(4621819117588971520UL), None)
  verify_log_float_text(550, "᭒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(551, "1e+᭒", Some(4636737291354636288UL), None)
  verify_log_float_text(552, "᭓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(553, "1e+᭓", Some(4652007308841189376UL), None)
  verify_log_float_text(554, "᭔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(555, "1e+᭔", Some(4666723172467343360UL), None)
  verify_log_float_text(556, "᭕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(557, "1e+᭕", Some(4681608360884174848UL), None)
  verify_log_float_text(558, "᭖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(559, "1e+᭖", Some(4696837146684686336UL), None)
  verify_log_float_text(560, "᭗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(561, "1e+᭗", Some(4711630319722168320UL), None)
  verify_log_float_text(562, "᭘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(563, "1e+᭘", Some(4726483295884279808UL), None)
  verify_log_float_text(564, "᭙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(565, "1e+᭙", Some(4741671816366391296UL), None)
  verify_log_float_text(566, "᮰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(567, "1e+᮰", Some(4607182418800017408UL), None)
  verify_log_float_text(568, "᮱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(569, "1e+᮱", Some(4621819117588971520UL), None)
  verify_log_float_text(570, "᮲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(571, "1e+᮲", Some(4636737291354636288UL), None)
  verify_log_float_text(572, "᮳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(573, "1e+᮳", Some(4652007308841189376UL), None)
  verify_log_float_text(574, "᮴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(575, "1e+᮴", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 18" {
  verify_log_float_text(576, "᮵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(577, "1e+᮵", Some(4681608360884174848UL), None)
  verify_log_float_text(578, "᮶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(579, "1e+᮶", Some(4696837146684686336UL), None)
  verify_log_float_text(580, "᮷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(581, "1e+᮷", Some(4711630319722168320UL), None)
  verify_log_float_text(582, "᮸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(583, "1e+᮸", Some(4726483295884279808UL), None)
  verify_log_float_text(584, "᮹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(585, "1e+᮹", Some(4741671816366391296UL), None)
  verify_log_float_text(586, "᱀.5", Some(4602678819172646912UL), None)
  verify_log_float_text(587, "1e+᱀", Some(4607182418800017408UL), None)
  verify_log_float_text(588, "᱁.5", Some(4609434218613702656UL), None)
  verify_log_float_text(589, "1e+᱁", Some(4621819117588971520UL), None)
  verify_log_float_text(590, "᱂.5", Some(4612811918334230528UL), None)
  verify_log_float_text(591, "1e+᱂", Some(4636737291354636288UL), None)
  verify_log_float_text(592, "᱃.5", Some(4615063718147915776UL), None)
  verify_log_float_text(593, "1e+᱃", Some(4652007308841189376UL), None)
  verify_log_float_text(594, "᱄.5", Some(4616752568008179712UL), None)
  verify_log_float_text(595, "1e+᱄", Some(4666723172467343360UL), None)
  verify_log_float_text(596, "᱅.5", Some(4617878467915022336UL), None)
  verify_log_float_text(597, "1e+᱅", Some(4681608360884174848UL), None)
  verify_log_float_text(598, "᱆.5", Some(4619004367821864960UL), None)
  verify_log_float_text(599, "1e+᱆", Some(4696837146684686336UL), None)
  verify_log_float_text(600, "᱇.5", Some(4620130267728707584UL), None)
  verify_log_float_text(601, "1e+᱇", Some(4711630319722168320UL), None)
  verify_log_float_text(602, "᱈.5", Some(4620974692658839552UL), None)
  verify_log_float_text(603, "1e+᱈", Some(4726483295884279808UL), None)
  verify_log_float_text(604, "᱉.5", Some(4621537642612260864UL), None)
  verify_log_float_text(605, "1e+᱉", Some(4741671816366391296UL), None)
  verify_log_float_text(606, "᱐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(607, "1e+᱐", Some(4607182418800017408UL), None)
}

///|
test "native log base float text group 19" {
  verify_log_float_text(608, "᱑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(609, "1e+᱑", Some(4621819117588971520UL), None)
  verify_log_float_text(610, "᱒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(611, "1e+᱒", Some(4636737291354636288UL), None)
  verify_log_float_text(612, "᱓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(613, "1e+᱓", Some(4652007308841189376UL), None)
  verify_log_float_text(614, "᱔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(615, "1e+᱔", Some(4666723172467343360UL), None)
  verify_log_float_text(616, "᱕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(617, "1e+᱕", Some(4681608360884174848UL), None)
  verify_log_float_text(618, "᱖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(619, "1e+᱖", Some(4696837146684686336UL), None)
  verify_log_float_text(620, "᱗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(621, "1e+᱗", Some(4711630319722168320UL), None)
  verify_log_float_text(622, "᱘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(623, "1e+᱘", Some(4726483295884279808UL), None)
  verify_log_float_text(624, "᱙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(625, "1e+᱙", Some(4741671816366391296UL), None)
  verify_log_float_text(626, "꘠.5", Some(4602678819172646912UL), None)
  verify_log_float_text(627, "1e+꘠", Some(4607182418800017408UL), None)
  verify_log_float_text(628, "꘡.5", Some(4609434218613702656UL), None)
  verify_log_float_text(629, "1e+꘡", Some(4621819117588971520UL), None)
  verify_log_float_text(630, "꘢.5", Some(4612811918334230528UL), None)
  verify_log_float_text(631, "1e+꘢", Some(4636737291354636288UL), None)
  verify_log_float_text(632, "꘣.5", Some(4615063718147915776UL), None)
  verify_log_float_text(633, "1e+꘣", Some(4652007308841189376UL), None)
  verify_log_float_text(634, "꘤.5", Some(4616752568008179712UL), None)
  verify_log_float_text(635, "1e+꘤", Some(4666723172467343360UL), None)
  verify_log_float_text(636, "꘥.5", Some(4617878467915022336UL), None)
  verify_log_float_text(637, "1e+꘥", Some(4681608360884174848UL), None)
  verify_log_float_text(638, "꘦.5", Some(4619004367821864960UL), None)
  verify_log_float_text(639, "1e+꘦", Some(4696837146684686336UL), None)
}

///|
test "native log base float text group 20" {
  verify_log_float_text(640, "꘧.5", Some(4620130267728707584UL), None)
  verify_log_float_text(641, "1e+꘧", Some(4711630319722168320UL), None)
  verify_log_float_text(642, "꘨.5", Some(4620974692658839552UL), None)
  verify_log_float_text(643, "1e+꘨", Some(4726483295884279808UL), None)
  verify_log_float_text(644, "꘩.5", Some(4621537642612260864UL), None)
  verify_log_float_text(645, "1e+꘩", Some(4741671816366391296UL), None)
  verify_log_float_text(646, "꣐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(647, "1e+꣐", Some(4607182418800017408UL), None)
  verify_log_float_text(648, "꣑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(649, "1e+꣑", Some(4621819117588971520UL), None)
  verify_log_float_text(650, "꣒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(651, "1e+꣒", Some(4636737291354636288UL), None)
  verify_log_float_text(652, "꣓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(653, "1e+꣓", Some(4652007308841189376UL), None)
  verify_log_float_text(654, "꣔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(655, "1e+꣔", Some(4666723172467343360UL), None)
  verify_log_float_text(656, "꣕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(657, "1e+꣕", Some(4681608360884174848UL), None)
  verify_log_float_text(658, "꣖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(659, "1e+꣖", Some(4696837146684686336UL), None)
  verify_log_float_text(660, "꣗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(661, "1e+꣗", Some(4711630319722168320UL), None)
  verify_log_float_text(662, "꣘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(663, "1e+꣘", Some(4726483295884279808UL), None)
  verify_log_float_text(664, "꣙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(665, "1e+꣙", Some(4741671816366391296UL), None)
  verify_log_float_text(666, "꤀.5", Some(4602678819172646912UL), None)
  verify_log_float_text(667, "1e+꤀", Some(4607182418800017408UL), None)
  verify_log_float_text(668, "꤁.5", Some(4609434218613702656UL), None)
  verify_log_float_text(669, "1e+꤁", Some(4621819117588971520UL), None)
  verify_log_float_text(670, "꤂.5", Some(4612811918334230528UL), None)
  verify_log_float_text(671, "1e+꤂", Some(4636737291354636288UL), None)
}

///|
test "native log base float text group 21" {
  verify_log_float_text(672, "꤃.5", Some(4615063718147915776UL), None)
  verify_log_float_text(673, "1e+꤃", Some(4652007308841189376UL), None)
  verify_log_float_text(674, "꤄.5", Some(4616752568008179712UL), None)
  verify_log_float_text(675, "1e+꤄", Some(4666723172467343360UL), None)
  verify_log_float_text(676, "꤅.5", Some(4617878467915022336UL), None)
  verify_log_float_text(677, "1e+꤅", Some(4681608360884174848UL), None)
  verify_log_float_text(678, "꤆.5", Some(4619004367821864960UL), None)
  verify_log_float_text(679, "1e+꤆", Some(4696837146684686336UL), None)
  verify_log_float_text(680, "꤇.5", Some(4620130267728707584UL), None)
  verify_log_float_text(681, "1e+꤇", Some(4711630319722168320UL), None)
  verify_log_float_text(682, "꤈.5", Some(4620974692658839552UL), None)
  verify_log_float_text(683, "1e+꤈", Some(4726483295884279808UL), None)
  verify_log_float_text(684, "꤉.5", Some(4621537642612260864UL), None)
  verify_log_float_text(685, "1e+꤉", Some(4741671816366391296UL), None)
  verify_log_float_text(686, "꧐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(687, "1e+꧐", Some(4607182418800017408UL), None)
  verify_log_float_text(688, "꧑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(689, "1e+꧑", Some(4621819117588971520UL), None)
  verify_log_float_text(690, "꧒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(691, "1e+꧒", Some(4636737291354636288UL), None)
  verify_log_float_text(692, "꧓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(693, "1e+꧓", Some(4652007308841189376UL), None)
  verify_log_float_text(694, "꧔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(695, "1e+꧔", Some(4666723172467343360UL), None)
  verify_log_float_text(696, "꧕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(697, "1e+꧕", Some(4681608360884174848UL), None)
  verify_log_float_text(698, "꧖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(699, "1e+꧖", Some(4696837146684686336UL), None)
  verify_log_float_text(700, "꧗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(701, "1e+꧗", Some(4711630319722168320UL), None)
  verify_log_float_text(702, "꧘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(703, "1e+꧘", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 22" {
  verify_log_float_text(704, "꧙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(705, "1e+꧙", Some(4741671816366391296UL), None)
  verify_log_float_text(706, "꧰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(707, "1e+꧰", Some(4607182418800017408UL), None)
  verify_log_float_text(708, "꧱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(709, "1e+꧱", Some(4621819117588971520UL), None)
  verify_log_float_text(710, "꧲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(711, "1e+꧲", Some(4636737291354636288UL), None)
  verify_log_float_text(712, "꧳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(713, "1e+꧳", Some(4652007308841189376UL), None)
  verify_log_float_text(714, "꧴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(715, "1e+꧴", Some(4666723172467343360UL), None)
  verify_log_float_text(716, "꧵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(717, "1e+꧵", Some(4681608360884174848UL), None)
  verify_log_float_text(718, "꧶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(719, "1e+꧶", Some(4696837146684686336UL), None)
  verify_log_float_text(720, "꧷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(721, "1e+꧷", Some(4711630319722168320UL), None)
  verify_log_float_text(722, "꧸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(723, "1e+꧸", Some(4726483295884279808UL), None)
  verify_log_float_text(724, "꧹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(725, "1e+꧹", Some(4741671816366391296UL), None)
  verify_log_float_text(726, "꩐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(727, "1e+꩐", Some(4607182418800017408UL), None)
  verify_log_float_text(728, "꩑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(729, "1e+꩑", Some(4621819117588971520UL), None)
  verify_log_float_text(730, "꩒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(731, "1e+꩒", Some(4636737291354636288UL), None)
  verify_log_float_text(732, "꩓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(733, "1e+꩓", Some(4652007308841189376UL), None)
  verify_log_float_text(734, "꩔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(735, "1e+꩔", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 23" {
  verify_log_float_text(736, "꩕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(737, "1e+꩕", Some(4681608360884174848UL), None)
  verify_log_float_text(738, "꩖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(739, "1e+꩖", Some(4696837146684686336UL), None)
  verify_log_float_text(740, "꩗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(741, "1e+꩗", Some(4711630319722168320UL), None)
  verify_log_float_text(742, "꩘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(743, "1e+꩘", Some(4726483295884279808UL), None)
  verify_log_float_text(744, "꩙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(745, "1e+꩙", Some(4741671816366391296UL), None)
  verify_log_float_text(746, "꯰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(747, "1e+꯰", Some(4607182418800017408UL), None)
  verify_log_float_text(748, "꯱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(749, "1e+꯱", Some(4621819117588971520UL), None)
  verify_log_float_text(750, "꯲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(751, "1e+꯲", Some(4636737291354636288UL), None)
  verify_log_float_text(752, "꯳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(753, "1e+꯳", Some(4652007308841189376UL), None)
  verify_log_float_text(754, "꯴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(755, "1e+꯴", Some(4666723172467343360UL), None)
  verify_log_float_text(756, "꯵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(757, "1e+꯵", Some(4681608360884174848UL), None)
  verify_log_float_text(758, "꯶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(759, "1e+꯶", Some(4696837146684686336UL), None)
  verify_log_float_text(760, "꯷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(761, "1e+꯷", Some(4711630319722168320UL), None)
  verify_log_float_text(762, "꯸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(763, "1e+꯸", Some(4726483295884279808UL), None)
  verify_log_float_text(764, "꯹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(765, "1e+꯹", Some(4741671816366391296UL), None)
  verify_log_float_text(766, "０.5", Some(4602678819172646912UL), None)
  verify_log_float_text(767, "1e+０", Some(4607182418800017408UL), None)
}

///|
test "native log base float text group 24" {
  verify_log_float_text(768, "１.5", Some(4609434218613702656UL), None)
  verify_log_float_text(769, "1e+１", Some(4621819117588971520UL), None)
  verify_log_float_text(770, "２.5", Some(4612811918334230528UL), None)
  verify_log_float_text(771, "1e+２", Some(4636737291354636288UL), None)
  verify_log_float_text(772, "３.5", Some(4615063718147915776UL), None)
  verify_log_float_text(773, "1e+３", Some(4652007308841189376UL), None)
  verify_log_float_text(774, "４.5", Some(4616752568008179712UL), None)
  verify_log_float_text(775, "1e+４", Some(4666723172467343360UL), None)
  verify_log_float_text(776, "５.5", Some(4617878467915022336UL), None)
  verify_log_float_text(777, "1e+５", Some(4681608360884174848UL), None)
  verify_log_float_text(778, "６.5", Some(4619004367821864960UL), None)
  verify_log_float_text(779, "1e+６", Some(4696837146684686336UL), None)
  verify_log_float_text(780, "７.5", Some(4620130267728707584UL), None)
  verify_log_float_text(781, "1e+７", Some(4711630319722168320UL), None)
  verify_log_float_text(782, "８.5", Some(4620974692658839552UL), None)
  verify_log_float_text(783, "1e+８", Some(4726483295884279808UL), None)
  verify_log_float_text(784, "９.5", Some(4621537642612260864UL), None)
  verify_log_float_text(785, "1e+９", Some(4741671816366391296UL), None)
  verify_log_float_text(786, "𐒠.5", Some(4602678819172646912UL), None)
  verify_log_float_text(787, "1e+𐒠", Some(4607182418800017408UL), None)
  verify_log_float_text(788, "𐒡.5", Some(4609434218613702656UL), None)
  verify_log_float_text(789, "1e+𐒡", Some(4621819117588971520UL), None)
  verify_log_float_text(790, "𐒢.5", Some(4612811918334230528UL), None)
  verify_log_float_text(791, "1e+𐒢", Some(4636737291354636288UL), None)
  verify_log_float_text(792, "𐒣.5", Some(4615063718147915776UL), None)
  verify_log_float_text(793, "1e+𐒣", Some(4652007308841189376UL), None)
  verify_log_float_text(794, "𐒤.5", Some(4616752568008179712UL), None)
  verify_log_float_text(795, "1e+𐒤", Some(4666723172467343360UL), None)
  verify_log_float_text(796, "𐒥.5", Some(4617878467915022336UL), None)
  verify_log_float_text(797, "1e+𐒥", Some(4681608360884174848UL), None)
  verify_log_float_text(798, "𐒦.5", Some(4619004367821864960UL), None)
  verify_log_float_text(799, "1e+𐒦", Some(4696837146684686336UL), None)
}

///|
test "native log base float text group 25" {
  verify_log_float_text(800, "𐒧.5", Some(4620130267728707584UL), None)
  verify_log_float_text(801, "1e+𐒧", Some(4711630319722168320UL), None)
  verify_log_float_text(802, "𐒨.5", Some(4620974692658839552UL), None)
  verify_log_float_text(803, "1e+𐒨", Some(4726483295884279808UL), None)
  verify_log_float_text(804, "𐒩.5", Some(4621537642612260864UL), None)
  verify_log_float_text(805, "1e+𐒩", Some(4741671816366391296UL), None)
  verify_log_float_text(806, "𐴰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(807, "1e+𐴰", Some(4607182418800017408UL), None)
  verify_log_float_text(808, "𐴱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(809, "1e+𐴱", Some(4621819117588971520UL), None)
  verify_log_float_text(810, "𐴲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(811, "1e+𐴲", Some(4636737291354636288UL), None)
  verify_log_float_text(812, "𐴳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(813, "1e+𐴳", Some(4652007308841189376UL), None)
  verify_log_float_text(814, "𐴴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(815, "1e+𐴴", Some(4666723172467343360UL), None)
  verify_log_float_text(816, "𐴵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(817, "1e+𐴵", Some(4681608360884174848UL), None)
  verify_log_float_text(818, "𐴶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(819, "1e+𐴶", Some(4696837146684686336UL), None)
  verify_log_float_text(820, "𐴷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(821, "1e+𐴷", Some(4711630319722168320UL), None)
  verify_log_float_text(822, "𐴸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(823, "1e+𐴸", Some(4726483295884279808UL), None)
  verify_log_float_text(824, "𐴹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(825, "1e+𐴹", Some(4741671816366391296UL), None)
  verify_log_float_text(826, "𑁦.5", Some(4602678819172646912UL), None)
  verify_log_float_text(827, "1e+𑁦", Some(4607182418800017408UL), None)
  verify_log_float_text(828, "𑁧.5", Some(4609434218613702656UL), None)
  verify_log_float_text(829, "1e+𑁧", Some(4621819117588971520UL), None)
  verify_log_float_text(830, "𑁨.5", Some(4612811918334230528UL), None)
  verify_log_float_text(831, "1e+𑁨", Some(4636737291354636288UL), None)
}

///|
test "native log base float text group 26" {
  verify_log_float_text(832, "𑁩.5", Some(4615063718147915776UL), None)
  verify_log_float_text(833, "1e+𑁩", Some(4652007308841189376UL), None)
  verify_log_float_text(834, "𑁪.5", Some(4616752568008179712UL), None)
  verify_log_float_text(835, "1e+𑁪", Some(4666723172467343360UL), None)
  verify_log_float_text(836, "𑁫.5", Some(4617878467915022336UL), None)
  verify_log_float_text(837, "1e+𑁫", Some(4681608360884174848UL), None)
  verify_log_float_text(838, "𑁬.5", Some(4619004367821864960UL), None)
  verify_log_float_text(839, "1e+𑁬", Some(4696837146684686336UL), None)
  verify_log_float_text(840, "𑁭.5", Some(4620130267728707584UL), None)
  verify_log_float_text(841, "1e+𑁭", Some(4711630319722168320UL), None)
  verify_log_float_text(842, "𑁮.5", Some(4620974692658839552UL), None)
  verify_log_float_text(843, "1e+𑁮", Some(4726483295884279808UL), None)
  verify_log_float_text(844, "𑁯.5", Some(4621537642612260864UL), None)
  verify_log_float_text(845, "1e+𑁯", Some(4741671816366391296UL), None)
  verify_log_float_text(846, "𑃰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(847, "1e+𑃰", Some(4607182418800017408UL), None)
  verify_log_float_text(848, "𑃱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(849, "1e+𑃱", Some(4621819117588971520UL), None)
  verify_log_float_text(850, "𑃲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(851, "1e+𑃲", Some(4636737291354636288UL), None)
  verify_log_float_text(852, "𑃳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(853, "1e+𑃳", Some(4652007308841189376UL), None)
  verify_log_float_text(854, "𑃴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(855, "1e+𑃴", Some(4666723172467343360UL), None)
  verify_log_float_text(856, "𑃵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(857, "1e+𑃵", Some(4681608360884174848UL), None)
  verify_log_float_text(858, "𑃶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(859, "1e+𑃶", Some(4696837146684686336UL), None)
  verify_log_float_text(860, "𑃷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(861, "1e+𑃷", Some(4711630319722168320UL), None)
  verify_log_float_text(862, "𑃸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(863, "1e+𑃸", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 27" {
  verify_log_float_text(864, "𑃹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(865, "1e+𑃹", Some(4741671816366391296UL), None)
  verify_log_float_text(866, "𑄶.5", Some(4602678819172646912UL), None)
  verify_log_float_text(867, "1e+𑄶", Some(4607182418800017408UL), None)
  verify_log_float_text(868, "𑄷.5", Some(4609434218613702656UL), None)
  verify_log_float_text(869, "1e+𑄷", Some(4621819117588971520UL), None)
  verify_log_float_text(870, "𑄸.5", Some(4612811918334230528UL), None)
  verify_log_float_text(871, "1e+𑄸", Some(4636737291354636288UL), None)
  verify_log_float_text(872, "𑄹.5", Some(4615063718147915776UL), None)
  verify_log_float_text(873, "1e+𑄹", Some(4652007308841189376UL), None)
  verify_log_float_text(874, "𑄺.5", Some(4616752568008179712UL), None)
  verify_log_float_text(875, "1e+𑄺", Some(4666723172467343360UL), None)
  verify_log_float_text(876, "𑄻.5", Some(4617878467915022336UL), None)
  verify_log_float_text(877, "1e+𑄻", Some(4681608360884174848UL), None)
  verify_log_float_text(878, "𑄼.5", Some(4619004367821864960UL), None)
  verify_log_float_text(879, "1e+𑄼", Some(4696837146684686336UL), None)
  verify_log_float_text(880, "𑄽.5", Some(4620130267728707584UL), None)
  verify_log_float_text(881, "1e+𑄽", Some(4711630319722168320UL), None)
  verify_log_float_text(882, "𑄾.5", Some(4620974692658839552UL), None)
  verify_log_float_text(883, "1e+𑄾", Some(4726483295884279808UL), None)
  verify_log_float_text(884, "𑄿.5", Some(4621537642612260864UL), None)
  verify_log_float_text(885, "1e+𑄿", Some(4741671816366391296UL), None)
  verify_log_float_text(886, "𑇐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(887, "1e+𑇐", Some(4607182418800017408UL), None)
  verify_log_float_text(888, "𑇑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(889, "1e+𑇑", Some(4621819117588971520UL), None)
  verify_log_float_text(890, "𑇒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(891, "1e+𑇒", Some(4636737291354636288UL), None)
  verify_log_float_text(892, "𑇓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(893, "1e+𑇓", Some(4652007308841189376UL), None)
  verify_log_float_text(894, "𑇔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(895, "1e+𑇔", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 28" {
  verify_log_float_text(896, "𑇕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(897, "1e+𑇕", Some(4681608360884174848UL), None)
  verify_log_float_text(898, "𑇖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(899, "1e+𑇖", Some(4696837146684686336UL), None)
  verify_log_float_text(900, "𑇗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(901, "1e+𑇗", Some(4711630319722168320UL), None)
  verify_log_float_text(902, "𑇘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(903, "1e+𑇘", Some(4726483295884279808UL), None)
  verify_log_float_text(904, "𑇙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(905, "1e+𑇙", Some(4741671816366391296UL), None)
  verify_log_float_text(906, "𑋰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(907, "1e+𑋰", Some(4607182418800017408UL), None)
  verify_log_float_text(908, "𑋱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(909, "1e+𑋱", Some(4621819117588971520UL), None)
  verify_log_float_text(910, "𑋲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(911, "1e+𑋲", Some(4636737291354636288UL), None)
  verify_log_float_text(912, "𑋳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(913, "1e+𑋳", Some(4652007308841189376UL), None)
  verify_log_float_text(914, "𑋴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(915, "1e+𑋴", Some(4666723172467343360UL), None)
  verify_log_float_text(916, "𑋵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(917, "1e+𑋵", Some(4681608360884174848UL), None)
  verify_log_float_text(918, "𑋶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(919, "1e+𑋶", Some(4696837146684686336UL), None)
  verify_log_float_text(920, "𑋷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(921, "1e+𑋷", Some(4711630319722168320UL), None)
  verify_log_float_text(922, "𑋸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(923, "1e+𑋸", Some(4726483295884279808UL), None)
  verify_log_float_text(924, "𑋹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(925, "1e+𑋹", Some(4741671816366391296UL), None)
  verify_log_float_text(926, "𑑐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(927, "1e+𑑐", Some(4607182418800017408UL), None)
}

///|
test "native log base float text group 29" {
  verify_log_float_text(928, "𑑑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(929, "1e+𑑑", Some(4621819117588971520UL), None)
  verify_log_float_text(930, "𑑒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(931, "1e+𑑒", Some(4636737291354636288UL), None)
  verify_log_float_text(932, "𑑓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(933, "1e+𑑓", Some(4652007308841189376UL), None)
  verify_log_float_text(934, "𑑔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(935, "1e+𑑔", Some(4666723172467343360UL), None)
  verify_log_float_text(936, "𑑕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(937, "1e+𑑕", Some(4681608360884174848UL), None)
  verify_log_float_text(938, "𑑖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(939, "1e+𑑖", Some(4696837146684686336UL), None)
  verify_log_float_text(940, "𑑗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(941, "1e+𑑗", Some(4711630319722168320UL), None)
  verify_log_float_text(942, "𑑘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(943, "1e+𑑘", Some(4726483295884279808UL), None)
  verify_log_float_text(944, "𑑙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(945, "1e+𑑙", Some(4741671816366391296UL), None)
  verify_log_float_text(946, "𑓐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(947, "1e+𑓐", Some(4607182418800017408UL), None)
  verify_log_float_text(948, "𑓑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(949, "1e+𑓑", Some(4621819117588971520UL), None)
  verify_log_float_text(950, "𑓒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(951, "1e+𑓒", Some(4636737291354636288UL), None)
  verify_log_float_text(952, "𑓓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(953, "1e+𑓓", Some(4652007308841189376UL), None)
  verify_log_float_text(954, "𑓔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(955, "1e+𑓔", Some(4666723172467343360UL), None)
  verify_log_float_text(956, "𑓕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(957, "1e+𑓕", Some(4681608360884174848UL), None)
  verify_log_float_text(958, "𑓖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(959, "1e+𑓖", Some(4696837146684686336UL), None)
}

///|
test "native log base float text group 30" {
  verify_log_float_text(960, "𑓗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(961, "1e+𑓗", Some(4711630319722168320UL), None)
  verify_log_float_text(962, "𑓘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(963, "1e+𑓘", Some(4726483295884279808UL), None)
  verify_log_float_text(964, "𑓙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(965, "1e+𑓙", Some(4741671816366391296UL), None)
  verify_log_float_text(966, "𑙐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(967, "1e+𑙐", Some(4607182418800017408UL), None)
  verify_log_float_text(968, "𑙑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(969, "1e+𑙑", Some(4621819117588971520UL), None)
  verify_log_float_text(970, "𑙒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(971, "1e+𑙒", Some(4636737291354636288UL), None)
  verify_log_float_text(972, "𑙓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(973, "1e+𑙓", Some(4652007308841189376UL), None)
  verify_log_float_text(974, "𑙔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(975, "1e+𑙔", Some(4666723172467343360UL), None)
  verify_log_float_text(976, "𑙕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(977, "1e+𑙕", Some(4681608360884174848UL), None)
  verify_log_float_text(978, "𑙖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(979, "1e+𑙖", Some(4696837146684686336UL), None)
  verify_log_float_text(980, "𑙗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(981, "1e+𑙗", Some(4711630319722168320UL), None)
  verify_log_float_text(982, "𑙘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(983, "1e+𑙘", Some(4726483295884279808UL), None)
  verify_log_float_text(984, "𑙙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(985, "1e+𑙙", Some(4741671816366391296UL), None)
  verify_log_float_text(986, "𑛀.5", Some(4602678819172646912UL), None)
  verify_log_float_text(987, "1e+𑛀", Some(4607182418800017408UL), None)
  verify_log_float_text(988, "𑛁.5", Some(4609434218613702656UL), None)
  verify_log_float_text(989, "1e+𑛁", Some(4621819117588971520UL), None)
  verify_log_float_text(990, "𑛂.5", Some(4612811918334230528UL), None)
  verify_log_float_text(991, "1e+𑛂", Some(4636737291354636288UL), None)
}

///|
test "native log base float text group 31" {
  verify_log_float_text(992, "𑛃.5", Some(4615063718147915776UL), None)
  verify_log_float_text(993, "1e+𑛃", Some(4652007308841189376UL), None)
  verify_log_float_text(994, "𑛄.5", Some(4616752568008179712UL), None)
  verify_log_float_text(995, "1e+𑛄", Some(4666723172467343360UL), None)
  verify_log_float_text(996, "𑛅.5", Some(4617878467915022336UL), None)
  verify_log_float_text(997, "1e+𑛅", Some(4681608360884174848UL), None)
  verify_log_float_text(998, "𑛆.5", Some(4619004367821864960UL), None)
  verify_log_float_text(999, "1e+𑛆", Some(4696837146684686336UL), None)
  verify_log_float_text(1000, "𑛇.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1001, "1e+𑛇", Some(4711630319722168320UL), None)
  verify_log_float_text(1002, "𑛈.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1003, "1e+𑛈", Some(4726483295884279808UL), None)
  verify_log_float_text(1004, "𑛉.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1005, "1e+𑛉", Some(4741671816366391296UL), None)
  verify_log_float_text(1006, "𑜰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1007, "1e+𑜰", Some(4607182418800017408UL), None)
  verify_log_float_text(1008, "𑜱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1009, "1e+𑜱", Some(4621819117588971520UL), None)
  verify_log_float_text(1010, "𑜲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1011, "1e+𑜲", Some(4636737291354636288UL), None)
  verify_log_float_text(1012, "𑜳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1013, "1e+𑜳", Some(4652007308841189376UL), None)
  verify_log_float_text(1014, "𑜴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1015, "1e+𑜴", Some(4666723172467343360UL), None)
  verify_log_float_text(1016, "𑜵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1017, "1e+𑜵", Some(4681608360884174848UL), None)
  verify_log_float_text(1018, "𑜶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1019, "1e+𑜶", Some(4696837146684686336UL), None)
  verify_log_float_text(1020, "𑜷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1021, "1e+𑜷", Some(4711630319722168320UL), None)
  verify_log_float_text(1022, "𑜸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1023, "1e+𑜸", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 32" {
  verify_log_float_text(1024, "𑜹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1025, "1e+𑜹", Some(4741671816366391296UL), None)
  verify_log_float_text(1026, "𑣠.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1027, "1e+𑣠", Some(4607182418800017408UL), None)
  verify_log_float_text(1028, "𑣡.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1029, "1e+𑣡", Some(4621819117588971520UL), None)
  verify_log_float_text(1030, "𑣢.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1031, "1e+𑣢", Some(4636737291354636288UL), None)
  verify_log_float_text(1032, "𑣣.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1033, "1e+𑣣", Some(4652007308841189376UL), None)
  verify_log_float_text(1034, "𑣤.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1035, "1e+𑣤", Some(4666723172467343360UL), None)
  verify_log_float_text(1036, "𑣥.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1037, "1e+𑣥", Some(4681608360884174848UL), None)
  verify_log_float_text(1038, "𑣦.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1039, "1e+𑣦", Some(4696837146684686336UL), None)
  verify_log_float_text(1040, "𑣧.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1041, "1e+𑣧", Some(4711630319722168320UL), None)
  verify_log_float_text(1042, "𑣨.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1043, "1e+𑣨", Some(4726483295884279808UL), None)
  verify_log_float_text(1044, "𑣩.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1045, "1e+𑣩", Some(4741671816366391296UL), None)
  verify_log_float_text(1046, "𑥐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1047, "1e+𑥐", Some(4607182418800017408UL), None)
  verify_log_float_text(1048, "𑥑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1049, "1e+𑥑", Some(4621819117588971520UL), None)
  verify_log_float_text(1050, "𑥒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1051, "1e+𑥒", Some(4636737291354636288UL), None)
  verify_log_float_text(1052, "𑥓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1053, "1e+𑥓", Some(4652007308841189376UL), None)
  verify_log_float_text(1054, "𑥔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1055, "1e+𑥔", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 33" {
  verify_log_float_text(1056, "𑥕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1057, "1e+𑥕", Some(4681608360884174848UL), None)
  verify_log_float_text(1058, "𑥖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1059, "1e+𑥖", Some(4696837146684686336UL), None)
  verify_log_float_text(1060, "𑥗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1061, "1e+𑥗", Some(4711630319722168320UL), None)
  verify_log_float_text(1062, "𑥘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1063, "1e+𑥘", Some(4726483295884279808UL), None)
  verify_log_float_text(1064, "𑥙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1065, "1e+𑥙", Some(4741671816366391296UL), None)
  verify_log_float_text(1066, "𑱐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1067, "1e+𑱐", Some(4607182418800017408UL), None)
  verify_log_float_text(1068, "𑱑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1069, "1e+𑱑", Some(4621819117588971520UL), None)
  verify_log_float_text(1070, "𑱒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1071, "1e+𑱒", Some(4636737291354636288UL), None)
  verify_log_float_text(1072, "𑱓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1073, "1e+𑱓", Some(4652007308841189376UL), None)
  verify_log_float_text(1074, "𑱔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1075, "1e+𑱔", Some(4666723172467343360UL), None)
  verify_log_float_text(1076, "𑱕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1077, "1e+𑱕", Some(4681608360884174848UL), None)
  verify_log_float_text(1078, "𑱖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1079, "1e+𑱖", Some(4696837146684686336UL), None)
  verify_log_float_text(1080, "𑱗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1081, "1e+𑱗", Some(4711630319722168320UL), None)
  verify_log_float_text(1082, "𑱘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1083, "1e+𑱘", Some(4726483295884279808UL), None)
  verify_log_float_text(1084, "𑱙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1085, "1e+𑱙", Some(4741671816366391296UL), None)
  verify_log_float_text(1086, "𑵐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1087, "1e+𑵐", Some(4607182418800017408UL), None)
}

///|
test "native log base float text group 34" {
  verify_log_float_text(1088, "𑵑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1089, "1e+𑵑", Some(4621819117588971520UL), None)
  verify_log_float_text(1090, "𑵒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1091, "1e+𑵒", Some(4636737291354636288UL), None)
  verify_log_float_text(1092, "𑵓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1093, "1e+𑵓", Some(4652007308841189376UL), None)
  verify_log_float_text(1094, "𑵔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1095, "1e+𑵔", Some(4666723172467343360UL), None)
  verify_log_float_text(1096, "𑵕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1097, "1e+𑵕", Some(4681608360884174848UL), None)
  verify_log_float_text(1098, "𑵖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1099, "1e+𑵖", Some(4696837146684686336UL), None)
  verify_log_float_text(1100, "𑵗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1101, "1e+𑵗", Some(4711630319722168320UL), None)
  verify_log_float_text(1102, "𑵘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1103, "1e+𑵘", Some(4726483295884279808UL), None)
  verify_log_float_text(1104, "𑵙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1105, "1e+𑵙", Some(4741671816366391296UL), None)
  verify_log_float_text(1106, "𑶠.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1107, "1e+𑶠", Some(4607182418800017408UL), None)
  verify_log_float_text(1108, "𑶡.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1109, "1e+𑶡", Some(4621819117588971520UL), None)
  verify_log_float_text(1110, "𑶢.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1111, "1e+𑶢", Some(4636737291354636288UL), None)
  verify_log_float_text(1112, "𑶣.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1113, "1e+𑶣", Some(4652007308841189376UL), None)
  verify_log_float_text(1114, "𑶤.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1115, "1e+𑶤", Some(4666723172467343360UL), None)
  verify_log_float_text(1116, "𑶥.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1117, "1e+𑶥", Some(4681608360884174848UL), None)
  verify_log_float_text(1118, "𑶦.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1119, "1e+𑶦", Some(4696837146684686336UL), None)
}

///|
test "native log base float text group 35" {
  verify_log_float_text(1120, "𑶧.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1121, "1e+𑶧", Some(4711630319722168320UL), None)
  verify_log_float_text(1122, "𑶨.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1123, "1e+𑶨", Some(4726483295884279808UL), None)
  verify_log_float_text(1124, "𑶩.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1125, "1e+𑶩", Some(4741671816366391296UL), None)
  verify_log_float_text(1126, "𑽐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1127, "1e+𑽐", Some(4607182418800017408UL), None)
  verify_log_float_text(1128, "𑽑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1129, "1e+𑽑", Some(4621819117588971520UL), None)
  verify_log_float_text(1130, "𑽒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1131, "1e+𑽒", Some(4636737291354636288UL), None)
  verify_log_float_text(1132, "𑽓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1133, "1e+𑽓", Some(4652007308841189376UL), None)
  verify_log_float_text(1134, "𑽔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1135, "1e+𑽔", Some(4666723172467343360UL), None)
  verify_log_float_text(1136, "𑽕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1137, "1e+𑽕", Some(4681608360884174848UL), None)
  verify_log_float_text(1138, "𑽖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1139, "1e+𑽖", Some(4696837146684686336UL), None)
  verify_log_float_text(1140, "𑽗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1141, "1e+𑽗", Some(4711630319722168320UL), None)
  verify_log_float_text(1142, "𑽘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1143, "1e+𑽘", Some(4726483295884279808UL), None)
  verify_log_float_text(1144, "𑽙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1145, "1e+𑽙", Some(4741671816366391296UL), None)
  verify_log_float_text(1146, "𖩠.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1147, "1e+𖩠", Some(4607182418800017408UL), None)
  verify_log_float_text(1148, "𖩡.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1149, "1e+𖩡", Some(4621819117588971520UL), None)
  verify_log_float_text(1150, "𖩢.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1151, "1e+𖩢", Some(4636737291354636288UL), None)
}

///|
test "native log base float text group 36" {
  verify_log_float_text(1152, "𖩣.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1153, "1e+𖩣", Some(4652007308841189376UL), None)
  verify_log_float_text(1154, "𖩤.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1155, "1e+𖩤", Some(4666723172467343360UL), None)
  verify_log_float_text(1156, "𖩥.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1157, "1e+𖩥", Some(4681608360884174848UL), None)
  verify_log_float_text(1158, "𖩦.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1159, "1e+𖩦", Some(4696837146684686336UL), None)
  verify_log_float_text(1160, "𖩧.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1161, "1e+𖩧", Some(4711630319722168320UL), None)
  verify_log_float_text(1162, "𖩨.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1163, "1e+𖩨", Some(4726483295884279808UL), None)
  verify_log_float_text(1164, "𖩩.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1165, "1e+𖩩", Some(4741671816366391296UL), None)
  verify_log_float_text(1166, "𖫀.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1167, "1e+𖫀", Some(4607182418800017408UL), None)
  verify_log_float_text(1168, "𖫁.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1169, "1e+𖫁", Some(4621819117588971520UL), None)
  verify_log_float_text(1170, "𖫂.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1171, "1e+𖫂", Some(4636737291354636288UL), None)
  verify_log_float_text(1172, "𖫃.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1173, "1e+𖫃", Some(4652007308841189376UL), None)
  verify_log_float_text(1174, "𖫄.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1175, "1e+𖫄", Some(4666723172467343360UL), None)
  verify_log_float_text(1176, "𖫅.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1177, "1e+𖫅", Some(4681608360884174848UL), None)
  verify_log_float_text(1178, "𖫆.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1179, "1e+𖫆", Some(4696837146684686336UL), None)
  verify_log_float_text(1180, "𖫇.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1181, "1e+𖫇", Some(4711630319722168320UL), None)
  verify_log_float_text(1182, "𖫈.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1183, "1e+𖫈", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 37" {
  verify_log_float_text(1184, "𖫉.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1185, "1e+𖫉", Some(4741671816366391296UL), None)
  verify_log_float_text(1186, "𖭐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1187, "1e+𖭐", Some(4607182418800017408UL), None)
  verify_log_float_text(1188, "𖭑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1189, "1e+𖭑", Some(4621819117588971520UL), None)
  verify_log_float_text(1190, "𖭒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1191, "1e+𖭒", Some(4636737291354636288UL), None)
  verify_log_float_text(1192, "𖭓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1193, "1e+𖭓", Some(4652007308841189376UL), None)
  verify_log_float_text(1194, "𖭔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1195, "1e+𖭔", Some(4666723172467343360UL), None)
  verify_log_float_text(1196, "𖭕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1197, "1e+𖭕", Some(4681608360884174848UL), None)
  verify_log_float_text(1198, "𖭖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1199, "1e+𖭖", Some(4696837146684686336UL), None)
  verify_log_float_text(1200, "𖭗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1201, "1e+𖭗", Some(4711630319722168320UL), None)
  verify_log_float_text(1202, "𖭘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1203, "1e+𖭘", Some(4726483295884279808UL), None)
  verify_log_float_text(1204, "𖭙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1205, "1e+𖭙", Some(4741671816366391296UL), None)
  verify_log_float_text(1206, "𝟎.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1207, "1e+𝟎", Some(4607182418800017408UL), None)
  verify_log_float_text(1208, "𝟏.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1209, "1e+𝟏", Some(4621819117588971520UL), None)
  verify_log_float_text(1210, "𝟐.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1211, "1e+𝟐", Some(4636737291354636288UL), None)
  verify_log_float_text(1212, "𝟑.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1213, "1e+𝟑", Some(4652007308841189376UL), None)
  verify_log_float_text(1214, "𝟒.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1215, "1e+𝟒", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 38" {
  verify_log_float_text(1216, "𝟓.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1217, "1e+𝟓", Some(4681608360884174848UL), None)
  verify_log_float_text(1218, "𝟔.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1219, "1e+𝟔", Some(4696837146684686336UL), None)
  verify_log_float_text(1220, "𝟕.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1221, "1e+𝟕", Some(4711630319722168320UL), None)
  verify_log_float_text(1222, "𝟖.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1223, "1e+𝟖", Some(4726483295884279808UL), None)
  verify_log_float_text(1224, "𝟗.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1225, "1e+𝟗", Some(4741671816366391296UL), None)
  verify_log_float_text(1226, "𝟘.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1227, "1e+𝟘", Some(4607182418800017408UL), None)
  verify_log_float_text(1228, "𝟙.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1229, "1e+𝟙", Some(4621819117588971520UL), None)
  verify_log_float_text(1230, "𝟚.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1231, "1e+𝟚", Some(4636737291354636288UL), None)
  verify_log_float_text(1232, "𝟛.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1233, "1e+𝟛", Some(4652007308841189376UL), None)
  verify_log_float_text(1234, "𝟜.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1235, "1e+𝟜", Some(4666723172467343360UL), None)
  verify_log_float_text(1236, "𝟝.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1237, "1e+𝟝", Some(4681608360884174848UL), None)
  verify_log_float_text(1238, "𝟞.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1239, "1e+𝟞", Some(4696837146684686336UL), None)
  verify_log_float_text(1240, "𝟟.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1241, "1e+𝟟", Some(4711630319722168320UL), None)
  verify_log_float_text(1242, "𝟠.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1243, "1e+𝟠", Some(4726483295884279808UL), None)
  verify_log_float_text(1244, "𝟡.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1245, "1e+𝟡", Some(4741671816366391296UL), None)
  verify_log_float_text(1246, "𝟢.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1247, "1e+𝟢", Some(4607182418800017408UL), None)
}

///|
test "native log base float text group 39" {
  verify_log_float_text(1248, "𝟣.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1249, "1e+𝟣", Some(4621819117588971520UL), None)
  verify_log_float_text(1250, "𝟤.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1251, "1e+𝟤", Some(4636737291354636288UL), None)
  verify_log_float_text(1252, "𝟥.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1253, "1e+𝟥", Some(4652007308841189376UL), None)
  verify_log_float_text(1254, "𝟦.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1255, "1e+𝟦", Some(4666723172467343360UL), None)
  verify_log_float_text(1256, "𝟧.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1257, "1e+𝟧", Some(4681608360884174848UL), None)
  verify_log_float_text(1258, "𝟨.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1259, "1e+𝟨", Some(4696837146684686336UL), None)
  verify_log_float_text(1260, "𝟩.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1261, "1e+𝟩", Some(4711630319722168320UL), None)
  verify_log_float_text(1262, "𝟪.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1263, "1e+𝟪", Some(4726483295884279808UL), None)
  verify_log_float_text(1264, "𝟫.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1265, "1e+𝟫", Some(4741671816366391296UL), None)
  verify_log_float_text(1266, "𝟬.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1267, "1e+𝟬", Some(4607182418800017408UL), None)
  verify_log_float_text(1268, "𝟭.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1269, "1e+𝟭", Some(4621819117588971520UL), None)
  verify_log_float_text(1270, "𝟮.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1271, "1e+𝟮", Some(4636737291354636288UL), None)
  verify_log_float_text(1272, "𝟯.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1273, "1e+𝟯", Some(4652007308841189376UL), None)
  verify_log_float_text(1274, "𝟰.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1275, "1e+𝟰", Some(4666723172467343360UL), None)
  verify_log_float_text(1276, "𝟱.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1277, "1e+𝟱", Some(4681608360884174848UL), None)
  verify_log_float_text(1278, "𝟲.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1279, "1e+𝟲", Some(4696837146684686336UL), None)
}

///|
test "native log base float text group 40" {
  verify_log_float_text(1280, "𝟳.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1281, "1e+𝟳", Some(4711630319722168320UL), None)
  verify_log_float_text(1282, "𝟴.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1283, "1e+𝟴", Some(4726483295884279808UL), None)
  verify_log_float_text(1284, "𝟵.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1285, "1e+𝟵", Some(4741671816366391296UL), None)
  verify_log_float_text(1286, "𝟶.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1287, "1e+𝟶", Some(4607182418800017408UL), None)
  verify_log_float_text(1288, "𝟷.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1289, "1e+𝟷", Some(4621819117588971520UL), None)
  verify_log_float_text(1290, "𝟸.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1291, "1e+𝟸", Some(4636737291354636288UL), None)
  verify_log_float_text(1292, "𝟹.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1293, "1e+𝟹", Some(4652007308841189376UL), None)
  verify_log_float_text(1294, "𝟺.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1295, "1e+𝟺", Some(4666723172467343360UL), None)
  verify_log_float_text(1296, "𝟻.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1297, "1e+𝟻", Some(4681608360884174848UL), None)
  verify_log_float_text(1298, "𝟼.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1299, "1e+𝟼", Some(4696837146684686336UL), None)
  verify_log_float_text(1300, "𝟽.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1301, "1e+𝟽", Some(4711630319722168320UL), None)
  verify_log_float_text(1302, "𝟾.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1303, "1e+𝟾", Some(4726483295884279808UL), None)
  verify_log_float_text(1304, "𝟿.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1305, "1e+𝟿", Some(4741671816366391296UL), None)
  verify_log_float_text(1306, "𞅀.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1307, "1e+𞅀", Some(4607182418800017408UL), None)
  verify_log_float_text(1308, "𞅁.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1309, "1e+𞅁", Some(4621819117588971520UL), None)
  verify_log_float_text(1310, "𞅂.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1311, "1e+𞅂", Some(4636737291354636288UL), None)
}

///|
test "native log base float text group 41" {
  verify_log_float_text(1312, "𞅃.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1313, "1e+𞅃", Some(4652007308841189376UL), None)
  verify_log_float_text(1314, "𞅄.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1315, "1e+𞅄", Some(4666723172467343360UL), None)
  verify_log_float_text(1316, "𞅅.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1317, "1e+𞅅", Some(4681608360884174848UL), None)
  verify_log_float_text(1318, "𞅆.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1319, "1e+𞅆", Some(4696837146684686336UL), None)
  verify_log_float_text(1320, "𞅇.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1321, "1e+𞅇", Some(4711630319722168320UL), None)
  verify_log_float_text(1322, "𞅈.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1323, "1e+𞅈", Some(4726483295884279808UL), None)
  verify_log_float_text(1324, "𞅉.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1325, "1e+𞅉", Some(4741671816366391296UL), None)
  verify_log_float_text(1326, "𞋰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1327, "1e+𞋰", Some(4607182418800017408UL), None)
  verify_log_float_text(1328, "𞋱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1329, "1e+𞋱", Some(4621819117588971520UL), None)
  verify_log_float_text(1330, "𞋲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1331, "1e+𞋲", Some(4636737291354636288UL), None)
  verify_log_float_text(1332, "𞋳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1333, "1e+𞋳", Some(4652007308841189376UL), None)
  verify_log_float_text(1334, "𞋴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1335, "1e+𞋴", Some(4666723172467343360UL), None)
  verify_log_float_text(1336, "𞋵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1337, "1e+𞋵", Some(4681608360884174848UL), None)
  verify_log_float_text(1338, "𞋶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1339, "1e+𞋶", Some(4696837146684686336UL), None)
  verify_log_float_text(1340, "𞋷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1341, "1e+𞋷", Some(4711630319722168320UL), None)
  verify_log_float_text(1342, "𞋸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1343, "1e+𞋸", Some(4726483295884279808UL), None)
}

///|
test "native log base float text group 42" {
  verify_log_float_text(1344, "𞋹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1345, "1e+𞋹", Some(4741671816366391296UL), None)
  verify_log_float_text(1346, "𞓰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1347, "1e+𞓰", Some(4607182418800017408UL), None)
  verify_log_float_text(1348, "𞓱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1349, "1e+𞓱", Some(4621819117588971520UL), None)
  verify_log_float_text(1350, "𞓲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1351, "1e+𞓲", Some(4636737291354636288UL), None)
  verify_log_float_text(1352, "𞓳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1353, "1e+𞓳", Some(4652007308841189376UL), None)
  verify_log_float_text(1354, "𞓴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1355, "1e+𞓴", Some(4666723172467343360UL), None)
  verify_log_float_text(1356, "𞓵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1357, "1e+𞓵", Some(4681608360884174848UL), None)
  verify_log_float_text(1358, "𞓶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1359, "1e+𞓶", Some(4696837146684686336UL), None)
  verify_log_float_text(1360, "𞓷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1361, "1e+𞓷", Some(4711630319722168320UL), None)
  verify_log_float_text(1362, "𞓸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1363, "1e+𞓸", Some(4726483295884279808UL), None)
  verify_log_float_text(1364, "𞓹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1365, "1e+𞓹", Some(4741671816366391296UL), None)
  verify_log_float_text(1366, "𞥐.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1367, "1e+𞥐", Some(4607182418800017408UL), None)
  verify_log_float_text(1368, "𞥑.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1369, "1e+𞥑", Some(4621819117588971520UL), None)
  verify_log_float_text(1370, "𞥒.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1371, "1e+𞥒", Some(4636737291354636288UL), None)
  verify_log_float_text(1372, "𞥓.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1373, "1e+𞥓", Some(4652007308841189376UL), None)
  verify_log_float_text(1374, "𞥔.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1375, "1e+𞥔", Some(4666723172467343360UL), None)
}

///|
test "native log base float text group 43" {
  verify_log_float_text(1376, "𞥕.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1377, "1e+𞥕", Some(4681608360884174848UL), None)
  verify_log_float_text(1378, "𞥖.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1379, "1e+𞥖", Some(4696837146684686336UL), None)
  verify_log_float_text(1380, "𞥗.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1381, "1e+𞥗", Some(4711630319722168320UL), None)
  verify_log_float_text(1382, "𞥘.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1383, "1e+𞥘", Some(4726483295884279808UL), None)
  verify_log_float_text(1384, "𞥙.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1385, "1e+𞥙", Some(4741671816366391296UL), None)
  verify_log_float_text(1386, "🯰.5", Some(4602678819172646912UL), None)
  verify_log_float_text(1387, "1e+🯰", Some(4607182418800017408UL), None)
  verify_log_float_text(1388, "🯱.5", Some(4609434218613702656UL), None)
  verify_log_float_text(1389, "1e+🯱", Some(4621819117588971520UL), None)
  verify_log_float_text(1390, "🯲.5", Some(4612811918334230528UL), None)
  verify_log_float_text(1391, "1e+🯲", Some(4636737291354636288UL), None)
  verify_log_float_text(1392, "🯳.5", Some(4615063718147915776UL), None)
  verify_log_float_text(1393, "1e+🯳", Some(4652007308841189376UL), None)
  verify_log_float_text(1394, "🯴.5", Some(4616752568008179712UL), None)
  verify_log_float_text(1395, "1e+🯴", Some(4666723172467343360UL), None)
  verify_log_float_text(1396, "🯵.5", Some(4617878467915022336UL), None)
  verify_log_float_text(1397, "1e+🯵", Some(4681608360884174848UL), None)
  verify_log_float_text(1398, "🯶.5", Some(4619004367821864960UL), None)
  verify_log_float_text(1399, "1e+🯶", Some(4696837146684686336UL), None)
  verify_log_float_text(1400, "🯷.5", Some(4620130267728707584UL), None)
  verify_log_float_text(1401, "1e+🯷", Some(4711630319722168320UL), None)
  verify_log_float_text(1402, "🯸.5", Some(4620974692658839552UL), None)
  verify_log_float_text(1403, "1e+🯸", Some(4726483295884279808UL), None)
  verify_log_float_text(1404, "🯹.5", Some(4621537642612260864UL), None)
  verify_log_float_text(1405, "1e+🯹", Some(4741671816366391296UL), None)
  verify_log_float_text(
    1406,
    "\u{0}-1.25\u{0}",
    None,
    Some("ValueError: could not convert string to float: '\\x00-1.25\\x00'"),
  )
  verify_log_float_text(
    1407,
    "1\u{0}2",
    None,
    Some("ValueError: could not convert string to float: '1\\x002'"),
  )
}

///|
test "native log base float text group 44" {
  verify_log_float_text(
    1408,
    "\u{9}-1.25\u{9}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1409,
    "1\u{9}2",
    None,
    Some("ValueError: could not convert string to float: '1\\t2'"),
  )
  verify_log_float_text(
    1410,
    "\u{a}-1.25\u{a}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1411,
    "1\u{a}2",
    None,
    Some("ValueError: could not convert string to float: '1\\n2'"),
  )
  verify_log_float_text(
    1412,
    "\u{b}-1.25\u{b}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1413,
    "1\u{b}2",
    None,
    Some("ValueError: could not convert string to float: '1\\x0b2'"),
  )
  verify_log_float_text(
    1414,
    "\u{c}-1.25\u{c}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1415,
    "1\u{c}2",
    None,
    Some("ValueError: could not convert string to float: '1\\x0c2'"),
  )
  verify_log_float_text(
    1416,
    "\u{d}-1.25\u{d}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1417,
    "1\u{d}2",
    None,
    Some("ValueError: could not convert string to float: '1\\r2'"),
  )
  verify_log_float_text(
    1418,
    "\u{1c}-1.25\u{1c}",
    None,
    Some("ValueError: could not convert string to float: '\\x1c-1.25\\x1c'"),
  )
  verify_log_float_text(
    1419,
    "1\u{1c}2",
    None,
    Some("ValueError: could not convert string to float: '1\\x1c2'"),
  )
  verify_log_float_text(
    1420,
    "\u{1d}-1.25\u{1d}",
    None,
    Some("ValueError: could not convert string to float: '\\x1d-1.25\\x1d'"),
  )
  verify_log_float_text(
    1421,
    "1\u{1d}2",
    None,
    Some("ValueError: could not convert string to float: '1\\x1d2'"),
  )
  verify_log_float_text(
    1422,
    "\u{1e}-1.25\u{1e}",
    None,
    Some("ValueError: could not convert string to float: '\\x1e-1.25\\x1e'"),
  )
  verify_log_float_text(
    1423,
    "1\u{1e}2",
    None,
    Some("ValueError: could not convert string to float: '1\\x1e2'"),
  )
  verify_log_float_text(
    1424,
    "\u{1f}-1.25\u{1f}",
    None,
    Some("ValueError: could not convert string to float: '\\x1f-1.25\\x1f'"),
  )
  verify_log_float_text(
    1425,
    "1\u{1f}2",
    None,
    Some("ValueError: could not convert string to float: '1\\x1f2'"),
  )
  verify_log_float_text(1426, " -1.25 ", Some(13831680355561635840UL), None)
  verify_log_float_text(
    1427,
    "1 2",
    None,
    Some("ValueError: could not convert string to float: '1 2'"),
  )
  verify_log_float_text(
    1428,
    "\u{85}-1.25\u{85}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1429,
    "1\u{85}2",
    None,
    Some("ValueError: could not convert string to float: '1\\x852'"),
  )
  verify_log_float_text(
    1430,
    "\u{a0}-1.25\u{a0}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1431,
    "1\u{a0}2",
    None,
    Some("ValueError: could not convert string to float: '1\\xa02'"),
  )
  verify_log_float_text(
    1432,
    "\u{1680}-1.25\u{1680}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1433,
    "1\u{1680}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u16802'"),
  )
  verify_log_float_text(
    1434,
    "\u{2000}-1.25\u{2000}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1435,
    "1\u{2000}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20002'"),
  )
  verify_log_float_text(
    1436,
    "\u{2001}-1.25\u{2001}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1437,
    "1\u{2001}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20012'"),
  )
  verify_log_float_text(
    1438,
    "\u{2002}-1.25\u{2002}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1439,
    "1\u{2002}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20022'"),
  )
}

///|
test "native log base float text group 45" {
  verify_log_float_text(
    1440,
    "\u{2003}-1.25\u{2003}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1441,
    "1\u{2003}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20032'"),
  )
  verify_log_float_text(
    1442,
    "\u{2004}-1.25\u{2004}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1443,
    "1\u{2004}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20042'"),
  )
  verify_log_float_text(
    1444,
    "\u{2005}-1.25\u{2005}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1445,
    "1\u{2005}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20052'"),
  )
  verify_log_float_text(
    1446,
    "\u{2006}-1.25\u{2006}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1447,
    "1\u{2006}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20062'"),
  )
  verify_log_float_text(
    1448,
    "\u{2007}-1.25\u{2007}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1449,
    "1\u{2007}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20072'"),
  )
  verify_log_float_text(
    1450,
    "\u{2008}-1.25\u{2008}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1451,
    "1\u{2008}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20082'"),
  )
  verify_log_float_text(
    1452,
    "\u{2009}-1.25\u{2009}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1453,
    "1\u{2009}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20092'"),
  )
  verify_log_float_text(
    1454,
    "\u{200a}-1.25\u{200a}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1455,
    "1\u{200a}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u200a2'"),
  )
  verify_log_float_text(
    1456,
    "\u{200b}-1.25\u{200b}",
    None,
    Some("ValueError: could not convert string to float: '\\u200b-1.25\\u200b'"),
  )
  verify_log_float_text(
    1457,
    "1\u{200b}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u200b2'"),
  )
  verify_log_float_text(
    1458,
    "\u{2028}-1.25\u{2028}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1459,
    "1\u{2028}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20282'"),
  )
  verify_log_float_text(
    1460,
    "\u{2029}-1.25\u{2029}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1461,
    "1\u{2029}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20292'"),
  )
  verify_log_float_text(
    1462,
    "\u{202f}-1.25\u{202f}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1463,
    "1\u{202f}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u202f2'"),
  )
  verify_log_float_text(
    1464,
    "\u{205f}-1.25\u{205f}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1465,
    "1\u{205f}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u205f2'"),
  )
  verify_log_float_text(
    1466,
    "\u{2060}-1.25\u{2060}",
    None,
    Some("ValueError: could not convert string to float: '\\u2060-1.25\\u2060'"),
  )
  verify_log_float_text(
    1467,
    "1\u{2060}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u20602'"),
  )
  verify_log_float_text(
    1468,
    "\u{3000}-1.25\u{3000}",
    Some(13831680355561635840UL),
    None,
  )
  verify_log_float_text(
    1469,
    "1\u{3000}2",
    None,
    Some("ValueError: could not convert string to float: '1\\u30002'"),
  )
  verify_log_float_text(
    1470,
    "\u{feff}-1.25\u{feff}",
    None,
    Some("ValueError: could not convert string to float: '\\ufeff-1.25\\ufeff'"),
  )
  verify_log_float_text(
    1471,
    "1\u{feff}2",
    None,
    Some("ValueError: could not convert string to float: '1\\ufeff2'"),
  )
}

///|
test "native log base float text group 46" {
  verify_log_float_text(1472, "0e-100000", Some(0UL), None)
  verify_log_float_text(1473, "-0e-100000", Some(9223372036854775808UL), None)
  verify_log_float_text(1474, "1e-100000", Some(0UL), None)
  verify_log_float_text(1475, "-1e-100000", Some(9223372036854775808UL), None)
  verify_log_float_text(1476, "1.7976931348623157e-100000", Some(0UL), None)
  verify_log_float_text(1477, "4.9406564584124654e-100000", Some(0UL), None)
  verify_log_float_text(1478, "0e-5000", Some(0UL), None)
  verify_log_float_text(1479, "-0e-5000", Some(9223372036854775808UL), None)
  verify_log_float_text(1480, "1e-5000", Some(0UL), None)
  verify_log_float_text(1481, "-1e-5000", Some(9223372036854775808UL), None)
  verify_log_float_text(1482, "1.7976931348623157e-5000", Some(0UL), None)
  verify_log_float_text(1483, "4.9406564584124654e-5000", Some(0UL), None)
  verify_log_float_text(1484, "0e-1075", Some(0UL), None)
  verify_log_float_text(1485, "-0e-1075", Some(9223372036854775808UL), None)
  verify_log_float_text(1486, "1e-1075", Some(0UL), None)
  verify_log_float_text(1487, "-1e-1075", Some(9223372036854775808UL), None)
  verify_log_float_text(1488, "1.7976931348623157e-1075", Some(0UL), None)
  verify_log_float_text(1489, "4.9406564584124654e-1075", Some(0UL), None)
  verify_log_float_text(1490, "0e-400", Some(0UL), None)
  verify_log_float_text(1491, "-0e-400", Some(9223372036854775808UL), None)
  verify_log_float_text(1492, "1e-400", Some(0UL), None)
  verify_log_float_text(1493, "-1e-400", Some(9223372036854775808UL), None)
  verify_log_float_text(1494, "1.7976931348623157e-400", Some(0UL), None)
  verify_log_float_text(1495, "4.9406564584124654e-400", Some(0UL), None)
  verify_log_float_text(1496, "0e-325", Some(0UL), None)
  verify_log_float_text(1497, "-0e-325", Some(9223372036854775808UL), None)
  verify_log_float_text(1498, "1e-325", Some(0UL), None)
  verify_log_float_text(1499, "-1e-325", Some(9223372036854775808UL), None)
  verify_log_float_text(1500, "1.7976931348623157e-325", Some(0UL), None)
  verify_log_float_text(1501, "4.9406564584124654e-325", Some(0UL), None)
  verify_log_float_text(1502, "0e-324", Some(0UL), None)
  verify_log_float_text(1503, "-0e-324", Some(9223372036854775808UL), None)
}

///|
test "native log base float text group 47" {
  verify_log_float_text(1504, "1e-324", Some(0UL), None)
  verify_log_float_text(1505, "-1e-324", Some(9223372036854775808UL), None)
  verify_log_float_text(1506, "1.7976931348623157e-324", Some(0UL), None)
  verify_log_float_text(1507, "4.9406564584124654e-324", Some(1UL), None)
  verify_log_float_text(1508, "0e-323", Some(0UL), None)
  verify_log_float_text(1509, "-0e-323", Some(9223372036854775808UL), None)
  verify_log_float_text(1510, "1e-323", Some(2UL), None)
  verify_log_float_text(1511, "-1e-323", Some(9223372036854775810UL), None)
  verify_log_float_text(1512, "1.7976931348623157e-323", Some(4UL), None)
  verify_log_float_text(1513, "4.9406564584124654e-323", Some(10UL), None)
  verify_log_float_text(1514, "0e-309", Some(0UL), None)
  verify_log_float_text(1515, "-0e-309", Some(9223372036854775808UL), None)
  verify_log_float_text(1516, "1e-309", Some(202402253307311UL), None)
  verify_log_float_text(1517, "-1e-309", Some(9223574439108083119UL), None)
  verify_log_float_text(
    1518,
    "1.7976931348623157e-309",
    Some(363857141251216UL),
    None,
  )
  verify_log_float_text(
    1519,
    "4.9406564584124654e-309",
    Some(1000000000000000UL),
    None,
  )
  verify_log_float_text(1520, "0e-308", Some(0UL), None)
  verify_log_float_text(1521, "-0e-308", Some(9223372036854775808UL), None)
  verify_log_float_text(1522, "1e-308", Some(2024022533073106UL), None)
  verify_log_float_text(1523, "-1e-308", Some(9225396059387848914UL), None)
  verify_log_float_text(
    1524,
    "1.7976931348623157e-308",
    Some(3638571412512157UL),
    None,
  )
  verify_log_float_text(
    1525,
    "4.9406564584124654e-308",
    Some(9503599627370496UL),
    None,
  )
  verify_log_float_text(1526, "0e-1", Some(0UL), None)
  verify_log_float_text(1527, "-0e-1", Some(9223372036854775808UL), None)
  verify_log_float_text(1528, "1e-1", Some(4591870180066957722UL), None)
  verify_log_float_text(1529, "-1e-1", Some(13815242216921733530UL), None)
  verify_log_float_text(
    1530,
    "1.7976931348623157e-1",
    Some(4595644892396369363UL),
    None,
  )
  verify_log_float_text(
    1531,
    "4.9406564584124654e-1",
    Some(4602571915351934725UL),
    None,
  )
  verify_log_float_text(1532, "0e0", Some(0UL), None)
  verify_log_float_text(1533, "-0e0", Some(9223372036854775808UL), None)
  verify_log_float_text(1534, "1e0", Some(4607182418800017408UL), None)
  verify_log_float_text(1535, "-1e0", Some(13830554455654793216UL), None)
}

///|
test "native log base float text group 48" {
  verify_log_float_text(
    1536,
    "1.7976931348623157e0",
    Some(4610774909304939336UL),
    None,
  )
  verify_log_float_text(
    1537,
    "4.9406564584124654e0",
    Some(4617248703073655907UL),
    None,
  )
  verify_log_float_text(1538, "0e1", Some(0UL), None)
  verify_log_float_text(1539, "-0e1", Some(9223372036854775808UL), None)
  verify_log_float_text(1540, "1e1", Some(4621819117588971520UL), None)
  verify_log_float_text(1541, "-1e1", Some(13845191154443747328UL), None)
  verify_log_float_text(
    1542,
    "1.7976931348623157e1",
    Some(4625753274014811661UL),
    None,
  )
  verify_log_float_text(
    1543,
    "4.9406564584124654e1",
    Some(4632150173117334396UL),
    None,
  )
  verify_log_float_text(1544, "0e307", Some(0UL), None)
  verify_log_float_text(1545, "-0e307", Some(9223372036854775808UL), None)
  verify_log_float_text(1546, "1e307", Some(9199863512903218227UL), None)
  verify_log_float_text(1547, "-1e307", Some(18423235549757994035UL), None)
  verify_log_float_text(
    1548,
    "1.7976931348623157e307",
    Some(9203556198494345625UL),
    None,
  )
  verify_log_float_text(
    1549,
    "4.9406564584124654e307",
    Some(9210308592021105949UL),
    None,
  )
  verify_log_float_text(1550, "0e308", Some(0UL), None)
  verify_log_float_text(1551, "-0e308", Some(9223372036854775808UL), None)
  verify_log_float_text(1552, "1e308", Some(9214871658872686752UL), None)
  verify_log_float_text(1553, "-1e308", Some(18438243695727462560UL), None)
  verify_log_float_text(
    1554,
    "1.7976931348623157e308",
    Some(9218868437227405311UL),
    None,
  )
  verify_log_float_text(
    1555,
    "4.9406564584124654e308",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1556, "0e309", Some(0UL), None)
  verify_log_float_text(1557, "-0e309", Some(9223372036854775808UL), None)
  verify_log_float_text(1558, "1e309", Some(9218868437227405312UL), None)
  verify_log_float_text(1559, "-1e309", Some(18442240474082181120UL), None)
  verify_log_float_text(
    1560,
    "1.7976931348623157e309",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1561,
    "4.9406564584124654e309",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1562, "0e400", Some(0UL), None)
  verify_log_float_text(1563, "-0e400", Some(9223372036854775808UL), None)
  verify_log_float_text(1564, "1e400", Some(9218868437227405312UL), None)
  verify_log_float_text(1565, "-1e400", Some(18442240474082181120UL), None)
  verify_log_float_text(
    1566,
    "1.7976931348623157e400",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1567,
    "4.9406564584124654e400",
    Some(9218868437227405312UL),
    None,
  )
}

///|
test "native log base float text group 49" {
  verify_log_float_text(1568, "0e5000", Some(0UL), None)
  verify_log_float_text(1569, "-0e5000", Some(9223372036854775808UL), None)
  verify_log_float_text(1570, "1e5000", Some(9218868437227405312UL), None)
  verify_log_float_text(1571, "-1e5000", Some(18442240474082181120UL), None)
  verify_log_float_text(
    1572,
    "1.7976931348623157e5000",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1573,
    "4.9406564584124654e5000",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1574, "0e100000", Some(0UL), None)
  verify_log_float_text(1575, "-0e100000", Some(9223372036854775808UL), None)
  verify_log_float_text(1576, "1e100000", Some(9218868437227405312UL), None)
  verify_log_float_text(1577, "-1e100000", Some(18442240474082181120UL), None)
  verify_log_float_text(
    1578,
    "1.7976931348623157e100000",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1579,
    "4.9406564584124654e100000",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1580,
    "+98130638401858538968264853734170.6623166255257540400355772158361517293294e-221",
    Some(1779340933982501021UL),
    None,
  )
  verify_log_float_text(
    1581,
    "11154672390484761412.3540950002361755884409e-24",
    Some(4532702181885375563UL),
    None,
  )
  verify_log_float_text(
    1582,
    "+22385695030782717560137835264688620623998703733438288819913757595799040.e-162",
    Some(3235652652577743358UL),
    None,
  )
  verify_log_float_text(
    1583,
    "+362327617446684292.161191669089217152938496537142908E-47",
    Some(4166497368250382583UL),
    None,
  )
  verify_log_float_text(
    1584,
    "-39287817394467499890044701074653346263825996818737.6588269371684307032e-197",
    Some(11624943118732150527UL),
    None,
  )
  verify_log_float_text(
    1585,
    "-147198082522151533628196526129.95253683347294362711716069928314e-216",
    Some(11035084337268972947UL),
    None,
  )
  verify_log_float_text(
    1586,
    "97.6408168800587449e361",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1587,
    "+295619038857.339124920717736719501949237480303493171590949001155236E298",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1588, "+4968.9e248", Some(8372571747809601782UL), None)
  verify_log_float_text(1589, "+56.E276", Some(8762111314236910865UL), None)
  verify_log_float_text(
    1590,
    "710479.83085484811394088648e-77",
    Some(3542392470063531577UL),
    None,
  )
  verify_log_float_text(
    1591,
    "-0925455961894701729635970981888204.406298129354057868360225e225",
    Some(17689806533040656050UL),
    None,
  )
  verify_log_float_text(
    1592,
    "+523211423890839832955081939256511115724270485626104654549.830113358253100e223",
    Some(8791715307424990535UL),
    None,
  )
  verify_log_float_text(
    1593,
    "-62761565211996638251483344894785544296365536247240257684.0874555114684993334E290",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1594,
    "-311157513.37659393727001E328",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(1595, ".8e-384", Some(0UL), None)
  verify_log_float_text(
    1596,
    "-360535172569867075960181497.30308880908337292738373395901775703e-141",
    Some(12118176557572456452UL),
    None,
  )
  verify_log_float_text(
    1597,
    "-543655451045464401218690425664679690146530075078719404131606602556926983.42846437e-301",
    Some(10400247307733573573UL),
    None,
  )
  verify_log_float_text(
    1598,
    "-297300401686368897929.342483e281",
    Some(18340401918876873170UL),
    None,
  )
  verify_log_float_text(
    1599,
    "+1743493174572015432480714389419.7376290956521263602043993E383",
    Some(9218868437227405312UL),
    None,
  )
}

///|
test "native log base float text group 50" {
  verify_log_float_text(
    1600,
    "-61.46047457757E168",
    Some(16370664977473390316UL),
    None,
  )
  verify_log_float_text(1601, ".0063e263", Some(8508562752925412509UL), None)
  verify_log_float_text(
    1602,
    "95008582090348480831121837479630795692716270971237.70432168197338670490539478011095e-415",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1603,
    "77504777536407269072.04235384942396393316136592105e183",
    Some(7642507747283284206UL),
    None,
  )
  verify_log_float_text(
    1604,
    "36953580623969716307347621746751.8440e225",
    Some(8445287618404689775UL),
    None,
  )
  verify_log_float_text(
    1605,
    "+801328768825324365307155224771.059648978055426667237484825126062427388247289e-295",
    Some(640825855215553129UL),
    None,
  )
  verify_log_float_text(
    1606,
    "1760437192679925235806825065975844890779349317264449324229641012932.61e-125",
    Some(3727935975821759552UL),
    None,
  )
  verify_log_float_text(
    1607,
    "+728177843682953873271.1240987032751619092133884e311",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1608,
    "-02661717760.8837e-196",
    Some(11039034864944304556UL),
    None,
  )
  verify_log_float_text(
    1609,
    "-0474455037436785.1321055731E213",
    Some(17236409564758625987UL),
    None,
  )
  verify_log_float_text(
    1610,
    "-4470742703215947357301487006007919264412.5821343721102781e-417",
    Some(9223372036854775808UL),
    None,
  )
  verify_log_float_text(
    1611,
    "+6974876493891892214559.025e-137",
    Some(2883988651065698846UL),
    None,
  )
  verify_log_float_text(
    1612,
    "+702051229023407300978006.64959237613202480953298656077631048781E-153",
    Some(2674897489029139162UL),
    None,
  )
  verify_log_float_text(
    1613,
    "9.01890655850668202445147005173803700599375160908630929989332091914036429122163295E261",
    Some(8525970111619581887UL),
    None,
  )
  verify_log_float_text(
    1614,
    "+9137992418140126424835721163057397620646.126175690290844622851076206146643832e-169",
    Some(2676339881947529622UL),
    None,
  )
  verify_log_float_text(
    1615,
    "+105161717268657761.06448e-165",
    Some(2392963655312478923UL),
    None,
  )
  verify_log_float_text(
    1616,
    "+54291447399623493619067749732397676015804807679.02736419271E-64",
    Some(4348517473579617492UL),
    None,
  )
  verify_log_float_text(
    1617,
    "+23988873941876577898002956917570302777.3985455E67",
    Some(6168461162198545230UL),
    None,
  )
  verify_log_float_text(
    1618,
    "+2919139633179078325092081940367490696.6157E-42",
    Some(4524003049833878123UL),
    None,
  )
  verify_log_float_text(
    1619,
    "-99.14690390044060222123520307229445E268",
    Some(17869728186921035443UL),
    None,
  )
  verify_log_float_text(
    1620,
    "8992274213793.4466624675407714778603255293715e314",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1621, "+991.e-235", Some(1135946700568277443UL), None)
  verify_log_float_text(
    1622,
    "+93987825.6865987226E313",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1623, "+99106317478.E-386", Some(0UL), None)
  verify_log_float_text(
    1624,
    "707.3911774914232475609413999774578823256785662E285",
    Some(8913350567182630571UL),
    None,
  )
  verify_log_float_text(
    1625,
    "-4689869020515479971147.3101834100211e391",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1626,
    "+53044926412.3773738090014104706021E365",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1627,
    "+1820017957483233424569023458527696850985242995624634049991866872.E335",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1628,
    "187442003372102182256521266952974006.50343667184101265254021780538505241e394",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1629,
    "-99362207874423962104241742654531967075674099791858054972599153835670088.6e-287",
    Some(10598636788592046079UL),
    None,
  )
  verify_log_float_text(
    1630,
    "-510593995484064495178142098658727613688160.007532321052133557658047281343e-149",
    Some(12225016413223019689UL),
    None,
  )
  verify_log_float_text(
    1631,
    "+2062730892925401580.878573921598661268435980942820E150",
    Some(7125114066820341534UL),
    None,
  )
}

///|
test "native log base float text group 51" {
  verify_log_float_text(
    1632,
    "+267061317457541460971102487831032980765.791651949996752046086698054102410519E372",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1633,
    "+40951.600165162764924643042968770657099151134468558718713666006059027E83",
    Some(5917861867598213010UL),
    None,
  )
  verify_log_float_text(
    1634,
    "9504327799301539852356.17918700318583857864e-25",
    Some(4561905418396889387UL),
    None,
  )
  verify_log_float_text(
    1635,
    "+02897812854638.60773E183",
    Some(7531101774747094078UL),
    None,
  )
  verify_log_float_text(1636, "4.3E-334", Some(0UL), None)
  verify_log_float_text(
    1637,
    "-286545503013161056292552564198863146108944837011071376474289520153009084.e-250",
    Some(11159279697156511162UL),
    None,
  )
  verify_log_float_text(
    1638,
    "-51643420.881495221200082157576725379440207457532528979902589E246",
    Some(17626012568385856459UL),
    None,
  )
  verify_log_float_text(
    1639,
    "+01047416837625356401260.836645171939589872306793887296828e100",
    Some(6417692764817871980UL),
    None,
  )
  verify_log_float_text(
    1640,
    "593193327388.8778584525926068266646402569300323e-15",
    Some(4558610466019858872UL),
    None,
  )
  verify_log_float_text(
    1641,
    "88426838165734498647247196427.1225159097976346697e-111",
    Some(3379240235458885032UL),
    None,
  )
  verify_log_float_text(
    1642,
    "+590931256718322467.4711690529760307228335841152224478875E-82",
    Some(3645915235792012022UL),
    None,
  )
  verify_log_float_text(
    1643,
    "1349263368742618033837.99272500107670602E-2",
    Some(4892993795739676725UL),
    None,
  )
  verify_log_float_text(
    1644,
    "-4748463835359694878579922.15096740780788e-379",
    Some(9223372036854775808UL),
    None,
  )
  verify_log_float_text(
    1645,
    "-077317339785947616341975367445348950743852939797874991511210178332689405573476.0081630216E208",
    Some(18092310212183103275UL),
    None,
  )
  verify_log_float_text(
    1646,
    "9733762801280440486621079742763.03472795143774506379899832386E-146",
    Some(2886436484810985602UL),
    None,
  )
  verify_log_float_text(
    1647,
    "+34644464774819319345402576508855.89478267669236354638907141915767457469948709144179E339",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1648,
    "+152593441716690143954437303489542326508477.7898E-102",
    Some(3697282651526580320UL),
    None,
  )
  verify_log_float_text(
    1649,
    "-904779013494250823579628900732120340917467506466087824644561365006061033382848946234.0797E-257",
    Some(11241520133425542684UL),
    None,
  )
  verify_log_float_text(
    1650,
    "-02976.4E-267",
    Some(9887651057069998585UL),
    None,
  )
  verify_log_float_text(
    1651,
    "31270277236014924748059500903199936258975155416146772444813949685.E-46",
    Some(4883505872464906333UL),
    None,
  )
  verify_log_float_text(
    1652,
    "46454423372508645124256843022145978.62966501562612077439144010013487056070761E288",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1653,
    "+363867722835101741864124465327870660.7340904284960087212320261258053348823573807035E407",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1654,
    "-7618324317655421917323271581552318274448233352112399511429.294207207094736425330404852080E-355",
    Some(9385469847640607155UL),
    None,
  )
  verify_log_float_text(
    1655,
    "-3516376.247913222164429797752565739077034500234433453119449945218725680862255242674870410E193",
    Some(16815709380609407887UL),
    None,
  )
  verify_log_float_text(1656, "+6158751.8652026331e-390", Some(0UL), None)
  verify_log_float_text(
    1657,
    "+947525018344137178413943491328149825941887903452293964.47488131435251364422449098081E178",
    Some(8077322067820849463UL),
    None,
  )
  verify_log_float_text(
    1658,
    "-588686248499808056.2900294186073075E175",
    Some(16714165558204549449UL),
    None,
  )
  verify_log_float_text(
    1659,
    "9251069957658694744.310629E365",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1660,
    "90407735284123629082329702430427205943596880072936.361340644231005853e359",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1661,
    "3176164369094041796965039647595610.650485766967218237081331525985654430470e-253",
    Some(1323130127849257970UL),
    None,
  )
  verify_log_float_text(
    1662,
    "-051118165.158407870824466486986425992191744960952E390",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1663,
    "-846576960708678908609318811277330941499684062780.0357080890942793817072580543E-363",
    Some(9223372037026124892UL),
    None,
  )
}

///|
test "native log base float text group 52" {
  verify_log_float_text(
    1664,
    "47297156106643842692665452647907.08590682431418796102740562936887682322156617012835589E151",
    Some(7339880988613821736UL),
    None,
  )
  verify_log_float_text(
    1665,
    "-850.8770755E-182",
    Some(11151378135188204528UL),
    None,
  )
  verify_log_float_text(
    1666,
    "03057435101924350418532036201845835800794572447913.0376986699647313301337491914309418e15",
    Some(5556802668875723304UL),
    None,
  )
  verify_log_float_text(
    1667,
    "-14.900155596122732692557930349239990E-163",
    Some(11409152188887336158UL),
    None,
  )
  verify_log_float_text(
    1668,
    "+862152067270460936309.617186857794128117894578312236e-295",
    Some(506621112735027694UL),
    None,
  )
  verify_log_float_text(
    1669,
    "2875647.86197316253540983254301902e-10",
    Some(4553940257659793858UL),
    None,
  )
  verify_log_float_text(
    1670,
    "-50350454585904580250699695303.0069616066266025024211856017853559e16",
    Some(14498938721707524309UL),
    None,
  )
  verify_log_float_text(
    1671,
    "4733495018787338830156892859812355.1402977280767748655399766e-104",
    Some(3554721699023633156UL),
    None,
  )
  verify_log_float_text(
    1672,
    "-99.608688460306430174225972040248629984825262584737101631e301",
    Some(18363213641602371978UL),
    None,
  )
  verify_log_float_text(1673, "5.e-300", Some(129137261445328943UL), None)
  verify_log_float_text(
    1674,
    "41517551870051307879350467664623093756302654791315972713754.9828409824518332743674402e302",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1675,
    "8787393784084132256724855562620496824962099018568067768830290571415013266081589085687.8e-400",
    Some(177858830UL),
    None,
  )
  verify_log_float_text(
    1676,
    "+877036504.302E331",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1677,
    "+742705628692935847980846864418620.916018921719494106755986E-117",
    Some(3348168857207544218UL),
    None,
  )
  verify_log_float_text(
    1678,
    "871550120.473166103824237944176822295286148313487153485657285476321928702269418153962E44",
    Some(5399004771907081239UL),
    None,
  )
  verify_log_float_text(
    1679,
    "-37182601834892410920571748.227218390360154E-92",
    Some(12836398579309532229UL),
    None,
  )
  verify_log_float_text(
    1680,
    "+67213558971520141701441144683626.56940571165311957459951384729171817E330",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1681,
    "-52119877628937836068713608345987719587157.592984589E346",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1682,
    "+64.9413832650778377118017232579783488886236367642346267118919980362817222737585e375",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1683,
    "0401827420.67037764639468874650561639718764E-366",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1684,
    "460547.391655167992781599750246969501779912420993273721056933691274874480898884896563E190",
    Some(7534394035799867677UL),
    None,
  )
  verify_log_float_text(
    1685,
    "-12.5511E-279",
    Some(9672740797555964807UL),
    None,
  )
  verify_log_float_text(
    1686,
    "-017393.205E416",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1687,
    "+04772502.312794568335981126447e-8",
    Some(4587038721719802895UL),
    None,
  )
  verify_log_float_text(
    1688,
    "183.2689421511156463895585035145655711222745841440170099239453315975622439986140515E-185",
    Some(1873257952392185406UL),
    None,
  )
  verify_log_float_text(
    1689,
    "-8225367316866618446129207215361590813183242.6690672589656685977530792511698519e94",
    Some(15878648459595618778UL),
    None,
  )
  verify_log_float_text(
    1690,
    "-174366792.90972880690222467001548599405741510013332e-242",
    Some(10332996037846440259UL),
    None,
  )
  verify_log_float_text(
    1691,
    "43990420703747463247077770278917210737833237659022.E-236",
    Some(1819067207715514739UL),
    None,
  )
  verify_log_float_text(
    1692,
    "+05382956780742369803146894005007376424484371.05848005333100933182303166370683061e405",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1693,
    "39846979126554669126.29763184921146208826387260595943777280820343782155376947652682E-22",
    Some(4571244066066545447UL),
    None,
  )
  verify_log_float_text(
    1694,
    "-8866809689882472922022553557420590989710164521498698.1515087609156e331",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1695,
    "8546890818542.7242401916840742429855736225381559062974e-382",
    Some(0UL),
    None,
  )
}

///|
test "native log base float text group 53" {
  verify_log_float_text(
    1696,
    "+622934679615773939006575476.9360591499e-238",
    Some(1447054696679121676UL),
    None,
  )
  verify_log_float_text(
    1697,
    "57512170276.3e394",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1698,
    "9945550977019683397887181190706399.113293787409426849e17",
    Some(5369772916960783217UL),
    None,
  )
  verify_log_float_text(
    1699,
    "3530938734471548913.12379E405",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1700,
    "-97942338769754884166487176944779.733754711873665343682650545246871645229735834822144728e-165",
    Some(11840469250914730641UL),
    None,
  )
  verify_log_float_text(
    1701,
    "-6941281692348437232770668892542610336116.2756253845086e322",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(1702, "+.6279346E-5", Some(4529027369151163378UL), None)
  verify_log_float_text(1703, ".411736e250", Some(8341342700945988966UL), None)
  verify_log_float_text(
    1704,
    "+37229621659029635785975.8156613003181056101819038504026022784e292",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1705,
    "+72279567658049563564.261566603018e190",
    Some(7746638479204107575UL),
    None,
  )
  verify_log_float_text(
    1706,
    "+544507.598714028327E338",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1707, "028571325.013044467095e-361", Some(0UL), None)
  verify_log_float_text(
    1708,
    "5210434457079003119726176264398920600524363.182E254",
    Some(9045900543881953249UL),
    None,
  )
  verify_log_float_text(
    1709,
    "049710.3801130671930373882412632388e-326",
    Some(101UL),
    None,
  )
  verify_log_float_text(
    1710,
    "-296067801264909469420863040271460206117865525691157.864765E356",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1711,
    "-39553.162221055e412",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1712,
    "-68320612635825096366764899615.89521787666080870418600343294383229e257",
    Some(18106433050413148724UL),
    None,
  )
  verify_log_float_text(
    1713,
    "33154531133109515064573.49132359001400e-229",
    Some(1518003272362660221UL),
    None,
  )
  verify_log_float_text(
    1714,
    "-.097160319464258836156417724935265639388E243",
    Some(17450644158084689103UL),
    None,
  )
  verify_log_float_text(
    1715,
    "-165704518.3880005e-151",
    Some(11694121212163096419UL),
    None,
  )
  verify_log_float_text(
    1716,
    "02266829360.8903418499285212055028144E-294",
    Some(348345889608199063UL),
    None,
  )
  verify_log_float_text(
    1717,
    "0161438598907571239479.115308030259679030448955E-51",
    Some(4146181269323230270UL),
    None,
  )
  verify_log_float_text(1718, "687330934.410912390E-374", Some(0UL), None)
  verify_log_float_text(
    1719,
    "67051553496227648119406935.2670785531232E264",
    Some(8942888290287985018UL),
    None,
  )
  verify_log_float_text(
    1720,
    "-5051537.634898234246577384702353E-267",
    Some(9936033847278499749UL),
    None,
  )
  verify_log_float_text(
    1721,
    "+722864290211185.E-75",
    Some(3707190266598460385UL),
    None,
  )
  verify_log_float_text(1722, "655381035644.24957E-371", Some(0UL), None)
  verify_log_float_text(
    1723,
    "+265258314086073184149.830119749982676937067075e-396",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1724,
    "87225465.251679968E208",
    Some(7837457407383330363UL),
    None,
  )
  verify_log_float_text(
    1725,
    "+0295.6923212412831249948E61",
    Some(5556527576773342684UL),
    None,
  )
  verify_log_float_text(
    1726,
    "19915819310511928756479.946811696059632981792874843773541199029e-32",
    Some(4461764590888062942UL),
    None,
  )
  verify_log_float_text(
    1727,
    "+412547.561904877672553372748493464993716446231561038254160685569764507e-134",
    Some(2686081127052009865UL),
    None,
  )
}

///|
test "native log base float text group 54" {
  verify_log_float_text(
    1728,
    "-140023618367357920770355938317135310495688102481364799704299.09210719777104581e-196",
    Some(11782779931138613032UL),
    None,
  )
  verify_log_float_text(
    1729,
    "37240759664.9777332493013172733778309113872170196597e-417",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1730,
    "+6762581465.7744772344049930486252041769518417670857711528E-14",
    Some(4544618328772530104UL),
    None,
  )
  verify_log_float_text(
    1731,
    "-.3548099008342992387960E-71",
    Some(12761252353040970638UL),
    None,
  )
  verify_log_float_text(
    1732,
    "-362.1488791857694784614953650451469065878210375271769279916543E-218",
    Some(10607095949700570891UL),
    None,
  )
  verify_log_float_text(
    1733,
    "+5427347108736837778543799801036216550.2802249106783566975749751478e379",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1734,
    "+06625675078556756619935019377401302482397118383566243029942633.80662502900240421E160",
    Some(7910421285554280868UL),
    None,
  )
  verify_log_float_text(
    1735,
    "1465182862033644.7639e19",
    Some(5117939794833934587UL),
    None,
  )
  verify_log_float_text(
    1736,
    "-535336873.67507667129990627111358391891160945956181798691919162076208e-362",
    Some(9223372036854775808UL),
    None,
  )
  verify_log_float_text(
    1737,
    "-69041875963199395086643653801237738711310230781.90373e-154",
    Some(12227333443103721039UL),
    None,
  )
  verify_log_float_text(
    1738,
    "+7.655357985028670503581483059244745e156",
    Some(6954076465902059804UL),
    None,
  )
  verify_log_float_text(
    1739,
    "+5075.70867500507057924087751746409352682062733119500167813418e195",
    Some(7579832718223646834UL),
    None,
  )
  verify_log_float_text(
    1740,
    "0.59083691038950239106408842792820158312431E167",
    Some(7102185435642018317UL),
    None,
  )
  verify_log_float_text(
    1741,
    "+8558555922120350969.611666814395743666433141707898238715649810313676822690002419476E320",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1742,
    "-248689052459676153651299466496593757250137546221632.02429807529131339e-28",
    Some(14165246437505394417UL),
    None,
  )
  verify_log_float_text(
    1743,
    "+042.6312782030578363E50",
    Some(5379208797270093287UL),
    None,
  )
  verify_log_float_text(
    1744,
    "+5533789453077110626928699542071304166428397.272069342637896697332459346606779386437031574E-420",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1745,
    "043038659087.50672484511174820086134007249E106",
    Some(6351720955549368425UL),
    None,
  )
  verify_log_float_text(
    1746,
    "+20.3661619162131935998048343770470227438101225129202877241211753169664634e-206",
    Some(1544832218603645453UL),
    None,
  )
  verify_log_float_text(
    1747,
    "50184658.2232327440424729065888595216565093340E190",
    Some(7564598987526165250UL),
    None,
  )
  verify_log_float_text(
    1748,
    "24266418615192742120850330369920032.927954857521286261706E-149",
    Some(2892189982222823465UL),
    None,
  )
  verify_log_float_text(
    1749,
    "+50.1963142944e43",
    Some(5275547229612766528UL),
    None,
  )
  verify_log_float_text(
    1750,
    "26941997892664855092547997215492220433775633704941833587973959.3256000e-363",
    Some(95272494067639432UL),
    None,
  )
  verify_log_float_text(
    1751,
    "-346785684918223.9945869555465054844240463975169957291298992946956134071868173496285e285",
    Some(18311796664705713156UL),
    None,
  )
  verify_log_float_text(
    1752,
    "45498589599613.42988563174293691685030304681515E-323",
    Some(92090170572663UL),
    None,
  )
  verify_log_float_text(1753, "94264799.46777522210e-388", Some(0UL), None)
  verify_log_float_text(
    1754,
    "-73480926279025126728626.252663150228357140468942134169660299585E-245",
    Some(10507179212639031048UL),
    None,
  )
  verify_log_float_text(
    1755,
    "+7230297039813917178571950.262609243667941921260183343505254496002289e-294",
    Some(580558411837269118UL),
    None,
  )
  verify_log_float_text(
    1756,
    "+2900209787648574.e30",
    Some(5287298087142422393UL),
    None,
  )
  verify_log_float_text(
    1757,
    "-977841.42125e-198",
    Some(10957777319903657807UL),
    None,
  )
  verify_log_float_text(
    1758,
    "6512820710183122269477717292.3930439687e-317",
    Some(280436400062220037UL),
    None,
  )
  verify_log_float_text(
    1759,
    "94649108.8829E-317",
    Some(191571929114279UL),
    None,
  )
}

///|
test "native log base float text group 55" {
  verify_log_float_text(
    1760,
    "-2513395879416871391606656.751702852220242654518940132162881977216761078E273",
    Some(18279757649625626544UL),
    None,
  )
  verify_log_float_text(
    1761,
    "176543823815329982794973424652014908457653.1699E119",
    Some(7004249107417265278UL),
    None,
  )
  verify_log_float_text(
    1762,
    "-62691614098551.76218114214624662178824974145854412594182E-314",
    Some(9339021615962068469UL),
    None,
  )
  verify_log_float_text(
    1763,
    "-4650967081114.47195958413244E236",
    Some(17550705018687320737UL),
    None,
  )
  verify_log_float_text(
    1764,
    "-9912016978415779473.08874783098717952E-241",
    Some(10508848771679464112UL),
    None,
  )
  verify_log_float_text(
    1765,
    "-20563452977896.0378345235171298246895631386204048E63",
    Some(14971859895854509520UL),
    None,
  )
  verify_log_float_text(
    1766,
    "6.75931560765532350158E400",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1767,
    "6861176315261683747.927788722032254060621E-145",
    Some(2719533720683144288UL),
    None,
  )
  verify_log_float_text(1768, "6097359.E15", Some(4932752887019531120UL), None)
  verify_log_float_text(
    1769,
    "-08486318683457910.8057078165450728e-219",
    Some(10792112478157370791UL),
    None,
  )
  verify_log_float_text(
    1770,
    "+485683623.169331364e-47",
    Some(4033661146737009314UL),
    None,
  )
  verify_log_float_text(
    1771,
    "5.98264407495218e253",
    Some(8403807047002008248UL),
    None,
  )
  verify_log_float_text(
    1772,
    "4448274033593728178591.60570435158130050088016177141345501898477130008470E298",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1773,
    "-905555407181122596775639626734746943580076.E-308",
    Some(9850128848721130088UL),
    None,
  )
  verify_log_float_text(
    1774,
    "57.15030006790310994826086683926905616913551E91",
    Some(5994723100646366047UL),
    None,
  )
  verify_log_float_text(
    1775,
    "+5.12573912e-198",
    Some(1655219757215574775UL),
    None,
  )
  verify_log_float_text(
    1776,
    "-10.28485810159513049845270405953453215e-129",
    Some(11915544099984806496UL),
    None,
  )
  verify_log_float_text(
    1777,
    "+39328600378552.5963236148217227E-79",
    Some(3628355277020155265UL),
    None,
  )
  verify_log_float_text(
    1778,
    "-988335306747775445.0393323075940940008e-38",
    Some(13530878295788358566UL),
    None,
  )
  verify_log_float_text(
    1779,
    "474122211895480946801775380739620.29615240787301685816321636293733636089187E386",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1780,
    "-79939422.42E-205",
    Some(10881575400590250022UL),
    None,
  )
  verify_log_float_text(
    1781,
    ".573522045297158766359063925e-89",
    Some(3271686589929253744UL),
    None,
  )
  verify_log_float_text(
    1782,
    "-137806681701927152950748812856072.E138",
    Some(16375723691427598088UL),
    None,
  )
  verify_log_float_text(
    1783,
    "+6514643652311448497868865.933807739044991447E-254",
    Some(1178053069773648997UL),
    None,
  )
  verify_log_float_text(
    1784,
    "-706940904220.770460E158",
    Some(16371353652004883740UL),
    None,
  )
  verify_log_float_text(
    1785,
    ".5344106384231019642639039178397003037448036E298",
    Some(9061338970608973606UL),
    None,
  )
  verify_log_float_text(
    1786,
    "411966934811.9e42",
    Some(5409162200890564820UL),
    None,
  )
  verify_log_float_text(
    1787,
    "-2984239280.e-114",
    Some(12266504237219452276UL),
    None,
  )
  verify_log_float_text(
    1788,
    "123942622567714283.934460421824442004883078e218",
    Some(8124264291265016908UL),
    None,
  )
  verify_log_float_text(
    1789,
    "-2802.05848664964897284992528961263675525621690440135779107084959642269904111388097332521e316",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1790,
    "056288994945080009955453239722421697339828.54314e191",
    Some(8074111188416252496UL),
    None,
  )
  verify_log_float_text(
    1791,
    "-2127720116595228797553225283643381226967487299347533202730.33667950746212853628077E-257",
    Some(10842995556126129687UL),
    None,
  )
}

///|
test "native log base float text group 56" {
  verify_log_float_text(
    1792,
    "-68539491337016517003684977891841662890143195178693134352828124.83374220926004256181096E124",
    Some(16610447184963836776UL),
    None,
  )
  verify_log_float_text(
    1793,
    "-350775511653634925724.83376e-157",
    Some(11788765266899310158UL),
    None,
  )
  verify_log_float_text(
    1794,
    "89065458761.44612693393348168749E374",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1795,
    "596406842162.0748832891015234694567315174574506669854583446E358",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1796,
    "-664335105431175965549070634.4683411769653437090805061656e7",
    Some(14336216202809453213UL),
    None,
  )
  verify_log_float_text(
    1797,
    "16559382260286834411676616237905712852913362026659838702478556302.358e-32",
    Some(5089160131166024937UL),
    None,
  )
  verify_log_float_text(
    1798,
    "-5356329988211017600337175412.8051114330E284",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1799,
    "-301.22422493843386161906910237863224085165704869791e53",
    Some(14660245802693999469UL),
    None,
  )
  verify_log_float_text(
    1800,
    "-1535981352700.78e-329",
    Some(9223372036857884669UL),
    None,
  )
  verify_log_float_text(
    1801,
    "911541239615466392622450403584089.38042335403496670453015627838192990576930548156461872e331",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1802,
    "+5761799146342388428041474846446738408.63685E73",
    Some(6248894652514430170UL),
    None,
  )
  verify_log_float_text(
    1803,
    "-7677153942.0e110",
    Some(15623839275638750620UL),
    None,
  )
  verify_log_float_text(
    1804,
    "-64556810.7407442271161714431106600012228314747267084845035652565583664168e335",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1805,
    "-531110385304882497.0713249762371743558977947e172",
    Some(16668687051335857323UL),
    None,
  )
  verify_log_float_text(
    1806,
    "71.7151733355E-256",
    Some(804714480819095979UL),
    None,
  )
  verify_log_float_text(
    1807,
    "-1596429125371938646650462174681888758103779489128552751.56002583e-54",
    Some(13833240533641571190UL),
    None,
  )
  verify_log_float_text(
    1808,
    "+180776589887533159306181143255374027952792073208437382049967188677061331341295.E189",
    Some(8590173163115013478UL),
    None,
  )
  verify_log_float_text(
    1809,
    "-18.4655958466793609837236240902330e27",
    Some(14253282802166696382UL),
    None,
  )
  verify_log_float_text(
    1810,
    "08497894858563987426277235382870924.636412E-360",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1811,
    "+6998225102884927777956.19655527245e345",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1812,
    "499095687468888809612080389189.926953624201084642496978518122E133",
    Some(7040867811944966318UL),
    None,
  )
  verify_log_float_text(
    1813,
    "18333728694591580374033293321972942879014989818.34814452792033e370",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1814,
    "03844632512033364267349687473619373930385043357110709940005185826037293812860284097.408e-104",
    Some(4271450150375539245UL),
    None,
  )
  verify_log_float_text(
    1815,
    "7641330163786044852.4130621e-170",
    Some(2346377758250436665UL),
    None,
  )
  verify_log_float_text(1816, "824.23e-274", Some(551210851917780189UL), None)
  verify_log_float_text(
    1817,
    "-83632397744698038024424161512552148514451557543620877240178131514083501830.942e-226",
    Some(11555120082742607249UL),
    None,
  )
  verify_log_float_text(
    1818,
    "+65200904523991857927.052112748e-246",
    Some(1222928068548478705UL),
    None,
  )
  verify_log_float_text(
    1819,
    "681039702294648956816.212236347574588086719885478409461596717567606817547310179822681455e-157",
    Some(2569681976662118427UL),
    None,
  )
  verify_log_float_text(
    1820,
    "-55396189.1264E-158",
    Some(11582417571101602112UL),
    None,
  )
  verify_log_float_text(
    1821,
    "057832550438518677005006788035367219099330107859002.7323103658176899178e-239",
    Some(1775716943039479974UL),
    None,
  )
  verify_log_float_text(
    1822,
    "-45021147339871313520397732520144555450675522426054496674429664452635096.3E-315",
    Some(10174665701799660419UL),
    None,
  )
  verify_log_float_text(
    1823,
    "+068206041.7412E-99",
    Some(3243093906874125928UL),
    None,
  )
}

///|
test "native log base float text group 57" {
  verify_log_float_text(
    1824,
    "-2660142132929061219066374983160136802362740319536756.0816842389929124282127882399e-160",
    Some(12205878599618043836UL),
    None,
  )
  verify_log_float_text(
    1825,
    "+142172122079683.3687353712E113",
    Some(6509109611788074621UL),
    None,
  )
  verify_log_float_text(
    1826,
    "+718281733511026677104657177.28705e138",
    Some(7073169591302517402UL),
    None,
  )
  verify_log_float_text(
    1827,
    "-28533.9027E-296",
    Some(9468474717229739509UL),
    None,
  )
  verify_log_float_text(
    1828,
    "+207624289163887462384349153878351687504037672268.8902816191868871053861599E315",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1829,
    "63839219601871771263107162258934766744860649905907.803E322",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1830,
    "+1754865035529579115702492413217841213243132163098488579834.99358988616388074794E-105",
    Some(3892381755247633173UL),
    None,
  )
  verify_log_float_text(
    1831,
    "+95729712884806266.246239921E-202",
    Some(1838827156999609329UL),
    None,
  )
  verify_log_float_text(1832, "5.10263e-354", Some(0UL), None)
  verify_log_float_text(
    1833,
    "066282148631122932.785496118542E298",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1834,
    "+87233646.20979911450897800388228794883056059690238968937919842249009747e113",
    Some(6416229306927276111UL),
    None,
  )
  verify_log_float_text(
    1835,
    "104422835315861.615e97",
    Some(6267825464748800428UL),
    None,
  )
  verify_log_float_text(
    1836,
    "+927327726787540927989653331808.32E385",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1837, "-780.E-256", Some(10043674441087408320UL), None)
  verify_log_float_text(
    1838,
    "3596307982417.40975666763248275355895954359846643E364",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1839,
    "-158566782149072519738878314383216112552535681966406213635.249458311226208326e76",
    Some(15808161508323378557UL),
    None,
  )
  verify_log_float_text(
    1840,
    "-8932109269992861542604568727.022558e84",
    Some(15505249766735247251UL),
    None,
  )
  verify_log_float_text(
    1841,
    "1.006272038587432969e-208",
    Some(1495347361002076053UL),
    None,
  )
  verify_log_float_text(
    1842,
    "+816.221624164267129190450511869E-91",
    Some(3288974138244847568UL),
    None,
  )
  verify_log_float_text(
    1843,
    "-994301.2228147661277043379831597855739864778239754710039600299293429081758120553050E165",
    Some(16388730342692115412UL),
    None,
  )
  verify_log_float_text(
    1844,
    "-78826089185755759453555437734692305455.979822895878780722058466e-142",
    Some(12272894101436980744UL),
    None,
  )
  verify_log_float_text(
    1845,
    "-684298293328158531802910855553.6613439950591959E-239",
    Some(10701114963741321278UL),
    None,
  )
  verify_log_float_text(
    1846,
    "-2312854124932859951.86112673463286028138730100713622E256",
    Some(17934847143650618724UL),
    None,
  )
  verify_log_float_text(
    1847,
    "12.4294389347320607300157280431909974766063E376",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1848,
    "+95165474229468571062182055565040.538397E-364",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1849,
    "+17371167337630740658095049664607337732335348053988417372525639426.4058775338E-113",
    Some(3877669173141836266UL),
    None,
  )
  verify_log_float_text(
    1850,
    "-71867432.E-266",
    Some(9968182917088078120UL),
    None,
  )
  verify_log_float_text(
    1851,
    "+85.20094958053499e269",
    Some(8660457984763514417UL),
    None,
  )
  verify_log_float_text(
    1852,
    "+8864834961456321267893607805768226278219.93446271796e256",
    Some(9034600904676974993UL),
    None,
  )
  verify_log_float_text(
    1853,
    "881323504687884678563929790139496175235309183.792320659065371842288e318",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1854,
    "-746449761947077.8539569308757441661621565E291",
    Some(18406495312620584458UL),
    None,
  )
  verify_log_float_text(
    1855,
    "3904296435952922462546196476685310536060470342996.e-249",
    Some(1608665152712092766UL),
    None,
  )
}

///|
test "native log base float text group 58" {
  verify_log_float_text(1856, "+57.452e204", Some(7685084664799520295UL), None)
  verify_log_float_text(
    1857,
    "-5096458381.4004461e-191",
    Some(11117999590692527297UL),
    None,
  )
  verify_log_float_text(
    1858,
    "+9124268599354690867256229.983423688959e208",
    Some(8092232581894336353UL),
    None,
  )
  verify_log_float_text(
    1859,
    "331761879141544231186284762361730748622555231.6644215564615993580078208206325629726E355",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1860,
    "+813493857012800495859889308259398836743595929495017118082239213656574771.80762597909806E-90",
    Some(4336407045099456545UL),
    None,
  )
  verify_log_float_text(
    1861,
    "+291248517319077223491944329685707869824136.29091665126523944908847E129",
    Some(7157146784963404004UL),
    None,
  )
  verify_log_float_text(
    1862,
    "-883052.41452229945033023497219E334",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1863,
    "-545511473243.3499835509686126361277e-238",
    Some(10445163901647830864UL),
    None,
  )
  verify_log_float_text(
    1864,
    "82987035549519971240234942065092318768.168227769172704350269571e382",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1865, "+.5e366", Some(9218868437227405312UL), None)
  verify_log_float_text(
    1866,
    "-02.9876879003018751248958374456617958E378",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(1867, "6758.8e179", Some(7342094682053623152UL), None)
  verify_log_float_text(
    1868,
    "-9168037334284633459511.52784017E-413",
    Some(9223372036854775808UL),
    None,
  )
  verify_log_float_text(
    1869,
    "-2183.0205E408",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1870,
    "50177242631243.11128553972990751564653907896914E315",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1871,
    "-2610907109807122495372815761523716536891210931435573465418.4277539798E410",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1872,
    "057366939518941110.6578999587787168993824608156076692649e-341",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1873,
    "-04067190577734539065172885936963319130014520622921708.3534e229",
    Some(18028451140517542760UL),
    None,
  )
  verify_log_float_text(
    1874,
    "8277782689222558018882473686.89220623530974610819140736686583511E312",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1875,
    "+88159111248688368085759339482460112051635773.8530478934501627892795794404424773973523e-55",
    Some(4441502417642066834UL),
    None,
  )
  verify_log_float_text(
    1876,
    "33878238059176366647.3071432666151e-48",
    Some(4180880934210312630UL),
    None,
  )
  verify_log_float_text(
    1877,
    "-4271405200166639069115973717.4117705751287122900568421109784723118730323351983939425E-298",
    Some(9785444905268524700UL),
    None,
  )
  verify_log_float_text(
    1878,
    "826590687.047048468384194887637261788429599409299328E-42",
    Some(4112115114731979301UL),
    None,
  )
  verify_log_float_text(1879, "94332402430.2622134306793E-383", Some(0UL), None)
  verify_log_float_text(
    1880,
    "-55014892636844885489636459619.817021304249604135178161328332e70",
    Some(15307762611054970363UL),
    None,
  )
  verify_log_float_text(
    1881,
    "-5048489771884015952.80348007E-11",
    Some(13945416814981820229UL),
    None,
  )
  verify_log_float_text(
    1882,
    "+2970714473759096018168717318292055309838.237562E138",
    Some(7261902181282639044UL),
    None,
  )
  verify_log_float_text(1883, "6.1173948e58", Some(5486367015910795150UL), None)
  verify_log_float_text(
    1884,
    "+4860945.29217526964077530148504041707060418990526798217593829349033164690726831547842e-53",
    Some(3914123668827067695UL),
    None,
  )
  verify_log_float_text(
    1885,
    "-070398345.e-265",
    Some(9983089903849738609UL),
    None,
  )
  verify_log_float_text(
    1886,
    "70464091142464484420490778373429050041740709.681186381802672040e-76",
    Some(4125942828272891131UL),
    None,
  )
  verify_log_float_text(
    1887,
    "-624661896124157240.662446E30",
    Some(14545319149477485718UL),
    None,
  )
}

///|
test "native log base float text group 59" {
  verify_log_float_text(
    1888,
    "-78056855889.80E-9",
    Some(13858565216715067818UL),
    None,
  )
  verify_log_float_text(
    1889,
    "60976551696802385720289449527803167996.63e36",
    Some(5710917790442264716UL),
    None,
  )
  verify_log_float_text(
    1890,
    "-292593559193329847050580532749113807566.7676113530224e133",
    Some(16395418614189417602UL),
    None,
  )
  verify_log_float_text(
    1891,
    "+60079678745490211161675216600207676627410977.807706105969674071e5",
    Some(5336890328900471462UL),
    None,
  )
  verify_log_float_text(
    1892,
    "-1967807863980827614164783453995844690765221655700722841.575977538E202",
    Some(17664516369287656445UL),
    None,
  )
  verify_log_float_text(
    1893,
    "+053617261139.43483189E149",
    Some(6996456779255795730UL),
    None,
  )
  verify_log_float_text(
    1894,
    "981898.7428719131754653808893066765411e221",
    Some(8003059636757574931UL),
    None,
  )
  verify_log_float_text(
    1895,
    "-109984.6840305996532275718851947840359806380856665772906445864927069402971121e351",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    1896,
    "+793015879578275041485584374532432410003.7065419106619521040679E-201",
    Some(2181665635134558761UL),
    None,
  )
  verify_log_float_text(
    1897,
    "+8231293713811906465467615414780153557286245969907475677319200477452693.156226813999E7",
    Some(5757499657469325126UL),
    None,
  )
  verify_log_float_text(
    1898,
    "38788.510537431383771548429090065529403983465362461068353203983022105090913E-103",
    Some(3134777819561697170UL),
    None,
  )
  verify_log_float_text(
    1899,
    "-60319336445549.4536556536388802440731753358557278216460624664e27",
    Some(14440273678931167401UL),
    None,
  )
  verify_log_float_text(
    1900,
    "-693080.76012611824774252426890527501504519004E-212",
    Some(10746095721815870105UL),
    None,
  )
  verify_log_float_text(
    1901,
    "6442531709407261514525446910601795270588792691803524593634.3738958443585156934e-278",
    Some(1312598899020972548UL),
    None,
  )
  verify_log_float_text(
    1902,
    "+7143443.712E-218",
    Some(1447920878319723109UL),
    None,
  )
  verify_log_float_text(
    1903,
    "+80406548537617799630.380718848442628418384649149873708095410490354970E-302",
    Some(386716070733515985UL),
    None,
  )
  verify_log_float_text(
    1904,
    "299174983951254683811.6989016136416181880418690445001606250904158923e-140",
    Some(2818944246026241049UL),
    None,
  )
  verify_log_float_text(
    1905,
    "294281200064577274963282589480490178166018077689483994345141394.229e-238",
    Some(1980968139914384940UL),
    None,
  )
  verify_log_float_text(
    1906,
    "-21566387984519.55358867942137840e-277",
    Some(9885791012563748576UL),
    None,
  )
  verify_log_float_text(
    1907,
    "7003.58315567250623293816053659413831226087438156713145636030697E326",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1908, ".40538E-35", Some(4077320889728438287UL), None)
  verify_log_float_text(
    1909,
    "904636988794686798598906.842453584479136176701311208373727434985806483740179676118526e180",
    Some(7658112979103839042UL),
    None,
  )
  verify_log_float_text(
    1910,
    "+0935557903174617124152.09982527794028840462318665943721697571387936757035878442724715e282",
    Some(9139444095256687102UL),
    None,
  )
  verify_log_float_text(
    1911,
    "62469607761476107475154493.7E365",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    1912,
    "+0705.277655986e238",
    Some(8210321990345638359UL),
    None,
  )
  verify_log_float_text(
    1913,
    "-970143210369248594982755867.141739673194007149624930174811E-402",
    Some(9223372036854775808UL),
    None,
  )
  verify_log_float_text(1914, "+72050.1125e-369", Some(0UL), None)
  verify_log_float_text(
    1915,
    "44988305484941304708.0E-247",
    Some(1205637057239832487UL),
    None,
  )
  verify_log_float_text(
    1916,
    "-436418962224.8600611715317248705413316663323405304E-19",
    Some(13720055842238198505UL),
    None,
  )
  verify_log_float_text(
    1917,
    "54629702345055414.86962539268e-337",
    Some(1106UL),
    None,
  )
  verify_log_float_text(
    1918,
    "+9584911930611596827090387752690357694389387075126827919599487931942507929919.624e42",
    Some(6372145205883292178UL),
    None,
  )
  verify_log_float_text(
    1919,
    "+99015548444587489119368055.7220661484631967917331557365388453989230420E161",
    Some(7404538503310968816UL),
    None,
  )
}

///|
test "native log base float text group 60" {
  verify_log_float_text(1920, "+056889.e-340", Some(0UL), None)
  verify_log_float_text(
    1921,
    "+164452984495715.0E-318",
    Some(62169576052138563UL),
    None,
  )
  verify_log_float_text(
    1922,
    "-4916041.11285467378571705013850272927697673733700E45",
    Some(14603563228860188135UL),
    None,
  )
  verify_log_float_text(
    1923,
    "+534789790938480039520373423727698060509515329605896273403123745686679.3149962151582E-300",
    Some(1146889120490003282UL),
    None,
  )
  verify_log_float_text(
    1924,
    "+23737.325619071912942206936639684904792569997541548E-406",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1925,
    "-0440667.80415751857004818511533264980028748635868E-151",
    Some(11655768552164811452UL),
    None,
  )
  verify_log_float_text(
    1926,
    "+7712283917717083811421876603491519035131148579153989688092326935.58583E-73",
    Some(4470526094049223015UL),
    None,
  )
  verify_log_float_text(
    1927,
    "5502139961172691512496221.638365365638E131",
    Some(6936815247552201490UL),
    None,
  )
  verify_log_float_text(1928, "8.7E300", Some(9109088146406853811UL), None)
  verify_log_float_text(
    1929,
    "+4062500012518672161751443217213631.840986422889745273313399443801385598040245563569669E-20",
    Some(4810540802420343132UL),
    None,
  )
  verify_log_float_text(
    1930,
    "+27900244939261847306974176357242853633794933374300485109050796890805117449065296.9E-409",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1931,
    "+086125520880481806747869536726059161996859358212525902.7771152590197144328620999e268",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(1932, "-6.1E234", Some(17342995149670495795UL), None)
  verify_log_float_text(
    1933,
    "62706813510717570345284262.45E255",
    Some(8807812578321514540UL),
    None,
  )
  verify_log_float_text(1934, "+8.5e-56", Some(3783213274879663727UL), None)
  verify_log_float_text(
    1935,
    "-5012544117231913953818293742.200737011736650045750827740455078700402499337972E257",
    Some(18089543033526011676UL),
    None,
  )
  verify_log_float_text(
    1936,
    "-666.9283746166671E116",
    Some(15607913354553929708UL),
    None,
  )
  verify_log_float_text(
    1937,
    "-12515832059.767513994507e-22",
    Some(13652104410785306007UL),
    None,
  )
  verify_log_float_text(
    1938,
    "-9681.9693729424489172782218139405848706154595561845013232805847e-89",
    Some(12558308767730626846UL),
    None,
  )
  verify_log_float_text(
    1939,
    "987721461.3E-70",
    Some(3694166611395859322UL),
    None,
  )
  verify_log_float_text(
    1940,
    "2.4703282292062327208828439643411068618252990130716238221279284125033775363510437593264991818081799618989828234772285886546332835517796989819938739800539093906315035659515570226392290858392449105184435931802849936536152500319370457678249219365623669863658480757001585769269903706311928279558551332927834338409351978015531246597263579574622766465272827220056374006485499977096599470454020828166226237857393450736339007967761930577506740176324673600968951340535537458516661134223766678604162159680461914467291840300530057530849048765391711386591646239524912623653881879636239373280423891018672348497668235089863388587925628302755995657524455507255189313690836254779186948667994968324049705821028513185451396213837722826145437693412532098591327667236328125E-324",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1941,
    "-2.4703282292062327208828439643411068618252990130716238221279284125033775363510437593264991818081799618989828234772285886546332835517796989819938739800539093906315035659515570226392290858392449105184435931802849936536152500319370457678249219365623669863658480757001585769269903706311928279558551332927834338409351978015531246597263579574622766465272827220056374006485499977096599470454020828166226237857393450736339007967761930577506740176324673600968951340535537458516661134223766678604162159680461914467291840300530057530849048765391711386591646239524912623653881879636239373280423891018672348497668235089863388587925628302755995657524455507255189313690836254779186948667994968324049705821028513185451396213837722826145437693412532098591327667236328125E-324",
    Some(9223372036854775808UL),
    None,
  )
  verify_log_float_text(
    1942,
    "2.470328229206232720882843964341106861825299013071623822127928412503377536351043759326499181808179961898982823477228588654633283551779698981993873980053909390631503565951557022639229085839244910518443593180284993653615250031937045767824921936562366986365848075700158576926990370631192827955855133292783433840935197801553124659726357957462276646527282722005637400648549997709659947045402082816622623785739345073633900796776193057750674017632467360096895134053553745851666113422376667860416215968046191446729184030053005753084904876539171138659164623952491262365388187963623937328042389101867234849766823508986338858792562830275599565752445550725518931369083625477918694866799496832404970582102851318545139621383772282614543769341253209859132766723632812500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-324",
    Some(1UL),
    None,
  )
  verify_log_float_text(
    1943,
    "-2.470328229206232720882843964341106861825299013071623822127928412503377536351043759326499181808179961898982823477228588654633283551779698981993873980053909390631503565951557022639229085839244910518443593180284993653615250031937045767824921936562366986365848075700158576926990370631192827955855133292783433840935197801553124659726357957462276646527282722005637400648549997709659947045402082816622623785739345073633900796776193057750674017632467360096895134053553745851666113422376667860416215968046191446729184030053005753084904876539171138659164623952491262365388187963623937328042389101867234849766823508986338858792562830275599565752445550725518931369083625477918694866799496832404970582102851318545139621383772282614543769341253209859132766723632812500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-324",
    Some(9223372036854775809UL),
    None,
  )
  verify_log_float_text(
    1944,
    "2.470328229206232720882843964341106861825299013071623822127928412503377536351043759326499181808179961898982823477228588654633283551779698981993873980053909390631503565951557022639229085839244910518443593180284993653615250031937045767824921936562366986365848075700158576926990370631192827955855133292783433840935197801553124659726357957462276646527282722005637400648549997709659947045402082816622623785739345073633900796776193057750674017632467360096895134053553745851666113422376667860416215968046191446729184030053005753084904876539171138659164623952491262365388187963623937328042389101867234849766823508986338858792562830275599565752445550725518931369083625477918694866799496832404970582102851318545139621383772282614543769341253209859132766723632812499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-324",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    1945,
    "-2.470328229206232720882843964341106861825299013071623822127928412503377536351043759326499181808179961898982823477228588654633283551779698981993873980053909390631503565951557022639229085839244910518443593180284993653615250031937045767824921936562366986365848075700158576926990370631192827955855133292783433840935197801553124659726357957462276646527282722005637400648549997709659947045402082816622623785739345073633900796776193057750674017632467360096895134053553745851666113422376667860416215968046191446729184030053005753084904876539171138659164623952491262365388187963623937328042389101867234849766823508986338858792562830275599565752445550725518931369083625477918694866799496832404970582102851318545139621383772282614543769341253209859132766723632812499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-324",
    Some(9223372036854775808UL),
    None,
  )
  verify_log_float_text(
    1946,
    "7.4109846876186981626485318930233205854758970392148714663837852375101326090531312779794975454245398856969484704316857659638998506553390969459816219401617281718945106978546710679176872575177347315553307795408549809608457500958111373034747658096871009590975442271004757307809711118935784838675653998783503015228055934046593739791790738723868299395818481660169122019456499931289798411362062484498678713572180352209017023903285791732520220528974020802906854021606612375549983402671300035812486479041385743401875520901590172592547146296175134159774938718574737870961645638908718119841271673056017045493004705269590165763776884908267986972573366521765567941072508764337560846003984904972149117463085539556354188641513168478436313080237596295773983001708984375E-324",
    Some(2UL),
    None,
  )
  verify_log_float_text(
    1947,
    "-7.4109846876186981626485318930233205854758970392148714663837852375101326090531312779794975454245398856969484704316857659638998506553390969459816219401617281718945106978546710679176872575177347315553307795408549809608457500958111373034747658096871009590975442271004757307809711118935784838675653998783503015228055934046593739791790738723868299395818481660169122019456499931289798411362062484498678713572180352209017023903285791732520220528974020802906854021606612375549983402671300035812486479041385743401875520901590172592547146296175134159774938718574737870961645638908718119841271673056017045493004705269590165763776884908267986972573366521765567941072508764337560846003984904972149117463085539556354188641513168478436313080237596295773983001708984375E-324",
    Some(9223372036854775810UL),
    None,
  )
  verify_log_float_text(
    1948,
    "7.410984687618698162648531893023320585475897039214871466383785237510132609053131277979497545424539885696948470431685765963899850655339096945981621940161728171894510697854671067917687257517734731555330779540854980960845750095811137303474765809687100959097544227100475730780971111893578483867565399878350301522805593404659373979179073872386829939581848166016912201945649993128979841136206248449867871357218035220901702390328579173252022052897402080290685402160661237554998340267130003581248647904138574340187552090159017259254714629617513415977493871857473787096164563890871811984127167305601704549300470526959016576377688490826798697257336652176556794107250876433756084600398490497214911746308553955635418864151316847843631308023759629577398300170898437500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-324",
    Some(2UL),
    None,
  )
  verify_log_float_text(
    1949,
    "-7.410984687618698162648531893023320585475897039214871466383785237510132609053131277979497545424539885696948470431685765963899850655339096945981621940161728171894510697854671067917687257517734731555330779540854980960845750095811137303474765809687100959097544227100475730780971111893578483867565399878350301522805593404659373979179073872386829939581848166016912201945649993128979841136206248449867871357218035220901702390328579173252022052897402080290685402160661237554998340267130003581248647904138574340187552090159017259254714629617513415977493871857473787096164563890871811984127167305601704549300470526959016576377688490826798697257336652176556794107250876433756084600398490497214911746308553955635418864151316847843631308023759629577398300170898437500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-324",
    Some(9223372036854775810UL),
    None,
  )
  verify_log_float_text(
    1950,
    "7.410984687618698162648531893023320585475897039214871466383785237510132609053131277979497545424539885696948470431685765963899850655339096945981621940161728171894510697854671067917687257517734731555330779540854980960845750095811137303474765809687100959097544227100475730780971111893578483867565399878350301522805593404659373979179073872386829939581848166016912201945649993128979841136206248449867871357218035220901702390328579173252022052897402080290685402160661237554998340267130003581248647904138574340187552090159017259254714629617513415977493871857473787096164563890871811984127167305601704549300470526959016576377688490826798697257336652176556794107250876433756084600398490497214911746308553955635418864151316847843631308023759629577398300170898437499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-324",
    Some(1UL),
    None,
  )
  verify_log_float_text(
    1951,
    "-7.410984687618698162648531893023320585475897039214871466383785237510132609053131277979497545424539885696948470431685765963899850655339096945981621940161728171894510697854671067917687257517734731555330779540854980960845750095811137303474765809687100959097544227100475730780971111893578483867565399878350301522805593404659373979179073872386829939581848166016912201945649993128979841136206248449867871357218035220901702390328579173252022052897402080290685402160661237554998340267130003581248647904138574340187552090159017259254714629617513415977493871857473787096164563890871811984127167305601704549300470526959016576377688490826798697257336652176556794107250876433756084600398490497214911746308553955635418864151316847843631308023759629577398300170898437499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-324",
    Some(9223372036854775809UL),
    None,
  )
}

///|
test "native log base float text group 61" {
  verify_log_float_text(
    1952,
    "1.23516411460311636044142198217055343091264950653581191106396420625168876817552187966324959090408998094949141173861429432731664177588984949099693699002695469531575178297577851131961454291962245525922179659014249682680762501596852288391246096828118349318292403785007928846349518531559641397792756664639171692046759890077656232986317897873113832326364136100281870032427499885482997352270104140831131189286967253681695039838809652887533700881623368004844756702677687292583305671118833393020810798402309572336459201502650287654245243826958556932958231197624563118269409398181196866402119455093361742488341175449316942939628141513779978287622277536275946568454181273895934743339974841620248529105142565927256981069188614130727188467062660492956638336181640625E-323",
    Some(2UL),
    None,
  )
  verify_log_float_text(
    1953,
    "-1.23516411460311636044142198217055343091264950653581191106396420625168876817552187966324959090408998094949141173861429432731664177588984949099693699002695469531575178297577851131961454291962245525922179659014249682680762501596852288391246096828118349318292403785007928846349518531559641397792756664639171692046759890077656232986317897873113832326364136100281870032427499885482997352270104140831131189286967253681695039838809652887533700881623368004844756702677687292583305671118833393020810798402309572336459201502650287654245243826958556932958231197624563118269409398181196866402119455093361742488341175449316942939628141513779978287622277536275946568454181273895934743339974841620248529105142565927256981069188614130727188467062660492956638336181640625E-323",
    Some(9223372036854775810UL),
    None,
  )
  verify_log_float_text(
    1954,
    "1.2351641146031163604414219821705534309126495065358119110639642062516887681755218796632495909040899809494914117386142943273166417758898494909969369900269546953157517829757785113196145429196224552592217965901424968268076250159685228839124609682811834931829240378500792884634951853155964139779275666463917169204675989007765623298631789787311383232636413610028187003242749988548299735227010414083113118928696725368169503983880965288753370088162336800484475670267768729258330567111883339302081079840230957233645920150265028765424524382695855693295823119762456311826940939818119686640211945509336174248834117544931694293962814151377997828762227753627594656845418127389593474333997484162024852910514256592725698106918861413072718846706266049295663833618164062500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-323",
    Some(3UL),
    None,
  )
  verify_log_float_text(
    1955,
    "-1.2351641146031163604414219821705534309126495065358119110639642062516887681755218796632495909040899809494914117386142943273166417758898494909969369900269546953157517829757785113196145429196224552592217965901424968268076250159685228839124609682811834931829240378500792884634951853155964139779275666463917169204675989007765623298631789787311383232636413610028187003242749988548299735227010414083113118928696725368169503983880965288753370088162336800484475670267768729258330567111883339302081079840230957233645920150265028765424524382695855693295823119762456311826940939818119686640211945509336174248834117544931694293962814151377997828762227753627594656845418127389593474333997484162024852910514256592725698106918861413072718846706266049295663833618164062500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-323",
    Some(9223372036854775811UL),
    None,
  )
  verify_log_float_text(
    1956,
    "1.2351641146031163604414219821705534309126495065358119110639642062516887681755218796632495909040899809494914117386142943273166417758898494909969369900269546953157517829757785113196145429196224552592217965901424968268076250159685228839124609682811834931829240378500792884634951853155964139779275666463917169204675989007765623298631789787311383232636413610028187003242749988548299735227010414083113118928696725368169503983880965288753370088162336800484475670267768729258330567111883339302081079840230957233645920150265028765424524382695855693295823119762456311826940939818119686640211945509336174248834117544931694293962814151377997828762227753627594656845418127389593474333997484162024852910514256592725698106918861413072718846706266049295663833618164062499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-323",
    Some(2UL),
    None,
  )
  verify_log_float_text(
    1957,
    "-1.2351641146031163604414219821705534309126495065358119110639642062516887681755218796632495909040899809494914117386142943273166417758898494909969369900269546953157517829757785113196145429196224552592217965901424968268076250159685228839124609682811834931829240378500792884634951853155964139779275666463917169204675989007765623298631789787311383232636413610028187003242749988548299735227010414083113118928696725368169503983880965288753370088162336800484475670267768729258330567111883339302081079840230957233645920150265028765424524382695855693295823119762456311826940939818119686640211945509336174248834117544931694293962814151377997828762227753627594656845418127389593474333997484162024852910514256592725698106918861413072718846706266049295663833618164062499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-323",
    Some(9223372036854775810UL),
    None,
  )
  verify_log_float_text(
    1958,
    "2.22507385850720113605740979670913197593481954635164564802342610972482222202107694551652952390813508791414915891303962110687008643869459464552765720740782062174337998814106326732925355228688137214901298112245145188984905722230728525513315575501591439747639798341180199932396254828901710708185069063066665599493827577257201576306269066333264756530000924588831643303777979186961204949739037782970490505108060994073026293712895895000358379996720725430436028407889577179615094551674824347103070260914462157228988025818254518032570701886087211312807951223342628836862232150377566662250398253433597456888442390026549819838548794829220689472168983109969836584681402285424333066033985088644580400103493397042756718644338377048603786162277173854562306587467901408672332763671875E-308",
    Some(4503599627370496UL),
    None,
  )
  verify_log_float_text(
    1959,
    "-2.22507385850720113605740979670913197593481954635164564802342610972482222202107694551652952390813508791414915891303962110687008643869459464552765720740782062174337998814106326732925355228688137214901298112245145188984905722230728525513315575501591439747639798341180199932396254828901710708185069063066665599493827577257201576306269066333264756530000924588831643303777979186961204949739037782970490505108060994073026293712895895000358379996720725430436028407889577179615094551674824347103070260914462157228988025818254518032570701886087211312807951223342628836862232150377566662250398253433597456888442390026549819838548794829220689472168983109969836584681402285424333066033985088644580400103493397042756718644338377048603786162277173854562306587467901408672332763671875E-308",
    Some(9227875636482146304UL),
    None,
  )
  verify_log_float_text(
    1960,
    "2.2250738585072011360574097967091319759348195463516456480234261097248222220210769455165295239081350879141491589130396211068700864386945946455276572074078206217433799881410632673292535522868813721490129811224514518898490572223072852551331557550159143974763979834118019993239625482890171070818506906306666559949382757725720157630626906633326475653000092458883164330377797918696120494973903778297049050510806099407302629371289589500035837999672072543043602840788957717961509455167482434710307026091446215722898802581825451803257070188608721131280795122334262883686223215037756666225039825343359745688844239002654981983854879482922068947216898310996983658468140228542433306603398508864458040010349339704275671864433837704860378616227717385456230658746790140867233276367187500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-308",
    Some(4503599627370496UL),
    None,
  )
  verify_log_float_text(
    1961,
    "-2.2250738585072011360574097967091319759348195463516456480234261097248222220210769455165295239081350879141491589130396211068700864386945946455276572074078206217433799881410632673292535522868813721490129811224514518898490572223072852551331557550159143974763979834118019993239625482890171070818506906306666559949382757725720157630626906633326475653000092458883164330377797918696120494973903778297049050510806099407302629371289589500035837999672072543043602840788957717961509455167482434710307026091446215722898802581825451803257070188608721131280795122334262883686223215037756666225039825343359745688844239002654981983854879482922068947216898310996983658468140228542433306603398508864458040010349339704275671864433837704860378616227717385456230658746790140867233276367187500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-308",
    Some(9227875636482146304UL),
    None,
  )
  verify_log_float_text(
    1962,
    "2.2250738585072011360574097967091319759348195463516456480234261097248222220210769455165295239081350879141491589130396211068700864386945946455276572074078206217433799881410632673292535522868813721490129811224514518898490572223072852551331557550159143974763979834118019993239625482890171070818506906306666559949382757725720157630626906633326475653000092458883164330377797918696120494973903778297049050510806099407302629371289589500035837999672072543043602840788957717961509455167482434710307026091446215722898802581825451803257070188608721131280795122334262883686223215037756666225039825343359745688844239002654981983854879482922068947216898310996983658468140228542433306603398508864458040010349339704275671864433837704860378616227717385456230658746790140867233276367187499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-308",
    Some(4503599627370495UL),
    None,
  )
  verify_log_float_text(
    1963,
    "-2.2250738585072011360574097967091319759348195463516456480234261097248222220210769455165295239081350879141491589130396211068700864386945946455276572074078206217433799881410632673292535522868813721490129811224514518898490572223072852551331557550159143974763979834118019993239625482890171070818506906306666559949382757725720157630626906633326475653000092458883164330377797918696120494973903778297049050510806099407302629371289589500035837999672072543043602840788957717961509455167482434710307026091446215722898802581825451803257070188608721131280795122334262883686223215037756666225039825343359745688844239002654981983854879482922068947216898310996983658468140228542433306603398508864458040010349339704275671864433837704860378616227717385456230658746790140867233276367187499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-308",
    Some(9227875636482146303UL),
    None,
  )
  verify_log_float_text(
    1964,
    "2.22507385850720163012305563795567615250361241457301801308322872404958664760675944619203679411688695321398552054903200090343478188441232557218436756334761702051817599892294139362996674259828589999483014897143355557856769327930601597818316214242506796246078529588519927249357768832073249247992481686923224716596493432925878395010225097395757951057160073834364573849432419299709217920738991976169431413149717326525502008499797367678374315520581880443916381057236779117517775622749741380425338708447819365553307386742083452616251302946202273010905482006765402020154711200202813970014157525912344017736224427371246815175018974555997865323425588621961151633592416795802960447706494647018477736093430045142168360701364747951396213837722826145437693412532098591327667236328125E-308",
    Some(4503599627370496UL),
    None,
  )
  verify_log_float_text(
    1965,
    "-2.22507385850720163012305563795567615250361241457301801308322872404958664760675944619203679411688695321398552054903200090343478188441232557218436756334761702051817599892294139362996674259828589999483014897143355557856769327930601597818316214242506796246078529588519927249357768832073249247992481686923224716596493432925878395010225097395757951057160073834364573849432419299709217920738991976169431413149717326525502008499797367678374315520581880443916381057236779117517775622749741380425338708447819365553307386742083452616251302946202273010905482006765402020154711200202813970014157525912344017736224427371246815175018974555997865323425588621961151633592416795802960447706494647018477736093430045142168360701364747951396213837722826145437693412532098591327667236328125E-308",
    Some(9227875636482146304UL),
    None,
  )
  verify_log_float_text(
    1966,
    "2.2250738585072016301230556379556761525036124145730180130832287240495866476067594461920367941168869532139855205490320009034347818844123255721843675633476170205181759989229413936299667425982858999948301489714335555785676932793060159781831621424250679624607852958851992724935776883207324924799248168692322471659649343292587839501022509739575795105716007383436457384943241929970921792073899197616943141314971732652550200849979736767837431552058188044391638105723677911751777562274974138042533870844781936555330738674208345261625130294620227301090548200676540202015471120020281397001415752591234401773622442737124681517501897455599786532342558862196115163359241679580296044770649464701847773609343004514216836070136474795139621383772282614543769341253209859132766723632812500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-308",
    Some(4503599627370497UL),
    None,
  )
  verify_log_float_text(
    1967,
    "-2.2250738585072016301230556379556761525036124145730180130832287240495866476067594461920367941168869532139855205490320009034347818844123255721843675633476170205181759989229413936299667425982858999948301489714335555785676932793060159781831621424250679624607852958851992724935776883207324924799248168692322471659649343292587839501022509739575795105716007383436457384943241929970921792073899197616943141314971732652550200849979736767837431552058188044391638105723677911751777562274974138042533870844781936555330738674208345261625130294620227301090548200676540202015471120020281397001415752591234401773622442737124681517501897455599786532342558862196115163359241679580296044770649464701847773609343004514216836070136474795139621383772282614543769341253209859132766723632812500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-308",
    Some(9227875636482146305UL),
    None,
  )
  verify_log_float_text(
    1968,
    "2.2250738585072016301230556379556761525036124145730180130832287240495866476067594461920367941168869532139855205490320009034347818844123255721843675633476170205181759989229413936299667425982858999948301489714335555785676932793060159781831621424250679624607852958851992724935776883207324924799248168692322471659649343292587839501022509739575795105716007383436457384943241929970921792073899197616943141314971732652550200849979736767837431552058188044391638105723677911751777562274974138042533870844781936555330738674208345261625130294620227301090548200676540202015471120020281397001415752591234401773622442737124681517501897455599786532342558862196115163359241679580296044770649464701847773609343004514216836070136474795139621383772282614543769341253209859132766723632812499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-308",
    Some(4503599627370496UL),
    None,
  )
  verify_log_float_text(
    1969,
    "-2.2250738585072016301230556379556761525036124145730180130832287240495866476067594461920367941168869532139855205490320009034347818844123255721843675633476170205181759989229413936299667425982858999948301489714335555785676932793060159781831621424250679624607852958851992724935776883207324924799248168692322471659649343292587839501022509739575795105716007383436457384943241929970921792073899197616943141314971732652550200849979736767837431552058188044391638105723677911751777562274974138042533870844781936555330738674208345261625130294620227301090548200676540202015471120020281397001415752591234401773622442737124681517501897455599786532342558862196115163359241679580296044770649464701847773609343004514216836070136474795139621383772282614543769341253209859132766723632812499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-308",
    Some(9227875636482146304UL),
    None,
  )
  verify_log_float_text(
    1970,
    "0.999999999999999944488848768742172978818416595458984375",
    Some(4607182418800017408UL),
    None,
  )
  verify_log_float_text(
    1971,
    "-0.999999999999999944488848768742172978818416595458984375",
    Some(13830554455654793216UL),
    None,
  )
  verify_log_float_text(
    1972,
    "0.999999999999999944488848768742172978818416595458984375000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(4607182418800017408UL),
    None,
  )
  verify_log_float_text(
    1973,
    "-0.999999999999999944488848768742172978818416595458984375000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(13830554455654793216UL),
    None,
  )
  verify_log_float_text(
    1974,
    "0.999999999999999944488848768742172978818416595458984374999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(4607182418800017407UL),
    None,
  )
  verify_log_float_text(
    1975,
    "-0.999999999999999944488848768742172978818416595458984374999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(13830554455654793215UL),
    None,
  )
  verify_log_float_text(
    1976,
    "1.00000000000000011102230246251565404236316680908203125",
    Some(4607182418800017408UL),
    None,
  )
  verify_log_float_text(
    1977,
    "-1.00000000000000011102230246251565404236316680908203125",
    Some(13830554455654793216UL),
    None,
  )
  verify_log_float_text(
    1978,
    "1.000000000000000111022302462515654042363166809082031250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(4607182418800017409UL),
    None,
  )
  verify_log_float_text(
    1979,
    "-1.000000000000000111022302462515654042363166809082031250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(13830554455654793217UL),
    None,
  )
  verify_log_float_text(
    1980,
    "1.000000000000000111022302462515654042363166809082031249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(4607182418800017408UL),
    None,
  )
  verify_log_float_text(
    1981,
    "-1.000000000000000111022302462515654042363166809082031249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(13830554455654793216UL),
    None,
  )
  verify_log_float_text(
    1982,
    "1.00000000000000033306690738754696212708950042724609375",
    Some(4607182418800017410UL),
    None,
  )
  verify_log_float_text(
    1983,
    "-1.00000000000000033306690738754696212708950042724609375",
    Some(13830554455654793218UL),
    None,
  )
}

///|
test "native log base float text group 62" {
  verify_log_float_text(
    1984,
    "1.000000000000000333066907387546962127089500427246093750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(4607182418800017410UL),
    None,
  )
  verify_log_float_text(
    1985,
    "-1.000000000000000333066907387546962127089500427246093750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(13830554455654793218UL),
    None,
  )
  verify_log_float_text(
    1986,
    "1.000000000000000333066907387546962127089500427246093749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(4607182418800017409UL),
    None,
  )
  verify_log_float_text(
    1987,
    "-1.000000000000000333066907387546962127089500427246093749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(13830554455654793217UL),
    None,
  )
  verify_log_float_text(
    1988,
    "179769313486231560835325876058105298516207002341652166261661174625869553267292326574530099287946549246750631490335877017522087105926987962906277604735569213290190919152394180476217125334960946356387261286640198029037799514183602981511756283727771403830521483963923935633133642802139091669457927874464075218944",
    Some(9218868437227405310UL),
    None,
  )
  verify_log_float_text(
    1989,
    "-179769313486231560835325876058105298516207002341652166261661174625869553267292326574530099287946549246750631490335877017522087105926987962906277604735569213290190919152394180476217125334960946356387261286640198029037799514183602981511756283727771403830521483963923935633133642802139091669457927874464075218944",
    Some(18442240474082181118UL),
    None,
  )
  verify_log_float_text(
    1990,
    "179769313486231560835325876058105298516207002341652166261661174625869553267292326574530099287946549246750631490335877017522087105926987962906277604735569213290190919152394180476217125334960946356387261286640198029037799514183602981511756283727771403830521483963923935633133642802139091669457927874464075218944.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(9218868437227405311UL),
    None,
  )
  verify_log_float_text(
    1991,
    "-179769313486231560835325876058105298516207002341652166261661174625869553267292326574530099287946549246750631490335877017522087105926987962906277604735569213290190919152394180476217125334960946356387261286640198029037799514183602981511756283727771403830521483963923935633133642802139091669457927874464075218944.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(18442240474082181119UL),
    None,
  )
  verify_log_float_text(
    1992,
    "179769313486231560835325876058105298516207002341652166261661174625869553267292326574530099287946549246750631490335877017522087105926987962906277604735569213290190919152394180476217125334960946356387261286640198029037799514183602981511756283727771403830521483963923935633133642802139091669457927874464075218943.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(9218868437227405310UL),
    None,
  )
  verify_log_float_text(
    1993,
    "-179769313486231560835325876058105298516207002341652166261661174625869553267292326574530099287946549246750631490335877017522087105926987962906277604735569213290190919152394180476217125334960946356387261286640198029037799514183602981511756283727771403830521483963923935633133642802139091669457927874464075218943.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(18442240474082181118UL),
    None,
  )
  verify_log_float_text(
    1994,
    "1826.7998788068251769800554029643535614013671875",
    Some(4655749166279823440UL),
    None,
  )
  verify_log_float_text(
    1995,
    "-1826.7998788068251769800554029643535614013671875",
    Some(13879121203134599248UL),
    None,
  )
  verify_log_float_text(
    1996,
    "1826.799878806825176980055402964353561401367187500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(4655749166279823440UL),
    None,
  )
  verify_log_float_text(
    1997,
    "-1826.799878806825176980055402964353561401367187500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(13879121203134599248UL),
    None,
  )
  verify_log_float_text(
    1998,
    "1826.799878806825176980055402964353561401367187499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(4655749166279823439UL),
    None,
  )
  verify_log_float_text(
    1999,
    "-1826.799878806825176980055402964353561401367187499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(13879121203134599247UL),
    None,
  )
  verify_log_float_text(
    2000,
    "1.1736932172160268995509631652661713237500853754363470462656759744693423668558668069436866681208467104446935280748220975510776042938232421875E-37",
    Some(4054356938823976218UL),
    None,
  )
  verify_log_float_text(
    2001,
    "-1.1736932172160268995509631652661713237500853754363470462656759744693423668558668069436866681208467104446935280748220975510776042938232421875E-37",
    Some(13277728975678752026UL),
    None,
  )
  verify_log_float_text(
    2002,
    "1.17369321721602689955096316526617132375008537543634704626567597446934236685586680694368666812084671044469352807482209755107760429382324218750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-37",
    Some(4054356938823976218UL),
    None,
  )
  verify_log_float_text(
    2003,
    "-1.17369321721602689955096316526617132375008537543634704626567597446934236685586680694368666812084671044469352807482209755107760429382324218750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-37",
    Some(13277728975678752026UL),
    None,
  )
  verify_log_float_text(
    2004,
    "1.17369321721602689955096316526617132375008537543634704626567597446934236685586680694368666812084671044469352807482209755107760429382324218749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-37",
    Some(4054356938823976217UL),
    None,
  )
  verify_log_float_text(
    2005,
    "-1.17369321721602689955096316526617132375008537543634704626567597446934236685586680694368666812084671044469352807482209755107760429382324218749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-37",
    Some(13277728975678752025UL),
    None,
  )
  verify_log_float_text(
    2006,
    "1.601004613321359096638166871023266618101235754602009750156386967517068445432528984251919599455771139857666575524871932118045703478811211282872104196224650170550937864133986233920496859693963224775229602019092333042078851465258678949148491466062871103950990726501256629344008640309372217079584339989856948980314952918443594914404617434001288264525348555479143937165597082027543315288557774123312245507144641056810624716467566672762358592411217738366733408143472868062106166168022896283983614135906088219524497193342604806076678869430907070636749267578125E-215",
    Some(1393322656800208544UL),
    None,
  )
  verify_log_float_text(
    2007,
    "-1.601004613321359096638166871023266618101235754602009750156386967517068445432528984251919599455771139857666575524871932118045703478811211282872104196224650170550937864133986233920496859693963224775229602019092333042078851465258678949148491466062871103950990726501256629344008640309372217079584339989856948980314952918443594914404617434001288264525348555479143937165597082027543315288557774123312245507144641056810624716467566672762358592411217738366733408143472868062106166168022896283983614135906088219524497193342604806076678869430907070636749267578125E-215",
    Some(10616694693654984352UL),
    None,
  )
  verify_log_float_text(
    2008,
    "1.6010046133213590966381668710232666181012357546020097501563869675170684454325289842519195994557711398576665755248719321180457034788112112828721041962246501705509378641339862339204968596939632247752296020190923330420788514652586789491484914660628711039509907265012566293440086403093722170795843399898569489803149529184435949144046174340012882645253485554791439371655970820275433152885577741233122455071446410568106247164675666727623585924112177383667334081434728680621061661680228962839836141359060882195244971933426048060766788694309070706367492675781250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-215",
    Some(1393322656800208545UL),
    None,
  )
  verify_log_float_text(
    2009,
    "-1.6010046133213590966381668710232666181012357546020097501563869675170684454325289842519195994557711398576665755248719321180457034788112112828721041962246501705509378641339862339204968596939632247752296020190923330420788514652586789491484914660628711039509907265012566293440086403093722170795843399898569489803149529184435949144046174340012882645253485554791439371655970820275433152885577741233122455071446410568106247164675666727623585924112177383667334081434728680621061661680228962839836141359060882195244971933426048060766788694309070706367492675781250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-215",
    Some(10616694693654984353UL),
    None,
  )
  verify_log_float_text(
    2010,
    "1.6010046133213590966381668710232666181012357546020097501563869675170684454325289842519195994557711398576665755248719321180457034788112112828721041962246501705509378641339862339204968596939632247752296020190923330420788514652586789491484914660628711039509907265012566293440086403093722170795843399898569489803149529184435949144046174340012882645253485554791439371655970820275433152885577741233122455071446410568106247164675666727623585924112177383667334081434728680621061661680228962839836141359060882195244971933426048060766788694309070706367492675781249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-215",
    Some(1393322656800208544UL),
    None,
  )
  verify_log_float_text(
    2011,
    "-1.6010046133213590966381668710232666181012357546020097501563869675170684454325289842519195994557711398576665755248719321180457034788112112828721041962246501705509378641339862339204968596939632247752296020190923330420788514652586789491484914660628711039509907265012566293440086403093722170795843399898569489803149529184435949144046174340012882645253485554791439371655970820275433152885577741233122455071446410568106247164675666727623585924112177383667334081434728680621061661680228962839836141359060882195244971933426048060766788694309070706367492675781249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-215",
    Some(10616694693654984352UL),
    None,
  )
  verify_log_float_text(
    2012,
    "1.05403858457561028991255451561333548489305541294219096799040540657751702272717744050937273490588628851270727916273761326182386513866270172988556081371258610346330897300504148006439208984375E-58",
    Some(3739443531023967040UL),
    None,
  )
  verify_log_float_text(
    2013,
    "-1.05403858457561028991255451561333548489305541294219096799040540657751702272717744050937273490588628851270727916273761326182386513866270172988556081371258610346330897300504148006439208984375E-58",
    Some(12962815567878742848UL),
    None,
  )
  verify_log_float_text(
    2014,
    "1.05403858457561028991255451561333548489305541294219096799040540657751702272717744050937273490588628851270727916273761326182386513866270172988556081371258610346330897300504148006439208984375000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-58",
    Some(3739443531023967040UL),
    None,
  )
  verify_log_float_text(
    2015,
    "-1.05403858457561028991255451561333548489305541294219096799040540657751702272717744050937273490588628851270727916273761326182386513866270172988556081371258610346330897300504148006439208984375000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-58",
    Some(12962815567878742848UL),
    None,
  )
}

///|
test "native log base float text group 63" {
  verify_log_float_text(
    2016,
    "1.05403858457561028991255451561333548489305541294219096799040540657751702272717744050937273490588628851270727916273761326182386513866270172988556081371258610346330897300504148006439208984374999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-58",
    Some(3739443531023967039UL),
    None,
  )
  verify_log_float_text(
    2017,
    "-1.05403858457561028991255451561333548489305541294219096799040540657751702272717744050937273490588628851270727916273761326182386513866270172988556081371258610346330897300504148006439208984374999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-58",
    Some(12962815567878742847UL),
    None,
  )
  verify_log_float_text(
    2018,
    "81546467125761365275922565193402252076096935937805804860941802922197482084334967004220824626073343465881600",
    Some(6206460677250237880UL),
    None,
  )
  verify_log_float_text(
    2019,
    "-81546467125761365275922565193402252076096935937805804860941802922197482084334967004220824626073343465881600",
    Some(15429832714105013688UL),
    None,
  )
  verify_log_float_text(
    2020,
    "81546467125761365275922565193402252076096935937805804860941802922197482084334967004220824626073343465881600.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(6206460677250237880UL),
    None,
  )
  verify_log_float_text(
    2021,
    "-81546467125761365275922565193402252076096935937805804860941802922197482084334967004220824626073343465881600.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(15429832714105013688UL),
    None,
  )
  verify_log_float_text(
    2022,
    "81546467125761365275922565193402252076096935937805804860941802922197482084334967004220824626073343465881599.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(6206460677250237879UL),
    None,
  )
  verify_log_float_text(
    2023,
    "-81546467125761365275922565193402252076096935937805804860941802922197482084334967004220824626073343465881599.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(15429832714105013687UL),
    None,
  )
  verify_log_float_text(
    2024,
    "2.3053474127035061394620057803576130904824934302952799073392633728650012459750480176138732194746143693128526656199766030082765056227149358561577248460109629117111007534646205385797657072544097900390625E-63",
    Some(3669968608838926220UL),
    None,
  )
  verify_log_float_text(
    2025,
    "-2.3053474127035061394620057803576130904824934302952799073392633728650012459750480176138732194746143693128526656199766030082765056227149358561577248460109629117111007534646205385797657072544097900390625E-63",
    Some(12893340645693702028UL),
    None,
  )
  verify_log_float_text(
    2026,
    "2.305347412703506139462005780357613090482493430295279907339263372865001245975048017613873219474614369312852665619976603008276505622714935856157724846010962911711100753464620538579765707254409790039062500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-63",
    Some(3669968608838926221UL),
    None,
  )
  verify_log_float_text(
    2027,
    "-2.305347412703506139462005780357613090482493430295279907339263372865001245975048017613873219474614369312852665619976603008276505622714935856157724846010962911711100753464620538579765707254409790039062500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-63",
    Some(12893340645693702029UL),
    None,
  )
  verify_log_float_text(
    2028,
    "2.305347412703506139462005780357613090482493430295279907339263372865001245975048017613873219474614369312852665619976603008276505622714935856157724846010962911711100753464620538579765707254409790039062499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-63",
    Some(3669968608838926220UL),
    None,
  )
  verify_log_float_text(
    2029,
    "-2.305347412703506139462005780357613090482493430295279907339263372865001245975048017613873219474614369312852665619976603008276505622714935856157724846010962911711100753464620538579765707254409790039062499999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-63",
    Some(12893340645693702028UL),
    None,
  )
  verify_log_float_text(
    2030,
    "2779067192819877999874681480549524612129928369477017510293918146911315551067623571417985539943969062912",
    Some(6139490742642694292UL),
    None,
  )
  verify_log_float_text(
    2031,
    "-2779067192819877999874681480549524612129928369477017510293918146911315551067623571417985539943969062912",
    Some(15362862779497470100UL),
    None,
  )
  verify_log_float_text(
    2032,
    "2779067192819877999874681480549524612129928369477017510293918146911315551067623571417985539943969062912.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(6139490742642694292UL),
    None,
  )
  verify_log_float_text(
    2033,
    "-2779067192819877999874681480549524612129928369477017510293918146911315551067623571417985539943969062912.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(15362862779497470100UL),
    None,
  )
  verify_log_float_text(
    2034,
    "2779067192819877999874681480549524612129928369477017510293918146911315551067623571417985539943969062911.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(6139490742642694291UL),
    None,
  )
  verify_log_float_text(
    2035,
    "-2779067192819877999874681480549524612129928369477017510293918146911315551067623571417985539943969062911.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(15362862779497470099UL),
    None,
  )
  verify_log_float_text(
    2036,
    "114555461880760812767116873882265528566614674925056551371994861187984718992923499209687040",
    Some(5939345220961934924UL),
    None,
  )
  verify_log_float_text(
    2037,
    "-114555461880760812767116873882265528566614674925056551371994861187984718992923499209687040",
    Some(15162717257816710732UL),
    None,
  )
  verify_log_float_text(
    2038,
    "114555461880760812767116873882265528566614674925056551371994861187984718992923499209687040.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(5939345220961934925UL),
    None,
  )
  verify_log_float_text(
    2039,
    "-114555461880760812767116873882265528566614674925056551371994861187984718992923499209687040.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(15162717257816710733UL),
    None,
  )
  verify_log_float_text(
    2040,
    "114555461880760812767116873882265528566614674925056551371994861187984718992923499209687039.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(5939345220961934924UL),
    None,
  )
  verify_log_float_text(
    2041,
    "-114555461880760812767116873882265528566614674925056551371994861187984718992923499209687039.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(15162717257816710732UL),
    None,
  )
  verify_log_float_text(
    2042,
    "15209052154426242615902097457075047108362955230084518271801504170027821992055509748986758698689068989728072837303498267769885864828839517453318995230901242732686051339306257525600050018911000377296202069458766961224935051902661024361420679309949629460110100543666361545398041968640",
    Some(8798573326764424440UL),
    None,
  )
  verify_log_float_text(
    2043,
    "-15209052154426242615902097457075047108362955230084518271801504170027821992055509748986758698689068989728072837303498267769885864828839517453318995230901242732686051339306257525600050018911000377296202069458766961224935051902661024361420679309949629460110100543666361545398041968640",
    Some(18021945363619200248UL),
    None,
  )
  verify_log_float_text(
    2044,
    "15209052154426242615902097457075047108362955230084518271801504170027821992055509748986758698689068989728072837303498267769885864828839517453318995230901242732686051339306257525600050018911000377296202069458766961224935051902661024361420679309949629460110100543666361545398041968640.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(8798573326764424440UL),
    None,
  )
  verify_log_float_text(
    2045,
    "-15209052154426242615902097457075047108362955230084518271801504170027821992055509748986758698689068989728072837303498267769885864828839517453318995230901242732686051339306257525600050018911000377296202069458766961224935051902661024361420679309949629460110100543666361545398041968640.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(18021945363619200248UL),
    None,
  )
  verify_log_float_text(
    2046,
    "15209052154426242615902097457075047108362955230084518271801504170027821992055509748986758698689068989728072837303498267769885864828839517453318995230901242732686051339306257525600050018911000377296202069458766961224935051902661024361420679309949629460110100543666361545398041968639.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(8798573326764424439UL),
    None,
  )
  verify_log_float_text(
    2047,
    "-15209052154426242615902097457075047108362955230084518271801504170027821992055509748986758698689068989728072837303498267769885864828839517453318995230901242732686051339306257525600050018911000377296202069458766961224935051902661024361420679309949629460110100543666361545398041968639.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(18021945363619200247UL),
    None,
  )
}

///|
test "native log base float text group 64" {
  verify_log_float_text(
    2048,
    "7.6940925103923970660822091073398111486371452414612367591579526068472779322281253334520452817629639269000875453368501021577806533123484673618464314519458681411014464666000220853794020351746559394213900115902489847850062205388840195711480966370097940690188364537369301391653336794361875522281694335687421582685118155325359189118459991752133405690830355450689787109274971441093297914711712221384376038547023018758279506100204623873788740216258969372908540398230978035486824782549561701701659858918289503124548660992311778493876496272832847290067179163971006676121383440517220689322463923181084331354066704876983549746555909673525118288420941520105005124746950173367006682908433143647989627373379064971536944739227692480199038982391357421875E-295",
    Some(207010618666655728UL),
    None,
  )
  verify_log_float_text(
    2049,
    "-7.6940925103923970660822091073398111486371452414612367591579526068472779322281253334520452817629639269000875453368501021577806533123484673618464314519458681411014464666000220853794020351746559394213900115902489847850062205388840195711480966370097940690188364537369301391653336794361875522281694335687421582685118155325359189118459991752133405690830355450689787109274971441093297914711712221384376038547023018758279506100204623873788740216258969372908540398230978035486824782549561701701659858918289503124548660992311778493876496272832847290067179163971006676121383440517220689322463923181084331354066704876983549746555909673525118288420941520105005124746950173367006682908433143647989627373379064971536944739227692480199038982391357421875E-295",
    Some(9430382655521431536UL),
    None,
  )
  verify_log_float_text(
    2050,
    "7.69409251039239706608220910733981114863714524146123675915795260684727793222812533345204528176296392690008754533685010215778065331234846736184643145194586814110144646660002208537940203517465593942139001159024898478500622053888401957114809663700979406901883645373693013916533367943618755222816943356874215826851181553253591891184599917521334056908303554506897871092749714410932979147117122213843760385470230187582795061002046238737887402162589693729085403982309780354868247825495617017016598589182895031245486609923117784938764962728328472900671791639710066761213834405172206893224639231810843313540667048769835497465559096735251182884209415201050051247469501733670066829084331436479896273733790649715369447392276924801990389823913574218750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-295",
    Some(207010618666655728UL),
    None,
  )
  verify_log_float_text(
    2051,
    "-7.69409251039239706608220910733981114863714524146123675915795260684727793222812533345204528176296392690008754533685010215778065331234846736184643145194586814110144646660002208537940203517465593942139001159024898478500622053888401957114809663700979406901883645373693013916533367943618755222816943356874215826851181553253591891184599917521334056908303554506897871092749714410932979147117122213843760385470230187582795061002046238737887402162589693729085403982309780354868247825495617017016598589182895031245486609923117784938764962728328472900671791639710066761213834405172206893224639231810843313540667048769835497465559096735251182884209415201050051247469501733670066829084331436479896273733790649715369447392276924801990389823913574218750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-295",
    Some(9430382655521431536UL),
    None,
  )
  verify_log_float_text(
    2052,
    "7.69409251039239706608220910733981114863714524146123675915795260684727793222812533345204528176296392690008754533685010215778065331234846736184643145194586814110144646660002208537940203517465593942139001159024898478500622053888401957114809663700979406901883645373693013916533367943618755222816943356874215826851181553253591891184599917521334056908303554506897871092749714410932979147117122213843760385470230187582795061002046238737887402162589693729085403982309780354868247825495617017016598589182895031245486609923117784938764962728328472900671791639710066761213834405172206893224639231810843313540667048769835497465559096735251182884209415201050051247469501733670066829084331436479896273733790649715369447392276924801990389823913574218749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-295",
    Some(207010618666655727UL),
    None,
  )
  verify_log_float_text(
    2053,
    "-7.69409251039239706608220910733981114863714524146123675915795260684727793222812533345204528176296392690008754533685010215778065331234846736184643145194586814110144646660002208537940203517465593942139001159024898478500622053888401957114809663700979406901883645373693013916533367943618755222816943356874215826851181553253591891184599917521334056908303554506897871092749714410932979147117122213843760385470230187582795061002046238737887402162589693729085403982309780354868247825495617017016598589182895031245486609923117784938764962728328472900671791639710066761213834405172206893224639231810843313540667048769835497465559096735251182884209415201050051247469501733670066829084331436479896273733790649715369447392276924801990389823913574218749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-295",
    Some(9430382655521431535UL),
    None,
  )
  verify_log_float_text(
    2054,
    "1.923538909241491980931429798928151814119371503535663789418744337519228973929961111488662339752409025095403194427490234375E-29",
    Some(4177196671120191942UL),
    None,
  )
  verify_log_float_text(
    2055,
    "-1.923538909241491980931429798928151814119371503535663789418744337519228973929961111488662339752409025095403194427490234375E-29",
    Some(13400568707974967750UL),
    None,
  )
  verify_log_float_text(
    2056,
    "1.9235389092414919809314297989281518141193715035356637894187443375192289739299611114886623397524090250954031944274902343750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-29",
    Some(4177196671120191942UL),
    None,
  )
  verify_log_float_text(
    2057,
    "-1.9235389092414919809314297989281518141193715035356637894187443375192289739299611114886623397524090250954031944274902343750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-29",
    Some(13400568707974967750UL),
    None,
  )
  verify_log_float_text(
    2058,
    "1.9235389092414919809314297989281518141193715035356637894187443375192289739299611114886623397524090250954031944274902343749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-29",
    Some(4177196671120191941UL),
    None,
  )
  verify_log_float_text(
    2059,
    "-1.9235389092414919809314297989281518141193715035356637894187443375192289739299611114886623397524090250954031944274902343749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-29",
    Some(13400568707974967749UL),
    None,
  )
  verify_log_float_text(
    2060,
    "1.91641558263875500698781566297256723524411565365881677128678388178235794424864450274451979897090636663653112543175337978634459233362030466635179009003985606537459025823470482983254568565339203585491463987039517947589459842837177737119172497767681519079150874428763423085318286950824860406074124487467997191874977194946370252329254303193039850599492135520133002726700616870781382851112761093913549631846342858308946131778205227156087556166004556819756897043281907796635965392371713236054278322582819899713589859371096040981496494048553582539104848955598150959741426437032973950636005611158907413482666015625E-238",
    Some(1050455239424034766UL),
    None,
  )
  verify_log_float_text(
    2061,
    "-1.91641558263875500698781566297256723524411565365881677128678388178235794424864450274451979897090636663653112543175337978634459233362030466635179009003985606537459025823470482983254568565339203585491463987039517947589459842837177737119172497767681519079150874428763423085318286950824860406074124487467997191874977194946370252329254303193039850599492135520133002726700616870781382851112761093913549631846342858308946131778205227156087556166004556819756897043281907796635965392371713236054278322582819899713589859371096040981496494048553582539104848955598150959741426437032973950636005611158907413482666015625E-238",
    Some(10273827276278810574UL),
    None,
  )
  verify_log_float_text(
    2062,
    "1.91641558263875500698781566297256723524411565365881677128678388178235794424864450274451979897090636663653112543175337978634459233362030466635179009003985606537459025823470482983254568565339203585491463987039517947589459842837177737119172497767681519079150874428763423085318286950824860406074124487467997191874977194946370252329254303193039850599492135520133002726700616870781382851112761093913549631846342858308946131778205227156087556166004556819756897043281907796635965392371713236054278322582819899713589859371096040981496494048553582539104848955598150959741426437032973950636005611158907413482666015625000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-238",
    Some(1050455239424034767UL),
    None,
  )
  verify_log_float_text(
    2063,
    "-1.91641558263875500698781566297256723524411565365881677128678388178235794424864450274451979897090636663653112543175337978634459233362030466635179009003985606537459025823470482983254568565339203585491463987039517947589459842837177737119172497767681519079150874428763423085318286950824860406074124487467997191874977194946370252329254303193039850599492135520133002726700616870781382851112761093913549631846342858308946131778205227156087556166004556819756897043281907796635965392371713236054278322582819899713589859371096040981496494048553582539104848955598150959741426437032973950636005611158907413482666015625000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-238",
    Some(10273827276278810575UL),
    None,
  )
  verify_log_float_text(
    2064,
    "1.91641558263875500698781566297256723524411565365881677128678388178235794424864450274451979897090636663653112543175337978634459233362030466635179009003985606537459025823470482983254568565339203585491463987039517947589459842837177737119172497767681519079150874428763423085318286950824860406074124487467997191874977194946370252329254303193039850599492135520133002726700616870781382851112761093913549631846342858308946131778205227156087556166004556819756897043281907796635965392371713236054278322582819899713589859371096040981496494048553582539104848955598150959741426437032973950636005611158907413482666015624999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-238",
    Some(1050455239424034766UL),
    None,
  )
  verify_log_float_text(
    2065,
    "-1.91641558263875500698781566297256723524411565365881677128678388178235794424864450274451979897090636663653112543175337978634459233362030466635179009003985606537459025823470482983254568565339203585491463987039517947589459842837177737119172497767681519079150874428763423085318286950824860406074124487467997191874977194946370252329254303193039850599492135520133002726700616870781382851112761093913549631846342858308946131778205227156087556166004556819756897043281907796635965392371713236054278322582819899713589859371096040981496494048553582539104848955598150959741426437032973950636005611158907413482666015624999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-238",
    Some(10273827276278810574UL),
    None,
  )
  verify_log_float_text(
    2066,
    "31163102880965.283203125",
    Some(4808814957114475848UL),
    None,
  )
  verify_log_float_text(
    2067,
    "-31163102880965.283203125",
    Some(14032186993969251656UL),
    None,
  )
  verify_log_float_text(
    2068,
    "31163102880965.283203125000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(4808814957114475849UL),
    None,
  )
  verify_log_float_text(
    2069,
    "-31163102880965.283203125000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(14032186993969251657UL),
    None,
  )
  verify_log_float_text(
    2070,
    "31163102880965.283203124999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(4808814957114475848UL),
    None,
  )
  verify_log_float_text(
    2071,
    "-31163102880965.283203124999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(14032186993969251656UL),
    None,
  )
  verify_log_float_text(
    2072,
    "9.05699423255873897429807641732316978090056023369862975543234692606672463393217154587604999882670489625514469043067516923031292233202410229349962412458591973013752183092634110297828423984416437812415764781275038723236530011195550739245001109347429625646353161779591457348104569141638615889023368431723849368846120111431474697383237071335315704345703125E-129",
    Some(2691213792566743252UL),
    None,
  )
  verify_log_float_text(
    2073,
    "-9.05699423255873897429807641732316978090056023369862975543234692606672463393217154587604999882670489625514469043067516923031292233202410229349962412458591973013752183092634110297828423984416437812415764781275038723236530011195550739245001109347429625646353161779591457348104569141638615889023368431723849368846120111431474697383237071335315704345703125E-129",
    Some(11914585829421519060UL),
    None,
  )
  verify_log_float_text(
    2074,
    "9.056994232558738974298076417323169780900560233698629755432346926066724633932171545876049998826704896255144690430675169230312922332024102293499624124585919730137521830926341102978284239844164378124157647812750387232365300111955507392450011093474296256463531617795914573481045691416386158890233684317238493688461201114314746973832370713353157043457031250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-129",
    Some(2691213792566743253UL),
    None,
  )
  verify_log_float_text(
    2075,
    "-9.056994232558738974298076417323169780900560233698629755432346926066724633932171545876049998826704896255144690430675169230312922332024102293499624124585919730137521830926341102978284239844164378124157647812750387232365300111955507392450011093474296256463531617795914573481045691416386158890233684317238493688461201114314746973832370713353157043457031250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-129",
    Some(11914585829421519061UL),
    None,
  )
  verify_log_float_text(
    2076,
    "9.056994232558738974298076417323169780900560233698629755432346926066724633932171545876049998826704896255144690430675169230312922332024102293499624124585919730137521830926341102978284239844164378124157647812750387232365300111955507392450011093474296256463531617795914573481045691416386158890233684317238493688461201114314746973832370713353157043457031249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-129",
    Some(2691213792566743252UL),
    None,
  )
  verify_log_float_text(
    2077,
    "-9.056994232558738974298076417323169780900560233698629755432346926066724633932171545876049998826704896255144690430675169230312922332024102293499624124585919730137521830926341102978284239844164378124157647812750387232365300111955507392450011093474296256463531617795914573481045691416386158890233684317238493688461201114314746973832370713353157043457031249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-129",
    Some(11914585829421519060UL),
    None,
  )
  verify_log_float_text(
    2078,
    "2.7458955343572319752769934204363793340262540550113710188440325522807317071283250697888433933258056640625E-22",
    Some(4284259519950400662UL),
    None,
  )
  verify_log_float_text(
    2079,
    "-2.7458955343572319752769934204363793340262540550113710188440325522807317071283250697888433933258056640625E-22",
    Some(13507631556805176470UL),
    None,
  )
}

///|
test "native log base float text group 65" {
  verify_log_float_text(
    2080,
    "2.74589553435723197527699342043637933402625405501137101884403255228073170712832506978884339332580566406250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-22",
    Some(4284259519950400663UL),
    None,
  )
  verify_log_float_text(
    2081,
    "-2.74589553435723197527699342043637933402625405501137101884403255228073170712832506978884339332580566406250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-22",
    Some(13507631556805176471UL),
    None,
  )
  verify_log_float_text(
    2082,
    "2.74589553435723197527699342043637933402625405501137101884403255228073170712832506978884339332580566406249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-22",
    Some(4284259519950400662UL),
    None,
  )
  verify_log_float_text(
    2083,
    "-2.74589553435723197527699342043637933402625405501137101884403255228073170712832506978884339332580566406249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-22",
    Some(13507631556805176470UL),
    None,
  )
  verify_log_float_text(
    2084,
    "381876942441688770316552028123929444813451027355100661046685282136468306757314000334919184490673744959397719079207614610239647242355072542185139487009739959891523943071817533209430017533371575568452982400042385072751931757577550088430054619890869372867124015507967510270046000644096",
    Some(8819466046188582646UL),
    None,
  )
  verify_log_float_text(
    2085,
    "-381876942441688770316552028123929444813451027355100661046685282136468306757314000334919184490673744959397719079207614610239647242355072542185139487009739959891523943071817533209430017533371575568452982400042385072751931757577550088430054619890869372867124015507967510270046000644096",
    Some(18042838083043358454UL),
    None,
  )
  verify_log_float_text(
    2086,
    "381876942441688770316552028123929444813451027355100661046685282136468306757314000334919184490673744959397719079207614610239647242355072542185139487009739959891523943071817533209430017533371575568452982400042385072751931757577550088430054619890869372867124015507967510270046000644096.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(8819466046188582647UL),
    None,
  )
  verify_log_float_text(
    2087,
    "-381876942441688770316552028123929444813451027355100661046685282136468306757314000334919184490673744959397719079207614610239647242355072542185139487009739959891523943071817533209430017533371575568452982400042385072751931757577550088430054619890869372867124015507967510270046000644096.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(18042838083043358455UL),
    None,
  )
  verify_log_float_text(
    2088,
    "381876942441688770316552028123929444813451027355100661046685282136468306757314000334919184490673744959397719079207614610239647242355072542185139487009739959891523943071817533209430017533371575568452982400042385072751931757577550088430054619890869372867124015507967510270046000644095.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(8819466046188582646UL),
    None,
  )
  verify_log_float_text(
    2089,
    "-381876942441688770316552028123929444813451027355100661046685282136468306757314000334919184490673744959397719079207614610239647242355072542185139487009739959891523943071817533209430017533371575568452982400042385072751931757577550088430054619890869372867124015507967510270046000644095.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(18042838083043358454UL),
    None,
  )
  verify_log_float_text(
    2090,
    "10250072069191024421246682847144659975873482549333294485279906573696227497988366984259438630091691738147027555050786044249036218068591556936002355011185314937242012215950949346560559080225758055101583677619065899477008202450724912475268895820234957620558426164459825812964693149055044522185064448",
    Some(9020723878910653112UL),
    None,
  )
  verify_log_float_text(
    2091,
    "-10250072069191024421246682847144659975873482549333294485279906573696227497988366984259438630091691738147027555050786044249036218068591556936002355011185314937242012215950949346560559080225758055101583677619065899477008202450724912475268895820234957620558426164459825812964693149055044522185064448",
    Some(18244095915765428920UL),
    None,
  )
  verify_log_float_text(
    2092,
    "10250072069191024421246682847144659975873482549333294485279906573696227497988366984259438630091691738147027555050786044249036218068591556936002355011185314937242012215950949346560559080225758055101583677619065899477008202450724912475268895820234957620558426164459825812964693149055044522185064448.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(9020723878910653113UL),
    None,
  )
  verify_log_float_text(
    2093,
    "-10250072069191024421246682847144659975873482549333294485279906573696227497988366984259438630091691738147027555050786044249036218068591556936002355011185314937242012215950949346560559080225758055101583677619065899477008202450724912475268895820234957620558426164459825812964693149055044522185064448.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(18244095915765428921UL),
    None,
  )
  verify_log_float_text(
    2094,
    "10250072069191024421246682847144659975873482549333294485279906573696227497988366984259438630091691738147027555050786044249036218068591556936002355011185314937242012215950949346560559080225758055101583677619065899477008202450724912475268895820234957620558426164459825812964693149055044522185064447.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(9020723878910653112UL),
    None,
  )
  verify_log_float_text(
    2095,
    "-10250072069191024421246682847144659975873482549333294485279906573696227497988366984259438630091691738147027555050786044249036218068591556936002355011185314937242012215950949346560559080225758055101583677619065899477008202450724912475268895820234957620558426164459825812964693149055044522185064447.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(18244095915765428920UL),
    None,
  )
  verify_log_float_text(
    2096,
    "2.33044418931768661388638253391676789011221762109117406151445287111885519905309617710387358145256100849277035611233298185225241061147556900773501165639950646391630952564093398169756308385285202246244676859619104784898665759578311427958543998862457083955859942842007129927726851066627222763827376184053719043731689453125E-114",
    Some(2906779712004160524UL),
    None,
  )
  verify_log_float_text(
    2097,
    "-2.33044418931768661388638253391676789011221762109117406151445287111885519905309617710387358145256100849277035611233298185225241061147556900773501165639950646391630952564093398169756308385285202246244676859619104784898665759578311427958543998862457083955859942842007129927726851066627222763827376184053719043731689453125E-114",
    Some(12130151748858936332UL),
    None,
  )
  verify_log_float_text(
    2098,
    "2.330444189317686613886382533916767890112217621091174061514452871118855199053096177103873581452561008492770356112332981852252410611475569007735011656399506463916309525640933981697563083852852022462446768596191047848986657595783114279585439988624570839558599428420071299277268510666272227638273761840537190437316894531250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-114",
    Some(2906779712004160525UL),
    None,
  )
  verify_log_float_text(
    2099,
    "-2.330444189317686613886382533916767890112217621091174061514452871118855199053096177103873581452561008492770356112332981852252410611475569007735011656399506463916309525640933981697563083852852022462446768596191047848986657595783114279585439988624570839558599428420071299277268510666272227638273761840537190437316894531250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-114",
    Some(12130151748858936333UL),
    None,
  )
  verify_log_float_text(
    2100,
    "2.330444189317686613886382533916767890112217621091174061514452871118855199053096177103873581452561008492770356112332981852252410611475569007735011656399506463916309525640933981697563083852852022462446768596191047848986657595783114279585439988624570839558599428420071299277268510666272227638273761840537190437316894531249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-114",
    Some(2906779712004160524UL),
    None,
  )
  verify_log_float_text(
    2101,
    "-2.330444189317686613886382533916767890112217621091174061514452871118855199053096177103873581452561008492770356112332981852252410611475569007735011656399506463916309525640933981697563083852852022462446768596191047848986657595783114279585439988624570839558599428420071299277268510666272227638273761840537190437316894531249999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-114",
    Some(12130151748858936332UL),
    None,
  )
  verify_log_float_text(
    2102,
    "3837411111563270302382832835518458232832",
    Some(5198998834505943290UL),
    None,
  )
  verify_log_float_text(
    2103,
    "-3837411111563270302382832835518458232832",
    Some(14422370871360719098UL),
    None,
  )
  verify_log_float_text(
    2104,
    "3837411111563270302382832835518458232832.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(5198998834505943290UL),
    None,
  )
  verify_log_float_text(
    2105,
    "-3837411111563270302382832835518458232832.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(14422370871360719098UL),
    None,
  )
  verify_log_float_text(
    2106,
    "3837411111563270302382832835518458232831.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(5198998834505943289UL),
    None,
  )
  verify_log_float_text(
    2107,
    "-3837411111563270302382832835518458232831.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(14422370871360719097UL),
    None,
  )
  verify_log_float_text(
    2108,
    "5.283192387446172769595812127190400975998911548287839039768604797605088162527597097515253975378973520506314429652916747897162226960054515245033690464041627998619697708162532845371829515202574989360065865616343146646648117485111182399339446845025732502709915758163608864874889912850160999482666181356260863230709051259548702882055765185153108483519431741680626771701332249696587476792028477486717202141029019444446407027586197637664790491242790219989846363911874687700742041976334603628474511235490991922626625053791269736455184167909022687064659294653434784549972391687333583831787109375E-230",
    Some(1176707724678786590UL),
    None,
  )
  verify_log_float_text(
    2109,
    "-5.283192387446172769595812127190400975998911548287839039768604797605088162527597097515253975378973520506314429652916747897162226960054515245033690464041627998619697708162532845371829515202574989360065865616343146646648117485111182399339446845025732502709915758163608864874889912850160999482666181356260863230709051259548702882055765185153108483519431741680626771701332249696587476792028477486717202141029019444446407027586197637664790491242790219989846363911874687700742041976334603628474511235490991922626625053791269736455184167909022687064659294653434784549972391687333583831787109375E-230",
    Some(10400079761533562398UL),
    None,
  )
  verify_log_float_text(
    2110,
    "5.2831923874461727695958121271904009759989115482878390397686047976050881625275970975152539753789735205063144296529167478971622269600545152450336904640416279986196977081625328453718295152025749893600658656163431466466481174851111823993394468450257325027099157581636088648748899128501609994826661813562608632307090512595487028820557651851531084835194317416806267717013322496965874767920284774867172021410290194444464070275861976376647904912427902199898463639118746877007420419763346036284745112354909919226266250537912697364551841679090226870646592946534347845499723916873335838317871093750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-230",
    Some(1176707724678786590UL),
    None,
  )
  verify_log_float_text(
    2111,
    "-5.2831923874461727695958121271904009759989115482878390397686047976050881625275970975152539753789735205063144296529167478971622269600545152450336904640416279986196977081625328453718295152025749893600658656163431466466481174851111823993394468450257325027099157581636088648748899128501609994826661813562608632307090512595487028820557651851531084835194317416806267717013322496965874767920284774867172021410290194444464070275861976376647904912427902199898463639118746877007420419763346036284745112354909919226266250537912697364551841679090226870646592946534347845499723916873335838317871093750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-230",
    Some(10400079761533562398UL),
    None,
  )
}

///|
test "native log base float text group 66" {
  verify_log_float_text(
    2112,
    "5.2831923874461727695958121271904009759989115482878390397686047976050881625275970975152539753789735205063144296529167478971622269600545152450336904640416279986196977081625328453718295152025749893600658656163431466466481174851111823993394468450257325027099157581636088648748899128501609994826661813562608632307090512595487028820557651851531084835194317416806267717013322496965874767920284774867172021410290194444464070275861976376647904912427902199898463639118746877007420419763346036284745112354909919226266250537912697364551841679090226870646592946534347845499723916873335838317871093749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-230",
    Some(1176707724678786589UL),
    None,
  )
  verify_log_float_text(
    2113,
    "-5.2831923874461727695958121271904009759989115482878390397686047976050881625275970975152539753789735205063144296529167478971622269600545152450336904640416279986196977081625328453718295152025749893600658656163431466466481174851111823993394468450257325027099157581636088648748899128501609994826661813562608632307090512595487028820557651851531084835194317416806267717013322496965874767920284774867172021410290194444464070275861976376647904912427902199898463639118746877007420419763346036284745112354909919226266250537912697364551841679090226870646592946534347845499723916873335838317871093749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-230",
    Some(10400079761533562397UL),
    None,
  )
  verify_log_float_text(
    2114,
    "201598973984719152",
    Some(4865683965869787658UL),
    None,
  )
  verify_log_float_text(
    2115,
    "-201598973984719152",
    Some(14089056002724563466UL),
    None,
  )
  verify_log_float_text(
    2116,
    "201598973984719152.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(4865683965869787658UL),
    None,
  )
  verify_log_float_text(
    2117,
    "-201598973984719152.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(14089056002724563466UL),
    None,
  )
  verify_log_float_text(
    2118,
    "201598973984719151.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(4865683965869787657UL),
    None,
  )
  verify_log_float_text(
    2119,
    "-201598973984719151.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(14089056002724563465UL),
    None,
  )
  verify_log_float_text(
    2120,
    "814047900638148971690920783384716847432789117332308341283426457310138001609018888227169035640043980995098865190759990942108266032139398620918704794238976",
    Some(6894753706956867854UL),
    None,
  )
  verify_log_float_text(
    2121,
    "-814047900638148971690920783384716847432789117332308341283426457310138001609018888227169035640043980995098865190759990942108266032139398620918704794238976",
    Some(16118125743811643662UL),
    None,
  )
  verify_log_float_text(
    2122,
    "814047900638148971690920783384716847432789117332308341283426457310138001609018888227169035640043980995098865190759990942108266032139398620918704794238976.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(6894753706956867854UL),
    None,
  )
  verify_log_float_text(
    2123,
    "-814047900638148971690920783384716847432789117332308341283426457310138001609018888227169035640043980995098865190759990942108266032139398620918704794238976.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001",
    Some(16118125743811643662UL),
    None,
  )
  verify_log_float_text(
    2124,
    "814047900638148971690920783384716847432789117332308341283426457310138001609018888227169035640043980995098865190759990942108266032139398620918704794238975.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(6894753706956867853UL),
    None,
  )
  verify_log_float_text(
    2125,
    "-814047900638148971690920783384716847432789117332308341283426457310138001609018888227169035640043980995098865190759990942108266032139398620918704794238975.999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(16118125743811643661UL),
    None,
  )
  verify_log_float_text(
    2126,
    "3.793598519919632497159069372841190250521582088470664238307693797514809513925909784880392441279563156194620988307977616737952303467840213683481323495810741389810120626639307604462574944745449424682099934699099981653540945667078348635724538643897029887846268277009756805785545457127684477782465959194998345448441066521444568552842821658466210266169582610018551349639892578125E-138",
    Some(2550891769504129858UL),
    None,
  )
  verify_log_float_text(
    2127,
    "-3.793598519919632497159069372841190250521582088470664238307693797514809513925909784880392441279563156194620988307977616737952303467840213683481323495810741389810120626639307604462574944745449424682099934699099981653540945667078348635724538643897029887846268277009756805785545457127684477782465959194998345448441066521444568552842821658466210266169582610018551349639892578125E-138",
    Some(11774263806358905666UL),
    None,
  )
  verify_log_float_text(
    2128,
    "3.793598519919632497159069372841190250521582088470664238307693797514809513925909784880392441279563156194620988307977616737952303467840213683481323495810741389810120626639307604462574944745449424682099934699099981653540945667078348635724538643897029887846268277009756805785545457127684477782465959194998345448441066521444568552842821658466210266169582610018551349639892578125000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-138",
    Some(2550891769504129859UL),
    None,
  )
  verify_log_float_text(
    2129,
    "-3.793598519919632497159069372841190250521582088470664238307693797514809513925909784880392441279563156194620988307977616737952303467840213683481323495810741389810120626639307604462574944745449424682099934699099981653540945667078348635724538643897029887846268277009756805785545457127684477782465959194998345448441066521444568552842821658466210266169582610018551349639892578125000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-138",
    Some(11774263806358905667UL),
    None,
  )
  verify_log_float_text(
    2130,
    "3.793598519919632497159069372841190250521582088470664238307693797514809513925909784880392441279563156194620988307977616737952303467840213683481323495810741389810120626639307604462574944745449424682099934699099981653540945667078348635724538643897029887846268277009756805785545457127684477782465959194998345448441066521444568552842821658466210266169582610018551349639892578124999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-138",
    Some(2550891769504129858UL),
    None,
  )
  verify_log_float_text(
    2131,
    "-3.793598519919632497159069372841190250521582088470664238307693797514809513925909784880392441279563156194620988307977616737952303467840213683481323495810741389810120626639307604462574944745449424682099934699099981653540945667078348635724538643897029887846268277009756805785545457127684477782465959194998345448441066521444568552842821658466210266169582610018551349639892578124999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-138",
    Some(11774263806358905666UL),
    None,
  )
  verify_log_float_text(
    2132,
    "1.78471219199826956071409736594110536788067005536108349932813605310527758831374452974328388327181051848009494801637638966405204433530634658711632236745549187805122302268754828859601497556350390414277296996594918259893831086226094779467169850799755801814569269491394091620699860998152025592662307009732373880912456477112357852752360073467519205341629193417057037240416583722508088115671396454455853452182068041223645488415154916781537602293843746604292429785356189397692962260623472265749636463776348046833594490657920245754310703293287442006143095341030857525765895843505859375E-225",
    Some(1244440140854276952UL),
    None,
  )
  verify_log_float_text(
    2133,
    "-1.78471219199826956071409736594110536788067005536108349932813605310527758831374452974328388327181051848009494801637638966405204433530634658711632236745549187805122302268754828859601497556350390414277296996594918259893831086226094779467169850799755801814569269491394091620699860998152025592662307009732373880912456477112357852752360073467519205341629193417057037240416583722508088115671396454455853452182068041223645488415154916781537602293843746604292429785356189397692962260623472265749636463776348046833594490657920245754310703293287442006143095341030857525765895843505859375E-225",
    Some(10467812177709052760UL),
    None,
  )
  verify_log_float_text(
    2134,
    "1.784712191998269560714097365941105367880670055361083499328136053105277588313744529743283883271810518480094948016376389664052044335306346587116322367455491878051223022687548288596014975563503904142772969965949182598938310862260947794671698507997558018145692694913940916206998609981520255926623070097323738809124564771123578527523600734675192053416291934170570372404165837225080881156713964544558534521820680412236454884151549167815376022938437466042924297853561893976929622606234722657496364637763480468335944906579202457543107032932874420061430953410308575257658958435058593750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-225",
    Some(1244440140854276952UL),
    None,
  )
  verify_log_float_text(
    2135,
    "-1.784712191998269560714097365941105367880670055361083499328136053105277588313744529743283883271810518480094948016376389664052044335306346587116322367455491878051223022687548288596014975563503904142772969965949182598938310862260947794671698507997558018145692694913940916206998609981520255926623070097323738809124564771123578527523600734675192053416291934170570372404165837225080881156713964544558534521820680412236454884151549167815376022938437466042924297853561893976929622606234722657496364637763480468335944906579202457543107032932874420061430953410308575257658958435058593750000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E-225",
    Some(10467812177709052760UL),
    None,
  )
  verify_log_float_text(
    2136,
    "1.784712191998269560714097365941105367880670055361083499328136053105277588313744529743283883271810518480094948016376389664052044335306346587116322367455491878051223022687548288596014975563503904142772969965949182598938310862260947794671698507997558018145692694913940916206998609981520255926623070097323738809124564771123578527523600734675192053416291934170570372404165837225080881156713964544558534521820680412236454884151549167815376022938437466042924297853561893976929622606234722657496364637763480468335944906579202457543107032932874420061430953410308575257658958435058593749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-225",
    Some(1244440140854276951UL),
    None,
  )
  verify_log_float_text(
    2137,
    "-1.784712191998269560714097365941105367880670055361083499328136053105277588313744529743283883271810518480094948016376389664052044335306346587116322367455491878051223022687548288596014975563503904142772969965949182598938310862260947794671698507997558018145692694913940916206998609981520255926623070097323738809124564771123578527523600734675192053416291934170570372404165837225080881156713964544558534521820680412236454884151549167815376022938437466042924297853561893976929622606234722657496364637763480468335944906579202457543107032932874420061430953410308575257658958435058593749999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999E-225",
    Some(10467812177709052759UL),
    None,
  )
  verify_log_float_text(
    2138,
    "99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    2139,
    "-99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(18442240474082181120UL),
    None,
  )
  verify_log_float_text(
    2140,
    "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001.25",
    Some(4608308318706860032UL),
    None,
  )
  verify_log_float_text(
    2141,
    "0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001e5000",
    Some(4591870180066957722UL),
    None,
  )
  verify_log_float_text(
    2142,
    "100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000e-5000",
    Some(4607182418800017408UL),
    None,
  )
  verify_log_float_text(
    2143,
    "-0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001e5000",
    Some(13815242216921733530UL),
    None,
  )
}

///|
test "native log base float text group 67" {
  verify_log_float_text(
    2144,
    "0e99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    2145,
    "-0e-99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(9223372036854775808UL),
    None,
  )
  verify_log_float_text(
    2146,
    "1e-99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(0UL),
    None,
  )
  verify_log_float_text(
    2147,
    "1e99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
    Some(9218868437227405312UL),
    None,
  )
  verify_log_float_text(
    2148,
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    None,
    Some(
      "ValueError: could not convert string to float: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'",
    ),
  )
  verify_log_float_text(
    2149,
    "😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀",
    None,
    Some(
      "ValueError: could not convert string to float: '😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀'",
    ),
  )
  verify_log_float_text(
    2150,
    "\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}\u{0}",
    None,
    Some(
      "ValueError: could not convert string to float: '\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00'",
    ),
  )
  verify_log_float_text(
    2151,
    "a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}a'\"\\\u{a}",
    None,
    Some(
      "ValueError: could not convert string to float: 'a\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\na\\'\"\\\\\\n'",
    ),
  )
}
