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

-------------------------
--        TABLE        --
-------------------------

function table.removeValue(tab, value)
    for _, v in pairs(tab) do
        if v == value then
            table.remove(tab, _)
            return true
        end
    end
    return false
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
