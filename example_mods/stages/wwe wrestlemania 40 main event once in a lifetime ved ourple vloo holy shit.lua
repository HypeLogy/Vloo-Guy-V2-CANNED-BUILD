function onCreate()

	makeLuaSprite('backw','stages/db/window', 0, 0);
	updateHitbox('backw');
	setProperty('backw.antialiasing', false);
      setObjectOrder('backw', 0)
      scaleObject('backw', 1.4, 1.4)
	addLuaSprite('backw',false);

	makeLuaSprite('back','stages/db/room', 0, 0);
	updateHitbox('back');
	setProperty('back.antialiasing', false);
      setObjectOrder('back', 1.4)
      scaleObject('back', 1.4, 1.4)
	addLuaSprite('back',false);

	makeLuaSprite('s','stages/db/stands', 0, 0);
	updateHitbox('s');
	setProperty('s.antialiasing', false);
      setObjectOrder('s', 2)
      scaleObject('s', 1.4, 1.4)
	addLuaSprite('s',false);

	makeLuaSprite('r','stages/db/ring', 0, 0);
	updateHitbox('r');
	setProperty('r.antialiasing', false);
      setObjectOrder('r', 3)
      scaleObject('r', 1.4, 1.4)
	addLuaSprite('r',false);
end