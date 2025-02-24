SMODS.Atlas({
	key = "j_beat_banger",
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
	atlas = "j_protag",
	rarity = 1,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
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
        if G.STAGE == G.STAGES.RUN then
            if card.ability.name ~= "j_BeatBanger_j_protag" then return end
            
            local bb_cards = 0
            for k, v in pairs(G.jokers.cards) do
                local joker_mod_id = v.config.center.mod.id
                if joker_mod_id == "BeatBanger" then bb_cards = bb_cards + 1 end
            end

            card.ability.extra.mult = bb_cards
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = "Guh~ + " .. card.ability.extra.mult,
                Color = G.C.MULT,
                sound = 'BeatBanger_sfx_boing',
                mult_mod = card.ability.extra.mult
            }
        end
    end
})