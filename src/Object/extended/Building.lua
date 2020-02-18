local Object = app('object')
local Building = class(Object)

local BUILDINGS = config('core.buildings')

function Building:constructor(type_id, x, y, rot, mode, team, player)
    -- @vars
    -- id, type

    self:super(type_id)
    self:spawn(type_id, x, y, rot, mode, team, player)

    BUILDINGS[#BUILDINGS] = self
end

-------------------------
--       METHODS       --
-------------------------

function Building:spawn(type_id, x, y, rot, mode, team, player)
    parse('spawnobject', type_id, x, y, rot, mode, team, player)
    self.id = Building.getLastId()
end

function Building:destroy()
    parse('killobject', self.id)
end

function Building:remove()
    self:destroy()
end

function Building:setPos(x, y)
    local health, type_id, rot, mode, team, player = self.health, self.type_id, self.rot, self.mode, self.team, self.player

    self:destroy()
    self:spawn(type_id, x, y, rot, mode, team, player)
    self.health = health
end

function Building:changeType(type_id)
    local health, x, y, rot, mode, team, player = self.health, self.x, self.y, self.rot, self.mode, self.team, self.player

    self:destroy()
    self:spawn(type_id, x, y, rot, mode, team, player)
    self.health = health
end

function Building:damage(dmg, player)
    parse('damageobject', self.id, dmg, player)
end

function Building:repair(dmg, player)
    self:damage(-dmg, player)
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
