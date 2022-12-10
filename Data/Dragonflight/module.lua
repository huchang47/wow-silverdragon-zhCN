if WOW_PROJECT_ID == WOW_PROJECT_CLASSIC then return end -- classic misses expansion variables
if LE_EXPANSION_LEVEL_CURRENT < (LE_EXPANSION_DRAGONFLIGHT or math.huge) then return end

-- DO NOT EDIT THIS FILE; run dataminer.lua to regenerate.
local core = LibStub("AceAddon-3.0"):GetAddon("SilverDragon")

local VALDRAKKEN = 2112
local WAKINGSHORES = 2022
local OHNAHRANPLAINS = 2023
local AZURESPAN = 2024
local THALDRASZUS = 2025
local FORBIDDENREACH = 2026
local FORBIDDENREACHINTRO = 2118 -- Dracthyr

local FACTION_MARUUK = 2503
local FACTION_DRAGONSCALE = 2507
local FACTION_VALDRAKKEN = 2510
local FACTION_ISKAARA = 2511

local MAXLEVEL = {core.conditions.QuestComplete(67030), core.conditions.Level(70)}
local DRAGONRIDING = core.conditions.SpellKnown(376777)

-- Rares

core:RegisterMobData("Dragonflight", {
	[193217] = {
		name="Drakewing",
		achievement=16676, -- Adventurer
		criteria=56039,
		loot={
			200219, -- Dangerous Drapery
		},
		note="Flying",
		locations={[WAKINGSHORES]={49806960,52205060,69205480,72824701}},
		routes={[WAKINGSHORES]={
			{49806960, 49807220, 48007680, 47207700, r=1, g=1, b=0},
			{52205060, 53605320, 55205820, r=1, g=1, b=0},
			{69205480, 69405940, 67606020, 63605860, r=1, g=1, b=0},
		}},
	},
	-- War party, except Brundin who's below:
	[192737] = {name="Qalashi War Mammoth", locations={[WAKINGSHORES]={}},hidden=true,},
	[192741] = {name="Flamebreaker Grella", locations={[WAKINGSHORES]={}},hidden=true,},
	[192743] = {name="Stonefist Rejara", locations={[WAKINGSHORES]={}},hidden=true,},
	[192744] = {name="Scalemelter Dorbane", locations={[WAKINGSHORES]={}},hidden=true,},
}, true)

-- Handynotes imports
--[[
minor transformations applied:
`ns.conditions` = `core.conditions`
s/{ -- (.+)/{\n\t\tlabel="$1",/g
--]]

core:RegisterHandyNotesData("Dragonflight", FORBIDDENREACHINTRO, {
	[32884100] = {
		label="Deathrip",
		quest=66966,
		npc=191729,
		loot={
			197725, -- Deathrip's Curled Claw
		},
		vignette=5129,
	},
	[28473653] = {
		label="Scytherin",
		quest=66967,
		npc=191713,
		loot={
			196435, -- Scytherin's Barbed Necklace
		},
		path=33553370,
		vignette=5130,
	},
	[56496548] = {
		label="Ketess the Pillager",
		quest=66975,
		npc=191746,
		loot={
			194741, -- Earthbound Tome
		},
		vignette=5133,
	},
	[79567443] = {
		label="Tazenrath",
		quest=66973,
		npc=182280,
		loot={
			194883, -- Runic Wing
		},
	},
	[56004437] = {
		label="Stormspine",
		quest=64859,
		npc=181427,
		loot={
			194084, -- Charged Storm Crystal
		},
		spell=376238,
		vignette=4904,
	},
	[71233781] = {
		label="Shimmermaw",
		quest=64971,
		npc=181833,
		loot={
			194035, -- Glittering Diamonds
			194036, -- Exquisite Necklace
			194038, -- Gilded Blade
			194071, -- Gold Ring
			194072, -- Sack of Gold
		},
		vignette=4906,
	},
})
core:RegisterHandyNotesData("Dragonflight", WAKINGSHORES, {
	[52535855] = {
		label="Gushgut the Beaksinker",
		criteria=56033,
		quest=70718, -- didn't actually trigger?
		npc=196056,
		loot={
			{197098, quest=69299}, -- Highland Drake: Finned Back
		},
		vignette=5380,
	},
	[55994587] = {
		label="Nulltheria the Void Gazer",
		criteria=56034,
		quest=72103,
		npc=193256,
		loot={
			200236, -- Memory of Nulltheria
		},
		note="Top of the tower",
	},
	[58774034] = {
		label="Anhydros the Tidetaker",
		criteria=56035,
		quest=nil,
		npc=187945,
		loot={},
		vignette=5069,
	},
	[39654122] = {
		label="Skewersnout",
		criteria=56036,
		quest=nil,
		npc=193181,
		loot={
			200132, -- Skewer's Snout
		},
	},
	[43427361] = {
		label="Helmet Missingway",
		-- no quest, no loot, it just deaggros and runs away and you get achievement-credit
		criteria=56037,
		quest=nil,
		npc=193263, -- 199645 is the criteria asset
		loot={},
		minimap=true, -- just a neutral mob wandering, no vignette
	},
	[52906590] = {
		label="Brundin the Dragonbane",
		criteria=56038,
		quest=73890,
		npc=192738,
		loot={
			200133, -- Volcanic Chakram
			200217, -- Blazing Essence
		},
		route={
			52906590, 53006650, 52006670, 51306660, 49606530, 48706530, 48436605, 47706890,
			48007100, 46907360, 45407400, 42607250, 41706940, 40306820, 39306830, 37906960,
			37607070, 36507160, 34607110,
		},
		minimap=true,
		vignette=5386, -- Qalashi War Party
	},
	[45413562] = {
		label="Thunderous Matriarch",
		criteria=56040,
		quest=69841,
		npc=193148,
		loot={},
		vignette=5174,
	},
	[54897110] = {
		label="Azra's Prized Peony",
		criteria=56041,
		quest=69839,
		npc=193135,
		loot={
			200229, -- Slightly Digested Leggings
		},
		vignette=5172,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[78575019] = {
		label="Snappy",
		criteria=56042,
		quest=nil,
		npc=193228,
		loot={},
	},
	[82214945] = {
		label="O'nank Shorescour",
		criteria=56043,
		quest=70983,
		npc=193118,
		loot={
			200435, -- Brackish Breeches
		},
		vignette=5167,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[69016482] = {
		label="Smogswog the Firebreather",
		criteria=56044,
		quest=69668,
		npc=193120,
		loot={
			200209, -- Firebreather's Cowl
		},
		vignette=5169,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[62705455] = {
		label="Amethyzar the Glittering",
		criteria=56045,
		quest=69838,
		npc=193132,
		loot={
			200156, -- Amethyzarite Geode
		},
		vignette=5171,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[40206516] = {
		label="Magmaton",
		-- Obsidian Citadel objective-bonus
		criteria=56046,
		quest=70979,
		npc=186827,
		loot={},
		vignette=5116,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[21947690] = {
		label="Massive Magmashell",
		criteria=56047,
		quest=69848,
		npc=193152,
		loot={
			200192, -- Handheld Geyser
			200563, -- Primal Ritual Shell
		},
		vignette=5175,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[33417637] = {
		label="Forgotten Gryphon",
		criteria=56048,
		quest=72130, -- 73073
		npc=193154,
		loot={
			{196985, quest=69185}, -- Cliffside Wylderdrake: Horned Jaw
			200858, -- Plume of the Forgotten
		},
		vignette=5383,
	},
	[21606478] = {
		label="Enkine the Voracious",
		criteria=56049,
		quest=73072, -- 72128
		npc=193134,
		loot={
			200133, -- Volcanic Chakram
			200167, -- Regurgitated Stone Handaxe
			200247, -- Inextinguishable Gavel
			200252, -- Molten Flak Cannon
			200163, -- Ring of Embers
			200563, -- Primal Ritual Shell
			200217, -- Blazing Essence
			{197135, quest=69336}, -- Highland Drake: Toothy Mouth
		},
		note="Kill nearby mobs for {item:201092:Lava Spices}, then fish here to summon",
		vignette=5382,
	},
	[27017601] = {
		label="Captain Lancer",
		criteria=56050,
		quest=72127,
		npc=193198,
		loot={
			{197005, quest=69205}, -- Cliffside Wylderdrake: Horned Nose
			{197019, quest=69219}, -- Cliffside Wylderdrake: Blunt Spiked Tail
			200286, -- Dragonbane Lance
		},
		vignette=5385,
		note="Spawns after Dragonbane Keep event",
	},
	[64456922] = {
		label="Possessive Hornswog",
		criteria=56051,
		quest=67048, -- 70864 for cave-access
		npc=192362,
		loot={
			{199916, pet=3365}, -- Roseate Hopper
		},
		vignette=5139, -- Hidden Hornswog Hoard
		atlas="VignetteLootElite", scale=1.2,
		note="Bring {item:200064}, {item:200065}, and {item:200066} here to enter",
		related={
			[47738363] = {quest=70864,label="{item:200064}",inbag=200064,atlas="Islands-AzeriteChest",}, -- Marmoni's Prize
			[39648469] = {quest=70864,label="{item:200065}",inbag=200065,atlas="Islands-AzeriteChest",}, -- Adventurer's Lost Soap Bar
			[66185530] = {quest=70864,label="{item:200066}",note="Top of tower",inbag=200066,atlas="Islands-AzeriteChest",}, -- Well-Preserved Bone
		},
	},
	[30005530] = {
		label="Worldcarver A'tir",
		-- TODO: verify vignette-coords
		criteria=56052,
		quest=70763,
		npc=186859,
		loot={
			200213, -- Lava-Splattered Breastplate
		},
		nearby={30005520, label="{npc:197395:Wurmling Bones}"},
		note="Gather 3x {item:191211:Wurmling Bones} from {npc:187366:Worldcarver Wurmling} then click on the {npc:197395:Wurmling Bones}",
		vignette=5110,
	},
	[31825440] = {
		label="Death's Shadow",
		criteria=56053,
		quest=67027, -- check
		npc=190985,
		loot={
			200159, -- Blaze Ring
		},
		note="Give 20x{item:191264:Restored Obsidian Key} to {npc:191640:Sabellian} to trigger {quest:67027}",
		vignette=5113,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[23825742] = {
		label="Shas'ith",
		criteria=56054,
		quest=66903, -- check
		npc=189822,
		loot={},
		note="Under the Obsidian Citadel. Give 20x{item:191264:Restored Obsidian Key} to {npc:186681:Wrathion} to trigger {quest:66903}",
		vignette=5108,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[33748639] = {
		label="Lepidoralia the Resplendent",
		criteria=56055,
		quest=69891,
		npc=193266,
		loot={},
		note="In the Fluttering Cavern",
		vignette=5209, -- Resplendent Shimmerwing
		path=35228165,
	},
	[30915494] = {
		label="Cauldronbearer Blakor",
		-- also 25825982?
		criteria=56056,
		quest=74042,
		npc=186783,
		loot={},
		note="Patrols",
		vignette=5480,
	},
	[25286032] = {
		label="Rohzor Forgesmash",
		criteria=56057,
		quest=74052,
		npc=187598,
		loot={
			194503, -- Plans: Black Dragon Touched Hammer
		},
	},
	[33115569] = {
		label="Turboris",
		criteria=56058,
		quest=74054,
		npc=187886,
		loot={},
		vignette=5109,
	},
	[28635882] = {
		label="Battlehorn Pyrhus",
		criteria=56059,
		quest=74040,
		npc=190986,
		loot={},
		vignette=5112, -- and 5114
	},
	[29245162] = {
		label="Char",
		criteria=56060,
		quest=74043,
		npc=190991,
		loot={
			{197602, quest=69806}, -- Windborne Velocidrake: Cluster Horns
		},
		vignette=5115,
	},
	[30226045] = {
		label="Rasnar the War Ender",
		criteria=56061,
		quest=nil,
		npc=193232,
		loot={},
	},
	[32215221] = {
		label="Morchok",
		criteria=56988,
		quest=74067, -- 66901
		npc=187306,
		loot={
			200207, -- Petrified Fungal Spores
			200244, -- Enchanted Muckstompers, can drop off multiple rares
		},
		note="Give 20x{item:191264:Restored Obsidian Key} to {npc:187275:Igys the Believer} to trigger {quest:66901}",
		vignette=5388, -- 5119 for "Morchock Reformed"?
		-- hide_before=MAXLEVEL, -- TODO
	},
	[47297386] = {
		label="Shadeslash Trakken",
		criteria=56989,
		quest=70719,
		npc=193271,
		loot={
			200297, -- Hastily Cobbled Maul
			200152, -- Gleaming Blade of Insight
			200689, -- Rimetalon Band
		},
		note="Use the three Pilfered objects inside the cave to summon",
		path=48457426,
		vignette=5381,
	},
	[84163456] = {
		label="Slurpo, the Incredible Snail",
		criteria=57003,
		quest=72126,
		npc=193175,
		loot={},
		vignette=5384,
	},
}, {
	achievement=16676, -- Adventurer
})
core:RegisterHandyNotesData("Dragonflight", WAKINGSHORES, {
	[46725013] = {
		label="Primal Scythid Queen",
		quest=66074, -- 57559, 62396
		npc=184853,
		loot={
			{197111, quest=69312}, -- Highland Drake: Maned Head
			200563, -- Primal Ritual Shell
			200445, -- Lucky Hunting Charm
			200195, -- Thunderscale Legguards
		},
		vignette=5055,
	},
	[64173289] = {
		label="Dragonhunter Igordan",
		quest=66956, -- 72838
		npc=191611,
		loot={
			200757, -- Qalashi War-Helm
			{197005, quest=69205}, -- Cliffside Wylderdrake: Horned Nose
			{197019, quest=69219}, -- Cliffside Wylderdrake: Blunt Spiked Tail
			-- 198876, -- Technique: Weathered Explorer's Stave (general drop?)
		},
		worldquest=65994,
		vignette=5126,
	},
	[54808220] = {
		label="Klozicc the Ascended",
		quest=72841, -- also 66960
		npc=187209,
		loot={
			{197023, quest=69223}, -- Cliffside Wylderdrake: Maned Neck
			{197602, quest=69806}, -- Windborne Velocidrake: Cluster Horns
			{200198, toy=true}, -- Primalist Prison
			200253, -- Snowspring Incanter's Knife
			200246, -- Lost Delving Lamp
		},
		vignette=5127,
	},
	[77602220] = {
		label="Ancient Hornswog",
		quest=66076, -- verify; vignette
		npc=187111,
		loot={
			{196992, quest=69192}, -- Cliffside Wylderdrake: Heavy Horns
			{197403, quest=69604}, -- Renewed Proto-Drake: Club Tail
			{200249, toy=true}, -- Mage's Chewed Wand
			200442, -- Basilisk Hide Jerkin
		},
		vignette=5057,
	},
	[46715715] = {
		label="Monsoo, The Boiling Rage",
		-- This is rare-flagged, but has no quest, no loot, and no criteria-completion...
		quest=nil,
		npc=190718,
		loot={},
		vignette=nil,
		note="Kill {npc:190719:Primalist Arlin} to trigger",
	},
	[54512137] = {
		label="Firava the Rekindler",
		quest=72839, -- also 70648
		npc=195915,
		loot={
			{197135, quest=69336}, -- Highland Drake: Toothy Mouth
			{197379, quest=69580}, -- Renewed Proto-Drake: Impaler Horns
			200133, -- Volcanic Chakram
			200217, -- Blazing Essence
		},
		route={54512137, 56202250, 56502480, r=1, g=0, b=0},
		vignette=5372,
	},
	[60598286] = {
		label="Terillod the Devout",
		quest=72850, -- also 70751
		npc=193171,
		loot={
			200208, -- Cloud Coalescing Handwraps
		},
		vignette=5387,
	},
	[28047868] = {
		label="Beakers",
		-- no quest, no vignette, just a random rare-flagged mob
		quest=nil,
		npc=193177,
		loot={},
	},
	[24205400] = {
		label="Penumbrus",
		quest=nil,
		npc=189289,
		loot={
			200144, -- Band of the Unscalable
		},
		note="Under the Obsidian Citadel",
	},
	[78405000] = {
		label="Gorjo the Crab Shackler",
		-- [78405000, 78405060, 78604920, 78604980]
		quest=nil,
		npc=193226,
		loot={
			200281, -- Gorjo's Riding Crop
		},
	},
})
core:RegisterHandyNotesData("Dragonflight", OHNAHRANPLAINS, {
	-- https://www.wowhead.com/beta/achievement=16677/adventurer-of-the-ohnahran-plains
	[20403800] = {
		label="Sparkspitter Vrak",
		criteria=56062,
		quest=73896,
		npc=193165,
		loot={
			{196999, quest=69199}, -- Cliffside Wylderdrake: Swept Horns
			200234, -- Vrak's Embossed Aegis
		},
	},
	[50027484] = {
		label="Scav Notail",
		criteria=56063,
		quest=69863,
		npc=193136,
		loot={
			200168, -- Gnoll Hide Belt
		},
		vignette=5187,
	},
	[56408160] = {
		label="Enraged Sapphire",
		criteria=56064,
		quest=69840,
		npc=193142,
		loot={
			200309, -- Rock Encrusted Chestguard
		},
		vignette=5173,
	},
	[61801300] = {
		label="Seeker Teryx",
		criteria=56065,
		quest=nil,
		npc=193188,
		loot={
			{196970, quest=69170}, -- Cliffside Wylderdrake: Spiked Back
			{197105, quest=69306}, -- Highland Drake: Spined Chin
			{197586, quest=69790}, -- Windborne Velocidrake: Spiked Back
			{197138, quest=69339}, -- Highland Drake: Striped Pattern
			200875, -- Seeker's Bands
			200758, -- Breastplate of Storied Antiquity
		},
	},
	[31646421] = {
		label="Zenet Avis",
		criteria=56066,
		quest=nil,
		npc=193209,
		loot={
			{200879, note="Hatches into..."}, -- Zenet Egg
			{198825, mount=1672}, -- Zenet Hatchling
		},
		note="Flying",
	},
	[87406140] = {
		label="Liskheszaera",
		criteria=56067,
		quest=nil,
		npc=197009,
		loot={
			{197106, quest=69307}, -- Highland Drake: Finned Head
			{197400, quest=69601}, -- Renewed Proto-Drake: Shark Snout
			200434, -- Anund's Mana-Singed Amice
			200446, -- Crystalized Sigil
		},
	},
	[29426783] = {
		label="Deadwaker Ghendish",
		criteria=56068,
		quest=nil,
		npc=189652,
		loot={
			189055, -- Ghendish's Backup Talisman
		},
	},
	--[[
	[] = {
		label="Researcher Sneakwing",
		criteria=56069,
		quest=70689,
		npc=196010,
		loot={},
		vignette=5378,
		-- hide_before=MAXLEVEL, -- TODO
	},
	--]]
	[62987932] = {
		label="Mikrin of the Raging Winds",
		criteria=56070,
		quest=69857,
		npc=193173,
		loot={
			200542, -- Breezy Companion
		},
		vignette=5183,
		-- hide_before=MAXLEVEL, -- TODO
	},
	--[[
	[] = {
		label="Ronsak the Decimator",
		criteria=56071,
		quest=69878,
		npc=193227,
		loot={},
		vignette=5205,
		-- hide_before=MAXLEVEL, -- TODO
	},
	--]]
	[53627281] = {
		label="Steamgill",
		criteria=56072,
		quest=69667,
		npc=193123,
		loot={
			200216, -- Water Heating Cord
		},
		vignette=5168,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[71204620] = {
		label="Malsegan",
		criteria=56073,
		quest=69871,
		npc=193212,
		loot={
			200197, -- Armoredon Herding Crook
		},
		vignette=5195,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[60812677] = {
		label="Oshigol",
		criteria=56074,
		quest=69877,
		npc=193235,
		loot={},
		note="Patrols",
		vignette=5199,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[74414762] = {
		label="Fulgurb",
		criteria=56075,
		quest=69856,
		npc=193170,
		loot={
			200433, -- Footwraps of Subjugation
		},
		vignette=5182,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[58596822] = {
		label="Windseeker Avash",
		criteria=56076,
		quest=74088,
		npc=192045,
		loot={
			200141, -- Wind Generating Band
		},
	},
	[49496663] = {
		label="Eaglemaster Niraak",
		criteria=56077,
		quest=74063,
		npc=192020,
		loot={
			200536, -- Tamed Eagle
			{197367, quest=69568}, -- Renewed Proto-Drake: Gray Hair
		},
		vignette=5138,
	},
	[29756131] = {
		label="Zarizz",
		criteria=56078,
		quest=72364, -- 74091
		npc=193140,
		loot={
			200193, -- Manafrond Sandals
		},
		vignette=5469,
	},
	[20304370] = {
		label="Scaleseeker Mezeri",
		criteria=56079,
		quest=74073, -- 69865?
		npc=193215,
		loot={
			200293, -- Primal Scion's Twinblade
		},
		vignette=5190,
		related={
			[16605120] = {label="{npc:193224:Dawnbell}",note="Bring {item:194681:Sugarwing Cupcakes} from an innkeeper, then follow her to {npc:193215:Scaleseeker Mezeri}"},
		}
	},
	[29554146] = {
		label="Shade of Grief",
		criteria=56080,
		quest=74075,
		npc=187559,
		loot={
			{196985, quest=69185}, -- Cliffside Wylderdrake: Horned Jaw
			{197382, quest=69583}, -- Renewed Proto-Drake: White Horns
			{196996, quest=69196}, -- Cliffside Wylderdrake: Branched Horns
			{197115, quest=69316}, -- Highland Drake: Thorned Jaw
			200437, -- Dreamsong Censer
			200444, -- Mantle of the Gatekeeper
			-- these might all be generic undead-drops:
			200256, -- Darkmaul Soul Horn
			200158, -- Eerie Spectral Ring
			200310, -- Stole of the Iron Phantom
		},
		vignette=5181, -- Solethus' Gravestone
	},
	--[[
	[] = {
		label="Nokhud Warmaster",
		criteria=56081,
		quest=nil,
		npc=187219,
		loot={},
		vignette=5062,
	},
	--]]
	[85221544] = {
		label="Hamett",
		criteria=56082,
		quest=nil,
		npc=187781,
		loot={},
	},
	[80364198] = {
		label="Hunter of the Deep",
		criteria=56083,
		quest=nil, -- no quest tripped
		npc=188095,
		loot={}, -- supplies and centaur rep...
		vignette=5077, -- vignette wasn't actually shown, just a swarm of no-data vignettes
	},
	[80413867] = {
		label="Irontree",
		criteria=56084,
		quest=66356,
		npc=188124,
		loot={},
		vignette=5078,
		path=79383649,
	},
	[72222321] = {
		label="Zerimek",
		criteria=56085,
		quest=nil,
		npc=188451,
		loot={},
		vignette=5087,
	},
	--[[
	[] = {
		label="Sulfurion",
		criteria=56086,
		quest=nil,
		npc=191842,
		loot={},
		vignette=5135,
	},
	[] = {
		label="Porta the Overgrown",
		criteria=56087,
		quest=nil,
		npc=191950,
		loot={},
		vignette=5136,
	},
	[] = {
		label="The Jolly Giant",
		criteria=56088,
		quest=nil,
		npc=195204,
		loot={},
		vignette=5352,
	},
	--]]
	[84214784] = {
		label="Windscale the Stormborn",
		criteria=56089,
		quest=nil,
		npc=192364,
		loot={},
		vignette=5140,
	},
	[83786215] = {
		label="Vaniik the Stormtouched",
		criteria=56090,
		quest=nil,
		npc=192453,
		loot={},
		vignette=5143, -- Vaniik the Corrupted
	},
	--[[
	[] = {
		label="Quackers the Terrible",
		criteria=56091,
		quest=nil,
		npc=192557,
		loot={},
		vignette=5144,
	},
	[] = {
		label="Cinta the Forgotten",
		criteria=56092,
		quest=nil,
		npc=195186,
		loot={},
		vignette=5351,
	},
	--]]
	[42804428] = {
		label="Rustlily",
		criteria=56093,
		quest=nil,
		npc=195223,
		loot={},
	},
	[32823817] = {
		label="Makhra the Ashtouched",
		criteria=56094,
		quest=nil,
		npc=195409,
		loot={},
		vignette=5365,
	},
	--[[
	[] = {
		label="The Great Enla",
		criteria=56095,
		quest=nil,
		npc=196334,
		loot={},
	},
	[] = {
		label="Old Stormhide",
		criteria=56096,
		quest=nil,
		npc=196350,
		loot={},
	},
	--]]
}, {
	achievement=16677, -- Adventurer
})
core:RegisterHandyNotesData("Dragonflight", OHNAHRANPLAINS, {
	[81447834] = {
		label="Seereel, the Spring",
		-- TODO: find the spawn point in Azure Span, which presumably exists?
		achievement=16678, -- Adventurer of the *Azure Span*
		criteria=56118,
		quest=nil,
		npc=193710,
		loot={
			200086, -- Khaz'gorite-infused Resin
		},
		note="Throw 5x {item:194701:Ominous Conch} into a Lurker Sighting to summon",
	},
	[81207780] = {
		label="Astray Splasher",
		achievement=16678, -- Adventurer of the *Azure Span*
		criteria=56130,
		quest=nil,
		npc=197411,
		loot={},
	},
	[59926695] = {
		label="Prozela Galeshot",
		quest=72815, -- 69968 also
		npc=193669,
		loot={
			{197383, quest=69584}, -- Renewed Proto-Drake: Heavy Horns
			200134, -- Ohuna Mass-Binding Totem
		},
		vignette=5240,
	},
	[44904923] = {
		label="Skaara",
		quest=70783, -- 72847 also
		npc=192949,
		loot={
			200442, -- Basilisk Hide Jerkin
			198411, -- Claw of Preparedness
			{200249, toy=true}, -- Mage's Chewed Wand
			{196976, quest=69176}, -- Cliffside Wylderdrake: Head Mane
		},
		note="In cave",
		vignette=5389,
	},
	[26356534] = {
		label="Ripsaw the Stalker",
		quest=69851, -- also 72845
		npc=193153,
		loot={
			200137, -- Chitin Dreadbringer
			200186, -- Amberquill Shroud
		},
		vignette=5178,
	},
	[22996667] = {
		label="Territorial Coastling",
		quest=69852, -- also 72851
		npc=193163,
		loot={
			200212, -- Sand-Encrusted Greaves
			200442, -- Basilisk Hide Jerkin
		},
		vignette=5179,
	},
	[26073414] = {
		label="Ty'foon the Ascended",
		quest=66970, -- also 72852
		npc=191354,
		loot={
			{197372, quest=69573}, -- Renewed Proto-Drake: Purple Hair
			198429, -- Typhoon Bringer
		},
		path=24503340,
		vignette=5131,
	},
	[72615598] = {
		label="Biryuk",
		quest=nil,
		npc=193168,
		loot={}, -- only supplies and commendations
	},
	[63044855] = {
		label="Sunscale Behemoth",
		quest=69837, -- 72849
		npc=193133,
		loot={
			{198409, toy=true}, -- Personal Shell
		},
		note="Behind the waterfall",
	},
})
core:RegisterHandyNotesData("Dragonflight", AZURESPAN, {
	-- https://www.wowhead.com/beta/achievement=16678/adventurer-of-the-azure-span
	[59405520] = {
		label="Wilrive",
		criteria=56097,
		quest=69948, -- didn't actually trigger
		npc=193632,
		loot={
			200174, -- Bonesigil Shoulderguards
		},
		vignette=5224,
	},
	[27804580] = {
		label="Dragonhunter Gorund",
		criteria=56098,
		quest=nil,
		npc=193157,
		loot={
			200302, -- Magmaforged Scimitar
			200169, -- Protector's Molten Cudgel
			200757, -- Qalashi War-Helm
			{197005, quest=69205}, -- Cliffside Wylderdrake: Horned Nose
			{197019, quest=69219}, -- Cliffside Wylderdrake: Blunt Spiked Tail
		},
	},
	[53003560] = {
		label="Arcane Devourer",
		criteria=56099,
		quest=nil,
		npc=194270,
		loot={},
		vignette=5267,
	},
	[40404840] = {
		label="Mange the Outcast",
		criteria=56100,
		quest=nil,
		npc=198004,
		loot={},
	},
	--[[
	[] = {
		label="Frostpaw",
		criteria=56101,
		quest=67148,
		npc=191356,
		loot={},
		vignette=5153,
	},
	--]]
	[57685441] = {
		label="Mucka the Raker",
		-- ...very prone to resetting+evading and healing to full
		criteria=56102,
		quest=nil, -- no quest popped
		npc=193201,
		loot={
			{200249, toy=true}, -- Mage's Chewed Wand
		},
	},
	--[[
	[] = {
		label="Brackle",
		criteria=56103,
		quest=70165,
		npc=194392,
		loot={},
		vignette=5269,
	},
	--]]
	[64792998] = {
		label="Frigidpelt Den Mother",
		criteria=56104,
		quest=69985,
		npc=193698,
		loot={},
		vignette=5252,
	},
	[61213127] = {
		label="Azure Pathfinder",
		criteria=56105,
		quest=73867,
		npc=194210,
		loot={},
		note="Patrols the icy area",
		route={61213127, 59163080, 57562986, 54223190, 52023452, 49283837},
		minimap=true,
	},
	[73002660] = {
		label="Beogoka",
		criteria=56106,
		quest=nil,
		npc=193116,
		loot={
			200673, -- Beogoka's Tooth and Claw
		},
		vignette=5189,
	},
	[34053080] = {
		label="Notfar the Unbearable",
		criteria=56107,
		quest=nil,
		npc=193225,
		loot={},
		note="In cave",
	},
	[16622799] = {
		label="Blue Terror",
		criteria=56108,
		quest=nil,
		npc=193259,
		loot={
			{197595, quest=69799}, -- Windborne Velocidrake: Finned Ears
		},
		note="Spawns at the top of a tree",
	},
	[36323583] = {
		label="Mahg the Trampler",
		criteria=56109,
		quest=nil,
		npc=190244,
		loot={
			200157, -- Pathmaker
		},
		route={36323583, 46004100, r=0, g=1, b=0}, -- verify
		minimap=true,
	},
	[26804940] = {
		label="Skag the Thrower",
		criteria=56110,
		quest=72154,
		npc=193149,
		loot={
			200279, -- Competitive Throwing Gauntlets
		},
		vignette=5440,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[32652915] = {
		label="Gruffy",
		criteria=56111,
		quest=69885,
		npc=193251,
		loot={
			200755, -- Gruffy's Dented Horn
		},
		vignette=5206,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[19204360] = {
		label="Grumbletrunk",
		criteria=56112,
		quest=69892,
		npc=193269,
		loot={
			200206, -- Behemoth Slayer Greatbow
		},
		vignette=5210,
		-- hide_before=MAXLEVEL, -- TODO
	},
	--[[
	[] = {
		label="Rusthide",
		criteria=56113,
		quest=nil,
		npc=193693,
		loot={},
	},
	--]]
	[70202520] = {
		label="Trilvarus Loreweaver",
		criteria=56114,
		quest=69861, -- 74087
		npc=193196,
		loot={
			200549, -- Restored Titan Artifact
		},
		vignette=5186,
		note="Use crystals in the tower to the North and bring the energies to {npc:193782}",
		nearby={70402370, label="{spell:382076}"},
	},
	[49463607] = {
		label="Fisherman Tinnak",
		criteria=56115,
		quest=74064, -- 70792
		npc=193691,
		loot={
			{197382, quest=69583}, -- Renewed Proto-Drake: White Horns
			{196985, quest=69185}, -- Cliffside Wylderdrake: Horned Jaw
			{197098, quest=69299}, -- Highland Drake: Finned Back
			{197001, quest=69201}, -- Cliffside Wylderdrake: Finned Cheek
			198070, -- Tattered Seavine
			200187, -- Rod of Glacial Force
			200245, -- Leviathan Lure
			200552, -- Torrent Caller's Shell
			200164, -- Iceloop
			-- generic undead?
			200256, -- Darkmaul Soul Horn
			200158, -- Eerie Spectral Ring
			200310, -- Stole of the Iron Phantom
		},
		active=core.conditions.MajorFaction(FACTION_ISKAARA, 7),
		vignette=5475,
		related={
			[50523672] = {label="{item:381654:Broken Fishing Pole}", note="Click this first!",},
			[49973821] = {label="{item:385046:Torn Fishing Net}", note="Click this second!",},
			[49223842] = {label="{item:385047:Old Harpoon}", note="Click this Third! {npc:193691: Fisherman Tinnak's Ghost} spawns closely nearby.",},
		},
	},
	--[[
	[] = {
		label="Snufflegust",
		criteria=56116,
		quest=nil,
		npc=193706,
		loot={},
	},
	--]]
	[33806440] = {
		label="Skald the Impaler",
		criteria=56117,
		quest=nil,
		npc=193708,
		loot={},
	},
	--[[
	[] = {
		label="Moth'go Deeploom",
		criteria=56119,
		quest=nil,
		npc=193735,
		loot={},
	},
	[] = {
		label="Swog'ranka",
		criteria=56120,
		quest=nil,
		npc=193634,
		loot={},
	},
	[] = {
		label="Swagraal the Swollen",
		criteria=56121,
		quest=nil,
		npc=193167,
		loot={},
	},
	--]]
	[13604860] = {
		label="Bisquius",
		-- also get achievement 16444, Leftovers' Revenge
		criteria=55381,
		quest=nil,
		npc=197557,
		loot={
			200882,
		},
		note="Complete {spell:388961:Community Feasts}",
	},
	[13602200] = {
		label="Blightfur",
		criteria=56122,
		quest=69858,
		npc=193178,
		loot={
			{197404, quest=69605}, -- Renewed Proto-Drake: Finned Tail
			{197150, quest=69351}, -- Highland Drake: Spiked Club Tail
			200310, -- Stole of the Iron Phantom
			200127, -- Gold-Alloy Blade
			200432, -- Rotguard Cowl
		},
		vignette=5184,
	},
	[54803420] = {
		label="Spellwrought Snowman",
		criteria=56124,
		quest=74082, -- 69879 on vignette, didn't actually trigger?
		npc=193238,
		loot={
			200211, -- Snowman's Icy Gaze
		},
		vignette=5200,
		note="Collect 10x {npc:193424:Arcane Energy} for {npc:193255: Archmage Cleary} nearby",
		related={
			[53913570] = {label="{npc:193255: Archmage Cleary}", atlas="mechagon-projects", note="Gather {npc:193424:Arcane Energy}",},
		},
		nearby={
			54013628, 54083719, 54163467, 53493476, 53393655, 52923710, 52203733, 51683682, 51953565,
			label="{npc:193424:Arcane Energy}",
			note="Bring to {npc:193242:Arcane Pedestal}",
		},
	},
	[11093217] = {
		label="Snarglebone",
		criteria=56125,
		quest=74032,
		npc=197344,
		loot={
			200283, -- Gnoll-Gnawed Breeches
			200266, -- Gnollish Chewtoy Launcher
			{196982, quest=69182}, -- Cliffside Wylderdrake: Ears
			{197150, quest=69351}, -- Highland Drake: Spiked Club Tail
		},
		vignette=5413,
		note="On ~10 minute rotation with the other Brackenhide Hollow rares ({npc:197344}, {npc:197353}, {npc:197354}, {npc:197356})",
		-- hide_before=MAXLEVEL, -- TODO
	},
	[14483105] = {
		label="Blisterhide",
		criteria=56126,
		quest=73985,
		npc=197353,
		loot={
			200186, -- Amberquill Shroud
			200232, -- Raptor Talonglaive
			200131, -- Reclaimed Survivalist's Dagger
			200174, -- Bonesigil Shoulderguards
			200563, -- Primal Ritual Shell
			200193, -- Manafrond Sandals
			200445, -- Lucky Hunting Charm
		},
		note="On ~10 minute rotation with the other Brackenhide Hollow rares ({npc:197344}, {npc:197353}, {npc:197354}, {npc:197356})",
		vignette=5414,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[14083747] = {
		label="Gnarls",
		criteria=56127,
		quest=73996,
		npc=197354,
		loot={
			{197398, quest=69599}, -- Renewed Proto-Drake: Snub Snout
			200259, -- Forest Dweller's Shield
			200267, -- Reinforced Garden Tenders
		},
		vignette=5415,
		note="On ~10 minute rotation with the other Brackenhide Hollow rares ({npc:197344}, {npc:197353}, {npc:197354}, {npc:197356})",
		-- hide_before=MAXLEVEL, -- TODO
	},
	[16213364] = {
		label="High Shaman Rotknuckle",
		criteria=56128,
		quest=74004,
		npc=197356,
		loot={
			{200178, toy=true}, -- Infected Ichor
			{197150, quest=69351}, -- Highland Drake: Spiked Club Tail
			{196986, quest=69186}, -- Cliffside Wylderdrake: Black Hair
			{196973, quest=69173}, -- Cliffside Wylderdrake: Dual Horned Chin
			{196982, quest=69182}, -- Cliffside Wylderdrake: Ears
			200283, -- Gnoll-Gnawed Breeches
			200266, -- Gnollish Chewtoy Launcher
			200127, -- Gold-Alloy Blade
			200432, -- Rotguard Cowl
		},
		vignette=5416,
		note="On ~10 minute rotation with the other Brackenhide Hollow rares ({npc:197344}, {npc:197353}, {npc:197354}, {npc:197356})",
		-- hide_before=MAXLEVEL, -- TODO
	},
	--[[
	[] = {
		label="Ravenous Tundra Bear",
		criteria=56129,
		quest=nil,
		npc=197371,
		loot={},
	},
	--]]
}, {
	achievement=16678, -- Adventurer
})
core:RegisterHandyNotesData("Dragonflight", AZURESPAN, {
	[23443327] = {
		label="Cascade",
		npc=186962,
		quest=72836, -- 72358?
		loot={
			{197098, quest=69299}, -- Highland Drake: Finned Back
			200135, -- Corroded Greatsword
		},
		vignette=5050,
	},
	[38185903] = {
		label="Forgotten Creation",
		npc=193214,
		quest=72840,
		loot={
			200210, -- Amnesia
			200758, -- Breastplate of Storied Antiquity
		},
		vignette=5191,
	},
	[70063318] = {
		label="Summoned Destroyer",
		npc=193288,
		quest=72848, -- also 69895
		loot={
			200163, -- Ring of Embers
			200868, -- Integrated Primal Fire
		},
		vignette=5213,
	},
	[17394121] = {
		label="Vakril, the Strongest Tuskarr",
		npc=193223,
		quest=72853, -- 69872
		loot={
			{201728, quest=72853}, -- Vakril's Strongbox
			{197001, quest=69201}, -- Cliffside Wylderdrake: Finned Cheek
			{197098, quest=69299}, -- Highland Drake: Finned Back
		},
		vignette=5194,
	},
	[29814613] = {
		label="Breezebiter",
		npc=195353,
		quest=nil,
		loot={
			{201440, mount=1553},
		},
		note="Spawns in this cave, then flies around the area in a big circle",
	},
	[36793249] = {
		label="Sharpfang",
		quest=72846, -- 67173
		npc=192749,
		loot={
			{196982, quest=69182}, -- Cliffside Wylderdrake: Ears
			{197150, quest=69351}, -- Highland Drake: Spiked Club Tail
			200266, -- Gnollish Chewtoy Launcher
			200283, -- Gnoll-Gnawed Breeches
		},
		note="Kill the gnolls to summon",
		vignette=5158, -- Thieving Gnolls (also 5484 Sharpfang)
	},
})
core:RegisterHandyNotesData("Dragonflight", THALDRASZUS, {
	-- https://www.wowhead.com/beta/achievement=16679/adventurer-of-thaldraszus
	[51534871] = {
		label="Razk'vex the Untamed",
		criteria=56133,
		quest=69853,
		npc=193143,
		loot={
			200131, -- Reclaimed Survivalist's Dagger
		},
		note="Runs around, you can jump on it",
		route={53104363, 53124230, 51624534, 50304953, 51534871, 52714652, loop=true},
		minimap=true,
		vignette=5180,
	},
	[57968158] = {
		label="Innumerable Ruination",
		criteria=56135,
		quest=nil,
		npc=193126,
		loot={
			200760, -- Unstable Arcane Cell
		},
	},
	[31737253] = {
		label="Blightpaw the Depraved",
		-- overlaps a bit with plains @ 90204020
		criteria=56136,
		quest=73869,
		npc=193128,
		loot={
			{200178, toy=true}, -- Infected Ichor
			{197150, quest=69351}, -- Highland Drake: Spiked Club Tail
			{196986, quest=69186}, -- Cliffside Wylderdrake: Black Hair
			{196973, quest=69173}, -- Cliffside Wylderdrake: Dual Horned Chin
			{196982, quest=69182}, -- Cliffside Wylderdrake: Ears
			200266, -- Gnollish Chewtoy Launcher
			200127, -- Gold-Alloy Blade
			200432, -- Rotguard Cowl
		},
		note="Talk to {npc:193222:Archaeologist Koranir} to spawn. Also spawns with {npc:193231:Ancient Tundrafur}. Casts a curse as well.",
	},
	[38107820] = {
		label="Pleasant Alpha",
		criteria=56137,
		quest=73889, -- 72806 on criteria?
		npc=193130,
		loot={
			{197111, quest=69312}, -- Highland Drake: Maned Head
			200174, -- Bonesigil Shoulderguards
			200186, -- Amberquill Shroud
		},
		vignette=5479,
	},
	[53424101] = {
		label="Goremaul the Gluttonous",
		criteria=56138,
		quest=nil,
		npc=193125,
		loot={
			200436, -- Gorestained Hauberk
		},
	},
	[59806100] = {
		label="Phenran",
		criteria=56140,
		quest=69976,
		npc=193688,
		loot={
			200146, -- Phenran's Discordant Smasher
		},
		vignette=5248,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[52805920] = {
		label="Matriarch Remalla",
		criteria=56141,
		quest=69883,
		npc=193246,
		loot={
			200257, -- Decay Infused Branch
		},
		vignette=5204,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[57208420] = {
		label="Phleep",
		criteria=56142,
		quest=69866,
		npc=193210,
		loot={
			{197130, quest=69331}, -- Highland Drake: Stag Horns
			{200148, toy=true,}, -- A Collection Of Me
			200202, -- Tomorrow's Chains
		},
		vignette=5192,
		-- hide_before=MAXLEVEL, -- TODO
	},
	--[[
	[] = {
		label="Tempestrian",
		criteria=56144,
		quest=69886,
		npc=193258,
		loot={},
		vignette=5207,
		-- hide_before=MAXLEVEL, -- TODO
	},
	--]]
	[35027001] = {
		label="Treasure-Mad Trambladd",
		criteria=56146,
		quest=70947,
		npc=193146,
		loot={},
		vignette=5431,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[47805120] = {
		label="Eldoren the Reborn",
		criteria=56147,
		quest=69875,
		npc=193234,
		loot={
			200284, -- Phoenix Feather Pendant
		},
		vignette=5198,
		-- hide_before=MAXLEVEL, -- TODO
	},
	--[[
	[] = {
		label="Riverwalker Tamopo",
		criteria=56148,
		quest=69880,
		npc=193240,
		loot={},
		vignette=5201,
		-- hide_before=MAXLEVEL, -- TODO
	},
	--]]
	[59607012] = {
		label="Broodweaver Araznae",
		criteria=56149,
		quest=69868,
		npc=193220,
		loot={},
		vignette=5193,
		-- hide_before=MAXLEVEL, -- TODO
		-- path=59416977, -- too close to need
	},
	[37387792] = {
		label="Sandana the Tempest",
		criteria=56150,
		quest=69859,
		npc=193176,
		loot={},
		path=38517642,
		vignette=5185,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[50005180] = {
		label="Rokmur",
		criteria=56151,
		quest=69966,
		npc=193666,
		loot={},
		vignette=5238,
		-- hide_before=MAXLEVEL, -- TODO
	},
	[47914980] = {
		label="Woolfang",
		criteria=56152,
		quest=69850,
		npc=193161,
		loot={},
		note="Pet {npc:193156:Wooly Lamb}",
		vignette=5177,
	},
	[46287298] = {
		label="The Weeping Vilomah",
		criteria=56153,
		quest=74086, -- 65365
		npc=183984,
		loot={
			200214, -- Grasp of the Weeping Widow
		},
		note="In cave, talk to {npc:193206:Boomhooch the Lost} to summon",
		path=47537168,
		vignette=4958,
	},
	[52806760] = {
		label="Craggravated Elemental",
		criteria=56154,
		quest=69964,
		npc=193663,
		loot={
			200298, -- Stoneshaped Greatbelt
		},
		vignette=5237,
	},
	[38436824] = {
		label="The Great Shellkhan",
		criteria=56155,
		quest=72121,
		npc=191305,
		loot={
			{200999, toy=true,}, -- The Super Shellkhan Gang
		},
		note="Bring a {item:200949:Case of Fresh Gleamfish} from 45.6, 54.8 in Azure Span",
		vignette=5439,
		route={38436824, 32009999, highlightOnly=true},
	},
	[44806900] = {
		label="Corrupted Proto-Dragon",
		criteria=56156,
		quest=74060, --69962
		npc=193658,
		loot={
			200166, -- Corrupted Drake Horn
		},
		vignette=5235,
		note="Interact with the egg inside the cave",
	},
	[62208180] = {
		label="Lord Epochbrgl",
		criteria=56157,
		quest=69882,
		npc=193241,
		loot={
			200185, -- Grips of the Everflowing Ocean
		},
		vignette=5203,
	},
	[59545917] = {
		label="Ancient Protector",
		criteria=56158,
		quest=74055, -- 69963
		npc=193664,
		loot={},
		vignette=5236,
	},
}, {
	achievement=16679, -- Adventurer
})
core:RegisterHandyNotesData("Dragonflight", THALDRASZUS, {
	[37538339] = {
		label="Private Shikzar. -- despawns without any loot, asks you to help comrades at the South Hold Gate... -- something to remove his debuff first, maybe?",
		quest=70986,
		npc=193127,
		loot={},
		vignette=5406,
		note = "Ask him what's wrong. He attacks after.",
	},
	[36808557] = {
		label="Lookout Mordren",
		quest=72813, -- 69967 on vignette?
		npc=193668,
		loot={
			-- 200122, -- Temporal Spyglass
			200182, -- Riveted Drape
			200292, -- Cragforge Pauldrons
		},
		vignette=5239,
	},
	[37777413] = {
		label="Acrosoth",
		quest=72834, -- 72114
		npc=193243,
		loot={
			{196992, quest=69192}, -- Cliffside Wylderdrake: Heavy Horns
			{197403, quest=69604}, -- Renewed Proto-Drake: Club Tail
			200228, -- Protoscale Pauldrons
		},
		note="Flying nearby",
		route={37777413, 36307560, 36507860, 38407940, 40107780, 39507500, loop=true},
		minimap=true,
		vignette=5436,
	},
	[55797732] = {
		label="Henlare",
		quest=69873, -- 72814
		npc=193229,
		loot={
			200880, -- Wind-Sealet Mana Capsule
		},
		vignette=5196,
	},
	[36737280] = {
		label="Liskron the Dazzling",
		quest=72116, -- 72842
		npc=193273,
		loot={
			{196976, quest=69176}, -- Cliffside Wylderdrake: Head Mane
			200193, -- Manafrond Sandals
			200174, -- Bonesigil Shoulderguards
		},
		vignette=5437,
	},
})

-- Treasures

core:RegisterTreasureData("Dragonflight", {
	[5468] = {
		label="Expedition Scout's Pack",
		loot={
			{192764, mount=1617, note="Renown 25", requires=core.conditions.MajorFaction(FACTION_DRAGONSCALE, 25)}, -- Verdant Skitterfly
			{199061, quest=70527}, -- A Guide to Rare Fish
			{194540, quest=67046}, -- Nokhud Armorer's Notes
			201387, -- Drakonid Stalker's Halberd
			201388, -- Dragonspawn Wingtipped Staff
			201389, -- Wingcrest Battle Staff
			201390, -- Devastating Drakonid Waraxe
			201392, -- Drakonid Striker's Cutlass
			201393, -- Dragonspawn Spellweaver's Focus
			201394, -- Drakonid's Jade Bulwark
			201395, -- Wingcrest Scimitar
			201396, -- Hidepiercing Claw Extensions
		},
		requires=core.conditions.MajorFaction(FACTION_DRAGONSCALE, 2),
	},
}, true)
