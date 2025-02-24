SMODS.Atlas({
	key = "j_beat_banger",
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
	atlas = "j_beat_banger",
    pos = { x = 5, y = 0 },
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
            'G-Milf Sheep',
            'Gives {C:chips}+50{} chips for each Beat Banger joker',
            'Currently {C:chips}+#1#{}',
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN then
            if card.ability.name ~= "j_BeatBanger_j_dawna" then return end
            
            local bb_cards = 0
            for k, v in pairs(G.jokers.cards) do
                if not v.config.center.mod then break end
                local joker_mod_id = v.config.center.mod.id
                if joker_mod_id == "BeatBanger" then bb_cards = bb_cards + 1 end
            end

            card.ability.extra.chips = bb_cards * 50
        end
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