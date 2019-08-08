local UserFetch
UserFetch = class()

local USERS = config('core.users')

addhook('connect', function (id)
    local user = app('user').new(id)
    USERS:push(user)
end)

addhook('leave', function (id)
    local user = USERS:where('id', id):first()
    USERS:removeById(id)
end)

-------------------------
--        INIT         --
-------------------------

return UserFetch
