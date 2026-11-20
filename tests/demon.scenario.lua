--@moods: fresh imp voidwalker noshard out other dead combat mounted
local T = dofile(wb.dir .. "/tests/_warlock.lua")
local m = wb.mood
local known = ({ fresh = {}, imp = { 688 }, voidwalker = { 688, 697 }, noshard = { 688, 697 }, out = { 688, 697 },
	other = { 688, 697 }, dead = { 688 }, combat = { 688 }, mounted = { 688 } })[m]
T.warlock(known)
local s = wb.state
if m ~= "noshard" then s.bags[6265] = 4 end
if m == "out" then s.pet = { name = "Voidwalker", family = "Voidwalker" } end
if m == "other" then s.pet = { name = "Imp", family = "Imp" } end
if m == "dead" then s.pet = { name = "Imp", family = "Imp", dead = true } end
wb.login()
if m == "combat" then wb.combat(true) end
if m == "mounted" then wb.mount(true) end
wb.advance(3)
local shown = wb.shown("FelboundDemonFrame")
local card = wb.frame("FelboundDemonFrame")
if m == "fresh" or m == "out" or m == "other" or m == "combat" or m == "mounted" then
	wb.expect("no demon card", shown, false)
else
	wb.expect("demon card", shown, true)
	local who = ({ imp = "Imp", voidwalker = "Voidwalker", noshard = "Voidwalker", dead = "Imp" })[m]
	wb.expect("names the demon", card.titleText:GetText(), "Summon your " .. who)
	if m == "noshard" then
		wb.check(card.statusText:GetText():find("No Soul Shard", 1, true), "says the shard is missing")
		wb.expect("no cast without a shard", T.macroFor("Summon"), nil)
	else
		wb.check(T.macroFor("Summon " .. who), "a click summons it")
	end
end
