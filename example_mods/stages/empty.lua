function onCreate()
	makeLuaSprite('back', 'empty/bg', -50, -20);
	setScrollFactor('back', 1, 1);

	makeAnimatedLuaSprite('t', 'empty/empty_bempty', 500, 500);
	addAnimationByPrefix('t', 'dance', 'idle undone', 24, true);
	setLuaSpriteScrollFactor('t', 1, 1);

	makeLuaSprite('godrays', 'empty/godray', 50, -300);
	setScrollFactor('godrays', 1, 1);

	addLuaSprite('back', false);
	addLuaSprite('t', false);
	addLuaSprite('godrays', false);
end