SMODS.Atlas({
	key = "j_gale",
	path = "j_gale.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_gale_moan",
    path = "sfx_gale_moan.ogg",
})

SMODS.Joker({
	key = "j_gale",
	atlas = "j_gale",
	rarity = 3,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    loc_txt = {
        name = "Gale The Tanuki",
        text = {
            'She can do it better.',
            'Copies the ability of a random joker'
        }
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                sound = 'BeatBanger_sfx_gale_moan',
                message = "Uuhmm~!",
                Color = G.C.MULT,
            }
        end
    end
})