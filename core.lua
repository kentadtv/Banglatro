if SMODS.Atlas then
    SMODS.Atlas({
        key = "modicon",
        path = "modicon.png",
        px = 32,
        py = 32
    })
end

local function import(file)
    local file_data, err = SMODS.load_file(file, "BeatBanger")
    if file_data then
        local ok, func = pcall(file_data)
    else
        print("Error loading Dawna Joker: " .. err)
    end
end

-- Jokers
import('items/jokers/protag.lua')
import('items/jokers/cathy.lua')
import('items/jokers/zoe.lua')
import('items/jokers/gale.lua')
import('items/jokers/claire.lua')
import('items/jokers/dawna.lua')
import('items/jokers/makayla.lua')
import('items/jokers/jasmine.lua')

-- Tags
-- import('items/tags/tag_encore.lua')

-- Vouchers
import('items/vouchers/voucher_bunfan.lua')

-- Blinds
-- import('blinds/blind_beatbang.lua')

-- Boosters
import('items/boosters/booster_zoe.lua')

-- Decks
import('items/decks/deck_bunfan.lua')

