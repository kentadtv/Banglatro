SMODS.Atlas({
	key = "j_dawna",
	path = "j_dawna.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_dawna_moan",
    path = "sfx_dawna_moan.ogg",
})

SMODS.Joker({
	key = "j_dawna",
	atlas = "j_dawna",
	rarity = 1,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    config = {
        extra = {
            chips = 50,
        },
    },
    loc_txt = {
        name = "Dawna",
        text = {
            'Dawna',
            'Gives {C:chips}+#1#{} Mult',
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                sound = 'BeatBanger_sfx_dawna_moan',
                message = "MMmhhh~!",
                chip_mod = card.ability.extra.chips,
                colour = G.C.CHIPS,
            }
        end
    end
})