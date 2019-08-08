local Hook
Hook = class()

Hook.LIST = {
    always = {},
    assist = {'player', 'player', 'player'},
    attack = {'player'},
    attack2 = {'player', 2},
    bombdefuse = {'player'},
    bombexplode = {'player', 2, 3},
    bombplant = {'player', 2, 3},
    break = {1, 2, 'playerOr0'},
    build = {'player', 'objectType', 3, 4, 5, 'object'}, -- TODO: check if object_id is same everytime
    buildattempt = {'player', 'objectType', 3, 4, 5},
    buy = {'player', 'itemType'},
    clientdata = {'player', 2, 3, 4},
    clientsetting = {'player', 2, 3, 4},
    collect = {'player', 'item', 4, 5, 6},

    join = {'player'},
}

-------------------------
--        INIT         --
-------------------------

return Hook
