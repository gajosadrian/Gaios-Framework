Object.Object = class()
local Object = Object.Object

Object.Teams = {
    none = 0,
    neutral = 0,
    terrorist = 1,
    zombie = 1,
    counterterrorist = 2,
    survivor = 2,
    vip = 3,
}

Object.NPCs = {
    zombie = 1,
    headcrab = 2,
    snark = 3,
    vortigaunt = 4,
    soldier = 5,
}

function Object:constructor(typeId, x, y, rot, mode, team, player)
    self.id = self:spawn(...)
end

function Object:spawn(...)
    local args = {...}
    local typeId = args[1]

    spawnobject(...)
    return Object.lastSpawnedId()
end

function Object:remove()
    killobject(self.id)
end

function Object:setPos(x, y)
    self:remove()
    self:spawn(self.typeId, x, y, self.rot, self.mode, self.team, self.player)
    self.health = self.health
end

function Object:damage(damage, userId)
    damageobject(self.id, damange, userId)
end

function Object.lastSpawnedId()
    local objects = Object.getAll()
    return objects[#objects]
end

function Object.getAll()
    return object(0, 'table')
end

Object.__index = function(self, key)
    local id = rawget(self, 'id')

    return switch(key) {
        exists = function()
            return object(id, 'exists')
        end,

        typeName = function()
            return object(id, 'typename')
        end,

        typeId = function()
            return object(id, 'type')
        end,

        type = function()
            return Object.ObjectType.new(self.id)
        end,

        health = function()
            return object(id, 'health')
        end,

        mode = function()
            return object(id, 'mode')
        end,

        team = function()
            return object(id, 'team')
        end,

        player = function()
            return object(id, 'player')
        end,

        x = function()
            return object(id, 'x')
        end,

        y = function()
            return object(id, 'y')
        end,

        rot = function()
            return object(id, 'rot')
        end,

        tilex = function()
            return object(id, 'tilex')
        end,

        tiley = function()
            return object(id, 'tiley')
        end,

        countdown = function()
            return object(id, 'countdown')
        end,

        rootrot = function()
            return object(id, 'rootrot')
        end,

        idle = function()
            return object(id, 'idle')
        end,

        rotvar = function()
            return object(id, 'rotvar')
        end,

        target = function()
            return object(id, 'target')
        end,

        upgrade = function()
            return object(id, 'upgrade')
        end,

        entity = function()
            return object(id, 'entity')
        end,

        entityx = function()
            return object(id, 'entityx')
        end,

        entityy = function()
            return object(id, 'entityy')
        end,

        [Default] = function()
            return rawget(self, key)
        end,
    }
end

Object.__newindex = function(self, key, value)
    switch(key) {
        health = function()
            local damage = self.health - value
            self:damage(damage)

            if self.health <= 0 then
                self:remove()
            end
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
