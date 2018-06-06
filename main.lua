-------------------------
--       HELPER        --
-------------------------

local __DIR__ = 'sys/lua/Gaios-Framework/'

function dofileDir(dir, deep)
    deep = (deep == nil) and true or false

    for _, v in io.enumdir(dir) do
        if not v then
            v = _
        end

        if v:sub(-4) == '.lua' then
            dofile(dir .. v)
        elseif deep and v:sub(1, 1) ~= '.' then
            dofileDir(dir .. v .. '/', deep)
        end
    end
end

-------------------------
--        INIT         --
-------------------------
dofileDir(__DIR__ .. 'lib/')

Config = {}
for _, v in io.enumdir(__DIR__ .. 'config/') do
    if v:sub(-4) == '.lua' then
        local name = v:sub(1, -5)
        _G['Config'][name] = require(__DIR__ .. 'config/' .. name)
    end
end

for _, v in io.enumdir(__DIR__ .. 'src/') do
    if v:sub(-4) ~= '.lua' then
        _G[v] = {}
    end
end

dofileDir(__DIR__ .. 'src/')

if type(Config.Auth.player.model) == 'string' then
    local words = Config.Auth.player.model:split('.')
    Config.Auth.player.model = _G[words[1]][words[2]]
end
