local ObjectType
ObjectType = class()

local types = {
    BARRICADE = 1, BARBED_WIRE = 2, WALL_1 = 3, WALL_2 = 4, WALL_3 = 5,
    GATE_FIELD = 6, DISPENSER = 7, TURRET = 8, SUPPLY = 9, BUILD_PLACE = 10,
    DUAL_TURRET = 11, TRIPLE_TURRET = 12, TELEPORTER_ENTRANCE = 13, TELEPORTER_EXIT = 14,
    SUPER_SUPPLY = 15, MINE = 20, LASER_MINE = 21, PORTAL_1 = 22, PORTAL_2 = 23, NPC = 30,
    DYNAMICI_MAGE = 40
}
for type, id in pairs(types) do
    ObjectType[type_name] = id
end

function ObjectType:constructor(id)
    self.id = id
end

-------------------------
--       GETTERS       --
-------------------------

function ObjectType:getNameAttribute()
	return objecttype(self.id, 'name')
end

function ObjectType:getInternalnameAttribute()
	return objecttype(self.id, 'internalname')
end

function ObjectType:getTypeAttribute()
	return objecttype(self.id, 'type')
end

function ObjectType:getPriceAttribute()
	return objecttype(self.id, 'price')
end

function ObjectType:getHealthAttribute()
	return objecttype(self.id, 'health')
end

function ObjectType:getKillmoneyAttribute()
	return objecttype(self.id, 'killmoney')
end

function ObjectType:getLimitAttribute()
	return objecttype(self.id, 'limit')
end

function ObjectType:getUpgradepointsAttribute()
	return objecttype(self.id, 'upgradepoints')
end

function ObjectType:getUpgradepriceAttribute()
	return objecttype(self.id, 'upgradeprice')
end

function ObjectType:getUpgradetoAttribute()
	return objecttype(self.id, 'upgradeto')
end

-------------------------
--       SETTERS       --
-------------------------

function ObjectType:setHealthAttribute(value)
	mp_building_health(self.name, value)
end

function ObjectType:setPriceAttribute(value)
	mp_building_price(self.name, value)
end

function ObjectType:setLimitAttribute(value)
	mp_building_limit(self.name, value)
end

-------------------------
--        INIT         --
-------------------------

local object_types = config('core.object_types')

for _, id in pairs(types) do
    object_types[id] = ObjectType.new(id)
end

function ObjectType.getInstance(id)
    return object_types[id]
end

return ObjectType
