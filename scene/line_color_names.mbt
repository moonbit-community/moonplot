// Generated from pinned complete original color map and to_rgba; do not edit.
// Exact lookup only. Native casing/none/hex/gray/C syntax is handled separately.
// colors.py SHA256 ef4173f9e8310bc75714e32c3855719c27916c6c651b5c94e39f00163842cf04
// _color_data.py SHA256 93ec1d4e2e80ac9c64b2a05f313fbb532daa5b3f175f84e1e60b237f7d82c263

///|
fn line_color_named_components(
  red : UInt64,
  green : UInt64,
  blue : UInt64,
) -> @colors.Rgba {
  try! @colors.rgba(
    red.reinterpret_as_double(),
    green.reinterpret_as_double(),
    blue.reinterpret_as_double(),
  )
}

///|
fn line_color_named(value : String) -> @colors.Rgba? {
  match value {
    "xkcd:cloudy blue" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4605027755448883288UL, 4605840169499310907UL,
        ),
      )
    "xkcd:dark pastel green" =>
      Some(
        line_color_named_components(
          4599747064121103766UL, 4604321308448511446UL, 4599817708821140950UL,
        ),
      )
    "xkcd:dust" =>
      Some(
        line_color_named_components(
          4604462597848585814UL, 4603579539098121011UL, 4601442536921996188UL,
        ),
      )
    "xkcd:electric lime" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4607182418800017408UL, 4580178482210803728UL,
        ),
      )
    "xkcd:fresh green" =>
      Some(
        line_color_named_components(
          4601089313421810266UL, 4605804847149292315UL, 4599252551220843476UL,
        ),
      )
    "xkcd:light eggplant" =>
      Some(
        line_color_named_components(
          4603014381497823537UL, 4598546104220471633UL, 4602873092097749169UL,
        ),
      )
    "xkcd:nasty green" =>
      Some(
        line_color_named_components(
          4601583826322070556UL, 4604462597848585814UL, 4598069252495220640UL,
        ),
      )
    "xkcd:really light blue" =>
      Some(
        line_color_named_components(
          4605663557749217947UL, 4607182418800017408UL, 4607182418800017408UL,
        ),
      )
    "xkcd:tea" =>
      Some(
        line_color_named_components(
          4600806734621661529UL, 4604215341398455669UL, 4602431562722516767UL,
        ),
      )
    "xkcd:warm purple" =>
      Some(
        line_color_named_components(
          4603438249698046643UL, 4595667332693956375UL, 4603226315597935090UL,
        ),
      )
    "xkcd:yellowish tan" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4607076451749961632UL, 4602731802697674800UL,
        ),
      )
    "xkcd:cement" =>
      Some(
        line_color_named_components(
          4604003407298344117UL, 4603932762598306932UL, 4603296960297972274UL,
        ),
      )
    "xkcd:dark grass green" =>
      Some(
        line_color_named_components(
          4597080226694700060UL, 4602696480347656208UL, 4580178482210803728UL,
        ),
      )
    "xkcd:dusty teal" =>
      Some(
        line_color_named_components(
          4599040617120731923UL, 4603261637947953682UL, 4602873092097749169UL,
        ),
      )
    "xkcd:grey teal" | "xkcd:gray teal" =>
      Some(
        line_color_named_components(
          4600312221721401240UL, 4603650183798158195UL, 4603049703847842129UL,
        ),
      )
    "xkcd:macaroni and cheese" =>
      Some(
        line_color_named_components(
          4606617261199719934UL, 4604533242548622999UL, 4596656358494476955UL,
        ),
      )
    "xkcd:pinkish tan" =>
      Some(
        line_color_named_components(
          4605840169499310907UL, 4603650183798158195UL, 4602767125047693392UL,
        ),
      )
    "xkcd:spruce" =>
      Some(
        line_color_named_components(
          4585812397038769172UL, 4600382866421438424UL, 4597080226694700060UL,
        ),
      )
    "xkcd:strong blue" =>
      Some(
        line_color_named_components(
          4586942712239364120UL, 4582439112611993624UL, 4606899839999868671UL,
        ),
      )
    "xkcd:toxic green" =>
      Some(
        line_color_named_components(
          4600524155821512792UL, 4606016781249403868UL, 4595102175093658901UL,
        ),
      )
    "xkcd:windows blue" =>
      Some(
        line_color_named_components(
          4596938937294625692UL, 4602148983922368030UL, 4604921788398827512UL,
        ),
      )
    "xkcd:blue blue" =>
      Some(
        line_color_named_components(
          4593971859893063953UL, 4598334170120360081UL, 4605204367198976249UL,
        ),
      )
    "xkcd:blue with a hint of purple" =>
      Some(
        line_color_named_components(
          4599535130020992213UL, 4597645384294997534UL, 4605169044848957657UL,
        ),
      )
    "xkcd:booger" =>
      Some(
        line_color_named_components(
          4603650183798158195UL, 4604568564898641591UL, 4597645384294997534UL,
        ),
      )
    "xkcd:bright sea green" =>
      Some(
        line_color_named_components(
          4581308797411398676UL, 4607182418800017408UL, 4604038729648362709UL,
        ),
      )
    "xkcd:dark green blue" =>
      Some(
        line_color_named_components(
          4593424363467775775UL, 4600665445221587161UL, 4599817708821140950UL,
        ),
      )
    "xkcd:deep turquoise" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4601795760422182109UL, 4601866405122219293UL,
        ),
      )
    "xkcd:green teal" =>
      Some(
        line_color_named_components(
          4586942712239364120UL, 4604568564898641591UL, 4602078339222330846UL,
        ),
      )
    "xkcd:strong pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4583569427812588572UL, 4603014381497823537UL,
        ),
      )
    "xkcd:bland" =>
      Some(
        line_color_named_components(
          4604356630798530038UL, 4604109374348399893UL, 4603085026197860721UL,
        ),
      )
    "xkcd:deep aqua" =>
      Some(
        line_color_named_components(
          4584682081838174224UL, 4602148983922368030UL, 4602643496822628320UL,
        ),
      )
    "xkcd:lavender pink" =>
      Some(
        line_color_named_components(
          4605981458899385276UL, 4602873092097749169UL, 4605769524799273723UL,
        ),
      )
    "xkcd:light moss green" =>
      Some(
        line_color_named_components(
          4604038729648362709UL, 4605239689548994841UL, 4601937049822256477UL,
        ),
      )
    "xkcd:light seafoam green" =>
      Some(
        line_color_named_components(
          4604074051998381301UL, 4607182418800017408UL, 4604568564898641591UL,
        ),
      )
    "xkcd:olive yellow" =>
      Some(
        line_color_named_components(
          4605027755448883288UL, 4604639209598678775UL, 4585247239438471698UL,
        ),
      )
    "xkcd:pig pink" =>
      Some(
        line_color_named_components(
          4606334682399571197UL, 4603190993247916498UL, 4604003407298344117UL,
        ),
      )
    "xkcd:deep lilac" =>
      Some(
        line_color_named_components(
          4603473572048065235UL, 4601442536921996188UL, 4604851143698790328UL,
        ),
      )
    "xkcd:desert" =>
      Some(
        line_color_named_components(
          4605380978949069210UL, 4604285986098492854UL, 4600453511121475608UL,
        ),
      )
    "xkcd:dusty lavender" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4602908414447767761UL, 4604109374348399893UL,
        ),
      )
    "xkcd:purpley grey" | "xkcd:purpley gray" =>
      Some(
        line_color_named_components(
          4603402927348028051UL, 4602572852122591136UL, 4603402927348028051UL,
        ),
      )
    "xkcd:purply" =>
      Some(
        line_color_named_components(
          4603544216748102419UL, 4598069252495220640UL, 4604462597848585814UL,
        ),
      )
    "xkcd:candy pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4600665445221587161UL, 4606405327099608381UL,
        ),
      )
    "xkcd:light pastel green" =>
      Some(
        line_color_named_components(
          4604462597848585814UL, 4607041129399943039UL, 4604003407298344117UL,
        ),
      )
    "xkcd:boring green" =>
      Some(
        line_color_named_components(
          4600665445221587161UL, 4604497920198604406UL, 4600806734621661529UL,
        ),
      )
    "xkcd:kiwi green" =>
      Some(
        line_color_named_components(
          4603190993247916498UL, 4606264037699534013UL, 4598069252495220640UL,
        ),
      )
    "xkcd:light grey green" | "xkcd:light gray green" =>
      Some(
        line_color_named_components(
          4604639209598678775UL, 4606122748299459644UL, 4603862117898269748UL,
        ),
      )
    "xkcd:orange pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4601513181622033372UL, 4599464485320955029UL,
        ),
      )
    "xkcd:tea green" =>
      Some(
        line_color_named_components(
          4604851143698790328UL, 4606935162349887263UL, 4603932762598306932UL,
        ),
      )
    "xkcd:very light brown" =>
      Some(
        line_color_named_components(
          4605628235399199354UL, 4604603887248660183UL, 4602802447397711984UL,
        ),
      )
    "xkcd:egg shell" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607076451749961632UL, 4605098400148920473UL,
        ),
      )
    "xkcd:eggplant purple" =>
      Some(
        line_color_named_components(
          4598404814820397265UL, 4581308797411398676UL, 4598263525420322896UL,
        ),
      )
    "xkcd:powder pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604462597848585814UL, 4605522268349143578UL,
        ),
      )
    "xkcd:reddish grey" | "xkcd:reddish gray" =>
      Some(
        line_color_named_components(
          4603579539098121011UL, 4601937049822256477UL, 4601583826322070556UL,
        ),
      )
    "xkcd:baby shit brown" =>
      Some(
        line_color_named_components(
          4604285986098492854UL, 4603261637947953682UL, 4587507869839661594UL,
        ),
      )
    "xkcd:liliac" =>
      Some(
        line_color_named_components(
          4605098400148920473UL, 4603190993247916498UL, 4607111774099980224UL,
        ),
      )
    "xkcd:stormy blue" =>
      Some(
        line_color_named_components(
          4599323195920880660UL, 4602360918022479583UL, 4603685506148176788UL,
        ),
      )
    "xkcd:ugly brown" =>
      Some(
        line_color_named_components(
          4602502207422553951UL, 4601654471022107740UL, 4577935512984623128UL,
        ),
      )
    "xkcd:custard" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607111774099980224UL, 4602148983922368030UL,
        ),
      )
    "xkcd:darkish pink" =>
      Some(
        line_color_named_components(
          4605875491849329499UL, 4598616748920508818UL, 4602502207422553951UL,
        ),
      )
    "xkcd:deep brown" =>
      Some(
        line_color_named_components(
          4598263525420322896UL, 4575674882583433232UL, 0UL,
        ),
      )
    "xkcd:greenish beige" =>
      Some(
        line_color_named_components(
          4605275011899013433UL, 4605557590699162170UL, 4602219628622405214UL,
        ),
      )
    "xkcd:manilla" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607005807049924447UL, 4602908414447767761UL,
        ),
      )
    "xkcd:off blue" =>
      Some(
        line_color_named_components(
          4599747064121103766UL, 4602837769747730577UL, 4604321308448511446UL,
        ),
      )
    "xkcd:battleship grey" | "xkcd:battleship gray" =>
      Some(
        line_color_named_components(
          4601230602821884635UL, 4602431562722516767UL, 4602873092097749169UL,
        ),
      )
    "xkcd:browny green" =>
      Some(
        line_color_named_components(
          4601513181622033372UL, 4601301247521921819UL, 4585812397038769172UL,
        ),
      )
    "xkcd:bruise" =>
      Some(
        line_color_named_components(
          4602572852122591136UL, 4598192880720285712UL, 4601654471022107740UL,
        ),
      )
    "xkcd:kelley green" =>
      Some(
        line_color_named_components(
          0UL, 4603367604998009458UL, 4596938937294625692UL,
        ),
      )
    "xkcd:sickly yellow" =>
      Some(
        line_color_named_components(
          4605522268349143578UL, 4606228715349515421UL, 4594960885693584533UL,
        ),
      )
    "xkcd:sunny yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606970484699905855UL, 4591163733066585879UL,
        ),
      )
    "xkcd:azul" =>
      Some(
        line_color_named_components(
          4592859205867478301UL, 4600241577021364055UL, 4606511294149664158UL,
        ),
      )
    "xkcd:darkgreen" =>
      Some(
        line_color_named_components(
          4581308797411398676UL, 4598828683020620370UL, 4583569427812588572UL,
        ),
      )
    "xkcd:green/yellow" =>
      Some(
        line_color_named_components(
          4604568564898641591UL, 4605451623649106394UL, 4584682081838174224UL,
        ),
      )
    "xkcd:lichen" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4604603887248660183UL, 4602360918022479583UL,
        ),
      )
    "xkcd:light light green" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4607182418800017408UL, 4604391953148548630UL,
        ),
      )
    "xkcd:pale gold" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4606016781249403868UL, 4601301247521921819UL,
        ),
      )
    "xkcd:sun yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606052103599422460UL, 4593971859893063953UL,
        ),
      )
    "xkcd:tan green" =>
      Some(
        line_color_named_components(
          4604144696698418485UL, 4604886466048808920UL, 4601583826322070556UL,
        ),
      )
    "xkcd:burple" =>
      Some(
        line_color_named_components(
          4601018668721773082UL, 4596232490294253849UL, 4606193392999496828UL,
        ),
      )
    "xkcd:butterscotch" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4604427275498567222UL, 4598687393620546002UL,
        ),
      )
    "xkcd:toupe" =>
      Some(
        line_color_named_components(
          4605204367198976249UL, 4604250663748474262UL, 4602502207422553951UL,
        ),
      )
    "xkcd:dark cream" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606758550599794302UL, 4603614861448139603UL,
        ),
      )
    "xkcd:indian red" =>
      Some(
        line_color_named_components(
          4602873092097749169UL, 4588073027439959068UL, 4580178482210803728UL,
        ),
      )
    "xkcd:light lavendar" =>
      Some(
        line_color_named_components(
          4606617261199719934UL, 4604957110748846104UL, 4607147096449998816UL,
        ),
      )
    "xkcd:poison green" =>
      Some(
        line_color_named_components(
          4598192880720285712UL, 4607111774099980224UL, 4590315996666139668UL,
        ),
      )
    "xkcd:baby puke green" =>
      Some(
        line_color_named_components(
          4604603887248660183UL, 4605098400148920473UL, 4582439112611993624UL,
        ),
      )
    "xkcd:bright yellow green" =>
      Some(
        line_color_named_components(
          4603720828498195380UL, 4607182418800017408UL, 0UL,
        ),
      )
    "xkcd:charcoal grey" | "xkcd:charcoal gray" =>
      Some(
        line_color_named_components(
          4597645384294997534UL, 4598263525420322896UL, 4598334170120360081UL,
        ),
      )
    "xkcd:squash" =>
      Some(
        line_color_named_components(
          4606723228249775710UL, 4604215341398455669UL, 4590598575466288405UL,
        ),
      )
    "xkcd:cinnamon" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4599252551220843476UL, 4582439112611993624UL,
        ),
      )
    "xkcd:light pea green" =>
      Some(
        line_color_named_components(
          4605098400148920473UL, 4607147096449998816UL, 4602767125047693392UL,
        ),
      )
    "xkcd:radioactive green" =>
      Some(
        line_color_named_components(
          4595384753893807638UL, 4607005807049924447UL, 4593424363467775775UL,
        ),
      )
    "xkcd:raw sienna" =>
      Some(
        line_color_named_components(
          4603614861448139603UL, 4600594800521549977UL, 0UL,
        ),
      )
    "xkcd:baby purple" =>
      Some(
        line_color_named_components(
          4605310334249032025UL, 4603650183798158195UL, 4606899839999868671UL,
        ),
      )
    "xkcd:cocoa" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4600382866421438424UL, 4598334170120360081UL,
        ),
      )
    "xkcd:light royal blue" =>
      Some(
        line_color_named_components(
          4597362805494848797UL, 4595667332693956375UL, 4607147096449998816UL,
        ),
      )
    "xkcd:orangeish" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4603155670897897906UL, 4598828683020620370UL,
        ),
      )
    "xkcd:rust brown" =>
      Some(
        line_color_named_components(
          4603085026197860721UL, 4596091200894179481UL, 4577935512984623128UL,
        ),
      )
    "xkcd:sand brown" =>
      Some(
        line_color_named_components(
          4605345656599050617UL, 4604003407298344117UL, 4600453511121475608UL,
        ),
      )
    "xkcd:swamp" =>
      Some(
        line_color_named_components(
          4601089313421810266UL, 4602802447397711984UL, 4597221516094774429UL,
        ),
      )
    "xkcd:tealish green" =>
      Some(
        line_color_named_components(
          4586942712239364120UL, 4605946136549366684UL, 4601795760422182109UL,
        ),
      )
    "xkcd:burnt siena" =>
      Some(
        line_color_named_components(
          4604639209598678775UL, 4599464485320955029UL, 4577935512984623128UL,
        ),
      )
    "xkcd:camo" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4603226315597935090UL, 4599181906520806292UL,
        ),
      )
    "xkcd:dusk blue" =>
      Some(
        line_color_named_components(
          4594537017493361427UL, 4599535130020992213UL, 4603155670897897906UL,
        ),
      )
    "xkcd:fern" =>
      Some(
        line_color_named_components(
          4600665445221587161UL, 4604144696698418485UL, 4599323195920880660UL,
        ),
      )
    "xkcd:old rose" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4602643496822628320UL, 4603014381497823537UL,
        ),
      )
    "xkcd:pale light green" =>
      Some(
        line_color_named_components(
          4604427275498567222UL, 4607076451749961632UL, 4603579539098121011UL,
        ),
      )
    "xkcd:peachy pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4603614861448139603UL, 4603049703847842129UL,
        ),
      )
    "xkcd:rosy pink" =>
      Some(
        line_color_named_components(
          4606864517649850079UL, 4601018668721773082UL, 4603190993247916498UL,
        ),
      )
    "xkcd:light bluish green" =>
      Some(
        line_color_named_components(
          4602007694522293662UL, 4607111774099980224UL, 4604109374348399893UL,
        ),
      )
    "xkcd:light bright green" =>
      Some(
        line_color_named_components(
          4599535130020992213UL, 4607147096449998816UL, 4600170932321326871UL,
        ),
      )
    "xkcd:light neon green" =>
      Some(
        line_color_named_components(
          4599181906520806292UL, 4607111774099980224UL, 4599605774721029397UL,
        ),
      )
    "xkcd:light seafoam" =>
      Some(
        line_color_named_components(
          4603826795548251156UL, 4607147096449998816UL, 4604921788398827512UL,
        ),
      )
    "xkcd:tiffany blue" =>
      Some(
        line_color_named_components(
          4602360918022479583UL, 4606723228249775710UL, 4605875491849329499UL,
        ),
      )
    "xkcd:washed out green" =>
      Some(
        line_color_named_components(
          4604815821348771736UL, 4606829195299831487UL, 4604038729648362709UL,
        ),
      )
    "xkcd:browny orange" =>
      Some(
        line_color_named_components(
          4605310334249032025UL, 4601230602821884635UL, 4575674882583433232UL,
        ),
      )
    "xkcd:nice blue" =>
      Some(
        line_color_named_components(
          4589185681465544720UL, 4602290273322442399UL, 4604391953148548630UL,
        ),
      )
    "xkcd:sapphire" =>
      Some(
        line_color_named_components(
          4593830570492989585UL, 4597080226694700060UL, 4604215341398455669UL,
        ),
      )
    "xkcd:greyish teal" | "xkcd:grayish teal" =>
      Some(
        line_color_named_components(
          4601654471022107740UL, 4603791473198232564UL, 4603296960297972274UL,
        ),
      )
    "xkcd:orangey yellow" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4604709854298715959UL, 4590598575466288405UL,
        ),
      )
    "xkcd:parchment" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4607076451749961632UL, 4604356630798530038UL,
        ),
      )
    "xkcd:straw" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4606864517649850079UL, 4602219628622405214UL,
        ),
      )
    "xkcd:very dark brown" =>
      Some(
        line_color_named_components(
          4592859205867478301UL, 4575674882583433232UL, 0UL,
        ),
      )
    "xkcd:terracota" =>
      Some(
        line_color_named_components(
          4605345656599050617UL, 4601018668721773082UL, 4598404814820397265UL,
        ),
      )
    "xkcd:ugly blue" =>
      Some(
        line_color_named_components(
          4596091200894179481UL, 4600877379321698714UL, 4603049703847842129UL,
        ),
      )
    "xkcd:clear blue" =>
      Some(
        line_color_named_components(
          4594254438693212690UL, 4602290273322442399UL, 4607111774099980224UL,
        ),
      )
    "xkcd:creme" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4604603887248660183UL,
        ),
      )
    "xkcd:foam green" =>
      Some(
        line_color_named_components(
          4603261637947953682UL, 4607111774099980224UL, 4604144696698418485UL,
        ),
      )
    "xkcd:grey/green" | "xkcd:gray/green" =>
      Some(
        line_color_named_components(
          4602908414447767761UL, 4603862117898269748UL, 4602502207422553951UL,
        ),
      )
    "xkcd:light gold" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4605946136549366684UL, 4600170932321326871UL,
        ),
      )
    "xkcd:seafoam blue" =>
      Some(
        line_color_named_components(
          4602148983922368030UL, 4605557590699162170UL, 4604603887248660183UL,
        ),
      )
    "xkcd:topaz" =>
      Some(
        line_color_named_components(
          4590033417865990931UL, 4604780498998753143UL, 4604356630798530038UL,
        ),
      )
    "xkcd:violet pink" =>
      Some(
        line_color_named_components(
          4607041129399943039UL, 4600382866421438424UL, 4607076451749961632UL,
        ),
      )
    "xkcd:wintergreen" =>
      Some(
        line_color_named_components(
          4593689281092915216UL, 4606970484699905855UL, 4602908414447767761UL,
        ),
      )
    "xkcd:yellow tan" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606193392999496828UL, 4601442536921996188UL,
        ),
      )
    "xkcd:dark fuchsia" =>
      Some(
        line_color_named_components(
          4603720828498195380UL, 4583569427812588572UL, 4599958998221215318UL,
        ),
      )
    "xkcd:indigo blue" =>
      Some(
        line_color_named_components(
          4597362805494848797UL, 4591446311866734616UL, 4604427275498567222UL,
        ),
      )
    "xkcd:light yellowish green" =>
      Some(
        line_color_named_components(
          4605027755448883288UL, 4607182418800017408UL, 4603014381497823537UL,
        ),
      )
    "xkcd:pale magenta" =>
      Some(
        line_color_named_components(
          4605769524799273723UL, 4600948024021735898UL, 4604285986098492854UL,
        ),
      )
    "xkcd:rich purple" =>
      Some(
        line_color_named_components(
          4601725115722144925UL, 0UL, 4599888353521178134UL,
        ),
      )
    "xkcd:sunflower yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4605875491849329499UL, 4577935512984623128UL,
        ),
      )
    "xkcd:green/blue" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4604957110748846104UL, 4603155670897897906UL,
        ),
      )
    "xkcd:leather" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4601866405122219293UL, 4596515069094402586UL,
        ),
      )
    "xkcd:racing green" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4598616748920508818UL, 0UL,
        ),
      )
    "xkcd:vivid purple" =>
      Some(
        line_color_named_components(
          4603579539098121011UL, 0UL, 4607005807049924447UL,
        ),
      )
    "xkcd:dark royal blue" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4582439112611993624UL, 4601513181622033372UL,
        ),
      )
    "xkcd:hazel" =>
      Some(
        line_color_named_components(
          4603190993247916498UL, 4602007694522293662UL, 4591446311866734616UL,
        ),
      )
    "xkcd:muted pink" =>
      Some(
        line_color_named_components(
          4605557590699162170UL, 4602007694522293662UL, 4603226315597935090UL,
        ),
      )
    "xkcd:booger green" =>
      Some(
        line_color_named_components(
          4603473572048065235UL, 4604533242548622999UL, 4577935512984623128UL,
        ),
      )
    "xkcd:canary" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4607182418800017408UL, 4600665445221587161UL,
        ),
      )
    "xkcd:cool grey" | "xkcd:cool gray" =>
      Some(
        line_color_named_components(
          4603438249698046643UL, 4603932762598306932UL, 4604038729648362709UL,
        ),
      )
    "xkcd:dark taupe" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4601018668721773082UL, 4599181906520806292UL,
        ),
      )
    "xkcd:darkish purple" =>
      Some(
        line_color_named_components(
          4601937049822256477UL, 4591728890666883353UL, 4601795760422182109UL,
        ),
      )
    "xkcd:true green" =>
      Some(
        line_color_named_components(
          4584682081838174224UL, 4603402927348028051UL, 4580178482210803728UL,
        ),
      )
    "xkcd:coral pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4600524155821512792UL, 4600665445221587161UL,
        ),
      )
    "xkcd:dark sage" =>
      Some(
        line_color_named_components(
          4599958998221215318UL, 4602873092097749169UL, 4599747064121103766UL,
        ),
      )
    "xkcd:dark slate blue" =>
      Some(
        line_color_named_components(
          4593830570492989585UL, 4598687393620546002UL, 4600524155821512792UL,
        ),
      )
    "xkcd:flat blue" =>
      Some(
        line_color_named_components(
          4597645384294997534UL, 4601795760422182109UL, 4604109374348399893UL,
        ),
      )
    "xkcd:mushroom" =>
      Some(
        line_color_named_components(
          4604745176648734551UL, 4603756150848213972UL, 4602979059147804945UL,
        ),
      )
    "xkcd:rich blue" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4592294048267180827UL, 4606970484699905855UL,
        ),
      )
    "xkcd:dirty purple" =>
      Some(
        line_color_named_components(
          4601795760422182109UL, 4598899327720657555UL, 4600806734621661529UL,
        ),
      )
    "xkcd:greenblue" =>
      Some(
        line_color_named_components(
          4594113149293138322UL, 4605098400148920473UL, 4603085026197860721UL,
        ),
      )
    "xkcd:icky green" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4604321308448511446UL, 4593971859893063953UL,
        ),
      )
    "xkcd:light khaki" =>
      Some(
        line_color_named_components(
          4606299360049552605UL, 4606723228249775710UL, 4603897440248288340UL,
        ),
      )
    "xkcd:warm blue" =>
      Some(
        line_color_named_components(
          4598969972420694739UL, 4599817708821140950UL, 4605910814199348091UL,
        ),
      )
    "xkcd:dark hot pink" =>
      Some(
        line_color_named_components(
          4605840169499310907UL, 4571171282956062736UL, 4600877379321698714UL,
        ),
      )
    "xkcd:deep sea blue" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4599605774721029397UL, 4602767125047693392UL,
        ),
      )
    "xkcd:carmine" =>
      Some(
        line_color_named_components(
          4603720828498195380UL, 4575674882583433232UL, 4590881154266437142UL,
        ),
      )
    "xkcd:dark yellow green" =>
      Some(
        line_color_named_components(
          4601725115722144925UL, 4603226315597935090UL, 4575674882583433232UL,
        ),
      )
    "xkcd:pale peach" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606264037699534013UL, 4604285986098492854UL,
        ),
      )
    "xkcd:plum purple" =>
      Some(
        line_color_named_components(
          4599181906520806292UL, 4581308797411398676UL, 4599323195920880660UL,
        ),
      )
    "xkcd:golden rod" =>
      Some(
        line_color_named_components(
          4606970484699905855UL, 4604815821348771736UL, 4584682081838174224UL,
        ),
      )
    "xkcd:neon red" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4583569427812588572UL, 4597362805494848797UL,
        ),
      )
    "xkcd:old pink" =>
      Some(
        line_color_named_components(
          4605204367198976249UL, 4602219628622405214UL, 4602908414447767761UL,
        ),
      )
    "xkcd:very pale blue" =>
      Some(
        line_color_named_components(
          4605734202449255131UL, 4607182418800017408UL, 4607147096449998816UL,
        ),
      )
    "xkcd:blood orange" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4598969972420694739UL, 4577935512984623128UL,
        ),
      )
    "xkcd:grapefruit" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4599958998221215318UL, 4599747064121103766UL,
        ),
      )
    "xkcd:sand yellow" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4606122748299459644UL, 4600877379321698714UL,
        ),
      )
    "xkcd:clay brown" =>
      Some(
        line_color_named_components(
          4604462597848585814UL, 4601654471022107740UL, 4597786673695071903UL,
        ),
      )
    "xkcd:dark blue grey" | "xkcd:dark blue gray" =>
      Some(
        line_color_named_components(
          4593424363467775775UL, 4597504094894923166UL, 4599111261820769107UL,
        ),
      )
    "xkcd:flat green" =>
      Some(
        line_color_named_components(
          4601089313421810266UL, 4603720828498195380UL, 4599040617120731923UL,
        ),
      )
    "xkcd:light green blue" =>
      Some(
        line_color_named_components(
          4599747064121103766UL, 4607076451749961632UL, 4603897440248288340UL,
        ),
      )
    "xkcd:warm pink" =>
      Some(
        line_color_named_components(
          4607041129399943039UL, 4599676419421066581UL, 4602731802697674800UL,
        ),
      )
    "xkcd:dodger blue" =>
      Some(
        line_color_named_components(
          4597927963095146271UL, 4602767125047693392UL, 4607076451749961632UL,
        ),
      )
    "xkcd:gross green" =>
      Some(
        line_color_named_components(
          4603826795548251156UL, 4604921788398827512UL, 4590881154266437142UL,
        ),
      )
    "xkcd:ice" =>
      Some(
        line_color_named_components(
          4605734202449255131UL, 4607182418800017408UL, 4607005807049924447UL,
        ),
      )
    "xkcd:metallic blue" =>
      Some(
        line_color_named_components(
          4599252551220843476UL, 4601795760422182109UL, 4603190993247916498UL,
        ),
      )
    "xkcd:pale salmon" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604427275498567222UL, 4603614861448139603UL,
        ),
      )
    "xkcd:sap green" =>
      Some(
        line_color_named_components(
          4600170932321326871UL, 4603085026197860721UL, 4590598575466288405UL,
        ),
      )
    "xkcd:algae" =>
      Some(
        line_color_named_components(
          4599605774721029397UL, 4604250663748474262UL, 4601018668721773082UL,
        ),
      )
    "xkcd:bluey grey" | "xkcd:bluey gray" =>
      Some(
        line_color_named_components(
          4603014381497823537UL, 4603826795548251156UL, 4604391953148548630UL,
        ),
      )
    "xkcd:greeny grey" | "xkcd:greeny gray" =>
      Some(
        line_color_named_components(
          4602572852122591136UL, 4603826795548251156UL, 4602290273322442399UL,
        ),
      )
    "xkcd:highlighter green" =>
      Some(
        line_color_named_components(
          4592294048267180827UL, 4607076451749961632UL, 4582439112611993624UL,
        ),
      )
    "xkcd:light light blue" =>
      Some(
        line_color_named_components(
          4605310334249032025UL, 4607182418800017408UL, 4607041129399943039UL,
        ),
      )
    "xkcd:light mint" =>
      Some(
        line_color_named_components(
          4604603887248660183UL, 4607182418800017408UL, 4604780498998753143UL,
        ),
      )
    "xkcd:raw umber" =>
      Some(
        line_color_named_components(
          4604074051998381301UL, 4600312221721401240UL, 4585247239438471698UL,
        ),
      )
    "xkcd:vivid blue" =>
      Some(
        line_color_named_components(
          4590598575466288405UL, 4595667332693956375UL, 4607182418800017408UL,
        ),
      )
    "xkcd:deep lavender" =>
      Some(
        line_color_named_components(
          4603155670897897906UL, 4600312221721401240UL, 4604639209598678775UL,
        ),
      )
    "xkcd:dull teal" =>
      Some(
        line_color_named_components(
          4600382866421438424UL, 4603756150848213972UL, 4603226315597935090UL,
        ),
      )
    "xkcd:light greenish blue" =>
      Some(
        line_color_named_components(
          4600665445221587161UL, 4606899839999868671UL, 4604533242548622999UL,
        ),
      )
    "xkcd:mud green" =>
      Some(
        line_color_named_components(
          4600453511121475608UL, 4600877379321698714UL, 4575674882583433232UL,
        ),
      )
    "xkcd:pinky" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4602908414447767761UL, 4604180019048437077UL,
        ),
      )
    "xkcd:red wine" =>
      Some(
        line_color_named_components(
          4603120348547879314UL, 0UL, 4596515069094402586UL,
        ),
      )
    "xkcd:shit green" =>
      Some(
        line_color_named_components(
          4601937049822256477UL, 4602696480347656208UL, 0UL,
        ),
      )
    "xkcd:tan brown" =>
      Some(
        line_color_named_components(
          4604215341398455669UL, 4602572852122591136UL, 4599040617120731923UL,
        ),
      )
    "xkcd:darkblue" =>
      Some(
        line_color_named_components(
          4577935512984623128UL, 4583569427812588572UL, 4600736089921624345UL,
        ),
      )
    "xkcd:rosa" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4602908414447767761UL, 4603968084948325525UL,
        ),
      )
    "xkcd:lipstick" =>
      Some(
        line_color_named_components(
          4605698880099236539UL, 4591163733066585879UL, 4599181906520806292UL,
        ),
      )
    "xkcd:pale mauve" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4605522268349143578UL, 4607076451749961632UL,
        ),
      )
    "xkcd:claret" =>
      Some(
        line_color_named_components(
          4601018668721773082UL, 0UL, 4591446311866734616UL,
        ),
      )
    "xkcd:dandelion" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4606052103599422460UL, 4584682081838174224UL,
        ),
      )
    "xkcd:orangered" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4598334170120360081UL, 4588638185040256542UL,
        ),
      )
    "xkcd:poop green" =>
      Some(
        line_color_named_components(
          4601513181622033372UL, 4602431562722516767UL, 0UL,
        ),
      )
    "xkcd:ruby" =>
      Some(
        line_color_named_components(
          4605310334249032025UL, 4571171282956062736UL, 4598687393620546002UL,
        ),
      )
    "xkcd:dark" =>
      Some(
        line_color_named_components(
          4592294048267180827UL, 4594254438693212690UL, 4596091200894179481UL,
        ),
      )
    "xkcd:greenish turquoise" =>
      Some(
        line_color_named_components(
          0UL, 4607041129399943039UL, 4604391953148548630UL,
        ),
      )
    "xkcd:pastel red" =>
      Some(
        line_color_named_components(
          4605910814199348091UL, 4599888353521178134UL, 4599747064121103766UL,
        ),
      )
    "xkcd:piss yellow" =>
      Some(
        line_color_named_components(
          4605981458899385276UL, 4605734202449255131UL, 4591446311866734616UL,
        ),
      )
    "xkcd:bright cyan" =>
      Some(
        line_color_named_components(
          4598263525420322896UL, 4607111774099980224UL, 4607147096449998816UL,
        ),
      )
    "xkcd:dark coral" =>
      Some(
        line_color_named_components(
          4605486945999124986UL, 4599464485320955029UL, 4599181906520806292UL,
        ),
      )
    "xkcd:algae green" =>
      Some(
        line_color_named_components(
          4593830570492989585UL, 4605063077798901880UL, 4601513181622033372UL,
        ),
      )
    "xkcd:darkish red" =>
      Some(
        line_color_named_components(
          4604144696698418485UL, 4577935512984623128UL, 4584682081838174224UL,
        ),
      )
    "xkcd:reddy brown" =>
      Some(
        line_color_named_components(
          4601442536921996188UL, 4589185681465544720UL, 4581308797411398676UL,
        ),
      )
    "xkcd:blush pink" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4602767125047693392UL, 4603120348547879314UL,
        ),
      )
    "xkcd:camouflage green" =>
      Some(
        line_color_named_components(
          4598969972420694739UL, 4600524155821512792UL, 4590033417865990931UL,
        ),
      )
    "xkcd:lawn green" =>
      Some(
        line_color_named_components(
          4599111261820769107UL, 4603968084948325525UL, 4585247239438471698UL,
        ),
      )
    "xkcd:putty" =>
      Some(
        line_color_named_components(
          4604886466048808920UL, 4604321308448511446UL, 4603049703847842129UL,
        ),
      )
    "xkcd:vibrant blue" =>
      Some(
        line_color_named_components(
          4577935512984623128UL, 4597221516094774429UL, 4606935162349887263UL,
        ),
      )
    "xkcd:dark sand" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4603226315597935090UL, 4599958998221215318UL,
        ),
      )
    "xkcd:purple/blue" =>
      Some(
        line_color_named_components(
          4600241577021364055UL, 4593830570492989585UL, 4605522268349143578UL,
        ),
      )
    "xkcd:saffron" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4604462597848585814UL, 4585247239438471698UL,
        ),
      )
    "xkcd:twilight" =>
      Some(
        line_color_named_components(
          4599181906520806292UL, 4599393840620917844UL, 4603085026197860721UL,
        ),
      )
    "xkcd:warm brown" =>
      Some(
        line_color_named_components(
          4603473572048065235UL, 4599181906520806292UL, 4575674882583433232UL,
        ),
      )
    "xkcd:bluegrey" | "xkcd:bluegray" =>
      Some(
        line_color_named_components(
          4602873092097749169UL, 4603932762598306932UL, 4604462597848585814UL,
        ),
      )
    "xkcd:bubble gum pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4601089313421810266UL, 4604356630798530038UL,
        ),
      )
    "xkcd:duck egg blue" =>
      Some(
        line_color_named_components(
          4605063077798901880UL, 4607041129399943039UL, 4606793872949812895UL,
        ),
      )
    "xkcd:greenish cyan" =>
      Some(
        line_color_named_components(
          4595102175093658901UL, 4607147096449998816UL, 4604639209598678775UL,
        ),
      )
    "xkcd:petrol" =>
      Some(
        line_color_named_components(
          0UL, 4600382866421438424UL, 4601159958121847451UL,
        ),
      )
    "xkcd:royal" =>
      Some(
        line_color_named_components(
          4586942712239364120UL, 4591163733066585879UL, 4603367604998009458UL,
        ),
      )
    "xkcd:butter" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4602731802697674800UL,
        ),
      )
    "xkcd:dusty orange" =>
      Some(
        line_color_named_components(
          4606652583549738526UL, 4602802447397711984UL, 4597362805494848797UL,
        ),
      )
    "xkcd:off yellow" =>
      Some(
        line_color_named_components(
          4606687905899757118UL, 4606758550599794302UL, 4598069252495220640UL,
        ),
      )
    "xkcd:pale olive green" =>
      Some(
        line_color_named_components(
          4604427275498567222UL, 4605592913049180762UL, 4602360918022479583UL,
        ),
      )
    "xkcd:orangish" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4602767125047693392UL, 4598899327720657555UL,
        ),
      )
    "xkcd:leaf" =>
      Some(
        line_color_named_components(
          4601654471022107740UL, 4604180019048437077UL, 4596515069094402586UL,
        ),
      )
    "xkcd:light blue grey" | "xkcd:light blue gray" =>
      Some(
        line_color_named_components(
          4604639209598678775UL, 4605275011899013433UL, 4606158070649478236UL,
        ),
      )
    "xkcd:dried blood" =>
      Some(
        line_color_named_components(
          4598969972420694739UL, 4571171282956062736UL, 4571171282956062736UL,
        ),
      )
    "xkcd:lightish purple" =>
      Some(
        line_color_named_components(
          4604003407298344117UL, 4599464485320955029UL, 4606299360049552605UL,
        ),
      )
    "xkcd:rusty red" =>
      Some(
        line_color_named_components(
          4604356630798530038UL, 4595808622094030744UL, 4587507869839661594UL,
        ),
      )
    "xkcd:lavender blue" =>
      Some(
        line_color_named_components(
          4603085026197860721UL, 4602979059147804945UL, 4606935162349887263UL,
        ),
      )
    "xkcd:light grass green" =>
      Some(
        line_color_named_components(
          4603614861448139603UL, 4606899839999868671UL, 4600736089921624345UL,
        ),
      )
    "xkcd:light mint green" =>
      Some(
        line_color_named_components(
          4604038729648362709UL, 4607041129399943039UL, 4604462597848585814UL,
        ),
      )
    "xkcd:sunflower" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4605133722498939065UL, 4589750839065842194UL,
        ),
      )
    "xkcd:velvet" =>
      Some(
        line_color_named_components(
          4601937049822256477UL, 4584682081838174224UL, 4599393840620917844UL,
        ),
      )
    "xkcd:brick orange" =>
      Some(
        line_color_named_components(
          4604992433098864696UL, 4598899327720657555UL, 4585247239438471698UL,
        ),
      )
    "xkcd:lightish red" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4595808622094030744UL, 4598899327720657555UL,
        ),
      )
    "xkcd:pure blue" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4577935512984623128UL, 4606158070649478236UL,
        ),
      )
    "xkcd:twilight blue" =>
      Some(
        line_color_named_components(
          4585812397038769172UL, 4598404814820397265UL, 4602290273322442399UL,
        ),
      )
    "xkcd:violet red" =>
      Some(
        line_color_named_components(
          4604003407298344117UL, 0UL, 4599676419421066581UL,
        ),
      )
    "xkcd:yellowy brown" =>
      Some(
        line_color_named_components(
          4604321308448511446UL, 4603085026197860721UL, 4586942712239364120UL,
        ),
      )
    "xkcd:carnation" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4602219628622405214UL, 4603226315597935090UL,
        ),
      )
    "xkcd:muddy yellow" =>
      Some(
        line_color_named_components(
          4604921788398827512UL, 4604250663748474262UL, 4581308797411398676UL,
        ),
      )
    "xkcd:dark seafoam green" =>
      Some(
        line_color_named_components(
          4597927963095146271UL, 4604356630798530038UL, 4602007694522293662UL,
        ),
      )
    "xkcd:deep rose" =>
      Some(
        line_color_named_components(
          4605204367198976249UL, 4598687393620546002UL, 4600948024021735898UL,
        ),
      )
    "xkcd:dusty red" =>
      Some(
        line_color_named_components(
          4604709854298715959UL, 4598758038320583186UL, 4599181906520806292UL,
        ),
      )
    "xkcd:grey/blue" | "xkcd:gray/blue" =>
      Some(
        line_color_named_components(
          4600736089921624345UL, 4602502207422553951UL, 4603190993247916498UL,
        ),
      )
    "xkcd:lemon lime" =>
      Some(
        line_color_named_components(
          4604921788398827512UL, 4607147096449998816UL, 4594819596293510164UL,
        ),
      )
    "xkcd:purple/pink" =>
      Some(
        line_color_named_components(
          4605769524799273723UL, 4594395728093287059UL, 4606016781249403868UL,
        ),
      )
    "xkcd:brown yellow" =>
      Some(
        line_color_named_components(
          4604462597848585814UL, 4603508894398083827UL, 4581308797411398676UL,
        ),
      )
    "xkcd:purple brown" =>
      Some(
        line_color_named_components(
          4600948024021735898UL, 4597362805494848797UL, 4598069252495220640UL,
        ),
      )
    "xkcd:wisteria" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4602502207422553951UL, 4605027755448883288UL,
        ),
      )
    "xkcd:banana yellow" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4607147096449998816UL, 4598969972420694739UL,
        ),
      )
    "xkcd:lipstick red" =>
      Some(
        line_color_named_components(
          4604957110748846104UL, 4575674882583433232UL, 4595808622094030744UL,
        ),
      )
    "xkcd:water blue" =>
      Some(
        line_color_named_components(
          4588073027439959068UL, 4602943736797786353UL, 4605380978949069210UL,
        ),
      )
    "xkcd:brown grey" | "xkcd:brown gray" =>
      Some(
        line_color_named_components(
          4603155670897897906UL, 4602837769747730577UL, 4601018668721773082UL,
        ),
      )
    "xkcd:vibrant purple" =>
      Some(
        line_color_named_components(
          4604285986098492854UL, 4577935512984623128UL, 4606016781249403868UL,
        ),
      )
    "xkcd:baby green" =>
      Some(
        line_color_named_components(
          4603120348547879314UL, 4607182418800017408UL, 4603756150848213972UL,
        ),
      )
    "xkcd:barf green" =>
      Some(
        line_color_named_components(
          4603402927348028051UL, 4604250663748474262UL, 4575674882583433232UL,
        ),
      )
    "xkcd:eggshell blue" =>
      Some(
        line_color_named_components(
          4605098400148920473UL, 4607182418800017408UL, 4606899839999868671UL,
        ),
      )
    "xkcd:sandy yellow" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4606581938849701342UL, 4601795760422182109UL,
        ),
      )
    "xkcd:cool green" =>
      Some(
        line_color_named_components(
          4596373779694328218UL, 4604674531948697367UL, 4600736089921624345UL,
        ),
      )
    "xkcd:pale" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606970484699905855UL, 4605522268349143578UL,
        ),
      )
    "xkcd:blue/grey" | "xkcd:blue/gray" =>
      Some(
        line_color_named_components(
          4601937049822256477UL, 4603155670897897906UL, 4603932762598306932UL,
        ),
      )
    "xkcd:hot magenta" =>
      Some(
        line_color_named_components(
          4606829195299831487UL, 4580178482210803728UL, 4605275011899013433UL,
        ),
      )
    "xkcd:greyblue" | "xkcd:grayblue" =>
      Some(
        line_color_named_components(
          4602078339222330846UL, 4603862117898269748UL, 4604568564898641591UL,
        ),
      )
    "xkcd:purpley" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4599747064121103766UL, 4606228715349515421UL,
        ),
      )
    "xkcd:baby shit green" =>
      Some(
        line_color_named_components(
          4602979059147804945UL, 4603508894398083827UL, 4591163733066585879UL,
        ),
      )
    "xkcd:brownish pink" =>
      Some(
        line_color_named_components(
          4605027755448883288UL, 4602572852122591136UL, 4602219628622405214UL,
        ),
      )
    "xkcd:dark aquamarine" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4601795760422182109UL, 4601654471022107740UL,
        ),
      )
    "xkcd:diarrhea" =>
      Some(
        line_color_named_components(
          4603791473198232564UL, 4602802447397711984UL, 4577935512984623128UL,
        ),
      )
    "xkcd:light mustard" =>
      Some(
        line_color_named_components(
          4606899839999868671UL, 4605698880099236539UL, 4600453511121475608UL,
        ),
      )
    "xkcd:pale sky blue" =>
      Some(
        line_color_named_components(
          4604851143698790328UL, 4606864517649850079UL, 4607147096449998816UL,
        ),
      )
    "xkcd:turtle green" =>
      Some(
        line_color_named_components(
          4601937049822256477UL, 4604674531948697367UL, 4599252551220843476UL,
        ),
      )
    "xkcd:bright olive" =>
      Some(
        line_color_named_components(
          4603685506148176788UL, 4604780498998753143UL, 4580178482210803728UL,
        ),
      )
    "xkcd:dark grey blue" | "xkcd:dark gray blue" =>
      Some(
        line_color_named_components(
          4594960885693584533UL, 4598616748920508818UL, 4600100287621289687UL,
        ),
      )
    "xkcd:greeny brown" =>
      Some(
        line_color_named_components(
          4601089313421810266UL, 4600453511121475608UL, 4582439112611993624UL,
        ),
      )
    "xkcd:lemon green" =>
      Some(
        line_color_named_components(
          4604285986098492854UL, 4606935162349887263UL, 4575674882583433232UL,
        ),
      )
    "xkcd:light periwinkle" =>
      Some(
        line_color_named_components(
          4604992433098864696UL, 4605169044848957657UL, 4607076451749961632UL,
        ),
      )
    "xkcd:seaweed green" =>
      Some(
        line_color_named_components(
          4596656358494476955UL, 4604285986098492854UL, 4601230602821884635UL,
        ),
      )
    "xkcd:sunshine yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607111774099980224UL, 4596938937294625692UL,
        ),
      )
    "xkcd:ugly purple" =>
      Some(
        line_color_named_components(
          4603968084948325525UL, 4598334170120360081UL, 4603826795548251156UL,
        ),
      )
    "xkcd:medium pink" =>
      Some(
        line_color_named_components(
          4606758550599794302UL, 4600524155821512792UL, 4603473572048065235UL,
        ),
      )
    "xkcd:puke brown" =>
      Some(
        line_color_named_components(
          4603402927348028051UL, 4602078339222330846UL, 4582439112611993624UL,
        ),
      )
    "xkcd:very light pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606793872949812895UL, 4606723228249775710UL,
        ),
      )
    "xkcd:viridian" =>
      Some(
        line_color_named_components(
          4593141784667627038UL, 4603296960297972274UL, 4600948024021735898UL,
        ),
      )
    "xkcd:bile" =>
      Some(
        line_color_named_components(
          4604568564898641591UL, 4605063077798901880UL, 4582439112611993624UL,
        ),
      )
    "xkcd:faded yellow" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4607182418800017408UL, 4602643496822628320UL,
        ),
      )
    "xkcd:very pale green" =>
      Some(
        line_color_named_components(
          4605486945999124986UL, 4607111774099980224UL, 4604815821348771736UL,
        ),
      )
    "xkcd:vibrant green" =>
      Some(
        line_color_named_components(
          4585812397038769172UL, 4605981458899385276UL, 4584682081838174224UL,
        ),
      )
    "xkcd:bright lime" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4607111774099980224UL, 4581308797411398676UL,
        ),
      )
    "xkcd:spearmint" =>
      Some(
        line_color_named_components(
          4593141784667627038UL, 4606935162349887263UL, 4602007694522293662UL,
        ),
      )
    "xkcd:light aquamarine" =>
      Some(
        line_color_named_components(
          4602360918022479583UL, 4607111774099980224UL, 4605204367198976249UL,
        ),
      )
    "xkcd:light sage" =>
      Some(
        line_color_named_components(
          4604815821348771736UL, 4606511294149664158UL, 4604250663748474262UL,
        ),
      )
    "xkcd:yellowgreen" =>
      Some(
        line_color_named_components(
          4604780498998753143UL, 4606970484699905855UL, 4588638185040256542UL,
        ),
      )
    "xkcd:baby poo" =>
      Some(
        line_color_named_components(
          4604215341398455669UL, 4603261637947953682UL, 4580178482210803728UL,
        ),
      )
    "xkcd:dark seafoam" =>
      Some(
        line_color_named_components(
          4593424363467775775UL, 4604568564898641591UL, 4602290273322442399UL,
        ),
      )
    "xkcd:deep teal" =>
      Some(
        line_color_named_components(
          0UL, 4599676419421066581UL, 4600029642921252503UL,
        ),
      )
    "xkcd:heather" =>
      Some(
        line_color_named_components(
          4603968084948325525UL, 4602837769747730577UL, 4604250663748474262UL,
        ),
      )
    "xkcd:rust orange" =>
      Some(
        line_color_named_components(
          4605098400148920473UL, 4599676419421066581UL, 4584682081838174224UL,
        ),
      )
    "xkcd:dirty blue" =>
      Some(
        line_color_named_components(
          4598069252495220640UL, 4602767125047693392UL, 4603720828498195380UL,
        ),
      )
    "xkcd:fern green" =>
      Some(
        line_color_named_components(
          4599605774721029397UL, 4603155670897897906UL, 4598475459520434449UL,
        ),
      )
    "xkcd:bright lilac" =>
      Some(
        line_color_named_components(
          4605275011899013433UL, 4600312221721401240UL, 4607041129399943039UL,
        ),
      )
    "xkcd:weird green" =>
      Some(
        line_color_named_components(
          4597362805494848797UL, 4606264037699534013UL, 4602643496822628320UL,
        ),
      )
    "xkcd:peacock blue" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4600948024021735898UL, 4603438249698046643UL,
        ),
      )
    "xkcd:avocado green" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4604144696698418485UL, 4593971859893063953UL,
        ),
      )
    "xkcd:faded orange" =>
      Some(
        line_color_named_components(
          4606652583549738526UL, 4603402927348028051UL, 4599111261820769107UL,
        ),
      )
    "xkcd:grape purple" =>
      Some(
        line_color_named_components(
          4600241577021364055UL, 4590315996666139668UL, 4599393840620917844UL,
        ),
      )
    "xkcd:hot green" =>
      Some(
        line_color_named_components(
          4594395728093287059UL, 4607182418800017408UL, 4594960885693584533UL,
        ),
      )
    "xkcd:lime yellow" =>
      Some(
        line_color_named_components(
          4605522268349143578UL, 4607147096449998816UL, 4592859205867478301UL,
        ),
      )
    "xkcd:mango" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604038729648362709UL, 4595243464493733270UL,
        ),
      )
    "xkcd:shamrock" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4604533242548622999UL, 4599040617120731923UL,
        ),
      )
    "xkcd:bubblegum" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4601301247521921819UL, 4604568564898641591UL,
        ),
      )
    "xkcd:purplish brown" =>
      Some(
        line_color_named_components(
          4601230602821884635UL, 4598334170120360081UL, 4598687393620546002UL,
        ),
      )
    "xkcd:vomit yellow" =>
      Some(
        line_color_named_components(
          4605204367198976249UL, 4604992433098864696UL, 4586942712239364120UL,
        ),
      )
    "xkcd:pale cyan" =>
      Some(
        line_color_named_components(
          4604639209598678775UL, 4607182418800017408UL, 4607005807049924447UL,
        ),
      )
    "xkcd:key lime" =>
      Some(
        line_color_named_components(
          4604321308448511446UL, 4607182418800017408UL, 4601442536921996188UL,
        ),
      )
    "xkcd:tomato red" =>
      Some(
        line_color_named_components(
          4606511294149664158UL, 4595526043293882007UL, 4571171282956062736UL,
        ),
      )
    "xkcd:lightgreen" =>
      Some(
        line_color_named_components(
          4602007694522293662UL, 4607182418800017408UL, 4602360918022479583UL,
        ),
      )
    "xkcd:merlot" =>
      Some(
        line_color_named_components(
          4601795760422182109UL, 0UL, 4597221516094774429UL,
        ),
      )
    "xkcd:night blue" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4577935512984623128UL, 4598758038320583186UL,
        ),
      )
    "xkcd:purpleish pink" =>
      Some(
        line_color_named_components(
          4606052103599422460UL, 4599181906520806292UL, 4605239689548994841UL,
        ),
      )
    "xkcd:apple" =>
      Some(
        line_color_named_components(
          4601442536921996188UL, 4605345656599050617UL, 4597645384294997534UL,
        ),
      )
    "xkcd:baby poop green" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4603544216748102419UL, 4581308797411398676UL,
        ),
      )
    "xkcd:green apple" =>
      Some(
        line_color_named_components(
          4600312221721401240UL, 4605946136549366684UL, 4593424363467775775UL,
        ),
      )
    "xkcd:heliotrope" =>
      Some(
        line_color_named_components(
          4605840169499310907UL, 4599252551220843476UL, 4606829195299831487UL,
        ),
      )
    "xkcd:yellow/green" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4607111774099980224UL, 4597786673695071903UL,
        ),
      )
    "xkcd:almost black" =>
      Some(
        line_color_named_components(
          4583569427812588572UL, 4587507869839661594UL, 4587507869839661594UL,
        ),
      )
    "xkcd:cool blue" =>
      Some(
        line_color_named_components(
          4598828683020620370UL, 4602837769747730577UL, 4604674531948697367UL,
        ),
      )
    "xkcd:leafy green" =>
      Some(
        line_color_named_components(
          4599393840620917844UL, 4604639209598678775UL, 4597504094894923166UL,
        ),
      )
    "xkcd:mustard brown" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4602572852122591136UL, 4580178482210803728UL,
        ),
      )
    "xkcd:dusk" =>
      Some(
        line_color_named_components(
          4599181906520806292UL, 4599605774721029397UL, 4602731802697674800UL,
        ),
      )
    "xkcd:dull brown" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4601442536921996188UL, 4598969972420694739UL,
        ),
      )
    "xkcd:frog green" =>
      Some(
        line_color_named_components(
          4599888353521178134UL, 4604815821348771736UL, 4584682081838174224UL,
        ),
      )
    "xkcd:vivid green" =>
      Some(
        line_color_named_components(
          4595808622094030744UL, 4606617261199719934UL, 4589185681465544720UL,
        ),
      )
    "xkcd:bright light green" =>
      Some(
        line_color_named_components(
          4595526043293882007UL, 4607147096449998816UL, 4599605774721029397UL,
        ),
      )
    "xkcd:fluro green" =>
      Some(
        line_color_named_components(
          4585812397038769172UL, 4607182418800017408UL, 4575674882583433232UL,
        ),
      )
    "xkcd:kiwi" =>
      Some(
        line_color_named_components(
          4603685506148176788UL, 4606617261199719934UL, 4598404814820397265UL,
        ),
      )
    "xkcd:seaweed" =>
      Some(
        line_color_named_components(
          4591446311866734616UL, 4605557590699162170UL, 4602360918022479583UL,
        ),
      )
    "xkcd:navy green" =>
      Some(
        line_color_named_components(
          4596656358494476955UL, 4599535130020992213UL, 4585812397038769172UL,
        ),
      )
    "xkcd:ultramarine blue" =>
      Some(
        line_color_named_components(
          4591446311866734616UL, 4581308797411398676UL, 4605910814199348091UL,
        ),
      )
    "xkcd:iris" =>
      Some(
        line_color_named_components(
          4600594800521549977UL, 4599888353521178134UL, 4605098400148920473UL,
        ),
      )
    "xkcd:pastel orange" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4603473572048065235UL, 4599252551220843476UL,
        ),
      )
    "xkcd:yellowish orange" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604215341398455669UL, 4588638185040256542UL,
        ),
      )
    "xkcd:perrywinkle" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4603120348547879314UL, 4606334682399571197UL,
        ),
      )
    "xkcd:tealish" =>
      Some(
        line_color_named_components(
          4594254438693212690UL, 4604815821348771736UL, 4604109374348399893UL,
        ),
      )
    "xkcd:dark plum" =>
      Some(
        line_color_named_components(
          4598069252495220640UL, 4571171282956062736UL, 4595384753893807638UL,
        ),
      )
    "xkcd:pear" =>
      Some(
        line_color_named_components(
          4605345656599050617UL, 4606935162349887263UL, 4600382866421438424UL,
        ),
      )
    "xkcd:pinkish orange" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4601725115722144925UL, 4599040617120731923UL,
        ),
      )
    "xkcd:midnight purple" =>
      Some(
        line_color_named_components(
          4594819596293510164UL, 4571171282956062736UL, 4596938937294625692UL,
        ),
      )
    "xkcd:light urple" =>
      Some(
        line_color_named_components(
          4604497920198604406UL, 4601513181622033372UL, 4606864517649850079UL,
        ),
      )
    "xkcd:dark mint" =>
      Some(
        line_color_named_components(
          4598758038320583186UL, 4604957110748846104UL, 4601725115722144925UL,
        ),
      )
    "xkcd:greenish tan" =>
      Some(
        line_color_named_components(
          4604815821348771736UL, 4605345656599050617UL, 4602290273322442399UL,
        ),
      )
    "xkcd:light burgundy" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4598263525420322896UL, 4600100287621289687UL,
        ),
      )
    "xkcd:turquoise blue" =>
      Some(
        line_color_named_components(
          4582439112611993624UL, 4604427275498567222UL, 4605098400148920473UL,
        ),
      )
    "xkcd:ugly pink" =>
      Some(
        line_color_named_components(
          4605416301299087802UL, 4601937049822256477UL, 4602837769747730577UL,
        ),
      )
    "xkcd:sandy" =>
      Some(
        line_color_named_components(
          4606687905899757118UL, 4605875491849329499UL, 4602290273322442399UL,
        ),
      )
    "xkcd:electric pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4580178482210803728UL, 4603261637947953682UL,
        ),
      )
    "xkcd:muted purple" =>
      Some(
        line_color_named_components(
          4602696480347656208UL, 4600100287621289687UL, 4602943736797786353UL,
        ),
      )
    "xkcd:mid green" =>
      Some(
        line_color_named_components(
          4599323195920880660UL, 4604074051998381301UL, 4598687393620546002UL,
        ),
      )
    "xkcd:greyish" | "xkcd:grayish" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4603968084948325525UL, 4603438249698046643UL,
        ),
      )
    "xkcd:neon yellow" =>
      Some(
        line_color_named_components(
          4605486945999124986UL, 4607182418800017408UL, 4580178482210803728UL,
        ),
      )
    "xkcd:banana" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4602572852122591136UL,
        ),
      )
    "xkcd:carnation pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4602643496822628320UL, 4604074051998381301UL,
        ),
      )
    "xkcd:tomato" =>
      Some(
        line_color_named_components(
          4606617261199719934UL, 4598192880720285712UL, 4594537017493361427UL,
        ),
      )
    "xkcd:sea" =>
      Some(
        line_color_named_components(
          4597645384294997534UL, 4603579539098121011UL, 4603332282647990866UL,
        ),
      )
    "xkcd:muddy brown" =>
      Some(
        line_color_named_components(
          4602979059147804945UL, 4601018668721773082UL, 4582439112611993624UL,
        ),
      )
    "xkcd:turquoise green" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4606793872949812895UL, 4603014381497823537UL,
        ),
      )
    "xkcd:buff" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4606864517649850079UL, 4603756150848213972UL,
        ),
      )
    "xkcd:fawn" =>
      Some(
        line_color_named_components(
          4605486945999124986UL, 4604356630798530038UL, 4602360918022479583UL,
        ),
      )
    "xkcd:muted blue" =>
      Some(
        line_color_named_components(
          4597504094894923166UL, 4601654471022107740UL, 4603791473198232564UL,
        ),
      )
    "xkcd:pale rose" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4604992433098864696UL, 4605133722498939065UL,
        ),
      )
    "xkcd:dark mint green" =>
      Some(
        line_color_named_components(
          4593689281092915216UL, 4604957110748846104UL, 4601795760422182109UL,
        ),
      )
    "xkcd:amethyst" =>
      Some(
        line_color_named_components(
          4603650183798158195UL, 4600382866421438424UL, 4604957110748846104UL,
        ),
      )
    "xkcd:blue/green" =>
      Some(
        line_color_named_components(
          4588638185040256542UL, 4603650183798158195UL, 4603190993247916498UL,
        ),
      )
    "xkcd:chestnut" =>
      Some(
        line_color_named_components(
          4601866405122219293UL, 4594819596293510164UL, 4575674882583433232UL,
        ),
      )
    "xkcd:sick green" =>
      Some(
        line_color_named_components(
          4603720828498195380UL, 4604709854298715959UL, 4595384753893807638UL,
        ),
      )
    "xkcd:pea" =>
      Some(
        line_color_named_components(
          4603968084948325525UL, 4604921788398827512UL, 4593689281092915216UL,
        ),
      )
    "xkcd:rusty orange" =>
      Some(
        line_color_named_components(
          4605416301299087802UL, 4599958998221215318UL, 4585247239438471698UL,
        ),
      )
    "xkcd:stone" =>
      Some(
        line_color_named_components(
          4604285986098492854UL, 4604003407298344117UL, 4602943736797786353UL,
        ),
      )
    "xkcd:rose red" =>
      Some(
        line_color_named_components(
          4604886466048808920UL, 4571171282956062736UL, 4597645384294997534UL,
        ),
      )
    "xkcd:pale aqua" =>
      Some(
        line_color_named_components(
          4604674531948697367UL, 4607182418800017408UL, 4606475971799645565UL,
        ),
      )
    "xkcd:deep orange" =>
      Some(
        line_color_named_components(
          4605946136549366684UL, 4599111261820769107UL, 4571171282956062736UL,
        ),
      )
    "xkcd:earth" =>
      Some(
        line_color_named_components(
          4603897440248288340UL, 4600806734621661529UL, 4597927963095146271UL,
        ),
      )
    "xkcd:mossy green" =>
      Some(
        line_color_named_components(
          4600665445221587161UL, 4603085026197860721UL, 4594678306893435796UL,
        ),
      )
    "xkcd:grassy green" =>
      Some(
        line_color_named_components(
          4598263525420322896UL, 4603685506148176788UL, 4577935512984623128UL,
        ),
      )
    "xkcd:pale lime green" =>
      Some(
        line_color_named_components(
          4604427275498567222UL, 4607182418800017408UL, 4600806734621661529UL,
        ),
      )
    "xkcd:light grey blue" | "xkcd:light gray blue" =>
      Some(
        line_color_named_components(
          4603720828498195380UL, 4604815821348771736UL, 4605663557749217947UL,
        ),
      )
    "xkcd:pale grey" | "xkcd:pale gray" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4607111774099980224UL, 4607147096449998816UL,
        ),
      )
    "xkcd:asparagus" =>
      Some(
        line_color_named_components(
          4602078339222330846UL, 4604215341398455669UL, 4599747064121103766UL,
        ),
      )
    "xkcd:blueberry" =>
      Some(
        line_color_named_components(
          4598616748920508818UL, 4598263525420322896UL, 4603473572048065235UL,
        ),
      )
    "xkcd:purple red" =>
      Some(
        line_color_named_components(
          4603579539098121011UL, 4571171282956062736UL, 4598687393620546002UL,
        ),
      )
    "xkcd:pale lime" =>
      Some(
        line_color_named_components(
          4604886466048808920UL, 4607111774099980224UL, 4601795760422182109UL,
        ),
      )
    "xkcd:greenish teal" =>
      Some(
        line_color_named_components(
          4596232490294253849UL, 4604921788398827512UL, 4602837769747730577UL,
        ),
      )
    "xkcd:caramel" =>
      Some(
        line_color_named_components(
          4604356630798530038UL, 4601513181622033372UL, 4585247239438471698UL,
        ),
      )
    "xkcd:deep magenta" =>
      Some(
        line_color_named_components(
          4603826795548251156UL, 4575674882583433232UL, 4600170932321326871UL,
        ),
      )
    "xkcd:light peach" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4605804847149292315UL, 4604427275498567222UL,
        ),
      )
    "xkcd:milk chocolate" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4599181906520806292UL, 4593141784667627038UL,
        ),
      )
    "xkcd:ocher" =>
      Some(
        line_color_named_components(
          4604921788398827512UL, 4603650183798158195UL, 4586942712239364120UL,
        ),
      )
    "xkcd:off green" =>
      Some(
        line_color_named_components(
          4601230602821884635UL, 4603932762598306932UL, 4599535130020992213UL,
        ),
      )
    "xkcd:purply pink" =>
      Some(
        line_color_named_components(
          4606652583549738526UL, 4601937049822256477UL, 4606299360049552605UL,
        ),
      )
    "xkcd:lightblue" =>
      Some(
        line_color_named_components(
          4602360918022479583UL, 4605239689548994841UL, 4606864517649850079UL,
        ),
      )
    "xkcd:dusky blue" =>
      Some(
        line_color_named_components(
          4598687393620546002UL, 4600382866421438424UL, 4603402927348028051UL,
        ),
      )
    "xkcd:golden" =>
      Some(
        line_color_named_components(
          4606829195299831487UL, 4604921788398827512UL, 4577935512984623128UL,
        ),
      )
    "xkcd:light beige" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607147096449998816UL, 4604603887248660183UL,
        ),
      )
    "xkcd:butter yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607111774099980224UL, 4601866405122219293UL,
        ),
      )
    "xkcd:dusky purple" =>
      Some(
        line_color_named_components(
          4603014381497823537UL, 4600100287621289687UL, 4602360918022479583UL,
        ),
      )
    "xkcd:french blue" =>
      Some(
        line_color_named_components(
          4598404814820397265UL, 4601230602821884635UL, 4604285986098492854UL,
        ),
      )
    "xkcd:ugly yellow" =>
      Some(
        line_color_named_components(
          4605522268349143578UL, 4604992433098864696UL, 4571171282956062736UL,
        ),
      )
    "xkcd:greeny yellow" =>
      Some(
        line_color_named_components(
          4605169044848957657UL, 4606935162349887263UL, 4584682081838174224UL,
        ),
      )
    "xkcd:orangish red" =>
      Some(
        line_color_named_components(
          4606793872949812895UL, 4596797647894551323UL, 4581308797411398676UL,
        ),
      )
    "xkcd:shamrock green" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4604992433098864696UL, 4599111261820769107UL,
        ),
      )
    "xkcd:orangish brown" =>
      Some(
        line_color_named_components(
          4604462597848585814UL, 4600382866421438424UL, 4577935512984623128UL,
        ),
      )
    "xkcd:tree green" =>
      Some(
        line_color_named_components(
          4595102175093658901UL, 4602572852122591136UL, 4591728890666883353UL,
        ),
      )
    "xkcd:deep violet" =>
      Some(
        line_color_named_components(
          4598828683020620370UL, 4582439112611993624UL, 4598758038320583186UL,
        ),
      )
    "xkcd:gunmetal" =>
      Some(
        line_color_named_components(
          4599535130020992213UL, 4600594800521549977UL, 4600948024021735898UL,
        ),
      )
    "xkcd:blue/purple" =>
      Some(
        line_color_named_components(
          4600029642921252503UL, 4582439112611993624UL, 4606617261199719934UL,
        ),
      )
    "xkcd:cherry" =>
      Some(
        line_color_named_components(
          4605486945999124986UL, 4575674882583433232UL, 4596515069094402586UL,
        ),
      )
    "xkcd:sandy brown" =>
      Some(
        line_color_named_components(
          4605098400148920473UL, 4604038729648362709UL, 4600524155821512792UL,
        ),
      )
    "xkcd:warm grey" | "xkcd:warm gray" =>
      Some(
        line_color_named_components(
          4603508894398083827UL, 4603049703847842129UL, 4602837769747730577UL,
        ),
      )
    "xkcd:dark indigo" =>
      Some(
        line_color_named_components(
          4593424363467775775UL, 4585247239438471698UL, 4599605774721029397UL,
        ),
      )
    "xkcd:midnight" =>
      Some(
        line_color_named_components(
          4577935512984623128UL, 4571171282956062736UL, 4595526043293882007UL,
        ),
      )
    "xkcd:bluey green" =>
      Some(
        line_color_named_components(
          4595243464493733270UL, 4604427275498567222UL, 4602219628622405214UL,
        ),
      )
    "xkcd:grey pink" | "xkcd:gray pink" =>
      Some(
        line_color_named_components(
          4605063077798901880UL, 4603261637947953682UL, 4603650183798158195UL,
        ),
      )
    "xkcd:soft purple" =>
      Some(
        line_color_named_components(
          4604038729648362709UL, 4601513181622033372UL, 4604568564898641591UL,
        ),
      )
    "xkcd:blood" =>
      Some(
        line_color_named_components(
          4602078339222330846UL, 0UL, 4571171282956062736UL,
        ),
      )
    "xkcd:brown red" =>
      Some(
        line_color_named_components(
          4603332282647990866UL, 4595243464493733270UL, 4581308797411398676UL,
        ),
      )
    "xkcd:medium grey" | "xkcd:medium gray" =>
      Some(
        line_color_named_components(
          4602502207422553951UL, 4602643496822628320UL, 4602431562722516767UL,
        ),
      )
    "xkcd:berry" =>
      Some(
        line_color_named_components(
          4603579539098121011UL, 4588638185040256542UL, 4598969972420694739UL,
        ),
      )
    "xkcd:poo" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4601795760422182109UL, 4577935512984623128UL,
        ),
      )
    "xkcd:purpley pink" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4597645384294997534UL, 4604709854298715959UL,
        ),
      )
    "xkcd:light salmon" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4604144696698418485UL, 4603367604998009458UL,
        ),
      )
    "xkcd:snot" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4604780498998753143UL, 4587507869839661594UL,
        ),
      )
    "xkcd:easter purple" =>
      Some(
        line_color_named_components(
          4604957110748846104UL, 4601654471022107740UL, 4607147096449998816UL,
        ),
      )
    "xkcd:light yellow green" =>
      Some(
        line_color_named_components(
          4605380978949069210UL, 4607111774099980224UL, 4602643496822628320UL,
        ),
      )
    "xkcd:dark navy blue" =>
      Some(
        line_color_named_components(
          0UL, 4575674882583433232UL, 4595667332693956375UL,
        ),
      )
    "xkcd:drab" =>
      Some(
        line_color_named_components(
          4602767125047693392UL, 4602802447397711984UL, 4598475459520434449UL,
        ),
      )
    "xkcd:light rose" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4605133722498939065UL, 4605345656599050617UL,
        ),
      )
    "xkcd:rouge" =>
      Some(
        line_color_named_components(
          4604215341398455669UL, 4589750839065842194UL, 4597221516094774429UL,
        ),
      )
    "xkcd:purplish red" =>
      Some(
        line_color_named_components(
          4604391953148548630UL, 4581308797411398676UL, 4598969972420694739UL,
        ),
      )
    "xkcd:slime green" =>
      Some(
        line_color_named_components(
          4603579539098121011UL, 4605380978949069210UL, 4580178482210803728UL,
        ),
      )
    "xkcd:baby poop" =>
      Some(
        line_color_named_components(
          4603367604998009458UL, 4602431562722516767UL, 0UL,
        ),
      )
    "xkcd:irish green" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4603438249698046643UL, 4594960885693584533UL,
        ),
      )
    "xkcd:pink/purple" =>
      Some(
        line_color_named_components(
          4606617261199719934UL, 4592859205867478301UL, 4606334682399571197UL,
        ),
      )
    "xkcd:dark navy" =>
      Some(
        line_color_named_components(
          0UL, 4580178482210803728UL, 4596656358494476955UL,
        ),
      )
    "xkcd:greeny blue" =>
      Some(
        line_color_named_components(
          4598334170120360081UL, 4604497920198604406UL, 4603438249698046643UL,
        ),
      )
    "xkcd:light plum" =>
      Some(
        line_color_named_components(
          4603720828498195380UL, 4599817708821140950UL, 4602802447397711984UL,
        ),
      )
    "xkcd:pinkish grey" | "xkcd:pinkish gray" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4604250663748474262UL, 4604144696698418485UL,
        ),
      )
    "xkcd:dirty orange" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4602007694522293662UL, 4582439112611993624UL,
        ),
      )
    "xkcd:rust red" =>
      Some(
        line_color_named_components(
          4604180019048437077UL, 4594678306893435796UL, 4580178482210803728UL,
        ),
      )
    "xkcd:pale lilac" =>
      Some(
        line_color_named_components(
          4606228715349515421UL, 4605345656599050617UL, 4607182418800017408UL,
        ),
      )
    "xkcd:orangey red" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4598334170120360081UL, 4594254438693212690UL,
        ),
      )
    "xkcd:primary blue" =>
      Some(
        line_color_named_components(
          4584682081838174224UL, 4580178482210803728UL, 4606970484699905855UL,
        ),
      )
    "xkcd:kermit green" =>
      Some(
        line_color_named_components(
          4600170932321326871UL, 4604462597848585814UL, 0UL,
        ),
      )
    "xkcd:brownish purple" =>
      Some(
        line_color_named_components(
          4602007694522293662UL, 4598334170120360081UL, 4599181906520806292UL,
        ),
      )
    "xkcd:murky green" =>
      Some(
        line_color_named_components(
          4601301247521921819UL, 4602290273322442399UL, 4588073027439959068UL,
        ),
      )
    "xkcd:wheat" =>
      Some(
        line_color_named_components(
          4607041129399943039UL, 4605981458899385276UL, 4602572852122591136UL,
        ),
      )
    "xkcd:very dark purple" =>
      Some(
        line_color_named_components(
          4595102175093658901UL, 4571171282956062736UL, 4596515069094402586UL,
        ),
      )
    "xkcd:bottle green" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4598899327720657555UL, 4581308797411398676UL,
        ),
      )
    "xkcd:watermelon" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4598616748920508818UL, 4599958998221215318UL,
        ),
      )
    "xkcd:deep sky blue" =>
      Some(
        line_color_named_components(
          4587507869839661594UL, 4601937049822256477UL, 4606935162349887263UL,
        ),
      )
    "xkcd:fire engine red" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 0UL, 4575674882583433232UL,
        ),
      )
    "xkcd:yellow ochre" =>
      Some(
        line_color_named_components(
          4605345656599050617UL, 4603720828498195380UL, 4582439112611993624UL,
        ),
      )
    "xkcd:pumpkin orange" =>
      Some(
        line_color_named_components(
          4607041129399943039UL, 4602502207422553951UL, 4583569427812588572UL,
        ),
      )
    "xkcd:pale olive" =>
      Some(
        line_color_named_components(
          4604709854298715959UL, 4605380978949069210UL, 4602731802697674800UL,
        ),
      )
    "xkcd:light lilac" =>
      Some(
        line_color_named_components(
          4606546616499682750UL, 4605239689548994841UL, 4607182418800017408UL,
        ),
      )
    "xkcd:lightish green" =>
      Some(
        line_color_named_components(
          4600524155821512792UL, 4606122748299459644UL, 4600453511121475608UL,
        ),
      )
    "xkcd:carolina blue" =>
      Some(
        line_color_named_components(
          4603049703847842129UL, 4604674531948697367UL, 4607147096449998816UL,
        ),
      )
    "xkcd:mulberry" =>
      Some(
        line_color_named_components(
          4603332282647990866UL, 4585812397038769172UL, 4599181906520806292UL,
        ),
      )
    "xkcd:shocking pink" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4575674882583433232UL, 4603897440248288340UL,
        ),
      )
    "xkcd:auburn" =>
      Some(
        line_color_named_components(
          4603614861448139603UL, 4595949911494105112UL, 4571171282956062736UL,
        ),
      )
    "xkcd:bright lime green" =>
      Some(
        line_color_named_components(
          4600806734621661529UL, 4607147096449998816UL, 4584682081838174224UL,
        ),
      )
    "xkcd:celadon" =>
      Some(
        line_color_named_components(
          4604886466048808920UL, 4607111774099980224UL, 4604639209598678775UL,
        ),
      )
    "xkcd:pinkish brown" =>
      Some(
        line_color_named_components(
          4604427275498567222UL, 4601725115722144925UL, 4600524155821512792UL,
        ),
      )
    "xkcd:poo brown" =>
      Some(
        line_color_named_components(
          4602979059147804945UL, 4600382866421438424UL, 4571171282956062736UL,
        ),
      )
    "xkcd:bright sky blue" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4605380978949069210UL, 4607147096449998816UL,
        ),
      )
    "xkcd:celery" =>
      Some(
        line_color_named_components(
          4604992433098864696UL, 4607111774099980224UL, 4603438249698046643UL,
        ),
      )
    "xkcd:dirt brown" =>
      Some(
        line_color_named_components(
          4602802447397711984UL, 4600806734621661529UL, 4597221516094774429UL,
        ),
      )
    "xkcd:strawberry" =>
      Some(
        line_color_named_components(
          4607041129399943039UL, 4594960885693584533UL, 4598404814820397265UL,
        ),
      )
    "xkcd:dark lime" =>
      Some(
        line_color_named_components(
          4602837769747730577UL, 4604639209598678775UL, 4571171282956062736UL,
        ),
      )
    "xkcd:copper" =>
      Some(
        line_color_named_components(
          4604603887248660183UL, 4600665445221587161UL, 4594395728093287059UL,
        ),
      )
    "xkcd:medium brown" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4599393840620917844UL, 4589750839065842194UL,
        ),
      )
    "xkcd:muted green" =>
      Some(
        line_color_named_components(
          4600382866421438424UL, 4603826795548251156UL, 4599464485320955029UL,
        ),
      )
    "xkcd:robin's egg" =>
      Some(
        line_color_named_components(
          4601371892221959003UL, 4606546616499682750UL, 4607111774099980224UL,
        ),
      )
    "xkcd:bright aqua" =>
      Some(
        line_color_named_components(
          4586377554639066646UL, 4606970484699905855UL, 4606440649449626973UL,
        ),
      )
    "xkcd:bright lavender" =>
      Some(
        line_color_named_components(
          4605204367198976249UL, 4600453511121475608UL, 4607182418800017408UL,
        ),
      )
    "xkcd:ivory" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4605345656599050617UL,
        ),
      )
    "xkcd:very light purple" =>
      Some(
        line_color_named_components(
          4606864517649850079UL, 4605451623649106394UL, 4607076451749961632UL,
        ),
      )
    "xkcd:light navy" =>
      Some(
        line_color_named_components(
          4590598575466288405UL, 4599323195920880660UL, 4602837769747730577UL,
        ),
      )
    "xkcd:pink red" =>
      Some(
        line_color_named_components(
          4606829195299831487UL, 4581308797411398676UL, 4599252551220843476UL,
        ),
      )
    "xkcd:olive brown" =>
      Some(
        line_color_named_components(
          4600736089921624345UL, 4599605774721029397UL, 4577935512984623128UL,
        ),
      )
    "xkcd:poop brown" =>
      Some(
        line_color_named_components(
          4602290273322442399UL, 4599958998221215318UL, 4571171282956062736UL,
        ),
      )
    "xkcd:mustard green" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4604568564898641591UL, 4580178482210803728UL,
        ),
      )
    "xkcd:ocean green" =>
      Some(
        line_color_named_components(
          4597786673695071903UL, 4603579539098121011UL, 4601795760422182109UL,
        ),
      )
    "xkcd:very dark blue" =>
      Some(
        line_color_named_components(
          0UL, 4571171282956062736UL, 4596373779694328218UL,
        ),
      )
    "xkcd:dusty green" =>
      Some(
        line_color_named_components(
          4602007694522293662UL, 4604144696698418485UL, 4601795760422182109UL,
        ),
      )
    "xkcd:light navy blue" =>
      Some(
        line_color_named_components(
          4595667332693956375UL, 4600029642921252503UL, 4602979059147804945UL,
        ),
      )
    "xkcd:minty green" =>
      Some(
        line_color_named_components(
          4586377554639066646UL, 4606899839999868671UL, 4602502207422553951UL,
        ),
      )
    "xkcd:adobe" =>
      Some(
        line_color_named_components(
          4604851143698790328UL, 4601301247521921819UL, 4598758038320583186UL,
        ),
      )
    "xkcd:barney" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4592859205867478301UL, 4604674531948697367UL,
        ),
      )
    "xkcd:jade green" =>
      Some(
        line_color_named_components(
          4595243464493733270UL, 4604356630798530038UL, 4601159958121847451UL,
        ),
      )
    "xkcd:bright light blue" =>
      Some(
        line_color_named_components(
          4594537017493361427UL, 4606899839999868671UL, 4607111774099980224UL,
        ),
      )
    "xkcd:light lime" =>
      Some(
        line_color_named_components(
          4604321308448511446UL, 4607111774099980224UL, 4601301247521921819UL,
        ),
      )
    "xkcd:dark khaki" =>
      Some(
        line_color_named_components(
          4603650183798158195UL, 4603226315597935090UL, 4599676419421066581UL,
        ),
      )
    "xkcd:orange yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604285986098492854UL, 4571171282956062736UL,
        ),
      )
    "xkcd:ocre" =>
      Some(
        line_color_named_components(
          4605169044848957657UL, 4603685506148176788UL, 4580178482210803728UL,
        ),
      )
    "xkcd:maize" =>
      Some(
        line_color_named_components(
          4606793872949812895UL, 4605522268349143578UL, 4599605774721029397UL,
        ),
      )
    "xkcd:faded pink" =>
      Some(
        line_color_named_components(
          4606016781249403868UL, 4603720828498195380UL, 4604250663748474262UL,
        ),
      )
    "xkcd:british racing green" =>
      Some(
        line_color_named_components(
          4581308797411398676UL, 4598758038320583186UL, 4587507869839661594UL,
        ),
      )
    "xkcd:sandstone" =>
      Some(
        line_color_named_components(
          4605275011899013433UL, 4604321308448511446UL, 4601866405122219293UL,
        ),
      )
    "xkcd:mud brown" =>
      Some(
        line_color_named_components(
          4600453511121475608UL, 4598616748920508818UL, 4588638185040256542UL,
        ),
      )
    "xkcd:light sea green" =>
      Some(
        line_color_named_components(
          4603544216748102419UL, 4606864517649850079UL, 4604391953148548630UL,
        ),
      )
    "xkcd:robin egg blue" =>
      Some(
        line_color_named_components(
          4603049703847842129UL, 4606687905899757118UL, 4607147096449998816UL,
        ),
      )
    "xkcd:aqua marine" =>
      Some(
        line_color_named_components(
          4595667332693956375UL, 4606370004749589789UL, 4604780498998753143UL,
        ),
      )
    "xkcd:dark sea green" =>
      Some(
        line_color_named_components(
          4589468260265693457UL, 4602943736797786353UL, 4600241577021364055UL,
        ),
      )
    "xkcd:soft pink" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4604391953148548630UL, 4604957110748846104UL,
        ),
      )
    "xkcd:orangey brown" =>
      Some(
        line_color_named_components(
          4604427275498567222UL, 4600453511121475608UL, 4575674882583433232UL,
        ),
      )
    "xkcd:cherry red" =>
      Some(
        line_color_named_components(
          4606899839999868671UL, 4575674882583433232UL, 4595102175093658901UL,
        ),
      )
    "xkcd:burnt yellow" =>
      Some(
        line_color_named_components(
          4605698880099236539UL, 4604215341398455669UL, 4585247239438471698UL,
        ),
      )
    "xkcd:brownish grey" | "xkcd:brownish gray" =>
      Some(
        line_color_named_components(
          4602908414447767761UL, 4602078339222330846UL, 4600382866421438424UL,
        ),
      )
    "xkcd:camel" =>
      Some(
        line_color_named_components(
          4605169044848957657UL, 4603791473198232564UL, 4599958998221215318UL,
        ),
      )
    "xkcd:purplish grey" | "xkcd:purplish gray" =>
      Some(
        line_color_named_components(
          4602290273322442399UL, 4601018668721773082UL, 4602643496822628320UL,
        ),
      )
    "xkcd:marine" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4595667332693956375UL, 4600453511121475608UL,
        ),
      )
    "xkcd:greyish pink" | "xkcd:grayish pink" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4603155670897897906UL, 4603402927348028051UL,
        ),
      )
    "xkcd:pale turquoise" =>
      Some(
        line_color_named_components(
          4604003407298344117UL, 4607041129399943039UL, 4605698880099236539UL,
        ),
      )
    "xkcd:pastel yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607147096449998816UL, 4601654471022107740UL,
        ),
      )
    "xkcd:bluey purple" =>
      Some(
        line_color_named_components(
          4600594800521549977UL, 4598263525420322896UL, 4605204367198976249UL,
        ),
      )
    "xkcd:canary yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607147096449998816UL, 4598192880720285712UL,
        ),
      )
    "xkcd:faded red" =>
      Some(
        line_color_named_components(
          4605628235399199354UL, 4598828683020620370UL, 4599181906520806292UL,
        ),
      )
    "xkcd:sepia" =>
      Some(
        line_color_named_components(
          4603544216748102419UL, 4600312221721401240UL, 4595243464493733270UL,
        ),
      )
    "xkcd:coffee" =>
      Some(
        line_color_named_components(
          4604038729648362709UL, 4602731802697674800UL, 4599040617120731923UL,
        ),
      )
    "xkcd:bright magenta" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4584682081838174224UL, 4606370004749589789UL,
        ),
      )
    "xkcd:mocha" =>
      Some(
        line_color_named_components(
          4603720828498195380UL, 4602007694522293662UL, 4599393840620917844UL,
        ),
      )
    "xkcd:ecru" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4607182418800017408UL, 4605310334249032025UL,
        ),
      )
    "xkcd:purpleish" =>
      Some(
        line_color_named_components(
          4603544216748102419UL, 4599747064121103766UL, 4603155670897897906UL,
        ),
      )
    "xkcd:cranberry" =>
      Some(
        line_color_named_components(
          4603756150848213972UL, 0UL, 4597362805494848797UL,
        ),
      )
    "xkcd:darkish green" =>
      Some(
        line_color_named_components(
          4594819596293510164UL, 4602431562722516767UL, 4596938937294625692UL,
        ),
      )
    "xkcd:brown orange" =>
      Some(
        line_color_named_components(
          4604709854298715959UL, 4601089313421810266UL, 4575674882583433232UL,
        ),
      )
    "xkcd:dusky rose" =>
      Some(
        line_color_named_components(
          4604745176648734551UL, 4601018668721773082UL, 4601795760422182109UL,
        ),
      )
    "xkcd:melon" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4602148983922368030UL, 4599676419421066581UL,
        ),
      )
    "xkcd:sickly green" =>
      Some(
        line_color_named_components(
          4603402927348028051UL, 4604462597848585814UL, 4592576627067329564UL,
        ),
      )
    "xkcd:silver" =>
      Some(
        line_color_named_components(
          4605133722498939065UL, 4605275011899013433UL, 4605204367198976249UL,
        ),
      )
    "xkcd:purply blue" =>
      Some(
        line_color_named_components(
          4600877379321698714UL, 4592011469467032090UL, 4606581938849701342UL,
        ),
      )
    "xkcd:purpleish blue" =>
      Some(
        line_color_named_components(
          4600524155821512792UL, 4598192880720285712UL, 4606617261199719934UL,
        ),
      )
    "xkcd:hospital green" =>
      Some(
        line_color_named_components(
          4603650183798158195UL, 4606264037699534013UL, 4604180019048437077UL,
        ),
      )
    "xkcd:shit brown" =>
      Some(
        line_color_named_components(
          4602360918022479583UL, 4599888353521178134UL, 4580178482210803728UL,
        ),
      )
    "xkcd:mid blue" =>
      Some(
        line_color_named_components(
          4594678306893435796UL, 4601159958121847451UL, 4604497920198604406UL,
        ),
      )
    "xkcd:amber" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4604497920198604406UL, 4584682081838174224UL,
        ),
      )
    "xkcd:easter green" =>
      Some(
        line_color_named_components(
          4603120348547879314UL, 4607111774099980224UL, 4602572852122591136UL,
        ),
      )
    "xkcd:soft blue" =>
      Some(
        line_color_named_components(
          4600736089921624345UL, 4602979059147804945UL, 4606440649449626973UL,
        ),
      )
    "xkcd:cerulean blue" =>
      Some(
        line_color_named_components(
          4581308797411398676UL, 4601442536921996188UL, 4606581938849701342UL,
        ),
      )
    "xkcd:golden brown" =>
      Some(
        line_color_named_components(
          4604462597848585814UL, 4602290273322442399UL, 4571171282956062736UL,
        ),
      )
    "xkcd:bright turquoise" =>
      Some(
        line_color_named_components(
          4588638185040256542UL, 4607147096449998816UL, 4606970484699905855UL,
        ),
      )
    "xkcd:red pink" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4595102175093658901UL, 4599676419421066581UL,
        ),
      )
    "xkcd:red purple" =>
      Some(
        line_color_named_components(
          4602767125047693392UL, 4583569427812588572UL, 4598687393620546002UL,
        ),
      )
    "xkcd:greyish brown" | "xkcd:grayish brown" =>
      Some(
        line_color_named_components(
          4602290273322442399UL, 4601159958121847451UL, 4599252551220843476UL,
        ),
      )
    "xkcd:vermillion" =>
      Some(
        line_color_named_components(
          4606793872949812895UL, 4596232490294253849UL, 4586942712239364120UL,
        ),
      )
    "xkcd:russet" =>
      Some(
        line_color_named_components(
          4603862117898269748UL, 4597221516094774429UL, 4581308797411398676UL,
        ),
      )
    "xkcd:steel grey" | "xkcd:steel gray" =>
      Some(
        line_color_named_components(
          4601513181622033372UL, 4602767125047693392UL, 4603049703847842129UL,
        ),
      )
    "xkcd:lighter purple" =>
      Some(
        line_color_named_components(
          4604003407298344117UL, 4600029642921252503UL, 4606793872949812895UL,
        ),
      )
    "xkcd:bright violet" =>
      Some(
        line_color_named_components(
          4604285986098492854UL, 4585812397038769172UL, 4607111774099980224UL,
        ),
      )
    "xkcd:prussian blue" =>
      Some(
        line_color_named_components(
          0UL, 4598546104220471633UL, 4602078339222330846UL,
        ),
      )
    "xkcd:slate green" =>
      Some(
        line_color_named_components(
          4600806734621661529UL, 4603155670897897906UL, 4601371892221959003UL,
        ),
      )
    "xkcd:dirty pink" =>
      Some(
        line_color_named_components(
          4605310334249032025UL, 4602360918022479583UL, 4602696480347656208UL,
        ),
      )
    "xkcd:dark blue green" =>
      Some(
        line_color_named_components(
          0UL, 4599464485320955029UL, 4598828683020620370UL,
        ),
      )
    "xkcd:pine" =>
      Some(
        line_color_named_components(
          4595243464493733270UL, 4600241577021364055UL, 4596515069094402586UL,
        ),
      )
    "xkcd:yellowy green" =>
      Some(
        line_color_named_components(
          4604921788398827512UL, 4606687905899757118UL, 4594819596293510164UL,
        ),
      )
    "xkcd:dark gold" =>
      Some(
        line_color_named_components(
          4604568564898641591UL, 4603402927348028051UL, 4589185681465544720UL,
        ),
      )
    "xkcd:bluish" =>
      Some(
        line_color_named_components(
          4594960885693584533UL, 4602007694522293662UL, 4604780498998753143UL,
        ),
      )
    "xkcd:darkish blue" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4598263525420322896UL, 4602767125047693392UL,
        ),
      )
    "xkcd:dull red" =>
      Some(
        line_color_named_components(
          4604780498998753143UL, 4598069252495220640UL, 4598069252495220640UL,
        ),
      )
    "xkcd:pinky red" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4594537017493361427UL, 4598687393620546002UL,
        ),
      )
    "xkcd:bronze" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4602219628622405214UL, 0UL,
        ),
      )
    "xkcd:pale teal" =>
      Some(
        line_color_named_components(
          4602767125047693392UL, 4605345656599050617UL, 4604462597848585814UL,
        ),
      )
    "xkcd:military green" =>
      Some(
        line_color_named_components(
          4600877379321698714UL, 4602431562722516767UL, 4597927963095146271UL,
        ),
      )
    "xkcd:barbie pink" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4598616748920508818UL, 4604003407298344117UL,
        ),
      )
    "xkcd:bubblegum pink" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4602802447397711984UL, 4605380978949069210UL,
        ),
      )
    "xkcd:pea soup green" =>
      Some(
        line_color_named_components(
          4603402927348028051UL, 4604038729648362709UL, 4591163733066585879UL,
        ),
      )
    "xkcd:dark mustard" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4603014381497823537UL, 4581308797411398676UL,
        ),
      )
    "xkcd:shit" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4600382866421438424UL, 0UL,
        ),
      )
    "xkcd:medium purple" =>
      Some(
        line_color_named_components(
          4603756150848213972UL, 4598404814820397265UL, 4603897440248288340UL,
        ),
      )
    "xkcd:very dark green" =>
      Some(
        line_color_named_components(
          4582439112611993624UL, 4595667332693956375UL, 4577935512984623128UL,
        ),
      )
    "xkcd:dirt" =>
      Some(
        line_color_named_components(
          4603049703847842129UL, 4601442536921996188UL, 4598546104220471633UL,
        ),
      )
    "xkcd:dusky pink" =>
      Some(
        line_color_named_components(
          4605380978949069210UL, 4602290273322442399UL, 4603085026197860721UL,
        ),
      )
    "xkcd:red violet" =>
      Some(
        line_color_named_components(
          4603756150848213972UL, 4571171282956062736UL, 4601018668721773082UL,
        ),
      )
    "xkcd:lemon yellow" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4607182418800017408UL, 4597080226694700060UL,
        ),
      )
    "xkcd:pistachio" =>
      Some(
        line_color_named_components(
          4604957110748846104UL, 4607005807049924447UL, 4603085026197860721UL,
        ),
      )
    "xkcd:dull yellow" =>
      Some(
        line_color_named_components(
          4606581938849701342UL, 4605946136549366684UL, 4600100287621289687UL,
        ),
      )
    "xkcd:dark lime green" =>
      Some(
        line_color_named_components(
          4602572852122591136UL, 4604851143698790328UL, 4571171282956062736UL,
        ),
      )
    "xkcd:denim blue" =>
      Some(
        line_color_named_components(
          4597504094894923166UL, 4600100287621289687UL, 4603332282647990866UL,
        ),
      )
    "xkcd:teal blue" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4602979059147804945UL, 4603791473198232564UL,
        ),
      )
    "xkcd:lightish blue" =>
      Some(
        line_color_named_components(
          4597786673695071903UL, 4602290273322442399UL, 4607111774099980224UL,
        ),
      )
    "xkcd:purpley blue" =>
      Some(
        line_color_named_components(
          4600382866421438424UL, 4596515069094402586UL, 4606334682399571197UL,
        ),
      )
    "xkcd:light indigo" =>
      Some(
        line_color_named_components(
          4601371892221959003UL, 4600029642921252503UL, 4605486945999124986UL,
        ),
      )
    "xkcd:swamp green" =>
      Some(
        line_color_named_components(
          4601866405122219293UL, 4602873092097749169UL, 0UL,
        ),
      )
    "xkcd:brown green" =>
      Some(
        line_color_named_components(
          4601583826322070556UL, 4601301247521921819UL, 4589468260265693457UL,
        ),
      )
    "xkcd:dark maroon" =>
      Some(
        line_color_named_components(
          4597645384294997534UL, 0UL, 4584682081838174224UL,
        ),
      )
    "xkcd:hot purple" =>
      Some(
        line_color_named_components(
          4605345656599050617UL, 0UL, 4606829195299831487UL,
        ),
      )
    "xkcd:dark forest green" =>
      Some(
        line_color_named_components(
          0UL, 4595526043293882007UL, 4580178482210803728UL,
        ),
      )
    "xkcd:faded blue" =>
      Some(
        line_color_named_components(
          4600806734621661529UL, 4603120348547879314UL, 4604780498998753143UL,
        ),
      )
    "xkcd:drab green" =>
      Some(
        line_color_named_components(
          4601866405122219293UL, 4603438249698046643UL, 4599393840620917844UL,
        ),
      )
    "xkcd:light lime green" =>
      Some(
        line_color_named_components(
          4604709854298715959UL, 4607182418800017408UL, 4600877379321698714UL,
        ),
      )
    "xkcd:snot green" =>
      Some(
        line_color_named_components(
          4603720828498195380UL, 4604992433098864696UL, 0UL,
        ),
      )
    "xkcd:yellowish" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4606581938849701342UL, 4600877379321698714UL,
        ),
      )
    "xkcd:light blue green" =>
      Some(
        line_color_named_components(
          4602572852122591136UL, 4607041129399943039UL, 4604497920198604406UL,
        ),
      )
    "xkcd:bordeaux" =>
      Some(
        line_color_named_components(
          4602360918022479583UL, 0UL, 4595384753893807638UL,
        ),
      )
    "xkcd:light mauve" =>
      Some(
        line_color_named_components(
          4605027755448883288UL, 4603332282647990866UL, 4603862117898269748UL,
        ),
      )
    "xkcd:ocean" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4602360918022479583UL, 4603332282647990866UL,
        ),
      )
    "xkcd:marigold" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4604957110748846104UL, 4582439112611993624UL,
        ),
      )
    "xkcd:muddy green" =>
      Some(
        line_color_named_components(
          4600806734621661529UL, 4601866405122219293UL, 4596232490294253849UL,
        ),
      )
    "xkcd:dull orange" =>
      Some(
        line_color_named_components(
          4605804847149292315UL, 4602908414447767761UL, 4597504094894923166UL,
        ),
      )
    "xkcd:steel" =>
      Some(
        line_color_named_components(
          4601795760422182109UL, 4602873092097749169UL, 4603438249698046643UL,
        ),
      )
    "xkcd:electric purple" =>
      Some(
        line_color_named_components(
          4604180019048437077UL, 4594113149293138322UL, 4607182418800017408UL,
        ),
      )
    "xkcd:fluorescent green" =>
      Some(
        line_color_named_components(
          4584682081838174224UL, 4607182418800017408UL, 4584682081838174224UL,
        ),
      )
    "xkcd:yellowish brown" =>
      Some(
        line_color_named_components(
          4603650183798158195UL, 4602290273322442399UL, 4571171282956062736UL,
        ),
      )
    "xkcd:blush" =>
      Some(
        line_color_named_components(
          4606723228249775710UL, 4603756150848213972UL, 4603190993247916498UL,
        ),
      )
    "xkcd:soft green" =>
      Some(
        line_color_named_components(
          4601513181622033372UL, 4605027755448883288UL, 4602007694522293662UL,
        ),
      )
    "xkcd:bright orange" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4600100287621289687UL, 0UL,
        ),
      )
    "xkcd:lemon" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4607182418800017408UL, 4599464485320955029UL,
        ),
      )
    "xkcd:purple grey" | "xkcd:purple gray" =>
      Some(
        line_color_named_components(
          4602908414447767761UL, 4601513181622033372UL, 4602873092097749169UL,
        ),
      )
    "xkcd:acid green" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4607147096449998816UL, 4585247239438471698UL,
        ),
      )
    "xkcd:pale lavender" =>
      Some(
        line_color_named_components(
          4606581938849701342UL, 4605486945999124986UL, 4607147096449998816UL,
        ),
      )
    "xkcd:violet blue" =>
      Some(
        line_color_named_components(
          4599393840620917844UL, 4585812397038769172UL, 4605275011899013433UL,
        ),
      )
    "xkcd:light forest green" =>
      Some(
        line_color_named_components(
          4599252551220843476UL, 4603296960297972274UL, 4599535130020992213UL,
        ),
      )
    "xkcd:burnt red" =>
      Some(
        line_color_named_components(
          4603791473198232564UL, 4594113149293138322UL, 4581308797411398676UL,
        ),
      )
    "xkcd:khaki green" =>
      Some(
        line_color_named_components(
          4601725115722144925UL, 4602908414447767761UL, 4597221516094774429UL,
        ),
      )
    "xkcd:cerise" =>
      Some(
        line_color_named_components(
          4606016781249403868UL, 4586942712239364120UL, 4600594800521549977UL,
        ),
      )
    "xkcd:faded purple" =>
      Some(
        line_color_named_components(
          4603296960297972274UL, 4601442536921996188UL, 4603579539098121011UL,
        ),
      )
    "xkcd:apricot" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604427275498567222UL, 4601371892221959003UL,
        ),
      )
    "xkcd:dark olive green" =>
      Some(
        line_color_named_components(
          4597645384294997534UL, 4599111261820769107UL, 4577935512984623128UL,
        ),
      )
    "xkcd:grey brown" | "xkcd:gray brown" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4601583826322070556UL, 4599535130020992213UL,
        ),
      )
    "xkcd:green grey" | "xkcd:green gray" =>
      Some(
        line_color_named_components(
          4602078339222330846UL, 4603332282647990866UL, 4601513181622033372UL,
        ),
      )
    "xkcd:true blue" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4588638185040256542UL, 4605380978949069210UL,
        ),
      )
    "xkcd:pale violet" =>
      Some(
        line_color_named_components(
          4605451623649106394UL, 4604321308448511446UL, 4607005807049924447UL,
        ),
      )
    "xkcd:periwinkle blue" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4603579539098121011UL, 4607041129399943039UL,
        ),
      )
    "xkcd:light sky blue" =>
      Some(
        line_color_named_components(
          4605169044848957657UL, 4607076451749961632UL, 4607182418800017408UL,
        ),
      )
    "xkcd:blurple" =>
      Some(
        line_color_named_components(
          4599676419421066581UL, 4597221516094774429UL, 4605380978949069210UL,
        ),
      )
    "xkcd:green brown" =>
      Some(
        line_color_named_components(
          4599605774721029397UL, 4599181906520806292UL, 4577935512984623128UL,
        ),
      )
    "xkcd:bluegreen" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4602290273322442399UL, 4602219628622405214UL,
        ),
      )
    "xkcd:bright teal" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4606970484699905855UL, 4605169044848957657UL,
        ),
      )
    "xkcd:brownish yellow" =>
      Some(
        line_color_named_components(
          4605275011899013433UL, 4604391953148548630UL, 4577935512984623128UL,
        ),
      )
    "xkcd:pea soup" =>
      Some(
        line_color_named_components(
          4603332282647990866UL, 4603579539098121011UL, 4571171282956062736UL,
        ),
      )
    "xkcd:forest" =>
      Some(
        line_color_named_components(
          4586377554639066646UL, 4599676419421066581UL, 4585247239438471698UL,
        ),
      )
    "xkcd:barney purple" =>
      Some(
        line_color_named_components(
          4603826795548251156UL, 4580178482210803728UL, 4603544216748102419UL,
        ),
      )
    "xkcd:ultramarine" =>
      Some(
        line_color_named_components(
          4593689281092915216UL, 0UL, 4604427275498567222UL,
        ),
      )
    "xkcd:purplish" =>
      Some(
        line_color_named_components(
          4603402927348028051UL, 4599747064121103766UL, 4603120348547879314UL,
        ),
      )
    "xkcd:puke yellow" =>
      Some(
        line_color_named_components(
          4605027755448883288UL, 4604886466048808920UL, 4588073027439959068UL,
        ),
      )
    "xkcd:bluish grey" | "xkcd:bluish gray" =>
      Some(
        line_color_named_components(
          4601866405122219293UL, 4603085026197860721UL, 4603508894398083827UL,
        ),
      )
    "xkcd:dark periwinkle" =>
      Some(
        line_color_named_components(
          4600877379321698714UL, 4600382866421438424UL, 4605557590699162170UL,
        ),
      )
    "xkcd:dark lilac" =>
      Some(
        line_color_named_components(
          4603685506148176788UL, 4601371892221959003UL, 4604003407298344117UL,
        ),
      )
    "xkcd:reddish" =>
      Some(
        line_color_named_components(
          4605098400148920473UL, 4598334170120360081UL, 4598192880720285712UL,
        ),
      )
    "xkcd:light maroon" =>
      Some(
        line_color_named_components(
          4603897440248288340UL, 4598758038320583186UL, 4599817708821140950UL,
        ),
      )
    "xkcd:dusty purple" =>
      Some(
        line_color_named_components(
          4602767125047693392UL, 4600382866421438424UL, 4602943736797786353UL,
        ),
      )
    "xkcd:terra cotta" =>
      Some(
        line_color_named_components(
          4605275011899013433UL, 4600736089921624345UL, 4597504094894923166UL,
        ),
      )
    "xkcd:avocado" =>
      Some(
        line_color_named_components(
          4603261637947953682UL, 4604427275498567222UL, 4596515069094402586UL,
        ),
      )
    "xkcd:marine blue" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4597080226694700060UL, 4601159958121847451UL,
        ),
      )
    "xkcd:teal green" =>
      Some(
        line_color_named_components(
          4594395728093287059UL, 4603932762598306932UL, 4601513181622033372UL,
        ),
      )
    "xkcd:slate grey" | "xkcd:slate gray" =>
      Some(
        line_color_named_components(
          4599958998221215318UL, 4600806734621661529UL, 4601371892221959003UL,
        ),
      )
    "xkcd:lighter green" =>
      Some(
        line_color_named_components(
          4601937049822256477UL, 4607111774099980224UL, 4600665445221587161UL,
        ),
      )
    "xkcd:electric green" =>
      Some(
        line_color_named_components(
          4593830570492989585UL, 4607076451749961632UL, 4587507869839661594UL,
        ),
      )
    "xkcd:dusty blue" =>
      Some(
        line_color_named_components(
          4600029642921252503UL, 4602908414447767761UL, 4604285986098492854UL,
        ),
      )
    "xkcd:golden yellow" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4605169044848957657UL, 4590598575466288405UL,
        ),
      )
    "xkcd:bright yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607111774099980224UL, 4571171282956062736UL,
        ),
      )
    "xkcd:light lavender" =>
      Some(
        line_color_named_components(
          4606052103599422460UL, 4605133722498939065UL, 4607147096449998816UL,
        ),
      )
    "xkcd:umber" =>
      Some(
        line_color_named_components(
          4604462597848585814UL, 4600736089921624345UL, 0UL,
        ),
      )
    "xkcd:poop" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4600312221721401240UL, 0UL,
        ),
      )
    "xkcd:dark peach" =>
      Some(
        line_color_named_components(
          4606016781249403868UL, 4602572852122591136UL, 4600241577021364055UL,
        ),
      )
    "xkcd:jungle green" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4602767125047693392UL, 4598404814820397265UL,
        ),
      )
    "xkcd:eggshell" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4605663557749217947UL,
        ),
      )
    "xkcd:denim" =>
      Some(
        line_color_named_components(
          4597504094894923166UL, 4600665445221587161UL, 4603120348547879314UL,
        ),
      )
    "xkcd:yellow brown" =>
      Some(
        line_color_named_components(
          4604639209598678775UL, 4603402927348028051UL, 0UL,
        ),
      )
    "xkcd:dull purple" =>
      Some(
        line_color_named_components(
          4602837769747730577UL, 4599958998221215318UL, 4602572852122591136UL,
        ),
      )
    "xkcd:chocolate brown" =>
      Some(
        line_color_named_components(
          4598263525420322896UL, 4591728890666883353UL, 0UL,
        ),
      )
    "xkcd:wine red" =>
      Some(
        line_color_named_components(
          4602360918022479583UL, 4577935512984623128UL, 4594113149293138322UL,
        ),
      )
    "xkcd:neon blue" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4605840169499310907UL, 4607182418800017408UL,
        ),
      )
    "xkcd:dirty green" =>
      Some(
        line_color_named_components(
          4600877379321698714UL, 4602572852122591136UL, 4595384753893807638UL,
        ),
      )
    "xkcd:light tan" =>
      Some(
        line_color_named_components(
          4607041129399943039UL, 4606581938849701342UL, 4604250663748474262UL,
        ),
      )
    "xkcd:ice blue" =>
      Some(
        line_color_named_components(
          4605769524799273723UL, 4607182418800017408UL, 4607147096449998816UL,
        ),
      )
    "xkcd:cadet blue" =>
      Some(
        line_color_named_components(
          4599181906520806292UL, 4601866405122219293UL, 4603473572048065235UL,
        ),
      )
    "xkcd:dark mauve" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4599040617120731923UL, 4600594800521549977UL,
        ),
      )
    "xkcd:very light blue" =>
      Some(
        line_color_named_components(
          4605698880099236539UL, 4607182418800017408UL, 4607182418800017408UL,
        ),
      )
    "xkcd:grey purple" | "xkcd:gray purple" =>
      Some(
        line_color_named_components(
          4602767125047693392UL, 4601371892221959003UL, 4603120348547879314UL,
        ),
      )
    "xkcd:pastel pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604745176648734551UL, 4605416301299087802UL,
        ),
      )
    "xkcd:very light green" =>
      Some(
        line_color_named_components(
          4605557590699162170UL, 4607182418800017408UL, 4604851143698790328UL,
        ),
      )
    "xkcd:dark sky blue" =>
      Some(
        line_color_named_components(
          4598475459520434449UL, 4603190993247916498UL, 4606228715349515421UL,
        ),
      )
    "xkcd:evergreen" =>
      Some(
        line_color_named_components(
          4581308797411398676UL, 4598687393620546002UL, 4595102175093658901UL,
        ),
      )
    "xkcd:dull pink" =>
      Some(
        line_color_named_components(
          4605698880099236539UL, 4602908414447767761UL, 4603720828498195380UL,
        ),
      )
    "xkcd:aubergine" =>
      Some(
        line_color_named_components(
          4597786673695071903UL, 4583569427812588572UL, 4596515069094402586UL,
        ),
      )
    "xkcd:mahogany" =>
      Some(
        line_color_named_components(
          4598899327720657555UL, 4571171282956062736UL, 0UL,
        ),
      )
    "xkcd:reddish orange" =>
      Some(
        line_color_named_components(
          4606935162349887263UL, 4598758038320583186UL, 4592576627067329564UL,
        ),
      )
    "xkcd:deep green" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4599958998221215318UL, 4588638185040256542UL,
        ),
      )
    "xkcd:vomit green" =>
      Some(
        line_color_named_components(
          4603014381497823537UL, 4603897440248288340UL, 4577935512984623128UL,
        ),
      )
    "xkcd:purple pink" =>
      Some(
        line_color_named_components(
          4606087425949441052UL, 4598069252495220640UL, 4605804847149292315UL,
        ),
      )
    "xkcd:dusty pink" =>
      Some(
        line_color_named_components(
          4605698880099236539UL, 4603049703847842129UL, 4603402927348028051UL,
        ),
      )
    "xkcd:faded green" =>
      Some(
        line_color_named_components(
          4602360918022479583UL, 4604462597848585814UL, 4601866405122219293UL,
        ),
      )
    "xkcd:camo green" =>
      Some(
        line_color_named_components(
          4599464485320955029UL, 4600806734621661529UL, 4594395728093287059UL,
        ),
      )
    "xkcd:pinky purple" =>
      Some(
        line_color_named_components(
          4605275011899013433UL, 4599040617120731923UL, 4604886466048808920UL,
        ),
      )
    "xkcd:pink purple" =>
      Some(
        line_color_named_components(
          4605910814199348091UL, 4598969972420694739UL, 4605875491849329499UL,
        ),
      )
    "xkcd:brownish red" =>
      Some(
        line_color_named_components(
          4603756150848213972UL, 4596797647894551323UL, 4594113149293138322UL,
        ),
      )
    "xkcd:dark rose" =>
      Some(
        line_color_named_components(
          4604568564898641591UL, 4598758038320583186UL, 4600241577021364055UL,
        ),
      )
    "xkcd:mud" =>
      Some(
        line_color_named_components(
          4601795760422182109UL, 4600170932321326871UL, 4589750839065842194UL,
        ),
      )
    "xkcd:brownish" =>
      Some(
        line_color_named_components(
          4603685506148176788UL, 4601371892221959003UL, 4599817708821140950UL,
        ),
      )
    "xkcd:emerald green" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4603226315597935090UL, 4593141784667627038UL,
        ),
      )
    "xkcd:pale brown" =>
      Some(
        line_color_named_components(
          4604427275498567222UL, 4603296960297972274UL, 4601442536921996188UL,
        ),
      )
    "xkcd:dull blue" =>
      Some(
        line_color_named_components(
          4598828683020620370UL, 4601937049822256477UL, 4603685506148176788UL,
        ),
      )
    "xkcd:burnt umber" =>
      Some(
        line_color_named_components(
          4603826795548251156UL, 4598546104220471633UL, 4588073027439959068UL,
        ),
      )
    "xkcd:medium green" =>
      Some(
        line_color_named_components(
          4597221516094774429UL, 4604285986098492854UL, 4598758038320583186UL,
        ),
      )
    "xkcd:clay" =>
      Some(
        line_color_named_components(
          4604603887248660183UL, 4601159958121847451UL, 4599323195920880660UL,
        ),
      )
    "xkcd:light aqua" =>
      Some(
        line_color_named_components(
          4603120348547879314UL, 4607182418800017408UL, 4605910814199348091UL,
        ),
      )
    "xkcd:light olive green" =>
      Some(
        line_color_named_components(
          4603968084948325525UL, 4604886466048808920UL, 4600170932321326871UL,
        ),
      )
    "xkcd:brownish orange" =>
      Some(
        line_color_named_components(
          4605345656599050617UL, 4602078339222330846UL, 4594113149293138322UL,
        ),
      )
    "xkcd:dark aqua" =>
      Some(
        line_color_named_components(
          4581308797411398676UL, 4601089313421810266UL, 4601230602821884635UL,
        ),
      )
    "xkcd:purplish pink" =>
      Some(
        line_color_named_components(
          4605451623649106394UL, 4600241577021364055UL, 4604321308448511446UL,
        ),
      )
    "xkcd:dark salmon" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4600029642921252503UL, 4599535130020992213UL,
        ),
      )
    "xkcd:greenish grey" | "xkcd:greenish gray" =>
      Some(
        line_color_named_components(
          4603473572048065235UL, 4604321308448511446UL, 4603155670897897906UL,
        ),
      )
    "xkcd:jade" =>
      Some(
        line_color_named_components(
          4593424363467775775UL, 4604074051998381301UL, 4601866405122219293UL,
        ),
      )
    "xkcd:ugly green" =>
      Some(
        line_color_named_components(
          4602290273322442399UL, 4603508894398083827UL, 4577935512984623128UL,
        ),
      )
    "xkcd:dark beige" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4603367604998009458UL, 4600594800521549977UL,
        ),
      )
    "xkcd:emerald" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4603826795548251156UL, 4598828683020620370UL,
        ),
      )
    "xkcd:pale red" =>
      Some(
        line_color_named_components(
          4605840169499310907UL, 4599605774721029397UL, 4599111261820769107UL,
        ),
      )
    "xkcd:light magenta" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4600382866421438424UL, 4606899839999868671UL,
        ),
      )
    "xkcd:sky" =>
      Some(
        line_color_named_components(
          4602767125047693392UL, 4605310334249032025UL, 4607076451749961632UL,
        ),
      )
    "xkcd:light cyan" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4607182418800017408UL, 4607076451749961632UL,
        ),
      )
    "xkcd:yellow orange" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4604391953148548630UL, 4571171282956062736UL,
        ),
      )
    "xkcd:reddish purple" =>
      Some(
        line_color_named_components(
          4603296960297972274UL, 4585247239438471698UL, 4599393840620917844UL,
        ),
      )
    "xkcd:reddish pink" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4595384753893807638UL, 4599605774721029397UL,
        ),
      )
    "xkcd:orchid" =>
      Some(
        line_color_named_components(
          4605239689548994841UL, 4601937049822256477UL, 4605098400148920473UL,
        ),
      )
    "xkcd:dirty yellow" =>
      Some(
        line_color_named_components(
          4605416301299087802UL, 4605133722498939065UL, 4585812397038769172UL,
        ),
      )
    "xkcd:orange red" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4598263525420322896UL, 4593141784667627038UL,
        ),
      )
    "xkcd:deep red" =>
      Some(
        line_color_named_components(
          4603614861448139603UL, 4575674882583433232UL, 0UL,
        ),
      )
    "xkcd:orange brown" =>
      Some(
        line_color_named_components(
          4604886466048808920UL, 4600736089921624345UL, 0UL,
        ),
      )
    "xkcd:cobalt blue" =>
      Some(
        line_color_named_components(
          4577935512984623128UL, 4585812397038769172UL, 4604074051998381301UL,
        ),
      )
    "xkcd:neon pink" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4571171282956062736UL, 4603614861448139603UL,
        ),
      )
    "xkcd:rose pink" =>
      Some(
        line_color_named_components(
          4606899839999868671UL, 4602943736797786353UL, 4603614861448139603UL,
        ),
      )
    "xkcd:greyish purple" | "xkcd:grayish purple" =>
      Some(
        line_color_named_components(
          4602979059147804945UL, 4601654471022107740UL, 4603296960297972274UL,
        ),
      )
    "xkcd:raspberry" =>
      Some(
        line_color_named_components(
          4604391953148548630UL, 4571171282956062736UL, 4598828683020620370UL,
        ),
      )
    "xkcd:aqua green" =>
      Some(
        line_color_named_components(
          4589750839065842194UL, 4606122748299459644UL, 4603367604998009458UL,
        ),
      )
    "xkcd:salmon pink" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4602360918022479583UL, 4602431562722516767UL,
        ),
      )
    "xkcd:tangerine" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4603402927348028051UL, 4584682081838174224UL,
        ),
      )
    "xkcd:brownish green" =>
      Some(
        line_color_named_components(
          4601159958121847451UL, 4601442536921996188UL, 4585247239438471698UL,
        ),
      )
    "xkcd:red brown" =>
      Some(
        line_color_named_components(
          4603085026197860721UL, 4595667332693956375UL, 4590881154266437142UL,
        ),
      )
    "xkcd:greenish brown" =>
      Some(
        line_color_named_components(
          4601089313421810266UL, 4600524155821512792UL, 4589750839065842194UL,
        ),
      )
    "xkcd:pumpkin" =>
      Some(
        line_color_named_components(
          4606122748299459644UL, 4602078339222330846UL, 4571171282956062736UL,
        ),
      )
    "xkcd:pine green" =>
      Some(
        line_color_named_components(
          4585812397038769172UL, 4598758038320583186UL, 4593141784667627038UL,
        ),
      )
    "xkcd:charcoal" =>
      Some(
        line_color_named_components(
          4596515069094402586UL, 4597080226694700060UL, 4596938937294625692UL,
        ),
      )
    "xkcd:baby pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604639209598678775UL, 4605451623649106394UL,
        ),
      )
    "xkcd:cornflower" =>
      Some(
        line_color_named_components(
          4601159958121847451UL, 4602219628622405214UL, 4606899839999868671UL,
        ),
      )
    "xkcd:blue violet" =>
      Some(
        line_color_named_components(
          4600241577021364055UL, 4582439112611993624UL, 4606405327099608381UL,
        ),
      )
    "xkcd:chocolate" =>
      Some(
        line_color_named_components(
          4597786673695071903UL, 4592576627067329564UL, 4575674882583433232UL,
        ),
      )
    "xkcd:greyish green" | "xkcd:grayish green" =>
      Some(
        line_color_named_components(
          4602767125047693392UL, 4604038729648362709UL, 4602502207422553951UL,
        ),
      )
    "xkcd:scarlet" =>
      Some(
        line_color_named_components(
          4604886466048808920UL, 4571171282956062736UL, 4591728890666883353UL,
        ),
      )
    "xkcd:green yellow" =>
      Some(
        line_color_named_components(
          4605275011899013433UL, 4607182418800017408UL, 4594678306893435796UL,
        ),
      )
    "xkcd:dark olive" =>
      Some(
        line_color_named_components(
          4596938937294625692UL, 4597927963095146271UL, 4575674882583433232UL,
        ),
      )
    "xkcd:sienna" =>
      Some(
        line_color_named_components(
          4604144696698418485UL, 4599747064121103766UL, 4593141784667627038UL,
        ),
      )
    "xkcd:pastel purple" =>
      Some(
        line_color_named_components(
          4605310334249032025UL, 4603826795548251156UL, 4607182418800017408UL,
        ),
      )
    "xkcd:terracotta" =>
      Some(
        line_color_named_components(
          4605310334249032025UL, 4600877379321698714UL, 4598263525420322896UL,
        ),
      )
    "xkcd:aqua blue" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4605804847149292315UL, 4606405327099608381UL,
        ),
      )
    "xkcd:sage green" =>
      Some(
        line_color_named_components(
          4602979059147804945UL, 4604497920198604406UL, 4602148983922368030UL,
        ),
      )
    "xkcd:blood red" =>
      Some(
        line_color_named_components(
          4603544216748102419UL, 0UL, 4575674882583433232UL,
        ),
      )
    "xkcd:deep pink" =>
      Some(
        line_color_named_components(
          4605345656599050617UL, 4571171282956062736UL, 4600594800521549977UL,
        ),
      )
    "xkcd:grass" =>
      Some(
        line_color_named_components(
          4600170932321326871UL, 4604250663748474262UL, 4595526043293882007UL,
        ),
      )
    "xkcd:moss" =>
      Some(
        line_color_named_components(
          4602007694522293662UL, 4603579539098121011UL, 4599888353521178134UL,
        ),
      )
    "xkcd:pastel blue" =>
      Some(
        line_color_named_components(
          4603897440248288340UL, 4604921788398827512UL, 4607147096449998816UL,
        ),
      )
    "xkcd:bluish green" =>
      Some(
        line_color_named_components(
          4589185681465544720UL, 4604038729648362709UL, 4601866405122219293UL,
        ),
      )
    "xkcd:green blue" =>
      Some(
        line_color_named_components(
          4582439112611993624UL, 4604533242548622999UL, 4603085026197860721UL,
        ),
      )
    "xkcd:dark tan" =>
      Some(
        line_color_named_components(
          4604356630798530038UL, 4602979059147804945UL, 4598899327720657555UL,
        ),
      )
    "xkcd:greenish blue" =>
      Some(
        line_color_named_components(
          4586377554639066646UL, 4603085026197860721UL, 4602943736797786353UL,
        ),
      )
    "xkcd:pale orange" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604074051998381301UL, 4599747064121103766UL,
        ),
      )
    "xkcd:vomit" =>
      Some(
        line_color_named_components(
          4603897440248288340UL, 4603968084948325525UL, 4590598575466288405UL,
        ),
      )
    "xkcd:forrest green" =>
      Some(
        line_color_named_components(
          4590598575466288405UL, 4598475459520434449UL, 4582439112611993624UL,
        ),
      )
    "xkcd:dark lavender" =>
      Some(
        line_color_named_components(
          4602873092097749169UL, 4600948024021735898UL, 4603544216748102419UL,
        ),
      )
    "xkcd:dark violet" =>
      Some(
        line_color_named_components(
          4596515069094402586UL, 4571171282956062736UL, 4598069252495220640UL,
        ),
      )
    "xkcd:purple blue" =>
      Some(
        line_color_named_components(
          4600665445221587161UL, 4595526043293882007UL, 4606405327099608381UL,
        ),
      )
    "xkcd:dark cyan" =>
      Some(
        line_color_named_components(
          4585812397038769172UL, 4602979059147804945UL, 4603049703847842129UL,
        ),
      )
    "xkcd:olive drab" =>
      Some(
        line_color_named_components(
          4601513181622033372UL, 4602007694522293662UL, 4596232490294253849UL,
        ),
      )
    "xkcd:pinkish" =>
      Some(
        line_color_named_components(
          4605663557749217947UL, 4601159958121847451UL, 4602572852122591136UL,
        ),
      )
    "xkcd:cobalt" =>
      Some(
        line_color_named_components(
          4593141784667627038UL, 4598758038320583186UL, 4603226315597935090UL,
        ),
      )
    "xkcd:neon purple" =>
      Some(
        line_color_named_components(
          4604815821348771736UL, 4590033417865990931UL, 4607147096449998816UL,
        ),
      )
    "xkcd:light turquoise" =>
      Some(
        line_color_named_components(
          4602572852122591136UL, 4606793872949812895UL, 4605380978949069210UL,
        ),
      )
    "xkcd:apple green" =>
      Some(
        line_color_named_components(
          4602007694522293662UL, 4605416301299087802UL, 4594537017493361427UL,
        ),
      )
    "xkcd:dull green" =>
      Some(
        line_color_named_components(
          4601866405122219293UL, 4604038729648362709UL, 4600594800521549977UL,
        ),
      )
    "xkcd:wine" =>
      Some(
        line_color_named_components(
          4602696480347656208UL, 4571171282956062736UL, 4598069252495220640UL,
        ),
      )
    "xkcd:powder blue" =>
      Some(
        line_color_named_components(
          4604427275498567222UL, 4605557590699162170UL, 4607076451749961632UL,
        ),
      )
    "xkcd:off white" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4606228715349515421UL,
        ),
      )
    "xkcd:electric blue" =>
      Some(
        line_color_named_components(
          4582439112611993624UL, 4599464485320955029UL, 4607182418800017408UL,
        ),
      )
    "xkcd:dark turquoise" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4600170932321326871UL, 4600029642921252503UL,
        ),
      )
    "xkcd:blue purple" =>
      Some(
        line_color_named_components(
          4599817708821140950UL, 4594960885693584533UL, 4605451623649106394UL,
        ),
      )
    "xkcd:azure" =>
      Some(
        line_color_named_components(
          4582439112611993624UL, 4603614861448139603UL, 4606758550599794302UL,
        ),
      )
    "xkcd:bright red" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 0UL, 4587507869839661594UL,
        ),
      )
    "xkcd:pinkish red" =>
      Some(
        line_color_named_components(
          4606687905899757118UL, 4586942712239364120UL, 4598546104220471633UL,
        ),
      )
    "xkcd:cornflower blue" =>
      Some(
        line_color_named_components(
          4599393840620917844UL, 4601583826322070556UL, 4605769524799273723UL,
        ),
      )
    "xkcd:light olive" =>
      Some(
        line_color_named_components(
          4604250663748474262UL, 4604921788398827512UL, 4601089313421810266UL,
        ),
      )
    "xkcd:grape" =>
      Some(
        line_color_named_components(
          4601301247521921819UL, 4596515069094402586UL, 4600524155821512792UL,
        ),
      )
    "xkcd:greyish blue" | "xkcd:grayish blue" =>
      Some(
        line_color_named_components(
          4600312221721401240UL, 4602731802697674800UL, 4603720828498195380UL,
        ),
      )
    "xkcd:purplish blue" =>
      Some(
        line_color_named_components(
          4600453511121475608UL, 4593141784667627038UL, 4606970484699905855UL,
        ),
      )
    "xkcd:yellowish green" =>
      Some(
        line_color_named_components(
          4604391953148548630UL, 4605981458899385276UL, 4590881154266437142UL,
        ),
      )
    "xkcd:greenish yellow" =>
      Some(
        line_color_named_components(
          4605416301299087802UL, 4607111774099980224UL, 4575674882583433232UL,
        ),
      )
    "xkcd:medium blue" =>
      Some(
        line_color_named_components(
          4595384753893807638UL, 4601513181622033372UL, 4604780498998753143UL,
        ),
      )
    "xkcd:dusty rose" =>
      Some(
        line_color_named_components(
          4604957110748846104UL, 4601795760422182109UL, 4602290273322442399UL,
        ),
      )
    "xkcd:light violet" =>
      Some(
        line_color_named_components(
          4605734202449255131UL, 4604533242548622999UL, 4607076451749961632UL,
        ),
      )
    "xkcd:midnight blue" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 0UL, 4596656358494476955UL,
        ),
      )
    "xkcd:bluish purple" =>
      Some(
        line_color_named_components(
          4601583826322070556UL, 4597504094894923166UL, 4606334682399571197UL,
        ),
      )
    "xkcd:red orange" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4597645384294997534UL, 4582439112611993624UL,
        ),
      )
    "xkcd:dark magenta" =>
      Some(
        line_color_named_components(
          4603473572048065235UL, 0UL, 4599747064121103766UL,
        ),
      )
    "xkcd:greenish" =>
      Some(
        line_color_named_components(
          4598192880720285712UL, 4603932762598306932UL, 4601018668721773082UL,
        ),
      )
    "xkcd:ocean blue" =>
      Some(
        line_color_named_components(
          4577935512984623128UL, 4601654471022107740UL, 4603685506148176788UL,
        ),
      )
    "xkcd:coral" =>
      Some(
        line_color_named_components(
          4607076451749961632UL, 4600029642921252503UL, 4599323195920880660UL,
        ),
      )
    "xkcd:cream" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4605027755448883288UL,
        ),
      )
    "xkcd:reddish brown" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4595243464493733270UL, 4585812397038769172UL,
        ),
      )
    "xkcd:burnt sienna" =>
      Some(
        line_color_named_components(
          4604391953148548630UL, 4599181906520806292UL, 4588638185040256542UL,
        ),
      )
    "xkcd:brick" =>
      Some(
        line_color_named_components(
          4603826795548251156UL, 4596797647894551323UL, 4594113149293138322UL,
        ),
      )
    "xkcd:sage" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4604321308448511446UL, 4601795760422182109UL,
        ),
      )
    "xkcd:grey green" | "xkcd:gray green" =>
      Some(
        line_color_named_components(
          4602148983922368030UL, 4603650183798158195UL, 4601795760422182109UL,
        ),
      )
    "xkcd:white" | "white" | "w" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4607182418800017408UL,
        ),
      )
    "xkcd:robin's egg blue" =>
      Some(
        line_color_named_components(
          4603544216748102419UL, 4606617261199719934UL, 4606970484699905855UL,
        ),
      )
    "xkcd:moss green" =>
      Some(
        line_color_named_components(
          4600806734621661529UL, 4603085026197860721UL, 4597080226694700060UL,
        ),
      )
    "xkcd:steel blue" =>
      Some(
        line_color_named_components(
          4600029642921252503UL, 4602502207422553951UL, 4603614861448139603UL,
        ),
      )
    "xkcd:eggplant" =>
      Some(
        line_color_named_components(
          4597080226694700060UL, 4584682081838174224UL, 4596656358494476955UL,
        ),
      )
    "xkcd:light yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607147096449998816UL, 4602290273322442399UL,
        ),
      )
    "xkcd:leaf green" =>
      Some(
        line_color_named_components(
          4600170932321326871UL, 4604144696698418485UL, 4580178482210803728UL,
        ),
      )
    "xkcd:light grey" | "xkcd:light gray" =>
      Some(
        line_color_named_components(
          4605804847149292315UL, 4605946136549366684UL, 4605734202449255131UL,
        ),
      )
    "xkcd:puke" =>
      Some(
        line_color_named_components(
          4604003407298344117UL, 4604003407298344117UL, 4575674882583433232UL,
        ),
      )
    "xkcd:pinkish purple" =>
      Some(
        line_color_named_components(
          4605734202449255131UL, 4598758038320583186UL, 4605769524799273723UL,
        ),
      )
    "xkcd:sea blue" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4601866405122219293UL, 4603438249698046643UL,
        ),
      )
    "xkcd:pale purple" =>
      Some(
        line_color_named_components(
          4604639209598678775UL, 4603261637947953682UL, 4605663557749217947UL,
        ),
      )
    "xkcd:slate blue" =>
      Some(
        line_color_named_components(
          4600100287621289687UL, 4602431562722516767UL, 4603579539098121011UL,
        ),
      )
    "xkcd:blue grey" | "xkcd:blue gray" =>
      Some(
        line_color_named_components(
          4600453511121475608UL, 4602431562722516767UL, 4603190993247916498UL,
        ),
      )
    "xkcd:hunter green" =>
      Some(
        line_color_named_components(
          4586377554639066646UL, 4598192880720285712UL, 4584682081838174224UL,
        ),
      )
    "xkcd:fuchsia" =>
      Some(
        line_color_named_components(
          4606546616499682750UL, 4587507869839661594UL, 4605840169499310907UL,
        ),
      )
    "xkcd:crimson" =>
      Some(
        line_color_named_components(
          4603120348547879314UL, 0UL, 4588638185040256542UL,
        ),
      )
    "xkcd:pale yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4602837769747730577UL,
        ),
      )
    "xkcd:ochre" =>
      Some(
        line_color_named_components(
          4604921788398827512UL, 4603261637947953682UL, 4581308797411398676UL,
        ),
      )
    "xkcd:mustard yellow" =>
      Some(
        line_color_named_components(
          4605592913049180762UL, 4604851143698790328UL, 4585812397038769172UL,
        ),
      )
    "xkcd:light red" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4598687393620546002UL, 4599040617120731923UL,
        ),
      )
    "xkcd:cerulean" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4602873092097749169UL, 4605557590699162170UL,
        ),
      )
    "xkcd:pale pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4605486945999124986UL, 4605946136549366684UL,
        ),
      )
    "xkcd:deep blue" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4575674882583433232UL, 4601795760422182109UL,
        ),
      )
    "xkcd:rust" =>
      Some(
        line_color_named_components(
          4604109374348399893UL, 4597645384294997534UL, 4585247239438471698UL,
        ),
      )
    "xkcd:light teal" =>
      Some(
        line_color_named_components(
          4603261637947953682UL, 4606228715349515421UL, 4604992433098864696UL,
        ),
      )
    "xkcd:slate" =>
      Some(
        line_color_named_components(
          4599393840620917844UL, 4600806734621661529UL, 4601725115722144925UL,
        ),
      )
    "xkcd:goldenrod" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4605027755448883288UL, 4581308797411398676UL,
        ),
      )
    "xkcd:dark yellow" =>
      Some(
        line_color_named_components(
          4605698880099236539UL, 4604603887248660183UL, 4585812397038769172UL,
        ),
      )
    "xkcd:dark grey" | "xkcd:dark gray" =>
      Some(
        line_color_named_components(
          4596797647894551323UL, 4596938937294625692UL, 4596938937294625692UL,
        ),
      )
    "xkcd:army green" =>
      Some(
        line_color_named_components(
          4598969972420694739UL, 4600241577021364055UL, 4590881154266437142UL,
        ),
      )
    "xkcd:grey blue" | "xkcd:gray blue" =>
      Some(
        line_color_named_components(
          4601230602821884635UL, 4603085026197860721UL, 4603968084948325525UL,
        ),
      )
    "xkcd:seafoam" =>
      Some(
        line_color_named_components(
          4602696480347656208UL, 4606970484699905855UL, 4604285986098492854UL,
        ),
      )
    "xkcd:puce" =>
      Some(
        line_color_named_components(
          4604003407298344117UL, 4602572852122591136UL, 4599464485320955029UL,
        ),
      )
    "xkcd:spring green" =>
      Some(
        line_color_named_components(
          4604144696698418485UL, 4606970484699905855UL, 4601654471022107740UL,
        ),
      )
    "xkcd:dark orange" =>
      Some(
        line_color_named_components(
          4605169044848957657UL, 4599393840620917844UL, 4575674882583433232UL,
        ),
      )
    "xkcd:sand" =>
      Some(
        line_color_named_components(
          4606158070649478236UL, 4605310334249032025UL, 4602007694522293662UL,
        ),
      )
    "xkcd:pastel green" =>
      Some(
        line_color_named_components(
          4604391953148548630UL, 4607182418800017408UL, 4603720828498195380UL,
        ),
      )
    "xkcd:mint" =>
      Some(
        line_color_named_components(
          4603791473198232564UL, 4607147096449998816UL, 4604391953148548630UL,
        ),
      )
    "xkcd:light orange" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4604180019048437077UL, 4598758038320583186UL,
        ),
      )
    "xkcd:bright pink" =>
      Some(
        line_color_named_components(
          4607147096449998816UL, 4571171282956062736UL, 4604427275498567222UL,
        ),
      )
    "xkcd:chartreuse" =>
      Some(
        line_color_named_components(
          4604992433098864696UL, 4606935162349887263UL, 4585812397038769172UL,
        ),
      )
    "xkcd:deep purple" =>
      Some(
        line_color_named_components(
          4596797647894551323UL, 4571171282956062736UL, 4598069252495220640UL,
        ),
      )
    "xkcd:dark brown" =>
      Some(
        line_color_named_components(
          4596515069094402586UL, 4592576627067329564UL, 4575674882583433232UL,
        ),
      )
    "xkcd:taupe" =>
      Some(
        line_color_named_components(
          4604709854298715959UL, 4603897440248288340UL, 4602731802697674800UL,
        ),
      )
    "xkcd:pea green" =>
      Some(
        line_color_named_components(
          4603190993247916498UL, 4604215341398455669UL, 4589750839065842194UL,
        ),
      )
    "xkcd:puke green" =>
      Some(
        line_color_named_components(
          4603614861448139603UL, 4604321308448511446UL, 4583569427812588572UL,
        ),
      )
    "xkcd:kelly green" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4604215341398455669UL, 4595667332693956375UL,
        ),
      )
    "xkcd:seafoam green" =>
      Some(
        line_color_named_components(
          4602290273322442399UL, 4606970484699905855UL, 4604215341398455669UL,
        ),
      )
    "xkcd:blue green" =>
      Some(
        line_color_named_components(
          4590033417865990931UL, 4602572852122591136UL, 4601371892221959003UL,
        ),
      )
    "xkcd:khaki" =>
      Some(
        line_color_named_components(
          4604180019048437077UL, 4604038729648362709UL, 4600594800521549977UL,
        ),
      )
    "xkcd:burgundy" =>
      Some(
        line_color_named_components(
          4600524155821512792UL, 0UL, 4594113149293138322UL,
        ),
      )
    "xkcd:dark teal" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4599111261820769107UL, 4599181906520806292UL,
        ),
      )
    "xkcd:brick red" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4590315996666139668UL, 4575674882583433232UL,
        ),
      )
    "xkcd:royal purple" =>
      Some(
        line_color_named_components(
          4598969972420694739UL, 0UL, 4601442536921996188UL,
        ),
      )
    "xkcd:plum" =>
      Some(
        line_color_named_components(
          4599888353521178134UL, 4588638185040256542UL, 4598263525420322896UL,
        ),
      )
    "xkcd:mint green" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4607182418800017408UL, 4603791473198232564UL,
        ),
      )
    "xkcd:gold" =>
      Some(
        line_color_named_components(
          4605910814199348091UL, 4604533242548622999UL, 4586942712239364120UL,
        ),
      )
    "xkcd:baby blue" =>
      Some(
        line_color_named_components(
          4603897440248288340UL, 4605486945999124986UL, 4607147096449998816UL,
        ),
      )
    "xkcd:yellow green" =>
      Some(
        line_color_named_components(
          4604957110748846104UL, 4607041129399943039UL, 4595526043293882007UL,
        ),
      )
    "xkcd:bright purple" =>
      Some(
        line_color_named_components(
          4604886466048808920UL, 4577935512984623128UL, 4607111774099980224UL,
        ),
      )
    "xkcd:dark red" =>
      Some(line_color_named_components(4602837769747730577UL, 0UL, 0UL))
    "xkcd:pale blue" =>
      Some(
        line_color_named_components(
          4605522268349143578UL, 4607147096449998816UL, 4607147096449998816UL,
        ),
      )
    "xkcd:grass green" =>
      Some(
        line_color_named_components(
          4598069252495220640UL, 4603650183798158195UL, 4586377554639066646UL,
        ),
      )
    "xkcd:navy" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4590598575466288405UL, 4597927963095146271UL,
        ),
      )
    "xkcd:aquamarine" =>
      Some(
        line_color_named_components(
          4580178482210803728UL, 4605804847149292315UL, 4604462597848585814UL,
        ),
      )
    "xkcd:burnt orange" =>
      Some(
        line_color_named_components(
          4604957110748846104UL, 4599181906520806292UL, 4571171282956062736UL,
        ),
      )
    "xkcd:neon green" =>
      Some(
        line_color_named_components(
          4586942712239364120UL, 4607182418800017408UL, 4586942712239364120UL,
        ),
      )
    "xkcd:bright blue" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4600806734621661529UL, 4607076451749961632UL,
        ),
      )
    "xkcd:rose" =>
      Some(
        line_color_named_components(
          4605486945999124986UL, 4600594800521549977UL, 4601937049822256477UL,
        ),
      )
    "xkcd:light pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4605557590699162170UL, 4606052103599422460UL,
        ),
      )
    "xkcd:mustard" =>
      Some(
        line_color_named_components(
          4605451623649106394UL, 4604497920198604406UL, 4571171282956062736UL,
        ),
      )
    "xkcd:indigo" =>
      Some(
        line_color_named_components(
          4597080226694700060UL, 4575674882583433232UL, 4602767125047693392UL,
        ),
      )
    "xkcd:lime" =>
      Some(
        line_color_named_components(
          4604180019048437077UL, 4607182418800017408UL, 4596232490294253849UL,
        ),
      )
    "xkcd:sea green" =>
      Some(
        line_color_named_components(
          4599535130020992213UL, 4607076451749961632UL, 4603862117898269748UL,
        ),
      )
    "xkcd:periwinkle" =>
      Some(
        line_color_named_components(
          4603190993247916498UL, 4602767125047693392UL, 4607147096449998816UL,
        ),
      )
    "xkcd:dark pink" =>
      Some(
        line_color_named_components(
          4605345656599050617UL, 4598263525420322896UL, 4601230602821884635UL,
        ),
      )
    "xkcd:olive green" =>
      Some(
        line_color_named_components(
          4600948024021735898UL, 4602290273322442399UL, 4580178482210803728UL,
        ),
      )
    "xkcd:peach" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604391953148548630UL, 4602431562722516767UL,
        ),
      )
    "xkcd:pale green" =>
      Some(
        line_color_named_components(
          4605204367198976249UL, 4607111774099980224UL, 4604568564898641591UL,
        ),
      )
    "xkcd:light brown" =>
      Some(
        line_color_named_components(
          4604285986098492854UL, 4602731802697674800UL, 4599323195920880660UL,
        ),
      )
    "xkcd:hot pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4575674882583433232UL, 4603155670897897906UL,
        ),
      )
    "xkcd:black" | "black" | "k" =>
      Some(line_color_named_components(0UL, 0UL, 0UL))
    "xkcd:lilac" =>
      Some(
        line_color_named_components(
          4605451623649106394UL, 4603897440248288340UL, 4607111774099980224UL,
        ),
      )
    "xkcd:navy blue" =>
      Some(
        line_color_named_components(
          0UL, 4589468260265693457UL, 4598616748920508818UL,
        ),
      )
    "xkcd:royal blue" =>
      Some(
        line_color_named_components(
          4581308797411398676UL, 4580178482210803728UL, 4604180019048437077UL,
        ),
      )
    "xkcd:beige" =>
      Some(
        line_color_named_components(
          4606299360049552605UL, 4605875491849329499UL, 4604038729648362709UL,
        ),
      )
    "xkcd:salmon" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4602219628622405214UL, 4601301247521921819UL,
        ),
      )
    "xkcd:olive" =>
      Some(
        line_color_named_components(
          4601442536921996188UL, 4601937049822256477UL, 4588073027439959068UL,
        ),
      )
    "xkcd:maroon" =>
      Some(
        line_color_named_components(
          4600806734621661529UL, 0UL, 4593830570492989585UL,
        ),
      )
    "xkcd:bright green" =>
      Some(
        line_color_named_components(
          4571171282956062736UL, 4607182418800017408UL, 4583569427812588572UL,
        ),
      )
    "xkcd:dark purple" =>
      Some(
        line_color_named_components(
          4596656358494476955UL, 4582439112611993624UL, 4597927963095146271UL,
        ),
      )
    "xkcd:mauve" =>
      Some(
        line_color_named_components(
          4604321308448511446UL, 4601654471022107740UL, 4602731802697674800UL,
        ),
      )
    "xkcd:forest green" =>
      Some(
        line_color_named_components(
          4582439112611993624UL, 4598687393620546002UL, 4586942712239364120UL,
        ),
      )
    "xkcd:aqua" =>
      Some(
        line_color_named_components(
          4590033417865990931UL, 4606440649449626973UL, 4605275011899013433UL,
        ),
      )
    "xkcd:cyan" | "aqua" | "cyan" =>
      Some(
        line_color_named_components(
          0UL, 4607182418800017408UL, 4607182418800017408UL,
        ),
      )
    "xkcd:tan" =>
      Some(
        line_color_named_components(
          4605557590699162170UL, 4604462597848585814UL, 4601513181622033372UL,
        ),
      )
    "xkcd:dark blue" =>
      Some(
        line_color_named_components(
          0UL, 4577935512984623128UL, 4600100287621289687UL,
        ),
      )
    "xkcd:lavender" =>
      Some(
        line_color_named_components(
          4605204367198976249UL, 4603791473198232564UL, 4606617261199719934UL,
        ),
      )
    "xkcd:turquoise" =>
      Some(
        line_color_named_components(
          4582439112611993624UL, 4605027755448883288UL, 4604250663748474262UL,
        ),
      )
    "xkcd:dark green" =>
      Some(
        line_color_named_components(
          4577935512984623128UL, 4596656358494476955UL, 0UL,
        ),
      )
    "xkcd:violet" =>
      Some(
        line_color_named_components(
          4603614861448139603UL, 4588073027439959068UL, 4606440649449626973UL,
        ),
      )
    "xkcd:light purple" =>
      Some(
        line_color_named_components(
          4604921788398827512UL, 4602078339222330846UL, 4606864517649850079UL,
        ),
      )
    "xkcd:lime green" =>
      Some(
        line_color_named_components(
          4603014381497823537UL, 4607147096449998816UL, 4581308797411398676UL,
        ),
      )
    "xkcd:grey" | "xkcd:gray" =>
      Some(
        line_color_named_components(
          4603332282647990866UL, 4603438249698046643UL, 4603296960297972274UL,
        ),
      )
    "xkcd:sky blue" =>
      Some(
        line_color_named_components(
          4601937049822256477UL, 4604780498998753143UL, 4607111774099980224UL,
        ),
      )
    "xkcd:yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4590315996666139668UL,
        ),
      )
    "xkcd:magenta" =>
      Some(
        line_color_named_components(
          4605027755448883288UL, 0UL, 4602148983922368030UL,
        ),
      )
    "xkcd:light green" =>
      Some(
        line_color_named_components(
          4603473572048065235UL, 4606970484699905855UL, 4602360918022479583UL,
        ),
      )
    "xkcd:orange" =>
      Some(
        line_color_named_components(
          4606970484699905855UL, 4601795760422182109UL, 4582439112611993624UL,
        ),
      )
    "xkcd:teal" =>
      Some(
        line_color_named_components(
          4575674882583433232UL, 4603367604998009458UL, 4602908414447767761UL,
        ),
      )
    "xkcd:light blue" =>
      Some(
        line_color_named_components(
          4603438249698046643UL, 4605522268349143578UL, 4607076451749961632UL,
        ),
      )
    "xkcd:red" =>
      Some(line_color_named_components(4606264037699534013UL, 0UL, 0UL))
    "xkcd:brown" =>
      Some(
        line_color_named_components(
          4600806734621661529UL, 4596938937294625692UL, 0UL,
        ),
      )
    "xkcd:pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4602731802697674800UL, 4604957110748846104UL,
        ),
      )
    "xkcd:blue" =>
      Some(
        line_color_named_components(
          4577935512984623128UL, 4598404814820397265UL, 4606052103599422460UL,
        ),
      )
    "xkcd:green" =>
      Some(
        line_color_named_components(
          4590598575466288405UL, 4604391953148548630UL, 4592011469467032090UL,
        ),
      )
    "xkcd:purple" =>
      Some(
        line_color_named_components(
          4602572852122591136UL, 4593141784667627038UL, 4603685506148176788UL,
        ),
      )
    "aliceblue" =>
      Some(
        line_color_named_components(
          4606652583549738526UL, 4606935162349887263UL, 4607182418800017408UL,
        ),
      )
    "antiquewhite" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4606475971799645565UL, 4605769524799273723UL,
        ),
      )
    "aquamarine" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4607182418800017408UL, 4605663557749217947UL,
        ),
      )
    "azure" =>
      Some(
        line_color_named_components(
          4606652583549738526UL, 4607182418800017408UL, 4607182418800017408UL,
        ),
      )
    "beige" =>
      Some(
        line_color_named_components(
          4606829195299831487UL, 4606829195299831487UL, 4605946136549366684UL,
        ),
      )
    "bisque" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606228715349515421UL, 4605098400148920473UL,
        ),
      )
    "blanchedalmond" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606475971799645565UL, 4605416301299087802UL,
        ),
      )
    "blue" | "b" =>
      Some(line_color_named_components(0UL, 0UL, 4607182418800017408UL))
    "blueviolet" =>
      Some(
        line_color_named_components(
          4603049703847842129UL, 4595243464493733270UL, 4606158070649478236UL,
        ),
      )
    "brown" =>
      Some(
        line_color_named_components(
          4604003407298344117UL, 4595102175093658901UL, 4595102175093658901UL,
        ),
      )
    "burlywood" =>
      Some(
        line_color_named_components(
          4606016781249403868UL, 4604674531948697367UL, 4602943736797786353UL,
        ),
      )
    "cadetblue" =>
      Some(
        line_color_named_components(
          4600382866421438424UL, 4603756150848213972UL, 4603826795548251156UL,
        ),
      )
    "chartreuse" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4607182418800017408UL, 0UL,
        ),
      )
    "chocolate" =>
      Some(
        line_color_named_components(
          4605592913049180762UL, 4601089313421810266UL, 4593141784667627038UL,
        ),
      )
    "coral" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4602643496822628320UL, 4599323195920880660UL,
        ),
      )
    "cornflowerblue" =>
      Some(
        line_color_named_components(
          4600736089921624345UL, 4603438249698046643UL, 4606546616499682750UL,
        ),
      )
    "cornsilk" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606935162349887263UL, 4605946136549366684UL,
        ),
      )
    "crimson" =>
      Some(
        line_color_named_components(
          4605946136549366684UL, 4590315996666139668UL, 4597645384294997534UL,
        ),
      )
    "darkblue" =>
      Some(line_color_named_components(0UL, 0UL, 4603085026197860721UL))
    "darkcyan" =>
      Some(
        line_color_named_components(
          0UL, 4603085026197860721UL, 4603085026197860721UL,
        ),
      )
    "darkgoldenrod" =>
      Some(
        line_color_named_components(
          4604674531948697367UL, 4602908414447767761UL, 4586377554639066646UL,
        ),
      )
    "darkgray" | "darkgrey" =>
      Some(
        line_color_named_components(
          4604144696698418485UL, 4604144696698418485UL, 4604144696698418485UL,
        ),
      )
    "darkgreen" =>
      Some(line_color_named_components(0UL, 4600736089921624345UL, 0UL))
    "darkkhaki" =>
      Some(
        line_color_named_components(
          4604851143698790328UL, 4604639209598678775UL, 4601230602821884635UL,
        ),
      )
    "darkmagenta" =>
      Some(
        line_color_named_components(
          4603085026197860721UL, 0UL, 4603085026197860721UL,
        ),
      )
    "darkolivegreen" =>
      Some(
        line_color_named_components(
          4599676419421066581UL, 4601230602821884635UL, 4595808622094030744UL,
        ),
      )
    "darkorange" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4603120348547879314UL, 0UL,
        ),
      )
    "darkorchid" =>
      Some(
        line_color_named_components(
          4603579539098121011UL, 4596232490294253849UL, 4605380978949069210UL,
        ),
      )
    "darkred" =>
      Some(line_color_named_components(4603085026197860721UL, 0UL, 0UL))
    "darksalmon" =>
      Some(
        line_color_named_components(
          4606405327099608381UL, 4603473572048065235UL, 4602290273322442399UL,
        ),
      )
    "darkseagreen" =>
      Some(
        line_color_named_components(
          4603226315597935090UL, 4604815821348771736UL, 4603226315597935090UL,
        ),
      )
    "darkslateblue" =>
      Some(
        line_color_named_components(
          4598758038320583186UL, 4597786673695071903UL, 4603085026197860721UL,
        ),
      )
    "darkslategray" | "darkslategrey" =>
      Some(
        line_color_named_components(
          4595808622094030744UL, 4599252551220843476UL, 4599252551220843476UL,
        ),
      )
    "darkturquoise" =>
      Some(
        line_color_named_components(
          0UL, 4605451623649106394UL, 4605557590699162170UL,
        ),
      )
    "darkviolet" =>
      Some(
        line_color_named_components(
          4603402927348028051UL, 0UL, 4605628235399199354UL,
        ),
      )
    "deeppink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4590315996666139668UL, 4603367604998009458UL,
        ),
      )
    "deepskyblue" =>
      Some(
        line_color_named_components(
          0UL, 4604921788398827512UL, 4607182418800017408UL,
        ),
      )
    "dimgray" | "dimgrey" =>
      Some(
        line_color_named_components(
          4601089313421810266UL, 4601089313421810266UL, 4601089313421810266UL,
        ),
      )
    "dodgerblue" =>
      Some(
        line_color_named_components(
          4593141784667627038UL, 4603261637947953682UL, 4607182418800017408UL,
        ),
      )
    "firebrick" =>
      Some(
        line_color_named_components(
          4604462597848585814UL, 4593971859893063953UL, 4593971859893063953UL,
        ),
      )
    "floralwhite" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607005807049924447UL, 4606652583549738526UL,
        ),
      )
    "forestgreen" =>
      Some(
        line_color_named_components(
          4593971859893063953UL, 4603085026197860721UL, 4593971859893063953UL,
        ),
      )
    "fuchsia" | "magenta" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 0UL, 4607182418800017408UL,
        ),
      )
    "gainsboro" =>
      Some(
        line_color_named_components(
          4605946136549366684UL, 4605946136549366684UL, 4605946136549366684UL,
        ),
      )
    "ghostwhite" =>
      Some(
        line_color_named_components(
          4606935162349887263UL, 4606935162349887263UL, 4607182418800017408UL,
        ),
      )
    "gold" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4605769524799273723UL, 0UL,
        ),
      )
    "goldenrod" =>
      Some(
        line_color_named_components(
          4605875491849329499UL, 4604003407298344117UL, 4593689281092915216UL,
        ),
      )
    "gray" | "grey" =>
      Some(
        line_color_named_components(
          4602696480347656208UL, 4602696480347656208UL, 4602696480347656208UL,
        ),
      )
    "green" =>
      Some(line_color_named_components(0UL, 4602696480347656208UL, 0UL))
    "greenyellow" =>
      Some(
        line_color_named_components(
          4604285986098492854UL, 4607182418800017408UL, 4595808622094030744UL,
        ),
      )
    "honeydew" =>
      Some(
        line_color_named_components(
          4606652583549738526UL, 4607182418800017408UL, 4606652583549738526UL,
        ),
      )
    "hotpink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4601089313421810266UL, 4604533242548622999UL,
        ),
      )
    "indianred" =>
      Some(
        line_color_named_components(
          4605416301299087802UL, 4600170932321326871UL, 4600170932321326871UL,
        ),
      )
    "indigo" =>
      Some(
        line_color_named_components(
          4598969972420694739UL, 0UL, 4602767125047693392UL,
        ),
      )
    "ivory" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4606652583549738526UL,
        ),
      )
    "khaki" =>
      Some(
        line_color_named_components(
          4606652583549738526UL, 4606299360049552605UL, 4603120348547879314UL,
        ),
      )
    "lavender" =>
      Some(
        line_color_named_components(
          4606299360049552605UL, 4606299360049552605UL, 4607005807049924447UL,
        ),
      )
    "lavenderblush" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606652583549738526UL, 4606829195299831487UL,
        ),
      )
    "lawngreen" =>
      Some(
        line_color_named_components(
          4602431562722516767UL, 4607076451749961632UL, 0UL,
        ),
      )
    "lemonchiffon" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607005807049924447UL, 4605416301299087802UL,
        ),
      )
    "lightblue" =>
      Some(
        line_color_named_components(
          4604285986098492854UL, 4605804847149292315UL, 4606299360049552605UL,
        ),
      )
    "lightcoral" =>
      Some(
        line_color_named_components(
          4606652583549738526UL, 4602696480347656208UL, 4602696480347656208UL,
        ),
      )
    "lightcyan" =>
      Some(
        line_color_named_components(
          4606087425949441052UL, 4607182418800017408UL, 4607182418800017408UL,
        ),
      )
    "lightgoldenrodyellow" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4607005807049924447UL, 4605592913049180762UL,
        ),
      )
    "lightgray" | "lightgrey" =>
      Some(
        line_color_named_components(
          4605628235399199354UL, 4605628235399199354UL, 4605628235399199354UL,
        ),
      )
    "lightgreen" =>
      Some(
        line_color_named_components(
          4603261637947953682UL, 4606581938849701342UL, 4603261637947953682UL,
        ),
      )
    "lightpink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604603887248660183UL, 4604992433098864696UL,
        ),
      )
    "lightsalmon" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4603826795548251156UL, 4602290273322442399UL,
        ),
      )
    "lightseagreen" =>
      Some(
        line_color_named_components(
          4593689281092915216UL, 4604462597848585814UL, 4604180019048437077UL,
        ),
      )
    "lightskyblue" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4605451623649106394UL, 4607005807049924447UL,
        ),
      )
    "lightslategray" | "lightslategrey" =>
      Some(
        line_color_named_components(
          4602078339222330846UL, 4602979059147804945UL, 4603579539098121011UL,
        ),
      )
    "lightsteelblue" =>
      Some(
        line_color_named_components(
          4604391953148548630UL, 4605098400148920473UL, 4606016781249403868UL,
        ),
      )
    "lightyellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 4606087425949441052UL,
        ),
      )
    "lime" => Some(line_color_named_components(0UL, 4607182418800017408UL, 0UL))
    "limegreen" =>
      Some(
        line_color_named_components(
          4596232490294253849UL, 4605416301299087802UL, 4596232490294253849UL,
        ),
      )
    "linen" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4606652583549738526UL, 4606299360049552605UL,
        ),
      )
    "maroon" =>
      Some(line_color_named_components(4602696480347656208UL, 0UL, 0UL))
    "mediumaquamarine" =>
      Some(
        line_color_named_components(
          4600877379321698714UL, 4605416301299087802UL, 4604180019048437077UL,
        ),
      )
    "mediumblue" =>
      Some(line_color_named_components(0UL, 0UL, 4605416301299087802UL))
    "mediumorchid" =>
      Some(
        line_color_named_components(
          4604745176648734551UL, 4599676419421066581UL, 4605628235399199354UL,
        ),
      )
    "mediumpurple" =>
      Some(
        line_color_named_components(
          4603367604998009458UL, 4601583826322070556UL, 4605910814199348091UL,
        ),
      )
    "mediumseagreen" =>
      Some(
        line_color_named_components(
          4597645384294997534UL, 4604497920198604406UL, 4601654471022107740UL,
        ),
      )
    "mediumslateblue" =>
      Some(
        line_color_named_components(
          4602360918022479583UL, 4601018668721773082UL, 4606581938849701342UL,
        ),
      )
    "mediumspringgreen" =>
      Some(
        line_color_named_components(
          0UL, 4607005807049924447UL, 4603614861448139603UL,
        ),
      )
    "mediumturquoise" =>
      Some(
        line_color_named_components(
          4598758038320583186UL, 4605557590699162170UL, 4605380978949069210UL,
        ),
      )
    "mediumvioletred" =>
      Some(
        line_color_named_components(
          4605204367198976249UL, 4590598575466288405UL, 4602873092097749169UL,
        ),
      )
    "midnightblue" =>
      Some(
        line_color_named_components(
          4591728890666883353UL, 4591728890666883353UL, 4601583826322070556UL,
        ),
      )
    "mintcream" =>
      Some(
        line_color_named_components(
          4606829195299831487UL, 4607182418800017408UL, 4607005807049924447UL,
        ),
      )
    "mistyrose" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606228715349515421UL, 4606122748299459644UL,
        ),
      )
    "moccasin" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606228715349515421UL, 4604568564898641591UL,
        ),
      )
    "navajowhite" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606016781249403868UL, 4604285986098492854UL,
        ),
      )
    "navy" => Some(line_color_named_components(0UL, 0UL, 4602696480347656208UL))
    "oldlace" =>
      Some(
        line_color_named_components(
          4607111774099980224UL, 4606829195299831487UL, 4606299360049552605UL,
        ),
      )
    "olive" =>
      Some(
        line_color_named_components(
          4602696480347656208UL, 4602696480347656208UL, 0UL,
        ),
      )
    "olivedrab" =>
      Some(
        line_color_named_components(
          4601230602821884635UL, 4603190993247916498UL, 4594113149293138322UL,
        ),
      )
    "orange" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604003407298344117UL, 0UL,
        ),
      )
    "orangered" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4598546104220471633UL, 0UL,
        ),
      )
    "orchid" =>
      Some(
        line_color_named_components(
          4605875491849329499UL, 4601583826322070556UL, 4605734202449255131UL,
        ),
      )
    "palegoldenrod" =>
      Some(
        line_color_named_components(
          4606581938849701342UL, 4606370004749589789UL, 4604180019048437077UL,
        ),
      )
    "palegreen" =>
      Some(
        line_color_named_components(
          4603544216748102419UL, 4607041129399943039UL, 4603544216748102419UL,
        ),
      )
    "paleturquoise" =>
      Some(
        line_color_named_components(
          4604356630798530038UL, 4606581938849701342UL, 4606581938849701342UL,
        ),
      )
    "palevioletred" =>
      Some(
        line_color_named_components(
          4605910814199348091UL, 4601583826322070556UL, 4603367604998009458UL,
        ),
      )
    "papayawhip" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606617261199719934UL, 4605698880099236539UL,
        ),
      )
    "peachpuff" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4605875491849329499UL, 4604709854298715959UL,
        ),
      )
    "peru" =>
      Some(
        line_color_named_components(
          4605416301299087802UL, 4602873092097749169UL, 4598069252495220640UL,
        ),
      )
    "pink" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4604957110748846104UL, 4605345656599050617UL,
        ),
      )
    "plum" =>
      Some(
        line_color_named_components(
          4605981458899385276UL, 4603826795548251156UL, 4605981458899385276UL,
        ),
      )
    "powderblue" =>
      Some(
        line_color_named_components(
          4604391953148548630UL, 4606087425949441052UL, 4606299360049552605UL,
        ),
      )
    "purple" =>
      Some(
        line_color_named_components(
          4602696480347656208UL, 0UL, 4602696480347656208UL,
        ),
      )
    "rebeccapurple" =>
      Some(
        line_color_named_components(
          4600877379321698714UL, 4596373779694328218UL, 4603579539098121011UL,
        ),
      )
    "red" | "r" =>
      Some(line_color_named_components(4607182418800017408UL, 0UL, 0UL))
    "rosybrown" =>
      Some(
        line_color_named_components(
          4604815821348771736UL, 4603226315597935090UL, 4603226315597935090UL,
        ),
      )
    "royalblue" =>
      Some(
        line_color_named_components(
          4598263525420322896UL, 4601089313421810266UL, 4606122748299459644UL,
        ),
      )
    "saddlebrown" =>
      Some(
        line_color_named_components(
          4603085026197860721UL, 4598546104220471633UL, 4590033417865990931UL,
        ),
      )
    "salmon" =>
      Some(
        line_color_named_components(
          4607005807049924447UL, 4602696480347656208UL, 4601725115722144925UL,
        ),
      )
    "sandybrown" =>
      Some(
        line_color_named_components(
          4606793872949812895UL, 4603968084948325525UL, 4600453511121475608UL,
        ),
      )
    "seagreen" =>
      Some(
        line_color_named_components(
          4595667332693956375UL, 4603085026197860721UL, 4599817708821140950UL,
        ),
      )
    "seashell" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4606829195299831487UL, 4606581938849701342UL,
        ),
      )
    "sienna" =>
      Some(
        line_color_named_components(
          4603826795548251156UL, 4599464485320955029UL, 4595526043293882007UL,
        ),
      )
    "silver" =>
      Some(
        line_color_named_components(
          4604957110748846104UL, 4604957110748846104UL, 4604957110748846104UL,
        ),
      )
    "skyblue" =>
      Some(
        line_color_named_components(
          4602943736797786353UL, 4605451623649106394UL, 4606475971799645565UL,
        ),
      )
    "slateblue" =>
      Some(
        line_color_named_components(
          4601159958121847451UL, 4600029642921252503UL, 4605416301299087802UL,
        ),
      )
    "slategray" | "slategrey" =>
      Some(
        line_color_named_components(
          4601583826322070556UL, 4602696480347656208UL, 4603261637947953682UL,
        ),
      )
    "snow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607005807049924447UL, 4607005807049924447UL,
        ),
      )
    "springgreen" =>
      Some(
        line_color_named_components(
          0UL, 4607182418800017408UL, 4602643496822628320UL,
        ),
      )
    "steelblue" =>
      Some(
        line_color_named_components(
          4598616748920508818UL, 4602767125047693392UL, 4604533242548622999UL,
        ),
      )
    "tan" =>
      Some(
        line_color_named_components(
          4605592913049180762UL, 4604533242548622999UL, 4603120348547879314UL,
        ),
      )
    "teal" =>
      Some(
        line_color_named_components(
          0UL, 4602696480347656208UL, 4602696480347656208UL,
        ),
      )
    "thistle" =>
      Some(
        line_color_named_components(
          4605804847149292315UL, 4604921788398827512UL, 4605804847149292315UL,
        ),
      )
    "tomato" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4600665445221587161UL, 4598687393620546002UL,
        ),
      )
    "turquoise" =>
      Some(
        line_color_named_components(
          4598192880720285712UL, 4606087425949441052UL, 4605522268349143578UL,
        ),
      )
    "violet" =>
      Some(
        line_color_named_components(
          4606581938849701342UL, 4602767125047693392UL, 4606581938849701342UL,
        ),
      )
    "wheat" =>
      Some(
        line_color_named_components(
          4606829195299831487UL, 4606016781249403868UL, 4604497920198604406UL,
        ),
      )
    "whitesmoke" =>
      Some(
        line_color_named_components(
          4606829195299831487UL, 4606829195299831487UL, 4606829195299831487UL,
        ),
      )
    "yellow" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4607182418800017408UL, 0UL,
        ),
      )
    "yellowgreen" =>
      Some(
        line_color_named_components(
          4603614861448139603UL, 4605416301299087802UL, 4596232490294253849UL,
        ),
      )
    "tab:blue" =>
      Some(
        line_color_named_components(
          4593424363467775775UL, 4602078339222330846UL, 4604533242548622999UL,
        ),
      )
    "tab:orange" =>
      Some(
        line_color_named_components(
          4607182418800017408UL, 4602643496822628320UL, 4588073027439959068UL,
        ),
      )
    "tab:green" =>
      Some(
        line_color_named_components(
          4595384753893807638UL, 4603826795548251156UL, 4595384753893807638UL,
        ),
      )
    "tab:red" =>
      Some(
        line_color_named_components(
          4605734202449255131UL, 4594678306893435796UL, 4594819596293510164UL,
        ),
      )
    "tab:purple" =>
      Some(
        line_color_named_components(
          4603402927348028051UL, 4600948024021735898UL, 4604851143698790328UL,
        ),
      )
    "tab:brown" =>
      Some(
        line_color_named_components(
          4603120348547879314UL, 4599747064121103766UL, 4598969972420694739UL,
        ),
      )
    "tab:pink" =>
      Some(
        line_color_named_components(
          4606193392999496828UL, 4602078339222330846UL, 4605027755448883288UL,
        ),
      )
    "tab:gray" | "tab:grey" =>
      Some(
        line_color_named_components(
          4602643496822628320UL, 4602643496822628320UL, 4602643496822628320UL,
        ),
      )
    "tab:olive" =>
      Some(
        line_color_named_components(
          4604815821348771736UL, 4604851143698790328UL, 4593971859893063953UL,
        ),
      )
    "tab:cyan" =>
      Some(
        line_color_named_components(
          4591163733066585879UL, 4604886466048808920UL, 4605486945999124986UL,
        ),
      )
    "g" => Some(line_color_named_components(0UL, 4602678819172646912UL, 0UL))
    "c" =>
      Some(
        line_color_named_components(
          0UL, 4604930618986332160UL, 4604930618986332160UL,
        ),
      )
    "m" =>
      Some(
        line_color_named_components(
          4604930618986332160UL, 0UL, 4604930618986332160UL,
        ),
      )
    "y" =>
      Some(
        line_color_named_components(
          4604930618986332160UL, 4604930618986332160UL, 0UL,
        ),
      )
    _ => None
  }
}
