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

instance = Game.Game.new()
