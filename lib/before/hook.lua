local parse = parse
local print = print

_HOOK = {}
local hooks = {}

_addhook = addhook
function addhook(name, func, prio)
    if type(func) == 'string' then
        print('\169255000000Impossible to add hook. Do NOT use string in function argument.')
        return
    end

    if not hooks[name] then
        hooks[name] = {}
        _HOOK[name] = function (...)
            return callhook(name, ...)
        end
        parse('debuglua 0'); _addhook(name, '_HOOK.' .. name); parse('debuglua 1')
    end

    table.insert(hooks[name], {
        func = func,
        prio = prio or nil,
    })
end

local _freehook = freehook
function freehook(name, func)
end

function callhook(name, ...)
    local hook = hooks[name]
    local result = false

    if hook then
        for _, v in pairs(hook) do
            local temp = v.func(...)
            result = temp or result
        end
    end

    return result
end

print('\169000255000==============')
print('\169000255000==   ' .. os.date():sub(9) .. '   ==')
print('\169000255000==============')
