local Item = class()

local ITEMS = config('core.items')
local ITEMS_ID = {}

local item = item
local tmp = {}

function Item:constructor(type_id, x, y, ammo_in, ammo)
    -- @vars
    -- id, type

    self.type = app('item.itemtype').getInstance(type_id)
    self:spawn(type_id, x, y, ammo_in, ammo)

    -- var_dump(self.type)

    ITEMS[#ITEMS] = self
    ITEMS_ID[self.id] = self
end

-------------------------
--       METHODS       --
-------------------------

function Item:spawn(type_id, x, y, ammo_in, ammo)
    parse('spawnitem', type_id, x, y, ammo_in, ammo)
    self.id = Item.getLastId()
    self:init()
end

function Item:destroy()
    parse('removeitem', self.id)
end

function Item:respawn(type_id, x, y, ammo_in, ammo)
    self:destroy()
    self:spawn(type_id, x, y, ammo_in, ammo)
end

function Item:remove()
    self:destroy()
    table.removevalue(ITEMS, self)
    ITEMS_ID[self.id] = nil
end

-------------------------
--       SETTERS       --
-------------------------

function Item:setAmmoIn(ammo_in)
    tmp.ammo_in = nil
    parse('setammo', self.id, 0, ammo_in, self:getAmmo())
end

function Item:setAmmo(ammo)
    tmp.ammo = nil
    parse('setammo', self.id, 0, self:getAmmoIn(), ammo)
end

function Item:setPos(x, y)
    tmp.x, tmp.y = nil, nil
    self:respawn(self:getTypeId(), x, y, self:getAmmoIn(), self:getAmmo())
end

function Item:setX(x)
	self:setPos(x, self:getY())
end

function Item:setY(y)
	self:setPos(self:getX(), y)
end

-------------------------
--   STATIC METHODS    --
-------------------------

function Item.getLastId()
    local item_ids = Item.getAllRaw()
    return item_ids[#item_ids]
end

function Item.getAllRaw()
    return item(0, 'table')
end

function Item.getAll()
    return ITEMS
end

function Item.get(id)
    return ITEMS_ID[id]
end

function Item.getAt(x, y)
    local items = ITEMS
    local array = {}

    for i = 1, #items do
        local item = items[i]

        if item:getX() == x and item:getY() == y then
            array[#array] = item
        end
    end

    return array
end

-------------------------
--       GETTERS       --
-------------------------

function Item:exists()
    return item(self.id, 'exists')
end

function Item:getName()
    if not tmp.name then
        tmp.name = item(self.id, 'name')
    end
	return tmp.name
end

function Item:getTypeId()
    if not tmp.type_id then
        tmp.type_id = item(self.id, 'type')
    end
	return tmp.type_id
end

function Item:getUserId()
    if not tmp.user_id then
        tmp.user_id = item(self.id, 'player')
    end
	return tmp.user_id
end

function Item:getAmmo()
    if not tmp.ammo then
        tmp.ammo = item(self.id, 'ammo')
    end
	return tmp.ammo
end

function Item:getAmmoIn()
    if not tmp.ammo_in then
        tmp.ammo_in = item(self.id, 'ammoin')
    end
	return tmp.ammo_in
end

function Item:getMode()
    if not tmp.mode then
        tmp.mode = item(self.id, 'mode')
    end
	return tmp.mode
end

function Item:getX()
    if not tmp.x then
        tmp.x = item(self.id, 'x')
    end
	return tmp.x
end

function Item:getY()
    if not tmp.y then
        tmp.y = item(self.id, 'y')
    end
	return tmp.y
end

function Item:isDropped()
    if not tmp.is_dropped then
        tmp.is_dropped = item(self.id, 'dropped')
    end
	return tmp.is_dropped
end

function Item:getDropTimer()
    if not tmp.drop_timer then
        tmp.drop_timer = item(self.id, 'droptimer')
    end
	return tmp.drop_timer
end

-------------------------
--        INIT         --
-------------------------

return Item
