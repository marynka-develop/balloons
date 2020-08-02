local S = minetest.get_translator("balloon")
local dyes = dye.dyes 

for i = 1, #dyes do
    local name, desc = unpack(dyes[i])

    minetest.register_node("balloons:" .. name, {
        drawtype = "plantlike",
        tiles = {"balloon_" .. name ..".png"},
        is_group_content = false,
        description = S(desc .. " Balloon"),
        groups = {oddly_breakable_by_hand = 2, snappy = 1},
        walkable = false,
        waving = 1,
        --stack_max = 2,
        climbable = false,
        node_box = {
            type = "fixed",
            fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
        },
        selection_box = {
            type = "fixed",
            fixed = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5}
        },
        visual_scale = 2.0
    })

    
    minetest.register_craft{
        type = 'shaped',
        output = 'balloons:' .. name,
        recipe = {
            {'group:dye,color_' .. name, 'default:paper', ''},
            {'', 'farming:string', ''},
            {'', 'farming:string', ''},
        }
    }

    --[[ minetest.register_craft{	
		type = "shapeless",
		output = "balloons:" .. name,
		recipe = {"group:dye,color_" .. name, "group:balloons"},
	} ]]
	-- This piece of code is from Minetest Wool mod.
	-- It has to enable repaint for balloons, but, for some reason, doesn't work.


end