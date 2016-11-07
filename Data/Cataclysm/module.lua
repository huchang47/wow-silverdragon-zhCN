-- DO NOT EDIT THIS FILE; run dataminer.lua to regenerate.
local core = LibStub("AceAddon-3.0"):GetAddon("SilverDragon")
local module = core:NewModule("Data_Cataclysm")

function module:OnInitialize()
	core:RegisterMobData("Cataclysm", {
		[39183] = {name="Scorpitar",locations={[161]={49405840,49605840},},tameable=true,},
		[39185] = {name="Slaverjaw",locations={[161]={40006780,40006760},},tameable=true,},
		[39186] = {name="Hellgazer",locations={[161]={40804120,40804100},},tameable=true,},
		[43488] = {name="Mordei the Earthrender",locations={[121]={49403000,49003080},},},
		[43613] = {name="Doomsayer Wiserunner",locations={[9]={33803700,33803700},},},
		[43720] = {name="\"Pokey\" Thornmantle",locations={[890]={21207120,21007080},},},
		[44224] = {name="Two-Toes",locations={[40]={13403820,12804200},},},
		[44225] = {name="Rufus Darkshot",locations={[40]={42603220,42603220},},},
		[44226] = {name="Sarltooth",locations={[40]={32405080,32005080},},},
		[44227] = {name="Gazz the Loch-Hunter",locations={[40]={61405740,61405720},},},
		[44714] = {name="Fronkle the Disturbed",locations={[161]={57008980,56809000},},},
		[44722] = {name="Twisted Reflection of Narain",locations={[161]={64402000,64601980},},},
		[44750] = {name="Caliph Scorpidsting",locations={[161]={47006520,47006500},},},
		[44759] = {name="Andre Firebeard",locations={[161]={69405700,69405700},},},
		[44761] = {name="Aquementas the Unchained",locations={[161]={69405000,69604980},},},
		[44767] = {name="Occulus the Corrupted",locations={[161]={61005040,61005040},},},
		[45257] = {name="Mordak Nightbender",locations={[19]={60402920,60202940},},},
		[45258] = {name="Cassia the Slitherqueen",locations={[19]={60407540,60407540},},},
		[45260] = {name="Blackleaf",locations={[19]={31006980,30807000},},},
		[45262] = {name="Narixxus the Doombringer",locations={[19]={32004460,32004460},},},
		[45369] = {name="Morick Darkbrew",locations={[35]={37406220,37206200},},},
		[45380] = {name="Ashtail",locations={[35]={67003920,72203660,73004340,67004060,72204180,72803600},},tameable=true,},
		[45384] = {name="Sagepaw",locations={[35]={25404320,25404320},},},
		[45398] = {name="Grizlak",locations={[35]={35401540,35201540},},},
		[45399] = {name="Optimo",locations={[35]={71207640,76408180,71207640,76408200},},tameable=true,},
		[45401] = {name="Whitefin",locations={[35]={42604280,43604840,45003740,45405460,42404820,42804280,44203740,46005540},},},
		[45402] = {name="Nix",locations={[35]={51403700,54404220,56803460,51403720,56603840,56804400},},tameable=true,},
		[45404] = {name="Geoshaper Maren",locations={[35]={50002400,49802420},},},
		[45739] = {name="The Unknown Soldier",locations={[34]={90603040,90203060},},},
		[45740] = {name="Watcher Eva",locations={[34]={79807020,80806320,79007220,80005800,80606540},},},
		[45771] = {name="Marus",locations={[34]={61007440,62608240,64206800,58007860,62007120,63408340},},},
		[45785] = {name="Carved One",locations={[34]={47807220,47207240},},},
		[45801] = {name="Eliza",locations={[34]={27603140,26403020},},},
		[45811] = {name="Marina DeSirrus",locations={[34]={7403340,6803460},},},
		[46981] = {name="Nightlash",locations={[21]={52802600,51802560},},},
		[46992] = {name="Berard the Moon-Crazed",locations={[21]={43205080,43005080},},},
		[47003] = {name="Bolgaff",locations={[21]={48402420,48402420},},},
		[47008] = {name="Fenwick Thatros",locations={[21]={59403340,59403360},},},
		[47009] = {name="Aquarius the Unbound",locations={[21]={57406280,62006800,57006360,61806880},},},
		[47010] = {name="Indigos",locations={[24]={31604000,31603980},},},
		[47012] = {name="Effritus",locations={[21]={46806980,46806980},},},
		[47015] = {name="Lost Son of Arugal",locations={[21]={45802940,47802220,49603480,53001920,54205440,54404880,54606480,54802480,55003840,55007000,55405960,55407500,55408040,56403080,46002820,47802260,48403380,52801920,54404800,54804200,55007000,55406340,55803320,55807540},},},
		[47023] = {name="Thule Ravenclaw",locations={[21]={50206020,50005980},},},
		[47386] = {name="Ainamiss the Hive Queen",locations={[161]={33004900,36404240,32804860,36404240},},tameable=true,},
		[47387] = {name="Harakiss the Infestor",locations={[161]={50407240,52406580,50407240,52206500},},tameable=true,},
		[49822] = {name="Jadefang",locations={[640]={61202240,61202260},},tameable=true,},
		[49913] = {name="Lady La-La",locations={[610]={56207780,60207080,56807680,57008220,59407080},},},
		[50005] = {name="Poseidus",locations={[614]={41407440},[615]={46204880},},},
		[50009] = {name="Mobus",locations={[614]={73201920},},},
		[50050] = {name="Shok'sharak",locations={[614]={41803240,48002740,48003420,41603240,47802720,47803440},},},
		[50051] = {name="Ghostcrawler",locations={[614]={12408300,15207640,19605040,19808340,20406760,22607520,27607640,30008160,31407040,16807240,20605380,28607320},},tameable=true,},
		[50052] = {name="Burgy Blackheart",locations={[615]={56407100,56606980},},},
		[50053] = {name="Thartuk the Exile",locations={[606]={35002640,40202660,43003220,49403380,55402860,57203500,35002460,42403180,47603420,54802920},},},
		[50056] = {name="Garr",locations={[606]={37207480,38408340,37007480,38608360},},},
		[50057] = {name="Blazewing",locations={[606]={42205860,47605660,52805720,58005760,63005760,66405040,42406020,47605720,50405220,53405780,58605600,63605600},},},
		[50058] = {name="Terrorpene",locations={[606]={49607220,51608380,49807200,52608300,55407620},},tameable=true,},
		[50059] = {name="Golgarok",locations={[640]={32407700,39008340,45408480,32407680,38808420,46208380},},},
		[50060] = {name="Terborus",locations={[640]={55002480,54002200},},},
		[50061] = {name="Xariona",locations={[640]={42404320,49606560},},},
		[50062] = {name="Aeonaxx",locations={[640]={42404720,43405880,51204320,51806340,42004900,50404460,59202780},},},
		[50063] = {name="Akma'hat",locations={[720]={38006020,38006020},},},
		[50064] = {name="Cyrus the Black",locations={[720]={58008240,58206120,66406800,70807420,57806160,57808300,66006800,71007360},},},
		[50065] = {name="Armagedillo",locations={[720]={44804140,44604180},},},
		[50085] = {name="Overlord Sunderfury",locations={[700]={57803340,57803360},},},
		[50086] = {name="Tarvus the Vile",locations={[700]={50808260,50808220},},},
		[50089] = {name="Julak-Doom",locations={[700]={49400860,54401160,58400600,51000800,57400840},},},
		[50138] = {name="Karoma",locations={[700]={49207440,53805320,58206360,59404320,65406020,49007560,53805360,54207600,58606380,58804400,65006040},},tameable=true,},
		[50154] = {name="Madexx",locations={[720]={44802220,50002380,44802180,53601940,44401040},},notes="Brown",tameable=true,},
		[50159] = {name="Sambas",locations={[700]={38005220,42203840,45402920,49002280,68402540,38005280,42203900,49002260,68602640},},tameable=true,},
		[50409] = {name="Mysterious Camel Figurine",locations={[720]={25745120,25914768,32704821,31944542,33193822,30012877,29232162,33893340,34602974,34702518,33222266,34382122,45431415,50553214,52172820,63652284,63301679,66271895,65772266,66862545,63982829,66503182,72244444,72435651,70015869,73457364,66526884,58458337,56378539,50928533,51268015,47587884,47707648,49287573,50527366,50497206,58396155,51955036,47924690,46364481,45354200,40253895,40134397,41025029,38265507,38416056,36986384,33537206,31736947,31496633,32776522,33326276,33075973,30646083,30576257,28726328,25856583,22066415,24756033},},},
		[50815] = {name="Skarr",locations={[795]={33005220,36803480,33005220,37603520},},tameable=true,},
		[50959] = {name="Karkin",locations={[795]={33005220,36803480,33005200,37403540},},tameable=true,},
		[51071] = {name="Captain Florence",locations={[613]={68407380},[615]={55207320,55007380},},},
		[51079] = {name="Captain Foulwind",locations={[613]={66806940},[615]={52606800},},},
		[51236] = {name="Aeonaxx",locations={[640]={42204720,43005820,52004280,52406340},},notes="Engaged",},
		[51401] = {name="Madexx",locations={[720]={44401020,44802220,51002000,45001020,47401820,50202380},},notes="Red",tameable=true,},
		[51402] = {name="Madexx",locations={[720]={44402180,44601000,50602000,44401000,44602220},},notes="Green",tameable=true,},
		[51403] = {name="Madexx",locations={[720]={44402200,44801020,53601960,44801040,47201840},},notes="Black",tameable=true,},
		[51404] = {name="Madexx",locations={[720]={44401020,47201840,49802380,44602180},},notes="Blue",tameable=true,},
		[51658] = {name="Mogh the Dead",locations={[37]={62407420,62407440},},},
		[51661] = {name="Tsul'Kalu",locations={[37]={47003040,46803060},},tameable=true,},
		[51662] = {name="Mahamba",locations={[37]={54003100,53403000},},tameable=true,},
		[51663] = {name="Pogeyan",locations={[37]={36202920,35602920},},tameable=true,},
		[52146] = {name="Chitter",locations={[36]={63206540,63006600},},tameable=true,},
		[54318] = {name="Ankha",locations={[606]={27405100,32405140,38005420,28205180,35205500},},tameable=true,},
		[54319] = {name="Magria",locations={[606]={27405140,32405140,37605340,27605220,33605240},},tameable=true,},
		[54320] = {name="Ban'thalos",locations={[606]={25806120,25606180},},tameable=true,},
		[54321] = {name="Solix",locations={[795]={59806220,68405840,60206080,61005240},},tameable=true,},
		[54322] = {name="Deth'tilac",locations={[795]={67407220,71606700,66806260,67407280,70205300,49207160,49408580,60606440},},tameable=true,},
		[54323] = {name="Kirix",locations={[795]={24606420,27207000,28405820,35005880,25206940,25606220,30605640},},tameable=true,},
		[54324] = {name="Skitterflame",locations={[795]={19404740,17205020,18004400},},tameable=true,},
		[54338] = {name="Anthriss",locations={[795]={52604120,52004060},},tameable=true,},
		[54533] = {name="Prince Lakma",locations={[121]={48007660,47807680},[261]={21400660,22000620},},tameable=true,},
		[56080] = {name="Little Samras",locations={[734]={64204360},},},
		[56081] = {name="Optimistic Benj",locations={[734]={48406360,48206460},},},
	})
end
