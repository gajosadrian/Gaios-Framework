local Object
Object = class()

Object.TEAMS = {
    NONE = 0,
    NEUTRAL = 0,
    TERRORIST = 1,
    ZOMBIE = 1,
    COUNTERTERRORIST = 2,
    SURVIVOR = 2,
    VIP = 3,
}

Object.NPCs = {
    ZOMBIE = 1,
    HEADCRAB = 2,
    SNARK = 3,
    VORTIGAUNT = 4,
    SOLDIER = 5,
}

-------------------------
--       METHODS       --
-------------------------

function Object:init()
    self.type = app('object.objecttype').getInstance(self.type_id)
    -- self.user = app('user.user').new(self.user_id)
end

-------------------------
--   STATIC METHODS    --
-------------------------

function Object.lastId()
    local objects = Object.allRaw()
    return objects[#objects]
end

function Object.allRaw()
    return object(0, 'table')
end

-------------------------
--       GETTERS       --
-------------------------

function Object:getExistsAttribute()
	return object(self.id, 'exists')
end

function Object:getTypenameAttribute()
	return object(self.id, 'typename')
end

function Object:getTypeIdAttribute()
	return object(self.id, 'type')
end

function Object:getHealthAttribute()
	return object(self.id, 'health')
end

function Object:getMaxHealthAttribute()
	return self.type.health
end

function Object:getModeAttribute()
	return object(self.id, 'mode')
end

function Object:getTeamAttribute()
	return object(self.id, 'team')
end

function Object:getPlayerIdAttribute()
	return object(self.id, 'id')
end

function Object:getUserIdAttribute()
    return object(self.id, 'player')
end

function Object:getXAttribute()
	return object(self.id, 'x')
end

function Object:getYAttribute()
	return object(self.id, 'y')
end

function Object:getRotAttribute()
	return object(self.id, 'rot')
end

function Object:getTilexAttribute()
	return object(self.id, 'tilex')
end

function Object:getTileyAttribute()
	return object(self.id, 'tiley')
end

function Object:getCountdownAttribute()
	return object(self.id, 'countdown')
end

function Object:getRootrotAttribute()
	return object(self.id, 'rootrot')
end

function Object:getIdleAttribute()
	return object(self.id, 'idle')
end

function Object:getRotvarAttribute()
	return object(self.id, 'rotvar')
end

function Object:getTargetAttribute()
	return object(self.id, 'target')
end

function Object:getUpgradeAttribute()
	return object(self.id, 'upgrade')
end

function Object:getEntityAttribute()
	return object(self.id, 'entity')
end

function Object:getEntityxAttribute()
	return object(self.id, 'entityx')
end

function Object:getEntityyAttribute()
	return object(self.id, 'entityy')
end

-------------------------
--       SETTERS       --
-------------------------

function Object:setXAttribute(value)
	self:setPos(value, self.y)
end

function Object:setYAttribute(value)
	self:setPos(self.x, value)
end

function Object:setTilexAttribute(value)
	self:setPos(value, self.tiley)
end

function Object:setTileyAttribute(value)
	self:setPos(self.tilex, value)
end

-------------------------
--        INIT         --
-------------------------

return Object
