function onStepHit()
	if(curStep == 888 and songName == "rotten") then
		setProperty('gfGroup.visible', false);
		setProperty('camGame.visible', false);
    end
	if(curStep == 896 and songName == "rotten") then
		setProperty('camGame.visible', true);
    end
	if(curStep == 1408 and songName == "rotten") then
		setProperty('gfGroup.visible', true);
    end
	if(curStep == 1464 and songName == "rotten") then
		setProperty('gfGroup.visible', false);
		setProperty('camGame.visible', false);
    end
	if(curStep == 1472 and songName == "rotten") then
		setProperty('camGame.visible', true);
    end
	if(curStep == 1980 and songName == "rotten") then
		setProperty('gfGroup.visible', true);
    end
	if(curStep == 2043 and songName == "rotten") then
		setProperty('gfGroup.visible', false);
		setProperty('camGame.visible', false);
    end
	if(curStep == 2048 and songName == "rotten") then
		setProperty('camGame.visible', true);
    end
end

local xx = 420;
local yy = -100;
local ofs = 18;
local followchars = true;

function onUpdate()
	if followchars == true then
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