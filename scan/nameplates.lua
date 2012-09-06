local core = LibStub("AceAddon-3.0"):GetAddon("SilverDragon")
local module = core:NewModule("Scan_Nameplates", "AceEvent-3.0")

local globaldb
function module:OnInitialize()
	globaldb = core.db.global
	core.RegisterCallback(self, "Scan")
end

local nameplates = {}
local function process_possible_nameplate(frame)
	-- This was mostly copied from "Nameplates - Nameplate Modifications" by Biozera.
	-- Nameplates are unnamed children of WorldFrame.
	-- So: drop it if it's not the right type, has a name, or we already know about it.
	if frame:GetObjectType() ~= "Frame" or frame:GetName() or nameplates[frame] then
		return
	end
	local name, level, bar, icon, border, glow
	for i=1,frame:GetNumRegions(),1 do
		local region = select(i, frame:GetRegions())
		if region then
			local oType = region:GetObjectType()
			if oType == "FontString" then
				local point, _, relativePoint = region:GetPoint()
				if point == "BOTTOM" and relativePoint == "CENTER" then
					name = region
				elseif point == "CENTER" and relativePoint == "BOTTOMRIGHT" then
					level = region
				end
			elseif oType == "Texture" then
				local path = region:GetTexture()
				if path == "Interface\\TargetingFrame\\UI-RaidTargetingIcons" then
					icon = region
				elseif path == "Interface\\Tooltips\\Nameplate-Border" then
					border = region
				elseif path == "Interface\\Tooltips\\Nameplate-Glow" then
					glow = region
				end
			end
		end
	end
	for i=1,frame:GetNumChildren(),1 do
		local childFrame = select(i, frame:GetChildren())
		if childFrame:GetObjectType() == "StatusBar" then
			bar = childFrame
		end
	end
	if name and level and bar and border and glow then -- We have a nameplate!
		nameplates[frame] = {name = name, level = level, bar = bar, border = border, glow = glow}
		return true
	end
end

local num_worldchildren
function module:Scan(callback, zone)
	if not core.db.profile.nameplates then
		return
	end
	if GetCVar("nameplateShowEnemies") ~= "1" then
		return
	end
	if num_worldchildren ~= WorldFrame:GetNumChildren() then
		num_worldchildren = WorldFrame:GetNumChildren()
		for i=1, num_worldchildren, 1 do
			process_possible_nameplate(select(i, WorldFrame:GetChildren()))
		end
	end
	
	local zone_mobs = globaldb.mobs_byzone[zone]
	if not zone_mobs then return end
	for nameplate, regions in pairs(nameplates) do
		local name = regions.name:GetText()
		if nameplate:IsVisible() and zone_mobs[name] and (not lastseen[name] or (lastseen[name] < (time() - core.db.profile.delay))) then
			local current_zone, x, y = core:GetPlayerLocation()
			core:NotifyMob(current_zone, name, x, y, false, false, "nameplate", false)
			break -- it's pretty unlikely there'll be two rares on screen at once
		end
	end
end
