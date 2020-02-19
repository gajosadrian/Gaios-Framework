local ItemType = class()

local itemtype = itemtype

-------------------------
--        CONST        --
-------------------------

local types = {
    USP = 1, GLOCK = 2, DEAGLE = 3, P228 = 4, ELITE = 5,
    FIVESEVEN = 6, M3 = 10, XM1014 = 11, MP5 = 20, TMP = 21,
    MAC10 = 23, UMP45 = 23, AK47 = 30, SG552 = 31, M4A1 = 32,
    AUG = 33, SCOUT = 34, AWP = 35, G3SG1 = 36, SG550 = 37,
    GALIL = 38, FAMAS = 39, FNF2000 = 91, M249 = 40, LASER = 45,
    FLAMETHROWER = 46, RPG_LAUNCHER = 47, ROCKET_LAUNCHER = 48,
    GRENADE_LAUNCHER = 49, PORTAL_GUN = 88, M134 = 90, KNIFE = 50,
    MACHETE = 69, WRENCH = 74, CLAW = 78, CHAINSAW = 85, HE = 51,
    FLASHBANG = 52, SMOKE_GRENADE = 53, FLARE = 54, GAS_GRENADE = 72,
    MOLOTOV_COCKTAIL = 73, SNOWBALL = 75, AIRSTRIKE = 76, GUT_BOMB = 86,
    SATCHEL_CHARGE = 89, MINE = 77, LASER_MINE = 87, TACTICAL_SHIELD = 41,
    DEFUSE_KIT = 41, KEVLAR = 57, KEVLAR_HELM = 58, NIGHTVISION = 59,
    GAS_MASK = 60, PRIMARY_AMMO = 61, SECONDARY_AMMO = 62, BOMB = 55,
    PLANTED_BOMB = 63, MEDIKIT = 64, BANDAGE = 65, COINS = 66, MONEY = 67,
    GOLD = 68, RED_FLAG = 70, BLUE_FLAG = 71, LIGHT_ARMOR = 79, ARMOR = 80,
    HEAVY_ARMOUR = 81, MEDIC_ARMOR = 82, SUPER_ARMOR = 83, STEALTH_SUIT = 84,
}
for type_name, id in pairs(types) do
    ItemType[type_name] = id
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

function ItemType:getAmmoInAttribute()
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
    item_types[id] = ItemType.new(id)
end

function ItemType.getInstance(id)
    return item_types[id]
end

return ItemType
