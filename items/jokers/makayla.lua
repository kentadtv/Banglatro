SMODS.Atlas({
	key = "joker_atlas",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})

-- SMODS.Sound({
--     key = "sfx_makayla_moan",
--     path = "sfx_makayla_moan.ogg",
-- })

SMODS.Joker({
	key = "j_makayla",
	atlas = "joker_atlas",
    pos = { x = 1, y = 1 },
	rarity = 1,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    in_pool = function(self, args) return true, {allow_duplicates = false} end,
    loc_txt = {
        name = "Makayla",
        text = {
            "Cathy's Roomate",
            'Gives {X:mult,C:white}X3{} Mult if you have Cathy'
        }
    },
    calculate = function(self, card, context)
        if context.joker_main then

            -- Scan for cathy
            for k, v in pairs(G.jokers.cards) do
                local joker_name = v.config.center.name
                if joker_name == "j_BeatBanger_j_cathy" then
                    return {
                        message = "<3",
                        Color = G.C.MULT,
                        Xmult_mod = 3,
                    }  
                end
            end

            
        end
    end
})