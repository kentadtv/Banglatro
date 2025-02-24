local global = {}

-- Get amount of each Beat Banger Jokers
function global.get_bb_joker_count(joker_cards)
    
    local count = 0
    
    for k, v in pairs(joker_cards) do
        local joker_name = v.config.card.name
        if string.sub(joker_name,1,6) == "j_Beat" then
            count = count + 1
        end
    end
    
    return count
    
end

return global