if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then return end -- classic misses expansion variables
if LE_EXPANSION_LEVEL_CURRENT < LE_EXPANSION_SHADOWLANDS then return end

-- DO NOT EDIT THIS FILE; run dataminer.lua to regenerate.
local core = LibStub("AceAddon-3.0"):GetAddon("SilverDragon")

core:RegisterMobData("Shadowlands", {
	[152500] = {name="Deadsoul Amalgam",locations={[1705]={},},},
	[152508] = {name="Dusky Tremorbeast",locations={[1705]={},},},
	[152517] = {name="Deadsoul Lifetaker",locations={[1705]={},},},
	[152612] = {name="Subjugator Klontzas",locations={[1705]={},},},
	[154330] = {name="Eternas the Tormentor",locations={[1543]={19204600},},loot={{183407,pet=3037,},186212},quest=57509,},
	[155779] = {name="Tomb Burster",locations={[1525]={43007910},},loot={{180584,pet=2891,},179613,179939},quest=56877,tameable=132196,},
	[156134] = {name="Ghastly Charger",locations={[1705]={},},},
	[156142] = {name="Seeker of Souls",locations={[1705]={},},},
	[156158] = {name="Adjutant Felipos",locations={[1705]={},},},
	[156203] = {name="Stygian Incinerator",locations={[1543]={36854480},},loot={186631},quest=62539,},
	[156237] = {name="Imperator Dara",locations={[1705]={},},},
	[156339] = {name="Eliminator Sotiros",locations={[1533]={22452285},},loot={184365},notes="Requires Kyrian to summon",quest=61634,},
	[156340] = {name="Larionrider Orstus",locations={[1533]={22442286},},loot={{184401,pet=3063,covenant=Enum.CovenantType.Kyrian,}},notes="Requires Kyrian to summon",quest=61634,},
	[156676] = {name="Ogre Overseer",locations={[1409]={60406000},},loot={11847,174790},quest=56051,},
	[156916] = {name="Inquisitor Sorin",locations={[1525]={69754720},},loot={180493,184213,184214,184217,180451},},
	[156918] = {name="Inquisitor Otilia",locations={[1525]={64704640},},loot={180493,184213,184214,184217,180451},},
	[156919] = {name="Inquisitor Petre",locations={[1525]={67254340},},loot={180493,184213,184214,184217,180451},},
	[156986] = {name="Ogre Taskmaster",locations={[1409]={57404080},},loot={175240},quest=59611,},
	[157058] = {name="Corpsecutter Moroc",locations={[1536]={26392633},},loot={184176,184177,{183833,covenant=Enum.CovenantType.Necrolord,quest=62570,},{181797,covenant=Enum.CovenantType.Necrolord,quest=61561,}},quest=58335,},
	[157125] = {name="Zargox the Reborn",locations={[1536]={28965138},},loot={184285,{181804,covenant=Enum.CovenantType.Necrolord,},{183690,covenant=Enum.CovenantType.Necrolord,quest=62404,}},quest=59290,},
	[157294] = {name="Pulsing Leech",locations={[1536]={58407420},},loot={184279,182198,182200},quest=61718,},
	[157307] = {name="Gelloh",locations={[1536]={58607400},},loot={182287},quest=61721,},
	[157308] = {name="Corrupted Sediment",locations={[1536]={58607400},},loot={184302},quest=61719,},
	[157309] = {name="Violet Mistake",locations={[1536]={58607400},},loot={{182079,mount=1410,},184301},quest=61720,},
	[157310] = {name="Boneslurp",locations={[1536]={58607400},},loot={184185},quest=61722,},
	[157311] = {name="Burnblister",locations={[1536]={58607400},},loot={184175},quest=61723,},
	[157312] = {name="Oily Invertebrate",locations={[1536]={58607400},},loot={{181270,pet=2960,},{184155,quest=62804,},184300},quest=61724,},
	[157726] = {name="Scorched Scavenger",locations={[1525]={},},hidden=true,},
	[157727] = {name="Scorched Outcast",locations={[1525]={},},hidden=true,},
	[157733] = {name="Crazed Ash Ghoul",locations={[1525]={},},hidden=true,},
	[157833] = {name="Borr-Geth",locations={[1543]={39014119},},loot={{184312,toy=true,},186223},quest=57469,},
	[157964] = {name="Adjutant Dekaris",locations={[1543]={25903115},},loot={186222},quest=57482,},
	[158025] = {name="Darklord Taraxis",locations={[1543]={49128175},},loot={{183901,toy=true,},186611},quest=62282,},
	[158278] = {name="Nascent Devourer",locations={[1543]={45507376},},loot={186236},quest=57573,},
	[158314] = {name="Drifting Sorrow",locations={[1543]={32002120},},loot={186622},quest=59183,},
	[158406] = {name="Scunner",locations={[1536]={62107580},},loot={{181267,pet=2957,},184287,{183833,covenant=Enum.CovenantType.Necrolord,quest=62570,},{181797,covenant=Enum.CovenantType.Necrolord,quest=61561,}},quest=58006,},
	[158659] = {name="Herculon",locations={[1533]={42908265},},loot={{182759,quest=62200,}},quest=57705,},
	[159105] = {name="Collector Kash",locations={[1536]={49002350},},loot={184181,184182,184188,184189,{183833,covenant=Enum.CovenantType.Necrolord,quest=62570,},{181797,covenant=Enum.CovenantType.Necrolord,quest=61561,},{183692,covenant=Enum.CovenantType.Necrolord,quest=62408,}},quest=58005,},
	[159151] = {name="Inquisitor Traian",locations={[1525]={76205210},},loot={180493,184213,184214,184217,180451},},
	[159152] = {name="High Inquisitor Gabi",locations={[1525]={75204420},},loot={180500,184211,184212,184215,184216,180451},},
	[159153] = {name="High Inquisitor Radu",locations={[1525]={71254235},},loot={180499,184211,184212,184215,184216,180451},},
	[159154] = {name="High Inquisitor Magda",locations={[1525]={69755225},},loot={180498,184211,184212,184215,184216,180451},},
	[159155] = {name="High Inquisitor Dacian",locations={[1525]={72105315},},loot={180496,184211,184212,184215,184216,180451},},
	[159156] = {name="Grand Inquisitor Nicu",locations={[1525]={64505275},},loot={177803,184210},},
	[159157] = {name="Grand Inquisitor Aurica",locations={[1525]={69654540},},loot={177803,184210},},
	[159496] = {name="Forgemaster Madalav",locations={[1525]={32651545},},loot={{180939,covenant=Enum.CovenantType.Venthyr,},180489,180709},notes="Requires Venthyr",quest=61618,},
	[159503] = {name="Stonefist",locations={[1525]={31302325},},loot={180488},quest=62220,},
	[159753] = {name="Ravenomous",locations={[1536]={53841877},},loot={{181283,pet=2964,},184184},quest=58004,tameable=236196,},
	[159886] = {name="Sister Chelicerae",locations={[1536]={55502361},},loot={{181172,pet=2948,},184289},quest=58003,tameable=132196,},
	[160059] = {name="Taskmaster Xox",locations={[1536]={50562011},},loot={184186,184192,184187,184193},quest=58091,},
	[160385] = {name="Soulstalker Doina",locations={[1525]={78954975},},loot={180692,180490},note="Follow through portals during the fight",quest=58130,},
	[160392] = {name="Soulstalker Doina",locations={[1525]={65005640},},loot={180692,180490},quest=58130,hidden=true,},
	[160393] = {name="Soulstalker Doina",locations={[1525]={48604800},},loot={180692,180490},quest=58130,hidden=true,},
	[160448] = {name="Hunter Vivianna",locations={[1565]={67455145},},loot={179593,179594,179596,{183091,quest=62246,}},quest=59221,},
	[160629] = {name="Baedos",locations={[1533]={51354080},},loot={172232},quest=58648,},
	[160640] = {name="Innervus",locations={[1525]={21803590},},loot={183735,{183760,covenant=Enum.CovenantType.Necrolord,quest=62476,},180685,180686},quest=58210,},
	[160675] = {name="Scrivener Lenua",locations={[1525]={38316914},},loot={{180587,pet=2893,},180693,180694},quest=58213,},
	[160721] = {name="Fallen Acolyte Erisne",locations={[1533]={60007340},},loot={180444},notes="Available after the area quests are done",quest=58222,},
	[160770] = {name="Darithis the Bleak",locations={[1543]={60964805},},loot={186220},quest=62281,},
	[160821] = {name="Worldedge Gorger",locations={[1525]={38607200},},loot={180583,{182589,mount=1391,}},notes="Starts a quest in the Endmire for the mount",quest=58259,},
	[160857] = {name="Sire Ladinas",locations={[1525]={34045555},},loot={{180873,toy=true,}},quest=58263,},
	[160882] = {name="Nikara Blackheart",locations={[1533]={51406800},},loot={183608},notes="Needs three players to summon",quest=58319,vignette=4007,},
	[160985] = {name="Selena the Reborn",locations={[1533]={61305090},},loot={183608},notes="Needs three players to summon",quest=58320,vignette=4571,},
	[161105] = {name="Indomitable Schmitd",locations={[1536]={38804335},},loot={182192,{174070,covenant=Enum.CovenantType.Necrolord,quest=58411,}},quest=58332,},
	[161310] = {name="Executioner Adrastia",locations={[1525]={43055185},},loot={180502,182967},quest=58441,},
	[161527] = {name="Sigilback",locations={[1533]={55208040},},loot={179486},quest=60570,tameable=132199,vignette=4032,},
	[161528] = {name="Aethon",locations={[1533]={55208020},},loot={179487},quest=58526,tameable=2143073,vignette=4032,},
	[161529] = {name="Nemaeus",locations={[1533]={55008020},},loot={179485},quest=60569,tameable=929300,vignette=4032,},
	[161530] = {name="Cloudtail",locations={[1533]={55208040},},loot={179488},quest=60571,tameable=458223,vignette=4032,},
	[161857] = {name="Nirvaska the Summoner",locations={[1536]={50356330},},loot={183700,{181811,covenant=Enum.CovenantType.Necrolord,}},notes="Only when the {quest:58490} world quest is up",quest=58629,},
	[161891] = {name="Lord Mortegore",locations={[1525]={76006160},},loot={180501,182968},quest=58633,},
	[162180] = {name="Thread Mistress Leeda",locations={[1536]={24204295},},loot={184180},quest=58678,},
	[162452] = {name="Dartanos",locations={[1543]={25851480},},loot={186619},quest=59230,},
	[162481] = {name="Sinstone Hoarder",locations={[1525]={67453050},},loot={183732},quest=62252,vignette=4061,},
	[162528] = {name="Smorgas the Feaster",locations={[1536]={42465345},},loot={{181265,pet=2955,},{181266,pet=2956,},184299,{184038,covenant=Enum.CovenantType.Necrolord,quest=62760,}},quest=58768,},
	[162586] = {name="Tahonta",locations={[1536]={44215132},},loot={{182075,mount=1366,covenant=Enum.CovenantType.Necrolord,},182190},quest=58783,tameable=616693,},
	[162588] = {name="Gristlebeak",locations={[1536]={57805155},},loot={182196},quest=58837,tameable=236190,},
	[162669] = {name="Devour'us",locations={[1536]={45052842},},loot={184178},quest=58835,},
	[162690] = {name="Nerissa Heartless",locations={[1536]={66023532},},loot={{182084,mount=1373,},184179,{174076,covenant=Enum.CovenantType.Necrolord,quest=58376,}},quest=58851,},
	[162711] = {name="Deadly Dapperling",locations={[1536]={76835707},},loot={{181263,pet=2953,},184280,{184224,covenant=Enum.CovenantType.Necrolord,quest=62824,}},quest=58868,},
	[162727] = {name="Bubbleblood",locations={[1536]={52653540},},loot={{184476,toy=true,},184290,184154},quest=58870,},
	[162741] = {name="Gieger",locations={[1536]={31603540},},loot={{182080,mount=1411,covenant=Enum.CovenantType.Necrolord,},184298,{183754,covenant=Enum.CovenantType.Necrolord,quest=62470,}},quest=58872,vignette=4478,},
	[162767] = {name="Pesticide",locations={[1536]={53706130},},loot={182205},quest=58875,tameable=133570,},
	[162797] = {name="Deepscar",locations={[1536]={46734550},},loot={182191},quest=58878,},
	[162819] = {name="Warbringer Mal'Korak",locations={[1536]={33718016},},loot={{182085,mount=1372,},184288},quest=58889,},
	[162829] = {name="Razkazzar",locations={[1543]={26153745},},loot={186628},quest=60992,},
	[162844] = {name="Dath Rezara",locations={[1543]={19205740},},loot={{183066,quest=63160,},{183067,quest=63161,},{183068,quest=63162,},186620},quest=61140,},
	[162845] = {name="Orrholyn",locations={[1543]={25354875},},loot={186626},quest=60991,},
	[162849] = {name="Morguliax",locations={[1543]={16945102},},loot={{184292,toy=true,},185892},quest=60987,},
	[162965] = {name="Huwerath",locations={[1543]={20802970},},loot={186623},quest=58918,},
	[163229] = {name="Dustbrawl",locations={[1565]={48407580},},loot={181395},quest=58987,},
	[163370] = {name="Gormbore",locations={[1565]={53807580},},loot={{183196,pet=3035,}},quest=59006,tameable=2011146,},
	[163460] = {name="Dionae",locations={[1533]={41354885},},loot={{180856,pet=2932,}},quest=62650,},
	[164064] = {name="Obolos",locations={[1543]={48801830},},loot={186238},quest=60667,},
	[164093] = {name="Macabre",locations={[1565]={36504790,32704477,58702920},},loot={{180644,pet=2907,}},quest=59140,vignette=4113,},
	[164107] = {name="Gormtamer Tizo",locations={[1565]={27885248},},loot={{180725,mount=1362,}},notes="Kill {npc:166736} until it spawns",quest=59145,},
	[164112] = {name="Humon'gozz",locations={[1565]={31803040},},loot={{182650,mount=1415,}},quest=59157,},
	[164147] = {name="Wrigglemortis",locations={[1565]={58306180},},loot={181396},quest=59170,vignette=4115,},
	[164238] = {name="Deifir the Untamed",locations={[1565]={46202180,47002740},},loot={{180631,pet=2920,}},notes="So tame him",quest=59201,tameable=2011146,},
	[164388] = {name="Amalgamation of Light",locations={[1525]={25304850},},loot={{180586,pet=2892,},179924,180688,179653,179925,179926},quest=59584,},
	[164391] = {name="Old Ardeite",locations={[1565]={51005740},},loot={{180643,pet=2908,}},quest=60273,tameable=132200,},
	[164415] = {name="Skuld Vit",locations={[1565]={37675917},},loot={180146,{182183,covenant=Enum.CovenantType.NightFae,quest=62439,}},notes="Be Night Fae",quest=59220,},
	[164477] = {name="Deathbinder Hroth",locations={[1565]={34606800},},loot={180166},quest=59226,},
	[164547] = {name="Mystic Rainbowhorn",locations={[1565]={65502910},},loot={179586,{182179,covenant=Enum.CovenantType.NightFae,quest=62434,}},quest=59235,},
	[165047] = {name="Soulsmith Yol-Mattar",locations={[1543]={36253745},},loot={186630},quest=59441,},
	[165053] = {name="Mymaen",locations={[1565]={62102460},},loot={179502},quest=59431,},
	[165152] = {name="Leeched Soul",locations={[1525]={67978179},},loot={{180585,pet=2897,},183736},quest=59580,},
	[165175] = {name="Prideful Hulk",locations={[1525]={67808200},},loot={{180585,pet=2897,},183736,179938},quest=59580,hidden=true,},
	[165206] = {name="Endlurker",locations={[1525]={66555945},},loot={179927,{183759,covenant=Enum.CovenantType.Necrolord,quest=62474,}},quest=59582,},
	[165253] = {name="Tollkeeper Varaboss",locations={[1525]={66507080},},loot={{179363,quest=60517,}},quest=59595,},
	[165290] = {name="Harika the Horrid",locations={[1525]={45847919},},loot={{180461,mount=1310,covenant=Enum.CovenantType.Venthyr,},183720},notes="Be Venthyr",quest=59612,},
	[166292] = {name="Bog Beast",locations={[1525]={33403240},},loot={{180588,pet=2896,}},quest=59823,},
	[166393] = {name="Amalgamation of Filth",locations={[1525]={53257300},},loot={183729},quest=59854,},
	[166398] = {name="Soulforger Rhovus",locations={[1543]={35954155},},loot={183141,185473,186613},quest=60834,},
	[166521] = {name="Famu the Infinite",locations={[1525]={62484716},},loot={{180582,mount=1379,},183739},quest=59869,},
	[166576] = {name="Azgar",locations={[1525]={35807050},},loot={183731,180690},quest=59893,},
	[166679] = {name="Hopecrusher",locations={[1525]={51985179},},loot={{180581,mount=1298,covenant=Enum.CovenantType.Venthyr,}},quest=59900,tameable=625905,},
	[166710] = {name="Executioner Aatron",locations={[1525]={37104740},},loot={180696,183737},quest=59913,},
	[166726] = {name="Blistering Ash Ghoul",locations={[1525]={},},hidden=true,},
	[166993] = {name="Huntmaster Petrus",locations={[1525]={61707950},},loot={180874,{180705,class="HUNTER",},180405},quest=60022,vignette=4170,},
	[167078] = {name="Wingflayer the Cruel",locations={[1533]={40405340},},loot={182749},notes="Be Kyrian",quest=60314,},
	[167464] = {name="Grand Arcanist Dimitri",locations={[1525]={20485300},},loot={180708,180503},quest=60173,},
	[167721] = {name="The Slumbering Emperor",locations={[1565]={59304660},},loot={175711,{183828,covenant=Enum.CovenantType.Necrolord,quest=62574,}},note="You need detect invisible, or just to AOE into the fog",quest=60290,tameable=236193,vignette=4193,},
	[167724] = {name="Rotbriar Boggart",locations={[1565]={65702430},},loot={175729},quest=60258,vignette=4435,},
	[167726] = {name="Rootwrithe",locations={[1565]={65104430},},loot={179603},quest=60273,vignette=4192,},
	[167851] = {name="Egg-Tender Leh'go",locations={[1565]={58403230},},loot={179539},notes="Destroy eggs, might have to wait a bit",quest=60266,tameable=2011146,vignette=4191,},
	[168135] = {name="Night Mare",locations={[1565]={57874983},},loot={{180728,mount=1306,}},notes="Summoning quest chain",quest=60306,tameable=2143073,},
	[168147] = {name="Sabriel the Bonecleaver",locations={[1536]={50404820},},loot={{181815,mount=1370,covenant=Enum.CovenantType.Necrolord,},184291},quest=58784,},
	[168148] = {name="Drolkrad",locations={[1536]={50204840},},notes="Sabriel's mount",quest=58784,hidden=true,},
	[168647] = {name="Valfir the Unrelenting",locations={[1565]={29605540},},loot={{180730,mount=1393,covenant=Enum.CovenantType.NightFae,},180154,{182176,covenant=Enum.CovenantType.NightFae,quest=62431,}},notes="Be Night Fae",quest=61632,},
	[168693] = {name="Cyrixia",locations={[1543]={28702515},},loot={{183070,quest=63164,},186618},quest=61346,},
	[169102] = {name="Agonix",locations={[1543]={28204450},},loot={186616},quest=61136,},
	[169827] = {name="Ekphoras, Herald of Grief",locations={[1543]={42352110},},loot={182328,184105},quest=60666,vignette=4215,},
	[170048] = {name="Manifestation of Wrath",locations={[1525]={49003500},},loot={{180585,pet=2897,},180715},quest=60729,},
	[170228] = {name="Bone Husk",locations={[1705]={},},},
	[170301] = {name="Apholeias, Herald of Loss",locations={[1543]={19304170},},loot={182327,184106},quest=60788,vignette=4232,},
	[170302] = {name="Talaporas, Herald of Pain",locations={[1543]={28701205},},loot={184107,182326},quest=60789,vignette=4233,},
	[170303] = {name="Exos, Herald of Domination",locations={[1543]={20586935},},loot={184108,{183066,quest=63160,},{183067,quest=63161,},{183068,quest=63162,},186606},quest=62260,},
	[170385] = {name="Writhing Misery",locations={[1705]={},},},
	[170414] = {name="Howling Spectre",locations={[1705]={},},},
	[170417] = {name="Animated Stygia",locations={[1705]={},},},
	[170434] = {name="Amalgamation of Sin",locations={[1525]={65802915},},loot={183730},quest=60836,},
	[170548] = {name="Sundancer",locations={[1533]={60109350},},loot={{180773,mount=1307,}},notes="Use the statue and a Skystrider Glider",quest=60862,tameable=2143073,},
	[170623] = {name="Dark Watcher",locations={[1533]={27803000},},loot={184297},notes="Die to see it",quest=60883,},
	[170634] = {name="Shadeweaver Zeris",locations={[1543]={30706035},},loot={{183066,quest=63160,},{183067,quest=63161,},{183068,quest=63162,},183187,{181794,toy=true,},185945},quest=60884,},
	[170659] = {name="Basilofos, King of the Hill",locations={[1533]={48605080},},loot={180704,182653},quest=60897,tameable=929300,},
	[170692] = {name="Krala",locations={[1543]={30846866},},loot={186624},quest=63381,},
	[170711] = {name="Dolos",locations={[1543]={32946646},},loot={186209},quest=60909,},
	[170731] = {name="Thanassos",locations={[1543]={27407150},},quest=60914,},
	[170774] = {name="Eketra",locations={[1543]={23205300},},loot={186563},quest=60915,},
	[170787] = {name="Akros",locations={[1543]={34007480},},loot={186617},quest=60920,},
	[170832] = {name="Champion of Loyalty",locations={[1533]={53478864},},loot={{183741,mount=1426,}},notes="Ring all five vespers to summon the council",quest=60977,},
	[170833] = {name="Champion of Wisdom",locations={[1533]={53478864},},loot={{183741,mount=1426,}},notes="Ring all five vespers to summon the council",quest=60977,},
	[170834] = {name="Champion of Purity",locations={[1533]={53478864},},loot={{183741,mount=1426,}},notes="Ring all five vespers to summon the council",quest=60977,},
	[170835] = {name="Champion of Courage",locations={[1533]={53478864},},loot={{183741,mount=1426,}},notes="Ring all five vespers to summon the council",quest=60977,},
	[170836] = {name="Champion of Humility",locations={[1533]={53478864},},loot={{183741,mount=1426,}},notes="Ring all five vespers to summon the council",quest=60977,},
	[170932] = {name="Cloudfeather Guardian",locations={[1533]={49805900},},loot={{180812,pet=2925,}},quest=60978,tameable=132200,},
	[171008] = {name="Unstable Memory",locations={[1533]={43502524},},loot={{184413,toy=true,}},quest=60997,},
	[171009] = {name="Enforcer Aegeon",locations={[1533]={50801960},},loot={{184404,toy=true,}},quest=60998,},
	[171010] = {name="Corrupted Clawguard",locations={[1533]={56904778},},loot={182759},quest=60999,vignette=4340,},
	[171011] = {name="Demi the Relic Hoarder",locations={[1533]={36804180},},loot={183608},quest=61069,routes={[1533]={{36804180,37604120,38304030,39604140,40404090,40603920,41203890}},},},
	[171013] = {name="Embodied Hunger",locations={[1533]={52213281,63513600,56031461,47994295,59655142},},loot={183605},notes="Possible spawn from the Swelling Tear",quest=61001,},
	[171014] = {name="Collector Astorestes",locations={[1533]={66004370},},loot={184295},quest=61002,},
	[171040] = {name="Xixin the Ravening",locations={[1533]={52213282,63513601,56031462,47994296,59655143},},loot={183605},notes="Possible spawn from the Swelling Tear",quest=61046,},
	[171041] = {name="Worldfeaster Chronn",locations={[1533]={52213283,63513602,56031463,47994297,59655144},},loot={183605},notes="Possible spawn from the Swelling Tear",quest=61047,},
	[171189] = {name="Bookkeeper Mnemis",locations={[1533]={56096200},},loot={182682},quest=59022,}, -- also 62167?
	[171206] = {name="Playful Vulpin",locations={[1565]={},},loot={{180645,pet=2905,}},notes="Play with this critter 5 times to get a pet. Use emotes related to what they're doing. They spawn anywhere vulpin cubs are found.",quest=61086,},
	[171211] = {name="Aspirant Eolis",locations={[1533]={32602340},},loot={183607},quest=61083,},
	[171255] = {name="Echo of Aella",locations={[1533]={44806460},},loot={180062},quest=61082,routes={[1533]={{45106860,46306760,46406670,47206620,47506510,46906400,46006380,45706460,45606570,46306670},{45706460,44806460,44706600,45406680,45906650}},},},
	[171316] = {name="Malevolent Stygia",locations={[1543]={27301755},},loot={186625},quest=61125,},
	[171317] = {name="Conjured Death",locations={[1543]={27731305},},loot={183887},quest=61106,},
	[171327] = {name="Reekmonger",locations={[1533]={30365517},},notes="Kill enemies in the Temple of Courage to summon",quest=61108,},
	[171451] = {name="Soultwister Cero",locations={[1565]={72405175},},loot={180164},quest=61177,},
	[171688] = {name="Faeflayer",locations={[1565]={68602765},},loot={180144},quest=61184,},
	[172207] = {name="Odalrik",locations={[1543]={38652880},},loot={{183061,quest=63158,},178561},quest=62618,},
	[172521] = {name="Sanngror the Torturer",locations={[1543]={55606320},},loot={{183410,pet=3040,},186629},quest=62210,},
	[172523] = {name="Houndmaster Vasanok",locations={[1543]={60456480},},loot={186224},quest=62209,},
	[172524] = {name="Skittering Broodmother",locations={[1543]={54507930},[1820]={36707940},},loot={186240},notes="In the Pit of Anguish",quest=62211,tameable=644001,},
	[172577] = {name="Orophea",locations={[1543]={23692139},},loot={{181794,toy=true,},186211},quest=61519,},
	[172862] = {name="Yero the Skittish",locations={[1543]={37406200},},loot={186228},quest=61568,},
	[173051] = {name="Suppressor Xelors",locations={[1705]={},},},
	[173080] = {name="Wandering Death",locations={[1705]={},},},
	[173086] = {name="Valis the Cruel",locations={[1543]={40705960},},loot={186632},quest=61728,},
	[173134] = {name="Darksworn Goliath",locations={[1705]={},},},
	[173191] = {name="Soulstalker V'lara",locations={[1705]={},},},
	[173238] = {name="Deadsoul Strider",locations={[1705]={},},},
	[173468] = {name="Dead Blanchy",locations={[1525]={63134311},},loot={{182614,mount=1414,}},notes="7 days of quests",quest=62050,},
	[173499] = {name="Loyal Gorger",locations={[1525]={59305700},},loot={{182589,mount=1391,}},notes="Kill Worldedge Gorger first",quest=62046,},
	[174108] = {name="Necromantic Anomaly",locations={[1536]={72852890},},loot={{181810,covenant=Enum.CovenantType.Necrolord,},184174},quest=62369,},
	[174827] = {name="Gorged Shadehound",locations={[1543]={53507950},},loot={{184167,mount=1304,}},notes="Only during the Hunt: Shadehounds event",},
	[175012] = {name="Ikras the Devourer",locations={[1543]={30775000},},loot={186214},quest=62788,},
	[175821] = {name="Ratgusher",locations={[1543]={22654225},},loot={186627},quest=63044,},
	[177336] = {name="Zelnithop",locations={[1961]={30305480},[2007]={45606830},},loot={{186542,pet=3136,},187371},quest=64442,},
	[177444] = {name="Ylva",locations={[1543]={66404190},},loot={186217,187359,187393,{186970,note="{item:186727}",quest=62683,}},quest=64152,tameable=877481,},
	[177903] = {name="Dominated Protector",locations={[1961]={51802080},},loot={187390},quest=63830,},
	[178229] = {name="Feasting",locations={[1970]={61806060},},loot={187848,189936,189969,189970},quest=65557,},
	[178508] = {name="Mother Phestis",locations={[1970]={54103495},},loot={189923,189950,190045,189769},quest=65547,tameable=132196,},
	[178563] = {name="Hadeon the Stonebreaker",locations={[1970]={52602505},},loot={189919,189942,190000,190051},quest=65581,tameable=133570,},
	[178778] = {name="Gluttonous Overgrowth",locations={[1970]={53109305},},loot={189929,190008,190049,189953},notes="Break nearby {npc:184048}",quest=65579,},
	[178963] = {name="Gorkek",locations={[1970]={80404705},},loot={190001,189926,189960},quest=63988,tameable=804969,vignette=4746,},
	[179006] = {name="Akkaris",locations={[1970]={64753370},},loot={189903,189958,190053,190733},quest=65552,vignette=4747,},
	[179043] = {name="Orixal",locations={[1970]={56406820},},loot={189912,189934,189952},notes="Kill {npc:185487} and it might spawn",quest=65582,tameable=2011146,},
	[179108] = {name="Kroke the Tormented",locations={[1961]={59203580},},loot={187394,187250,187248},quest=64428,},
	[179460] = {name="Fallen Charger",locations={[1543]={16274949,27906290,31803850},},loot={{186659,mount=1502,},186660,186661},notes="Yells, runs from its spawn point to Korthia, then despawns",quest=64164,},
	[179472] = {name="Konthrogz the Obliterator",locations={[1961]={10008000},},loot={{187183,mount=1514,},187375,187378,187384,187397},quest=64246,vignette=4885,},
	[179565] = {name="Relic Gorger",locations={[1961]={},},quest=64433,},
	[179608] = {name="Screaming Shade",locations={[1961]={44604240},},loot={187362,187400},quest=64263,},
	[179684] = {name="Malbog",locations={[1961]={44202920},},loot={{186645,mount=1506,},187377},notes="Talk to {npc:179729} in town, then follow footprints",quest=64233,},
	[179735] = {name="Torglluun",locations={[1543]={27672526},},loot={187360,187389,{187139,toy=true,},186605},notes="In the Rift",quest=64232,},
	[179755] = {name="Consumption",locations={[1961]={},},notes="Starts as a regular mob, eats {npc:179344} until it becomes a rare, and then a rare-elite. Loot gets better as it gets stronger, so wait.",quest=64243,variant="rare",hidden=true,},
	[179760] = {name="Towering Exterminator",locations={[1961]={12008000},},loot={187241,187242,187373,187376,187035,187382,187392},quest=64245,vignette=4886,},
	[179768] = {name="Consumption",locations={[1961]={51154165},},loot={187245,187246,187247,187402},notes="Starts as a regular mob, eats {npc:179344} until it becomes a rare, and then a rare-elite. Loot gets better as it gets stronger, so wait.",quest=64243,variant="rare-elite",},
	[179769] = {name="Consumption",locations={[1961]={},},notes="Starts as a regular mob, eats {npc:179344} until it becomes a rare, and then a rare-elite. Loot gets better as it gets stronger, so wait.",quest=64243,variant="normal",hidden=true,},
	[179779] = {name="Deomen the Vortex",locations={[1543]={61604160},},loot={187367,187385},notes="Unlock cage with levers to the south",quest=64251,},
	[179802] = {name="Yarxhov the Pillager",locations={[1961]={39405240},},loot={{187103,quest=63917,},187366,187391},quest=64257,vignette=4859,},
	[179805] = {name="Traitor Balthier",locations={[1543]={67804740},},loot={187364,187374},quest=64258,},
	[179851] = {name="Guard Orguluus",locations={[1543]={53007280},},loot={187363,187398},notes="In the rift, wanders a bit",quest=64272,},
	[179853] = {name="Blinding Shadow",locations={[1543]={35904370},},loot={187361,187406},notes="In the Rift",quest=64276,},
	[179859] = {name="Xyraxz the Unknowable",locations={[1961]={44903550},},loot={{187104,quest=63918,},187387,187368},quest=64278,vignette=4861,},
	[179911] = {name="Silent Soulstalker",locations={[1961]={57607040},},loot={187381,187383},quest=64284,},
	[179912] = {name="Maelie the Wanderer",locations={[1961]={30005560,33103865,35804650,35856225,38403140,39703490,41103980,41302750,42806040,43203130,49304170,50302290,59801510,61304040,62404970,67962980},},loot={{186643,mount=1511,}},notes="{npc:179930} asks you to find {npc:179912}, who spawns in a different place each day. Find her each day, use {spell:355862} on her, and get a mount from {npc:179930}",quest={64292,64298,any=true,},},
	[179913] = {name="Deadsoul Hatcher",locations={[1961]={59355220},},loot={{187174,toy=true,},187396,187401},quest=64285,},
	[179914] = {name="Observer Yorik",locations={[1961]={50307590},},loot={{187420,toy=true,},187365,187405},quest=64440,},
	[179931] = {name="Relic Breaker Krelva",locations={[1961]={22604140},},loot={187403},quest=64291,vignette=4836,},
	[179974] = {name="Drippy",locations={[1961]={46507951},},notes="Yells about Stygian Stonecrusher",hidden=true,},
	[179985] = {name="Stygian Stonecrusher",locations={[1961]={46507950},},loot={184790,{186479,mount=803,covenant=Enum.CovenantType.Venthyr,},{187283,quest=64530,covenant=Enum.CovenantType.Venthyr,},187386,{187428,quest=64553,}},quest=64313,vignette=4831,},
	[180014] = {name="Escaped Wilderling",locations={[1961]={33103930},},loot={{186492,mount=1487,covenant=Enum.CovenantType.NightFae,}},quest=64320,vignette=4835,},
	[180032] = {name="Wild Worldcracker",locations={[1961]={47003560},},loot={{187176,toy=true,},{186483,mount=1493,covenant=Enum.CovenantType.Kyrian,},187380,{187426,quest=64552,},{187282,quest=64529,covenant=Enum.CovenantType.Kyrian,}},quest=64338,vignette=4838,},
	[180042] = {name="Fleshwing",locations={[1961]={59954370},},loot={187372,{186489,mount=1449,covenant=Enum.CovenantType.Necrolord,},187181,{187424,quest=64551,}},quest=64349,vignette=4854,},
	[180160] = {name="Reliwik the Defiant",locations={[1961]={56256615},},loot={{186652,mount=1509,},187388},quest=64455,vignette=4864,},
	[180162] = {name="Ve'rayn",locations={[1961]={14008000},},loot={{187264,quest=64513,},187369,187404},quest=64457,vignette=4883,},
	[180246] = {name="Carriage Crusher",locations={[1543]={46005640},[1961]={58201775},},loot={187370,187391,187399},quest=64258,vignette=4857,},
	[180746] = {name="Protector of the First Ones",locations={[1970]={38852760},},loot={189984,190002,189961,190390,189176,189177},notes="Two people required to open the barrier",quest=64668,},
	[180917] = {name="Destabilized Core",locations={[1970]={53654435},},loot={187837,189153,189910,189985,189999,189930},quest=64716,},
	[180924] = {name="Garudeon",locations={[1970]={69053660},},loot={187832,189937,189951,190057,190602},notes="Gather {npc:183562} nearby, feed to {npc:183554}",quest=64719,tameable=132192,vignette=4982,},
	[180978] = {name="Hirukon",locations={[1970]={52307540},},loot={189905,189946,190005,187636,{187676,mount=1434},},quest=65548,
		requires=core.conditions.Item(187923),
		notes="You have to make a {item:187923}:\n"..
			"* Fish up {item:187662} nearby\n"..
			"* Fish up {item:187915} from Coilfang Reservoir in Zangarmarsh\n"..
			"* Fish up {item:187922} near Keyla's Grave in Nazjatar\n"..
			"* Find {item:187916} in Nar'shola Terrace in the Shimmering Expanse (34.7, 75.0)\n"..
			"* Ask {npc:182194} south of the Seat of the Primus in Maldraxxus to make your {item:187923}\n"..
			"* Bring it back here, use it, and fish in the Aurelid Cluster you can now see.",
	},
	[181249] = {name="Tethos",locations={[1970]={54507345},},loot={189928,189966,190055,187830,189967,189146},quest=65550,vignette=4903,},
	[181360] = {name="Vexis",locations={[1970]={39555735},},loot={190048,189900,189959,189997,190597},quest=65239,tameable=132203,},
	[182114] = {name="Iska, Outrider of Ruin",locations={[1970]={63202605},},loot={190126,{190765,mount=1584,},190102,190103,190458,190050,190104,190107,190124,190463},quest=65585,vignette=4918,},
	[182155] = {name="High Reaver Damaris",locations={[1970]={63202605},},loot={190459,190460,190105,190106,190050,190104,190107,190124,190463},quest=65586,vignette=4951,},
	[182158] = {name="Reanimatrox Marzan",locations={[1970]={63202605},},loot={190108,190109,190127,190461,190050,190104,190107,190124,190463},quest=65587,vignette=4952,},
	[182318] = {name="General Zarathura",locations={[1970]={59852110},},loot={189968,189948,190125,190731},quest=65583,vignette=4909,},
	[183516] = {name="The Engulfer",locations={[1970]={43957530},},loot={190006,189913,189921},notes="Protect {npc:183505} until this appears",quest=65580,},
	[183596] = {name="Chitali the Eldest",locations={[1970]={49556750},},loot={189906,189947,189994,190729},quest=65553,tameable=1044501,vignette=4948,},
	[183646] = {name="Furidian",locations={[1970]={64605865},},loot={189920,189932,189963,190004},notes="Find 3x Empowered Keys nearby then unlock the Suspiciously Angry Vault",quest=65544,},
	[183722] = {name="Sorranos",locations={[1970]={35857120},},loot={189911,189944,189962,190582,187826},quest=65240,tameable=644001,},
	[183737] = {name="Xy'rath the Covetous",locations={[1970]={64054975},},loot={190052,190007,{190238,toy=true,},187828,189918,189964,190389},quest=65241,vignette=4938,},
	[183746] = {name="Otiosen",locations={[1970]={43308760},},loot={189914,189925,190046,189995,187634},quest=65556,},
	[183747] = {name="Vitiane",locations={[1970]={47054700},},loot={189901,189922,189935},quest=65584,},
	[183748] = {name="Helmix",locations={[1970]={58206835},},loot={189931,189965,190054,190056},quest=65551,},
	[183749] = {name="Helmix",hidden=true},
	[183764] = {name="Zatojin",locations={[1970]={43503295},},loot={189902,189924,189939,190726},notes="Engage the {npc:183721} to get 20 stacks of {spell:362976} and be {spell:362983}. Make sure you're standing on the {npc:183774} corpses.",quest=65251,tameable=236196,},
	[183814] = {name="Otaris the Provoked",locations={[1970]={58654040},},loot={189909,189945,189957},notes="Inside a cave",quest=65257,},
	[183925] = {name="Tahkwitz",locations={[1970]={49803915},},loot={189915,189933,189954,187832,190003},notes="You need a movement ability, or to use the {npc:184384:Locus Shift} to reach the Resonant Peaks",quest=65272,tameable=132192,},
	[183927] = {name="Sand Matriarch Ileus",locations={[1970]={53404705},},loot={189927,189955,189998,190730},quest=65574,tameable=133570,},
	[183953] = {name="Corrupted Architect",locations={[1970]={47506230},},loot={189907,189940,190009,190732},notes="Fight {npc:183958} and {npc:183961} to trigger",quest=65273,vignette=4989,},
	[184409] = {name="Euv'ouk",locations={[1970]={47454515},},loot={189949,190047,189956,189993},quest=65555,vignette=4961,},
	[184413] = {name="Shifting Stargorger",locations={[1970]={42302100},},loot={189908,189916,189941,{189972,covenant=Enum.CovenantType.NightFae,quest=65505,}},quest=65549,},
	[184804] = {name="Helmix",hidden=true},
}, true)
core:RegisterTreasureData("Shadowlands", {
	[4925] = {name="Template Archive",loot={{190060,quest=65527}},},
	[4928] = {name="Provis Cache",loot={{189710,quest=65474}},requires=core.conditions.Item(188231),},
	[4929] = {name="Prying Eye Discovery",loot={{190096,quest=65534},{189711,quest=65476}},requires={core.conditions.Item(188170),core.conditions.Achievement(15514),any=true},},
	[4968] = {name="Domination Cache",loot={190638,189863},requires=core.conditions.Item(189704),},
	[4969] = {name="Mawsworn Supply Chest",loot={{190766,mount=1585}},},
	[4974] = {name="Discarded Automa Scrap",loot={{189717,quest=65483},{189718,quest=65484}},},
	[4978] = {name="Pulp-Covered Relic",loot={{189474,quest=65397}},},
	[4980] = {name="Architect's Reserve",loot={{187833,quest=65528}},requires={core.conditions.GarrisonTalent(1931), core.conditions.QuestComplete(65427)},},
	[4981] = {name="Mistaken Ovoid",loot={{189435,quest=65333}},requires=core.conditions.Item(190239,5),},
	[4992] = {name="Protomineral Extractor",loot={190942},requires=core.conditions.QuestComplete(64889),},
	[4993] = {name="Pilfered Curio",loot={{190098,quest=65538}},requires=core.conditions.Achievement(15514),},
	[4997] = {name="Forgotten Treasure Vault",requires=core.conditions.Achievement(15514),},
	[4999] = {name="Protopear",loot={{190058,quest=65525}},requires=core.conditions.GarrisonTalent(1931),},
	[5019] = {name="Torn Ethereal Drape",loot={188054},requires={core.conditions.GarrisonTalent(1902),core.conditions.QuestComplete(65328)},},
	[5021] = {name="Drowned Broker Supplies",loot={{190059,quest=65526}},requires=core.conditions.GarrisonTalent(1932),},
}, true)
