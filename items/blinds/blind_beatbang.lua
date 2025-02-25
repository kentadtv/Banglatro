SMODS.Atlas({
	key = "blinds_atlas",
	path = "blinds_atlas.png",
	px = 34,
	py = 34,
})

SMODS.Blind({
    key = "blinds_beatbang",
    atlas = 'blinds_atlas',
    pos = { x = 0, y = 0 },
    -- discovered = true,
    -- boss_colour = HEX('0a0a0a'),
    -- unlocked = true,
    -- dollars = 10,
    -- boss = true,
    loc_txt = {
        name = "BeatBang",
        text = {
            "It's Banging Time",
        }
    },
})