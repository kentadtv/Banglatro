if SMODS.Atlas then
    SMODS.Atlas({
        key = "modicon",
        path = "modicon.png",
        px = 32,
        py = 32
    })
end

local function load_joker(file)
    local chunk, err = SMODS.load_file(file, "BeatBanger")
    if chunk then
        local ok, func = pcall(chunk)
        -- chunk()
    else
        print("Error loading Dawna Joker: " .. err)
    end
end


load_joker('jokers/zoe.lua')
load_joker('jokers/dawna.lua')
load_joker('jokers/claire.lua')
load_joker('jokers/gale.lua')
load_joker('jokers/cathy.lua')

