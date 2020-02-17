-------------------------
--       LIBRARY       --
-------------------------

local __DIR__ = 'sys/lua/Gaios-Framework/'

function dofiledir(dir, deep)
    deep = (deep == nil) and true or false
    for _, v in io.enumdir(dir) do
        if not v then
            v = _
        end
        if v:sub(-4) == '.lua' then
            dofile(dir .. v)
        elseif deep and v:sub(1, 1) ~= '.' then
            dofiledir(dir .. v .. '/', deep)
        end
    end
end

dofiledir(__DIR__ .. 'lib/before/', false)
dofiledir(__DIR__ .. 'lib/', false)

function G(var)
    local fields = var:split('.')
    local _g = _G
    for _, field in pairs(fields) do
        _g = _g[field]
    end
    return _g
end

-------------------------
--       CONFIG        --
-------------------------

local _config = {}
for _, v in io.enumdir(__DIR__ .. 'config/') do
    if v:sub(-4) == '.lua' then
        local name = v:sub(1, -5)
        _config[name] = require(__DIR__ .. 'config/' .. name)
    end
end
function config(var)
    local fields = var:split('.')
    local config = _config
    for _, field in pairs(fields) do
        config = config[field:lower()]
    end
    return config
end

-------------------------
--       SOURCE        --
-------------------------

local _app = {}
function app(class)
    if not class:match('[.]') then
        class = class .. '.' .. class
    end
    return _app[class:lower()]
end
for _, dir in io.enumdir(__DIR__ .. 'src/') do
    for __, file in io.enumdir(__DIR__ .. 'src/' .. dir .. '/') do
        if file:sub(-4) == '.lua' then
            local name = file:sub(1, -5)
            _app[dir:lower() .. '.' .. name:lower()] = require(__DIR__ .. 'src/' .. dir .. '/' .. name)
        end
    end
    for __, file in io.enumdir(__DIR__ .. 'src/' .. dir .. '/extended') do
        local name = file:sub(1, -5)
        _app[dir:lower() .. '.' .. name:lower()] = require(__DIR__ .. 'src/' .. dir .. '/extended/' .. name)
    end
end

-------------------------
--        INIT         --
-------------------------

MAP = app('map').getInstance()
GAME = app('game').getInstance()

dofiledir(__DIR__ .. 'app/')
