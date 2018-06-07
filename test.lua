------------------------
--     Horse MODEL    --
------------------------
Horse = class(Model)

function Horse:up()
    Schema.create('horses', function(table)
        table:increments('id')
        table:integer('userId')
        table:integer('level')
    end)
end

function down()
    Schema.dropIfExists('horses');
end

-- Horse.user
function Horse:relationUser()
    return self.belongsTo(User)
end

------------------------
--     Horse VIEW     --
------------------------
local viewUser = {}
HorseView = class(View)

function HorseView:ride(user)
end

------------------------
--  Horse CONTROLLER  --
------------------------
HorseController = class(Controller)

function HorseController:use(user)
    if user.horse.level > 2 then
        HorseView:ride(user)
    end
end

------------------
--     USER    --
------------------
User = class(Auth.Player)

function Horse:up()
    Schema.create('users', function(table)
        table:increments('id')
        table:increments('horseId')
    end)
end

function down()
    Schema.dropIfExists('users');
end

-- user.horse
function User:relationHorse()
    return self.hasOne(Horse)
end

Config.Auth.player.model = User
