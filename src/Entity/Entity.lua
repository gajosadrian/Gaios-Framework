Entity.Entity = class()
local Entity = Entity.Entity

function Entity:constructor(x, y)
    self.x = x
    self.y = y
end

function Entity:trigger()
    trigger(self.name)
end

Entity.__index = function(self, key)
    return switch(key) {

        exists = function()
            return entity(self.x, self.y, 'exists')
        end,

        typename = function()
            return entity(self.x, self.y, 'typename')
        end,

        typeId = function()
            return entity(self.x, self.y, 'type')
        end,

        type = function()
            return entity(self.x, self.y, 'type')
        end,

        name = function()
            return entity(self.x, self.y, 'name')
        end,

        trigger = function()
            return entity(self.x, self.y, 'trigger')
        end,

        state = function()
            return entity(self.x, self.y, 'state')
        end,

        int0 = function()
            return entity(self.x, self.y, 'int0')
        end,

        str0 = function()
            return entity(self.x, self.y, 'str0')
        end,

        aistate = function()
            return entity(self.x, self.y, 'aistate')
        end,
    }
end
