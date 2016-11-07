local core = LibStub("AceAddon-3.0"):GetAddon("SilverDragon")
local module = core:NewModule("Scan_Vignettes", "AceEvent-3.0", "AceConsole-3.0")
local Debug = core.Debug

local HBD = LibStub("HereBeDragons-1.0")

local globaldb
function module:OnInitialize()
	globaldb = core.db.global

	self.db = core.db:RegisterNamespace("Scan_Vignettes", {
		profile = {
			enabled = true,
			location = false,
			pointsofinterest = true,
		},
	})

	local config = core:GetModule("Config", true)
	if config then
		config.options.args.scanning.plugins.vignettes = {
			vignettes = {
				type = "group",
				name = "Vignettes",
				get = function(info) return self.db.profile[info[#info]] end,
				set = function(info, v) self.db.profile[info[#info]] = v end,
				args = {
					enabled = config.toggle("Enabled", "Scan minimap vignettes (it's what Blizzard calls them, okay?)", 10),
					location = config.toggle("Record location on vignette appearance", "Record the mob's location when the vignette triggers for it. If this isn't set, it'll wait until you target it and are within interaction range to store the location.", 30),
					pointsofinterest = config.toggle("Show alerts for point of interest vignettes added to world map itself")
				},
			},
		}
	end
end

function module:OnEnable()
	self:RegisterEvent("VIGNETTE_ADDED")
	self:RegisterEvent("WORLD_MAP_UPDATE")
end

function module:WorkOutMobFromVignette(name, ...)
	if core.vignetteMobLookup[name] then
		return self:NotifyForMobs(core.vignetteMobLookup[name], ...)
	end
	local questid = core:IdForQuest(name)
	if questid and core.questMobLookup[questid] then
		return self:NotifyForMobs(core.questMobLookup[questid], ...)
	end
	local mobid = core:IdForMob(name)
	if mobid then
		return self:NotifyIfNeeded(mobid, ...)
	end
end
function module:NotifyForMobs(mobs, ...)
	for mobid in pairs(mobs) do
		self:NotifyIfNeeded(mobid, ...)
	end
end

local already_notified = {}
function module:VIGNETTE_ADDED(event, instanceid, mysterious_number, ...)
	Debug("VIGNETTE_ADDED", instanceid, mysterious_number, ...)
	if not instanceid then
		-- ...just in case
		Debug("No Vignette instanceid")
		return
	end
	if already_notified[instanceid] then
		Debug("Skipping notify", "already done", id)
		return
	end
	already_notified[instanceid] = true
	local x, y, name, iconid = C_Vignettes.GetVignetteInfoFromInstanceID(instanceid)
	-- iconid seems to be 40:chests, 41:mobs, 4733:star (most Legion stuff)
	if not name then
		Debug("Vignette instanceid bug hit", instanceid)
		return
	end
	self:WorkOutMobFromVignette(name)
end

local GetNumMapLandmarks = GetNumMapLandmarks
local GetMapLandmarkInfo = GetMapLandmarkInfo
function module:WORLD_MAP_UPDATE(event)
	if not self.db.profile.pointsofinterest then return end
	-- local poiCount = GetNumMapLandmarks()
	for i=1, NUM_WORLDMAP_POIS do
		local name, description, texture_index, x, y = GetMapLandmarkInfo(i)
		if name and texture_index ~= 197 then
			self:WorkOutMobFromVignette(name, x, y, "point-of-interest")
		end
	end
end

function module:NotifyIfNeeded(id, x, y, variant)
	local current_zone
	local force = true
	if x and y then
		--Triggered by map update, vignette has exact location that does not match player, so update x, y
		current_zone = HBD:GetPlayerZone()
		force = false
	else
		x, y, current_zone = HBD:GetPlayerZonePosition()
	end
	if not (current_zone and x and y) then
		return
	end
	core:NotifyForMob(id, current_zone, x, y, false, variant or "vignette", false, nil, force)
end
