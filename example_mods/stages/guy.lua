function onCreate()
	makeLuaSprite('a','stages/guy/guyback', 0, 0);
	scaleObject('a', 1, 1);
	updateHitbox('a');
	setProperty('a.antialiasing', false);
      setObjectOrder('a', 0)
	addLuaSprite('a',false);

	makeLuaSprite('b','stages/guy/guyfront', 0, 0);
	scaleObject('b', 1, 1);
	updateHitbox('b');
	setProperty('b.antialiasing', false);
      setObjectOrder('b', 1)
	addLuaSprite('b',false);

	makeLuaSprite('c','stages/guy/kosejumpscare', 0, 0);
	scaleObject('c', 1, 1);
	updateHitbox('c');
	setProperty('c.antialiasing', false);
      setProperty('c.alpha', 0)
      setObjectOrder('c', 2)
	addLuaSprite('c',false);
end