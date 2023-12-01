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