Auth.Player = class()
local Player = Auth.Player

function Player:constructor(playerId)
    self.playerId = playerId
end

function Player:kick(reason)
    kick(id, reason)
end

function Player:banIP(duration, reason)
    banip(self.ip, duration, reason)
end

function Player:banName(duration, reason)
    banname(self.name, duration, reason)
end

function Player:banSteam(duration, reason)
    bansteam(self.steamid, duration, reason)
end

function Player:banUSGN(duration, reason)
    banusgn(self.usgn, duration, reason)
end

function Player:kill()
    killplayer(id)
end

function Player:killCustom(killer, weapon)
    customkill(killer, weapon, id)
end

function Player:slap()
    slap(id)
end

function Player:setPos(x, y)
    setpos(id, x, y)
end

function Player:spawn(x, y)
    spawnplayer(id, x, y)
end

function Player:equip(item_id)
    equip(id, item_id)
end

function Player:reroute(address)
    reroute(id, address)
end

function Player:shake(power)
    shake(id, power)
end

function Player:strip(weapon)
    strip(id, weapon)
end

local function getPlayers(mode)
    local players = {}
    for _, playerId in pairs(player(0, mode)) do
        local steamId = player(playerId, 'steamid')
        table.insert(players, Config.Auth.player.model.find(steamId))
    end
    return players
end

function Player.getAll()
    return getPlayers('table')
end

function Player.getLivingPlayers()
    return getPlayers('tableliving')
end

function Player.getTerrorists()
    return getPlayers('team1')
end

function Player.getCounterTerrorists()
    return getPlayers('team2')
end

function Player.getCounterTerrorists()
    return getPlayers('team1living')
end

function Player.getCounterTerrorists()
    return getPlayers('team2living')
end

Player.__index = function(self, key)
    local id = rawget(self, 'playerId')

    return switch(key) {
        exists = function()
            return player(id, 'exists')
        end,

        name = function()
            return player(id, 'name')
        end,

        ip = function()
            return player(id, 'ip')
        end,

        port = function()
            return player(id, 'port')
        end,

        usgn = function()
            return player(id, 'usgn')
        end,

        usgnname = function()
            return player(id, 'usgnname')
        end,

        steamid = function()
            return player(id, 'steamid')
        end,

        steamname = function()
            return player(id, 'steamname')
        end,

        ping = function()
            return player(id, 'ping')
        end,

        idle = function()
            return player(id, 'idle')
        end,

        bot = function()
            return player(id, 'bot')
        end,

        team = function()
            return player(id, 'team')
        end,

        look = function()
            return player(id, 'look')
        end,

        x = function()
            return math.round(player(id, 'x'))
        end,

        y = function()
            return math.round(player(id, 'y'))
        end,

        rot = function()
            return player(id, 'rot')
        end,

        tilex = function()
            return player(id, 'tilex')
        end,

        tiley = function()
            return player(id, 'tiley')
        end,

        health = function()
            return player(id, 'health')
        end,

        armor = function()
            return player(id, 'armor')
        end,

        money = function()
            return player(id, 'money')
        end,

        score = function()
            return player(id, 'score')
        end,

        deaths = function()
            return player(id, 'deaths')
        end,

        teamkills = function()
            return player(id, 'teamkills')
        end,

        hostagekills = function()
            return player(id, 'hostagekills')
        end,

        teambuildingkills = function()
            return player(id, 'teambuildingkills')
        end,

        weapon = function()
            return player(id, 'weapontype')
        end,

        nightvision = function()
            return player(id, 'nightvision')
        end,

        defusekit = function()
            return player(id, 'defusekit')
        end,

        gasmask = function()
            return player(id, 'gasmask')
        end,

        bomb = function()
            return player(id, 'bomb')
        end,

        flag = function()
            return player(id, 'flag')
        end,

        reloading = function()
            return player(id, 'reloading')
        end,

        process = function()
            return player(id, 'process')
        end,

        sprayname = function()
            return player(id, 'sprayname')
        end,

        spraycolor = function()
            return player(id, 'spraycolor')
        end,

        votekick = function()
            return player(id, 'votekick')
        end,

        votemap = function()
            return player(id, 'votemap')
        end,

        favteam = function()
            return player(id, 'favteam')
        end,

        spectating = function()
            return player(id, 'spectating')
        end,

        speedmod = function()
            return player(id, 'speedmod')
        end,

        maxhealth = function()
            return player(id, 'maxhealth')
        end,

        rcon = function()
            return player(id, 'rcon')
        end,

        ai_flash = function()
            return player(id, 'ai_flash')
        end,

        screenw = function()
            return player(id, 'screenw')
        end,

        screenh = function()
            return player(id, 'screenh')
        end,

        mousex = function()
            return player(id, 'mousex')
        end,

        mousey = function()
            return player(id, 'mousey')
        end,

        mousemapx = function()
            return player(id, 'mousemapx')
        end,

        mousemapy = function()
            return player(id, 'mousemapy')
        end,

        [Default] = function()
            return rawget(self, key)
        end,
    }
end

Player.__newindex = function(self, key, value)
    local id = rawget(self, 'playerId')

    switch(key) {
        name = function() -- server message while changing
            setname(id, value, 0)
        end,
        name2 = function() -- hidden
            setname(id, value, 1)
        end,

        team = function()
            if value == 1 then
                maket(id)
            elseif value == 2 then
                makect(id)
            else
                makespec(id)
            end
        end,

        x = function()
            setpos(id, value, self.y)
        end,

        y = function()
            setpos(id, self.x, value)
        end,

        tilex = function()
            setpos(id, misc.tile_to_pixel(value), self.y)
        end,

        tiley = function()
            setpos(id, self.x, misc.tile_to_pixel(value))
        end,

        health = function()
            sethealth(id, value)
        end,

        armor = function()
            setarmor(id, value)
        end,

        money = function()
            setmoney(id, value)
        end,

        score = function()
            setscore(id, value)
        end,

        deaths = function()
            setdeaths(id, value)
        end,

        weapon = function()
            setweapon(id, value)
        end,

        speedmod = function()
            speedmod(id, value)
        end,

        maxhealth = function()
            setmaxhealth(id, value)
        end,

        [Default] = function()
            rawset(self, key, value)
        end,
    }
end
