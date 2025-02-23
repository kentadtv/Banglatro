if SMODS.Atlas then
    SMODS.Atlas({
        key = "modicon",
        path = "modicon.png",
        px = 32,
        py = 32
    })
end

local function import(file)
    local chunk, err = SMODS.load_file(file, "BeatBanger")
    if chunk then
        local ok, func = pcall(chunk)
        -- chunk()
    else
        print("Error loading Dawna Joker: " .. err)
    end
end


import('jokers/zoe.lua')
import('jokers/dawna.lua')
import('jokers/claire.lua')
import('jokers/gale.lua')
import('jokers/cathy.lua')

