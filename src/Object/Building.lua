Building.Building = class(Object.Object)
local Building = Building.Building

function Building:constructor(typeId, x, y, rot, mode, team, player)
    self:spawn(...)
end

function Building:spawn(...)
    local args = {...}
    local typeId = args[1]

    spawnobject(...)
    return Building.lastSpawnedId()
end

function Object:remove()
    killobject(self.id)
end

function Building:setPos(x, y)
    self:remove()
    self:spawn(self.typeId, x, y, self.rot, self.mode, self.team, self.player)
    self.health = self.health
end

function Building:damage(damage, userId)
    damageobject(self.id, damange, userId)
end
