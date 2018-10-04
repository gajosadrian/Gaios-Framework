Item.ItemType = class()
local ItemType = Item.ItemType

ItemType.Types = {
    usp = 1, glock = 2, deagle = 3, p228 = 4, elite = 5,
    fiveseven = 6, m3 = 10, xm1014 = 11, mp5 = 20, tmp = 21,
    mac10 = 23, ump45 = 23, ak47 = 30, sg552 = 31, m4a1 = 32,
    aug = 33, scout = 34, awp = 35, g3sg1 = 36, sg550 = 37,
    galil = 38, famas = 39, fnf2000 = 91, m249 = 40, laser = 45,
    flamethrower = 46, rpglauncher = 47, rocketlauncher = 48,
    grenadelauncher = 49, portalgun = 88, m134 = 90, knife = 50,
    machete = 69, wrench = 74, claw = 78, chainsaw = 85, he = 51,
    flashbang = 52, smokegrenade = 53, flare = 54, gasgrenade = 72,
    molotovcocktail = 73, snowball = 75, airstrike = 76, gutbomb = 86,
    satchelcharge = 89, mine = 77, lasermine = 87, tacticalshield = 41,
    defusekit = 41, kevlar = 57, kevlarhelm = 58, nightvision = 59,
    gasmask = 60, primaryammo = 61, secondaryammo = 62, bomb = 55,
    plantedbomb = 63, medikit = 64, bandage = 65, coins = 66, money = 67,
    gold = 68, redflag = 70, blueflag = 71, lightarmor = 79, armor = 80,
    heavyarmour = 81, medicarmor = 82, superarmor = 83, stealthsuit = 84
}

function ItemType:constructor(id)
    self.id = id
end

ItemType.__index = function(self, key)
    local id = rawget(self, 'id')

    return switch(key) {

        name = function()
            return itemtype(id, 'name')
        end,

        dmg = function()
            return itemtype(id, 'dmg')
        end,

        dmg_z1 = function()
            return itemtype(id, 'dmg_z1')
        end,

        dmg_z2 = function()
            return itemtype(id, 'dmg_z2')
        end,

        rate = function()
            return itemtype(id, 'rate')
        end,

        reload = function()
            return itemtype(id, 'reload')
        end,

        ammo = function()
            return itemtype(id, 'ammo')
        end,

        ammoin = function()
            return itemtype(id, 'ammoin')
        end,

        price = function()
            return itemtype(id, 'price')
        end,

        range = function()
            return itemtype(id, 'range')
        end,

        dispersion = function()
            return itemtype(id, 'dispersion')
        end,

        slot = function()
            return itemtype(id, 'slot')
        end,

        recoil = function()
            return itemtype(id, 'recoil')
        end,


        [Default] = function()
            return rawget(self, key)
        end,
    }
end
