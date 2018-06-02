function Auth.player(id)
    return User.findOrFail(id)
end
