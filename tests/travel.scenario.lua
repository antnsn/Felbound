--@moods: low ritual
local T = dofile(wb.dir .. "/tests/_warlock.lua")
T.warlock(wb.mood == "ritual" and { 698, 5697 } or {})
wb.state.bags[6948] = 1
wb.login()
wb.advance(2)
wb.openGameMenu()
wb.expect("panel with the menu", wb.shown("FelboundTravel"), true)
local rows = wb.ns.TravelRows()
wb.expect("Ritual first", rows[1].label, "Ritual of Summoning")
wb.expect("then Unending Breath", rows[2].label, "Unending Breath")
wb.expect("known", rows[1].known, wb.mood == "ritual")
