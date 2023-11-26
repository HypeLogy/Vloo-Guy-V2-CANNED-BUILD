local shadersEnabled = true
function onCreate()

	makeLuaSprite('back2', 'egg/back2', 600, -125)
	setScrollFactor('back2', 1, 1)

	makeLuaSprite('back1', 'egg/back1', -280, -140)
	setScrollFactor('back1', 1, 1)
	
      makeLuaSprite('back3', 'egg/back3', -285, -140)
	setScrollFactor('back3', 1, 1)
	setObjectOrder('back3', 20)

	makeLuaSprite('coom', 'egg/coom', -300, -75)
	setScrollFactor('coom', 1.5, 1.5)

	makeLuaSprite('coom2', 'egg/coom', 0, -75)
	setScrollFactor('coom2', 1.2, 1.2)
	setProperty('coom2.flipX', true);
	scaleObject('coom2', 0.6, 0.6)

	makeLuaSprite('overlay2', 'egg/overlay', 600, -150)
	setScrollFactor('overlay2', 1, 1)
	setBlendMode('overlay2','add')
	scaleObject('overlay2', 1.3, 1.3)
	setProperty('overlay2.alpha', 0.4)

	makeLuaSprite('pc', 'egg/pc', -200, 800)
	setScrollFactor('pc', 1, 1)
	scaleObject('pc', 1, 1)

	makeLuaSprite('pclight', 'egg/pclight', -250, 300)
	setScrollFactor('pclight', 1, 1)
	setBlendMode('pclight','add')
	scaleObject('pclight', 1.4, 1.4)
	setProperty('pclight.alpha', 0.3)

	makeLuaSprite('vignette', 'egg/vignette', -300, -100)
	setScrollFactor('vignette', 0, 0)

	makeLuaSprite('vignette2', 'egg/vignette', -300, -100)
	setScrollFactor('vignette2', 0, 0)

	makeAnimatedLuaSprite('clown','egg/newclown', 25, 200)
	addAnimationByPrefix('clown','dance','clown idle',24,true);
	scaleObject('clown', 0.9, 0.9)
	setScrollFactor('clown', 1, 1)
	addLuaSprite('clown', true);
      setProperty('clown.visible', false);

	makeLuaSprite('clownback', 'egg/clownback', -200, -200)
	setScrollFactor('clownback', 1, 1)
	setObjectOrder('clownback', 35)
      setProperty('clownback.visible', false);

	setObjectOrder('boyfriendGroup', 5)

	addLuaSprite('back2', false);
	addLuaSprite('back1', false);
	addLuaSprite('back3', true);
	addLuaSprite('pclight', true);
	addLuaSprite('pc', true);
	addLuaSprite('owl', true);
	addLuaSprite('coom2', true);
	addLuaSprite('coom', true);
	--addLuaSprite('overlay2', true);
	addLuaSprite('vignette', true);
	addLuaSprite('vignette2', true);
	addLuaSprite('clown2', true);
end

function onStepHit()
	if(curStep == 768 and songName == "boiled") then
		setProperty('clown.visible', true);
	end
	if(curStep == 2340 and songName == "boiled") then
		setProperty('clownback.visible', true);
		setProperty('pc.visible', false);
		setProperty('pclight.visible', false);
		setProperty('coom.visible', false);
		setProperty('coom2.visible', false);
	      setObjectOrder('dadGroup', 31)
	end
	if(curStep == 2864 and songName == "boiled") then
		setProperty('clownback.visible', false);
		setProperty('pc.visible', true);
		setProperty('pclight.visible', true);
		setProperty('coom.visible', true);
		setProperty('coom2.visible', true);
	      setObjectOrder('dadGroup', 2)
		setProperty('dadGroup.visible', false);
	end
	if(curStep == 2880 and songName == "boiled") then
		setProperty('dadGroup.visible', true);
	end
	if(curStep == 3664 and songName == "boiled") then
            setProperty('camGame.visible', false);
    end
end