function Auth.player(id)
    local Player = Config.Auth.player.model
    return Player.findOrFail(id)
end
