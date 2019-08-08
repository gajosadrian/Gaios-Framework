local Map
Map = class()

function Map:constructor()
    self.tiles = {}
    self.items = {}
    self.buildings = {}

    self:init()
end

function Map:init()
    self:generateTiles()
end

function Map:generateTiles()
    for y = 0, self.ysize - 1 do
        for x = 0, self.xsize - 1 do
            local tile = app('map.tile').new(x, y)

            table.insert2D(self.tiles, x, y, tile)
        end
    end
end

function Map:getTile(x, y)
    return self.tiles[x][y]
end

function Map:getItems()
    return self.items
end

function Map:getItem(item_id)
    for _, item in pairs(self.items) do
        if item.id == item_id then
            return item
        end
    end
end

function Map:getItemsAt(x, y)
    local tab = {}
    for _, item in pairs(self.items) do
        if item.x == x and item.y == y then
            table.insert(tab, item)
        end
    end
    return tab
end

function Map:addItem(...)
    local args = {...}
    local x, y = args[2], args[3]

    local item = app('item.item').new(...)
    table.insert(self.items, item)

    return item
end

function Map:removeItem(item_id)
    local item = self:getItem(item_id)

    if not item then
        return false
    end

    item:remove()
    table.removeValue(self.items, item)

    return true
end

function Map:getBuildings()
    return self.buildings
end

function Map:getBuilding(a, b)
    local building_id, x, y
    if not b then
        building_id = a
    else
        x, y = a, b
    end

    if building_id then
        for _, building in pairs(self.buildings) do
            if building.id == building_id then
                return building
            end
        end
    elseif x and y then
        for _, building in pairs(self.buildings) do
            if building.tilex == x and building.tiley == y then
                return building
            end
        end
    end
end

function Map:addBuilding(...)
    local args = {...}
    local x, y = args[2], args[3]

    if self:getBuilding(x, y) then
        return false
    end

    local building = app('object.building').new(...)
    table.insert(self.buildings, building)

    return building
end

function Map:removeBuilding(a, b)
    local building_id, x, y
    if not b then
        building_id = a
    else
        x, y = a, b
    end

    local building
    if building_id then
        building = self:getBuilding(building_id)
    elseif x and y then
        building = self:getBuilding(x, y)
    end

    if not building then
        return false
    end

    building:remove()
    table.removeValue(self.buildings, building)

    return true
end

-------------------------
--       GETTERS       --
-------------------------

function Map:getNameAttribute()
	return map('name')
end

function Map:getXsizeAttribute()
	return map('xsize')
end

function Map:getYsizeAttribute()
	return map('ysize')
end

function Map:getTilesetAttribute()
	return map('tileset')
end

function Map:getTilecountAttribute()
	return map('tilecount')
end

function Map:getBackImgAttribute()
	return map('back_img')
end

function Map:getBackScrollxAttribute()
	return map('back_scrollx')
end

function Map:getBackScrollyAttribute()
	return map('back_scrolly')
end

function Map:getBackScrolltileAttribute()
	return map('back_scrolltile')
end

function Map:getBackRAttribute()
	return map('back_r')
end

function Map:getBackGAttribute()
	return map('back_g')
end

function Map:getBackBAttribute()
	return map('back_b')
end

function Map:getStormXAttribute()
	return map('storm_x')
end

function Map:getStormYAttribute()
	return map('storm_y')
end

function Map:getMissionVipsAttribute()
	return map('mission_vips')
end

function Map:getMissionHostagesAttribute()
	return map('mission_hostages')
end

function Map:getMissionBombspotsAttribute()
	return map('mission_bombspots')
end

function Map:getMissionCtfflagsAttribute()
	return map('mission_ctfflags')
end

function Map:getMissionDompointsAttribute()
	return map('mission_dompoints')
end

function Map:getNobuyingAttribute()
	return map('nobuying')
end

function Map:getNoweaponsAttribute()
	return map('noweapons')
end

function Map:getTeleportersAttribute()
	return map('teleporters')
end

function Map:getBotnodesAttribute()
	return map('botnodes')
end

-------------------------
--        INIT         --
-------------------------

return Map
