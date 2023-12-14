local eventNum = 0;
local flashnum = 2000;
local zoomout = 7;
local blackalpha = 0;

function onCreate()
	makeLuaSprite('back', 'stages/nightwatch/bg', 0, 0);
	setScrollFactor('back', 1, 1);
    setProperty('back.antialiasing', false);
	setObjectOrder('back', 1)

    makeLuaSprite('lighton', 'stages/nightwatch/lighton', 0, 0);
	setScrollFactor('lighton', 1, 1);
    setProperty('lighton.antialiasing', false);
	setObjectOrder('lighton', 5)

    makeLuaSprite('lightoff', 'stages/nightwatch/lightoff', 0, 0);
	setScrollFactor('lightoff', 1, 1);
    setProperty('lightoff.antialiasing', false);
    setProperty('lightoff.alpha', 0)
	setObjectOrder('lightoff', 6)
	
	makeLuaSprite('front', 'stages/nightwatch/fg', 0, 0);
	setScrollFactor('front', 1, 1);
    setProperty('front.antialiasing', false);
	setObjectOrder('front', 7)
	
	makeLuaSprite('black', 'stages/nightwatch/black', -10, -10);
	scaleObject('black', 1000, 1000);
	setScrollFactor('black', 1, 1);
    setProperty('black.antialiasing', false);
    setProperty('black.alpha', 0)
	setObjectOrder('black', 6)

	addLuaSprite('back', false);
	addLuaSprite('lighton', false);
	addLuaSprite('lightoff', false);
	addLuaSprite('front', false);
	addLuaSprite('black', false);
	
	setObjectOrder('gfGroup', 2)
	setObjectOrder('boyfriendGroup', 3)
	setObjectOrder('dadGroup', 4)
	
	setProperty('camZooming', true)
end

function onStepHit()
	if (math.random(0,50) == 27 and (eventNum <= 5 or eventNum >= 9)) then
		flashnum = curStep + 1
		setProperty('lighton.alpha', 0)
		setProperty('lightoff.alpha', 1)
	end
	if (curStep >= flashnum) then
		setProperty('lighton.alpha', 1)
		setProperty('lightoff.alpha', 0)
	end
	
	if (curStep >= 0 and eventNum == 0) then
		zoomout = zoomout - 0.125
		setProperty('defaultCamZoom', zoomout)
	end
	if (curStep >= 34 and eventNum == 0) then
		setProperty('defaultCamZoom', 2.1)
		setProperty('opponentCameraOffset[0]', -150)
		eventNum = eventNum + 1
	end
	if (curStep >= 158 and eventNum == 1) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	if (curStep >= 272 and eventNum == 2) then
		setProperty('defaultCamZoom', 2.8)
		eventNum = eventNum + 1
	end
	if (curStep >= 288 and eventNum == 3) then
		setProperty('defaultCamZoom', 2.1)
		eventNum = eventNum + 1
	end
	if (curStep >= 416 and eventNum == 4) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	--scary transition
	if (curStep >= 544 and eventNum == 5) then
		setProperty('defaultCamZoom', 2.8)
		zoomout = 2.8
		eventNum = eventNum + 1
	end
	if (curStep >= 564 and eventNum == 6 and curStep % 2 == 0) then
		setProperty('lighton.alpha', 0)
		setProperty('lightoff.alpha', 1)
		flashnum = curStep + 1
	end
	if (curStep >= 572 and eventNum == 6) then
		flashnum = 2000
		setProperty('lighton.alpha', 0)
		setProperty('lightoff.alpha', 1)
		eventNum = eventNum + 1
	end
	if (curStep >= 560 and eventNum >= 5 and eventNum <= 7) then
		zoomout = zoomout + 0.1
		setProperty('defaultCamZoom', zoomout)
		blackalpha = blackalpha + 0.075
	end
	if (curStep >= 592 and eventNum == 7) then
		setProperty('defaultCamZoom', 7)
		zoomout = 7
		blackalpha = 1
		eventNum = eventNum + 1
	end
	if (curStep >= 596 and eventNum >= 8 and eventNum <= 9) then
		zoomout = zoomout - 0.125
		setProperty('defaultCamZoom', zoomout)
		blackalpha = blackalpha - 0.075
	end
	--end of transition
	if (curStep >= 610 and eventNum == 8) then
		setProperty('lighton.alpha', 1)
		setProperty('lightoff.alpha', 0)
		eventNum = eventNum + 1
	end
	if (curStep >= 624 and eventNum == 9) then
		setProperty('defaultCamZoom', 2.3)
		blackalpha = 0
		eventNum = eventNum + 1
	end
end

function onUpdate()
	if ((eventNum >= 1 and eventNum <= 5) or eventNum >= 10) then
		setProperty('boyfriendCameraOffset[1]', -45 + (((getProperty('defaultCamZoom') - 2.1) * 10) * 3.5714285714285))
		setProperty('opponentCameraOffset[1]', 30 + (((getProperty('defaultCamZoom') - 2.1) * 10) * 3.5714285714285))
	end
	
	setProperty('black.alpha', blackalpha)
end