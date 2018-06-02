--------------------
--      FILE      --
--------------------

function __FILE__()
    return debug.getinfo(4, 'S').source
end

function __LINE__()
    return debug.getinfo(4, 'l').currentline
end

--------------------
--     SYSTEM     --
--------------------

-- Milliseconds to measure time
function Millisecs()
	return(os.clock() * 1000)
end

--------------------
--      MATH      --
--------------------

-- Lineal interpolation
function math.lerp(a, b, t)
	return a + (b - a) * t
end

-- Simple distance between two points
function math.distance(x1, y1, x2, y2)
	return(math.sqrt( (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) ))
end

--------------------
--      TABLE     --
--------------------

function table.removeValue(tab, value)
    for _, v in pairs(tab) do
        if v == value then
            table.remove(tab, _)
            return true
        end
    end
    return false
end