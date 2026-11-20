-- shared setup: a warlock with the given spells known (loaded with dofile)
local M = {}
local NAMES = {
	[688] = "Summon Imp", [697] = "Summon Voidwalker", [712] = "Summon Succubus", [691] = "Summon Felhunter",
	[687] = "Demon Skin", [696] = "Demon Skin", [706] = "Demon Armor", [1086] = "Demon Armor",
	[6201] = "Create Healthstone (Minor)", [6202] = "Create Healthstone (Lesser)", [693] = "Create Soulstone (Minor)",
	[698] = "Ritual of Summoning", [5697] = "Unending Breath", [429959] = "Well-Rested",
}
function M.warlock(known)
	local s = wb.state
	s.player.classFile, s.player.class, s.player.classId = "WARLOCK", "Warlock", 9
	for id, n in pairs(NAMES) do s.spells[id] = n; s.known[id] = false end
	for _, id in ipairs(known or {}) do s.known[id] = nil end
	s.known[429959] = nil
end
function M.macroFor(text)
	for _, f in ipairs(wb.frames()) do
		local m = f:GetAttribute("macrotext")
		if m and f.__shown and m:find(text, 1, true) then return f end
	end
end
return M
