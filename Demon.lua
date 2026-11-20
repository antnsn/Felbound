-- The demon card: no demon out (out of combat, not mounted) → click summons the chosen one ("Auto":
-- the Voidwalker once known, else the Imp). A demon of another kind out counts as fine. Says when
-- the summon needs a Soul Shard and there is none.
local _, ns = ...
if ns.disabled then return end
local D = ns.DATA

local function Known(id)
	local ok, k = pcall(IsPlayerSpell, id)
	return ok and not ns.IsSecret(k) and k and true or false
end
local function Count(id)
	local ok, n = pcall(C_Item.GetItemCount, id)
	return (ok and not ns.IsSecret(n) and n) or 0
end

ns.DEMON_CHOICES = { "Auto", "Imp", "Voidwalker", "Succubus", "Felhunter" }

-- the demon to summon: its data entry, or nil when none is known
function ns.ChosenDemon()
	local choice = ns.db.demonChoice
	for _, d in ipairs(D.demons) do
		if d.key == choice and Known(d.spell) then return d end
	end
	for _, key in ipairs({ "Voidwalker", "Imp" }) do
		for _, d in ipairs(D.demons) do if d.key == key and Known(d.spell) then return d end end
	end
	return nil
end

-- what the card says: "summon", "noshard" or nil
function ns.DemonNeed()
	local d = ns.ChosenDemon()
	if not d then return nil end
	local ok, exists = pcall(UnitExists, "pet")
	if ok and not ns.IsSecret(exists) and exists then
		local okDead, dead = pcall(UnitIsDead, "pet")
		if not okDead or ns.IsSecret(dead) or not dead then return nil end
	end
	if d.shard and Count(D.soulShard) == 0 then return "noshard", d end
	return "summon", d
end

local M = {}
ns.modules[#ns.modules + 1] = M
local card, overlay

function M:Update()
	if not card then return end
	if ns.unlocked then
		card:SetTitle("Summon your demon"); card:SetStatus("Click to summon"); card:Show(); card:Glow(false)
		if not InCombatLockdown() then overlay:Sync(nil) end
		return
	end
	local need, d
	if ns.db.demon and not ns.InCombat() and not IsMounted() then need, d = ns.DemonNeed() end
	local spell = d and ns.SpellName(d.spell)
	if need then
		card:SetTitle("Summon your " .. d.key)
		card:SetStatus(need == "noshard" and "No Soul Shard: the Imp needs none" or "Click to summon", need == "noshard")
		card:Show(); card:Glow(true)
	else
		card:Glow(false); card:Hide()
	end
	if not InCombatLockdown() then
		overlay:Sync(need == "summon" and spell or nil, "player", ns.Help.demon)
	end
end

function M:Init()
	card = ns.MakeCard("FelboundDemonFrame")
	card:SetIcon(136218)
	card:SetTitle("Summon your demon")
	card:SetExplain(ns.Help.demon)
	ns.MakeMovable(card, "dmPoint")
	ns.ApplyPoint(card, "dmPoint")
	overlay = ns.CastOverlay(card)
	local f = CreateFrame("Frame")
	for _, e in ipairs({ "UNIT_PET", "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED", "SPELLS_CHANGED",
		"BAG_UPDATE_DELAYED", "PLAYER_MOUNT_DISPLAY_CHANGED", "PLAYER_ENTERING_WORLD" }) do
		f:RegisterEvent(e)
	end
	f:SetScript("OnEvent", function() M:Update() end)
	C_Timer.NewTicker(2, function() M:Update() end)
	M:Update()
end
