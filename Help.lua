-- Every plain-word explanation in one place (tooltips show them while "Explain things" is on).
local _, ns = ...
if ns.disabled then return end

ns.Help = {
	demon = "Your demon fights for you: the Imp shoots fire, the Voidwalker takes the hits, the Succubus and Felhunter come later. Summon it whenever it isn't out.",
	shard = "Summoning every demon except the Imp uses a Soul Shard. You get shards with Drain Soul on an enemy as it dies.",
	armor = "Demon Armor (Demon Skin before you learn it) gives you armor and health back over time. Keep it up.",
	healthstone = "A Healthstone heals you a lot at once in a fight. Make one between fights; it costs a Soul Shard.",
	soulstone = "A Soulstone lets you (or a friend) come back to life after dying. It costs a Soul Shard.",
	shards = "Soul Shards are needed for demons, Healthstones and Soulstones. Drain Soul on a dying enemy gives one.",
	ritual = "Ritual of Summoning brings a friend to you (it needs two more people to help click the portal).",
	unendingBreath = "Unending Breath lets you (or a friend) breathe under water for 10 minutes.",
	hearthstone = "Your Hearthstone takes you back to the inn you set it to. Talk to an innkeeper to change it.",
}
