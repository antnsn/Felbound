-- The travel panel (LibBound) beside the game menu: Ritual of Summoning, Unending Breath, the
-- Hearthstone.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")

local function Known(id)
	local ok, k = pcall(IsPlayerSpell, id)
	return ok and not ns.IsSecret(k) and k and true or false
end

local ROWS = {
	{ key = "ritualOfSummoning", label = "Ritual of Summoning", level = 20, help = "ritual" },
	{ key = "unendingBreath", label = "Unending Breath", level = 16, help = "unendingBreath" },
}
function ns.TravelRows()
	local out = {}
	for _, r in ipairs(ROWS) do
		local id = ns.DATA[r.key]
		out[#out + 1] = { spell = id, label = r.label, column = 1, known = Known(id), level = r.level,
			tip = r.label, help = ns.Help[r.help], learn = "from a warlock trainer" }
	end
	return out
end

Bound.InstallTravel(ns, { columns = { "WARLOCK" }, rows = ns.TravelRows, hearthHelp = ns.Help.hearthstone })
