--@moods: fresh health has noshard soul shards lowshards combat
local T = dofile(wb.dir .. "/tests/_warlock.lua")
local m = wb.mood
T.warlock(({ fresh = { 688 }, health = { 688, 697, 6201 }, has = { 688, 697, 6201 }, noshard = { 688, 6201 },
	soul = { 688, 697, 693 }, shards = { 688, 697 }, lowshards = { 688, 697 }, combat = { 688, 697, 6201 } })[m])
local b = wb.state.bags
b[6265] = ({ lowshards = 1, noshard = 0 })[m] or 5
if m == "has" then b[5512] = 1 end
local db = {}
if m == "soul" then db.soulstone = true; b[5512] = 1 end
wb.login({ saved = { FelboundDB = db } })
if m == "combat" then wb.combat(true) end
wb.advance(3)
local shown, card = wb.shown("FelboundStonesFrame"), wb.frame("FelboundStonesFrame")
if m == "fresh" or m == "has" or m == "shards" or m == "lowshards" or m == "combat" then
	wb.expect("no stones card", shown, false)
else
	wb.expect("stones card", shown, true)
	local want = m == "soul" and "No Soulstone" or "No Healthstone"
	wb.expect("title", card.titleText:GetText(), want)
	if m == "noshard" then
		wb.expect("says a shard is needed", card.statusText:GetText(), "Needs a Soul Shard")
		wb.expect("no cast without a shard", T.macroFor("Create"), nil)
	else
		local spell = m == "soul" and "Create Soulstone (Minor)" or "Create Healthstone (Minor)"
		wb.check(T.macroFor(spell), "a click makes it")
	end
end
local sh = wb.shown("FelboundShardsFrame")
if m == "lowshards" then
	wb.expect("shards card", sh, true)
	wb.expect("count", wb.frame("FelboundShardsFrame").statusText:GetText(), "1 left")
elseif m ~= "noshard" then
	wb.expect("enough shards: no card", sh, false)
end
