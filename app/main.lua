-------------------------
--        TEST         --
-------------------------
local function onJoin(id)
    parse('makect', id)
    parse('spawnplayer', id, 400, 400)
end
local function onSpawn(id)
    parse('setpos', id, 400, 400)
end
addhook('join', onJoin)
addhook('spawn', onSpawn)






local img0 = TImage.MapImage('<spritesheet:gfx/player/t3.bmp:32:32:m>', TImage.mode.top, 0, 0, TFlags())
_print( img0:toString() )
img0:animatePos(10000, 9 * 32, 9 * 32)
imageshadow(img0.id, 1)

-- local img
-- local function onJoin2(id)
--     img = TImage.PlayerImage('<spritesheet:gfx/player/t3.bmp:32:32:m>', TImage.mode.top, id, TFlags(TImage.flag.recoil))
--     img:setFrame(1)
--     imageshadow(img.id, 1)
-- end
-- addhook('join', onJoin2)
--
-- local function onSay(id, message)
--     msg('®gfx/cs2d.bmp ' .. message)
-- end
-- addhook('say', onSay)
