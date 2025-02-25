SMODS.Atlas({
	key = "voucher_atlas",
	path = "voucher_atlas.png",
	px = 71,
	py = 95,
})

SMODS.Voucher({
    key = "voucher_bunfan",
    atlas = 'voucher_atlas',
    pos = { x = 0, y = 0 },
    discovered = true,
    unlocked = true,
    cost = 15,
    config = {}, 
    loc_txt = {
        name = "Bunfan",
        text = {
            'More space for the Beat Banger Crew!',
            'Add +2 joker slots!',
        }
    },
    redeem = function(self, card)
        if G.jokers then 
            G.jokers.config.card_limit = G.jokers.config.card_limit + 2
        end
    end
        
})
