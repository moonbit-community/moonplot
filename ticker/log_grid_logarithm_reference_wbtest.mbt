// Independent Decimal180/320 natural logarithms; NumPy source bits remain separately recorded.

///|
test "Log independent natural logarithm 0" {
  let actual = log_grid_natural_log(-1.0 / 0.0)
  verify_log_grid_bits([actual], [0.0 / 0.0])
}

///|
test "Log independent natural logarithm 1" {
  let actual = log_grid_natural_log(-10.0)
  verify_log_grid_bits([actual], [0.0 / 0.0])
}

///|
test "Log independent natural logarithm 2" {
  let actual = log_grid_natural_log(-0.0)
  verify_log_grid_bits([actual], [-1.0 / 0.0])
}

///|
test "Log independent natural logarithm 3" {
  let actual = log_grid_natural_log(0.0)
  verify_log_grid_bits([actual], [-1.0 / 0.0])
}

///|
test "Log independent natural logarithm 4" {
  let actual = log_grid_natural_log(1.0)
  verify_log_grid_bits([actual], [0.0])
}

///|
test "Log independent natural logarithm 5" {
  let actual = log_grid_natural_log(1.0 / 0.0)
  verify_log_grid_bits([actual], [1.0 / 0.0])
}

///|
test "Log independent natural logarithm 6" {
  let actual = log_grid_natural_log(0.0 / 0.0)
  verify_log_grid_bits([actual], [0.0 / 0.0])
}

///|
test "Log independent natural logarithm 7" {
  let actual = log_grid_natural_log(5.0e-324)
  verify_log_grid_bits([actual], [-744.4400719213812])
}

///|
test "Log independent natural logarithm 8" {
  let actual = log_grid_natural_log(2.2250738585072014e-308)
  verify_log_grid_bits([actual], [-708.3964185322641])
}

///|
test "Log independent natural logarithm 9" {
  let actual = log_grid_natural_log(4.700692105671798e-306)
  verify_log_grid_bits([actual], [-703.0433287017772])
}

///|
test "Log independent natural logarithm 10" {
  let actual = log_grid_natural_log(9.958075838215777e-306)
  verify_log_grid_bits([actual], [-702.292654592179])
}

///|
test "Log independent natural logarithm 11" {
  let actual = log_grid_natural_log(2.6340286059269337e-303)
  verify_log_grid_bits([actual], [-696.7147687136729])
}

///|
test "Log independent natural logarithm 12" {
  let actual = log_grid_natural_log(9.999999999999999e-301)
  verify_log_grid_bits([actual], [-690.7755278982137])
}

///|
test "Log independent natural logarithm 13" {
  let actual = log_grid_natural_log(1.0e-300)
  verify_log_grid_bits([actual], [-690.7755278982137])
}

///|
test "Log independent natural logarithm 14" {
  let actual = log_grid_natural_log(1.0000000000000002e-300)
  verify_log_grid_bits([actual], [-690.7755278982137])
}

///|
test "Log independent natural logarithm 15" {
  let actual = log_grid_natural_log(8.259229264970544e-296)
  verify_log_grid_bits([actual], [-679.4538562523838])
}

///|
test "Log independent natural logarithm 16" {
  let actual = log_grid_natural_log(2.0951261963028385e-283)
  verify_log_grid_bits([actual], [-650.8919675288563])
}

///|
test "Log independent natural logarithm 17" {
  let actual = log_grid_natural_log(1.2867280190644222e-280)
  verify_log_grid_bits([actual], [-644.4717234614503])
}

///|
test "Log independent natural logarithm 18" {
  let actual = log_grid_natural_log(1.1047303947337606e-278)
  verify_log_grid_bits([actual], [-640.0190545338108])
}

///|
test "Log independent natural logarithm 19" {
  let actual = log_grid_natural_log(2.5217284770675383e-272)
  verify_log_grid_bits([actual], [-625.3782007243832])
}

///|
test "Log independent natural logarithm 20" {
  let actual = log_grid_natural_log(4.164161004926124e-272)
  verify_log_grid_bits([actual], [-624.8766304784467])
}

///|
test "Log independent natural logarithm 21" {
  let actual = log_grid_natural_log(5.709925001970983e-272)
  verify_log_grid_bits([actual], [-624.5609394053047])
}

///|
test "Log independent natural logarithm 22" {
  let actual = log_grid_natural_log(3.2908848677802213e-270)
  verify_log_grid_bits([actual], [-620.5068186230053])
}

///|
test "Log independent natural logarithm 23" {
  let actual = log_grid_natural_log(4.504896896792867e-266)
  verify_log_grid_bits([actual], [-610.9824697320122])
}

///|
test "Log independent natural logarithm 24" {
  let actual = log_grid_natural_log(4.115689434976612e-260)
  verify_log_grid_bits([actual], [-597.2573178164423])
}

///|
test "Log independent natural logarithm 25" {
  let actual = log_grid_natural_log(2.217781439059592e-259)
  verify_log_grid_bits([actual], [-595.5730317410336])
}

///|
test "Log independent natural logarithm 26" {
  let actual = log_grid_natural_log(4.323144351592026e-253)
  verify_log_grid_bits([actual], [-581.0900455308338])
}

///|
test "Log independent natural logarithm 27" {
  let actual = log_grid_natural_log(4.039820597534678e-243)
  verify_log_grid_bits([actual], [-558.1319773131169])
}

///|
test "Log independent natural logarithm 28" {
  let actual = log_grid_natural_log(1.337915256628554e-239)
  verify_log_grid_bits([actual], [-550.0267246017298])
}

///|
test "Log independent natural logarithm 29" {
  let actual = log_grid_natural_log(1.2434319598662562e-229)
  verify_log_grid_bits([actual], [-527.0741110295056])
}

///|
test "Log independent natural logarithm 30" {
  let actual = log_grid_natural_log(1.2036674747662538e-225)
  verify_log_grid_bits([actual], [-517.8962727986684])
}

///|
test "Log independent natural logarithm 31" {
  let actual = log_grid_natural_log(1.014210448151416e-217)
  verify_log_grid_bits([actual], [-499.6468547535173])
}

///|
test "Log independent natural logarithm 32" {
  let actual = log_grid_natural_log(3.7522993192304115e-214)
  verify_log_grid_bits([actual], [-491.43084109684946])
}

///|
test "Log independent natural logarithm 33" {
  let actual = log_grid_natural_log(5.740171034983017e-201)
  verify_log_grid_bits([actual], [-461.07211468488026])
}

///|
test "Log independent natural logarithm 34" {
  let actual = log_grid_natural_log(9.999999999999998e-201)
  verify_log_grid_bits([actual], [-460.51701859880916])
}

///|
test "Log independent natural logarithm 35" {
  let actual = log_grid_natural_log(1.0e-200)
  verify_log_grid_bits([actual], [-460.51701859880916])
}

///|
test "Log independent natural logarithm 36" {
  let actual = log_grid_natural_log(1.0000000000000001e-200)
  verify_log_grid_bits([actual], [-460.51701859880916])
}

///|
test "Log independent natural logarithm 37" {
  let actual = log_grid_natural_log(9.980264655067956e-197)
  verify_log_grid_bits([actual], [-451.30865371131136])
}

///|
test "Log independent natural logarithm 38" {
  let actual = log_grid_natural_log(2.0775896434731067e-183)
  verify_log_grid_bits([actual], [-420.6418636214076])
}

///|
test "Log independent natural logarithm 39" {
  let actual = log_grid_natural_log(9.92379295031794e-182)
  verify_log_grid_bits([actual], [-416.7755517228355])
}

///|
test "Log independent natural logarithm 40" {
  let actual = log_grid_natural_log(2.044033624844715e-176)
  verify_log_grid_bits([actual], [-404.5400512442348])
}

///|
test "Log independent natural logarithm 41" {
  let actual = log_grid_natural_log(9.35988476261635e-173)
  verify_log_grid_bits([actual], [-396.1107881092425])
}

///|
test "Log independent natural logarithm 42" {
  let actual = log_grid_natural_log(3.3107754361788547e-168)
  verify_log_grid_bits([actual], [-385.6371131902989])
}

///|
test "Log independent natural logarithm 43" {
  let actual = log_grid_natural_log(1.147171698762414e-167)
  verify_log_grid_bits([actual], [-384.3944110092842])
}

///|
test "Log independent natural logarithm 44" {
  let actual = log_grid_natural_log(3.4026680333837676e-150)
  verify_log_grid_bits([actual], [-344.16320410951204])
}

///|
test "Log independent natural logarithm 45" {
  let actual = log_grid_natural_log(9.973827470095237e-148)
  verify_log_grid_bits([actual], [-338.48262935410963])
}

///|
test "Log independent natural logarithm 46" {
  let actual = log_grid_natural_log(1.7256843168838193e-124)
  verify_log_grid_bits([actual], [-284.9749278540053])
}

///|
test "Log independent natural logarithm 47" {
  let actual = log_grid_natural_log(4.013536201432296e-110)
  verify_log_grid_bits([actual], [-251.89468753088036])
}

///|
test "Log independent natural logarithm 48" {
  let actual = log_grid_natural_log(2.2807362304085478e-104)
  verify_log_grid_bits([actual], [-238.64435137246406])
}

///|
test "Log independent natural logarithm 49" {
  let actual = log_grid_natural_log(8.176086615575786e-104)
  verify_log_grid_bits([actual], [-237.36763604409393])
}

///|
test "Log independent natural logarithm 50" {
  let actual = log_grid_natural_log(2.263601241294329e-103)
  verify_log_grid_bits([actual], [-236.34930756372887])
}

///|
test "Log independent natural logarithm 51" {
  let actual = log_grid_natural_log(9.999999999999999e-101)
  verify_log_grid_bits([actual], [-230.25850929940458])
}

///|
test "Log independent natural logarithm 52" {
  let actual = log_grid_natural_log(1.0e-100)
  verify_log_grid_bits([actual], [-230.25850929940458])
}

///|
test "Log independent natural logarithm 53" {
  let actual = log_grid_natural_log(1.0000000000000001e-100)
  verify_log_grid_bits([actual], [-230.25850929940458])
}

///|
test "Log independent natural logarithm 54" {
  let actual = log_grid_natural_log(2.9051790151972295e-99)
  verify_log_grid_bits([actual], [-226.88942919487368])
}

///|
test "Log independent natural logarithm 55" {
  let actual = log_grid_natural_log(4.431687136221272e-99)
  verify_log_grid_bits([actual], [-226.4671438514651])
}

///|
test "Log independent natural logarithm 56" {
  let actual = log_grid_natural_log(2.9540953408093522e-90)
  verify_log_grid_bits([actual], [-206.14946591072027])
}

///|
test "Log independent natural logarithm 57" {
  let actual = log_grid_natural_log(2.7937022687864357e-87)
  verify_log_grid_bits([actual], [-199.29753539624633])
}

///|
test "Log independent natural logarithm 58" {
  let actual = log_grid_natural_log(1.536526894298365e-85)
  verify_log_grid_bits([actual], [-195.29020829844762])
}

///|
test "Log independent natural logarithm 59" {
  let actual = log_grid_natural_log(1.8318209949989585e-85)
  verify_log_grid_bits([actual], [-195.1144223531693])
}

///|
test "Log independent natural logarithm 60" {
  let actual = log_grid_natural_log(8.526098898804129e-76)
  verify_log_grid_bits([actual], [-172.85333514959964])
}

///|
test "Log independent natural logarithm 61" {
  let actual = log_grid_natural_log(5.594293200760979e-62)
  verify_log_grid_bits([actual], [-141.0385287587886])
}

///|
test "Log independent natural logarithm 62" {
  let actual = log_grid_natural_log(1.9186124925441823e-50)
  verify_log_grid_bits([actual], [-114.47765238504053])
}

///|
test "Log independent natural logarithm 63" {
  let actual = log_grid_natural_log(7.62821124514661e-49)
  verify_log_grid_bits([actual], [-110.79481617596775])
}

///|
test "Log independent natural logarithm 64" {
  let actual = log_grid_natural_log(3.6982986563771276e-45)
  verify_log_grid_bits([actual], [-102.30845629343348])
}

///|
test "Log independent natural logarithm 65" {
  let actual = log_grid_natural_log(1.2092360226937093e-44)
  verify_log_grid_bits([actual], [-101.12375531774111])
}

///|
test "Log independent natural logarithm 66" {
  let actual = log_grid_natural_log(1.1050721245688372e-38)
  verify_log_grid_bits([actual], [-87.39832292983107])
}

///|
test "Log independent natural logarithm 67" {
  let actual = log_grid_natural_log(3.471557262855229e-36)
  verify_log_grid_bits([actual], [-81.6484600755772])
}

///|
test "Log independent natural logarithm 68" {
  let actual = log_grid_natural_log(9.316221747488775e-30)
  verify_log_grid_bits([actual], [-66.84579563521773])
}

///|
test "Log independent natural logarithm 69" {
  let actual = log_grid_natural_log(4.2876412404909937e-29)
  verify_log_grid_bits([actual], [-65.31923094248928])
}

///|
test "Log independent natural logarithm 70" {
  let actual = log_grid_natural_log(2.611640032516855e-27)
  verify_log_grid_bits([actual], [-61.209819121894235])
}

///|
test "Log independent natural logarithm 71" {
  let actual = log_grid_natural_log(6.402031833886509e-20)
  verify_log_grid_bits([actual], [-44.19508644585474])
}

///|
test "Log independent natural logarithm 72" {
  let actual = log_grid_natural_log(6.569864780138507e-17)
  verify_log_grid_bits([actual], [-37.26145333002372])
}

///|
test "Log independent natural logarithm 73" {
  let actual = log_grid_natural_log(1.7255937634154673e-14)
  verify_log_grid_bits([actual], [-31.69062009998459])
}

///|
test "Log independent natural logarithm 74" {
  let actual = log_grid_natural_log(9.999999999999999e-11)
  verify_log_grid_bits([actual], [-23.025850929940457])
}

///|
test "Log independent natural logarithm 75" {
  let actual = log_grid_natural_log(1.0e-10)
  verify_log_grid_bits([actual], [-23.025850929940457])
}

///|
test "Log independent natural logarithm 76" {
  let actual = log_grid_natural_log(1.0000000000000002e-10)
  verify_log_grid_bits([actual], [-23.025850929940457])
}

///|
test "Log independent natural logarithm 77" {
  let actual = log_grid_natural_log(0.0001)
  verify_log_grid_bits([actual], [-9.210340371976182])
}

///|
test "Log independent natural logarithm 78" {
  let actual = log_grid_natural_log(0.0009999999999999998)
  verify_log_grid_bits([actual], [-6.907755278982137])
}

///|
test "Log independent natural logarithm 79" {
  let actual = log_grid_natural_log(0.001)
  verify_log_grid_bits([actual], [-6.907755278982137])
}

///|
test "Log independent natural logarithm 80" {
  let actual = log_grid_natural_log(0.0010000000000000002)
  verify_log_grid_bits([actual], [-6.907755278982137])
}

///|
test "Log independent natural logarithm 81" {
  let actual = log_grid_natural_log(0.009999999999999998)
  verify_log_grid_bits([actual], [-4.605170185988092])
}

///|
test "Log independent natural logarithm 82" {
  let actual = log_grid_natural_log(0.01)
  verify_log_grid_bits([actual], [-4.605170185988091])
}

///|
test "Log independent natural logarithm 83" {
  let actual = log_grid_natural_log(0.010000000000000002)
  verify_log_grid_bits([actual], [-4.605170185988091])
}

///|
test "Log independent natural logarithm 84" {
  let actual = log_grid_natural_log(0.08380525023801975)
  verify_log_grid_bits([actual], [-2.4792596214516456])
}

///|
test "Log independent natural logarithm 85" {
  let actual = log_grid_natural_log(0.09999999999999999)
  verify_log_grid_bits([actual], [-2.302585092994046])
}

///|
test "Log independent natural logarithm 86" {
  let actual = log_grid_natural_log(0.1)
  verify_log_grid_bits([actual], [-2.3025850929940455])
}

///|
test "Log independent natural logarithm 87" {
  let actual = log_grid_natural_log(0.10000000000000002)
  verify_log_grid_bits([actual], [-2.3025850929940455])
}

///|
test "Log independent natural logarithm 88" {
  let actual = log_grid_natural_log(0.5)
  verify_log_grid_bits([actual], [-0.6931471805599453])
}

///|
test "Log independent natural logarithm 89" {
  let actual = log_grid_natural_log(0.9999999999999999)
  verify_log_grid_bits([actual], [-1.1102230246251565e-16])
}

///|
test "Log independent natural logarithm 90" {
  let actual = log_grid_natural_log(1.0)
  verify_log_grid_bits([actual], [0.0])
}

///|
test "Log independent natural logarithm 91" {
  let actual = log_grid_natural_log(1.0000000000000002)
  verify_log_grid_bits([actual], [2.2204460492503128e-16])
}

///|
test "Log independent natural logarithm 92" {
  let actual = log_grid_natural_log(1.5)
  verify_log_grid_bits([actual], [0.4054651081081644])
}

///|
test "Log independent natural logarithm 93" {
  let actual = log_grid_natural_log(2.0)
  verify_log_grid_bits([actual], [0.6931471805599453])
}

///|
test "Log independent natural logarithm 94" {
  let actual = log_grid_natural_log(3.0)
  verify_log_grid_bits([actual], [1.0986122886681098])
}

///|
test "Log independent natural logarithm 95" {
  let actual = log_grid_natural_log(4.67307204672244)
  verify_log_grid_bits([actual], [1.5418166812588519])
}

///|
test "Log independent natural logarithm 96" {
  let actual = log_grid_natural_log(9.999999999999998)
  verify_log_grid_bits([actual], [2.3025850929940455])
}

///|
test "Log independent natural logarithm 97" {
  let actual = log_grid_natural_log(10.0)
  verify_log_grid_bits([actual], [2.302585092994046])
}

///|
test "Log independent natural logarithm 98" {
  let actual = log_grid_natural_log(10.000000000000002)
  verify_log_grid_bits([actual], [2.302585092994046])
}

///|
test "Log independent natural logarithm 99" {
  let actual = log_grid_natural_log(99.99999999999999)
  verify_log_grid_bits([actual], [4.605170185988091])
}

///|
test "Log independent natural logarithm 100" {
  let actual = log_grid_natural_log(100.0)
  verify_log_grid_bits([actual], [4.605170185988092])
}

///|
test "Log independent natural logarithm 101" {
  let actual = log_grid_natural_log(100.00000000000001)
  verify_log_grid_bits([actual], [4.605170185988092])
}

///|
test "Log independent natural logarithm 102" {
  let actual = log_grid_natural_log(999.9999999999999)
  verify_log_grid_bits([actual], [6.907755278982137])
}

///|
test "Log independent natural logarithm 103" {
  let actual = log_grid_natural_log(1000.0)
  verify_log_grid_bits([actual], [6.907755278982137])
}

///|
test "Log independent natural logarithm 104" {
  let actual = log_grid_natural_log(1000.0000000000001)
  verify_log_grid_bits([actual], [6.907755278982137])
}

///|
test "Log independent natural logarithm 105" {
  let actual = log_grid_natural_log(4379957.774013472)
  verify_log_grid_bits([actual], [15.292549641669964])
}

///|
test "Log independent natural logarithm 106" {
  let actual = log_grid_natural_log(881148740.694392)
  verify_log_grid_bits([actual], [20.596737001312185])
}

///|
test "Log independent natural logarithm 107" {
  let actual = log_grid_natural_log(9999999999.999998)
  verify_log_grid_bits([actual], [23.025850929940457])
}

///|
test "Log independent natural logarithm 108" {
  let actual = log_grid_natural_log(10000000000.0)
  verify_log_grid_bits([actual], [23.025850929940457])
}

///|
test "Log independent natural logarithm 109" {
  let actual = log_grid_natural_log(10000000000.000002)
  verify_log_grid_bits([actual], [23.025850929940457])
}

///|
test "Log independent natural logarithm 110" {
  let actual = log_grid_natural_log(245896666600.6254)
  verify_log_grid_bits([actual], [26.22817723016218])
}

///|
test "Log independent natural logarithm 111" {
  let actual = log_grid_natural_log(3.618275221783837e+18)
  verify_log_grid_bits([actual], [42.73252912811753])
}

///|
test "Log independent natural logarithm 112" {
  let actual = log_grid_natural_log(2.965074136058515e+20)
  verify_log_grid_bits([actual], [47.1386038957477])
}

///|
test "Log independent natural logarithm 113" {
  let actual = log_grid_natural_log(3.976376984725903e+21)
  verify_log_grid_bits([actual], [49.73465805224653])
}

///|
test "Log independent natural logarithm 114" {
  let actual = log_grid_natural_log(2.777477802511578e+30)
  verify_log_grid_bits([actual], [70.09909604042606])
}

///|
test "Log independent natural logarithm 115" {
  let actual = log_grid_natural_log(2.4437699382468645e+33)
  verify_log_grid_bits([actual], [76.87884997239516])
}

///|
test "Log independent natural logarithm 116" {
  let actual = log_grid_natural_log(1.6707540299056314e+38)
  verify_log_grid_bits([actual], [88.01150857321376])
}

///|
test "Log independent natural logarithm 117" {
  let actual = log_grid_natural_log(3.0165335279296323e+42)
  verify_log_grid_bits([actual], [97.81268223943172])
}

///|
test "Log independent natural logarithm 118" {
  let actual = log_grid_natural_log(1.2029399062896032e+45)
  verify_log_grid_bits([actual], [103.80109766726792])
}

///|
test "Log independent natural logarithm 119" {
  let actual = log_grid_natural_log(5.851299293028788e+51)
  verify_log_grid_bits([actual], [119.19850348065168])
}

///|
test "Log independent natural logarithm 120" {
  let actual = log_grid_natural_log(7.370136535525582e+51)
  verify_log_grid_bits([actual], [119.42927597457748])
}

///|
test "Log independent natural logarithm 121" {
  let actual = log_grid_natural_log(2.6080604435213784e+61)
  verify_log_grid_bits([actual], [141.41629749262947])
}

///|
test "Log independent natural logarithm 122" {
  let actual = log_grid_natural_log(2.0159715537911625e+81)
  verify_log_grid_bits([actual], [187.21049377240465])
}

///|
test "Log independent natural logarithm 123" {
  let actual = log_grid_natural_log(1.2547393321039488e+88)
  verify_log_grid_bits([actual], [202.85441603098357])
}

///|
test "Log independent natural logarithm 124" {
  let actual = log_grid_natural_log(4.602001404021247e+88)
  verify_log_grid_bits([actual], [204.15397948017852])
}

///|
test "Log independent natural logarithm 125" {
  let actual = log_grid_natural_log(4.651215774288638e+88)
  verify_log_grid_bits([actual], [204.16461682573768])
}

///|
test "Log independent natural logarithm 126" {
  let actual = log_grid_natural_log(3.6225648736217164e+93)
  verify_log_grid_bits([actual], [215.4275959520208])
}

///|
test "Log independent natural logarithm 127" {
  let actual = log_grid_natural_log(9.999999999999998e+99)
  verify_log_grid_bits([actual], [230.25850929940458])
}

///|
test "Log independent natural logarithm 128" {
  let actual = log_grid_natural_log(1.0e+100)
  verify_log_grid_bits([actual], [230.25850929940458])
}

///|
test "Log independent natural logarithm 129" {
  let actual = log_grid_natural_log(1.0000000000000002e+100)
  verify_log_grid_bits([actual], [230.25850929940458])
}

///|
test "Log independent natural logarithm 130" {
  let actual = log_grid_natural_log(2.2128811700684164e+105)
  verify_log_grid_bits([actual], [242.56573012769312])
}

///|
test "Log independent natural logarithm 131" {
  let actual = log_grid_natural_log(1.8537672473846712e+112)
  verify_log_grid_bits([actual], [258.5067503338109])
}

///|
test "Log independent natural logarithm 132" {
  let actual = log_grid_natural_log(3.310776668188993e+112)
  verify_log_grid_bits([actual], [259.08671322015516])
}

///|
test "Log independent natural logarithm 133" {
  let actual = log_grid_natural_log(7.320471796321336e+117)
  verify_log_grid_bits([actual], [271.3931306592489])
}

///|
test "Log independent natural logarithm 134" {
  let actual = log_grid_natural_log(3.393298689976289e+121)
  verify_log_grid_bits([actual], [279.8345987654409])
}

///|
test "Log independent natural logarithm 135" {
  let actual = log_grid_natural_log(4.308703937696368e+124)
  verify_log_grid_bits([actual], [286.98118867964354])
}

///|
test "Log independent natural logarithm 136" {
  let actual = log_grid_natural_log(8.980184682718365e+125)
  verify_log_grid_bits([actual], [290.0181570723626])
}

///|
test "Log independent natural logarithm 137" {
  let actual = log_grid_natural_log(1.0865869217140762e+129)
  verify_log_grid_bits([actual], [297.1165185153239])
}

///|
test "Log independent natural logarithm 138" {
  let actual = log_grid_natural_log(2.7778024016381605e+131)
  verify_log_grid_bits([actual], [302.6603072943024])
}

///|
test "Log independent natural logarithm 139" {
  let actual = log_grid_natural_log(1.0072581554371843e+133)
  verify_log_grid_bits([actual], [306.25104931000044])
}

///|
test "Log independent natural logarithm 140" {
  let actual = log_grid_natural_log(4.920343533642926e+135)
  verify_log_grid_bits([actual], [312.44236590617396])
}

///|
test "Log independent natural logarithm 141" {
  let actual = log_grid_natural_log(9.63234813473558e+141)
  verify_log_grid_bits([actual], [326.9296251436302])
}

///|
test "Log independent natural logarithm 142" {
  let actual = log_grid_natural_log(1.0018582166596625e+142)
  verify_log_grid_bits([actual], [326.9689396974654])
}

///|
test "Log independent natural logarithm 143" {
  let actual = log_grid_natural_log(2.2518092793146312e+142)
  verify_log_grid_bits([actual], [327.77881722237606])
}

///|
test "Log independent natural logarithm 144" {
  let actual = log_grid_natural_log(1.2534783042120815e+147)
  verify_log_grid_bits([actual], [338.7059310004237])
}

///|
test "Log independent natural logarithm 145" {
  let actual = log_grid_natural_log(7.30002492787947e+152)
  verify_log_grid_bits([actual], [351.98081189802144])
}

///|
test "Log independent natural logarithm 146" {
  let actual = log_grid_natural_log(2.1654803778948635e+154)
  verify_log_grid_bits([actual], [355.3707465414792])
}

///|
test "Log independent natural logarithm 147" {
  let actual = log_grid_natural_log(6.89863032642865e+156)
  verify_log_grid_bits([actual], [361.1345973955538])
}

///|
test "Log independent natural logarithm 148" {
  let actual = log_grid_natural_log(7.230427496100265e+162)
  verify_log_grid_bits([actual], [374.9970832275494])
}

///|
test "Log independent natural logarithm 149" {
  let actual = log_grid_natural_log(1.2631428279939716e+163)
  verify_log_grid_bits([actual], [375.5549730813017])
}

///|
test "Log independent natural logarithm 150" {
  let actual = log_grid_natural_log(2.5455274296814645e+165)
  verify_log_grid_bits([actual], [380.8608782140736])
}

///|
test "Log independent natural logarithm 151" {
  let actual = log_grid_natural_log(1.1037170502375646e+175)
  verify_log_grid_bits([actual], [403.05107489388905])
}

///|
test "Log independent natural logarithm 152" {
  let actual = log_grid_natural_log(1.1323451202655313e+178)
  verify_log_grid_bits([actual], [409.98443736281536])
}

///|
test "Log independent natural logarithm 153" {
  let actual = log_grid_natural_log(1.4714864183853044e+178)
  verify_log_grid_bits([actual], [410.2464196118134])
}

///|
test "Log independent natural logarithm 154" {
  let actual = log_grid_natural_log(1.0095825668927783e+183)
  verify_log_grid_bits([actual], [421.3826089632253])
}

///|
test "Log independent natural logarithm 155" {
  let actual = log_grid_natural_log(1.526778939315548e+183)
  verify_log_grid_bits([actual], [421.7962322657007])
}

///|
test "Log independent natural logarithm 156" {
  let actual = log_grid_natural_log(4.086768464778961e+192)
  verify_log_grid_bits([actual], [443.5040924062019])
}

///|
test "Log independent natural logarithm 157" {
  let actual = log_grid_natural_log(3.2783674280194616e+195)
  verify_log_grid_bits([actual], [450.1914386969637])
}

///|
test "Log independent natural logarithm 158" {
  let actual = log_grid_natural_log(1.1152258597335946e+198)
  verify_log_grid_bits([actual], [456.02090536200313])
}

///|
test "Log independent natural logarithm 159" {
  let actual = log_grid_natural_log(9.999999999999998e+199)
  verify_log_grid_bits([actual], [460.51701859880916])
}

///|
test "Log independent natural logarithm 160" {
  let actual = log_grid_natural_log(1.0e+200)
  verify_log_grid_bits([actual], [460.51701859880916])
}

///|
test "Log independent natural logarithm 161" {
  let actual = log_grid_natural_log(1.0000000000000001e+200)
  verify_log_grid_bits([actual], [460.51701859880916])
}

///|
test "Log independent natural logarithm 162" {
  let actual = log_grid_natural_log(5.061648562421616e+200)
  verify_log_grid_bits([actual], [462.1387108318964])
}

///|
test "Log independent natural logarithm 163" {
  let actual = log_grid_natural_log(3.1894982524439394e+208)
  verify_log_grid_bits([actual], [480.09756295955214])
}

///|
test "Log independent natural logarithm 164" {
  let actual = log_grid_natural_log(9.292680483829582e+211)
  verify_log_grid_bits([actual], [488.074681667271])
}

///|
test "Log independent natural logarithm 165" {
  let actual = log_grid_natural_log(3.690964890514742e+232)
  verify_log_grid_bits([actual], [535.5056294864333])
}

///|
test "Log independent natural logarithm 166" {
  let actual = log_grid_natural_log(1.4873861195768472e+236)
  verify_log_grid_bits([actual], [543.807102243834])
}

///|
test "Log independent natural logarithm 167" {
  let actual = log_grid_natural_log(3.072899432576743e+245)
  verify_log_grid_bits([actual], [565.2559693400157])
}

///|
test "Log independent natural logarithm 168" {
  let actual = log_grid_natural_log(7.011689260226886e+245)
  verify_log_grid_bits([actual], [566.0809264341914])
}

///|
test "Log independent natural logarithm 169" {
  let actual = log_grid_natural_log(1.838612635494612e+255)
  verify_log_grid_bits([actual], [587.7682099982511])
}

///|
test "Log independent natural logarithm 170" {
  let actual = log_grid_natural_log(3.2264310805304725e+255)
  verify_log_grid_bits([actual], [588.3305753112043])
}

///|
test "Log independent natural logarithm 171" {
  let actual = log_grid_natural_log(9.282634032995702e+262)
  verify_log_grid_bits([actual], [605.5054397107257])
}

///|
test "Log independent natural logarithm 172" {
  let actual = log_grid_natural_log(3.3346252162611286e+264)
  verify_log_grid_bits([actual], [609.0868248445485])
}

///|
test "Log independent natural logarithm 173" {
  let actual = log_grid_natural_log(2.604182540006324e+269)
  verify_log_grid_bits([actual], [620.3525088371365])
}

///|
test "Log independent natural logarithm 174" {
  let actual = log_grid_natural_log(4.6404461475451406e+278)
  verify_log_grid_bits([actual], [641.6534663664487])
}

///|
test "Log independent natural logarithm 175" {
  let actual = log_grid_natural_log(3.293691773309559e+281)
  verify_log_grid_bits([actual], [648.2184201865456])
}

///|
test "Log independent natural logarithm 176" {
  let actual = log_grid_natural_log(9.966378512762905e+281)
  verify_log_grid_bits([actual], [649.3256284108745])
}

///|
test "Log independent natural logarithm 177" {
  let actual = log_grid_natural_log(6.75442435033593e+287)
  verify_log_grid_bits([actual], [662.7521194387649])
}

///|
test "Log independent natural logarithm 178" {
  let actual = log_grid_natural_log(3.8665949258710807e+289)
  verify_log_grid_bits([actual], [666.7994661308973])
}

///|
test "Log independent natural logarithm 179" {
  let actual = log_grid_natural_log(2.2863429337676152e+291)
  verify_log_grid_bits([actual], [670.8792156301603])
}

///|
test "Log independent natural logarithm 180" {
  let actual = log_grid_natural_log(8.637011668396569e+294)
  verify_log_grid_bits([actual], [679.1160739915247])
}

///|
test "Log independent natural logarithm 181" {
  let actual = log_grid_natural_log(6.444051243174227e+296)
  verify_log_grid_bits([actual], [683.4283449435961])
}

///|
test "Log independent natural logarithm 182" {
  let actual = log_grid_natural_log(9.999999999999999e+299)
  verify_log_grid_bits([actual], [690.7755278982137])
}

///|
test "Log independent natural logarithm 183" {
  let actual = log_grid_natural_log(1.0e+300)
  verify_log_grid_bits([actual], [690.7755278982137])
}

///|
test "Log independent natural logarithm 184" {
  let actual = log_grid_natural_log(1.0000000000000002e+300)
  verify_log_grid_bits([actual], [690.7755278982137])
}

///|
test "Log independent natural logarithm 185" {
  let actual = log_grid_natural_log(1.3177200456074627e+301)
  verify_log_grid_bits([actual], [693.3540159962341])
}

///|
test "Log independent natural logarithm 186" {
  let actual = log_grid_natural_log(3.2478943352935097e+301)
  verify_log_grid_bits([actual], [694.2561198807408])
}

///|
test "Log independent natural logarithm 187" {
  let actual = log_grid_natural_log(1.7976931348623157e+308)
  verify_log_grid_bits([actual], [709.782712893384])
}

///|
test "Log generic ln ratio retains the original upward decade boundary" {
  verify_log_grid_bits([log_decade_greater_equal(0.01, 10.0)], [0.1])
}
