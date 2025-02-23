
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
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    loc_txt = {
        name = "Dawna",
        text = {
            'Dawna',
            'TBA'
        }
    },
    calculate = function(self, center, context)
        if context.joker_main then
            return {
                sound = 'BeatBanger_sfx_dawna_moan',
                message = "MMmhhh~!",
                colour = G.C.MULT,
            }
        end
    end
})