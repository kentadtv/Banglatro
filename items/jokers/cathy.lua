SMODS.Atlas({
	key = "joker_atlas",
	path = "joker_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Sound({
    key = "sfx_cathy_moan",
    path = "sfx_cathy_moan.ogg",
})

SMODS.Joker({
	key = "j_cathy",
	atlas = "joker_atlas",
    pos = { x = 1, y = 0 },
	rarity = 1,
	cost = 1,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    in_pool = function(self, args) return true, {allow_duplicates = false} end,
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
                sound = 'BeatBanger_sfx_cathy_moan',
            }
        end
    end
})