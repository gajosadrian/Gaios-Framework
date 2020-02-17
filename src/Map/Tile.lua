local Tile = class()

local tile = tile
local parse = parse
local table_contains = table.contains

local types = {
    none = 0,
    wall = 1,
    obstacle = 2,
    wallNoShadow = 3,
    obstacleNoShadow = 4,
    floorWall = 5,
    dirtFloor = 10,
    snowFloor = 11,
    stepFloor = 12,
    tileFloor = 13,
    wadeFloor = 14,
    metalFloor = 15,
    woodFloor = 16,
    deadly = 50,
    toxicDeadly = 51,
    explosionDeadly = 52,
    abyssDeadly = 53,
}
for type, value in pairs(types) do
    Tile[type:upper()] = value
end

function Tile:constructor(x, y)
    self.x = x
    self.y = y
end

-------------------------
--       GETTERS       --
-------------------------

function Tile:getFrameAttribute()
	return tile(self.x, self.y, 'frame')
end

function Tile:getPropertyIdAttribute()
	return tile(self.x, self.y, 'property')
end

function Tile:getWalkableAttribute()
	return tile(self.x, self.y, 'walkable')
end

function Tile:getEntityAttribute()
	return tile(self.x, self.y, 'entity')
end

function Tile:getHascustomframeAttribute()
	return tile(self.x, self.y, 'hascustomframe')
end

function Tile:getOriginalframeAttribute()
	return tile(self.x, self.y, 'originalframe')
end

function Tile:getRotAttribute()
	return tile(self.x, self.y, 'rot')
end

function Tile:getBlendAttribute()
	return tile(self.x, self.y, 'blend')
end

function Tile:getColorAttribute()
	return tile(self.x, self.y, 'color')
end

function Tile:getBrightnessAttribute()
	return tile(self.x, self.y, 'brightness')
end

function Tile:getNoneAttribute()
	return self.property_id == Tile.NONE
end

function Tile:getWallAttribute()
    return table_contains({Tile.WALL, Tile.WALLNOSHADOW}, self.property_id)
end

function Tile:getObstacleAttribute()
    return table_contains({Tile.OBSTACLE, Tile.OBSTACLENOSHADOW}, self.property_id)
end

function Tile:getDeadlyAttribute()
    return table_contains({Tile.DEADLY, Tile.TOXICDEADLY, Tile.EXPLOSIONDEADLY, Tile.ABYSSDEADLY}, self.property_id)
end

-------------------------
--       SETTERS       --
-------------------------

function Tile:setFrameAttribute(frame)
    print(self.x, self.y)
	parse('settile', self.x, self.y, frame)
end

-------------------------
--        INIT         --
-------------------------

return Tile
