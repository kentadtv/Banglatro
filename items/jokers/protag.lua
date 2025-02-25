local data, err = SMODS.load_file('util.lua', "BeatBanger")
local ok, util = pcall(data)

SMODS.Atlas({
	key = "joker_atlas",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_boing",
    path = "sfx_boing.ogg",
})

SMODS.Joker({
	key = "j_protag",
	atlas = "joker_atlas",
    pos = { x = 0, y = 0 },
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
            mult = 0,
        },
    },
    loc_txt = {
        name = "The Protagonist",
        text = {
            "It's You!",
            'Gain {C:mult}+1{} mult for each Beat Banger joker',
            'Currently {C:mult}+#1#{}'
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,
    update = function(self, card, dt)
        if card.ability.name ~= "j_BeatBanger_j_protag" then return end
        card.ability.extra.mult = util.get_bb_joker_count(G.jokers.cards)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = "Guh~ + " .. card.ability.extra.mult,
                mult_mod = card.ability.extra.mult,
                sound = 'BeatBanger_sfx_boing',
            }
        end
    end
})