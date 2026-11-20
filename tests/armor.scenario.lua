--@moods: fresh skin armor up
local T = dofile(wb.dir .. "/tests/_warlock.lua")
local m = wb.mood
T.warlock(({ fresh = {}, skin = { 687 }, armor = { 687, 706 }, up = { 687, 706 } })[m])
if m == "up" then wb.state.auras.player = { wb.aura("Demon Armor", 706, 1800) } end
wb.login()
wb.advance(7)
local shown = wb.shown("FelboundArmorFrame")
if m == "fresh" or m == "up" then
	wb.expect("no armor card", shown, false)
else
	wb.expect("armor card", shown, true)
	local want = m == "skin" and "Demon Skin" or "Demon Armor"
	wb.expect("title", wb.frame("FelboundArmorFrame").titleText:GetText(), want)
end
