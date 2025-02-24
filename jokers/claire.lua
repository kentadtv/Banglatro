SMODS.Atlas({
	key = "j_beat_banger",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Joker({
	key = "j_claire",
	atlas = "j_claire",
	rarity = 2,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
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
        if G.STAGE == G.STAGES.RUN then
            if card.ability.name ~= "j_BeatBanger_j_claire" then return end
            local dollars = 0
            for k, v in pairs(G.jokers.cards) do
                local joker_mod_id = v.config.center.mod.id
                if joker_mod_id == "BeatBanger" then dollars = dollars + 1 end
            end

            card.ability.extra.dollars = dollars
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars}}
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
})