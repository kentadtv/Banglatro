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


import('jokers/protag.lua')
import('jokers/cathy.lua')
import('jokers/zoe.lua')
import('jokers/gale.lua')
import('jokers/claire.lua')
import('jokers/dawna.lua')
import('jokers/makayla.lua')
import('jokers/jasmine.lua')

