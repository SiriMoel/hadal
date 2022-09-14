local w, h = 70, 48
BiomeMapSetSize(w, h + 40)

BiomeMapLoadImage( 0, 0, "mods/hadal/files/m.png" )

--orb room 9
local nine_x = math.random(28, 41)
local nine_y = math.random(15, 55)

if ModSettingGet("hadal_difficulty.orbroomnine_setspawn") then
    local nine_x = 30
    local nine_y = 20
    orbroomnine()
end

function orbroomnine()
    BiomeMapSetPixel( nine_x, nine_y, 0xffffd109 )
end

if ModSettingGet("hadal_difficulty.orbroomnine_setspawn") then return end

if BiomeMapGetPixel(nine_x, nine_y) ~= 0xffce1016 then
    orbroomnine()
else
    while BiomeMapGetPixel(nine_x, nine_y) == 0xffce1016 do
      nine_x = math.random(28, 41)
      nine_y = math.random(15, 55) 
    end
    orbroomnine()
end