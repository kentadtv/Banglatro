SMODS.Atlas({
	key = "tag_atlas",
	path = "tag_atlas.png",
	px = 34,
	py = 34,
})

SMODS.Tag({
    key = "tag_atlas",
    atlas = 'tags_beat_banger',
    pos = { x = 0, y = 0 },
    discovered = true,
    unlocked = true,
    config = {}, 
    loc_txt = {
        name = "Encore",
        text = {
            'Does Nothing...',
        }
    },
    apply = function(self, tag, context)
        print("applying tag...")
        print(tag)
    end
        
})
