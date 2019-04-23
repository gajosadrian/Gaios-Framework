-------------------------
--  MAGICAL CONSTANTS  --
-------------------------

function __DIR__()
    return (__FILE__()):match('(.*/)')
end

function __FILE__()
    return debug.getinfo(2, 'S').source:sub(2)
end

function __LINE__()
    return debug.getinfo(2, 'l').currentline
end

-------------------------
--       SYSTEM        --
-------------------------

-- Milliseconds to measure time
function Millisecs()
	return(os.clock() * 1000)
end

-------------------------
--         IO          --
-------------------------

function io.exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok, err
end

function io.isDir(path)
   -- "/" works on both Unix and Windows
   return io.exists(path .. '/')
end

function _print(...)
	local args = {...}
	local str = ''

	for i = 1, #args do
		str = str .. tostring(args[i]) .. ' '
	end

	msg(str)
end

-------------------------
--        MATH         --
-------------------------

-- Lineal interpolation
function math.lerp(a, b, t)
	return a + (b - a) * t
end

-- Simple distance between two points
function math.distance(x1, y1, x2, y2)
	return(math.sqrt( (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) ))
end

function math.round(num,base)
	if base == nil then
		return math.floor(num+0.5)
	else
        if base > 0 then
            base = math.pow(10,base)
        end
		return math.floor((num*base)+0.5)/base
	end
end

-------------------------
--        TABLE        --
-------------------------

function table.contains(tab, value)
    for _, v in pairs(tab) do
        if (v == value) then
            return true
        end
    end
    return false
end

function table.implode(tab, before, after, between)
    local result = ''
    for _,v in ipairs(tab) do
        if (result ~= '' and between) then
            result = result .. between
        end
        result = result .. before .. v .. after
    end
    return result
end

function table.isEmpty(tab)
    return next(tab) == nil
end

function table.keys(tab)
    local keys = {}
    for key, v in pairs(tab) do
        table.insert(keys, key)
    end
    return keys
end

function table.removeValue(tab, value)
    for _, v in pairs(tab) do
        if v == value then
            table.remove(tab, _)
            return true
        end
    end
    return false
end

function table.insert2D(tab, x, y, value)
    tab[x] = tab[x] or {}
    tab[x][y] = value
end

local function _string(o)
    return '"' .. tostring(o) .. '"'
end
local function _recurse(o, indent)
    if indent == nil then indent = '' end
    local indent2 = indent .. '  '
    if type(o) == 'table' then
        local s = indent .. '{' .. '\n'
        local first = true
        for k,v in pairs(o) do
            if first == false then s = s .. ', \n' end
            if type(k) ~= 'number' then k = _string(k) end
            s = s .. indent2 .. '[' .. k .. '] = ' .. _recurse(v, indent2)
            first = false
        end
        return s .. '\n' .. indent .. '}'
    else
        return _string(o)
    end
end
function var_dump(...)
    local args = {...}
    if #args > 1 then
        var_dump(args)
    else
        print(_recurse(args[1]))
    end
end

-------------------------
--       STRING        --
-------------------------

function string:split(sep)
   local sep, fields = sep or ":", {}
   local pattern = string.format("([^%s]+)", sep)
   self:gsub(pattern, function(c) fields[#fields + 1] = c end)
   return fields
end

function string:firstupper()
    return (self:gsub('^%l', string.upper))
end

function string:toCamelcase(delimiter)
    local tab = {}
    input:gsub( '([^' .. delimiter .. ']+)', function (c)
        table.insert(tab, c:firstupper())
    end)
    return table.concat(tab)
end

function camelcase_to_underscore(input)
    local tab = {}
    input:gsub( '%u?%l+', function (c)
        table.insert(tab, c:lower())
    end)
    return table.concat(tab, '_')
end

function underscore_to_camelcase(input)
    local tab = {}
    input:gsub( '([^_]+)', function (c)
        table.insert(tab, c:firstupper())
    end)
    return table.concat(tab)
end
