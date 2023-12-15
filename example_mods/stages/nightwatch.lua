local eventNum = 0;
local flashnum = 2000;
local zoomout = 7;

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
	
	makeLuaSprite('fadeimg', 'fadeimg')
	setProperty('lightoff.alpha', 0)
	setObjectOrder('fadeimg', 8)
    addLuaSprite('fadeimg', true);

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
	if (math.random(0,50) == 27 and (eventNum <= 12 or eventNum >= 16) and (eventNum <= 34 or eventNum >= 34)) then
		flashnum = curStep + 1
		setProperty('lighton.alpha', 0)
		setProperty('lightoff.alpha', 1)
	end
	if (curStep >= flashnum) then
		setProperty('lighton.alpha', 1)
		setProperty('lightoff.alpha', 0)
	end
	
	if (curStep >= 0 and eventNum <= 1 and zoomout >= 2.3) then
		zoomout = zoomout - 0.125
		setProperty('defaultCamZoom', zoomout)
	end
	if (curStep >= 0 and eventNum == 0) then
		doTweenAlpha('intro', 'fadeimg', 0, 5.05, 'linear')
		eventNum = eventNum + 1
	end
	if (curStep >= 34 and eventNum == 1) then
		setProperty('defaultCamZoom', 2.1)
		setProperty('opponentCameraOffset[0]', -150)
		eventNum = eventNum + 1
	end
	if (curStep >= 158 and eventNum == 2) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	if (curStep >= 192 and eventNum == 3) then
		setProperty('defaultCamZoom', 2.5)
		eventNum = eventNum + 1
	end
	if (curStep >= 196 and eventNum == 4) then
		setProperty('defaultCamZoom', 2.6)
		eventNum = eventNum + 1
	end
	if (curStep >= 200 and eventNum == 5) then
		setProperty('defaultCamZoom', 2.7)
		eventNum = eventNum + 1
	end
	if (curStep >= 204 and eventNum == 6) then
		setProperty('defaultCamZoom', 2.8)
		eventNum = eventNum + 1
	end
	if (curStep >= 207 and eventNum == 7) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	if (curStep >= 272 and eventNum == 8) then
		setProperty('defaultCamZoom', 2.8)
		eventNum = eventNum + 1
	end
	if (curStep >= 288 and eventNum == 9) then
		setProperty('defaultCamZoom', 2.1)
		eventNum = eventNum + 1
	end
	if (curStep >= 416 and eventNum == 10) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	--scary transition
	if (curStep >= 544 and eventNum == 11) then
		setProperty('defaultCamZoom', 2.8)
		zoomout = 2.8
		eventNum = eventNum + 1
	end
	if (curStep >= 560 and eventNum == 12) then
		doTweenAlpha('huh', 'fadeimg', 1, 2.5, 'linear')
		eventNum = eventNum + 1
	end
	if (curStep >= 564 and eventNum == 13 and curStep % 2 == 0) then
		setProperty('lighton.alpha', 0)
		setProperty('lightoff.alpha', 1)
		flashnum = curStep + 1
	end
	if (curStep >= 572 and eventNum == 13) then
		flashnum = 2000
		setProperty('lighton.alpha', 0)
		setProperty('lightoff.alpha', 1)
		eventNum = eventNum + 1
	end
	if (curStep >= 560 and eventNum >= 11 and eventNum <= 13 and zoomout <= 7) then
		zoomout = zoomout + 0.1
		setProperty('defaultCamZoom', zoomout)
	end
	if (curStep >= 592 and eventNum == 14) then
		setProperty('defaultCamZoom', 7)
		setProperty('opponentCameraOffset[0]', -93)
		setProperty('opponentCameraOffset[1]', 30)
		zoomout = 7
		eventNum = eventNum + 1
	end
	if (curStep >= 596 and eventNum >= 15 and eventNum <= 17 and zoomout >= 2.4) then
		zoomout = zoomout - 0.125
		setProperty('defaultCamZoom', zoomout)
	end
	if (curStep >= 596 and eventNum == 15) then
		doTweenAlpha('ohgodscary', 'fadeimg', 0, 2.2, 'linear')
		eventNum = eventNum + 1
	end
	--end of transition
	if (curStep >= 610 and eventNum == 16) then
		setProperty('lighton.alpha', 1)
		setProperty('lightoff.alpha', 0)
		eventNum = eventNum + 1
	end
	if (curStep >= 616 and eventNum == 17) then
		setProperty('opponentCameraOffset[0]', -150)
	end
	if (curStep >= 624 and eventNum == 17) then
		setProperty('defaultCamZoom', 2.2)
		eventNum = eventNum + 1
	end
	if (curStep >= 752 and eventNum == 18) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	if (curStep >= 818 and eventNum == 19) then
		setProperty('defaultCamZoom', 2.5)
		eventNum = eventNum + 1
	end
	if (curStep >= 834 and eventNum == 20) then
		setProperty('defaultCamZoom', 2.6)
		eventNum = eventNum + 1
	end
	if (curStep >= 856 and eventNum == 21) then
		setProperty('defaultCamZoom', 2.7)
		eventNum = eventNum + 1
	end
	if (curStep >= 864 and eventNum == 22) then
		setProperty('defaultCamZoom', 2.8)
		eventNum = eventNum + 1
	end
	if (curStep >= 880 and eventNum == 23) then
		setProperty('defaultCamZoom', 2.5)
		eventNum = eventNum + 1
	end
	if (curStep >= 984 and eventNum == 24) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	if (curStep >= 992 and eventNum == 25) then
		setProperty('defaultCamZoom', 2.5)
		eventNum = eventNum + 1
	end
	if (curStep >= 1008 and eventNum == 26) then
		setProperty('defaultCamZoom', 2.1)
		eventNum = eventNum + 1
	end
	if (curStep >= 1136 and eventNum == 27) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	if (curStep >= 1168 and eventNum == 28) then
		setProperty('defaultCamZoom', 2.5)
		eventNum = eventNum + 1
	end
	if (curStep >= 1172 and eventNum == 29) then
		setProperty('defaultCamZoom', 2.6)
		eventNum = eventNum + 1
	end
	if (curStep >= 1176 and eventNum == 30) then
		setProperty('defaultCamZoom', 2.7)
		eventNum = eventNum + 1
	end
	if (curStep >= 1180 and eventNum == 31) then
		setProperty('defaultCamZoom', 2.8)
		eventNum = eventNum + 1
	end
	if (curStep >= 1183 and eventNum == 32) then
		setProperty('defaultCamZoom', 2.4)
		eventNum = eventNum + 1
	end
	--ending
	if (curStep >= 1264 and eventNum == 33) then
		setProperty('defaultCamZoom', 2.8)
		zoomout = 2.8
		eventNum = eventNum + 1
	end
	if (curStep >= 1280 and eventNum == 34) then
		doTweenAlpha('again', 'fadeimg', 1, 2.35, 'linear')
		eventNum = eventNum + 1
	end
	if (curStep >= 1284 and eventNum == 35 and curStep % 2 == 0) then
		setProperty('lighton.alpha', 0)
		setProperty('lightoff.alpha', 1)
		flashnum = curStep + 1
	end
	if (curStep >= 1292 and eventNum == 35) then
		flashnum = 2000
		setProperty('lighton.alpha', 0)
		setProperty('lightoff.alpha', 1)
		eventNum = eventNum + 1
	end
	if (curStep >= 1280 and eventNum >= 33 and eventNum <= 35 and zoomout <= 7) then
		zoomout = zoomout + 0.1
		setProperty('defaultCamZoom', zoomout)
	end
	if (curStep >= 1296 and eventNum == 36) then
		cancelTween('again')
		setProperty('defaultCamZoom', 2.1)
		setProperty('lighton.alpha', 1)
		setProperty('lightoff.alpha', 0)
		doTweenAlpha('watchcomplete', 'fadeimg', 0, 0.0001, 'linear')
		eventNum = eventNum + 1
	end
end

function onUpdate()
	if ((eventNum >= 2 and eventNum <= 12) or (eventNum >= 18 and eventNum <= 34) or eventNum >= 36) then
		setProperty('boyfriendCameraOffset[1]', -45 + (((getProperty('defaultCamZoom') - 2.1) * 10) * 3.5714285714285))
		setProperty('opponentCameraOffset[1]', 30 + (((getProperty('defaultCamZoom') - 2.1) * 10) * 3.5714285714285))
	end
end