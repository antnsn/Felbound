-- Felbound: the Warlock addon of the Bound family, built on LibBound-1.0 (the shared core).
-- This file sets the addon up; every other file returns at once on a non-warlock (ns.disabled).
local addonName, ns = ...
local Bound = LibStub("LibBound-1.0")

-- Spells and items, lowest rank first. Classic IDs; Forever follows Classic content.
-- Checked in game before each release.
ns.DATA = {
	demons = {
		{ key = "Imp", spell = 688, family = "Imp", shard = false, level = 1 },
		{ key = "Voidwalker", spell = 697, family = "Voidwalker", shard = true, level = 10 },
		{ key = "Succubus", spell = 712, family = "Succubus", shard = true, level = 20 },
		{ key = "Felhunter", spell = 691, family = "Felhunter", shard = true, level = 30 },
	},
	demonSkin = { 687, 696 },
	demonArmor = { 706, 1086, 11733, 11734, 11735 },
	createHealthstone = { 6201, 6202, 5699, 11729, 11730 },
	createSoulstone = { 693, 20752, 20755, 20756, 20757 },
	ritualOfSummoning = 698,
	unendingBreath = 5697,
	soulShard = 6265,
	healthstones = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 },
	soulstones = { 5232, 16892, 16893, 16895, 16896 },
}

ns.disabled = Bound:NewAddon(addonName, ns, {
	class = "WARLOCK",
	title = "Felbound",
	prefix = "8fe36a",
	db = "FelboundDB",
	slash = { "/fel", "/felbound" },
	media = "Interface\\AddOns\\Felbound\\Media\\",
	defaults = {
		skin = "fel",
		demon = true, demonChoice = "Auto",
		dmPoint = { "CENTER", "UIParent", "CENTER", -250, 200 },
		armor = true, armorMinutes = 2, armorSound = false, armorIcon = true, armorKeep = true,
		arPoint = { "CENTER", "UIParent", "CENTER", -250, 140 },
		healthstone = true, soulstone = false,
		stPoint = { "CENTER", "UIParent", "CENTER", 250, 200 },
		shards = true, shardLow = 3,
		shPoint = { "CENTER", "UIParent", "CENTER", 250, 140 },
		travel = true,
		wrPoint = { "CENTER", "UIParent", "CENTER", 0, 320 },
		wfPoint = { "CENTER", "UIParent", "CENTER", 0, 260 },
	},
})
