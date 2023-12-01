local shadersEnabled = true
function onCreate()
	-- background shit

	setProperty('defaultCamZoom',1)

	makeLuaSprite('back2', 'egg/back2', 450, -50)
	setScrollFactor('back2', 1, 1)

	makeLuaSprite('back1', 'egg/back1', -280, -140)
	setScrollFactor('back1', 1, 1)

	makeLuaSprite('shits', 'egg/shits', -290, -50)
	setScrollFactor('shits', 1, 1)

	makeLuaSprite('shits2', 'egg/shits2', -290, -50)
	setScrollFactor('shits2', 1, 1)

	makeLuaSprite('coom', 'egg/coom', -300, -300)
	setScrollFactor('coom', 1.5, 1.5)

	makeLuaSprite('coom2', 'egg/coom', 0, -200)
	setScrollFactor('coom2', 1.2, 1.2)
	setProperty('coom2.flipX', true);
	scaleObject('coom2', 0.6, 0.6)

	makeLuaSprite('overlay2', 'egg/overlay', -250, 0)
	setScrollFactor('overlay2', 1, 1)
	setBlendMode('overlay2','add')
	scaleObject('overlay2', 1.3, 1.3)
	setProperty('overlay2.alpha', 0.4)

	makeLuaSprite('vignette', 'egg/vignette', -300, 0)
	setScrollFactor('vignette', 0, 0)

	makeLuaSprite('vignette2', 'egg/vignette', -300, 0)
	setScrollFactor('vignette2', 0, 0)

	makeAnimatedLuaSprite('clown','egg/clown', -150, 50)
	addAnimationByPrefix('clown','dance','clown idle',24,false);
	scaleObject('clown', 1, 1)
	setScrollFactor('clown', 1, 1)

	makeAnimatedLuaSprite('owl','egg/owl', 730, 0)
	addAnimationByPrefix('owl','dance','owl idle',24,false);
	scaleObject('owl', 1, 1)
	setScrollFactor('owl', 1, 1)

	setObjectOrder('boyfriendGroup', 5)

	setPropertyFromClass('GameOverSubstate', 'characterName', 'mark-die');

	addLuaSprite('back1', false);
	addLuaSprite('back2', false);
	addLuaSprite('shits', false);
	addLuaSprite('shits2', true);
	addLuaSprite('clown', false);
	addLuaSprite('owl', true);
	addLuaSprite('coom2', true);
	addLuaSprite('coom', true);
	addLuaSprite('overlay2', true);
	addLuaSprite('vignette', true);
	addLuaSprite('vignette2', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end