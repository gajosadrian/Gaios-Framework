Object.ObjectType = class()
local ObjectType = Object.ObjectType

ObjectType.Types = {
    barricade = 1, barbedwire = 2, wall1 = 3, wall2 = 4, wall3 = 5,
    gatefield = 6, dispenser = 7, turret = 8, supply = 9, buildplace = 10,
    dualturret = 11, tripleturret = 12, teleporterentrance = 13, teleporterexit = 14,
    supersupply = 15, mine = 20, lasermine = 21, portal1 = 22, portal2 = 23, npc = 30,
    dynamicimage = 40
}

function ObjectType:constructor(id)
    self.id = id
end

ObjectType.__index = function(self, key)
    local id = rawget(self, 'id')

    return switch(key) {
        name = function()
            return objecttype(id, 'name')
        end,

        internalname = function()
            return objecttype(id, 'internalname')
        end,

        type = function()
            return objecttype(id, 'type')
        end,

        price = function()
            return objecttype(id, 'price')
        end,

        health = function()
            return objecttype(id, 'health')
        end,

        killmoney = function()
            return objecttype(id, 'killmoney')
        end,

        limit = function()
            return objecttype(id, 'limit')
        end,

        upgradepoints = function()
            return objecttype(id, 'upgradepoints')
        end,

        upgradeprice = function()
            return objecttype(id, 'upgradeprice')
        end,

        upgradeto = function()
            return objecttype(id, 'upgradeto')
        end,

        [Default] = function()
            return rawget(self, key)
        end,
    }
end

ObjectType.__newindex = function(self, key, value)
    switch(key) {
        health = function(health)
            mp_building_health(self.name, health)
        end,

        price = function(price)
            mp_building_price(self.name, price)
        end,

        limit = function(limit)
            mp_building_limit(self.name, limit)
        end,
    }
end
