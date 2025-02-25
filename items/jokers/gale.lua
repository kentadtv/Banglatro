SMODS.Atlas({
	key = "joker_atlas",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_gale_moan",
    path = "sfx_gale_moan.ogg",
})

SMODS.Joker({
	key = "j_gale",
	atlas = "joker_atlas",
    pos = { x = 3, y = 0 },
	rarity = 1,
	cost = 8,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    in_pool = function(self, args) return true, {allow_duplicates = false} end,
    loc_txt = {
        name = "Gale The Tanuki",
        text = {
            'She can do it better.',
            'Copies the ability of a random joker'
        }
    },
    calculate = function(self, card, context)

        -- Choose Random Joker
        local other_joker = nil
        while other_joker == nil or other_joker == card do
            other_joker = G.jokers.cards[ math.random( #G.jokers.cards ) ]
        end

        if other_joker and other_joker ~= card then

            local other_joker_ret = other_joker:calculate_joker(context)

            context.blueprint = nil
			context.blueprint_card = nil

            if not other_joker_ret then return {} end

            other_joker_ret.sound = 'BeatBanger_sfx_gale_moan'
			return other_joker_ret

        end
    end
})