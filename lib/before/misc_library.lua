-- calculate the direction beetween 2 points
function misc.point_direction(x1,y1,x2,y2)
    local dir = -math.round(math.deg(math.atan2(x1-x2,y1-y2)))
    if dir < 0 then dir = dir + 360 end
    return dir
end

-- calculate the distance beetween 2 points
function misc.point_distance(x1,y1,x2,y2)
	return math.round(math.sqrt((x1-x2)^2 + (y1-y2)^2))
end

-- primitive way to calculate the distance beetween 2 points
function misc.primitive_point_distance(x1,y1,x2,y2)
    return math.max(math.abs(x1-x2),math.abs(y1-y2))
end

-- use for movement calculation (X)
function misc.lengthdir_x(dir,length)
	return math.cos(math.rad(dir - 90))*length
end

-- use for movement calculation (Y)
function misc.lengthdir_y(dir,length)
	return math.sin(math.rad(dir - 90))*length
end

function misc.pos_trigger(x, y, rot, power)
	rot = (rot < -90) and rot + 360 or rot

	local angle = math.rad(math.abs(rot + 90)) - math.pi
	local new_x = math.floor((x + math.cos(angle) * power))
	local new_y = math.floor((y + math.sin(angle) * power))

	return new_x, new_y
end

function misc.screen_border_dist(rot)
    local type

    -- 16:9 screen
    if rot >= 0 and rot <= 60 then
        type = 1
    elseif rot >= 61 and rot <= 120 then
        type = 2
    elseif rot >= 121 and rot <= 240 then
        type = 1
    elseif rot >= 241 and rot <= 300 then
        type = 2
    elseif rot >= 301 and rot <= 360 then
        type = 1
    end

    rot = math.rad(rot)

    if type == 1 then
        return math.floor(math.abs(240 / math.cos(rot)))
    elseif type == 2 then
        return math.floor(math.abs(425 / math.sin(rot)))
    end
end

function misc.isInside(x,y,x1,y1,x2,y2)
    return ((x >= x1) and (y >= y1) and (x <= x2) and (y <= y2))
end

function misc.isInsideScreen(x,y,px,py)
    if (py == nil) then
        py = player(px,"y") -- px is id
        px = player(px,"x")
    end
    local screen_width = 640/2
    local screen_height = 480/2
    return ((px < x+screen_width) and (py < y+screen_height) and (px > x-screen_width) and (py > y-screen_height))
end

function misc.closestPlayer(sx,sy,max_dist,tab)
    local closest_id = nil
    local closest_dist = max_dist
    local pl = tab or player(0,"tableliving")
    local i = 0
    while (i < #pl) do
        i = i + 1
        local temp_id = pl[i]
        local dist = misc.point_distance(sx,sy,player(temp_id,"x"),player(temp_id,"y"))
        if (dist <= closest_dist) then
            closest_id = temp_id
            closest_dist = dist
        end
    end
    return closest_id
end

-- calculates average
function misc.average(...)
    local sum = 0
    local i = 0
    while (i < #arg) do
        i = i + 1
        sum = sum + arg[i]
    end
    return sum/#arg
end

function misc.averageTable(array)
    local sum = 0
    local i = 0
    while (i < #array) do
        i = i + 1
        sum = sum + array[i]
    end
    return sum/#array
end

function misc.isLineOfSight(x1,y1,x2,y2,precision)
    if (precision == nil) then
        precision = 32
    end
    local dist = misc.point_distance(x1,y1,x2,y2)
    local dir = misc.point_direction(x1,y1,x2,y2)
    local check_x = x1
    local check_y = y1
    local add_x = misc.lengthdir_x(dir,precision)
    local add_y = misc.lengthdir_y(dir,precision)
    local i = 0
    while (i < math.floor(dist/precision)) do
        i = i + 1
        check_x = check_x + add_x
        check_y = check_y + add_y
        --misc.debugImage(check_x,check_y)
        if tile(misc.pixel_to_tile(check_x),misc.pixel_to_tile(check_y),"wall") then
            return false
        end
    end
    return true
end

-- allows counting radical sqrt (http://www.calculatorsoup.com/calculators/algebra/radical.php)
function sqrt(num,radical,decimals)
    if (radical == nil) then
        radical = 2
    end
    if (decimals == nil) then
        decimals = 5
    end
    local test = 0
    local num_change = 1
    local dec = -1
    while (dec < decimals) do
        test = test + num_change
        local result = math.pow(test,radical)
        if (result > num) then
            test = test - num_change
            dec = dec + 1
            num_change = num_change/10
        else
            if (result == num) then
                return test
            end
        end
    end
    return test
end

function misc.trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function misc.customSplit(text,separators) --misc.customSplit("1,2:3",{",",":"})
    local result = {}
    local i = 0
    while (i < #separators) do
        i = i + 1
        local sep = separators[i]
        local loc = string.find(text,sep)
        result[#result+1] = string.sub(text,1,loc-1)
        text = string.sub(text,loc+1)
    end
    result[#result+1] = text
    return result
end

function misc.split(text,separator)
    local ar = {}
    local last = -1
    local i = 0
    while (i < #text) do
         i = i + 1
         c = text:sub(i,i)
         if (c == separator) then
            ar[#ar+1] = text:sub(last+1,i-1)
            last = i
         end
    end
    ar[#ar+1] = text:sub(last+1,#text)
    return ar
end

function misc.split_text(text)
    --[[ OLD technique, ps. this will updated again!
	local command_input = {}
	for word in string.gmatch(text, "[!-z]+") do
		command_input[#command_input+1] = word
	end
	return command_input
    ]]--
	local command_input = {}
	for word in string.gmatch(text, "[!-z]+") do
        if (not(tonumber(word) == nil)) then
            word = tonumber(word)
        end
		command_input[#command_input+1] = word
	end
	return command_input
end

function misc.commandSplit(text)
	local temp = {}
	local word = ""
	local quote = false
	i = 0
	while (i < string.len(text)) do
		i = i + 1
		character = string.sub(text,i,i)
		if character == "\"" then
			if quote then
				quote = false
			else
				quote = true
			end
		else
			if quote then
				word = word..character
			else
				if character == " " then
					temp[#temp+1] = word
					word = ""
				else
					word = word..character
				end
			end
		end
	end
	temp[#temp+1] = word
	return temp
end

function misc.fileExists(file)
    local f = io.open(file,"r")
    if f == nil then
        return false
    else
        f:close()
        return true
    end
   --if f~=nil then io.close(f) return true else return false end
end
--	local file_check = io.open(file,"r")
--	if file_check == nil then
--		return false
--	end
--	file_check:close()
--	return true
--end
misc.timeTranslatorCharDefault = 1
misc.timeTranslatorChar = {
{c="s",t=1,s="Second"}, -- default
{c="m",t=60,s="Minute"},
{c="h",t=60*60,s="Hour"},
{c="d",t=60*60*24,s="Day"},
{c="w",t=60*60*24*7,s="Week"},
{c="M",t=60*60*24*30,s="Month"},
{c="y",t=60*60*24*365,s="Year"}}
function misc.timeTranslator(timeString)
    local totalTime = 0
    local latest_num = ""
	local i = 0
    while (i < string.len(timeString)) do
        i = i + 1
        c = string.sub(timeString,i,i)
        if tonumber(c) == nil then
            if latest_num == "" then -- FAIL: the time was empty
                misc.timeTranslator_error = i-1
                return false
            end
            local found_c = false
            local ii = 0
            while (ii < #misc.timeTranslatorChar) do
                ii = ii + 1
                if misc.timeTranslatorChar[ii].c == c then
                    found_c = true
                    local temp = tonumber(latest_num)
                    latest_num = ""
                    totalTime = totalTime + (temp*misc.timeTranslatorChar[ii].t)
                    break
                end
            end
            if not(found_c) then
                misc.timeTranslator_error = i
                return false
            end
        else
            latest_num = latest_num..c
        end
    end
    if not(latest_num == "") then --missing type? assuming seconds
        local temp = tonumber(latest_num)
        totalTime = totalTime + (temp*misc.timeTranslatorChar[misc.timeTranslatorCharDefault].t)
    end
    return totalTime
end
--[[
function misc.secondsToString(seconds)
    str = ""
    check_index = #misc.timeTranslatorChar
    while (check_index > 0) do
        local timeNum =  math.floor(seconds / misc.timeTranslatorChar[check_index].t)
        seconds = seconds - (timeNum*misc.timeTranslatorChar[check_index].t)
        -- [] --
        if (timeNum > 0) then
            type_name = misc.timeTranslatorChar[check_index].s
            if (timeNum > 1) then
                type_name = type_name.."'s"
            end
            str = timeNum.." "..type_name.." "..str
        end
        check_index = check_index - 1
    end
    return str
end
function misc.translateTimeErr(id,time_) -- with error handling
    result = misc.timeTranslator(time_)
    if result == false then
        local err = misc.timeTranslator_error
        local err_pos = err
        if err == 0 then
            err_pos = 1
        end
        msg2(id,misc.rgb(255,0,0).."Error at position "..err_pos)
        if err == 0 then
            msg2(id,misc.rgb(255,0,0)..command[2])
        else
            msg2(id,misc.rgb(0,255,0)..string.sub(command[2],1,err-1)..misc.rgb(255,0,0)..string.charAt(command[2],err)..misc.rgb(255,255,0)..string.sub(command[2],err+1))
        end
        pre = ""
        if err > 0 then
            pre = misc.rgb(0,255,0)..string.sub(command[2],1,err-1)--string.rep("_",err)
        end
        msg2(id,pre..misc.rgb(255,0,0).."^")
        return false
    else
        return result
    end
end
addhook("say","misc.say") -- used in testing the !time command
function misc.say(id,text)
    command = misc.split_text(text)
    if command[1] == "!time" then
        result = misc.timeTranslator(command[2])
        if result == false then
            local err = misc.timeTranslator_error
            local err_pos = err
            if err == 0 then
                err_pos = 1
            end
            msg(misc.rgb(255,0,0).."Error at position "..err_pos)
            if err == 0 then
                msg(misc.rgb(255,0,0)..command[2])
            else
                msg(misc.rgb(0,255,0)..string.sub(command[2],1,err-1)..misc.rgb(255,0,0)..string.charAt(command[2],err)..misc.rgb(255,255,0)..string.sub(command[2],err+1))
            end
            pre = ""
            if err > 0 then
                pre = misc.rgb(0,255,0)..string.sub(command[2],1,err-1)--string.rep("_",err)
            end
            msg(pre..misc.rgb(255,0,0).."^")
            --return 1
        else
            msg("Data returned: "..result.." Seconds")
            msg("aka: "..misc.secondsToString(result))
        end
        --return 1
    end
end
]]--
function misc.isNearPlayers(x,y,dist,exception)
	local pl = player(0,"tableliving")
	for i=1,#pl do
		if player(pl[i],"x") < x+dist and player(pl[i],"x") > x-dist and player(pl[i],"y") < y+dist and player(pl[i],"y") > y-dist then
            if (type(exception) == "table") then
                hit = true
                ii = 0
                while (ii < #exception) do
                    ii = ii + 1
                    if (pl[i] == exception[ii]) then
                        hit = false
                    end
                end
                if (hit) then
                    return pl[i]
                end
            else
                return pl[i]
            end
		end
	end
	return 0
end

function misc.isPlayerAlive(id)
    return (player(id,"exists") and (player(id,"health") > 0))
end

function misc.thousandMarks(number)
    local number = misc.round(number) -- for now untill this function is fixed
    local last_num = 0
    if (number < 0) then
        last_num = 1
    end
    local str_num = tostring(number)
    local new_str = ""
    local count = 4
    local i = #str_num
    while (i > 0) do
        count = count - 1
        local c = str_num:sub(i,i)
        if (count == 0) then
            count = 3
            if (i > last_num) then
                new_str = "'"..new_str
            end
        end
        new_str = c..new_str
        i = i - 1
    end
    return new_str
end

function misc.debugImage(x,y,r,g,b,t)
	local temp = image("gfx/hud_dot.bmp",x,y,3)
	if t == nil then
		t = 1000
	end
    if (t > 0) then
        timer(t,"freeimage",temp)
    end
	if (r == nil) == false then
		imagecolor(temp,r,g,b)
	end
end

misc.printTable = function(tab,dep)
    if (dep == nil) then
        dep = 0
    end
    for v,k in pairs(tab) do
        print(string.rep("-",dep)..v.." = ("..type(k)..") \""..tostring(k).."\"")
        if (type(k) == "table") then
            misc.printTable(k,dep+1)
        end
    end
end

misc.hudtxtID = {}
for i=0, 49 do
    misc.hudtxtID[i] = false
end

function misc.get_hudtxt()
    for i=1, 49 do
        if (misc.hudtxtID[i] == false) then
            misc.hudtxtID[i] = true
            return i
        end
    end
    error("CS2D RESOURCE SHORTAGE: out of hudtxt (0-49)!")
end

function misc.drop_hudtxt(id)
    misc.hudtxtID[id] = false
end

misc.playerHudtxt = {}

function misc.join(id)
    misc.playerHudtxt[id] = {}
    for i=0,49 do
        misc.playerHudtxt[id][i] = ""
    end
end
-- addhook("join",misc.join,true)

function misc.hudTextEveryone(id,text,x,y,align)
    parse("hudtxt "..id.." \""..text.."\" "..x.." "..y.." "..align.."")
end

function misc.hudText(id,pid,text,x,y,align)
    if pid == 0 then
        misc.hudTextEveryone(id,text,x,y,align)
    else
        if (not (misc.playerHudtxt[pid][id] == text)) then
            misc.playerHudtxt[pid][id] = text
            parse("hudtxt2 "..pid.." "..id.." \""..text.."\" "..x.." "..y.." "..align)
        end
    end
end

function misc.hudTextFade(id,pid,duration,alpha)
	parse("hudtxtalphafade "..pid.." "..id.." "..duration.." "..alpha.."")
	return id
end

function misc.hudTextColor(id,pid,duration,r,g,b)
	parse("hudtxtcolorfade "..pid.." "..id.." "..duration.." "..r.." "..g.." "..b.."")
	return id
end

function misc.hudTextMove(id,pid,duration,x,y)
    parse("hudtxtmove "..pid.." "..id.." "..duration.." "..x.." "..y)
    return id
end

function misc.explosion(x,y,size,dmg,src)
	parse("explosion "..x.." "..y.." "..size.." "..dmg.." "..src)
end

-- fire
-- smoke
-- flare
-- colorsmoke
function misc.effect(effect,x,y,amount,radius,r,g,b)
    parse("effect \""..effect.."\" "..x.." "..y.." "..amount.." "..radius.." "..r.." "..g.." "..b)
end

-- subtract/add 122
misc.armourValue = {{id=206,protection=0}, -- stealth armour
{id=205,protection=95}, -- super armour
{id=204,protection=0}, -- medic armour
{id=203,protection=75}, -- heavy armour
{id=202,protection=50}, -- medium armour
{id=201,protection=25}} -- light armour
function misc.calcDamage(id,dmg)
	local armor = player(id,"armor")
	for i=1,#misc.armourValue do
		if armor == misc.armourValue[i].id then
			return dmg - ((dmg / 100) * misc.armourValue[i].protection)
		end
	end
	return dmg
end

-- DISCLAIMER: NOT created by me, source: http://snippets.luacode.org/snippets/Shuffle_array_145
function misc.shuffle_array(ar)
    local n, order, res = #ar, {}, {}

    for i=1,n do order[i] = { rnd = math.random(), idx = i } end
    table.sort(order, function(a,b) return a.rnd < b.rnd end)
    for i=1,n do res[i] = ar[order[i].idx] end
    return res
end

function misc.colorTextPercent(percent)
	if percent < 0 then
		percent = 0
	end
	if percent > 100 then
		percent = 100
	end
	local r = misc.round(255-(percent*2.55))
	local g = misc.round(percent*2.55)
	local b = 0
    local yellowBoost = (50-(math.abs(percent-50)))
    if yellowBoost > 0 then
        yellowBoost = yellowBoost*2.55
    end
    r = r + yellowBoost
    g = g + yellowBoost
    r = math.floor(r)
    g = math.floor(g)
    b = math.floor(b)
	return ("\169"..misc.minimum_3(r)..misc.minimum_3(g)..misc.minimum_3(b))
end

function misc.rgb(r,g,b)
	return ("\169"..misc.minimum_3(r)..misc.minimum_3(g)..misc.minimum_3(b))
end

-- PRIVATE function
function misc.minimum_3(text)-- you arent really intended to use this function
	text = tostring(text)
	while (string.len(text) < 3) do
		text = "0"..text
	end
	return text
end

function misc.eval(code)
	file = io.open("sys/lua/eval.lua","w")
	if type(code) == "string" then
		file:write(code)
	end
	if type(code) == "table" then
		i = 0
		while (i < #code) do
			i = i + 1
			file:write(code[i])
		end
	end
	file:close()
	ret = dofile("sys/lua/eval.lua")
	os.remove("sys/lua/eval.lua")
	return ret
end

-- sense CS2D reads servertransfer BEFORE lua, you might need to restart, after your lua used this function

--if you want this function, then BE IN MIND that the current content in servertransfer.lst will be erased!

misc.doAddServerTransfer = true
misc.serverTransferFiles = {}

if misc.doAddServerTransfer then
    file = io.open("sys/servertransfer.lst","w")
    file:write("")
    file:close()
end

function misc.addServerTransfer(fileDir)
    if misc.doAddServerTransfer then
        for index,file in ipairs(misc.serverTransferFiles) do
            if (file == fileDir) then
                return
            end
        end
        misc.serverTransferFiles[#misc.serverTransferFiles+1] = fileDir
        --print("added "..fileDir.." to serverTransfer.lst")
        file = io.open("sys/servertransfer.lst","a")
        file:write(fileDir.."\n")
        file:close()
    end
end

-- originally created by: http://gmc.yoyogames.com/index.php?showtopic=433253
-- modified and converted to lua by Endercrypt
function misc.turnTowards(direction, targetDir, turnspeed)
    angdiff = misc.angleDiffrence(direction, targetDir)--((((direction - wdir) % 360) + 540) % 360) - 180;
    return (direction - math.min(math.max(angdiff,-turnspeed),turnspeed)) % 360
end

function misc.angleDiffrence(dir, dir2)
    return ((((dir - dir2) % 360) + 540) % 360) - 180;
end

function misc.maxmin(num,maxmin_num)
    return math.min(math.max(num,-maxmin_num),maxmin_num)
end

function misc.tableSwap(table_,index)
    table_[index] = table_[#table_]
    table_[#table_] = nil
end

function misc.cord_inside_map(x,y) -- tile coordinates
    return ((x > 0) and (y > 0) and (x <= const.map.xsize) and (y <= const.map.ysize))
end

-- example input format:
-- {{data={},score=10},{data={},score=2}}
function misc.sort(data)
    local sorted = {}
    -- sort
    while (#data > 0) do
        local best = nil
        local best_score = -math.huge
        local i = 0
        while (i < #data) do
            i = i + 1
            local score = data[i].score
            if (score > best_score) then
                best = i
                best_score = score
            end
        end
        -- add
        sorted[#sorted+1] = data[best]
        data[best] = data[#data]
        data[#data] = nil
    end
    return sorted
end

--[[
function misc.sort(data)
    local sorted = {}
    local i = 0
    while (i < #data) do
        i = i + 1
        local to_add = data[i]
        -- find location
        local ii = 1
        while (ii <= #sorted) do
            print("me: "..to_add.score.." <> other: "..sorted[ii].score)
            if (to_add.score > sorted[ii].score) then
                print("break")
                break;
            end
            ii = ii + 1
        end
        print("position "..ii.." out of "..#sorted)
        -- shift above tems
        local iii = #sorted+1
        while (iii > ii+1) do
            iii = iii - 1
            msg("shifting: "..iii.." to "..(iii+1))
            sorted[iii+1] = sorted[iii]
        end
        -- insert
        sorted[iii] = to_add
    end
    return sorted
end
]]--
-----------------
--[ EXTENSION ]--
-----------------

function isNil(value) -- example: nil
    return (value == nil)
end

function isString(value) -- example: "9001" or "lol"
    return (type(value) == "string")
end

function isNumber(value) -- example: 9001
    return (type(value) == "number")
end

function isNumeric(value) -- example: "9001"
    return ((tonumber(value) == nil) == false)
end
