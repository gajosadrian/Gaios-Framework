-------------------------
--       HELPER        --
-------------------------

local function __DIR__()
    return debug.getinfo(2, 'S').source:sub(2):match('(.*/)')
end
local __DIR__ = __DIR__()

function dofileDir(dir, deep)
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

for v in io.enumdir(__DIR__ .. 'src/') do
    if v:sub(1, 1) ~= '.' and v:sub(-4) ~= '.lua' then
        _G[v] = {}
    end
end

dofileDir(__DIR__ .. 'lib/', true)
dofileDir(__DIR__ .. 'src/Config/')
dofileDir(__DIR__ .. 'src/', true)
