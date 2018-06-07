------------------------
--  Roles MIGRATION   --
------------------------
CreateRolesTable = class(Migration)

function CreateRolesTable:up()
    Schema.create('roles', function(table)
        table:integer('id')
        table:integer('name')

        table:integer('userId')
    end)
end

function CreateRolesTable:down()
    Schema.dropIfExists('roles');
end

------------------------
--     Role MODEL     --
------------------------
Role = class(Model)

-- Role.user
function Role:relation_User()
    return self.belongsTo(User)
end

------------------------
--     Role VIEW      --
------------------------
local viewUser = {}
RoleView = class(View)

function RoleView:welcome(user)
    -- code
end

------------------------
--  Role CONTROLLER   --
------------------------
RoleController = class(Controller)

function RoleController:join(user)
    if user.role.id == 100 then
        RoleView:welcome(user)
    end
end

------------------------
--  Users MIGRATION   --
------------------------
CreateUsersTable = class(Migration)

function CreateUsersTable:up()
    Schema.create('users', function(table)
        table:increments('id')

        table:increments('roleId')
    end)
end

function CreateUsersTable:down()
    Schema.dropIfExists('users');
end

------------------------
--     User MODEL     --
------------------------
User = class(Auth.Player)

-- User.role
function User:relation_Role()
    return self.hasOne(Role)
end

Config.Auth.player.model = User
