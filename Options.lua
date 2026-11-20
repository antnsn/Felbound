-- Felbound's option pages; LibBound adds Extras and Skin, and builds the window.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")

local function DemonPage(UI)
	local p = UI.NewPage("Demon & armor", "Your demon and your armor. Click a card to cast (out of combat).")
	local W = UI.CONTENT_W
	p:Add(select(2, UI.DBToggle(p, 0, p.y, W, "demon", "Remind me to summon my demon")) + 6)
	p:Add(select(2, UI.Cycle(p, p.y, "Demon to summon", ns.DEMON_CHOICES,
		function() return ns.db.demonChoice end,
		function(v) ns.db.demonChoice = v end,
		function() local d = ns.ChosenDemon() return d and ("Now: " .. d.key) or "No demon learned yet." end)) + 10)
	p:Add(UI.Section(p, p.y, "Demon Armor") + 2)
	local third = math.floor(W / 3)
	UI.DBToggle(p, 0, p.y, third, "armor", "Show")
	UI.DBToggle(p, third, p.y, third, "armorSound", "Sound")
	UI.DBToggle(p, third * 2, p.y, third, "armorKeep", "When missing", nil, function() ns.UpdateBuffTimers() end)
	p:Add(32)
	p:Add(select(2, UI.Slider(p, p.y, "Warn with time left", "armorMinutes", 1, 10, 1, " min")) + 8)
end

local function StonePage(UI)
	local p = UI.NewPage("Stones & shards", "Healthstone, Soulstone and Soul Shards.")
	local W = UI.CONTENT_W
	p:Add(select(2, UI.DBToggle(p, 0, p.y, W, "healthstone", "Remind me to make a Healthstone",
		"When none is in your bags. Click the card to make one.")) + 6)
	p:Add(select(2, UI.DBToggle(p, 0, p.y, W, "soulstone", "Remind me to make a Soulstone too")) + 10)
	p:Add(select(2, UI.DBToggle(p, 0, p.y, W, "shards", "Warn when Soul Shards run low")) + 6)
	p:Add(select(2, UI.Slider(p, p.y, "Shards: warn at", "shardLow", 0, 20, 1, " left")) + 8)
end

local function TravelPage(UI)
	local p = UI.NewPage("Travel", "Ritual of Summoning, Unending Breath and your Hearthstone beside the game menu (Escape).")
	p:Add(select(2, UI.DBToggle(p, 0, p.y, UI.CONTENT_W, "travel", "Show the travel panel when the game menu opens")) + 8)
end

ns.optionPages[#ns.optionPages + 1] = DemonPage
ns.optionPages[#ns.optionPages + 1] = StonePage
ns.optionPages[#ns.optionPages + 1] = TravelPage
Bound.InstallOptions(ns, { header = "Warlock helper", launcher = "Warlock helper: demon, armor, stones, shards." })
