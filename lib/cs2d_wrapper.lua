local _parse = parse
function parse(...)
    local args = {...}
    local cmd = ''
    for _, v in pairs(args) do
        cmd = cmd .. '\"' .. v .. '\" '
    end
    _parse(cmd)
end
