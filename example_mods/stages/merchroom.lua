local eventNum = 0;
local zoom = 2.5;
local zoomevent = 9999;

function onCreate()
	makeLuaSprite('back', 'stages/man/room', 0, 0);
	setScrollFactor('back', 1, 1);
	setProperty('back.antialiasing', false);
	scaleObject('back', 0.9, 0.9)
	setObjectOrder('back', 0)
	
	makeLuaSprite('fadeimg', 'fadeimg')
	setProperty('fadeimg.alpha', 1)
	setObjectOrder('fadeimg', 9)

	addLuaSprite('back', false);
	addLuaSprite('fadeimg', true);
	
	setObjectOrder('gfGroup', 2)
	setObjectOrder('boyfriendGroup', 3)
	setObjectOrder('dadGroup', 4)
	
	setProperty('camZooming', true)
end

function onStepHit()
	if (curStep >= zoomevent) then
		if (curStep >= zoomevent + 31) then
			zoom = 2.85
			zoomevent = 9999
		elseif (curStep >= zoomevent + 24 and zoom <= 2.85) then
			zoomevent = 9999
		elseif (curStep >= zoomevent + 24) then
			setProperty('camZoomingDecay', 1)
			zoom = zoom - 0.075
		elseif (curStep >= zoomevent + 18) then
			zoom = 3.45
		elseif (curStep >= zoomevent + 12) then
			zoom = 3.3
		elseif (curStep >= zoomevent + 6) then
			zoom = 3.15
		elseif (curStep >= zoomevent) then
			zoom = 3
			setProperty('camZoomingDecay', 3)
		end
	end
	
	--zoom
	if (curStep >= 0 and eventNum <= 1 and zoom <= 2.8) then
		zoom = zoom + 0.01
	end
	--zoom
	if (curStep >= 0 and eventNum == 0) then
		doTweenAlpha('intro', 'fadeimg', 0, 4.6, 'linear')
		--setProperty('beatsPerZoom', 999999)
		eventNum = eventNum + 1
	end
	if (curStep >= 16 and eventNum == 1) then
		cameraFlash('camGame', 'FFFFFF', 0.35)
		cancelTween('intro')
		cancelTween('zoomin')
		setProperty('fadeimg.alpha', 0)
		zoom = 2.85
		eventNum = eventNum + 1
	end
	--zoom
	if (curStep >= 256 and curStep < 262 and zoom >= 2.75) then
		zoom = zoom - 0.02
	end
	--zoom
	if (curStep >= 272 and eventNum == 2) then
		cameraFlash('camGame', 'FFFFFF', 0.35)
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 400 and eventNum == 3) then
		zoom = 2.85
		eventNum = eventNum + 1
	end
	if (curStep >= 404 and eventNum == 4) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 512 and eventNum == 5) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 528 and eventNum == 6) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 552 and eventNum == 7) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 560 and eventNum == 8) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 584 and eventNum == 9) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 592 and eventNum == 10) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 616 and eventNum == 11) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 624 and eventNum == 12) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 648 and eventNum == 13) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 656 and eventNum == 14) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	--zoom
	if (curStep >= 896 and curStep < 911 and zoom >= 2.85) then
		zoom = zoom - 0.035
	end
	--zoom
	if (curStep >= 911 and eventNum == 15) then
		zoom = 2.85
		eventNum = eventNum + 1
	end
	if (curStep >= 912 and eventNum == 16) then
		zoomevent = 912
		eventNum = eventNum + 1
	end
	if (curStep >= 944 and eventNum == 17) then
		zoomevent = 944
		eventNum = eventNum + 1
	end
	if (curStep >= 976 and eventNum == 18) then
		zoomevent = 976
		eventNum = eventNum + 1
	end
	if (curStep >= 1008 and eventNum == 19) then
		zoomevent = 1008
		eventNum = eventNum + 1
	end
	if (curStep >= 1040 and eventNum == 20) then
		zoomevent = 1040
		eventNum = eventNum + 1
	end
	if (curStep >= 1072 and eventNum == 21) then
		zoomevent = 1072
		eventNum = eventNum + 1
	end
	if (curStep >= 1104 and eventNum == 22) then
		zoomevent = 1104
		eventNum = eventNum + 1
	end
	if (curStep >= 1136 and eventNum == 23) then
		zoomevent = 1136
		eventNum = eventNum + 1
	end
	if (curStep >= 1168 and eventNum == 24) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1296 and eventNum == 25) then
		zoom = 2.85
		eventNum = eventNum + 1
	end
	if (curStep >= 1300 and eventNum == 26) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1408 and eventNum == 27) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 1424 and eventNum == 28) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1448 and eventNum == 29) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 1456 and eventNum == 30) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1480 and eventNum == 31) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 1488 and eventNum == 32) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1512 and eventNum == 33) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 1520 and eventNum == 34) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1544 and eventNum == 35) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 1552 and eventNum == 36) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1576 and eventNum == 37) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 1584 and eventNum == 38) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1608 and eventNum == 39) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 1616 and eventNum == 40) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 1640 and eventNum == 41) then
		zoom = 2.9
		eventNum = eventNum + 1
	end
	if (curStep >= 1648 and eventNum == 42) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	--zoom
	if (curStep >= 1664 and curStep < 1679 and zoom >= 2.85) then
		zoom = zoom - 0.035
	end
	--zoom
	if (curStep >= 1679 and eventNum == 43) then
		zoom = 2.85
		eventNum = eventNum + 1
	end
	if (curStep >= 1680 and eventNum == 44) then
		zoomevent = 1680
		eventNum = eventNum + 1
	end
	if (curStep >= 1712 and eventNum == 45) then
		zoomevent = 1712
		eventNum = eventNum + 1
	end
	if (curStep >= 1744 and eventNum == 46) then
		zoomevent = 1744
		eventNum = eventNum + 1
	end
	if (curStep >= 1776 and eventNum == 47) then
		zoomevent = 1776
		eventNum = eventNum + 1
	end
	if (curStep >= 1808 and eventNum == 48) then
		zoomevent = 1808
		eventNum = eventNum + 1
	end
	if (curStep >= 1840 and eventNum == 49) then
		zoomevent = 1840
		eventNum = eventNum + 1
	end
	if (curStep >= 1872 and eventNum == 50) then
		zoomevent = 1872
		eventNum = eventNum + 1
	end
	if (curStep >= 1904 and eventNum == 51) then
		zoomevent = 1904
		eventNum = eventNum + 1
	end
	if (curStep >= 1982 and eventNum == 52) then
		zoom = 3.35
		eventNum = eventNum + 1
	end
	if (curStep >= 2000 and eventNum == 53) then
		zoom = 2.85
		eventNum = eventNum + 1
	end
	if (curStep >= 2208 and eventNum == 54) then
		zoom = 3.1
		eventNum = eventNum + 1
	end
	if (curStep >= 2216 and eventNum == 55) then
		zoom = 3.3
		eventNum = eventNum + 1
	end
	if (curStep >= 2219 and eventNum == 56) then
		setProperty('camZoomingDecay', 3)
		zoom = 3.45
		eventNum = eventNum + 1
	end
	if (curStep >= 2221 and eventNum == 57) then
		setProperty('camZoomingDecay', 1)
		zoom = 3.1
		eventNum = eventNum + 1
	end
	
	--if (eventNum >= 3 and (curStep + 4) % 7 == 0) then
		--setProperty('FlxG.camera.zoom', getProperty('FlxG.camera.zoom') + 0.015)
		--setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.03)
	--end
end

function onUpdate()
	setProperty('defaultCamZoom', zoom)
	
	if (eventNum >= 2) then
		setProperty('boyfriendCameraOffset[1]', -25 + (((getProperty('defaultCamZoom') - 2.85) * 10) * 5))
		setProperty('opponentCameraOffset[1]', -30 + (((getProperty('defaultCamZoom') - 2.85) * 10) * 5))
	end
end