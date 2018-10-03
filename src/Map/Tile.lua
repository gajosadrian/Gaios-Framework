Map.Tile = class()
local Tile = Map.Tile

Tile.properties = {
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

function Tile:constructor(x, y)
    self.x = x
    self.y = y
end

function Tile:spawnItem()
    -- TODO
end

Tile.__index = function(self, key)
    local x = rawget(self, 'x')
    local y = rawget(self, 'y')

    return switch(key) {
        frame = function()
            return tile(x, y, 'frame')
        end,

        property = function()
            return tile(x, y, 'property')
        end,

        walkable = function()
            return tile(x, y, 'walkable')
        end,

        entity = function()
            return tile(x, y, 'entity')
        end,

        hascustomframe = function()
            return tile(x, y, 'hascustomframe')
        end,

        originalframe = function()
            return tile(x, y, 'originalframe')
        end,

        rot = function()
            return tile(x, y, 'rot')
        end,

        blend = function()
            return tile(x, y, 'blend')
        end,

        color = function()
            return tile(x, y, 'color')
        end,

        brightness = function()
            return tile(x, y, 'brightness')
        end,

        -- TILE PROPERTIES:

        none = function()
            return self.property == Tile.properties.none
        end,

        wall = function()
            return self.property == Tile.properties.wall or self.property == Tile.properties.wallNoShadow
        end,

        obstacle = function()
            return self.property == Tile.properties.obstacle or self.property == Tile.properties.obstacleNoShadow
        end,

        deadly = function()
            return self.property == Tile.properties.Tile.properties.deadly or self.property == Tile.properties.toxicDeadly or self.property == Tile.properties.explosionDeadly or self.property == Tile.properties.abyssDeadly
        end,

        [Default] = function()
            return rawget(self, key)
        end,
    }
end

Player.__newindex = function(self, key, value)
    local x = rawget(self, 'x')
    local y = rawget(self, 'y')

    switch(key) {
        frame = function(frame)
            settile(x, y, frame)
        end,

        [Default] = function()
            rawset(self, key, value)
        end,
    }
end
