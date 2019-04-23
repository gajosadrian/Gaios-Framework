-- convert tiles to pixel, for example, 32 pixels becomes 1.5 tiles
function pixel_to_tile(pixel)
	return math.round((pixel - 16) / 32)
end

-- convert tiles to pixel, for example, 1 tile becomes 16
function tile_to_pixel(tile)
	return (tile * 32) + 16
end

local _enumdir = io.enumdir
function io.enumdir(dir)
    local tab = {}

    for name in _enumdir(dir) do
        if name ~= '.' and name ~= '..' then
            table.insert(tab, name)
        end
    end

    return pairs(tab)
end

local _parse = parse
function parse(...)
    local args = {...}
    local cmd = ''
    for _, v in pairs(args) do
        cmd = cmd .. '\"' .. v .. '\" '
    end
    _parse(cmd)
end

function print_error(txt)
    print('\169255000000' .. txt)
end
