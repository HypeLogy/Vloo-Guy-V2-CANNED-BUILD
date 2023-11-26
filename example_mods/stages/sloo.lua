local xx = 800;
local yy = 445;
local ofs = 18;
local followchars = true;

function onStartCountdown()
    setProperty('gf.visible', false)
end


function onStepHit()
    if curStep == 535 then
        makeAnimatedLuaSprite('explode', 'explosion', 490, 180)
        addAnimationByPrefix('explode', 'ah', 'explosion idle', 24, false)
        addLuaSprite('explode', true)
        playAnim('explode', 'ah', false, false, 0)
        scaleLuaSprite('explode', 3.5, 3.5)
        setProperty('gf.visible', true)
    end
    if curStep == 539 then
        removeLuaSprite('explode', true)
    end
end



function onUpdate()
	if followchars == true then
		if mustHitSection == false then
			local dadAnim = getProperty('dad.animation.curAnim.name')

		else
			local bfAnim = getProperty('boyfriend.animation.curAnim.name')

		end
		if gfSection == true then
			local gfAnim = getProperty('gf.animation.curAnim.name')

			if gfAnim == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			elseif gfAnim == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			elseif gfAnim == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			elseif gfAnim == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			elseif gfAnim == 'idle' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end
        else
			triggerEvent('Camera Follow Pos','','')
		end
	end
end