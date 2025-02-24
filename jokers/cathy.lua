SMODS.Atlas({
	key = "j_cathy",
	path = "j_cathy.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_cathy_moan",
    path = "sfx_cathy_moan.ogg",
})

SMODS.Joker({
	key = "j_cathy",
	atlas = "j_cathy",
	rarity = 1,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    loc_txt = {
        name = "Cathy the Cat",
        text = {
            'She has a fat ass...',
            'Does Nothing...'
        }
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = "Oughh~!",
                Color = G.C.MULT,
                sound = 'BeatBanger_sfx_cathy_moan',
            }
        end
    end
})