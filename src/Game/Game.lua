Game.Game = class()
local Game = Game.Game

local instance

function Game:constructor()
end

function Game:getInstance()
    return instance
end

Game.__index = function(self, key)
    return switch(key) {

        checkusgnlogin = function()
            return game('sv_checkusgnlogin')
        end,

        daylighttime = function()
            return game('sv_daylighttime')
        end,

        forcelight = function()
            return game('sv_forcelight')
        end,

        fow = function()
            return game('sv_fow')
        end,

        friendlyfire = function()
            return game('sv_friendlyfire')
        end,

        gamemode = function()
            return game('sv_gamemode')
        end,

        gm = function()
            return game('sv_gm')
        end,

        hostport = function()
            return game('sv_hostport')
        end,

        lan = function()
            return game('sv_lan')
        end,

        map = function()
            return game('sv_map')
        end,

        maptransfer = function()
            return game('sv_maptransfer')
        end,

        maxplayers = function()
            return game('sv_maxplayers')
        end,

        name = function()
            return game('sv_name')
        end,

        offscreendamage = function()
            return game('sv_offscreendamage')
        end,

        password = function()
            return game('sv_password')
        end,

        rcon = function()
            return game('sv_rcon')
        end,

        rconusers = function()
            return game('sv_rconusers')
        end,

        specmode = function()
            return game('sv_specmode')
        end,

        spraytransfer = function()
            return game('sv_spraytransfer')
        end,

        usgnonly = function()
            return game('sv_usgnonly')
        end,

        --MP

        antispeeder = function()
            return game('mp_antispeeder')
        end,

        autogamemode = function()
            return game('mp_autogamemode')
        end,

        autoteambalance = function()
            return game('mp_autoteambalance')
        end,

        buymenu = function()
            return game('mp_buymenu')
        end,

        buytime = function()
            return game('mp_buytime')
        end,

        c4timer = function()
            return game('mp_c4timer')
        end,

        connectionlimit = function()
            return game('mp_connectionlimit')
        end,

        curtailedexplosions = function()
            return game('mp_curtailedexplosions')
        end,

        damagefactor = function()
            return game('mp_damagefactor')
        end,

        deathdrop = function()
            return game('mp_deathdrop')
        end,

        dmspawnmoney = function()
            return game('mp_dmspawnmoney')
        end,

        dropgrenades = function()
            return game('mp_dropgrenades')
        end,

        flashlight = function()
            return game('mp_flashlight')
        end,

        floodprot = function()
            return game('mp_floodprot')
        end,

        floodprotignoretime = function()
            return game('mp_floodprotignoretime')
        end,

        freezetime = function()
            return game('mp_freezetime')
        end,

        grenaderebuy = function()
            return game('mp_grenaderebuy')
        end,

        hostagepenalty = function()
            return game('mp_hostagepenalty')
        end,

        hovertext = function()
            return game('mp_hovertext')
        end,

        hud = function()
            return game('mp_hud')
        end,

        hudscale = function()
            return game('mp_hudscale')
        end,

        idleaction = function()
            return game('mp_idleaction')
        end,

        idlekick = function()
            return game('mp_idlekick')
        end,

        idletime = function()
            return game('mp_idletime')
        end,

        infammo = function()
            return game('mp_infammo')
        end,

        kevlar = function()
            return game('mp_kevlar')
        end,

        kickpercent = function()
            return game('mp_kickpercent')
        end,

        killbuildingmoney = function()
            return game('mp_killbuildingmoney')
        end,

        killbuildings = function()
            return game('mp_killbuildings')
        end,

        killinfo = function()
            return game('mp_killinfo')
        end,

        killteambuildings = function()
            return game('mp_killteambuildings')
        end,

        lagcompensation = function()
            return game('mp_lagcompensation')
        end,

        lagcompensationdivisor = function()
            return game('mp_lagcompensationdivisor')
        end,

        localrconoutput = function()
            return game('mp_localrconoutput')
        end,

        luamap = function()
            return game('mp_luamap')
        end,

        luaserver = function()
            return game('mp_luaserver')
        end,

        mapgoalscore = function()
            return game('mp_mapgoalscore')
        end,

        mapvoteratio = function()
            return game('mp_mapvoteratio')
        end,

        maxclientsip = function()
            return game('mp_maxclientsip')
        end,

        maxrconfails = function()
            return game('mp_maxrconfails')
        end,

        natholepunching = function()
            return game('mp_natholepunching')
        end,

        pinglimit = function()
            return game('mp_pinglimit')
        end,

        postspawn = function()
            return game('mp_postspawn')
        end,

        radar = function()
            return game('mp_radar')
        end,

        randomspawn = function()
            return game('mp_randomspawn')
        end,

        recoil = function()
            return game('mp_recoil')
        end,

        reservations = function()
            return game('mp_reservations')
        end,

        respawndelay = function()
            return game('mp_respawndelay')
        end,

        roundlimit = function()
            return game('mp_roundlimit')
        end,

        roundtime = function()
            return game('mp_roundtime')
        end,

        shotweakening = function()
            return game('mp_shotweakening')
        end,

        smokeblock = function()
            return game('mp_smokeblock')
        end,

        startmoney = function()
            return game('mp_startmoney')
        end,

        supply_items = function()
            return game('mp_supply_items')
        end,

        teamkillpenalty = function()
            return game('mp_teamkillpenalty')
        end,

        teleportreload = function()
            return game('mp_teleportreload')
        end,

        tempbantime = function()
            return game('mp_tempbantime')
        end,

        timelimit = function()
            return game('mp_timelimit')
        end,

        tkpunish = function()
            return game('mp_tkpunish')
        end,

        trace = function()
            return game('mp_trace')
        end,

        turretdamage = function()
            return game('mp_turretdamage')
        end,

        unbuildable = function()
            return game('mp_unbuildable')
        end,

        unbuyable = function()
            return game('mp_unbuyable')
        end,

        vulnerablehostages = function()
            return game('mp_vulnerablehostages')
        end,

        winlimit = function()
            return game('mp_winlimit')
        end,

        wpndmg = function()
            return game('mp_wpndmg')
        end,

        wpndmg_z1 = function()
            return game('mp_wpndmg_z1')
        end,

        wpndmg_z2 = function()
            return game('mp_wpndmg_z2')
        end,

        zombiedmg = function()
            return game('mp_zombiedmg')
        end,

        zombiekillequip = function()
            return game('mp_zombiekillequip')
        end,

        zombiekillscore = function()
            return game('mp_zombiekillscore')
        end,

        zombierecover = function()
            return game('mp_zombierecover')
        end,

        zombiespeedmod = function()
            return game('mp_zombiespeedmod')
        end,

        --READ_ONLY

        version = function()
            return game('version')
        end,

        dedicated = function()
            return game('dedicated')
        end,

        phase = function()
            return game('phase')
        end,

        round = function()
            return game('round')
        end,

        score_t = function()
            return game('score_t')
        end,

        score_ct = function()
            return game('score_ct')
        end,

        winrow_t = function()
            return game('winrow_t')
        end,

        winrow_ct = function()
            return game('winrow_ct')
        end,

        nextmap = function()
            return game('nextmap')
        end,

        port = function()
            return game('port')
        end,

        bombplanted = function()
            return game('bombplanted')
        end,

        sysfolder = function()
            return game('sysfolder')
        end,
    }
end

-- setters

Game.__newindex = function(self, key, value)
    switch(key) {
        checkusgnlogin = function()
            sv_checkusgnlogin(value)
        end,

        daylighttime = function()
            sv_daylighttime(value)
        end,

        forcelight = function()
            sv_forcelight(value)
        end,

        fow = function()
            sv_fow(value)
        end,

        friendlyfire = function()
            sv_friendlyfire(value)
        end,

        gamemode = function()
            sv_gamemode(value)
        end,

        gm = function()
            sv_gm(value)
        end,

        hostport = function()
            sv_hostport(value)
        end,

        lan = function()
            sv_lan(value)
        end,

        map = function()
            sv_map(value)
        end,

        maptransfer = function()
            sv_maptransfer(value)
        end,

        maxplayers = function()
            sv_maxplayers(value)
        end,

        name = function()
            sv_name(value)
        end,

        offscreendamage = function()
            sv_offscreendamage(value)
        end,

        password = function()
            sv_password(value)
        end,

        rcon = function()
            sv_rcon(value)
        end,

        rconusers = function()
            sv_rconusers(value)
        end,

        specmode = function()
            sv_specmode(value)
        end,

        spraytransfer = function()
            sv_spraytransfer(value)
        end,

        usgnonly = function()
            sv_usgnonly(value)
        end,

        --MP

        antispeeder = function()
            mp_antispeeder(value)
        end,

        autogamemode = function()
            mp_autogamemode(value)
        end,

        autoteambalance = function()
            mp_autoteambalance(value)
        end,

        buymenu = function()
            mp_buymenu(value)
        end,

        buytime = function()
            mp_buytime(value)
        end,

        c4timer = function()
            mp_c4timer(value)
        end,

        connectionlimit = function()
            mp_connectionlimit(value)
        end,

        curtailedexplosions = function()
            mp_curtailedexplosions(value)
        end,

        damagefactor = function()
            mp_damagefactor(value)
        end,

        deathdrop = function()
            mp_deathdrop(value)
        end,

        dmspawnmoney = function()
            mp_dmspawnmoney(value)
        end,

        dropgrenades = function()
            mp_dropgrenades(value)
        end,

        flashlight = function()
            mp_flashlight(value)
        end,

        floodprot = function()
            mp_floodprot(value)
        end,

        floodprotignoretime = function()
            mp_floodprotignoretime(value)
        end,

        freezetime = function()
            mp_freezetime(value)
        end,

        grenaderebuy = function()
            mp_grenaderebuy(value)
        end,

        hostagepenalty = function()
            mp_hostagepenalty(value)
        end,

        hovertext = function()
            mp_hovertext(value)
        end,

        hud = function()
            mp_hud(value)
        end,

        hudscale = function()
            mp_hudscale(value)
        end,

        idleaction = function()
            mp_idleaction(value)
        end,

        idlekick = function()
            mp_idlekick(value)
        end,

        idletime = function()
            mp_idletime(value)
        end,

        infammo = function()
            mp_infammo(value)
        end,

        kevlar = function()
            mp_kevlar(value)
        end,

        kickpercent = function()
            mp_kickpercent(value)
        end,

        killbuildingmoney = function()
            mp_killbuildingmoney(value)
        end,

        killbuildings = function()
            mp_killbuildings(value)
        end,

        killinfo = function()
            mp_killinfo(value)
        end,

        killteambuildings = function()
            mp_killteambuildings(value)
        end,

        lagcompensation = function()
            mp_lagcompensation(value)
        end,

        lagcompensationdivisor = function()
            mp_lagcompensationdivisor(value)
        end,

        localrconoutput = function()
            mp_localrconoutput(value)
        end,

        luamap = function()
            mp_luamap(value)
        end,

        luaserver = function()
            mp_luaserver(value)
        end,

        mapgoalscore = function()
            mp_mapgoalscore(value)
        end,

        mapvoteratio = function()
            mp_mapvoteratio(value)
        end,

        maxclientsip = function()
            mp_maxclientsip(value)
        end,

        maxrconfails = function()
            mp_maxrconfails(value)
        end,

        natholepunching = function()
            mp_natholepunching(value)
        end,

        pinglimit = function()
            mp_pinglimit(value)
        end,

        postspawn = function()
            mp_postspawn(value)
        end,

        radar = function()
            mp_radar(value)
        end,

        randomspawn = function()
            mp_randomspawn(value)
        end,

        recoil = function()
            mp_recoil(value)
        end,

        reservations = function()
            mp_reservations(value)
        end,

        respawndelay = function()
            mp_respawndelay(value)
        end,

        roundlimit = function()
            mp_roundlimit(value)
        end,

        roundtime = function()
            mp_roundtime(value)
        end,

        shotweakening = function()
            mp_shotweakening(value)
        end,

        smokeblock = function()
            mp_smokeblock(value)
        end,

        startmoney = function()
            mp_startmoney(value)
        end,

        supply_items = function()
            mp_supply_items(value)
        end,

        teamkillpenalty = function()
            mp_teamkillpenalty(value)
        end,

        teleportreload = function()
            mp_teleportreload(value)
        end,

        tempbantime = function()
            mp_tempbantime(value)
        end,

        timelimit = function()
            mp_timelimit(value)
        end,

        tkpunish = function()
            mp_tkpunish(value)
        end,

        trace = function()
            mp_trace(value)
        end,

        turretdamage = function()
            mp_turretdamage(value)
        end,

        unbuildable = function()
            mp_unbuildable(value)
        end,

        unbuyable = function()
            mp_unbuyable(value)
        end,

        vulnerablehostages = function()
            mp_vulnerablehostages(value)
        end,

        winlimit = function()
            mp_winlimit(value)
        end,

        wpndmg = function()
            mp_wpndmg(value)
        end,

        wpndmg_z1 = function()
            mp_wpndmg_z1(value)
        end,

        wpndmg_z2 = function()
            mp_wpndmg_z2(value)
        end,

        zombiedmg = function()
            mp_zombiedmg(value)
        end,

        zombiekillequip = function()
            mp_zombiekillequip(value)
        end,

        zombiekillscore = function()
            mp_zombiekillscore(value)
        end,

        zombierecover = function()
            mp_zombierecover(value)
        end,

        zombiespeedmod = function()
            mp_zombiespeedmod(value)
        end,
    }
end

instance = Game.Game.new()
