local Item
Item = class()

function Item:constructor(...)
    self.id = nil
    self:spawn(...)

    self.type = app('item.itemtype', self.type_id)
end

function Item:spawn(...)
    parse('spawnitem', ...)
    self.id =  Item.lastSpawnedId()
end

function Item:remove()
    parse('removeitem', self.id)
end

function Item:setPos(x, y)
    local args = {self.type_id, x, y, self.ammoin, self.ammo}
    self:remove()
    self:spawn(unpack(args))
end

-------------------------
--        CONST        --
-------------------------

function Item.lastSpawnedId()
    local items = Item.getAllRaw()
    return items[#items]
end

function Item.getAllRaw()
    return item(0, 'table')
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

function Item:getAmmoinAttribute()
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

function Item:setAmmoInAttribute(value)
	setammo(self.id, 0, value, self.ammo)
end

function Item:setAmmoAttribute(value)
	setammo(self.id, 0, self.ammo_in, value)
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
