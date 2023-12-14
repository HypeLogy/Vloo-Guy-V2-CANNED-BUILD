local eventNum = 0;
local zoom1 = 1.7;
local zoom2 = 1;

function onCreate()
	makeLuaSprite('back','stages/midnight/sky', 0, 0);
	updateHitbox('back');
	setProperty('back.antialiasing', false);
      setObjectOrder('back', 1)
      scaleObject('back', 0.8, 0.8)
	addLuaSprite('back',false);

	makeLuaSprite('city','stages/midnight/hills', 0, 0);
	updateHitbox('city');
	setProperty('city.antialiasing', false);
      setObjectOrder('city', 2)
      scaleObject('city', 0.8, 0.8)
	addLuaSprite('city',false);

	makeLuaSprite('neds','stages/midnight/neds', 0, 0);
	updateHitbox('neds');
	setProperty('neds.antialiasing', false);
      setObjectOrder('neds', 3)
      scaleObject('neds', 0.8, 0.8)
	addLuaSprite('neds',false);

	makeLuaSprite('nedsfront','stages/midnight/nedsfront', 0, 0);
	updateHitbox('nedsfront');
	setProperty('nedsfront.antialiasing', false);
      setObjectOrder('nedsfront', 4)
      scaleObject('nedsfront', 0.8, 0.8)
	addLuaSprite('nedsfront',false);

	makeLuaSprite('car','stages/midnight/clouds', 0, 0);
	updateHitbox('car');
	setProperty('car.antialiasing', false);
      setObjectOrder('car', 3)
      scaleObject('car', 0.8, 0.8)
	addLuaSprite('car',false);

	makeLuaSprite('ar','stages/midnight/bush', 0, 0);
	updateHitbox('ar');
	setProperty('ar.antialiasing', false);
      scaleObject('ar', 0.8, 0.8)
      setObjectOrder('ar', 9)
	addLuaSprite('ar',false);

	makeAnimatedLuaSprite('rain','stages/midnight/rain', 50, 0);
      addAnimationByPrefix('rain', 'bump', 'rain', 24, true)
	scaleObject('rain', 2, 2);
      setProperty('rain.alpha', 0.5)
	updateHitbox('rain');
	setProperty('rain.antialiasing', false);
      setObjectOrder('rain', 10)
	addLuaSprite('rain',false);

      setObjectOrder('gfGroup', 5)
      setObjectOrder('dadGroup', 6)
      setObjectOrder('boyfriendGroup', 7)
end

function onStepHit()
	if(songName == "midnight") then 
		if(curStep >= 16 and eventNum == 0) then
			zoom1 = 1.75
			eventNum = eventNum + 1
		end
		if(curStep >= 32 and eventNum == 1) then
			zoom1 = 1.8
			eventNum = eventNum + 1
		end
		if(curStep >= 40 and eventNum == 2) then
			zoom1 = 1.85
			eventNum = eventNum + 1
		end
		if(curStep >= 48 and eventNum == 3) then
			zoom1 = 1.9
			eventNum = eventNum + 1
		end
		if(curStep >= 56 and eventNum == 4) then
			zoom1 = 1.95
			eventNum = eventNum + 1
		end
		if(curStep >= 64 and eventNum == 5) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 80 and eventNum == 6) then
			zoom1 = 1.75
			eventNum = eventNum + 1
		end
		if(curStep >= 96 and eventNum == 7) then
			zoom1 = 1.8
			eventNum = eventNum + 1
		end
		if(curStep >= 104 and eventNum == 8) then
			zoom1 = 1.85
			eventNum = eventNum + 1
		end
		if(curStep >= 112 and eventNum == 9) then
			zoom1 = 1.9
			eventNum = eventNum + 1
		end
		if(curStep >= 120 and eventNum == 10) then
			zoom1 = 1.95
			eventNum = eventNum + 1
		end
		if(curStep >= 128 and eventNum == 11) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 388 and eventNum == 12) then
			zoom1 = 2
			eventNum = eventNum + 1
		end
		if(curStep >= 448 and eventNum == 13) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 512 and eventNum == 14) then
			zoom1 = 2.1
			eventNum = eventNum + 1
		end
		if(curStep >= 768 and eventNum == 15) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 912 and eventNum == 16) then
			zoom1 = 1.8
			eventNum = eventNum + 1
		end
		if(curStep >= 916 and eventNum == 17) then
			zoom1 = 1.9
			eventNum = eventNum + 1
		end
		if(curStep >= 920 and eventNum == 18) then
			zoom1 = 2
			eventNum = eventNum + 1
		end
		if(curStep >= 924 and eventNum == 19) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 976 and eventNum == 20) then
			zoom1 = 1.8
			eventNum = eventNum + 1
		end
		if(curStep >= 980 and eventNum == 21) then
			zoom1 = 1.9
			eventNum = eventNum + 1
		end
		if(curStep >= 984 and eventNum == 22) then
			zoom1 = 2
			eventNum = eventNum + 1
		end
		if(curStep >= 988 and eventNum == 23) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 1168 and eventNum == 24) then
			zoom1 = 1.75
			eventNum = eventNum + 1
		end
		if(curStep >= 1184 and eventNum == 25) then
			zoom1 = 1.8
			eventNum = eventNum + 1
		end
		if(curStep >= 1192 and eventNum == 26) then
			zoom1 = 1.85
			eventNum = eventNum + 1
		end
		if(curStep >= 1200 and eventNum == 27) then
			zoom1 = 1.9
			eventNum = eventNum + 1
		end
		if(curStep >= 1208 and eventNum == 28) then
			zoom1 = 1.95
			eventNum = eventNum + 1
		end
		if(curStep >= 1216 and eventNum == 29) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 1232 and eventNum == 30) then
			zoom1 = 1.75
			eventNum = eventNum + 1
		end
		if(curStep >= 1248 and eventNum == 31) then
			zoom1 = 1.8
			eventNum = eventNum + 1
		end
		if(curStep >= 1256 and eventNum == 32) then
			zoom1 = 1.85
			eventNum = eventNum + 1
		end
		if(curStep >= 1264 and eventNum == 33) then
			zoom1 = 2.7
			setProperty('boyfriendCameraOffset[0]', -240)
			eventNum = eventNum + 1
		end
		if(curStep >= 1280 and eventNum == 34) then
			zoom1 = 2.4
			setProperty('boyfriendCameraOffset[0]', -45)
			eventNum = eventNum + 1
		end
		if(curStep >= 1408 and eventNum == 35) then
			zoom1 = 2.7
			eventNum = eventNum + 1
		end
		if(curStep >= 1656 and eventNum == 36) then
			zoom1 = 2.6
			eventNum = eventNum + 1
		end
		if(curStep >= 1657 and eventNum == 37) then
			zoom1 = 2.5
			eventNum = eventNum + 1
		end
		if(curStep >= 1658 and eventNum == 38) then
			zoom1 = 2.4
			eventNum = eventNum + 1
		end
		if(curStep >= 1659 and eventNum == 39) then
			zoom1 = 2.3
			eventNum = eventNum + 1
		end
		if(curStep >= 1660 and eventNum == 40) then
			zoom1 = 2.2
			eventNum = eventNum + 1
		end
		if(curStep >= 1661 and eventNum == 41) then
			zoom1 = 2.1
			eventNum = eventNum + 1
		end
		if(curStep >= 1662 and eventNum == 42) then
			zoom1 = 2
			eventNum = eventNum + 1
		end
		if(curStep >= 1663 and eventNum == 43) then
			zoom1 = 1.9
			eventNum = eventNum + 1
		end
		if(curStep >= 1664 and eventNum == 44) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 1680 and eventNum == 45) then
			zoom1 = 1.75
			eventNum = eventNum + 1
		end
		if(curStep >= 1696 and eventNum == 46) then
			zoom1 = 1.8
			eventNum = eventNum + 1
		end
		if(curStep >= 1704 and eventNum == 47) then
			zoom1 = 1.85
			eventNum = eventNum + 1
		end
		if(curStep >= 1712 and eventNum == 48) then
			zoom1 = 1.9
			eventNum = eventNum + 1
		end
		if(curStep >= 1720 and eventNum == 49) then
			zoom1 = 1.95
			eventNum = eventNum + 1
		end
		if(curStep >= 1728 and eventNum == 50) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 1744 and eventNum == 51) then
			zoom1 = 1.75
			eventNum = eventNum + 1
		end
		if(curStep >= 1760 and eventNum == 52) then
			zoom1 = 1.8
			eventNum = eventNum + 1
		end
		if(curStep >= 1768 and eventNum == 53) then
			zoom1 = 1.85
			eventNum = eventNum + 1
		end
		if(curStep >= 1776 and eventNum == 54) then
			zoom1 = 1.9
			eventNum = eventNum + 1
		end
		if(curStep >= 1784 and eventNum == 55) then
			zoom1 = 1.95
			eventNum = eventNum + 1
		end
		if(curStep >= 1792 and eventNum == 56) then
			zoom1 = 1.7
			eventNum = eventNum + 1
		end
		if(curStep >= 1808 and eventNum == 57) then
			setProperty('defaultCamZoom', 2.4)
			eventNum = eventNum + 1
		end
	end
end

function onUpdate(elapsed)
	if mustHitSection then
		zoom2 = 1.0588
	else
		zoom2 = 1
	end
	
	setProperty('defaultCamZoom', zoom1 * zoom2)
	setProperty('boyfriendCameraOffset[1]', -70 + (((zoom1 - 1.7) * 10) * 6.1111111111111))
	setProperty('opponentCameraOffset[1]', -55 + (((zoom1 - 1.7) * 10) * 6.1111111111111))
	
end