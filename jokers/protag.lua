SMODS.Atlas({
	key = "j_protag",
	path = "j_protag.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_boing",
    path = "sfx_boing.ogg",
})

SMODS.Joker({
	key = "j_protag",
	atlas = "j_protag",
	rarity = 1,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    loc_txt = {
        name = "The Protagonist",
        text = {
            "It's You!",
            'Gain +4 mult for each Beat Banger joker'
        }
    },
    calculate = function(self, card, context)

        local mult = 0
        for k, v in pairs(G.jokers.cards) do
            local joker_name = v.config.card.name
            if string.sub(joker_name,1,6) == "j_Beat" then
                mult = mult + 4
            end
        end

        if context.joker_main then
            return {
                message = "8==D + " .. mult,
                Color = G.C.MULT,
                sound = 'BeatBanger_sfx_boing',
                Xmult_mod = mult
            }
        end
    end
})