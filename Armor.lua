-- The armor card (LibBound buff timer): Demon Armor, or Demon Skin before it is learned.
local _, ns = ...
if ns.disabled then return end
local D = ns.DATA

local function ArmorSpell()
	local id = ns.BestRank(D.demonArmor) or ns.BestRank(D.demonSkin)
	return id and ns.SpellName(id)
end
ns.ArmorSpell = ArmorSpell

ns.MakeBuffTimer({
	key = "armor", point = "arPoint", frameName = "FelboundArmorFrame",
	label = "Demon Armor", icon = 136185,
	title = function() return ArmorSpell() or "Demon Armor" end,
	names = function()
		return { ns.SpellName(D.demonArmor[1]) or "Demon Armor", ns.SpellName(D.demonSkin[1]) or "Demon Skin" }
	end,
	active = function() return ArmorSpell() ~= nil end,
	cast = ArmorSpell,
	explain = ns.Help.armor,
	goneText = "Missing: click to cast",
})
