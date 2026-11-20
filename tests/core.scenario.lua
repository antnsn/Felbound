--@moods: warlock mage
local T = dofile(wb.dir .. "/tests/_warlock.lua")
if wb.mood == "warlock" then
	T.warlock({ 688 })
	wb.login()
	wb.advance(7)
	wb.slash("/fel")
	wb.check(wb.shown("FelboundOptions"), "/fel opens the options")
	local titles = {}
	for _, p in ipairs(wb.ns.optionsState.pages) do titles[#titles + 1] = p.title end
	wb.expect("pages", table.concat(titles, ", "), "Demon & armor, Stones & shards, Travel, Extras, Skin")
else
	wb.state.player.classFile, wb.state.player.class = "MAGE", "Mage"
	wb.login()
	wb.slash("/fel")
	wb.check(wb.printed("only does something on a warlock"), "a mage is told why")
end
