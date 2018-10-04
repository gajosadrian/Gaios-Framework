Map.Map = class()
local Map = Map.Map

local instance

function Map:constructor()
    self.tiles = {}
end

function Map.getInstance()
    return instance
end

function Map:getTile(x, y)
    return self.tiles[x][y]
end

function Map:addItem(item, x, y)
    local tile = self:getTile(x, y)
    tile:addItem(item)
end

function Map:init()
    self:generateTiles()
end

function Map:generateTiles()
    for y = 0, self.ysize - 1 do
        for x = 0, self.xsize - 1 do
            local tile = Tile.new(x, y)
            table.insert2D(self.tiles, x, y, tile)
        end
    end
end

function Map:getTile(x, y)
    return self.tiles[x][y]
end

Map.__index = function(self, key)
    return switch(key) {

        name = function()
            return map('name')
        end,

        xsize = function()
            return map('xsize')
        end,

        ysize = function()
            return map('ysize')
        end,

        tileset = function()
            return map('tileset')
        end,

        tilecount = function()
            return map('tilecount')
        end,

        back_img = function()
            return map('back_img')
        end,

        back_scrollx = function()
            return map('back_scrollx')
        end,

        back_scrolly = function()
            return map('back_scrolly')
        end,

        back_scrolltile = function()
            return map('back_scrolltile')
        end,

        back_r = function()
            return map('back_r')
        end,

        back_g = function()
            return map('back_g')
        end,

        back_b = function()
            return map('back_b')
        end,

        storm_x = function()
            return map('storm_x')
        end,

        storm_y = function()
            return map('storm_y')
        end,

        mission_vips = function()
            return map('mission_vips')
        end,

        mission_hostages = function()
            return map('mission_hostages')
        end,

        mission_bombspots = function()
            return map('mission_bombspots')
        end,

        mission_ctfflags = function()
            return map('mission_ctfflags')
        end,

        mission_dompoints = function()
            return map('mission_dompoints')
        end,

        nobuying = function()
            return map('nobuying')
        end,

        noweapons = function()
            return map('noweapons')
        end,

        teleporters = function()
            return map('teleporters')
        end,

        botnodes = function()
            return map('botnodes')
        end,


        [Default] = function()
            return rawget(self, key)
        end,
    }
end

instance = Map.Map.new()
instance:init()
