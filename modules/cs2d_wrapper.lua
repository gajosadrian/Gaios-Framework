local _parse = parse
function parse(...)
    local args = {...}
    local str = ''

    for _, v in pairs(args) do
        str = str .. '\"' .. v .. '\" '
    end

    return str
end
