-- The stones card: no Healthstone in the bags (once Create Healthstone is known), or no Soulstone
-- (once Create Soulstone is known, when turned on). A click makes the Healthstone first, then the
-- Soulstone (out of combat). And the Soul Shards card: below the threshold. Quiet in combat.
local _, ns = ...
if ns.disabled then return end
local D = ns.DATA

local function Count(id)
	local ok, n = pcall(C_Item.GetItemCount, id)
	return (ok and not ns.IsSecret(n) and n) or 0
end
local function Any(list) for _, id in ipairs(list) do if Count(id) > 0 then return true end end return false end

-- the stone to make next: spell name, label; or nil
function ns.StoneToMake()
	if ns.db.healthstone and not Any(D.healthstones) then
		local id = ns.BestRank(D.createHealthstone)
		if id then return ns.SpellName(id), "Healthstone" end
	end
	if ns.db.soulstone and not Any(D.soulstones) then
		local id = ns.BestRank(D.createSoulstone)
		if id then return ns.SpellName(id), "Soulstone" end
	end
	return nil
end

local M = {}
ns.modules[#ns.modules + 1] = M
local stones, overlay, shards

function M:Update()
	if not stones then return end
	if ns.unlocked then
		stones:SetStatus("Click to make one"); stones:Show(); stones:Glow(false)
		shards:SetStatus("2 left"); shards:Show(); shards:Glow(false)
		if not InCombatLockdown() then overlay:Sync(nil) end
		return
	end
	local quiet = ns.InCombat()
	local spell, label
	if not quiet then spell, label = ns.StoneToMake() end
	local noShard = Count(D.soulShard) == 0
	if spell then
		stones:SetTitle("No " .. label)
		stones:SetStatus(noShard and "Needs a Soul Shard" or "Click to make one", noShard)
		stones:SetExplain(ns.Help[label:lower()])
		stones:Show(); stones:Glow(true)
	else
		stones:Glow(false); stones:Hide()
	end
	if not InCombatLockdown() then
		overlay:Sync(not noShard and spell or nil, "player", label and ns.Help[label:lower()])
	end
	local n = Count(D.soulShard)
	if ns.db.shards and n <= ns.db.shardLow and not quiet and ns.BestRank({ 697 }) then
		shards:SetStatus(n == 0 and "None left" or (n .. " left"), n == 0)
		shards:Show(); shards:Glow(true)
	else
		shards:Glow(false); shards:Hide()
	end
end

function M:Init()
	stones = ns.MakeCard("FelboundStonesFrame")
	stones:SetIcon(135230)
	stones:SetTitle("No Healthstone")
	ns.MakeMovable(stones, "stPoint"); ns.ApplyPoint(stones, "stPoint")
	overlay = ns.CastOverlay(stones)
	shards = ns.MakeCard("FelboundShardsFrame")
	shards:SetIcon(134075)
	shards:SetTitle("Soul Shards")
	shards:SetExplain(ns.Help.shards)
	ns.MakeMovable(shards, "shPoint"); ns.ApplyPoint(shards, "shPoint")
	local f = CreateFrame("Frame")
	for _, e in ipairs({ "BAG_UPDATE_DELAYED", "SPELLS_CHANGED", "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED",
		"PLAYER_ENTERING_WORLD" }) do f:RegisterEvent(e) end
	f:SetScript("OnEvent", function() M:Update() end)
	M:Update()
end
