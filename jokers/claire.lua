SMODS.Atlas({
	key = "j_claire",
	path = "j_claire.png",
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
    loc_txt = {
        name = "Business Bunny",
        text = {
            "She's the boss",
            'for each Beat Banger Card',
            'Gain {C:attention}$1{} At the end of the round',
        }
    },
    calc_dollar_bonus = function(self, card)
        -- Get each Joker
        local money_amount = 0
        for k, v in pairs(G.jokers.cards) do
            local joker_name = v.config.center.name
            if string.sub(joker_name,1,6) == "j_Beat" then
                money_amount = money_amount + 1
            end
        end

        return money_amount
    end
})