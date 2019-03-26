local ObjectType
ObjectType = class()

local types = {
    barricade = 1, barbedwire = 2, wall1 = 3, wall2 = 4, wall3 = 5,
    gatefield = 6, dispenser = 7, turret = 8, supply = 9, buildplace = 10,
    dualturret = 11, tripleturret = 12, teleporterentrance = 13, teleporterexit = 14,
    supersupply = 15, mine = 20, lasermine = 21, portal1 = 22, portal2 = 23, npc = 30,
    dynamicimage = 40
}
for type, value in pairs(types) do
    ObjectType[type:upper()] = value
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

return ObjectType
