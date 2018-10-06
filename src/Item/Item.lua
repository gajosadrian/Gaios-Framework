Item.Item = class()
local Item = Item.Item

function Item:constructor(typeId, x, y, ammoIn, ammo)
    self.id = self:spawn(...)
    self.typeId = typeId
    self.x = x
    self.y = y

    MAP:addItem(self, x, y)
end

function Item:spawn(...)
    spawnitem(...)
    return Item.lastSpawnedId()
end

function Item:remove()
    removeitem(self.id)
end

function Item:setPos(x, y)
    self:remove()
    self:spawn(self.typeId, x, y, self.ammoIn, self.ammo)
end

function Item.lastSpawnedId()
    local items = Item.getAll()
    return items[#items]
end

function Item.getAll()
    return item(0, 'table')
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
            return Item.ItemType.new(id)
        end,

        player = function()
            return item(id, 'player')
        end,

        ammo = function()
            return item(id, 'ammo')
        end,

        ammoIn = function()
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

Item.__newindex = function(self, key, value)
    switch(key) {
        ammoIn = function()
            setammo(self.id, 0, value, self.ammo)
        end,

        ammo = function()
            setammo(self.id, 0, self.ammoIn, value)
        end,

        x = function()
            self:setPos(value, self.y)
        end,

        y = function()
            self:setPos(self.x, value)
        end,

        [Default] = function()
            rawset(self, key, value)
        end,
    }
end
