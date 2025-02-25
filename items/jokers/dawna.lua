local data, err = SMODS.load_file('util.lua', "BeatBanger")
local ok, util = pcall(data)

SMODS.Atlas({
	key = "joker_atlas",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_dawna_moan",
    path = "sfx_dawna_moan.ogg",
})

SMODS.Joker({
	key = "j_dawna",
	atlas = "joker_atlas",
    pos = { x = 5, y = 0 },
	rarity = 1,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    in_pool = function(self, args) return true, {allow_duplicates = false} end,
    config = {
        extra = {
            chips = 50,
        },
    },
    loc_txt = {
        name = "Dawna",
        text = {
            'G-Milf Sheep',
            'Gives {C:chips}+50{} chips for each Beat Banger joker',
            'Currently {C:chips}+#1#{}',
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,
    update = function(self, card, dt)
        if card.ability.name ~= "j_BeatBanger_j_dawna" then return end
        card.ability.extra.chips = util.get_bb_joker_count(G.jokers.cards) * 50
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                sound = 'BeatBanger_sfx_dawna_moan',
                message = "MMmhhh~!",
                chip_mod = card.ability.extra.chips,
            }
        end
    end
})