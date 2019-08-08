local User
User = class()

function User:constructor(id)
    self.id = id
end

function User:kick(reason)
    kick(self.id, reason)
end

function User:banIP(duration, reason)
    banip(self.ip, duration, reason)
end

function User:banName(duration, reason)
    banname(self.name, duration, reason)
end

function User:banSteam(duration, reason)
    bansteam(self.steamid, duration, reason)
end

function User:banUSGN(duration, reason)
    banusgn(self.usgn, duration, reason)
end

function User:kill()
    killplayer(self.id)
end

function User:killCustom(killer, weapon)
    customkill(killer, weapon, id)
end

function User:slap()
    slap(self.id)
end

function User:setPos(x, y)
    setpos(self.id, x, y)
end

function User:spawn(x, y)
    spawnplayer(self.id, x, y)
end

function User:equip(item_id)
    equip(self.id, item_id)
end

function User:reroute(address)
    reroute(self.id, address)
end

function User:shake(power)
    shake(self.id, power)
end

function User:strip(weapon)
    strip(self.id, weapon)
end

-------------------------
--        CONST        --
-------------------------

// TODO
local function getUsers(mode)
    local players = {}
    for _, id in pairs(player(0, mode)) do
        local steamId = player(id, 'steamid')
        table.insert(players, Config.Auth.player.model.find(steamId))
    end
    return players
end

function User.getAll()
    return getUsers('table')
end

function User.getLivingUsers()
    return getUsers('tableliving')
end

function User.getTerrorists()
    return getUsers('team1')
end

function User.getCounterTerrorists()
    return getUsers('team2')
end

function User.getLivingTerrorists()
    return getUsers('team1living')
end

function User.getLivingCounterTerrorists()
    return getUsers('team2living')
end

-------------------------
--       GETTERS       --
-------------------------

function User:getExistsAttribute()
	return player(self.id, 'exists')
end

function User:getNameAttribute()
	return player(self.id, 'name')
end

function User:getIpAttribute()
	return player(self.id, 'ip')
end

function User:getPortAttribute()
	return player(self.id, 'port')
end

function User:getUsgnAttribute()
	return player(self.id, 'usgn')
end

function User:getUsgnnameAttribute()
	return player(self.id, 'Usgnname')
end

function User:getSteamidAttribute()
	return player(self.id, 'steamid')
end

function User:getSteamnameAttribute()
	return player(self.id, 'steamname')
end

function User:getPingAttribute()
	return player(self.id, 'ping')
end

function User:getIdleAttribute()
	return player(self.id, 'idle')
end

function User:getBotAttribute()
	return player(self.id, 'bot')
end

function User:getTeamAttribute()
	return player(self.id, 'team')
end

function User:getLookAttribute()
	return player(self.id, 'look')
end

function User:getXAttribute()
	return player(self.id, 'x')
end

function User:getYAttribute()
	return player(self.id, 'y')
end

function User:getRotAttribute()
	return player(self.id, 'rot')
end

function User:getTilexAttribute()
	return player(self.id, 'tilex')
end

function User:getTileyAttribute()
	return player(self.id, 'tiley')
end

function User:getHealthAttribute()
	return player(self.id, 'health')
end

function User:getArmorAttribute()
	return player(self.id, 'armor')
end

function User:getMoneyAttribute()
	return player(self.id, 'money')
end

function User:getScoreAttribute()
	return player(self.id, 'score')
end

function User:getDeathsAttribute()
	return player(self.id, 'deaths')
end

function User:getTeamkillsAttribute()
	return player(self.id, 'teamkills')
end

function User:getHostagekillsAttribute()
	return player(self.id, 'hostagekills')
end

function User:getTeambuildingkillsAttribute()
	return player(self.id, 'teambuildingkills')
end

function User:getWeaponAttribute()
	return player(self.id, 'weapontype')
end

function User:getNightvisionAttribute()
	return player(self.id, 'nightvision')
end

function User:getDefusekitAttribute()
	return player(self.id, 'defusekit')
end

function User:getGasmaskAttribute()
	return player(self.id, 'gasmask')
end

function User:getBombAttribute()
	return player(self.id, 'bomb')
end

function User:getFlagAttribute()
	return player(self.id, 'flag')
end

function User:getReloadingAttribute()
	return player(self.id, 'reloading')
end

function User:getProcessAttribute()
	return player(self.id, 'process')
end

function User:getSpraynameAttribute()
	return player(self.id, 'sprayname')
end

function User:getSpraycolorAttribute()
	return player(self.id, 'spraycolor')
end

function User:getVotekickAttribute()
	return player(self.id, 'votekick')
end

function User:getVotemapAttribute()
	return player(self.id, 'votemap')
end

function User:getFavteamAttribute()
	return player(self.id, 'favteam')
end

function User:getSpectatingAttribute()
	return player(self.id, 'spectating')
end

function User:getSpeedmodAttribute()
	return player(self.id, 'speedmod')
end

function User:getMaxhealthAttribute()
	return player(self.id, 'maxhealth')
end

function User:getRconAttribute()
	return player(self.id, 'rcon')
end

function User:getAi_flashAttribute()
	return player(self.id, 'ai_flash')
end

function User:getScreenwAttribute()
	return player(self.id, 'screenw')
end

function User:getScreenhAttribute()
	return player(self.id, 'screenh')
end

function User:getMousexAttribute()
	return player(self.id, 'mousex')
end

function User:getMouseyAttribute()
	return player(self.id, 'mousey')
end

function User:getMousemapxAttribute()
	return player(self.id, 'mousemapx')
end

function User:getMousemapyAttribute()
	return player(self.id, 'mousemapy')
end

-------------------------
--       SETTERS       --
-------------------------

function User:setNameAttribute(value)
	setname(self.id, value, 1)
end

function User:setName2Attribute(value) -- server message while changing
	setname(self.id, value, 0)
end

function User:setTeamAttribute(value)
	if value == 1 then
		maket(self.id)
	elseif value == 2 then
		makect(self.id)
	else
		makespec(self.id)
	end
end

function User:setXAttribute(value)
	setpos(self.id, value, self.y)
end

function User:setYAttribute(value)
	setpos(self.id, self.x, value)
end

function User:setTilexAttribute(value)
	setpos(self.id, misc.tile_to_pixel(value), self.y)
end

function User:setTileyAttribute(value)
	setpos(self.id, self.x, misc.tile_to_pixel(value))
end

function User:setHealthAttribute(value)
	sethealth(self.id, value)
end

function User:setArmorAttribute(value)
	setarmor(self.id, value)
end

function User:setMoneyAttribute(value)
	setmoney(self.id, value)
end

function User:setScoreAttribute(value)
	setscore(self.id, value)
end

function User:setDeathsAttribute(value)
	setdeaths(self.id, value)
end

function User:setWeaponAttribute(value)
	setweapon(self.id, value)
end

function User:setSpeedmodAttribute(value)
	speedmod(self.id, value)
end

function User:setMaxhealthAttribute(value)
	setmaxhealth(self.id, value)
end

-------------------------
--        INIT         --
-------------------------

return User
