local Entity
Entity = class()

function Entity:constructor(x, y)
    self.x = x
    self.y = y
end

function Entity:trigger()
    trigger(self.name)
end

function Entity:getExistsAttribute()
    return entity(self.x, self.y, 'exists')
end

function Entity:getTypenameAttribute()
    return entity(self.x, self.y, 'typename')
end

function Entity:getTypeIdAttribute()
    return entity(self.x, self.y, 'type')
end

function Entity:getTypeAttribute()
    return entity(self.x, self.y, 'type')
end

function Entity:getNameAttribute()
    return entity(self.x, self.y, 'name')
end

function Entity:getTriggerAttribute()
    return entity(self.x, self.y, 'trigger')
end

function Entity:getStateAttribute()
    return entity(self.x, self.y, 'state')
end

function Entity:getInt0Attribute()
    return entity(self.x, self.y, 'int0')
end

function Entity:getStr0Attribute()
    return entity(self.x, self.y, 'str0')
end

function Entity:getAistateAttribute()
    return entity(self.x, self.y, 'aistate')
end

-------------------------
--        INIT         --
-------------------------

return Entity
