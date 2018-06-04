local images = {}
for id = 1, 32 do
    images[id] = {}
end

local _image = image
function image(path, x, y, mode, pl)
    local imageId = _image(path, x, y, mode, pl)
    local pl = pl or 0

    if (pl > 0) then
        table.insert(images[pl], imageId)
    elseif (mode >= 101 and mode <= 132) or (mode >= 201 and mode <= 232) or (mode >= 133 and mode <= 164) then
        pl = tonumber(tostring(mode):sub(2, 3)) % 32
        table.insert(images[pl], imageId)
    end

    return imageId
end

local _freeimage = freeimage
function freeimage(imageId)
    _freeimage(imageId)
    removeImage(imageId)
end

local function removeImage(imageId)
    for _, v in pairs(images) do
        return table.removeValue(i, imageId)
    end
    return false
end

local function removeImages(id)
    for _, imageId in pairs(images[id]) do
        _freeimage(imageId)
    end
    images[id] = {}
end

addhook('join', removeImages)
addhook('leave', removeImages)
