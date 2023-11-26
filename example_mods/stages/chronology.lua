local xx = 250;
local yy = 300;
local ofs = 18;
local followchars = true;

function onCreate()
	makeLuaSprite('back','sky', -1075, -510);
	scaleObject('back', 3, 3);
	updateHitbox('back');
	setProperty('back.antialiasing', false);
	addLuaSprite('back',false);

	makeLuaSprite('f','fredi', -1200, -510);
	scaleObject('f', 1.5, 1.5);
	updateHitbox('f');
	setProperty('f.antialiasing', false);
	addLuaSprite('f',false);

    makeLuaSprite('oldfredi','oldbg', -1000, -510);
	scaleObject('oldfredi', 2, 2);
	updateHitbox('oldfredi');
	setProperty('oldfredi.antialiasing', false);
	addLuaSprite('oldfredi',false);
end

function onStepHit()
	if(curStep == 800 and songName == "chronology") then
		setProperty('oldfredi.visible', false);
    end
	if(curStep == 4424 and songName == "chronology") then
		setProperty('camGame.visible', false);
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