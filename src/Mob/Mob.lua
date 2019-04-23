local Mob
Mob = class()

function Mob:constructor()
    self._shadow = true

    self.name = 'Unknown'
    self.path = nil
    self.legs_path = nil
    self.img = nil
    self.legs_img = nil
    self.hd = false
    self.health = 0
    self.attack_dist = 0
    self.attack_delay = 0
    self.attack_dmg = 0
    self.attack_dir = 'left'
    self.view_dist = 0
    self.movement_speed = 0
    self.movement_delay = 0
    self.hitzone = 0
    self.frame = 1
end

function Mob:init()
    if not self.path then
        print_error('MOB ERROR: image path isn\'t set')
    end

    self.img = TImage.MapImage(self.path)
    if self._shadow then
        self.shadow = self._shadow
    end
end

-------------------------
--      ATTRIBUTES     --
-------------------------

function Mob:getExistsAttribute()
    return self.img and true or false
end

function Mob:getHasLegsAttribute()
    return self.legs_img and true or false
end

function Mob:getShadowAttribute()
    return self._shadow
end

function Mob:setShadowAttribute(value)
    if self.exists then
        imageshadow(self.img.id, value and 1 or 0)
        self._shadow = value
    end
end

function Mob:getXAttribute()
    return math.floor(self.img.x)
end

function Mob:getYAttribute()
    return math.floor(self.img.y)
end

function Mob:getTilexAttribute()
    return pixel_to_tile(self.x)
end

function Mob:getTileyAttribute()
    return pixel_to_tile(self.y)
end

function Mob:getWidthAttribute()
    return self.img.width
end

function Mob:getHeightAttribute()
    return self.img.height
end

-------------------------
--        INIT         --
-------------------------

return Mob
