function onCreate()
	makeLuaSprite('back', 'stages/man/room', 0, 0);
	setScrollFactor('back', 1, 1);
	setProperty('back.antialiasing', false);
	scaleObject('back', 0.9, 0.9)

	addLuaSprite('back', false);
end