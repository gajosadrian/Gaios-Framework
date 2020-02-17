local Game = class()
local instance

-------------------------
--       Methods       --
-------------------------

function Game.getInstance()
    if not instance then
        instance = Game.new()
    end
    return instance
end

-------------------------
--       GETTERS       --
-------------------------

function Game:getCheckusgnloginAttribute()
    return game('sv_checkusgnlogin')
end

function Game:getDaylighttimeAttribute()
    return game('sv_daylighttime')
end

function Game:getForcelightAttribute()
    return game('sv_forcelight')
end

function Game:getFowAttribute()
    return game('sv_fow')
end

function Game:getFriendlyfireAttribute()
    return game('sv_friendlyfire')
end

function Game:getGamemodeAttribute()
    return game('sv_gamemode')
end

function Game:getGmAttribute()
    return game('sv_gm')
end

function Game:getHostportAttribute()
    return game('sv_hostport')
end

function Game:getLanAttribute()
    return game('sv_lan')
end

function Game:getMapAttribute()
    return game('sv_map')
end

function Game:getMaptransferAttribute()
    return game('sv_maptransfer')
end

function Game:getMaxplayersAttribute()
    return game('sv_maxplayers')
end

function Game:getNameAttribute()
    return game('sv_name')
end

function Game:getOffscreendamageAttribute()
    return game('sv_offscreendamage')
end

function Game:getPasswordAttribute()
    return game('sv_password')
end

function Game:getRconAttribute()
    return game('sv_rcon')
end

function Game:getRconusersAttribute()
    return game('sv_rconusers')
end

function Game:getSpecmodeAttribute()
    return game('sv_specmode')
end

function Game:getSpraytransferAttribute()
    return game('sv_spraytransfer')
end

function Game:getUsgnonlyAttribute()
    return game('sv_usgnonly')
end

function Game:getAntispeederAttribute()
    return game('mp_antispeeder')
end

function Game:getAutogamemodeAttribute()
    return game('mp_autogamemode')
end

function Game:getAutoteambalanceAttribute()
    return game('mp_autogamemode')
end

function Game:getBuymenuAttribute()
    return game('mp_buymenu')
end

function Game:getBuytimeAttribute()
    return game('mp_buytime')
end

function Game:getC4timerAttribute()
    return game('mp_c4timer')
end

function Game:getConnectionlimitAttribute()
    return game('mp_connectionlimit')
end

function Game:getCurtailedexplosionsAttribute()
    return game('mp_curtailedexplosions')
end

function Game:getDamagefactorAttribute()
    return game('mp_damagefactor')
end

function Game:getDeathdropAttribute()
    return game('mp_deathdrop')
end

function Game:getDmspawnmoneyAttribute()
    return game('mp_dmspawnmoney')
end

function Game:getDropgrenadesAttribute()
    return game('mp_dropgrenades')
end

function Game:getflashlightAttribute()
    return game('mp_flashlight')
end

function Game:getFloodprotAttribute()
    return game('mp_floodprot')
end

function Game:getfloodprotignoretimeAttribute()
    return game('mp_floodprotignoretime')
end

function Game:getFreezetimeAttribute()
	return game('mp_freezetime')
end

function Game:getGrenaderebuyAttribute()
	return game('mp_grenaderebuy')
end

function Game:getHostagepenaltyAttribute()
	 return game('mp_hostagepenalty')
end

function Game:getHovertextAttribute()
	 return game('mp_hovertext')
end

function Game:getHudAttribute()
	return game('mp_hud')
end

function Game:getHudscaleAttribute()
	return game('mp_hudscale')
end

function Game:getIdleactionAttribute()
	return game('mp_idleaction')
end

function Game:getIdlekickAttribute()
	return game('mp_idlekick')
end

function Game:getIdletimeAttribute()
	return game('mp_idletime')
end

function Game:getInfammoAttribute()
	return game('mp_infammo')
end

function Game:getKevlarAttribute()
	return game('mp_kevlar')
end

function Game:getKickpercentAttribute()
	return game('mp_kickpercent')
end

function Game:getKillbuildingmoneyAttribute()
	return game('mp_killbuildingmoney')
end

function Game:getKillbuildingsAttribute()
	return game('mp_killbuildings')
end

function Game:getKillinfoAttribute()
	return game('mp_killinfo')
end

function Game:getKillteambuildingsAttribute()
	return game('mp_killteambuildings')
end

function Game:getLagcompensationAttribute()
	return game('mp_lagcompensation')
end

function Game:getLagcompensationdivisorAttribute()
	return game('mp_lagcompensationdivisor')
end

function Game:getLocalrconoutputAttribute()
	return game('mp_localrconoutput')
end

function Game:getLuamapAttribute()
	return game('mp_luamap')
end

function Game:getLuaserverAttribute()
	return game('mp_luaserver')
end

function Game:getMapgoalscoreAttribute()
	return game('mp_mapgoalscore')
end

function Game:getMapvoteratioAttribute()
	return game('mp_mapvoteratio')
end

function Game:getMaxclientsipAttribute()
	return game('mp_maxclientsip')
end

function Game:getMaxrconfailsAttribute()
	return game('mp_maxrconfails')
end

function Game:getNatholepunchingAttribute()
	return game('mp_natholepunching')
end

function Game:getPinglimitAttribute()
	return game('mp_pinglimit')
end

function Game:getPostspawnAttribute()
	return game('mp_postspawn')
end

function Game:getRadarAttribute()
	return game('mp_radar')
end

function Game:getRandomspawnAttribute()
	return game('mp_randomspawn')
end

function Game:getRecoilAttribute()
	return game('mp_recoil')
end

function Game:getReservationsAttribute()
	return game('mp_reservations')
end

function Game:getRespawndelayAttribute()
	return game('mp_respawndelay')
end

function Game:getRoundlimitAttribute()
	return game('mp_roundlimit')
end

function Game:getRoundtimeAttribute()
	return game('mp_roundtime')
end

function Game:getShotweakeningAttribute()
	return game('mp_shotweakening')
end

function Game:getSmokeblockAttribute()
	return game('mp_smokeblock')
end

function Game:getStartmoneyAttribute()
	return game('mp_startmoney')
end

function Game:getSupply_itemsAttribute()
	return game('mp_supply_items')
end

function Game:getTeamkillpenaltyAttribute()
	return game('mp_teamkillpenalty')
end

function Game:getTeleportreloadAttribute()
	return game('mp_teleportreload')
end

function Game:getTempbantimeAttribute()
	return game('mp_tempbantime')
end

function Game:getTimelimitAttribute()
	return game('mp_timelimit')
end

function Game:getTkpunishAttribute()
	return game('mp_tkpunish')
end

function Game:getTraceAttribute()
	return game('mp_trace')
end

function Game:getTurretdamageAttribute()
	return game('mp_turretdamage')
end

function Game:getUnbuildableAttribute()
	return game('mp_unbuildable')
end

function Game:getUnbuyableAttribute()
	return game('mp_unbuyable')
end

function Game:getVulnerablehostagesAttribute()
	return game('mp_vulnerablehostages')
end

function Game:getWinlimitAttribute()
	return game('mp_winlimit')
end

function Game:getWpndmgAttribute()
	return game('mp_wpndmg')
end

function Game:getWpndmg_z1Attribute()
	return game('mp_wpndmg_z1')
end

function Game:getWpndmg_z2Attribute()
	return game('mp_wpndmg_z2')
end

function Game:getZombiedmgAttribute()
	return game('mp_zombiedmg')
end

function Game:getZombiekillequipAttribute()
	return game('mp_zombiekillequip')
end

function Game:getZombiekillscoreAttribute()
	return game('mp_zombiekillscore')
end

function Game:getZombierecoverAttribute()
	return game('mp_zombierecover')
end

function Game:getZombiespeedmodAttribute()
	return game('mp_zombiespeedmod')
end

function Game:getVersionAttribute()
	return game('version')
end

function Game:getdedicatedAttribute()
	return game('dedicated')
end

function Game:getPhaseAttribute()
	return game('phase')
end

function Game:getRoundAttribute()
	return game('round')
end

function Game:getScore_tAttribute()
	return game('score_t')
end

function Game:getScore_ctAttribute()
	return game('score_ct')
end

function Game:getWinrow_tAttribute()
	return game('winrow_t')
end

function Game:getWinrow_ctAttribute()
	return game('winrow_ct')
end

function Game:getNextmapAttribute()
	return game('nextmap')
end

function Game:getPortAttribute()
	return game('port')
end

function Game:getBombplantedAttribute()
	return game('bombplanted')
end

function Game:getSysfolderAttribute()
	return game('sysfolder')
end

-------------------------
--       SETTERS       --
-------------------------

function Game:setCheckusgnloginAttribute(value)
    sv_checkusgnlogin(value)
end

function Game:setDaylighttimeAttribute(value)
	sv_daylighttime(value)
end

function Game:setForcelightAttribute(value)
	sv_forcelight(value)
end

function Game:setFowAttribute(value)
	sv_fow(value)
end

function Game:setFriendlyfireAttribute(value)
	sv_friendlyfire(value)
end

function Game:setGamemodeAttribute(value)
	sv_gamemode(value)
end

function Game:setGmAttribute(value)
	sv_gm(value)
end

function Game:setHostportAttribute(value)
	sv_hostport(value)
end

function Game:setLanAttribute(value)
	sv_lan(value)
end

function Game:setMapAttribute(value)
	sv_map(value)
end

function Game:setMaptransferAttribute(value)
	sv_maptransfer(value)
end

function Game:setMaxplayersAttribute(value)
	sv_maxplayers(value)
end

function Game:setNameAttribute(value)
	sv_name(value)
end

function Game:setOffscreendamageAttribute(value)
	sv_offscreendamage(value)
end

function Game:setPasswordAttribute(value)
	sv_password(value)
end

function Game:setRconAttribute(value)
	sv_rcon(value)
end

function Game:setRconusersAttribute(value)
	sv_rconusers(value)
end

function Game:setSpecmodeAttribute(value)
	sv_specmode(value)
end

function Game:setSpraytransferAttribute(value)
	sv_spraytransfer(value)
end

function Game:setUsgnonlyAttribute(value)
	sv_usgnonly(value)
end

function Game:setAntispeederAttribute(value)
	mp_antispeeder(value)
end

function Game:setAutogamemodeAttribute(value)
	mp_autogamemode(value)
end

function Game:setAutoteambalanceAttribute(value)
	mp_autoteambalance(value)
end

function Game:setBuymenuAttribute(value)
	mp_buymenu(value)
end

function Game:setBuytimeAttribute(value)
	mp_buytime(value)
end

function Game:setC4timerAttribute(value)
	mp_c4timer(value)
end

function Game:setConnectionlimitAttribute(value)
	mp_connectionlimit(value)
end

function Game:setCurtailedexplosionsAttribute(value)
	mp_curtailedexplosions(value)
end

function Game:setDamagefactorAttribute(value)
	mp_damagefactor(value)
end

function Game:setDeathdropAttribute(value)
	mp_deathdrop(value)
end

function Game:setDmspawnmoneyAttribute(value)
	mp_dmspawnmoney(value)
end

function Game:setDropgrenadesAttribute(value)
	mp_dropgrenades(value)
end

function Game:setFlaslightAttribute(value)
	mp_flashlight(value)
end

function Game:setFloodprotAttribute(value)
	mp_floodprot(value)
end

function Game:setFloodprotignoretimeAttribute(value)
	mp_floodprotignoretime(value)
end

function Game:setFreezetimeAttribute(value)
	mp_freezetime(value)
end

function Game:setGrenaderebuyAttribute(value)
	mp_grenaderebuy(value)
end

function Game:setHostagepenaltyAttribute(value)
	mp_hostagepenalty(value)
end

function Game:setHovertextAttribute(value)
	mp_hovertext(value)
end

function Game:setHudAttribute(value)
	mp_hud(value)
end

function Game:setHudscaleAttribute(value)
	mp_hudscale(value)
end

function Game:setHudscaleAttribute(value)
	mp_hudscale(value)
end

function Game:setIdleactionAttribute(value)
	mp_idleaction(value)
end

function Game:setIdlekickAttribute(value)
	mp_idlekick(value)
end

function Game:setIdletimeAttribute(value)
	mp_idletime(value)
end

function Game:setInfammoAttribute(value)
	mp_infammo(value)
end

function Game:setKevlarAttribute(value)
	mp_kevlar(value)
end

function Game:setKickpercentAttribute(value)
	mp_kickpercent(value)
end

function Game:setKillbuildingmoneyAttribute(value)
	mp_killbuildingmoney(value)
end

function Game:setKillbuildingsAttribute(value)
	mp_killbuildings(value)
end

function Game:setKillinfoAttribute(value)
	mp_killinfo(value)
end

function Game:setKillteambuildingsAttribute(value)
	mp_killteambuildings(value)
end

function Game:setLagcompensationAttribute(value)
	mp_lagcompensation(value)
end

function Game:setLagcompensationdivisorAttribute(value)
	mp_lagcompensationdivisor(value)
end

function Game:setLocalrconoutputAttribute(value)
	mp_localrconoutput(value)
end

function Game:setLuamapAttribute(value)
	mp_luamap(value)
end

function Game:setLuaserverAttribute(value)
	mp_luaserver(value)
end

function Game:setMapgoalscoreAttribute(value)
	mp_mapgoalscore(value)
end

function Game:setMapvoteratioAttribute(value)
	mp_mapvoteratio(value)
end

function Game:setMaxclientsipAttribute(value)
	mp_maxclientsip(value)
end

function Game:setMaxrconfailsAttribute(value)
	mp_maxrconfails(value)
end

function Game:setNatholepunchingAttribute(value)
	mp_natholepunching(value)
end

function Game:setPinglimitAttribute(value)
	mp_pinglimit(value)
end

function Game:setPostspawnAttribute(value)
	mp_postspawn(value)
end

function Game:setRadarAttribute(value)
	mp_radar(value)
end

function Game:setRandomspawnAttribute(value)
	mp_randomspawn(value)
end

function Game:setRecoilAttribute(value)
	mp_recoil(value)
end

function Game:setReservationsAttribute(value)
	mp_reservations(value)
end

function Game:setRespawndelayAttribute(value)
	mp_respawndelay(value)
end

function Game:setRoundlimitAttribute(value)
	mp_roundlimit(value)
end

function Game:setRoundtimeAttribute(value)
	mp_roundtime(value)
end

function Game:setShotweakeningAttribute(value)
	mp_shotweakening(value)
end

function Game:setSmokeblockAttribute(value)
	mp_smokeblock(value)
end

function Game:setStartmoneyAttribute(value)
	mp_startmoney(value)
end

function Game:setSupply_itemsAttribute(value)
	mp_supply_items(value)
end

function Game:setTeamkillpenaltyAttribute(value)
	mp_teamkillpenalty(value)
end

function Game:setTeleportreloadAttribute(value)
	mp_teleportreload(value)
end

function Game:setTempbantimeAttribute(value)
	mp_tempbantime(value)
end

function Game:setTimelimitAttribute(value)
	mp_timelimit(value)
end

function Game:setTkpunishAttribute(value)
	mp_tkpunish(value)
end

function Game:setTraceAttribute(value)
	mp_trace(value)
end

function Game:setTurretdamageAttribute(value)
	mp_turretdamage(value)
end

function Game:setUnbuildableAttribute(value)
	mp_unbuildable(value)
end

function Game:setUnbuyableAttribute(value)
	mp_unbuyable(value)
end

function Game:setVulnarablehostagesAttribute(value)
	mp_vulnerablehostages(value)
end

function Game:setWinlimitAttribute(value)
	mp_winlimit(value)
end

function Game:setWpndmgAttribute(value)
	mp_wpndmg(value)
end

function Game:setWpndmg_z1Attribute(value)
	mp_wpndmg_z1(value)
end

function Game:setWpndmg_z2Attribute(value)
	mp_wpndmg_z2(value)
end

function Game:setZombiedmgAttribute(value)
	mp_zombiedmg(value)
end

function Game:setZombiekillequipAttribute(value)
	mp_zombiekillequip(value)
end

function Game:setZombiekillscoreAttribute(value)
	mp_zombiekillscore(value)
end

function Game:setZombierecoverAttribute(value)
	mp_zombierecover(value)
end

function Game:setZombiespeedmodAttribute(value)
	mp_zombiespeedmod(value)
end

-------------------------
--        INIT         --
-------------------------

return Game
