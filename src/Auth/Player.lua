Auth.Player = class()
local Player = Auth.Player

function Player:constructor()
end

local function getPlayers(mode)
    local players = {}
    for _, playerId in pairs(player(0, mode)) do
        local steamId = player(playerId, 'steamid')
        table.insert(players, Auth.player(steamId))
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
