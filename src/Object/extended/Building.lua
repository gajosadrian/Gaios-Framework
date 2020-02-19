local Object = app('object')
local Building = class(Object)
local MAP = app('map').getInstance()

local BUILDINGS = config('core.buildings')
local BUILDINGS_ID = {}
local BUILDINGS_XY = table.initarray2D(MAP:getWidth() - 1, MAP:getHeight() - 1, false)

local tmp = {}

-------------------------
--        CONST        --
-------------------------
local types = {
    BARRICADE = 1, BARBED_WIRE = 2, WALL_1 = 3, WALL_2 = 4, WALL_3 = 5,
    GATE_FIELD = 6, DISPENSER = 7, TURRET = 8, SUPPLY = 9, BUILD_PLACE = 10,
    DUAL_TURRET = 11, TRIPLE_TURRET = 12, TELEPORTER_ENTRANCE = 13, TELEPORTER_EXIT = 14,
    SUPER_SUPPLY = 15,
}
for type, id in pairs(types) do
    Building[type_name] = id
end

-------------------------
--     CONSTRUCTOR     --
-------------------------

function Building:constructor(type_id, x, y, rot, mode, team, user_id)
    -- @vars
    -- id, type

    self:super(type_id)
    self:spawn(type_id, x, y, rot, mode, team, user_id)

    BUILDINGS[#BUILDINGS] = self
end

-------------------------
--   STATIC METHODS    --
-------------------------

function Building.getIdAt(x, y)
    return objectat(x, y)
end

function Building.getAt(x, y)
end

-------------------------
--       METHODS       --
-------------------------

function Building:spawn(type_id, tx, ty, rot, mode, team, user_id)
    parse('spawnobject', type_id, tx, ty, rot, mode, team, user_id)

    self.id = Building.getLastId()
    BUILDINGS_ID[self.id] = self
    BUILDINGS_XY[x][y] = self
end

function Building:destroy()
    parse('killobject', self.id)

    BUILDINGS_ID[self.id] = nil
    BUILDINGS_XY[self:getTileX()][self:getTileY()] = nil
    self.id = nil
end

function Item:respawn(type_id, tx, ty, rot, mode, team, user_id)
    self:destroy()
    self:spawn(type_id, tx, ty, rot, mode, team, user_id)
end

function Building:remove()
    self:destroy()
    table.removevalue(BUILDINGS, self)
end

function Building:setPos(tx, ty)
    local health, type_id, rot, mode, team, user_id = self.health, self.type_id, self.rot, self.mode, self.team, self.user_id

    self:destroy()
    self:spawn(type_id, tx, ty, rot, mode, team, user_id)
    self.health = health
end

function Building:changeType(type_id)
    local health, tx, ty, rot, mode, team, user_id = self.health, self.tx, self.ty, self.rot, self.mode, self.team, self.user_id

    self:destroy()
    self:spawn(type_id, tx, ty, rot, mode, team, user_id)
    self.health = health
end

function Building:damage(dmg, user_id)
    parse('damageobject', self.id, dmg, user_id)
end

function Building:repair(dmg, user_id)
    self:damage(-dmg, user_id)
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
