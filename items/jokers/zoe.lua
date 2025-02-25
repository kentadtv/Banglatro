local util, err = SMODS.load_file('util.lua', "BeatBanger")


SMODS.Atlas({
	key = "joker_atlas",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_boob",
    path = "sfx_boob.ogg",
})

SMODS.Joker({
	key = "j_zoe",
	atlas = "joker_atlas",
    pos = { x = 2, y = 0 },
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
            Xmult = 1.5,
        },
    },
    loc_txt = {
        name = "Busty Bird",
        text = {
            'Zoe uses her {C:attention}big titties{}',
            'Gives {X:mult,C:white}X#1#{} Mult for each played 8'
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 8 then
                return {
                        message = "BOING!",
                        sound = 'BeatBanger_sfx_boob',
                        colour = G.C.GREEN,
                        Xmult_mod = card.ability.extra.Xmult,
                }
            end
        end    
    end,
})