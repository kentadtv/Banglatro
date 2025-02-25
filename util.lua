local module = {}

-- Get amount of each Beat Banger Jokers
function module.get_bb_joker_count(active_jokers)
    if not G.STAGE == G.STAGES.RUN then return end
    local count = 0
    for k, v in pairs(active_jokers) do
        if not v.config.center.mod then goto continue end
        local joker_mod_id = v.config.center.mod.id
        if joker_mod_id == "BeatBanger" then count = count + 1 end
        ::continue::
    end
    return count
end

return module



