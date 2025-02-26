SMODS.Atlas({
	key = "booster_atlas",
	path = "booster_atlas.png",
	px = 71,
	py = 95,
})


SMODS.Booster({
    key = 'booster_zoe_pack',
    atlas = 'booster_atlas',
    weight = 1,
    cost = 4,
    config = { extra = 5, choose = 1 },
    loc_txt = {
        name = 'Zoe Pack',
        text = {
            "A {X:mult,C:white}BIG{} and {X:mult,C:white}BOUNCY{} pack of {C:mult}SEXY{} jokers"
        },
        group_name = 'Choose one sexy jonkler!'
    },
    create_card = function(self, card, i)
        local new_card = SMODS.create_card({
            set = 'Base',
            seal = 'Red',
            key = 'C_3',
            -- enhancement = 'Glass Card',
        })
        return new_card
    end
})
