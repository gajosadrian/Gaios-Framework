--- /// Extended Miscellaneous Functions /// ---

-- Simple color class
TColor = {}
function TColor.White()
	return({r = 255, g = 255, b = 255})
end

-- Functions to simplify some of the code
TDebug = {}
function TDebug.Null(value, set)
	if (value == nil) then
		return(set)
	end
	return(value)
end

function TDebug.ArgError(func, str1, arg1, str2, arg2, str3, arg3)
	if (str1 and arg1 == nil) then
		print("LUA IMAGE ERROR: "..func..' is missing '..str1..' value (file: '..__FILE__()..' line: '..__LINE__()..")")
		return(true)
	end
	if (str2 and arg2 == nil) then
		print("LUA IMAGE ERROR: "..func..' is missing '..str2..' value (file: '..__FILE__()..' line: '..__LINE__()..")")
		return(true)
	end
	if (str3 and arg3 == nil) then
		print("LUA IMAGE ERROR: "..func..' is missing '..str3..' value (file: '..__FILE__()..' line: '..__LINE__()..")")
		return(true)
	end
	if (str4 and arg4 == nil) then
		print("LUA IMAGE ERROR: "..func..' is missing '..str4..' value (file: '..__FILE__()..' line: '..__LINE__()..")")
		return(true)
	end
	return(false)
end

-- Handy function for simple flags
function TFlags(...)
	local f = {}
	for i,v in ipairs(arg) do
		table.insert(f, tonumber(v))
	end
	return(f)
end

local function split(str, sep)
   local sep, fields = sep or ":", {}
   local pattern = string.format("([^%s]+)", sep)
   str:gsub(pattern, function(c) fields[#fields + 1] = c end)
   return fields
end


--- /// Meta @ Tables @ Stuff /// ---
TImage = {}
TImage.__index = TImage
TImage.List = {}
TImage.ImageList = {}

--- /// Image Modes /// ---
TImage.mode = {}
TImage.mode.floor = 0
TImage.mode.top = 1
TImage.mode.supertop = 3
TImage.mode.hud = 2
TImage.mode.background = 4

--- /// Image Types /// ---
TImage.type = {}
TImage.type.tile = 0
TImage.type.player = 1
TImage.type.map = 2
TImage.type.gui = 3

--- /// Image Blending Modes /// ---
TImage.blend = {}
TImage.blend.normal = 0
TImage.blend.light = 1
TImage.blend.shade = 2
TImage.blend.solid = 3

--- /// Image Flags /// ---
TImage.flag = {}
TImage.flag.black = 0
TImage.flag.magenta = 1
TImage.flag.alpha = 2
TImage.flag.nomasking = 3

--- /// Player Image Flags /// ---
TImage.flag.drawalways = 10
TImage.flag.rotate = 11
TImage.flag.wiggle = 12
TImage.flag.recoil = 13

--- /// Image Flags Switch /// ---
TImage.flag.switch = {
	[0] = "b",
	[1] = "m",
	[2] = "a",
	[3] = "n",
	[10] = {y = 1},
	[11] = {x = 1},
	[12] = {x = 2},
	[13] = {x = 3}
}

--- /// Constructors /// ---
function TImage.PlayerImage(path, mode, pl, flags, _pl)
	if (TDebug.ArgError("TImage:PlayerImage", "path", path, "mode", mode, "player", pl) == true) then
		return(true)
	end
 	local self = setmetatable({}, TImage)
	self.type = TImage.type.player

	if (mode == TImage.mode.floor) then
		pl = pl + 100
	end
	if (mode == TImage.mode.top) then
		pl = pl + 200
	end
	if (mode == TImage.mode.supertop) then
		pl = pl + 132
	end

	-- Flags incremention to the image
	local x = 0
	local y = 0
	local flag
	if (flags ~= nil) then
		for i, id in pairs(flags) do
			flag = TImage.flag.switch[id]
			if (flag ~= nil) then
				if (flag.x and x < flag.x) then
					x = flag.x
				end
				if (flag.y) then
					y = flag.y
				end
				table.remove(flags, i)
			end
		end
	end

	self:Create(path, pl, x, y, flags, _pl)

	return(self)
end

function TImage.MapImage(path, mode, x, y, flags, pl)
	if (TDebug.ArgError("TImage:MapImage", "path", path, "mode", mode, "x", x, "y", y) == true) then
		return(true)
	end

 	local self = setmetatable({}, TImage)
	self.type = TImage.type.map

	self:Create(path, mode, x, y, flags, pl)

	return(self)
end

function TImage.TileImage(tid, mode, x, y, flags, pl)
	if (TDebug.ArgError("TImage:TileImage", "tile id", tid, "mode", mode, "x", x, "y", y) == true) then
		return(true)
	end

 	local self = setmetatable({}, TImage)
 	self.type = TImage.type.tile

	self:Create("<tile:"..tid..">", mode, x, y, flags, pl)

	return(self)
end

function TImage.GUIImage(path, x, y, flags, pl)
	if (TDebug.ArgError("TImage:GUIImage", "path", path, "x", x, "y", y) == true) then
		return(true)
	end

 	local self = setmetatable({}, TImage)
	self.type = TImage.type.gui

	self:Create(path, TImage.mode.hud, x, y, flags, pl)

	return(self)
end

function TImage.Create(self, path, mode, x, y, flags, pl)
	self.path = path
	self.flags = ""
	self.x = TDebug.Null(x, 0)
	self.y = TDebug.Null(y, 0)
	self.player = TDebug.Null(pl, 0)
	self.mode = mode

	-- By default images disappear after the round
	self.permanent = true

	-- Default image() values
	self:Init()

	-- Flags incremention to the image
	if (flags ~= nil) then
		for _,id in pairs(flags) do
			self:AddFlag(id)
		end
	end

	self.id = image(self.path..self.flags, self.x, self.y, self.mode, self.player)
	TImage.ImageList[self.id] = self

    local width, height
    if path:match('spritesheet:') then
        self.spritesheet = true
        local tab = split(path)
        width, height = tab[3], tab[4]
    elseif path:math('tile:') then
        self.tile = true
        local tab = split(path)
        if not isHD then
            width, height = 32, 32
        else
            width, height = 64, 64
        end
    else
        local width, height = getImageSize(path)
    end
	self.width = width
	self.height = height

	table.insert(TImage.List, self)
end

function TImage.Init(self)
	self.rot = 0
	self.frame = 0
	self.scalex = 1
	self.scaley = 1
	self.alpha = 1

	self.color = TColor.White()
	self.blend = TImage.blend.normal

	self.tween_move = false
	self.tween_rotate = false
	self.tween_alpha = false
	self.tween_scale = false
	self.tween_color = false
	self.tween_rotateconstantly = false

	self.removed = false
	self.hitzone = false

    self.spritesheet = false
    self.tile = false
end

function TImage.remove(self)
	if (TDebug.ArgError("TImage:remove", "self", self) == true) then
		return(true)
	end
	self.removed = true
	freeimage(self.id)
	table.removeByValue(TImage.List, self)
	-- deleted image id equals -1 to skip interfering with overwritten images id's
	self.id = -1
end

function TImage.AddFlag(self, id)
	if (TImage.flag.switch[id] ~= nil) then
		self.flags = self.flags.."<"..TImage.flag.switch[id]..">"
	else
		self.flags = self.flags..id
	end
end

--- /// Roundend Image Update /// ---
function TImage.RoundReload(self)
	if (self.permanent == true) then
		-- Copying the current values for reinitialization check with the default image() variables
		local blend = self.blend
		local alpha = self.alpha
		local color = self.color
		local x = self.x
		local y = self.y
		local rot = self.rot
		local frame = self.frame
		local scalex = self.scalex
		local scaley = self.scaley
		local tween_move = self.tween_move
		local tween_rotate = self.tween_rotate
		local tween_alpha = self.tween_alpha
		local tween_color = self.tween_color
		local tween_scale = self.tween_scale
		local tween_rotateconstantly = self.tween_rotateconstantly
		local hitzone = self.hitzone

		self.id = image(self.path..self.flags, self.x, self.y, self.mode, self.player)
		TImage.ImageList[self.id] = self

		-- Setting default image() values
		self:Init()

		-- Reseting original image values
		self:setBlend(blend)
		self:setAlpha(alpha)
		self:setColor(color.r, color.g, color.b)
		self:setPos(x, y, rot)
		self:setScale(scalex, scaley)
		self:setFrame(frame)

		-- Reseting original tween animations (continuing tween animation after round restart)
		if (tween_move == true) then
			self.tween_move = true
			if (tween_rotate == true) then
				self.tween_move_end_rot = self.tween_rotate_end_rot
			end
			self:animatePos((self.tween_move_clock - Millisecs()), self.tween_move_end_x, self.tween_move_end_y, self.tween_move_end_rot)
		else
			if (tween_rotate == true) then
				self.tween_rotate = true
				self:animateRot((self.tween_rotate_clock - Millisecs()), self.tween_rotate_end_rot)
			end
		end
		if (tween_alpha == true) then
			self.tween_alpha = true
			self:animateAlpha((self.tween_alpha_clock - Millisecs()), self.tween_alpha_end_alpha)
		end
		if (tween_scale == true) then
			self.tween_scale = true
			self:animateScale((self.tween_scale_clock - Millisecs()), self.tween_scale_end_sx, self.tween_scale_end_sy)
		end
		if (tween_color == true) then
			self.tween_color = true
			self:animateColor((self.tween_color_clock - Millisecs()), self.tween_color_end_color.r, self.tween_color_end_color.g, self.tween_color_end_color.b)
		end
		if (tween_rotateconstantly == true) then
			self.tween_rotateconstantly = true
			self:animateRotConstantly(self.tween_rotateconstantly_speed)
		end
		if (hitzone) then
			self.hitzone = true
			TImage.setHitzone(self, self.hitzone_mode)
		end
	else
		self:remove()
	end
end
--- /// ms100 Image Update /// ---
function TImage.UpdateTween(self)
	local ms = Millisecs() + 16
	if (self.tween_move == true) then
		local lerp = 1 - ((self.tween_move_clock - ms) / self.tween_move_time)
		if (lerp < 1) then
			self.x = math.lerp(self.tween_move_start_x, self.tween_move_end_x, lerp)
			self.y = math.lerp(self.tween_move_start_y, self.tween_move_end_y, lerp)
			self.rot = math.lerp(self.tween_move_start_rot, self.tween_move_end_rot, lerp)
		else
			self.tween_move = false
			self.x = self.tween_move_end_x
			self.y = self.tween_move_end_y
			self.rot = self.tween_move_end_rot
		end
	end
	if (self.tween_rotate == true) then
		local lerp = 1 - ((self.tween_rotate_clock - ms) / self.tween_rotate_time)
		if (lerp < 1) then
			self.rot = math.lerp(self.tween_rotate_start_rot, self.tween_rotate_end_rot, lerp)
		else
			self.tween_rotate = false
			self.rot = self.tween_rotate_end_rot
		end
	end
	if (self.tween_alpha == true) then
		local lerp = 1 - ((self.tween_alpha_clock - ms) / self.tween_alpha_time)
		if (lerp < 1) then
			self.alpha = math.lerp(self.tween_alpha_start_alpha, self.tween_alpha_end_alpha, lerp)
		else
			self.tween_alpha = false
			self.alpha = self.tween_alpha_end_alpha
		end
	end
	if (self.tween_scale == true) then
		local lerp = 1 - ((self.tween_scale_clock - ms) / self.tween_scale_time)
		if (lerp < 1) then
			self.scalex = math.lerp(self.tween_scale_start_sx, self.tween_scale_end_sx, lerp)
			self.scaley = math.lerp(self.tween_scale_start_sy, self.tween_scale_end_sy, lerp)
		else
			self.tween_scale = false
			self.scalex = self.tween_scale_end_sx
			self.scaley = self.tween_scale_end_sy
		end
	end
	if (self.tween_color == true) then
		local lerp = 1 - ((self.tween_color_clock - ms) / self.tween_color_time)
		if (lerp < 1) then
			self.color.r = math.lerp(self.tween_color_start_color.r, self.tween_color_end_color.r, lerp)
			self.color.g = math.lerp(self.tween_color_start_color.g, self.tween_color_end_color.g, lerp)
			self.color.b = math.lerp(self.tween_color_start_color.b, self.tween_color_end_color.b, lerp)
		else
			self.tween_color = false
			self.color = self.tween_color_end_color
		end
	end
end

--- /// Image Set Methods /// ---
function TImage.setPermanent(self, sp)
	if (TDebug.ArgError("TImage:setPermanent", "self", self, "value", sp) == true) then
		return(true)
	end
	self.permanent = sp
end

function TImage.setColor(self, sr, sg, sb)
	if (TDebug.ArgError("TImage:setColor", "self", self, "Red", sr, "Green", sg, "Blue", sb) == true) then
		return(true)
	end
	if (self.removed == true) then
		return
	end
	if (self.color.r ~= sr or self.color.g ~= sg or self.color.b ~= sb) then
		self.color.r = sr
		self.color.g = sg
		self.color.b = sb
		self.tween_color = false
		imagecolor(self.id, sr, sg, sb)
	end
end

function TImage.setPos(self, sx, sy, srot)
	if (TDebug.ArgError("TImage:setPos", "self", self, "x", sx, "y", sy, "rotation", srot) == true) then
		return(true)
	end
	if (self.removed == true) then
		return
	end
	if (self.y ~= sx or self.x ~= sy or self.rot ~= srot) then
		self.x = sx
		self.y = sy
		self.rot = srot
		self.tween_rotate = false
		self.tween_move = false
		imagepos(self.id, sx, sy, srot)
	end
end

function TImage.setScale(self, sx, sy)
	if (TDebug.ArgError("TImage:setScale", "self", self, "scalex", sx, "scaley", sy) == true) then
		return(true)
	end
	if (self.removed == true) then
		return
	end
	if (self.scalex ~= sx or self.scaley ~= sy) then
		self.scalex = sx
		self.scaley = sy
		self.tween_scale = false
		imagescale(self.id, sx, sy)
	end
end

function TImage.setFrame(self, sf)
	if (TDebug.ArgError("TImage:setFrame", "self", self, "frame", sf) == true) then
		return(true)
	end
	if (self.removed == true) then
		return
	end
	if (self.frame ~= sf) then
		self.frame = sf
		self.tween_frame = false
		imageframe(self.id,sf)
	end
end

function TImage.setAlpha(self, sa)
	if (TDebug.ArgError("TImage:setAlpha", "self", self, "alpha", sa) == true) then
		return(true)
	end
	if (self.removed == true) then
		return
	end
	if (self.alpha ~= sa) then
		self.alpha = sa
		self.tween_alpha = false
		imagealpha(self.id,sa)
	end
end

function TImage.setBlend(self, sb)
	if (TDebug.ArgError("TImage:setBlend", "self", self, "blend", sb) == true) then
		return(true)
	end
	if (self.removed == true) then
		return
	end
	if (self.blend ~= sb) then
		self.blend = sb
		self.tween_blend = false
		imageblend(self.id, sb)
	end
end

--- /// Get Methods /// ---
function TImage.getBlend(self)
	if (TDebug.ArgError("TImage:getBlend", "self", self) == true) then
		return(true)
	end
	return(self.blend)
end

function TImage.getAlpha(self)
	if (TDebug.ArgError("TImage:getAlpha", "self", self) == true) then
		return(true)
	end
	return(self.alpha)
end

function TImage.getPosition(self)
	if (TDebug.ArgError("TImage:getPosition", "self", self) == true) then
		return(true)
	end
	return({x = self.x, y = self.y})
end

function TImage.getColor(self)
	if (TDebug.ArgError("TImage:getColor", "self", self) == true) then
		return(true)
	end
	return({r = self.color.r, g = self.color.g, b = self.color.b})
end

function TImage.getScale(self)
	if (TDebug.ArgError("TImage:getScale", "self", self) == true) then
		return(true)
	end
	return({scalex = self.scalex, scaley = self.scaley})
end

function TImage.getFrame(self)
	if (TDebug.ArgError("TImage:getFrame", "self", self) == true) then
		return(true)
	end
	return(self.frame)
end

function TImage.getMoving(self)
	if (TDebug.ArgError("TImage:getMoving", "self", self) == true) then
		return(true)
	end
	return(self.tween_move)
end

function TImage.Get(id)
	return(TImage.ImageList[id])
end

--- /// Image Set Animation Methods /// ---
function TImage.animateRot(self, time, srot)
	if (TDebug.ArgError("TImage:animateRot", "self", self, "time", time, "rotation", srot) == true) then
		return(true)
	end
	if (self.rot ~= srot) then -- Check Distance
		if (self.tween_rotate_end == srot) then
			return
		end
		self.tween_rotateconstantly = false

		self.tween_rotate_end_rot = srot
		self.tween_rotate_start_rot = self.rot

		self.tween_rotate_clock = Millisecs() + time
		self.tween_rotate_time = time
		self.tween_rotate = true

		tween_rotate(self.id, time, srot)
	end
end

function TImage.animateAlpha(self, time, sa)
	if (TDebug.ArgError("TImage:animateAlpha", "self", self, "time", time, "alpha", sa) == true) then
		return(true)
	end
	if (self.alpha ~= sa) then -- Check Distance
		if (self.tween_alpha_end_alpha == sa) then
			return
		end
		self.tween_alpha_end_alpha = sa
		self.tween_alpha_start_alpha = self.alpha

		self.tween_alpha_clock = Millisecs() + time
		self.tween_alpha_time = time
		self.tween_alpha = true

		tween_alpha(self.id, time, sa)
	end
end

function TImage.animateScale(self, time, sx, sy)
	if (TDebug.ArgError("TImage:animateScale", "self", self, "time", time, "scalex", sx, "scaley", sy) == true) then
		return(true)
	end
	if (self.scalex ~= sx or self.scaley ~= sy) then -- Check Distance
		if (self.tween_scale_end_sx == sx and self.tween_scale_end_sy == sy) then
			return
		end
		self.tween_scale_end_sx = sx
		self.tween_scale_start_sx = self.scalex

		self.tween_scale_end_sy = sy
		self.tween_scale_start_sy = self.scaley

		self.tween_scale_clock = Millisecs() + time
		self.tween_scale_time = time
		self.tween_scale = true

		tween_scale(self.id, time, sx, sy)
	end
end

function TImage.animateColor(self, time, sr, sg, sb)
	if (TDebug.ArgError("TImage:animateColor", "self", self, "time", time, "red", sr, "green", sg, "blue", sb) == true) then
		return(true)
	end
	if (self.color.r ~= sr or self.color.g ~= sg or self.color.b ~= sb) then
		if self.tween_color_end_color and (self.tween_color_end_color.r == sr and self.tween_color_end_color.g == sg and self.tween_color_end_color.b == sb) then
			return
		end
		self.tween_color_end_color = {}
		self.tween_color_end_color.r = sr
		self.tween_color_end_color.g = sg
		self.tween_color_end_color.b = sb

		self.tween_color_start_color = {}
		self.tween_color_start_color.r = self.color.r
		self.tween_color_start_color.g = self.color.g
		self.tween_color_start_color.b = self.color.b

		self.tween_color_clock = Millisecs() + time
		self.tween_color_time = time
		self.tween_color = true

		tween_color(self.id, time, sr, sg, sb)
	end
end

--- /// Image Get Methods /// ---
function TImage.toString(self)
	if (TDebug.ArgError("TImage:toString", "self", self) == true) then
		return(true)
	end
	return("TImage(path:"..self.path..", flags:"..self.flags..", x:"..self.x..", y:"..self.y..", rot:"..self.rot..", mode: "..self.mode..", width:"..self.width..", height:"..self.height..", frames: "..self.frame..", player: "..self.player..")")
end

function TImage.animatePos(self, time, sx, sy, srot)
	if (TDebug.ArgError("TImage:animatePos", "self", self, "time", time, "x", sx, "y", sy) == true) then
		return(true)
	end
	if srot then
		if (sx == self.tween_move_end_x and self.tween_move_end_y == sy and self.tween_move_end_rot == srot) then
			return
		end
		if (self.x ~= sx or self.y ~= sy or self.rot ~= srot) then -- Check Distance
			self.tween_rotate = false
			self.tween_rotateconstantly = false

			self.tween_move_end_x = sx
			self.tween_move_end_y = sy
			self.tween_move_end_rot = srot

			self.tween_move_start_x = self.x
			self.tween_move_start_y = self.y
			self.tween_move_start_rot = self.rot

			self.tween_move_clock = Millisecs() + time
			self.tween_move_time = time
			self.tween_move = true

			tween_move(self.id, time, sx, sy, srot)
		end
	else
		if (sx == self.tween_move_end_x and self.tween_move_end_y == sy) then
			return
		end
		if (self.x ~= x or self.y ~= y) then -- Check Distance
			self.tween_move_end_x = sx
			self.tween_move_end_y = sy
			self.tween_move_end_rot = self.rot

			self.tween_move_start_x = self.x
			self.tween_move_start_y = self.y
			self.tween_move_start_rot = self.rot

			self.tween_move_clock = Millisecs() + time
			self.tween_move_time = time
			self.tween_move = true

			tween_move(self.id, time, sx, sy)
		end
	end
end

function TImage.animateRotConstantly(self, speed)
	if (TDebug.ArgError("TImage:animateRotConstantly", "self", self, "speed", speed) == true) then
		return(true)
	end
	self.tween_rotateconstantly = true
	self.tween_rotateconstantly_speed = speed
	tween_rotateconstantly(self.id, speed)
end


function TImage.setHitzone(self, mode)
	if (TDebug.ArgError("TImage:setHitzone", "self", self, "mode", mode) == true) then
		return(true)
	end
	self.hitzone = true
	self.hitzone_mode = mode
	if (self.type == TImage.type.tile) then
		imagehitzone(self.id, mode, 0, 0, self.width * self.scalex, self.height * self.scaley)
	else
		imagehitzone(self.id, mode, -(self.width * self.scalex) / 2, -(self.height * self.scaley) / 2, self.width* self.scalex, self.height* self.scaley )
	end
end

function TImage.CollideRect(self, c)
	if (TDebug.ArgError("TImage:CollideRect", "self", self, "object", c) == true) then
		return(true)
	end
	if (self == nil or self.removed == true or c.x == false or c.y == false) then
		return(false)
	end
	r = {}

	r.x = self.x
	r.y = self.y

	r.rot = self.rot
	r.width = self.width * self.scalex
	r.height = self.height * self.scaley

	r.halfWidth = r.width / 2
	r.halfHeight = r.height / 2

	local rot = math.atan2(c.y-r.y,c.x-r.x) - math.rad(r.rot)
	local dist = math.distance(r.x,r.y,c.x,c.y)
	c.x = r.x + math.cos(rot) * dist
	c.y = r.y + math.sin(rot) * dist

	if (self.type ~= TImage.type.tile) then
		r.x = r.x - r.halfWidth
		r.y = r.y - r.halfHeight
	end

	local cx = math.abs(c.x - r.x - r.halfWidth) -- (cx * cx * cx) / (cx * cx)?
	local xDist = r.halfWidth + c.radius
	if (cx > xDist) then
		return(false)
	end
	local cy = math.abs(c.y - r.y - r.halfHeight)
	local yDist = r.halfHeight + c.radius
	if (cy > yDist) then
		return(false)
	end
	if (cx <= r.halfWidth or cy <= r.halfHeight) then
		return(true)
	end
	local xCornerDist = cx - r.halfWidth
	local yCornerDist = cy - r.halfHeight
	local xCornerDistSq = xCornerDist * xCornerDist
	local yCornerDistSq = yCornerDist * yCornerDist
	local maxCornerDistSq = c.radius * c.radius
	return(xCornerDistSq + yCornerDistSq <= maxCornerDistSq)
end

--- /// Collision Detection /// ---
function TImage.CollideCircle(self,x0,y0, r)
	if (TDebug.ArgError("TImage:CollideCircle", "self", self, "x", x0, "y", y0, "radius", r) == true) then
		return(true)
	end
	if (self == nil or self.removed == true or x0 == false or y0 == false) then
		return(false)
	end
	return(math.distance(x0,y0,self.x,self.y) < (r + self.width / 2))
end

function TImage.CollideRectToPlayer(self)
	if (TDebug.ArgError("TImage:CollideRectToPlayer", "self", self) == true) then
		return(true)
	end
	local playerlist = player(0,"table")
	for _, id in pairs(playerlist) do
   		if (self:CollideRect( {x = player(id,"x"),y = player(id,"y"), radius = 16}) == true) then
			return(id)
		end
	end
	return(0)
end

function TImage.CollideCircleToPlayer(self)
	if (TDebug.ArgError("TImage:CollideCircleToPlayer", "self", self) == true) then
		return(true)
	end
	local playerlist = player(0,"table")
	for _, id in pairs(playerlist) do
   		if (self:CollideCircle(player(id,"x"), player(id,"y"), 16) == true) then
			return(id)
		end
	end
	return(0)
end

--- /// Image Roundend Update /// ---
local function Hook_TImage_roundend()
	for _, id in pairs(TImage.List) do
		id:RoundReload()
	end
end

--- /// Image Real-Time Update /// ---
local function Hook_TImage_ms100()
	for _, id in pairs(TImage.List) do
		id:UpdateTween()
	end
end

addhook("startround",Hook_TImage_roundend)
addhook("ms100",Hook_TImage_ms100)
