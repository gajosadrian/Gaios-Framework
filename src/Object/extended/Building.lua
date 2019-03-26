local Object = app('object.object')

local Building
Building = class(Object)

-- type_id, x, y, rot, mode, team, player
function Building:constructor(...)
    self.id = nil
    self:spawn(...)

    self.max_health = self.health
    self:super()
end

-- function Building:destructor()
--     self:remove()
-- end

function Building:spawn(...)
    local args = {...}

    parse('spawnobject', ...)
    self.id = Building.lastSpawnedId()
end

function Building:remove()
    parse('killobject', self.id)
end

function Building:setPos(x, y)
    local health = self.health
    local args = {self.type_id, x, y, self.rot, self.mode, self.team, self.player}

    self:remove()
    self:spawn(unpack(args))
    self.health = health
end

function Building:damage(damage, user_id)
    parse('damageobject', self.id, damage, user_id)
end

function Building:addHealth(value)
    self.health = self.health + value

    if self.health > self.max_health then
        self.health = self.max_health
    elseif self.health <= 0 then
        self:remove()
    end
end

-------------------------
--       GETTERS       --
-------------------------

function Building:setHealthAttribute(value)
    self:damage(self.health - value)
end

-------------------------
--        INIT         --
-------------------------

return Building
