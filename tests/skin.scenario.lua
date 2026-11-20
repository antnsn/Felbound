--@moods: fel blizzard flat
local T = dofile(wb.dir .. "/tests/_warlock.lua")
T.warlock({ 688 })
wb.login({ saved = { FelboundDB = { skin = wb.mood } } })
wb.advance(3)
local want = ({ fel = "Fel", blizzard = "Blizzard", flat = "Flat" })[wb.mood]
wb.expect("active skin", wb.ns.UI.Active().name, want)
wb.check(wb.shown("FelboundDemonFrame"), "a card builds in this skin")
wb.slash("/fel")
wb.check(wb.shown("FelboundOptions"), "the options build in this skin")
