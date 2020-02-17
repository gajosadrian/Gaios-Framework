local Object = app('object')
local Building = class(Object)

function Building:constructor(type_id, x, y, rot, mode, team, player)
    self.id = nil
    self:spawn(type_id, x, y, rot, mode, team, player)

    self.max_health = self.health
    self:super()
end

-------------------------
--       METHODS       --
-------------------------

function Building:spawn(type_id, x, y, rot, mode, team, player)
    parse('spawnobject', type_id, x, y, rot, mode, team, player)
    self.id = Building.lastId()
end

function Building:remove()
    parse('killobject', self.id)
end

function Building:setPos(x, y)
    local health = self.health

    self:remove()
    self:spawn(self.type_id, x, y, self.rot, self.mode, self.team, self.player)
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
--       SETTERS       --
-------------------------

function Building:setHealthAttribute(value)
    self:damage(self.health - value)
end

-------------------------
--        INIT         --
-------------------------

return Building
