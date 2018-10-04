Item.Item = class()
local Item = Item.Item

function Item:constructor(id, x, y)
    self.id = id
    self.x = x
    self.y = y
end

Item.__index = function(self, key)
    local id = rawget(self, 'id')
    local x = rawget(self, 'x')
    local y = rawget(self, 'y')

    return switch(key) {
        exists = function()
            return item(id, 'exists')
        end,

        name = function()
            return item(id, 'name')
        end,

        typeId = function()
            return item(id, 'type')
        end,

        type = function()
            return ItemType.new(id)
        end,

        player = function()
            return item(id, 'player')
        end,

        ammo = function()
            return item(id, 'ammo')
        end,

        ammoin = function()
            return item(id, 'ammoin')
        end,

        mode = function()
            return item(id, 'mode')
        end,

        dropped = function()
            return item(id, 'dropped')
        end,

        droptimer = function()
            return item(id, 'droptimer')
        end,


        [Default] = function()
            return rawget(self, key)
        end,
    }
end
