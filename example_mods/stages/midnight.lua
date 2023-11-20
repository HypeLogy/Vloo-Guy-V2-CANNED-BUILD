function onCreate()
	makeLuaSprite('neds2','stages/midnight/neds', 0, 40);
	scaleObject('neds2', 0.7, 0.7);
	updateHitbox('neds2');
	setProperty('neds2.antialiasing', false);
      setObjectOrder('neds2', 0)
	addLuaSprite('neds2',false);

	makeLuaSprite('back','stages/midnight/sky', 0, 0);
	scaleObject('back', 0.7, 0.7);
	updateHitbox('back');
	setProperty('back.antialiasing', false);
      setObjectOrder('back', 1)
	addLuaSprite('back',false);

	makeLuaSprite('city','stages/midnight/city', 0, 0);
	scaleObject('city', 0.7, 0.7);
	updateHitbox('city');
	setProperty('city.antialiasing', false);
      setObjectOrder('city', 2)
	addLuaSprite('city',false);

	makeLuaSprite('neds','stages/midnight/neds', 0, 0);
	scaleObject('neds', 0.7, 0.7);
	updateHitbox('neds');
	setProperty('neds.antialiasing', false);
      setObjectOrder('neds', 3)
	addLuaSprite('neds',false);

	makeLuaSprite('nedsfront','stages/midnight/front', 0, 0);
	scaleObject('nedsfront', 0.7, 0.7);
	updateHitbox('nedsfront');
	setProperty('nedsfront.antialiasing', false);
      setObjectOrder('nedsfront', 4)
	addLuaSprite('nedsfront',false);

	makeLuaSprite('car','stages/midnight/car', 0, 40);
	scaleObject('car', 0.7, 0.7);
	updateHitbox('car');
	setProperty('car.antialiasing', false);
      setObjectOrder('car', 8)
	addLuaSprite('car',false);

	makeAnimatedLuaSprite('rain','stages/midnight/rain', 320, 40);
      addAnimationByPrefix('rain', 'bump', 'rain', 24, true)
	scaleObject('rain', 2, 2);
      setProperty('rain.alpha', 0.5)
	updateHitbox('rain');
	setProperty('rain.antialiasing', false);
      setObjectOrder('rain', 9)
	addLuaSprite('rain',false);

      setObjectOrder('gfGroup', 5)
      setObjectOrder('dadGroup', 6)
      setObjectOrder('boyfriendGroup', 7)
end