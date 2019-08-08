local ItemType
ItemType = class()

local types = {
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
for type, value in pairs(types) do
    ItemType[type:upper()] = value
end

function ItemType:constructor(id)
    self.id = id
end

function ItemType:getNameAttribute()
	return itemtype(self.id, 'name')
end

function ItemType:getDmgAttribute()
	return itemtype(self.id, 'dmg')
end

function ItemType:getDmgZ1Attribute()
	return itemtype(self.id, 'dmg_z1')
end

function ItemType:getDmgZ2Attribute()
	return itemtype(self.id, 'dmg_z2')
end

function ItemType:getRateAttribute()
	return itemtype(self.id, 'rate')
end

function ItemType:getReloadAttribute()
	return itemtype(self.id, 'reload')
end

function ItemType:getAmmoAttribute()
	return itemtype(self.id, 'ammo')
end

function ItemType:getAmmoinAttribute()
	return itemtype(self.id, 'ammoin')
end

function ItemType:getPriceAttribute()
	return itemtype(self.id, 'price')
end

function ItemType:getRangeAttribute()
	return itemtype(self.id, 'range')
end

function ItemType:getDispersionAttribute()
	return itemtype(self.id, 'dispersion')
end

function ItemType:getSlotAttribute()
	return itemtype(self.id, 'slot')
end

function ItemType:getRecoilAttribute()
	return itemtype(self.id, 'recoil')
end

-------------------------
--        INIT         --
-------------------------

local item_types = config('core.item_types')

for _, id in pairs(types) do
    item_types[_] = ItemType.new(id)
end

function ItemType.getInstance(id)
    return item_types[id]
end

return ItemType
