local myname, ns = ...

local icon = LibStub("LibDBIcon-1.0", true)

local LibQTip = LibStub("LibQTip-1.0")
local HBD = LibStub("HereBeDragons-2.0")

local core = LibStub("AceAddon-3.0"):GetAddon("SilverDragon")
local module = core:NewModule("LDB", "AceEvent-3.0")

local dataobject, tooltip, db
local rares_seen = {}

local default_help = {
	"Right-click to open settings",
}
if core.debuggable then
	table.insert(default_help, "Shift-right-click to view debug information")
end

function module:OnInitialize()
	self.db = core.db:RegisterNamespace("LDB", {
		profile = {
			minimap = {},
			worldmap = true,
			mounts = true,
			tooltip = "always",
		},
	})
	db = self.db

	self:SetupDataObject()
	self:SetupWorldMap()

	if IsAddOnLoaded("Blizzard_Collections") then
		self:SetupMounts()
	else
		self:RegisterEvent("ADDON_LOADED")
	end

	local config = core:GetModule("Config", true)
	if config then
		config.options.plugins.broker = {
			broker = {
				type = "group",
				name = "Icon",
				order = 91,
				args = {
					show_lastseen = {
						type = "toggle",
						name = "Show last seen rare",
						desc = "Toggle showing or hiding the last seen rare as the dataobject's text",
						get = function() return db.profile.show_lastseen end,
						set = function(info, v)
							db.profile.show_lastseen = v
							if v then
								if module.last_seen then
									dataobject.text = core:GetMobLabel(module.last_seen)
								else
									dataobject.text = "None"
								end
							else
								dataobject.text = ""
							end
						end,
						order = 10,
						width = "full",
						descStyle = "inline",
					},
					minimap = {
						type = "toggle",
						name = "Show minimap icon",
						desc = "Toggle showing or hiding the minimap icon.",
						get = function() return not db.profile.minimap.hide end,
						set = function(info, v)
							local hide = not v
							db.profile.minimap.hide = hide
							if hide then
								icon:Hide("SilverDragon")
							else
								icon:Show("SilverDragon")
							end
						end,
						order = 30,
						width = "full",
						descStyle = "inline",
						hidden = function() return not icon or not dataobject or not icon:IsRegistered("SilverDragon") end,
					},
					tooltip = {
						type = "select",
						name = "Show tooltip",
						values = {
							always = "Always",
							outofcombat = "Out of Combat",
							never = "Never",
						},
						get = function() return db.profile.tooltip end,
						set = function(info, v)
							db.profile.tooltip = v
						end,
						order = 35,
					},
					worldmap = {
						type = "toggle",
						name = "Show on the world map",
						desc = "Toggle showing the icon in the world map's header",
						get = function() return db.profile.worldmap end,
						set = function(info, v)
							db.profile.worldmap = v
							module.worldmap[v and "Show" or "Hide"](module.worldmap)
						end,
						order = 40,
						width = "full",
						descStyle = "inline",
					},
					mounts = {
						type = "toggle",
						name = "Show on the mount list",
						desc = "Toggle showing the icon in the map list",
						get = function() return db.profile.mounts end,
						set = function(info, v)
							db.profile.mounts = v
							if module.mounts then
								module.mounts[v and "Show" or "Hide"](module.mounts)
							end
						end,
						order = 40,
						width = "full",
						descStyle = "inline",
					},
				},
			},
		}
	end
end

function module:ADDON_LOADED(event, addon)
	if addon ~= "Blizzard_Collections" then
		return
	end
	self:SetupMounts()
	self:UnregisterEvent("ADDON_LOADED")
end

function module:SetupDataObject()
	dataobject = LibStub("LibDataBroker-1.1"):NewDataObject("SilverDragon", {
		type = "data source",
		icon = "Interface\\Icons\\INV_Misc_Head_Dragon_01",
		label = "Rares",
		text = "",
	})

	local tooltip_options = {
		nearby = true,
		recent = true,
		help = true,
	}
	function dataobject:OnEnter()
		if (not tooltip or not tooltip:IsShown()) then
			if module.db.profile.tooltip == "never" then return end
			if module.db.profile.tooltip == "outofcombat" and InCombatLockdown() then return end
			tooltip_options.nearby = HBD:GetPlayerZone()
			module:ShowTooltip(self, tooltip_options)
		end
	end

	function dataobject:OnLeave()
		-- we rely on libqtip's autohide
	end

	function dataobject:OnClick(button)
		if button ~= "RightButton" then
			return
		end
		if IsShiftKeyDown() then
			core:ShowDebugWindow()
		else
			local config = core:GetModule("Config", true)
			if config then
				config:ShowConfig()
				if tooltip and tooltip.SDOptions.config_path then
					LibStub("AceConfigDialog-3.0"):SelectGroup("SilverDragon", unpack(tooltip.SDOptions.config_path))
				end
			end
		end
	end

	core.RegisterCallback("LDB", "Seen", function(callback, id, zone, x, y, dead, source)
		module.last_seen = id
		if db.profile.show_lastseen then
			dataobject.text = core:GetMobLabel(id)
		end
		table.insert(rares_seen, {
			id = id,
			zone = zone,
			x = x,
			y = y,
			source = source,
			when = time(),
		})
	end)

	if icon then
		icon:Register("SilverDragon", dataobject, self.db.profile.minimap)
	end
	if db.profile.show_lastseen then
		dataobject.text = "None"
	end
end

function module:SetupWorldMap()
	local button = CreateFrame("Button", nil, WorldMapFrame.NavBar)
	button:SetSize(20, 20)
	button:SetPoint("RIGHT", -4, 0)
	button:RegisterForClicks("AnyUp")
	button.texture = button:CreateTexture(nil, "ARTWORK")
	button.texture:SetTexture("Interface\\Icons\\INV_Misc_Head_Dragon_01")
	button.texture:SetAllPoints()
	local button_options = {
		help = true,
	}
	button:SetScript("OnEnter", function()
		local overlay = core:GetModule("Overlay", true)
		if overlay and not button_options.config_path then
			button_options.config_path = {'overlay'}
			button_options.help = {"Click to toggle map icons"}
			tAppendAll(button_options.help, default_help)
		end
		button_options.nearby = WorldMapFrame.mapID
		module:ShowTooltip(button, button_options)
	end)
	-- onleave is handled by the tooltip's autohide
	button:SetScript("OnClick", function(self, mButton)
		local overlay = core:GetModule("Overlay", true)
		if overlay and mButton == "LeftButton" and not IsModifierKeyDown() then
			overlay.db.profile.worldmap.enabled = not overlay.db.profile.worldmap.enabled
			overlay:UpdateWorldMapIcons()
			return
		end
		dataobject.OnClick(self, mButton)
	end)
	module.worldmap = button
	if not db.profile.worldmap then
		button:Hide()
	end
end

function module:SetupMounts()
	local list = {}
	for source, data in pairs(core.datasources) do
		if core.db.global.datasources[source] then
			for id, mobdata in pairs(data) do
				if ns.Loot.HasMounts(id) and not core:ShouldIgnoreMob(id) then
					table.insert(list, id)
				end
			end
		end
	end
	local button_options = {
		custom = list,
		help = true,
	}
	local button = CreateFrame("Button", nil, MountJournal.MountCount)
	button:SetSize(20, 20)
	button:SetPoint("LEFT", MountJournal.MountCount, "RIGHT", 4, 0)
	button:RegisterForClicks("AnyUp")
	button.texture = button:CreateTexture(nil, "ARTWORK")
	button.texture:SetTexture("Interface\\Icons\\INV_Misc_Head_Dragon_01")
	button.texture:SetAllPoints()
	button:SetScript("OnEnter", function()
		module:ShowTooltip(button, button_options)
	end)
	-- onleave is handled by the tooltip's autohide
	button:SetScript("OnClick", dataobject.OnClick)
	module.mounts = button
	if not db.profile.mounts then
		button:Hide()
	end
end

do
	local TextureCellProvider, TextureCellPrototype = LibQTip:CreateCellProvider()
	function TextureCellPrototype:InitializeCell()
		if not self.texture then
			self.texture = self:CreateTexture(nil, 'ARTWORK')
			self.texture:SetSize(20, 18)
			self.texture:SetPoint("CENTER", self)
			self.texture:Show()
		end
	end
	function TextureCellPrototype:SetupCell(parent, value, ...)
		self:SetupTexture(value)
		return self.texture:GetSize()
	end
	function TextureCellPrototype:SetupTexture()
		if self.atlas then
			self.texture:SetAtlas(self.atlas)
		end
	end
	function TextureCellPrototype:ReleaseCell()
	end
	function TextureCellPrototype:getContentHeight()
		return self.texture:GetHeight()
	end
	local CompletableCellProvider, CompletableCellPrototype = LibQTip:CreateCellProvider(TextureCellProvider)
	function CompletableCellPrototype:InitializeCell()
		TextureCellPrototype.InitializeCell(self)
		if not self.completionTexture then
			self.completionTexture = self:CreateTexture(nil, "OVERLAY")
			self.completionTexture:SetAtlas("Tracker-Check", true)
			self.completionTexture:SetPoint("CENTER", self)
			self.completionTexture:Hide()
		end
	end
	function CompletableCellPrototype:SetupCell(parent, value, ...)
		self:SetupCompletion(value)
		return TextureCellPrototype.SetupCell(self, parent, value, ...)
	end
	function CompletableCellPrototype:SetupCompletion(value)
		if self.completion_function then
			value = self.completion_function(value)
		end
		if value then
			self.completionTexture:Show()
		else
			self.completionTexture:Hide()
		end
	end

	local ItemsCellProvider, ItemsCellPrototype = LibQTip:CreateCellProvider(TextureCellProvider)
	ItemsCellPrototype.atlas = "banker"
	local TameableCellProvider, TameableCellPrototype = LibQTip:CreateCellProvider(TextureCellProvider)
	function TameableCellPrototype:SetupTexture()
		-- ClassHall-Circle-Hunter? classicon-hunter? groupfinder-icon-class-hunter? GarrMission_ClassIcon-Hunter? GarrMission_ClassIcon-Hunter-BeastMastery? ClassTrial-Hunter-Ring?
		-- Interface\\RaidFrame\\UI-RaidFrame-Pets
		self.texture:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
		self.texture:SetTexCoord(unpack(CLASS_ICON_TCOORDS["HUNTER"]))
	end
	local AchievementCellProvider, AchievementCellPrototype = LibQTip:CreateCellProvider(CompletableCellProvider)
	AchievementCellPrototype.atlas = "storyheader-cheevoicon"
	local QuestCellProvider, QuestCellPrototype = LibQTip:CreateCellProvider(CompletableCellProvider)
	QuestCellPrototype.atlas = "QuestNormal"
	local MountCellProvider, MountCellPrototype = LibQTip:CreateCellProvider(CompletableCellProvider)
	MountCellPrototype.atlas = "StableMaster"
	MountCellPrototype.completion_function = ns.Loot.Status.Mount
	local ToyCellProvider, ToyCellPrototype = LibQTip:CreateCellProvider(CompletableCellProvider)
	ToyCellPrototype.atlas = "mechagon-projects"
	ToyCellPrototype.completion_function = ns.Loot.Status.Toy
	local PetCellProvider, PetCellPrototype = LibQTip:CreateCellProvider(CompletableCellProvider)
	PetCellPrototype.atlas = "WildBattlePetCapturable"
	PetCellPrototype.completion_function = ns.Loot.Status.Pet

	local function hide_subtooltip()
		tooltip:SetFrameStrata("TOOLTIP")
		GameTooltip:Hide()
	end

	local function mob_click(cell, mobid, button)
		if button ~= "LeftButton" then return end
		local zone, x, y = core:GetClosestLocationForMob(mobid)
		if IsControlKeyDown() then
			if zone and x and y then
				core:GetModule("TomTom"):PointTo(mobid, zone, x, y, 0, true)
			end
			return
		end
		if IsShiftKeyDown() then
			if zone and x and y then
				core:GetModule("ClickTarget"):SendLinkToMob(mobid, zone, x, y)
			end
			return
		end
		core.events:Fire("BrokerMobClick", mobid)
		OpenWorldMap(zone)
	end

	local function show_loot_tooltip(cell, mobid, only)
		tooltip:SetFrameStrata("DIALOG")
		-- GameTooltip_SetDefaultAnchor(GameTooltip, cell)
		GameTooltip:SetOwner(cell, cell:GetCenter() > UIParent:GetCenter() and "ANCHOR_LEFT" or "ANCHOR_RIGHT")
		ns.Loot.Details.UpdateTooltip(GameTooltip, mobid, only)
		GameTooltip:Show()
	end
	local function show_mount_tooltip(cell, mobid) return show_loot_tooltip(cell, mobid, "mount") end
	local function show_toy_tooltip(cell, mobid) return show_loot_tooltip(cell, mobid, "toy") end
	local function show_pet_tooltip(cell, mobid) return show_loot_tooltip(cell, mobid, "pet") end
	local show_items_tooltip, hide_items_tooltip, click_items_tooltip
	do
		local lootwindow
		local function cleanup_lootwindow(window)
			lootwindow = nil
		end
		function show_items_tooltip(cell, mobid)
			if lootwindow then
				ns.Loot.Window.Release(lootwindow)
			end
			lootwindow = ns.Loot.Window.ShowForMob(mobid)
			-- lootwindow:SetParent(cell)
			lootwindow:SetFrameStrata(cell:GetFrameStrata())
			lootwindow:SetFrameLevel(cell:GetFrameLevel() + 1)
			if cell:GetCenter() > UIParent:GetCenter() then
				lootwindow:SetPoint("TOPRIGHT", cell, "BOTTOMLEFT")
			else
				lootwindow:SetPoint("TOPLEFT", cell, "BOTTOMRIGHT")
			end
			lootwindow:SetAutoHideDelay(0.25, cell, cleanup_lootwindow)
		end
		function click_items_tooltip(cell, mobid)
			if lootwindow then
				ns.Loot.Window.Release(lootwindow)
				lootwindow = nil
			end
			ns.Loot.Window.ShowForMob(mobid, true)
		end
	end
	local function show_achievement_tooltip(cell, mobid)
		local achievementid = ns:AchievementMobStatus(mobid)

		tooltip:SetFrameStrata("DIALOG")
		GameTooltip:SetOwner(cell, cell:GetCenter() > UIParent:GetCenter() and "ANCHOR_LEFT" or "ANCHOR_RIGHT")
		GameTooltip:SetHyperlink(GetAchievementLink(achievementid))
		GameTooltip:Show()
	end
	local locations = {}
	local function show_mob_tooltip(cell, mobid)
		tooltip:SetFrameStrata("DIALOG")
		GameTooltip:SetOwner(cell, cell:GetCenter() > UIParent:GetCenter() and "ANCHOR_LEFT" or "ANCHOR_RIGHT")
		GameTooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(mobid))
		if ns.mobdb[mobid] then
			if ns.mobdb[mobid].notes then
				GameTooltip:AddLine(ns.mobdb[mobid].notes)
			end
			for zone, coords in pairs(ns.mobdb[mobid].locations or {}) do
				if #coords == 1 then
					local x, y = core:GetXY(coords[1])
					GameTooltip:AddDoubleLine(core.zone_names[zone], ("%.1f, %.1f"):format(x * 100, y * 100))
				else
					wipe(locations)
					for i, coord in ipairs(coords) do
						local x, y = core:GetXY(coord)
						table.insert(locations, ("[%.1f, %.1f]"):format(x * 100, y * 100))
					end
					GameTooltip:AddLine((SUBTITLE_FORMAT):format(core.zone_names[zone], (", "):join(unpack(locations))), nil, nil, nil, true)
				end
			end
		end
		core:GetModule("Tooltip"):UpdateTooltip(mobid, true, true)
		GameTooltip:AddLine("Left-click to focus on the map", 0, 1, 1)
		GameTooltip:AddLine("Control-click to set a waypoint", 0, 1, 1)
		GameTooltip:AddLine("Shift-click to link location in chat", 0, 1, 1)
		GameTooltip:Show()

		core.events:Fire("BrokerMobEnter", mobid)
	end
	local function mob_leave(cell, mobid)
		hide_subtooltip()
		core.events:Fire("BrokerMobLeave", mobid)
	end

	local function mob_sorter(aid, bid)
		local aname = core:NameForMob(aid)
		local bname = core:NameForMob(bid)
		if not aname or not bname then
			return false
		end
		return tostring(aname):lower() < tostring(bname):lower()
	end

	local sorted_mobs = {}

	function module:ShowTooltip(parent, options)
		if not core.db then
			return
		end

		if not tooltip then
			tooltip = LibQTip:Acquire("SilverDragonTooltip", 10, "LEFT", "CENTER", "RIGHT", "CENTER", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT")
			tooltip:SetAutoHideDelay(0.25, parent)
			tooltip:SmartAnchorTo(parent)
			tooltip.OnRelease = function() tooltip = nil end
		end

		tooltip:Clear()
		wipe(sorted_mobs)

		tooltip.SDOptions = options

		local zone = options.nearby
		if zone and ns.mobsByZone[zone] then
			for id in pairs(ns.mobsByZone[zone]) do
				if core:IsMobInPhase(id, zone) and not core:ShouldIgnoreMob(id, zone) then
					table.insert(sorted_mobs, id)
				end
			end
			if options.recent then
				tooltip:AddHeader("Nearby")
			end
		end

		if options.custom then
			for _, id in ipairs(options.custom) do
				table.insert(sorted_mobs, id);
			end
		end

		if #sorted_mobs > 0 then
			tooltip:AddHeader("Name", "Count", "Last Seen")

			table.sort(sorted_mobs, mob_sorter)

			local notes = CreateAtlasMarkup("poi-workorders")

			for _, id in ipairs(sorted_mobs) do
				ns.Loot.Cache(id)
				local name, questid, vignette, tameable, last_seen, times_seen = core:GetMobInfo(id)
				local label = core:GetMobLabel(id)
				local index, col = tooltip:AddLine(
					(ns.mobdb[id] and ns.mobdb[id].notes) and (label .. " " .. notes) or label,
					times_seen,
					core:FormatLastSeen(last_seen)
				)
				tooltip:SetCellScript(index, 1, "OnMouseUp", mob_click, id)
				tooltip:SetCellScript(index, 1, "OnEnter", show_mob_tooltip, id)
				tooltip:SetCellScript(index, 1, "OnLeave", mob_leave, id)
				if tameable then
					index, col = tooltip:SetCell(index, col, id, TameableCellProvider)
				else
					index, col = tooltip:SetCell(index, col, '')
				end
				if ns.Loot.HasMounts(id) then
					index, col = tooltip:SetCell(index, col, id, MountCellProvider)
					tooltip:SetCellScript(index, col - 1, "OnEnter", show_mount_tooltip, id)
					tooltip:SetCellScript(index, col - 1, "OnLeave", hide_subtooltip)
				else
					index, col = tooltip:SetCell(index, col, '')
				end
				if ns.Loot.HasToys(id) then
					index, col = tooltip:SetCell(index, col, id, ToyCellProvider)
					tooltip:SetCellScript(index, col -1, "OnEnter", show_toy_tooltip, id)
					tooltip:SetCellScript(index, col -1, "OnLeave", hide_subtooltip)
				else
					index, col = tooltip:SetCell(index, col, '')
				end
				if ns.Loot.HasPets(id) then
					index, col = tooltip:SetCell(index, col, id, PetCellProvider)
					tooltip:SetCellScript(index, col - 1, "OnEnter", show_pet_tooltip, id)
					tooltip:SetCellScript(index, col - 1, "OnLeave", hide_subtooltip)
				else
					index, col = tooltip:SetCell(index, col, '')
				end
				if ns.Loot.HasRegularLoot(id) then
					index, col = tooltip:SetCell(index, col, id, ItemsCellProvider)
					tooltip:SetCellScript(index, col - 1, "OnMouseUp", click_items_tooltip, id)
					tooltip:SetCellScript(index, col - 1, "OnEnter", show_items_tooltip, id)
					-- tooltip:SetCellScript(index, col - 1, "OnLeave", hide_items_tooltip)
				else
					index, col = tooltip:SetCell(index, col, '')
				end
				local quest, achievement = ns:CompletionStatus(id)
				if quest ~= nil or achievement ~= nil then
					if achievement ~= nil then
						index, col = tooltip:SetCell(index, col, achievement, AchievementCellProvider)
						tooltip:SetCellScript(index, col - 1, "OnEnter", show_achievement_tooltip, id)
						tooltip:SetCellScript(index, col - 1, "OnLeave", hide_subtooltip)
					else
						index, col = tooltip:SetCell(index, col, '')
					end
					if quest ~= nil then
						index, col = tooltip:SetCell(index, col, quest, QuestCellProvider)
					else
						index, col = tooltip:SetCell(index, col, '')
					end
					if quest or achievement then
						if (quest and achievement) or (quest == nil or achievement == nil) then
							-- full completion
							tooltip:SetLineColor(index, 0.33, 1, 0.33) -- green
						else
							-- partial completion
							tooltip:SetLineColor(index, 1, 1, 0.33) -- yellow
						end
					else
						tooltip:SetLineColor(index, 1, 0.33, 0.33) -- red
					end
				end
			end
			if #sorted_mobs == 0 then
				tooltip:AddLine(NONE)
			end
		elseif options.nearby then
			tooltip:AddLine(NONE)
		end

		if options.recent then
			if #rares_seen > 0 then
				if options.nearby then
					tooltip:AddHeader("Seen this session")
				end
				tooltip:AddHeader("Name", "Zone", "Coords", "When", "Source")
				for i,rare in ipairs(rares_seen) do
					tooltip:AddLine(
						core:GetMobLabel(rare.id) or core:NameForMob(rare.id) or UNKNOWN,
						core.zone_names[rare.zone] or UNKNOWN,
						(rare.x and rare.y) and (core.round(rare.x * 100, 1) .. ', ' .. core.round(rare.y * 100, 1)) or UNKNOWN,
						core:FormatLastSeen(rare.when),
						rare.source or UNKNOWN
					)
				end
			else
				tooltip:AddHeader("None seen this session")
			end
		end

		if options.help then
			tooltip:AddSeparator()
			local index
			for _, line in ipairs(type(options.help) == "table" and options.help or default_help) do
				index = tooltip:AddLine(line)
				tooltip:SetLineTextColor(index, 0, 1, 1)
			end
		end

		tooltip:UpdateScrolling()
		tooltip:Show()
	end
end
