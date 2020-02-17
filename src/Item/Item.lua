local Item = class()
local ITEMS = config('core.items')

local items_id = {}

function Item:constructor(type_id, x, y, ammo_in, ammo)
    self.id = false
    self.type = false
    self:spawn(type_id, x, y, ammo_in, ammo)

    -- var_dump(self.type)

    ITEMS[#ITEMS] = self
end

-------------------------
--       METHODS       --
-------------------------

function Item:init()
    self.type = app('item.itemtype').getInstance(self.type_id)
end

function Item:spawn(type_id, x, y, ammo_in, ammo)
    parse('spawnitem', type_id, x, y, ammo_in, ammo)
    self.id = Item.lastId()
    self:init()
end

function Item:destroy()
    parse('removeitem', self.id)
end

function Item:remove()
    self:destroy()
    table.removeValue(ITEMS, self)
end

function Item:setPos(x, y)
    local type_id, ammo_in, ammo = self.type_id, self.ammo_in, self.ammo

    self:destroy()
    self:spawn(type_id, x, y, ammo_in, ammo)
end

function Item:changeType(type_id)
    local x, y, ammo_in, ammo = self.x, self.y, self.ammo_in, self.ammo

    self:destroy()
    self:spawn(type_id, x, y, ammo_in, ammo)
end

-------------------------
--   STATIC METHODS    --
-------------------------

function Item.lastId()
    local item_ids = Item.allRaw()
    return item_ids[#item_ids]
end

function Item.allRaw()
    return item(0, 'table')
end

function Item.all()
    return ITEMS
end

function Item.get(id)

    -- TODO: Create id-index table

    for _, item in pairs(ITEMS) do
        if item.id == id then
            return item
        end
    end
end

function Item.getAt(x, y)
    local ITEMS = ITEMS
    local array = {}

    for i = 1, #ITEMS do
        local item = ITEMS[i]

        if item.x == x and item.y == y then
            array[#array] = item
        end
    end

    return array
end

-------------------------
--       GETTERS       --
-------------------------

function Item:getExistsAttribute()
    return item(self.id, 'exists')
end

function Item:getNameAttribute()
	return item(self.id, 'name')
end

function Item:getTypeIdAttribute()
	return item(self.id, 'type')
end

function Item:getPlayerAttribute()
	return item(self.id, 'player')
end

function Item:getAmmoAttribute()
	return item(self.id, 'ammo')
end

function Item:getAmmoInAttribute()
	return item(self.id, 'ammoin')
end

function Item:getModeAttribute()
	return item(self.id, 'mode')
end

function Item:getXAttribute()
	return item(self.id, 'x')
end

function Item:getYAttribute()
	return item(self.id, 'y')
end

function Item:getDroppedAttribute()
	return item(self.id, 'dropped')
end

function Item:getDroptimerAttribute()
	return item(self.id, 'droptimer')
end

-------------------------
--       GETTERS       --
-------------------------

function Item:setTypeIdAttribute(value)
    self:changeType(value)
end

function Item:setAmmoInAttribute(value)
    parse('setammo', self.id, 0, value, self.ammo)
end

function Item:setAmmoAttribute(value)
    parse('setammo', self.id, 0, self.ammo_in, value)
end

function Item:setXAttribute(value)
	self:setPos(value, self.y)
end

function Item:setYAttribute(value)
	self:setPos(self.x, value)
end

-------------------------
--        INIT         --
-------------------------

return Item
