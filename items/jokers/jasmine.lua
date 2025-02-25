SMODS.Atlas({
	key = "joker_atlas",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})


local apply_card_price_offset = function(offset)
    for k, v in pairs(G.I.CARD) do
        if v.set_cost then v.cost = v.cost + 3 end
    end
end

SMODS.Joker({
	key = "j_jasmine",
	atlas = "joker_atlas",
    pos = { x = 0, y = 1 },
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
            Xmult = 1,
        },
    },
    loc_txt = {
        name = "Jasmine",
        text = {
            'The Busty SalesBear',
            'Gives {X:mult,C:white}X1{} Mult per card bought in shop.',
            'Currently {X:mult,C:white}X#1#{}',
            'Increases price of shop cards by {C:attention}$3{}',
        }
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,
    add_to_deck = function(self, card, from_debuff) apply_card_price_offset(3) end,
    remove_from_deck = function(self, card, from_debuff) apply_card_price_offset(-3) end,
    calculate = function(self, card, context)
        
        if context.buying_card then
            card.ability.extra.Xmult = card.ability.extra.Xmult + 1
            return {
                message = "Upgrade!",
                Color = G.C.MULT,
            }
        end

        if context.joker_main then
            if card.ability.extra.Xmult <= 1 then return end
            return {
                message = "Unnff~!",
                Color = G.C.MULT,
                Xmult_mod = card.ability.extra.Xmult,
            }
        end

    end
})