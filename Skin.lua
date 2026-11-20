-- Felbound's look, "Fel": charcoal panels with a fel-green glow, smoke, fel runes in the corners, a
-- slow green rim while a card needs you. LibBound derives the Blizzard and Flat skins from it.
-- Textures: tools/make_media.py.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")
local F = Bound.FONTS

local fel = {
	name = "Fel",
	font = { ui = F.friz, title = F.friz, narrow = F.arialn, card = F.morpheus },
	color = {
		bg = { 0, 0, 0, 0 },
		side = { 0.01, 0.03, 0.01, 0.40 },
		header = { 0.01, 0.03, 0.01, 0.35 },
		border = { 0.34, 0.66, 0.26, 0.9 },
		hover = { 0.10, 0.20, 0.08, 1 },
		selected = { 0.09, 0.18, 0.07, 1 },
		text = { 0.90, 0.96, 0.88 },
		dim = { 0.62, 0.70, 0.60 },
		accent = { 0.58, 0.92, 0.40 },
		track = { 0.08, 0.14, 0.06, 1 },
		button = { 0.04, 0.07, 0.03, 1 },
		navGlow = { 0.50, 0.95, 0.30, 0.60 },
		row = { 0.06, 0.11, 0.05, 0.8 },
		rowWarn = { 0.40, 0.30, 0.05, 0.5 },
		rowBad = { 0.45, 0.08, 0.10, 0.55 },
		highlight = { 0.75, 1, 0.65, 0.08 },
		cell = { 0.07, 0.10, 0.06, 0.85 },
		cdText = { 0.82, 1, 0.74 },
		glow = { 0.55, 0.95, 0.35 },
		gridLine = { 0.75, 1, 0.65, 0.08 },
		gridCentre = { 0.50, 0.95, 0.30, 0.45 },
	},
	box = {
		backdrop = {
			bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 16, edgeSize = 14,
			insets = { left = 3, right = 3, top = 3, bottom = 3 },
		},
		bg = { 0.03, 0.05, 0.03 },
		border = { 0.50, 0.86, 0.36, 1 },
	},
	dialog = {
		backdrop = {
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
			edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 11, right = 11, top = 12, bottom = 11 },
		},
		outset = 10,
		border = { 0.60, 0.90, 0.46, 1 },
		under = { 0.02, 0.04, 0.02, 1 },
		plate = false,
	},
	tex = Bound.STOCK_TEX,
	card = {
		panel = { 0.05, 0.07, 0.05, 0.94 },
		gilt = { 0.36, 0.66, 0.26, 1 },
		giltFaint = { 0.22, 0.42, 0.16, 0.9 },
		light = { 0.70, 1, 0.55, 0.07 },
		rays = { 0.55, 1, 0.35 },
		raysFaded = { 0.50, 0.58, 0.48 },
		title = { 0.66, 0.98, 0.46 },
		status = { 0.84, 0.92, 0.82 },
		urgent = { 1, 0.62, 0.42 },
		glowEdge = { 0.62, 1, 0.42, 1 },
		iconEdge = { 0.46, 0.82, 0.32, 0.9 },
		frost = "Smoke", frostTint = { 0.50, 0.85, 0.40, 0.12 },
		crest = "Crest", crestTint = { 0.50, 0.95, 0.35, 0.16 },
		shards = "Rune", shardTint = { 0.60, 1, 0.42, 0.95 },
		rim = "Rim", breathe = true, breatheTime = 2.6,
		burst = false, studs = false, ring = false, round = false,
	},
	widgets = "blizzard",
}

Bound.InstallSkin(ns, {
	skins = { fel = fel },
	order = { "fel", "blizzard", "flat" },
	default = "fel",
	about = { fel = "Charcoal and fel-green: smoke, runes in the corners, a green glow." },
})
Bound.InstallBuffTimers(ns)
Bound.InstallMinimap(ns)
