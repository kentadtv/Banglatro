local data, err = SMODS.load_file('util.lua', "BeatBanger")
local ok, util = pcall(data)

SMODS.Atlas({
	key = "joker_atlas",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "j_claire",
	atlas = "joker_atlas",
    pos = { x = 4, y = 0 },
	rarity = 1,
	cost = 8,
	unlocked = true,
	discovered = true,
	eternal_compat = true,
	perishable_compat = true,
    in_pool = function(self, args) return true, {allow_duplicates = false} end,
    config = {
        extra = {
            dollars = 0,
        },
    },
    loc_txt = {
        name = "Business Bunny",
        text = {
            "She's the boss",
            'Gain {C:attention}$1{} for each Beat Banger Card',
            'At the end of the round',
            'Currently {C:attention}$#1#{}',
        }
    },
    update = function(self, card, dt)
        if card.ability.name ~= "j_BeatBanger_j_claire" then return end
        card.ability.extra.dollars = util.get_bb_joker_count(G.jokers.cards)
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars}}
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
})